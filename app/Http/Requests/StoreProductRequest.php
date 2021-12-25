<?php

namespace App\Http\Requests;

use App\Models\Product;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class StoreProductRequest extends FormRequest
{
    public function authorize()
    {
        return Gate::allows('product_create');
    }

    public function rules()
    {
        return [
            'vendor_id' => 'required|exists:vendors,id',
            'name' => 'required|string',
            'price' => 'required|numeric',
            'mop' => 'nullable|numeric',
            'moq' => 'required|numeric',
            'discount' => 'nullable|numeric|max:100',
            'gst' => 'nullable|numeric|max:100',
            'dispatch_time' => 'nullable|string',
            'rrp' => 'nullable',
            'product_category_id' => 'nullable|exists:product_categories,id',
            'product_sub_category_id' => 'nullable|exists:product_sub_categories,id',
            'description' => 'nullable',
            'sku' => 'required|string',
            'hsn' => 'nullable|string',
            'is_returnable' => 'nullable|boolean',
            'return_conditions' => 'required_if:is_returnable,1|array',
            'return_conditions.*' => 'numeric',
            'product_options' => 'required|array',
            'product_options.*.option' => 'required|string',
            'product_options.*.color' => 'required|string',
            'product_options.*.size' => 'nullable|string',
            'product_options.*.unit' => 'nullable|string',
            'product_options.*.quantity' => 'nullable|numeric'
        ];

    }
}
