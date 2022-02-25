<?php

namespace App\Http\Requests\Vendor;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class RegistrationStepTwoRequest extends FormRequest
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
            'company_name' => 'required|string',
            'user_type' => ['required', 'string', Rule::in(['MANUFACTURER', 'WHOLESALER'])],
            'representative_name' => 'required|string',
            'billing_address' => 'required|string',
            'billing_address_two' => 'nullable|string',
            'billing_state_id' => 'required|exists:states,id',
            'billing_district_id' => 'required|exists:districts,id',
            'billing_pincode' => 'required',
            'pickup_address_same' => 'required|in:0,1',
            'pickup_address' => 'required_if:pickup_address_same,0|string',
            'pickup_address_two' => 'nullable|string',
            'pickup_state_id' => 'required_if:pickup_address_same,0|exists:states,id',
            'pickup_district_id' => 'required_if:pickup_address_same,0|exists:districts,id',
            'pickup_pincode' => 'required_if:pickup_address_same,0',
        ];
    }
}
