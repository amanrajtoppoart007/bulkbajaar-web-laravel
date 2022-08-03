<?php

namespace App\Http\Resources\Api;

use App\Models\Product;
use Illuminate\Http\Resources\Json\JsonResource;

class VendorResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
         $brands = [];
        $products = Product::with(['productOptions'])->where(['vendor_id' => $this?->id, 'approval_status' => 'APPROVED'])->get();
        foreach ($products as $key=>$product) {
            $brands[$key]['id'] = $product?->brand?->id;
            $brands[$key]['title'] = $product?->brand?->title;
        }
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
            "product_count" => count($products),
            "dispatch_delay_time" => $this->dispatch_delay_time,
            "minimum_order_value" => $this->minimum_order_value,
            "brands"=>$brands,
        ];
    }
}
