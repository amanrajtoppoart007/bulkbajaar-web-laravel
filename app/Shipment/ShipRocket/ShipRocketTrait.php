<?php

namespace App\Shipment\ShipRocket;

use App\Models\ShipRocketSetting;
use Illuminate\Support\Facades\Http;

trait ShipRocketTrait {

    private $baseUrl = "https://apiv2.shiprocket.in/v1/external/";
    public function login()
    {
        $credentials = $this->getLoginCredentials();
        if (empty($credentials)) return false;
        $response = Http::post($this->baseUrl . 'auth/login', $credentials)->json();
        if (empty($response['token'])) return false;
        return $this->updateAuthToken($response['token']);
    }

    private function getLoginCredentials(): array
    {
        $credentials = ShipRocketSetting::select(['email', 'password'])->first();
        if (is_null($credentials)) return [];
        return $credentials->toArray();
    }

    private function getAuthToken(): string
    {
        $token = ShipRocketSetting::select('token')->first()->token ?? '';
        if (empty($token)){
            $token = $this->login();
        }
        return $token;
    }

    private function updateAuthToken($token): string
    {
        ShipRocketSetting::find(1)->update(['token' => $token]);
        return $token;
    }

    private function addNewPickupLocation(
        $pickupLocation,
        $name,
        $email,
        $phone,
        $address,
        $city,
        $state,
        $pincode,
        $address2 = '',
        $country = 'India'
    ) {
        $data = [
            'pickup_location' => $pickupLocation,
            'name' => $name,
            'email' => $email,
            'phone' => $phone,
            'address' => $address,
            'address2' => $address2,
            'city' => $city,
            'state' => $state,
            'country' => $country,
            'pincode' => $pincode,
        ];
        $token = $this->getAuthToken();
        if (empty($token)) return [];
        $response = Http::withToken($token)->post($this->baseUrl . 'settings/company/addpickup', $data)->json();
        return $response['success'];
    }

    private function getTrackingUsingAWB($awb){
        $token = $this->getAuthToken();
        if (empty($token)) return [];
        $response = Http::withToken($token)->get($this->baseUrl . 'courier/track/awb/' . $awb)
            ->json();
    }

    private function createOrder($data){
        $token = $this->getAuthToken();
        if (empty($token)) return [];
        $response = Http::withToken($token)->post($this->baseUrl . 'orders/create/adhoc', $data)
            ->json();
        if ($response['status_code'] == 1){
            return [
                'order_id' => $response['order_id'],
                'shipment_id' => $response['shipment_id'],
            ];
        }
        return false;
    }
}
