<?php

namespace App\Traits;
use App\Models\Invoice;
use App\Models\User;

trait UniqueIdentityGeneratorTrait{

    public function generateRegistrationNumber(): string
    {
        $lastRegNo = User::whereNotNull('registration_number')->latest()->first()->registration_number ?? 0;
        if($lastRegNo == 0){
            $last = 0;
        }else{
            $last = substr($lastRegNo, 6);
        }
        return 'BULKBAJAAR'.str_pad($last + 1, 7, '0', STR_PAD_LEFT);
    }

    public function generateOrderNumber($model, $orderNo = "")
    {
        if(empty($orderNo)){
            $orderNo = 'BB-' . mt_rand(0000000000000001, 9999999999999999);
        }

        if($model::where('order_number', $orderNo)->exists()){
            return $this->generateOrderNumber($model, $orderNo);
        }
        return $orderNo;
    }

    public function generateInvoiceNumber($invoiceNo = "")
    {
        if(empty($invoiceNo)){
            $invoiceNo = 'BB-IN' . rand(000001, 999999);
        }

        if(Invoice::where('invoice_number', $invoiceNo)->exists()){
            return $this->generateInvoiceNumber($invoiceNo);
        }
        return $invoiceNo;
    }

    public function generateOrderGroupNumber($model, $orderNo = "")
    {
        if(empty($orderNo)){
            $orderNo = mt_rand(0000000000000001, 9999999999999999);
        }

        if($model::where('order_group_number', $orderNo)->exists()){
            return $this->generateOrderNumber($model, $orderNo);
        }
        return $orderNo;
    }
}
