<?php

namespace App\Shipment\Pickkr;

use Illuminate\Support\Facades\Http;

trait PickkrTrait {

    private $baseUrl = "https://www.pickrr.com/";

    public function createOrder($data)
    {
        $response = Http::post($this->baseUrl . 'api/place-order/', $data)
            ->json();
        if ($response['success'] == true){
            return $response;
        }
        return false;
    }

}
