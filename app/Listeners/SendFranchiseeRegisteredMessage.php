<?php

namespace App\Listeners;

use App\Events\VendorRegistered;
use App\Mail\FranchiseeWelcomeMessage;
use App\Mail\UserWelcomeMessage;
use App\Traits\SmsSenderTrait;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Mail;

class SendFranchiseeRegisteredMessage implements ShouldQueue
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
        Mail::to($event->data['email'])->send(new FranchiseeWelcomeMessage($event->data));
        $this->sendRegisteredFranchiseeSms($event->data);
        return true;
    }
}
