<?php

namespace App\Http\Requests\Vendor;

use Illuminate\Foundation\Http\FormRequest;

class RegistrationStepThreeRequest extends FormRequest
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
     * @return array
     */
   public function rules(): array
    {
        return [
            'pan_number' => 'required|alpha_num',
            'pan_card' => 'required|mimes:jpg,png',
            'gst_number' => 'required|alpha_num',
            'gst' => 'required|mimes:jpg,png',
            'bank_name' => 'nullable|regex:/^[\pL\s\-]+$/u',
            'account_number' => 'nullable|numeric',
            'account_holder_name' => 'nullable|regex:/^[\pL\s\-]+$/u',
            'ifsc_code' => 'nullable|alpha_num',
        ];
    }
}
