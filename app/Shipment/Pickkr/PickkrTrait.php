<?php

namespace App\Shipment\Pickkr;

use Illuminate\Support\Facades\Http;

trait PickkrTrait {

    private $baseUrl = "https://www.pickrr.com/";
    private $createOrderUrl = 'api/place-order/';
    private $createPickupAddressUrl = 'api/save-address-book/';
    private $updatePickupAddressUrl = 'api-v2/client/warehouse/update/';
    private $fetchPickupAddressesUrl = 'api/fetch-address-book/pick/';

    public function createOrder($data)
    {
        $data['auth_token'] = $this->getAuthToken();
        $response = Http::post($this->baseUrl . $this->createOrderUrl, $data)
            ->json();
        if ($response['success'] == true){
            return $response;
        }
        return false;
    }

    public function addPickupAddress($data)
    {
        $data['auth_token'] = $this->getAuthToken();
        $response = Http::post($this->baseUrl . $this->createPickupAddressUrl, $data)
            ->json();
        if ($response['err'] == null){
            return true;
        }
        return false;
    }

    private function getAuthToken(){
        return "cfe91e20eeaf8fdc59f2d2e1e0474235231407";
    }

}
