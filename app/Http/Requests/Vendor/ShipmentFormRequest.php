<?php

namespace App\Http\Requests\Vendor;

use Illuminate\Foundation\Http\FormRequest;

class ShipmentFormRequest extends FormRequest
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
            'from_name' => 'required|string',
            'from_email' => 'nullable|email',
            'from_phone_number' => 'required|string',
            'from_address' => 'required|string',
            'from_pincode' => 'required|string',
            'pickup_gstin' => 'nullable|string',

            'to_name' => 'required|string',
            'to_email' => 'nullable|email',
            'to_phone_number' => 'required|string',
            'to_address' => 'required|string',
            'to_pincode' => 'required|string',

            'quantity' => 'required|numeric',
            'invoice_value' => 'required|numeric',
            'cod_amount' => 'required|numeric',
            'item_breadth' => 'required|numeric',
            'item_height' => 'required|numeric',
            'item_length' => 'required|numeric',
            'item_weight' => 'required|numeric',

            'invoice_number' => 'nullable|string',
            'total_discount' => 'nullable|numeric',
            'ewaybill_no' => 'required_if:invoice_value,>=50000',
            'item_name' => 'required|string',

            'item_list' => 'required|array',
            'item_list.*.item_name' => 'required|string',
            'item_list.*.sku' => 'required|string',
            'item_list.*.price' => 'required|numeric',
            'item_list.*.quantity' => 'required|numeric',
            'item_list.*.item_tax_percentage' => 'required|numeric',
        ];
    }
}
