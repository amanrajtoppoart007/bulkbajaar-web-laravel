<header class="foi-header">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light foi-navbar bg-primary">
                <a class="navbar-brand" href="{{URL::to('/')}}">
                    <img src="{{asset('logo/logo.png')}}" alt="FOI">
                </a>
                <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="collapsibleNavId">
                    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="{{URL::to('/')}}">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{{route('about')}}">About</a>
                        </li>
                        <li class="nav-item active dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="pagesMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Company</a>
                            <div class="dropdown-menu" aria-labelledby="pagesMenu">
                                <a class="dropdown-item" href="{{route('about')}}">About Us</a>
                                <a class="dropdown-item" href="{{route('privacy')}}">Privacy policy</a>
                                <a class="dropdown-item" href="{{route('terms')}}">Terms & Conditions</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{{route('contact')}}">contact</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav mt-2 mt-lg-0">
                        <li class="nav-item mr-2 mb-3 mb-lg-0">
                            <a class="btn btn-secondary" href="{{route('vendor.register')}}">Sign up</a>
                        </li>
                    </ul>
                </div>
            </nav>
            @yield("header-content")
        </div>
    </header>
