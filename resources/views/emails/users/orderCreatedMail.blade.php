@component('mail::message')
    # Hello {{ $order->user->name }}<br>

    Thank you for ordering at Bulk Bajaar. <br>

    Order # {{ $order->order_number }}

    Thanks,<br>
    {{ config('app.name') }}
@endcomponent
