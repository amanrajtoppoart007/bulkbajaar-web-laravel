<?php

namespace App\Listeners;

use App\Events\OrderCreated;
use App\Mail\SendOrderCreatedEmailToVendor;
use App\Mail\SendOrderCreatedMailToAdmin;
use App\Mail\SendOrderCreatedMailToUser;
use App\Models\Admin;
use App\Models\PushNotification;
use App\Traits\FirebaseNotificationTrait;
use App\Traits\SmsSenderTrait;
use Carbon\Carbon;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Auth\User;
use Illuminate\Support\Facades\Mail;

class SendOrderCreatedMessage implements ShouldQueue
{
    use  SmsSenderTrait, FirebaseNotificationTrait;
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  OrderCreated  $event
     * @return void
     */
    public function handle(OrderCreated $event)
    {
        $order = $event->order;
        $emails = Admin::whereApproved(true)->whereVerified(true)->pluck('email');
        if(!empty($emails)){
         Mail::to($emails)->send(new SendOrderCreatedMailToAdmin($order));
        }

        if(!is_null($order->vendor)){
           Mail::to($order->vendor)->send(new SendOrderCreatedEmailToVendor($order));
        }

      Mail::to($order->user)->send(new SendOrderCreatedMailToUser($order));

        $data = [
            'name' => $order->user->name,
            'mobile' => $order->user->mobile,
            'order_number' => $order->user->order_number,
            'date' => Carbon::parse($order->creatred_at)->format('d M Y')
        ];

        //SAVE NOTIFICATION IN DATABASE
        $notification = new PushNotification();

        $pushNotification = [
            'title'=> "Your order has been placed.",
            'message'=> "Order no." . $order->order_number,
        ];
        $notification->create($pushNotification);
        $notification->users()->sync($order->user_id);
        $this->sendUserOrderPlacedSms($data);

        $user = User::find($order->user_id);

        if($user && $user->device_token)
        {
            $this->sendPushNotification($user->device_token,$pushNotification);
        }


    }
}
