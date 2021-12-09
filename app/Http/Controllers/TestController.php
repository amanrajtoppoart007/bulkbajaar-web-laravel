<?php

namespace App\Http\Controllers;

use App\Shipment\ShipRocket\ShipRocketTrait;
use Illuminate\Http\Request;
use App\Library\TextLocal\TextLocal;
class TestController extends Controller
{
    use ShipRocketTrait;
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {
        $sms = new TextLocal();
        $sms->send("this is test",8839421623,"DGNRAY");
    }

    public function test()
    {
        echo "<pre>";
        print_r($this->login());die;
    }
}
