<?php

namespace App\Http\Requests;

use App\Models\Product;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class UpdateProductRequest extends FormRequest
{
    public function authorize()
    {
        return Gate::allows('product_edit');
    }

    public function rules()
    {
        return [
            'id' => 'required|exists:products',
            'name' => 'required|string',
            'price' => 'required|numeric',
            'mop' => 'nullable|numeric',
            'moq' => 'required|numeric',
            'discount' => 'nullable|numeric|max:100',
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
