<?php

namespace App\Http\Requests\Api;

use App\Rules\CheckIfSameAsOldPassword;
use App\Rules\MatchCurrentPassword;
use Illuminate\Foundation\Http\FormRequest;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class ChangePasswordRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return auth()->user()->id;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'current_password'=>['required',  new MatchCurrentPassword],
            'password'=>['required',new CheckIfSameAsOldPassword],
            'password_confirmation'=>['required_with:password|same:password']
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
