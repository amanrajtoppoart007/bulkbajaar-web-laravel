<?php

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Shipment\ShippingTrait;

class TestController extends Controller
{
    use ShippingTrait;
    public function getShippingCharge()
    {
        return response()->json($this->shippingCharge(1,497001,1,true));
    }
}
