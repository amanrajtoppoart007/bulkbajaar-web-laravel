<?php

namespace App\Listeners;

use App\Events\VendorRegistered;
use App\Mail\SendVendorRegisteredMailToAdmin;
use App\Mail\VendorWelcomeMessage;
use App\Models\Admin;
use App\Traits\SmsSenderTrait;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Support\Facades\Mail;

class SendVendorRegisteredMessage implements ShouldQueue
{
    use SmsSenderTrait;

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
     * @param  VendorRegistered  $event
     * @return void
     */
    public function handle(VendorRegistered $event)
    {
        $emails = Admin::whereApproved(true)->whereVerified(true)->pluck('email');
        if(!empty($emails)){
         Mail::to($emails)->send(new SendVendorRegisteredMailToAdmin($event->data));
        }
        Mail::to($event->data['email'])->send(new VendorWelcomeMessage($event->data));
        $this->sendRegisteredVendorSms($event->data);
    }
}
