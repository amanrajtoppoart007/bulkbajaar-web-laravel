<?php

namespace App\Http\Requests;

use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;
class UpdateBrandRequest extends FormRequest
{
    public function authorize()
    {
        return Gate::allows('brand_edit');
    }

    public function rules()
    {
        return [
            'title'  => [
                'string',
                'required',
            ],
            'status' => [
                'nullable',
            ],
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
