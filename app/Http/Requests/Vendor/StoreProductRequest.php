<?php

namespace App\Http\Requests\Vendor;

use Illuminate\Foundation\Http\FormRequest;

class StoreProductRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => 'required|string',
            'price' => 'required|numeric',
            'mop' => 'nullable|numeric',
            'moq' => 'required|numeric',
            'discount' => 'required|numeric|max:100',
            'gst' => 'required|numeric|max:100',
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
