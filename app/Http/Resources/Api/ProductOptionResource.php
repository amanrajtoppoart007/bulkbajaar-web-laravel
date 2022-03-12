<?php

namespace App\Http\Resources\Api;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Traits\ProductTrait;
class ProductOptionResource extends JsonResource
{
    use ProductTrait;

    /**
     * @param \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request):array
    {
        return [
            'id' => $this?->id,
            'product_id' => $this?->product_id,
            'option' => $this?->option,
            'unit' => $this?->unit,
            'quantity' => $this?->quantity,
            'size' => $this?->size,
            'color' => $this?->color,
            'liked' => $this->checkIfProductOptionLiked($this?->id),
        ];
    }
}
