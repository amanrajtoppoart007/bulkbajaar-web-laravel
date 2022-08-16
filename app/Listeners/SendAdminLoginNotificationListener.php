<?php

namespace App\Listeners;

use App\Events\SendAdminLoginNotification;
use App\Models\Admin;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Mail;

class SendAdminLoginNotificationListener
{
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
     * @param SendAdminLoginNotification $event
     * @return void
     */

    public function handle(SendAdminLoginNotification $event): void
    {
        $admin = Admin::find($event->senderId)->toArray();
        Mail::send('emails.login', $admin,  static function($message) use ($admin) {
            $message->to($admin['email']);
            $message->subject('Event Testing');
        });
    }
}
