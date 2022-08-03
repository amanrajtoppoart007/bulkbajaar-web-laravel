@component('mail::message')
    # Hello Admin<br>

    New order placed by {{ $order->user->name }} in Bulk Bajaar Order #{{ $order->order_number }}.


    @component('mail::button', ['url' => route('admin.orders.show', $order->id)])
        View
    @endcomponent
    Thanks,<br>
    {{ config('app.name') }}
@endcomponent
