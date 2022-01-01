<?php

namespace App\Observers;

use App\Events\OrderCreated;
use App\Models\Order;
use App\Traits\FirebaseNotificationTrait;
use Carbon\Carbon;

class OrderObserver
{
    use FirebaseNotificationTrait;
    /**
     * Handle the Order "created" event.
     *
     * @param  \App\Models\Order  $order
     * @return void
     */
    public function created(Order $order)
    {
        $order->load('vendor', 'user');
        event(new OrderCreated($order));
    }

    /**
     * Handle the Order "updated" event.
     *
     * @param  \App\Models\Order  $order
     * @return void
     */
    public function updated(Order $order)
    {
        if ($order->isDirty('status')){
            $deviceTokens = $order->user->device_token ?? '';
            if (!empty($deviceTokens)){
                //PUSH NOTIFICATION
                $message = [
                    'title' => "Your order status changed.",
                    'body' => "Order no." . $order->order_number  . ' has been '. (Order::STATUS_SELECT[$order->status] ?? ''),
                    'imageUrl' => '',
                    'created_at' => Carbon::parse($order->created_at)->format('d M Y h:i A')
                ];
                $this->sendPushNotification([$deviceTokens], $message);
            }
        }
    }

    /**
     * Handle the Order "deleted" event.
     *
     * @param  \App\Models\Order  $order
     * @return void
     */
    public function deleted(Order $order)
    {
        //
    }

    /**
     * Handle the Order "restored" event.
     *
     * @param  \App\Models\Order  $order
     * @return void
     */
    public function restored(Order $order)
    {
        //
    }

    /**
     * Handle the Order "force deleted" event.
     *
     * @param  \App\Models\Order  $order
     * @return void
     */
    public function forceDeleted(Order $order)
    {
        //
    }
}
