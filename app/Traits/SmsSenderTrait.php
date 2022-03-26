<?php
namespace App\Traits;

use App\Library\MessageNineOne\MessageNineOne;

trait SmsSenderTrait {

    public function sendRegisteredHelpCenterSms($data)
    {
        $message = "Welcome to KV PRO. Your username is ". $data['username'];
        $message .= " and your password is " . $data['password'];
        $message .= " Do not share your credentials with anyone";
        $sms = new MessageNineOne();
        $sms->send($message, $data['mobile'], 'KSVPRO');
    }

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
        $message = "Your KV PRO OTP for " . $data['service_type'] . " ";
        $message .= "is ". $data['otp'] ." Please do not share your OTP with anyone";
        $sms = new MessageNineOne();
        $sms->send($data['mobile'],$message);
    }
}
