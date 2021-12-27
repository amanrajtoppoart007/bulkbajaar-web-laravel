<?php

namespace App\Observers;

use App\Events\PushNotificationCreated;
use App\Models\PushNotification;
use App\Models\User;
use Carbon\Carbon;

class PushNotificationObserver
{
    /**
     * Handle the PushNotification "created" event.
     *
     * @param  \App\Models\PushNotification  $pushNotification
     * @return void
     */
    public function created(PushNotification $pushNotification)
    {
        $imageUrl = null;
        if ($pushNotification->photo) {
            $imageUrl = $pushNotification->photo->getUrl('thumb');
        } else {
            $imageUrl = asset('assets/assets/images/logo-1.png');
        }

        $deviceTokens = $pushNotification->users->pluck('device_token')->toArray();
        if (!empty($deviceTokens)) {
            $message = [
                'title' => $pushNotification->title,
                'body' => $pushNotification->message,
                'imageUrl' => $imageUrl,
                'created_at' => Carbon::parse($pushNotification->created_at)->format('d M Y h:i A')
            ];
            $data = [
                'device_tokens' => $deviceTokens,
                'message' => $message
            ];
            event(new PushNotificationCreated($data));
        }
    }

    /**
     * Handle the PushNotification "updated" event.
     *
     * @param  \App\Models\PushNotification  $pushNotification
     * @return void
     */
    public function updated(PushNotification $pushNotification)
    {
        //
    }

    /**
     * Handle the PushNotification "deleted" event.
     *
     * @param  \App\Models\PushNotification  $pushNotification
     * @return void
     */
    public function deleted(PushNotification $pushNotification)
    {
        //
    }

    /**
     * Handle the PushNotification "restored" event.
     *
     * @param  \App\Models\PushNotification  $pushNotification
     * @return void
     */
    public function restored(PushNotification $pushNotification)
    {
        //
    }

    /**
     * Handle the PushNotification "force deleted" event.
     *
     * @param  \App\Models\PushNotification  $pushNotification
     * @return void
     */
    public function forceDeleted(PushNotification $pushNotification)
    {
        //
    }
}
