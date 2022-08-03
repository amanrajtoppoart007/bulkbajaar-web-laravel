<?php

namespace App\Http\Requests;

use App\Models\Vendor;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;
use Illuminate\Validation\Rule;

class UpdateVendorRequest extends FormRequest
{
    public function authorize()
    {
        return Gate::allows('franchisee_edit');
    }

    public function rules()
    {
        return [
            'mobile' => 'required|numeric|digits:10|unique:users|unique:vendors,mobile,'. request()->route('vendor')->id,
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users', 'unique:vendors,email,'. request()->route('vendor')->id],
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
        return [
            'name'                      => [
                'string',
                'nullable',
            ],
            'email'                     => [
                'required',
                'unique:franchisees,email,' . request()->route('franchisee')->id
            ],
            'mobile'                    => [
//                'regex:/^([6-9]{1}[0-9]{9})$/',
                'numeric',
                'digits:10',
                'required',
                'unique:franchisees,mobile,' . request()->route('franchisee')->id
            ],
            'email_verified_at'         => [
                'date_format:' . config('panel.date_format') . ' ' . config('panel.time_format'),
                'nullable',
            ],
            'mobile_verified_at'        => [
                'date_format:' . config('panel.date_format') . ' ' . config('panel.time_format'),
                'nullable',
            ],
            'verification_token'        => [
                'string',
                'nullable',
            ],
            'mobile_verification_token' => [
                'string',
                'nullable',
            ],
        ];
    }
}
