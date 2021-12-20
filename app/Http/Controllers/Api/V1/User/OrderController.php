<?php


namespace App\Http\Controllers\Api\V1\User;

use App\Events\OrderCreated;
use App\Library\Api\V1\User\OrderList;
use App\Models\Cart;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;
use App\Models\Transaction;
use App\Traits\UniqueIdentityGeneratorTrait;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;
use Razorpay\Api\Api;
use Validator;

class OrderController extends \App\Http\Controllers\Api\BaseController
{
    use UniqueIdentityGeneratorTrait;

    public function placeOrder(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'payment_method' => ['required', Rule::in(['ONLINE', 'COD', 'HALF'])],
            'billing_address_id' => ['required', 'exists:user_addresses,id,deleted_at,NULL'],
            'shipping_address_id' => ['required', 'exists:user_addresses,id,deleted_at,NULL'],
        ]);

        if ($validator->fails()) {
            $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => $validator->errors()];
            return response()->json($result, 200);
        }
        try {
            $carts = Cart::where('user_id', auth()->id())->with(['product:id,vendor_id,price,moq,discount'])->get();
            if (!count($carts)) {
                $result = [
                    'status' => 0,
                    'response' => 'error',
                    'action' => 'add',
                    'message' => 'Sorry your cart is empty'
                ];
                return response()->json($result, 200);
            }

            $groupedCarts = collect($carts)->mapToGroups(function ($cart) {
                return [
                    $cart->product->vendor_id => $cart
                ];
            });


            $orderGroupNo = $this->generateOrderGroupNumber(Order::class);
            $orders = [];
            $orderItems = [];
            $ordersTotal = 0;
            foreach ($groupedCarts as $vendorId => $cartGroup) {
                $orderNo = $this->generateOrderNumber(Order::class);
                $orderSubTotal = 0;
                $orderDiscountTotal = 0;
                $orderGrandTotal = 0;
                $orderChargeAmount = 0;
                $index = 1;
                foreach ($cartGroup as $cart) {
                    $product = $cart->product;
                    $price = $product->price;
                    $portalChargePercent = getPortalChargePercentage($product->id);
                    $discountAmount = getPercentAmount($price * $cart->quantity, $product->discount);
                    $chargeAmount = getPercentAmount($price * $cart->quantity, $portalChargePercent);
                    $totalAmount = $price * $cart->quantity;
                    $orderItems[$vendorId][] = [
                        'order_number' => $orderNo.'-'.($index++),
                        'product_id' => $product->id,
                        'product_option_id' => $cart->product_option_id,
                        'amount' => $price,
                        'quantity' => $cart->quantity,
                        'discount' => $product->discount,
                        'discount_amount' => $discountAmount,
                        'charge_percent' => $portalChargePercent,
                        'charge_amount' => $chargeAmount,
                        'total_amount' => $totalAmount,
                    ];
                    $orderSubTotal += ($price * $cart->quantity);
                    $orderDiscountTotal += $discountAmount;
                    $orderChargeAmount += $chargeAmount;
                    $orderGrandTotal += $totalAmount;
                }
                $orders[$vendorId] = [
                    'user_id' => auth()->id(),
                    'billing_address_id' => $request->billing_address_id,
                    'shipping_address_id' => $request->shipping_address_id,
                    'order_number' => $orderNo,
                    'order_group_number' => $orderGroupNo,
                    'vendor_id' => $vendorId,
                    'payment_type' => $request->payment_method,
                    'sub_total' => $orderSubTotal,
                    'discount_amount' => $orderDiscountTotal,
                    'charge_percent' => $portalChargePercent,
                    'charge_amount' => $orderChargeAmount,
                    'grand_total' => $orderGrandTotal,
                ];
                $ordersTotal += $orderGrandTotal;

                $minimumOrderAmount = getMinimumOrderAmount($vendorId);
                if ($orderGrandTotal < $minimumOrderAmount) {
                    $vendorName = Vendor::find($vendorId)->name ?? '';
                    $message = "Total amount of order from seller $vendorName must greater than or equal to $minimumOrderAmount, current amount is $orderGrandTotal .";
                    $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => $message];
                    return response()->json($result, 200);
                }

            }
            DB::beginTransaction();
            foreach ($orders as $key => $order) {
                $orderObj = Order::create($order);
                if (!empty($orderItems[$key])) {
                    foreach ($orderItems[$key] as $orderItem) {
                        $orderItem['order_id'] = $orderObj->id;
                        $product = Product::find($orderItem['product_id']);
                        $product->order_count += 1;
                        $product->save();
                        OrderItem::create($orderItem);
                    }
                }
                $orderObj->load(['user', 'vendor']);

//                event(new OrderCreated($orderObj));
            }

            //Delete cart items
//            Cart::where('user_id', auth()->id())->delete();

            DB::commit();

            $razorOrder = null;
            if ($request->payment_method != 'COD'){
                if ($request->payment_method == 'ONLINE'){
                    $razorPayApi = new Api(env('RAZOR_KEY'), env('RAZOR_SECRET'));
                    $razorOrder = $razorPayApi->order->create(
                        [
                            'receipt' => $orderGroupNo,
                            'amount' => $ordersTotal * 100,
                            'currency' => 'INR'
                        ]
                    );
                }elseif ($request->payment_method == 'HALF'){
                    $razorPayApi = new Api(env('RAZOR_KEY'), env('RAZOR_SECRET'));
                    $razorOrder = $razorPayApi->order->create(
                        [
                            'receipt' => $orderGroupNo,
                            'amount' => ($ordersTotal / 2) * 100,
                            'currency' => 'INR'
                        ]
                    );
                }
            }
            $result = [
                'status' => 1,
                'response' => 'success',
                'action' => $request->payment_method == 'COD' ? 'placed' : 'pay',
                'data' => [
                    'order_number' => $orderGroupNo,
                    'razor_order_id' => $razorOrder['id'] ?? null,
                    'amount' => $razorOrder['amount'] ?? null,
                ],
                'message' => 'Order placed successfully'
            ];

        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function makePayment(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_number' => 'required|exists:orders,order_group_number',
            'razorpay_order_id' => 'required',
            'razorpay_payment_id' => 'required',
            'razorpay_signature' => 'required',
        ]);

        if ($validator->fails()) {
            $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => $validator->errors()];
            return response()->json($result, 200);
        }

        $orderGroupNo = $request->order_number;
        $razorpayOrderId = $request->razorpay_order_id;
        $razorpayId = $request->razorpay_payment_id;

        $generatedSignature = hash_hmac('SHA256', $razorpayOrderId . "|" . $razorpayId, env('RAZOR_SECRET'));

        if ($generatedSignature != $request->razorpay_signature) {
            $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'Payment Verification failed.'];
            return response()->json($result, 200);
        }

        try {
            $razorPayApi = new Api(env('RAZOR_KEY'), env('RAZOR_SECRET'));
            $razorPayment = $razorPayApi->payment->fetch($request->razorpay_payment_id);

            Transaction::create([
                'payment_id' => $razorPayment->id,
                'gateway' => 'razorpay',
                'amount' => $razorPayment->amount,
                'status' => $razorPayment->status,
                'currency' => $razorPayment->currency,
                'method' => $razorPayment->method,
                'meta_data' => serialize($razorPayment),
                'order_group' => $orderGroupNo,
                'user_id' => auth()->id(),
            ]);

            if ($razorPayment->status != 'failed') {
                DB::transaction(function () use ($orderGroupNo, $razorPayment){
                    $orders = Order::where($orderGroupNo)->with('orderItems')->get();
                    foreach ($orders as $order){
                        $type = $order->payment_type;
                        if($type == 'HALF'){
                            $order->amount_paid += ($order->grand_total / 2);
                        }else{
                            $order->amount_paid += $order->grand_total;
                        }
                        $order->payment_status = $order->grand_total > $order->amount_paid ? 'PARTLY_PAID' : 'PAID';
                        $order->save();
                    }
                });

                $result = [
                    'status' => 1,
                    'response' => 'success',
                    'action' => 'paid',
                    'message' => 'Your payment was successful..'
                ];
            }else
                $result = [
                    'status' => 1,
                    'response' => 'error',
                    'action' => 'retry',
                    'message' => 'Your payment was failed, please try again.'
                ];

        }catch (\Exception $exception){
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function getOrders()
    {
        try {

            $query = Order::query();
            $query->where('user_id', auth()->id());
            $query->with('vendor')->withCount('orderItems');
            $query->orderByDesc('created_at');

            $orders = $query->paginate(10);
            if (count($orders)) {
                $orderList = $orders->toArray();
                $data['current_page'] = $orderList['current_page'];
                $data['next_page_url'] = $orderList['next_page_url'];
                $data['last_page_url'] = $orderList['last_page_url'];
                $data['per_page'] = $orderList['per_page'];
                $data['total'] = $orderList['total'];
                $class = new OrderList($orderList['data']);
                $data['list'] = $class->execute();
                $result = ['status' => 1, 'response' => 'success', 'action' => 'fetched', 'data' => $data, 'message' => 'Order data fetched successfully'];
            } else {
                $result = [
                    'status' => 0,
                    'response' => 'error',
                    'action' => 'add',
                    'message' => 'You have no order at the moment'
                ];
            }

        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function getOrderDetails(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_number' => 'required|exists:orders',
        ]);

        if ($validator->fails()) {
            $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => $validator->errors()];
            return response()->json($result, 200);
        }

        if (!Order::whereOrderNumber($request->input('order_number'))->whereUserId(auth()->user()->id)->exists()) {
            $result = [
                'status' => 0,
                'response' => 'error',
                'action' => 'rejected',
                'message' => "This order does not belong to you."
            ];
            return response()->json($result, 200);
        }

        try {
            $order = Order::whereOrderNumber($request->input('order_number'))->first();

            $orderItems = OrderItem::where('order_id', $order->id)->with('product')->get();

            $order->load(['vendor','orderItems.product','orderItems.productOption', 'billingAddress.state:id,name', 'billingAddress.district:id,name', 'shippingAddress.state:id,name', 'shippingAddress.district:id,name']);

            $billingAddressObj = $order->billingAddress;
            $shippingAddressObj = $order->shippingAddress;

            $billingAddress = '';
            if (!is_null($billingAddressObj)){
                $billingAddress = $billingAddressObj->address;
                $billingAddress .= $billingAddressObj->address_line_two ? ", ".$billingAddressObj->address_line_two : "";
                $billingAddress .= $billingAddressObj->district ? ", ".$billingAddressObj->district->name : "";
                $billingAddress .= $billingAddressObj->state ? ", ".$billingAddressObj->state->name : "";
                $billingAddress .= $billingAddressObj->pincode ? " - ".$billingAddressObj->pincode : "";
            }

            $shippingAddress = "";
            if (!is_null($shippingAddressObj)){
                $shippingAddress = $shippingAddressObj->address ?? '';
                $shippingAddress .= $shippingAddressObj->address_line_two ? ", ".$shippingAddressObj->address_line_two : "";
                $shippingAddress .= $shippingAddressObj->district ? ", ".$shippingAddressObj->district->name : "";
                $shippingAddress .= $shippingAddressObj->state ? ", ".$shippingAddressObj->state->name : "";
                $shippingAddress .= $shippingAddressObj->pincode ? " - ".$shippingAddressObj->pincode : "";
            }

            $data = [
                'id' => $order->id,
                'order_number' => $order->order_number,
                'order_group_number' => $order->order_group_number,
                'payment_type' => $order->payment_type,
                'sub_total' => $order->sub_total + $order->discount_amount,
                'discount_amount' => $order->discount_amount,
                'grand_total' => $order->grand_total,
                'status' => $order->status,
                'payment_status' => $order->payment_status,
                'order_date' => Carbon::parse($order->created_at)->format('d-m-Y'),
                'shipping_address' => $shippingAddress,
                'billing_address' => $billingAddress,
                'vendor' => $order->vendor->name ?? '',
            ];

            foreach ($orderItems as $orderItem) {

                $thumbLink = null;
                foreach ($orderItem->product->images as $key => $media) {
                    if ($key == 0) {
                        $thumbLink = $media->getUrl('thumb');
                    }
                    break;
                }
                $data['list'][] = [
                    'id' => $orderItem->id,
                    'product_id' => $orderItem->product_id,
                    'product' => $orderItem->product->name,
                    'product_option_id' => $orderItem->product_option_id,
                    'option' => $orderItem->productOption->option ?? null,
                    'amount' => applyPrice($orderItem->amount, $orderItem->discount),
                    'quantity' => $orderItem->quantity,
                    'discount_amount' => $orderItem->discount_amount,
                    'total_amount' => $orderItem->total_amount,
                    'thumb_link' => $thumbLink
                ];
            }
            if (!empty($data)) {
                $result = [
                    'status' => 1,
                    'response' => 'success',
                    'action' => 'fetched',
                    'data' => $data,
                    'message' => 'Order details fetched successfully'
                ];
            } else {
                $result = [
                    'status' => 0,
                    'response' => 'error',
                    'action' => 'add',
                    'message' => 'Order details not available'
                ];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function cancelOrder(Request $request)
    {
        $validator = Validator::make($request->json()->all(), [
            'order_number' => 'required|exists:orders',
        ]);

        if ($validator->fails()) {
            $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => $validator->errors()];
            return response()->json($result, 200);
        }

        $order = Order::whereOrderNumber($request->input('order_number'))->first();

        if ($order->user_id != auth()->id()) {
            $result = [
                'status' => 0,
                'response' => 'error',
                'action' => 'rejected',
                'message' => "This order does not belong to you."
            ];
            return response()->json($result, 200);
        }

        if (!in_array('PENDING', Order::CANCELLATION_ALLOWED)){
            $result = [
                'status' => 0,
                'response' => 'error',
                'action' => 'rejected',
                'message' => "You are not allowed to cancel this order."
            ];
            return response()->json($result, 200);
        }else{
            $currentTime = Carbon::now();
            $orderTime = Carbon::parse($order->created_at);
            if ($currentTime->diffInHours($orderTime) > 24){
                $result = [
                    'status' => 0,
                    'response' => 'error',
                    'action' => 'rejected',
                    'message' => "You are not allowed to cancel this order."
                ];
                return response()->json($result, 200);
            }
        }

        try {

            $order->status = "CANCELLED";
            if ($order->save()) {
                $result = [
                    'status' => 1,
                    'response' => 'success',
                    'action' => 'cancelled',
                    'message' => 'Order cancelled successfully'
                ];
            } else {
                $result = [
                    'status' => 0,
                    'response' => 'error',
                    'action' => 'retry',
                    'message' => 'Something went wrong'
                ];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }
}
