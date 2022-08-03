@component('mail::message')
    # Hello Admin<br>

    New seller {{ $data['name'] }} in Bulk Bajaar Portal.


    @component('mail::button', ['url' => route('admin.vendors.show', $data['id'])])
        View
    @endcomponent
    Thanks,<br>
    {{ config('app.name') }}
@endcomponent
