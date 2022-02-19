<?php

namespace App\PaymentGateway\Razorpay;

use Razorpay\Api\Api;

trait RazorpayTrait {

    private function getApiInstance() : Api{
       // return new Api(env('RAZOR_KEY'), env('RAZOR_SECRET'));
       return new Api('rzp_test_dEFEKCc7EjchRB', '30TngJly2aUDFln09AFssmF8');
    }

    private function createOrder($receiptNo, $amount, $currency = 'INR')
    {
        $razorpayApi = $this->getApiInstance();
        try {
            $order =  $razorpayApi->order->create(
                [
                    'receipt' => $receiptNo,
                    'amount' => $amount * 100,
                    'currency' => $currency,
                ]
            );
            return [
                'status' => true,
                'data' => $order,
                'message' => 'Order created.'
            ];
        }catch (\Exception $exception){
            return [
                'status' => false,
                'message' => $exception->getMessage()
            ];
        }
    }

    private function getPaymentsByOrderId($orderId){}
    private function getPaymentByPaymentId($paymentId){}

    private function createRefund($paymentId, $amount){
        $razorpayApi = $this->getApiInstance();
        try {
            $refund = $razorpayApi->fetch($paymentId)->refund([
                'amount' => $amount * 100
            ]);
            return [
                'status' => true,
                'data' => $refund,
                'message' => 'Refund initiated.'
            ];
        }catch (\Exception $exception){
            return [
                'status' => false,
                'message' => $exception->getMessage()
            ];
        }
    }
}
