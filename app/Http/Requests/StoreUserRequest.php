<?php

namespace App\Http\Requests;

use App\Models\User;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class StoreUserRequest extends FormRequest
{
    public function authorize()
    {
        return true;
        //return Gate::allows('user_create');
    }

    public function rules()
    {
        return [
            'mobile' => 'required|numeric|digits:10|unique:users|unique:vendors',
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users', 'unique:vendors'],
            'company_name' => 'required|string',
            'representative_name' => 'required|string',
            'billing_address' => 'required|string',
            'billing_address_two' => 'nullable|string',
            'billing_state_id' => 'required|exists:states,id',
            'billing_district_id' => 'required|exists:districts,id',
            'billing_pincode' => 'required',
            'shipping_address_same' => 'required|in:0,1',
            'shipping_address' => 'required_if:shipping_address_same,0|string',
            'shipping_address_two' => 'nullable|string',
            'shipping_state_id' => 'required_if:shipping_address_same,0|exists:states,id',
            'shipping_district_id' => 'required_if:shipping_address_same,0|exists:districts,id',
            'shipping_pincode' => 'required_if:shipping_address_same,0',
            'pan_number' => 'required|string',
            'gst_number' => 'nullable|string',
        ];
    }
}
