<?php
namespace App\Traits;

use App\Library\MessageNineOne\MessageNineOne;

trait SmsSenderTrait {
    /**
     * @param $data
     * @return bool|string
     */
    public function sendRegisteredVendorSms($data)
    {
        $username =  $data['username'];
        $password =  $data['password'];
        $message = "Welcome to BulkBajaar , your username is $username and your password is $password , do not share it with anyone , thanks -blkbjr";
        $sms = new MessageNineOne();
        return $sms->send($data['mobile'],$message);
    }

    public function sendRegisteredUserSms($data)
    {
        $username =  $data['username'];
        $password =  $data['password'];
        $message = "Welcome to BulkBajaar , your username is $username and your password is $password , do not share it with anyone , thanks -BulkBajaar";
        $sms = new MessageNineOne();
        return $sms->send($data['mobile'],$message);
    }



    public function sendUserOrderPlacedSms($data)
    {
        $orderNo = $data['order_number'];
        $message = "Congratulation your order $orderNo is successfully placed , we will process it shortly , thanks -blkbjr";
        $sms = new MessageNineOne();
        return $sms->send($data['mobile'],$message);
    }

    public function sendOtpSms($data)
    {
        $service_type = $data['service_type'];
        $otp = $data['otp'];
        $message = "Your OTP for $service_type is $otp ,do not share it with anyone.-blkbjr";

        $sms = new MessageNineOne();
        return $sms->send($data['mobile'],$message);
    }

    public function userApprovalSms($name,$mobile)
    {
        $message ="Hi $name, your account at BulkBajaar app is successfully approved. Thanks for joining us.-blkbjr";
        $sms = new MessageNineOne();
        return $sms->send($mobile,$message);
    }
}
