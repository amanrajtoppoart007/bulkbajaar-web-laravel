<?php

namespace App\Http\Controllers\Admin\Report;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;

class ProfitController extends Controller
{
    public function index(Request $request)
    {
        $monthlySellAmount=[];
        $monthlyEarning=[];
        $total_sell_amount = Order::where(['payment_status'=>'PAID'])->sum('grand_total');
        $portal_earning    = Order::where(['payment_status'=>'PAID'])->sum('charge_amount');
        $year = $request->input('year',2022);
        for($i=1;$i<=12;$i++)
        {
            $monthlySellAmount[] = Order::where(['payment_status'=>'PAID'])->whereYear('created_at',$year)->whereMonth('created_at',$i)->sum('grand_total');
            $monthlyEarning[] = Order::where(['payment_status'=>'PAID'])->whereYear('created_at',$year)->whereMonth('created_at',$i)->sum('charge_amount');
        }

        return view("admin.report.profit",compact('total_sell_amount','portal_earning','monthlySellAmount','monthlyEarning','year'));
    }
}
