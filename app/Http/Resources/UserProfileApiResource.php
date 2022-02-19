<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserProfileApiResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        $isDocUploaded = false;
        $varification_doc_type = '';
        if($this->gst_image || $this->shop_bill_invoice)
        {
            $isDocUploaded = true;
        }
        
        if($this->gst_image)
        {
            $varification_doc_type = 'gst';
        }
        
        if($this->shop_bill_invoice)
        {
            $varification_doc_type = 'shop_bill_invoice';
        }
    
        return [
            "user_id"=> $this->user_id,
            "company_name"=>  $this->company_name,
            "representative_name"=>  $this->representative_name,
            "email"=>  $this->email,
            "mobile"=>  $this->mobile,
            "gst_number"=>  $this->gst_number,
            "pan_number"=>  $this->pan_number,
            'gst_image'=>$this->gst_image,
            'pan_card_image'=>$this->pan_card_image,
            'isDocUploaded'=>$isDocUploaded,
            'varification_doc_type'=>$varification_doc_type
        ];
    }
}
