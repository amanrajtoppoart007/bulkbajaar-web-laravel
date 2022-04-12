<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{trans('panel.site_title')}}</title>
    <link rel="stylesheet" href="{{asset('ui/assets/vendors/fontawesome-free/css/all.min.css')}}">
    <link rel="stylesheet" href="{{asset('ui/assets/css/style.css')}}">
    <link rel="stylesheet" href="{{asset('ui/assets/css/custom.css')}}">
    <link rel="stylesheet" href="{{asset('assets/vendor/toastr/toastr.min.css')}}">
</head>

<body>
@includeIf('guest.includes.navbar')
@yield('content')
@includeIf('guest.includes.footer')
    <script src="{{asset('ui/assets/vendors/jquery/jquery.min.js')}}"></script>
    <script src="{{asset('ui/assets/vendors/popper.js/popper.min.js')}}"></script>
    <script src="{{asset('ui/assets/vendors/bootstrap/dist/js/bootstrap.min.js')}}"></script>
    <script src="{{asset('assets/vendor/toastr/toastr.min.js')}}"></script>
@yield('script')
</body>

</html>
