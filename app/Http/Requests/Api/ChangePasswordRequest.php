<?php

namespace App\Http\Requests\Api;

use App\Rules\CheckIfSameAsOldPassword;
use App\Rules\MatchCurrentPassword;
use Illuminate\Foundation\Http\FormRequest;

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
}
