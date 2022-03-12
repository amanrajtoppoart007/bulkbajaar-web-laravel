<?php

namespace App\Http\Resources\Api;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Traits\ProductTrait;
use App\Traits\ReviewTrait;
class ProductResource extends JsonResource
{

    use ProductTrait,ReviewTrait;

    /**
     * @param Request $request
     * @return array
     */
    public function toArray($request): array
    {
        return [
            'id'=> $this->id,
                'name'=> $this->name,
                'maximum_retail_price,'=>$this?->maximum_retail_price,
                'price'=>$this->price,
                'threshold_price'=> getMinimumOrderAmount($this?->vendor_id),
                'threshold_quantity'=> $this->moq,
                'gst'=> $this->gst,
                'gst_type'=> $this->gst_type,
                'sku'=> $this->sku,
                'hsn'=> $this->hsn,
                'is_returnable'=> (bool)$this->is_returnable,
                'vendor_id'=> $this->vendor_id,
                'discount'=> $this->discount,
                'discounted_price'=> $this->price,
                'quantity'=> $this->quantity,
                'description'=> $this->description,
                'category'=> $this->product_category?->name?? null,
                'sub_category'=> $this->product_sub_category?->name?? null,
                'brand'=> $this->brand?->title?? null,
                'vendor'=> $this->vendor?->name?? null,
                'liked'=> $this->checkIfProductLiked($this->id),
                'image_list'=> $this->image_list,
                'product_attributes'=> $this->product_attributes?? [],
                'rating'=> $this->getProductReviewCounts($this->id)['average']?? 0,
                'product_options'=>ProductOptionResource::collection($this?->productOptions),
                'thumb_link'=>$this?->images? ($this?->images)[0]['preview'] : null,
        ];
    }
}
