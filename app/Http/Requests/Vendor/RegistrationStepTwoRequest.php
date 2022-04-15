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
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules(): array
    {
        return [
            'company_name' => 'required|alpha',
            'user_type' => ['required', 'string', Rule::in(['MANUFACTURER', 'WHOLESALER'])],
            'representative_name' => 'required|alpha',
            'billing_address' => 'required|string',
            'billing_address_two' => 'nullable|string',
            'billing_state_id' => 'required|numeric|exists:states,id',
            'billing_district_id' => 'required|numeric|exists:districts,id',
            'billing_pincode' => 'required|numeric|digits:6',
            'pickup_address_same' => 'required|in:0,1',
            'pickup_address' => 'required_if:pickup_address_same,0|string',
            'pickup_address_two' => 'nullable|string',
            'pickup_state_id' => 'required_if:pickup_address_same,0|exists:states,id',
            'pickup_district_id' => 'required_if:pickup_address_same,0|exists:districts,id',
            'pickup_pincode' => 'required_if:pickup_address_same,0|digits:6',
        ];
    }
}
