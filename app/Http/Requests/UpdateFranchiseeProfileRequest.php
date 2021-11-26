<?php

namespace App\Http\Requests;

use App\Models\VendorProfile;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class UpdateFranchiseeProfileRequest extends FormRequest
{
    public function authorize()
    {
        return Gate::allows('franchisee_profile_edit');
    }

    public function rules()
    {
        return [
            'franchisee_id'                 => [
                'required',
                'integer',
            ],
            'organization_name'             => [
                'string',
                'nullable',
            ],
            'gst_number'                    => [
                'string',
                'nullable',
            ],
            'representative_name'           => [
                'string',
                'required',
            ],
            'representative_designation'    => [
                'string',
                'nullable',
            ],
            'email'                         => [
                'string',
                'required',
                'unique:franchisees,email,' .request()->route('franchisee_profile')->franchisee_id
            ],
            'primary_contact'               => [
                'required',
                'numeric',
                'digits:10',
//                'regex:/^([6-9]{1}[0-9]{9})$/',
                'unique:franchisees,mobile,' .request()->route('franchisee_profile')->franchisee_id
            ],
            'secondary_contact'             => [
                'required',
                'numeric',
                'digits:10',
//                'regex:/^([6-9]{1}[0-9]{9})$/',
            ],
            'work_area'                     => [
                'string',
                'nullable',
            ],
            'organization_street'           => [
                'string',
                'nullable',
            ],
            'organization_address_line_two' => [
                'string',
                'nullable',
            ],
            'organization_pincode_id'          => [
                'nullable',
            ],
            'representative_street'         => [
                'string',
                'required',
            ],
            'representative_pincode_id'        => [
                'required',
            ],
            'payment_method'                => [
                'nullable',
            ],
        ];
    }
}
