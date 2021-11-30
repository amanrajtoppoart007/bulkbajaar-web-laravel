<?php

namespace App\Http\Requests;

use App\Models\Vendor;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;
use Illuminate\Validation\Rule;

class StoreVendorRequest extends FormRequest
{
    public function authorize()
    {
        return Gate::allows('franchisee_create');
    }

    public function rules()
    {
        return [
            'mobile' => 'required|numeric|digits:10|unique:users|unique:vendors',
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users', 'unique:vendors'],
            'company_name' => 'required|string',
            'user_type' => ['required', 'string', Rule::in(['MANUFACTURER', 'WHOLESALER'])],
            'representative_name' => 'required|string',
            'billing_address' => 'required|string',
            'billing_address_two' => 'nullable|string',
            'billing_state_id' => 'required|exists:states,id',
            'billing_district_id' => 'required|exists:districts,id',
            'billing_pincode' => 'required',
            'pickup_address' => 'required|string',
            'pickup_address_two' => 'nullable|string',
            'pickup_state_id' => 'required|exists:states,id',
            'pickup_district_id' => 'required|exists:districts,id',
            'pickup_pincode' => 'required',
            'pan_number' => 'required|string',
            'gst_number' => 'required|string',
            'bank_name' => 'required|string',
            'account_number' => 'required|string',
            'account_holder_name' => 'required|string',
            'ifsc_code' => 'required|string',
        ];
    }
}
