<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Gate;


use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;
class StoreProductRequest extends FormRequest
{
    public function authorize(): bool
    {
        return Gate::allows('product_create');
    }

    public function rules():array
    {
        return [
            'vendor_id' => 'required|exists:vendors,id',
            'name' => 'required|string',
            'price' => 'required|numeric',
            'maximum_retail_price'=> 'required|numeric',
            'mop' => 'nullable|numeric',
            'moq' => 'required|numeric',
            'discount' => 'nullable|numeric|max:100',
            'gst' => 'nullable|numeric|max:100',
            'dispatch_time' => 'nullable|string',
            'rrp' => 'nullable',
            'product_category_id' => 'nullable|exists:product_categories,id',
            'product_sub_category_id' => 'nullable|exists:product_sub_categories,id',
            'brand_id' => 'nullable|exists:brands,id',
            'description' => 'nullable',
            'sku' => 'required|string',
            'hsn' => 'nullable|string',
            'is_returnable' => 'nullable|boolean',
            'return_conditions' => 'required_if:is_returnable,1|array',
            'return_conditions.*' => 'numeric',
        ];

    }

     protected function failedValidation(Validator $validator)
    {
        $msg='';
        foreach($validator->errors()->all() as $error)
        {
            $msg .= $error."\n";
        }
        $result = ["status"=>0,"response"=>"validation_error","message"=>$msg];

        throw new HttpResponseException(response()->json($result, 200));
    }
}
