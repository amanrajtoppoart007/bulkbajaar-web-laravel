<?php

namespace App\Http\Resources\Api;

use Illuminate\Http\Resources\Json\JsonResource;

class AddressResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this?->id,
            'name' => $this?->name,
            'address' => $this?->address,
            'address_line_two' => $this?->address_line_two,
            'state_id' => $this?->state_id,
            'state' => $this?->state->name ?? null,
            'district_id' => $this?->district_id,
            'district' => $this?->district->name ?? null,
            'pincode' => $this?->pincode ?? null,
            'address_type' => $this?->address_type,
            'is_default' => (bool)$this?->is_default,
            'checked' => false,
        ];
    }
}
