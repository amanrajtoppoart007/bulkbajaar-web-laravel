<!-- Header (Start) -->
<header>
    <nav class="navbar navbar-expand-lg bg-white fixed-top" id="navbar">
        <div class="container justify-content-between">
            <!-- Toggler Button -->
            <button class="navbar-toggler" id="navbar-toggler" onclick="$('#navbar-collapse').toggle(300);">
                <img src="{{ asset('assets/assets/icons/menu.svg') }}" alt="toggler-menu">
            </button>
            <!-- Brand Logo -->
            <a href="{{URL::to('/')}}" class="navbar-brand text-theme-1 font-weight-bolder">{{ env('APP_NAME', 'Demo Site') }}</a>

            <!-- Navigation Menu -->
            <div class="collapse navbar-collapse ml-auto" id="navbar-collapse">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item px-1 dropdown">
                        <a href="#" class="btn shadow btn-theme-1 px-4 mx-2 py-2 nav-link dropdown-toggle">Login</a>
                        <div class="dropdown-menu shadow card-body">
                            <a href="{{route('vendor.login')}}" class="nav-link dropdown-item">Seller</a>
                            <a href="{{route('login')}}" class="nav-link dropdown-item">Buyer</a>
                        </div>
                    </li>
                    <hr>
                    <li class="px-1"><a href="{{ route('register') }}" class="btn shadow btn-theme-1 px-4 mx-2 py-2">Registration<img
                                src="{{asset('assets/assets/icons/circle-arrow.svg')}}" class="btn-icon"
                                alt="arrow-right"></a></li>
                    <hr>
                </ul>
            </div>
        </div>
    </nav>
</header>
<!-- Header (End) -->
