<?php

namespace App\Traits;

trait FirebaseNotificationTrait {

    public function sendPushNotification($deviceTokens, $inputData): bool|string
    {
        $SERVER_API_KEY = 'AAAApYoDmi0:APA91bF_pCEunI_RtHpvR4B4BPjFn191Fv4vBHu51Mfh5Xk4jdDQWKW0hfizDRyn9cxicpsNE8RDhWP9373hCYG-YXYZZOMa_LJXgahpOxVo6SCisobIv3zWhfqmsqIwn50OFmhS64aB';

        $data = [
            "registration_ids" => $deviceTokens,
            "data" => $inputData
        ];
        $dataString = json_encode($data);

        $headers = [
            'Authorization: key=' . $SERVER_API_KEY,
            'Content-Type: application/json',
        ];

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $dataString);

        $response = curl_exec($ch);

        curl_close($ch);

        return $response;
    }
}
