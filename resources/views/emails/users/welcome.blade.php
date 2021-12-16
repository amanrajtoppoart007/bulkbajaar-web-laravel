@component('mail::message')
# Hello {{ $data['name'] }}

Welcome to Bulk Bajaar.

You are registered as buyer. <br>

You can now use our portal, credentials are given below. <br>

Mobile :- {{ $data['mobile'] }}<br>
Email :- {{ $data['email'] }}<br>
@if(!empty($data['password']))
Password :- {{ $data['password'] ?? ''  }}<br>
@endif
Please don't share these credentials to anyone.

Thanks,<br>
{{ config('app.name') }}
@endcomponent
