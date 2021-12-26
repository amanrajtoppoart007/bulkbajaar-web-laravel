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
            return [
                'order_id' => $response['order_id'],
                'tracking_id' => $response['tracking_id'],
            ];
        }
        return false;
    }

}
