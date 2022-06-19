<?php
namespace App\Shipment;
use App\Models\Vendor;
use App\Shipment\ShipRocket\ShipRocketTrait;

trait ShippingTrait {
    use ShipRocketTrait;

    public function getPickupPinCode($vendorId)
    {
        $pickupPinCode = false;
        $vendor = Vendor::find($vendorId);
        if($vendor->profile)
        {
            $pickupPinCode = $vendor?->profile?->pickup_pincode;
        }
        return $pickupPinCode;
    }

    public function shippingCharge($vendorId,$drop_pin_code, $weight, $cod = false)
    {
         $pickupPinCode = $this->getPickupPinCode($vendorId);
         return $this->calculateShippingCharge($pickupPinCode,$drop_pin_code, $weight, $cod);
    }


}
