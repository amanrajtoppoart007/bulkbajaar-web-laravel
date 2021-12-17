<?php

namespace App\Listeners;

use App\Events\UserRegistered;
use App\Mail\UserWelcomeMessage;
use App\Traits\SmsSenderTrait;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Mail;

class SendUserRegisteredMessage implements ShouldQueue
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
     * @param  UserRegistered  $event
     * @return void
     */
    public function handle(UserRegistered $event)
    {
        Mail::to($event->data['email'])->send(new UserWelcomeMessage($event->data));
//        $this->sendRegisteredUserSms($event->data);
        return true;
    }
}