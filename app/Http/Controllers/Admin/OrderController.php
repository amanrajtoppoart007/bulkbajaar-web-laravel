<?php

namespace App\Http\Controllers\Admin;

use App\Events\OrderAssigned;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\CsvImportTrait;
use App\Http\Requests\MassDestroyOrderRequest;
use App\Http\Requests\StoreOrderRequest;
use App\Http\Requests\UpdateOrderRequest;
use App\Models\OrderItem;
use App\Models\OrderReturnRequest;
use App\Models\Transaction;
use App\Models\Vendor;
use App\Models\FranchiseeArea;
use App\Models\Invoice;
use App\Models\MasterStock;
use App\Models\Order;
use App\Models\User;
use App\Models\UserAddress;
use App\Traits\UniqueIdentityGeneratorTrait;
use Carbon\Carbon;
use Gate;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Symfony\Component\HttpFoundation\Response;
use Yajra\DataTables\Facades\DataTables;

class OrderController extends Controller
{
    use CsvImportTrait, UniqueIdentityGeneratorTrait;

    public function index(Request $request)
    {
        abort_if(Gate::denies('order_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        if ($request->ajax()) {
            $query = Order::with(['user'])->select(sprintf('%s.*', (new Order)->table));
            $table = Datatables::of($query);

            $table->addColumn('placeholder', '&nbsp;');
            $table->addColumn('actions', '&nbsp;');

            $table->editColumn('actions', function ($row) {
                $viewGate      = 'order_show';
                $editGate      = 'order_edit';
                $deleteGate    = 'order_delete';
                $crudRoutePart = 'orders';

                return view('partials.datatablesActions', compact(
                    'viewGate',
//                    'editGate',
                    'deleteGate',
                    'crudRoutePart',
                    'row'
                ));
            });

            $table->editColumn('id', function ($row) {
                return $row->id ? $row->id : "";
            });
            $table->editColumn('order_number', function ($row) {
                return $row->order_number ? $row->order_number : "";
            });
            $table->addColumn('user_name', function ($row) {
                return $row->user ? $row->user->name : '';
            });

            $table->addColumn('vendor_name', function ($row) {
                return $row->vendor ? $row->vendor->name : '';
            });

            $table->addColumn('grand_total', function ($row) {
                return $row->grand_total ?? '';
            });

            $table->addColumn('amount_paid', function ($row) {
                return $row->amount_paid ?? '';
            });

            $table->editColumn('payment_status', function ($row) {
                return Order::PAYMENT_STATUS_SElECT[$row->payment_status] ?? '';
            });

            $table->editColumn('status', function ($row) {
                return Order::STATUS_SELECT[$row->status] ?? '';
            });


            $table->editColumn('payment_type', function ($row) {
                return $row->payment_type ? Order::PAYMENT_TYPE_SELECT[$row->payment_type] : '';
            });
            $table->addColumn('address_address', function ($row) {
                return $row->address ? $row->address->address : '';
            });

            $table->rawColumns(['actions', 'placeholder', 'user', 'address', 'help_center_name']);

            return $table->make(true);
        }

        $users          = User::get(['id', 'name']);
        $sellers        = Vendor::get(['id', 'name']);

        return view('admin.orders.index', compact('users','sellers'));
    }

    public function create()
    {
        abort(404);
        abort_if(Gate::denies('order_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $users = User::all()->pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');

        $addresses = UserAddress::all()->pluck('address', 'id')->prepend(trans('global.pleaseSelect'), '');

        return view('admin.orders.create', compact('users', 'addresses'));
    }

    public function store(StoreOrderRequest $request)
    {
        $order = Order::create($request->all());

        return redirect()->route('admin.orders.index');
    }

    public function edit(Order $order)
    {
        abort(404);
        abort_if(Gate::denies('order_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $users = User::all()->pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');

        $addresses = UserAddress::all()->pluck('address', 'id')->prepend(trans('global.pleaseSelect'), '');

        $order->load('user', 'address');

        return view('admin.orders.edit', compact('users', 'addresses', 'order'));
    }

    public function update(UpdateOrderRequest $request, Order $order)
    {
        $order->update($request->all());

        return redirect()->route('admin.orders.index');
    }

    public function show(Order $order)
    {
        abort_if(Gate::denies('order_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $order->load('user', 'billingAddress', 'shippingAddress', 'transactions', 'orderItems', 'vendor', 'orderReturnRequests');
        return view('admin.orders.show', compact('order'));
    }

    public function destroy(Order $order)
    {
        abort_if(Gate::denies('order_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $order->delete();

        return back();
    }

    public function massDestroy(MassDestroyOrderRequest $request)
    {
        Order::whereIn('id', request('ids'))->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }

    public function cancelOrder(Request $request)
    {
        $order = Order::find($request->orderId);
        $order->status = "CANCELLED";
        if($order->save()){
            return response()->json([
                'status' => true,
                'message' => 'Order cancelled successfully.'
            ]);
        }
        return response()->json([
            'status' => false,
            'message' => 'Something went wrong.'
        ]);
    }

    public function verifyPayment(Request $request)
    {
        $order = Order::find($request->orderId);
        $order->payment_verified_by_id = auth()->id();
        $order->payment_status = "VERIFIED";

        if ($order->save()) {
            return response()->json([
                'status' => true,
                'message' => 'Payment verified successfully.'
            ]);
        }
        return response()->json([
            'status' => false,
            'message' => 'Something went wrong.'
        ]);
    }

    public function updateStatus(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required|exists:orders',
            'status' => 'required'
        ]);

        if ($validator->fails()) {
            $result = array(
                'status' => false,
                'message' => $validator->errors()->all()
            );
            return response($result);
        }

        $order = Order::find($request->id);
        $oldStatus = $order->status;
        $order->status = $request->status;
        if($order->save()){
            return response([
                'status' => true,
                'message' => 'Status changed from ' . ucfirst(strtolower($oldStatus)) . ' to ' . ucfirst(strtolower($request->status))
            ]);
        }

        return response([
            'status' => false,
            'message' => 'Something went wrong'
        ]);
    }

    public function generateInvoice(Request $request)
    {
        $order = Order::find($request->orderId);

        DB::beginTransaction();
        try {
            $invoice = new Invoice();
            $invoice->invoice_number = $this->generateInvoiceNumber();
            $invoice->date_time = Carbon::now()->format('Y-m-d h:i:s');
            $invoice->order_id = $order->id;
            $invoice->user_id = $order->user_id;
            $invoice->vendor_id = $order->vendor_id;
            $invoice->payment_type = $order->payment_type;
            $invoice->amount = $order->sub_total;
            $invoice->charge = $order->charge_amount;
            $invoice->discount = $order->discount_amount;
            $invoice->gst = $order->gst_amount;
            $invoice->total = $order->grand_total;
            $invoice->save();

            $order->is_invoice_generated = true;
            if($order->save()){
                DB::commit();
                return response()->json([
                    'status' => true,
                    'message' => 'Invoice generated successfully.'
                ]);
            };
            DB::rollBack();
            return response()->json([
                'status' => false,
                'message' => 'Something went wrong.'
            ]);


        } catch (\Exception $exception) {
            DB::rollBack();
            return response()->json([
                'status' => false,
                'message' => $exception->getMessage()
            ]);
        }
    }

    public function updateStock(Request $request)
    {
        DB::beginTransaction();
        try {
            $order = Order::find($request->orderId);
            $order->is_stock_updated = true;
            $order->save();
            foreach ($order->orderItems as $orderItem){

                $isExists = MasterStock::where('product_id', $orderItem->product_id)
                    ->where('product_price_id', $orderItem->product_price_id)
                    ->where('stock', '>=', $orderItem->quantity)
                    ->exists();
                if($isExists){
                    MasterStock::where('product_id', $orderItem->product_id)
                        ->where('product_price_id', $orderItem->product_price_id)
                        ->decrement('stock', $orderItem->quantity);
                }else{
                    DB::rollBack();
                    return response([
                        'status' => false,
                        'message' => 'Some product not in stock'
                    ]);
                }
            }

            DB::commit();
            $data = array(
                "status" => true,
                "message" => 'Stock updated successfully'
            );
            return json_encode($data);
        } catch (\Exception $e) {
            DB::rollBack();
            $data = array(
                "status" => false,
                "message" => 'Something went wrong!!'
            );
            return json_encode($data);
        }
    }

    public function refund(Request $request)
    {
        $request->validate([
            'id' => 'required|exists:orders',
            'amount' => 'required|numeric',
            'requested_items' => 'required|array',
            'requested_items.*.id' => 'required|exists:order_return_requests,id',
            'requested_items.*.amount' => 'required|numeric',
        ]);

        DB::beginTransaction();
        try {
            $order = Order::find($request->id);
            $order->status = 'RETURN_REFUNDED';


            $refundAmount = 0;

            foreach ($request->requested_items as $requested_item){
                $refundAmount += $requested_item['amount'] ?? 0;
                $orderReturnRequest = OrderReturnRequest::find($requested_item['id']);
                $orderReturnRequest->status = 'REFUNDED';
                $orderReturnRequest->save();

                $orderItem = OrderItem::find($orderReturnRequest->order_item_id);
                $orderItem->status = 'RETURN_REFUNDED';
                $orderItem->save();
            }
            $order->amount_refunded = $refundAmount;
            $order->save();

            Transaction::create([
                'entity' => 'refund',
                'amount' => $refundAmount * 100,
                'gateway' => null,
                'status' => 'refunded',
                'currency' => 'INR',
                'order_group' => $order->order_group_number,
                'user_id' => $order->user_id,
            ]);

            DB::commit();
            $data = array(
                "status" => true,
                "message" => 'Refunded successfully'
            );
            return json_encode($data);
        } catch (\Exception $e) {
            DB::rollBack();
            $data = array(
                "status" => false,
                "message" => 'Something went wrong!!'
            );
            return json_encode($data);
        }
    }
}
