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
//        echo "<pre>";
//        print_r($this->all());die;
        return [
            'name' => 'required|string',
            'price' => 'required|numeric',
            'mop' => 'nullable|numeric',
            'moq' => 'required|numeric',
            'discount' => 'required|numeric|max:100',
            'dispatch_time' => 'nullable|string',
            'rrp' => 'nullable',
            'product_category_id' => 'nullable|exists:product_categories,id',
            'product_sub_category_id' => 'nullable|exists:product_sub_categories,id',
            'description' => 'nullable',
            'option' => 'nullable|array',
            'option.*' => 'nullable|string',
            'unit' => 'nullable|array',
            'unit.*' => 'nullable|string',
            'quantity' => 'nullable|array',
            'quantity.*' => 'nullable|numeric',
        ];
    }
}
