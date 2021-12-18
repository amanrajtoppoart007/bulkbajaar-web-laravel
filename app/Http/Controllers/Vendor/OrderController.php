<?php

namespace App\Http\Controllers\Vendor;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $query = Order::query();
            $query->where('vendor_id', auth()->id());
            $query->with('user');
            $table = Datatables::of($query);

            $table->addColumn('placeholder', '&nbsp;');
            $table->addColumn('actions', '&nbsp;');

            $table->editColumn('actions', function ($row) {
                $showURL = route('vendor.orders.show', $row->order_number);
                $viewText = trans('global.view');
                return "<a class='btn btn-xs btn-primary' href='{$showURL}'>$viewText</a>";
            });

            $table->editColumn('id', function ($row) {
                return $row->id ?? "";
            });
            $table->editColumn('order_number', function ($row) {
                return $row->order_number ? $row->order_number : "";
            });
            $table->addColumn('user', function ($row) {
                return $row->user->name ?? '';
            });
            $table->editColumn('payment_status', function ($row) {
                return Order::PAYMENT_STATUS_SElECT[$row->payment_status] ?? '';
            });
            $table->addColumn('sub_total', function ($row) {
                return $row->sub_total + $row->discount_amount;
            });

            $table->addColumn('total_amount', function ($row) {
                return $row->grand_total;
            });
            $table->addColumn('status', function ($row) {
                return Order::STATUS_SELECT[$row->status] ?? '';
            });

            $table->rawColumns(['actions', 'placeholder']);

            return $table->make(true);
        }

        return view('vendor.orders.index');
    }


    public function show($orderNumber)
    {
        $order = Order::whereOrderNumber($orderNumber)->firstOrFail()->load('user', 'orderItems');
        abort_if($order->vendor_id != auth()->id(), 401);
        return view('vendor.orders.show', compact('order'));
    }

    public function cancelOrder(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'orderId' => 'required'
        ]);
        if ($validator->fails()) {
            $result = array(
                'status' => false,
                'msg' => $validator->errors()->all()
            );
            return response($result);
        }

        try {
            $order = Order::find($request->orderId);
            $order->status = 'CANCELLED';
            $order->save();
            $result = ["status" => 1, "response" => "success", "message" => "Order cancelled successful."];
        } catch (Exception $e) {
            $result = ["status" => 0, "response" => "error", "message" => $e->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function confirmOrder(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'orderId' => 'required'
        ]);
        if ($validator->fails()) {
            $result = array(
                'status' => false,
                'msg' => $validator->errors()->all()
            );
            return response($result);
        }

        try {
            $order = Order::find($request->orderId);
            $order->status = 'CONFIRMED';
            $order->save();
            $result = ["status" => 1, "response" => "success", "message" => "Order confirmed successful."];
        } catch (Exception $e) {
            $result = ["status" => 0, "response" => "error", "message" => $e->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function showShipForm($orderNumber)
    {
        $order = Order::whereOrderNumber($orderNumber)->firstOrFail()->load('user', 'orderItems');
        abort_if($order->vendor_id != auth()->id(), 401);
        return view('vendor.orders.shipmentForm', compact('order'));
    }
}
