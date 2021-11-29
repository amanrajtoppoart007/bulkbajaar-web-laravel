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
            'discount' => 'nullable|numeric|max:100',
            'dispatch_time' => 'nullable|string',
            'rrp' => 'nullable',
            'category_id' => 'nullable|exists:product_categories,id',
            'sub_category_id' => 'nullable|exists:product_sub_categories,id',
            'description' => 'nullable',
            'option.*' => 'nullable|array',
            'unit.*' => 'nullable|array',
            'quantity.*' => 'nullable|array',
        ];
    }
}
