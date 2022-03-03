<?php

namespace App\Http\Resources\Api;

use Illuminate\Http\Resources\Json\ResourceCollection;

class SellerCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
         return [
            "id" => $this?->id,
            "name" => $this?->name,
            "shop_image" => $this?->shop_image?->original_url,
            "company_name" => $this?->profile?->company_name,
            "representative_name" => $this?->profile->representative_name ?? '',
            "gst_number" => $this?->id,
            'pan_number' => $this->profile->pan_number ?? '',
            'pickup_address' => $this->profile->pickup_address ?? '',
            'pickup_address_two' => $this->profile->pickup_address_two ?? '',
            'pickup_state' => $this->profile->pickupState->name ?? '',
            'pickup_district' => $this->profile->pickupDistrict->name ?? '',
            'pickup_pincode' => $this->profile->pickup->pincode ?? '',
            'mop' => getMinimumOrderAmount($this->id),
            "product_count" => $this->products_count,
            "dispatch_delay_time" => $this->dispatch_delay_time,
            "minimum_order_value" => $this->minimum_order_value
        ];
    }
}
