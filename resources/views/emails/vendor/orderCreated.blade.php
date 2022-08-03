@component('mail::message')
    # Hello {{ $order->vendor->name ?? '' }},<br>
    You have received new order from {{ $order->user->name ?? '' }} with Order # {{ $order->order_number ??''}}
    @component('mail::button', ['url' => route('vendor.orders.show', $order->order_number)])
        View
    @endcomponent
    Thanks,<br>
    {{ config('app.name') }}
@endcomponent
