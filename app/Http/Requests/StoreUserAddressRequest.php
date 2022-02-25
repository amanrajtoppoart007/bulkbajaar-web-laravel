<?php

namespace App\Http\Requests;

use App\Models\UserAddress;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class StoreUserAddressRequest extends FormRequest
{
    public function authorize()
    {
        return Gate::allows('user_address_create');
    }

    public function rules()
    {
        return [
            'user_id'          => [
                'required',
                'integer',
            ],
            'pincode'       => [
                'required',
                'integer',
            ],
            'district_id'      => [
                'required',
                'integer',
            ],
            'state_id'         => [
                'required',
                'integer',
            ],
            'address'           => [
                'string',
                'required',
            ],
            'address_line_two' => [
                'string',
                'nullable',
            ],
            'address_type' => [
                'string',
                'required',
            ],
        ];
    }
}
