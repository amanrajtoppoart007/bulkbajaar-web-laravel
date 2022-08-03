<?php

namespace App\Providers;

use App\Models\Order;
use App\Models\PushNotification;
use App\Observers\OrderObserver;
use App\Observers\PushNotificationObserver;
use Illuminate\Auth\Events\Registered;
use Illuminate\Auth\Listeners\SendEmailVerificationNotification;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Event;
use App\Events\OrderAssigned;
use App\Events\OrderNotAssigned;
use App\Events\ProductCreated;
use App\Events\UserRegistered;
use App\Events\VendorRegistered;
use App\Events\PushNotificationCreated;
use App\Events\OrderCreated;
use App\Listeners\SendOrderAssignedMail;
use App\Listeners\SendOrderNotAssignedMail;
use App\Listeners\SendProductCreatedPushNotification;
use App\Listeners\PushNotificationCreatedListener;
use App\Listeners\SendUserRegisteredMessage;
use App\Listeners\SendVendorRegisteredMessage;
use App\Listeners\SendOrderCreatedMessage;
use App\Listeners\GenerateOrderInvoice;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event listener mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        Registered::class => [
            SendEmailVerificationNotification::class,
        ],
        OrderNotAssigned::class => [
            SendOrderNotAssignedMail::class
        ],
        ProductCreated::class => [
            SendProductCreatedPushNotification::class
        ],
        PushNotificationCreated::class => [
            PushNotificationCreatedListener::class
        ],
        UserRegistered::class => [
            SendUserRegisteredMessage::class
        ],
        VendorRegistered::class => [
            SendVendorRegisteredMessage::class
        ],
        OrderCreated::class => [
            SendOrderCreatedMessage::class,
            GenerateOrderInvoice::class
        ],
    ];


    public function boot()
    {
        Order::observe(OrderObserver::class);
        PushNotification::observe(PushNotificationObserver::class);
    }
}
