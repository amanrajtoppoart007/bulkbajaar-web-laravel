<?php

namespace App\Library\MessageNineOne;

class MessageNineOne
{
    public function send($mobile,$message)
    {
        $mobile = (int)$mobile;
        if(strlen((string)$mobile)==10)
        {
            $mobile = "+91".$mobile;
        }
        //Your authentication key
        $authKey = "357138AFNNBtCds605824c4P1";
       //Multiple mobiles numbers separated by comma
        $mobileNumber = $mobile;
       //Sender ID,While using route4 sender id should be 6 characters long.
        $senderId = "blkbjr";
        //Your message to send, Add URL encoding here.
        $message = urlencode($message);
       //Define route
        $route = 4;
       //Prepare you post parameters
        $postData = array(
            'authkey' => $authKey,
            'mobiles' => $mobileNumber,
            'message' => $message,
            'sender' => $senderId,
            'route' => $route,
            'response'=>'json'
        );
        //API URL
        $url = "https://api.msg91.com/api/v2/sendsms?response=json&route=4";
        // init the resource
        $ch = curl_init();
        curl_setopt_array($ch, array(
            CURLOPT_URL => $url,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_POST => true,
            CURLOPT_POSTFIELDS => $postData
            //,CURLOPT_FOLLOWLOCATION => true
        ));
        //Ignore SSL certificate verification
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
        //get response
        $output = curl_exec($ch);
         //Print error if any
        if (curl_errno($ch)) {
             $output = 'error:' . curl_error($ch);
        }
        curl_close($ch);
        return json_decode($output);
    }
}
