<?php

namespace App\Http\Controllers\Api\V1\User;

use App\Http\Controllers\Controller;
use App\Http\Resources\Api\AddressResource;
use App\Http\Resources\Api\UserResource;
use App\Models\Cart;
use App\Models\User;
use App\Models\UserAddress;
use App\Shipment\ShippingTrait;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CheckOutController extends Controller
{
    use ShippingTrait;
    public function index(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'cart_ids' => 'nullable|array',
                'cart_ids.*' => "numeric"
            ]);
            if (!$validator->fails()) {
                $total = 0;
                $gst_total = 0;
                $shipping_charge = 0;
                $defaultShippingAddress=null;
                $defaultBillingAddress=null;
                $drop_pincode = false;

                $user = new UserResource(User::find(auth()->id()));
                $addresses = AddressResource::collection(UserAddress::where('user_id', auth()->id())->get());

                foreach($addresses as $address)
                {
                    if($address->address_type=="SHIPPING" && $address->is_default)
                    {
                         $defaultShippingAddress = $address;
                         $drop_pincode = $address->pincode;
                    }
                    if($address->address_type=="BILLING" && $address->is_default)
                    {
                         $defaultBillingAddress = $address;
                    }
                }

                if (!$defaultShippingAddress) {
                    foreach ($addresses as $address) {
                        if ($address->address_type == "SHIPPING") {
                            $defaultShippingAddress = $address;
                             $drop_pincode = $address->pincode;
                        }
                    }
                }

                if (!$defaultBillingAddress) {
                    foreach ($addresses as $address) {
                        if ($address->address_type == "BILLING") {
                            $defaultBillingAddress = $address;
                        }
                    }
                }

                if ($request->input('cart_ids')) {
                    $carts = Cart::whereUserId(auth()->id())
                        ->whereIn('id', $request->input('cart_ids'))
                        ->with(['product', 'productOption'])->get();
                } else {
                    $carts = Cart::whereUserId(auth()->id())->with(['product', 'productOption'])->get();
                }
                foreach($carts as $cart)
                {
                    $product = $cart->product;
                    $cart_price = (float) $product->price* (float) $cart->quantity;
                    $total += $cart_price;
                    $gst_total += (float)(($cart_price *  $product?->gst ?? 0 )/100);
                    if($drop_pincode)
                    {
                        $courier = $this->shippingCharge($cart->vendor_id,$drop_pincode,$cart->weight,false);
                        if(!empty($courier) && is_array($courier))
                        {
                            $shipping_charge += (float)$courier['freight_charge'];
                        }
                    }
                }
                $grand_total = $total + $gst_total + $shipping_charge;

                $data = [
                    'user'=>$user,
                    'addresses'=>$addresses,
                    'defaultShippingAddress'=>$defaultShippingAddress,
                    'defaultBillingAddress'=>$defaultBillingAddress,
                    'checkout'=>[
                        'total'=>$total,
                        'gst_total'=>$gst_total,
                        'shipping_charge'=>$shipping_charge,
                        'grand_total'=>$grand_total,
                        'cart_count'=>$carts->count(),
                    ]
                ];
                  $result = ['status' => 1, 'response' => 'success','data'=>$data, 'message' => 'Data fetch successfully'];

            } else {
                $result = ['status' => 0, 'response' => 'validation_error', 'message' => $validator->errors()];
            }
        } catch (Exception $exception) {
            $result = ['status' => 0, 'response' => 'exception_error', 'message' => $exception->getMessage()];
        }


        return response()->json($result);


    }
}
