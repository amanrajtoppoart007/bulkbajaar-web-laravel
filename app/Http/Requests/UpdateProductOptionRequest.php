<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;
use JetBrains\PhpStorm\ArrayShape;

class UpdateProductOptionRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * @return string[]
     */
    #[ArrayShape(['product_id' => "string", 'color' => "string", 'size' => "string", 'unit' => "string", 'quantity' => "string", 'weight' => "string", 'images.*' => "string"])] public function rules(): array
    {
        return [
            'product_id'=>'numeric|string',
            'color' => 'required|string',
            'size' => 'required|string',
            'unit' => 'required|string',
            'quantity' => 'nullable|numeric',
             'weight' => 'nullable|numeric',
            'images.*'=>'nullable|string'
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
        throw new HttpResponseException(response()->json($result));
    }
}
