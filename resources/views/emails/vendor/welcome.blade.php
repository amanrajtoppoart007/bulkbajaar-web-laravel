@component('mail::message')
# Hello {{ $data['name'] ?? '' }}

Welcome to Bulk Bajaar.

You are registered as Seller.<br>

You can start listing your products in our portal, portal link and credentials given below. <br>

Mobile :- {{ $data['mobile'] }}<br>
Email :- {{ $data['email'] }}<br>
@if(!empty($data['password']))
    Password :- {{ $data['password'] ?? ''  }}<br>
@endif

Please upload your documents.

Please don't share these credentials to anyone.

@component('mail::button', ['url' => route('vendor.login')])
    Login
@endcomponent

Thanks,<br>
{{ config('app.name') }}
@endcomponent
