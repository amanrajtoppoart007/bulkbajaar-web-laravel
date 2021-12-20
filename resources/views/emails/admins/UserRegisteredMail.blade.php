@component('mail::message')
    # Hello Admin<br>

    New buyer {{ $data['name'] }} in Bulk Bajaar Portal.


    @component('mail::button', ['url' => route('admin.users.show', $data['id'])])
        View
    @endcomponent
    Thanks,<br>
    {{ config('app.name') }}
@endcomponent
