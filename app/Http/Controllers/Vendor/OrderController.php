<?php

namespace App\Http\Controllers\Vendor;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\Product;
use App\Models\ProductPrice;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\DB;
use Razorpay\Api\Api;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $query = Order::query();
            $table = Datatables::of($query);

            $table->addColumn('placeholder', '&nbsp;');
            $table->addColumn('actions', '&nbsp;');

            $table->editColumn('actions', function ($row) {
                $showURL = route('franchisee.orders.show', $row->order_number);
                $viewText = trans('global.view');
                return "<a class='btn btn-xs btn-primary' href='{$showURL}'>$viewText</a>";
            });

            $table->editColumn('id', function ($row) {
                return $row->id ?? "";
            });
            $table->editColumn('order_number', function ($row) {
                return $row->order_number ? $row->order_number : "";
            });
            $table->editColumn('payment_type', function ($row) {
                return $row->payment_type ? Order::PAYMENT_TYPE_SELECT[$row->payment_type] : '';
            });
            $table->addColumn('amount', function ($row) {
                return $row->amount ?? '';
            });
            $table->addColumn('gst', function ($row) {
                return $row->gst ?? '';
            });
            $table->addColumn('discount', function ($row) {
                return $row->discount ?? '';
            });
            $table->addColumn('total_amount', function ($row) {
                return $row->total_amount ?? '';
            });
            $table->addColumn('status', function ($row) {
                return $row->status ?? '';
            });

            $table->rawColumns(['actions', 'placeholder']);

            return $table->make(true);
        }

        return view('vendor.orders.index');
    }


    public function show($orderNumber)
    {
        $franchiseeOrder = FranchiseeOrder::whereOrderNumber($orderNumber)->first();
        if (!$franchiseeOrder) abort(404);
        return view('franchisee.orders.show', compact('franchiseeOrder'));
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
            $order = FranchiseeOrder::find($request->orderId);
            $order->status = 'CANCELLED';
            $order->save();
            $result = ["status" => 1, "response" => "success", "message" => "Order cancelled successful."];
        } catch (Exception $e) {
            $result = ["status" => 0, "response" => "error", "message" => $e->getMessage()];
        }
        return response()->json($result, 200);
    }
}
