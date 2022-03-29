<?php
namespace App\Traits;

use App\Library\MessageNineOne\MessageNineOne;

trait SmsSenderTrait {
    public function sendRegisteredVendorSms($data)
    {
        $message = "Welcome to BulkBajaar. Your username is ". $data['username'];
        $message .= " and your password is " . $data['password'];
        $message .= " Do not share your credentials with anyone";
        $sms = new MessageNineOne();
        $sms->send($data['mobile'],$message);
    }

    public function sendRegisteredUserSms($data)
    {
        $message = "Welcome to BulkBajaar. Your username is ". $data['username'];
        $message .= " and your password is " . $data['password'];
        $message .= " Do not share your credentials with anyone";
        $sms = new MessageNineOne();
        $sms->send($data['mobile'],$message);
    }



    public function sendUserOrderPlacedSms($data)
    {
        $message = "Dear, " . $data['name'] . ' Your order has been place.';
        $message .= "Order # " . $data['order_number'] . ' on ' . $data['date'];
        $message .= "\r\n Regards, KV PRO";
        $sms = new MessageNineOne();
        $sms->send($data['mobile'],$message);
    }

    public function sendOtpSms($data)
    {
        $service_type = $data['service_type'];
        $otp = $data['otp'];
       // $message = "Your OTP for $service_type is $otp ,do not share it with anyone.";
        $message ="OTP for login into bulkbajaar app is $otp - blkbjr";
        $sms = new MessageNineOne();
        return $sms->send($data['mobile'],$message);
    }

    public function userApprovalSms($name,$mobile)
    {
        $message ="Hi $name, your account at BulkBajaar app is successfully approved. Thanks for joining us.-blkbjr";
        $sms = new MessageNineOne();
        $sms->send($mobile,$message);
    }
}
