<?php

namespace App\Http\Resources\Api;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Traits\ProductTrait;

class CartResource extends JsonResource
{
    use ProductTrait;

    /**
     * @param \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request): array
    {
        return [
            'id' => $this?->id,
            'product_option_id' => $this->product_option_id,
            'product_id' => $this?->product_id,
            'quantity' => $this?->quantity,
            $this->mergeWhen($this->product, [
                'product' => $this->product->name,
                'vendor_id' => $this->product?->vendor_id,
                'vendor_name' => $this->product?->vendor?->name ?? null,
                'liked' => $this->checkIfProductLiked($this->product_id),
                'mrp' =>(float)$this->product->maximum_retail_price,
                'price' =>(float)$this->product->price,
                'discount' => (float)$this->product->discount ?? 0,
                'gst' => (float)$this->product->gst ?? 0,
                'gst_type' => $this->product->gst_type ?? 0,
                'amount'=> (float)$this->product->price * (float)$this?->quantity,
                'total' => (float)$this?->quantity * (float)$this->product->price + (((float)$this->product->gst * (float)$this?->quantity * $this->product->price) / 100),
                'thumb_link' => isset($this->product->images[0]) ? $this->product->images[0]->thumbnail : null
            ]),

            $this->mergeWhen($this->productOption, [
                'product_option' => [
                    'option' => $this?->productOption->option ?? null,
                    'unit' => $this?->productOption->unit ?? null,
                    'size' => $this?->productOption->size ?? null,
                    'color' => $this?->productOption->color ?? null,
                    'quantity' => $this?->productOption->quantity ?? null,
                    'liked' => $this->checkIfProductOptionLiked($this?->productOption->id ?? null),
                ],
            ]),
        ];
    }
}
