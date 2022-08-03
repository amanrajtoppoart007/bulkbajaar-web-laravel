<?php

namespace App\Http\Requests\Vendor;

use Illuminate\Foundation\Http\FormRequest;

class RegistrationStepOneRequest extends FormRequest
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
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'mobile' => 'required|numeric|digits:10|unique:users|unique:vendors',
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users', 'unique:vendors'],
            'password' => ['required', 'string', 'confirmed'],
        ];
    }
}
