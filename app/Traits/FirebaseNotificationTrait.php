<?php

namespace App\Traits;

trait FirebaseNotificationTrait {

    public function sendPushNotification($deviceTokens, $message)
    {
        $SERVER_API_KEY = 'AAAAoVJwcTg:APA91bH8XTN_QSAa0QZ5t__QXibBSGjUebRLCJ7hWD4OKu9U-AB76nA5mXR6-dNoKvxI83uS6rMSMbfsax-KZMsK7CHfyWyfykuYXYTj7D4pWJFX87b24jUs2JETa3I-6osw7mXEoE4d';

        $data = [
            "registration_ids" => $deviceTokens,
            "data" => $message
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
