    <footer class="foi-footer text-white">
        <div class="container">
            <div class="row footer-content">
                <div class="col-xl-6 col-lg-7 col-md-8">
                    <h2 class="mb-0">Do you want to know more or just have a question? write to us.</h2>
                </div>
                <div class="col-md-4 col-lg-5 col-xl-6 py-3 py-md-0 d-md-flex align-items-center justify-content-end">
                    <a href="contact.html" class="btn btn-danger btn-lg contact-form">Contact form</a>
                </div>
            </div>
            <div class="row footer-widget-area">
                <div class="col-md-3">
                    <div class="py-3">
                        <img class="footer-logo" src="{{asset('logo/logo.png')}}" alt="FOI">
                    </div>
                    <p class="font-os font-weight-semibold mb3">Get our mobile app</p>
                    <div>
                        <button class="btn btn-app-download mr-2"><img src="ui/assets/images/ios.svg" alt="App store"></button>
                        <button class="btn btn-app-download"><img src="ui/assets/images/android.svg" alt="play store"></button>
                    </div>
                </div>
                <div class="col-md-3 mt-3 mt-md-0">
                    <nav>
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a href="{{route('vendor.login')}}" class="nav-link">Seller Login</a>
                            </li>
                            <li class="nav-item">
                                <a href="{{route('vendor.register')}}" class="nav-link">Seller Registration</a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="col-md-3 mt-3 mt-md-0">
                    <nav>
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a href="#!" class="nav-link">About Us</a>
                            </li>
                            <li class="nav-item">
                                <a href="{{route('terms')}}" class="nav-link">Terms & Conditions</a>
                            </li>

                            <li class="nav-item">
                                <a href="{{route('privacy')}}" class="nav-link">Privacy Policy</a>
                            </li>

                        </ul>
                    </nav>
                </div>
                <div class="col-md-3 mt-3 mt-md-0">
                    <p>
                        Info@bulkbajaar.com
                    </p>
                    <p>
                        +91 8368336751
                    </p>
                    <p>
                        &copy; {{now()->format('Y')}}<a href="{{URL::to('/')}}" target="_blank" rel="" class="text-reset">{{trans('panel.site_title')}}</a>.
                    </p>
                    <p>All rights reserved.</p>
                    <nav class="social-menu">
                        <a target="_blank" href="https://facebook.com/bulkbajaar"><img src="{{asset('ui/assets/images/facebook.svg')}}" alt="facebook"></a>
                        <a target="_blank" href="https://instagram.com/bulkbajaar"><img src="{{asset('ui/assets/images/instagram.svg')}}" alt="instagram"></a>
                        <a target="_blank" href="https://twitter.com/bulkbajaar"><img src="{{asset('ui/assets/images/twitter.svg')}}" alt="twitter"></a>
                    </nav>
                </div>
            </div>
        </div>
    </footer>
