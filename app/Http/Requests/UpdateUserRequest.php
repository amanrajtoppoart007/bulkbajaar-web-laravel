<?php

namespace App\Http\Requests;

use App\Models\User;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class UpdateUserRequest extends FormRequest
{
    public function authorize()
    {
       // return Gate::allows('user_edit');
        return true;
    }

    public function rules()
    {
        return [
            'mobile' => 'required|numeric|digits:10|unique:vendors|unique:users,mobile,'. request()->route('user')->id,
            'email' => ['required', 'string', 'email', 'max:255', 'unique:vendors', 'unique:users,email,'. request()->route('user')->id],
            'company_name' => 'required|string',
            'representative_name' => 'required|string',
            'billing_address' => 'required|string',
            'billing_address_two' => 'nullable|string',
            'billing_state_id' => 'required|exists:states,id',
            'billing_district_id' => 'required|exists:districts,id',
            'billing_pincode' => 'required',
            'shipping_address' => 'required|string',
            'shipping_address_two' => 'nullable|string',
            'shipping_state_id' => 'required|exists:states,id',
            'shipping_district_id' => 'required|exists:districts,id',
            'shipping_pincode' => 'required',
            'pan_number' => 'required|string',
            'gst_number' => 'nullable|string',
        ];
    }
}
