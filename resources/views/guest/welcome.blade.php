@extends("guest.layout.app")
@section("header-content")
    <div class="header-content">
                <div class="row">
                    <div class="col-md-6">
                        <h1>Welcome to BulkBajaar</h1>
                        <p class="text-dark">India's best connecting platform for manufacturers and retailers to make their Business better!</p>
                        <p class="text-dark">Order directly from verified manufacturers at competitive prices from the comfort of your Shop.</p>
                        <button class="btn btn-primary mb-4">Get Started</button>
                        <div class="my-2">
                            <p class="header-app-download-title">GET OUR MOBILE APP</p>
                        </div>
                        <div>
                            <button class="btn btn-app-download mr-2"><img src="{{asset('ui/assets/images/ios.svg')}}" alt="App store"></button>
                            <button class="btn btn-app-download"><img src="{{asset('ui/assets/images/android.svg')}}" alt="play store"></button>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <img  src="{{asset('ui/assets/images/app-screen.jpg')}}" alt="app" width="388px" class="img-fluid app-image">
                    </div>
                </div>
            </div>
@endsection
@section("content")
     <section class="py-5 mb-5">
        <div class="container">
            <h2 class="section-title">Application Features</h2>
            <div class="row">
                <div class="col-lg-4 mb-4 mb-lg-0">
                    <h5>Easy</h5>
                    <p class="text-dark">Order directly from verified manufacturers at competitive prices from the comfort of your Shop.</p>
                    <p class="mb-5"><a href="#!" class="text-primary mb-5">Find out More</a></p>
                    <h5>Fully functional</h5>
                    <p class="text-dark">No need to leave your sale counter for market visit. Just compare & order wide range of products from different brands online at BulkBajaar.</p>
                    <p class="mb-5"><a href="#!" class="text-primary mb-5">Find out More</a></p>
                </div>
                <div class="col-lg-4 mb-3 mb-lg-0">
                    <h5>Live Chat</h5>
                    <p class="text-dark">No matter what kind of home you have to share, you can increase your earnings.</p>
                    <p class="mb-5"><a href="#!" class="text-primary mb-5">Find out More</a></p>
                    <h5>Powerful dashboard</h5>
                    <p class="text-dark">No matter what kind of home you have to share, you can increase your earnings.</p>
                    <p class="mb-5"><a href="#!" class="text-primary mb-5">Find out More</a></p>
                </div>
                <div class="col-lg-4">
                    <h6 class="text-gray font-os font-weight-semibold">Trusted by the world's best</h6>
                    <div id="landingClientCarousel" class="carousel slide landing-client-carousel" data-ride="carousel">
                        <div class="carousel-inner" role="listbox">
                            <div class="carousel-item active">
                                <div class="d-flex flex-wrap justify-content-center">
                                    <div class="clients-logo">
                                        <img src="ui/assets/images/clients/slack.svg" alt="Slack" class="img-fluid">
                                    </div>
                                    <div class="clients-logo">
                                        <img src="ui/assets/images/clients/spotify.svg" alt="Spotify" class="img-fluid">
                                    </div>
                                    <div class="clients-logo">
                                        <img src="ui/assets/images/clients/paypal.svg" alt="Paypal" class="img-fluid">
                                    </div>
                                    <div class="clients-logo">
                                        <img src="ui/assets/images/clients/amazon.svg" alt="Amazon" class="img-fluid">
                                    </div>
                                    <div class="clients-logo">
                                        <img src="ui/assets/images/clients/google.svg" alt="Google" class="img-fluid">
                                    </div>
                                    <div class="clients-logo">
                                        <img src="ui/assets/images/clients/samsung.svg" alt="Samsung" class="img-fluid">
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="d-flex flex-wrap justify-content-center">
                                    <div class="clients-logo">
                                        <img src="ui/assets/images/clients/slack.svg" alt="Slack" class="img-fluid">
                                    </div>
                                    <div class="clients-logo">
                                        <img src="ui/assets/images/clients/spotify.svg" alt="Spotify" class="img-fluid">
                                    </div>
                                    <div class="clients-logo">
                                        <img src="ui/assets/images/clients/paypal.svg" alt="Paypal" class="img-fluid">
                                    </div>
                                    <div class="clients-logo">
                                        <img src="ui/assets/images/clients/amazon.svg" alt="Amazon" class="img-fluid">
                                    </div>
                                    <div class="clients-logo">
                                        <img src="ui/assets/images/clients/google.svg" alt="Google" class="img-fluid">
                                    </div>
                                    <div class="clients-logo">
                                        <img src="ui/assets/images/clients/samsung.svg" alt="Samsung" class="img-fluid">
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="d-flex flex-wrap justify-content-center">
                                    <div class="clients-logo">
                                        <img src="ui/assets/images/clients/slack.svg" alt="Slack" class="img-fluid">
                                    </div>
                                    <div class="clients-logo">
                                        <img src="ui/assets/images/clients/spotify.svg" alt="Spotify" class="img-fluid">
                                    </div>
                                    <div class="clients-logo">
                                        <img src="ui/assets/images/clients/paypal.svg" alt="Paypal" class="img-fluid">
                                    </div>
                                    <div class="clients-logo">
                                        <img src="ui/assets/images/clients/amazon.svg" alt="Amazon" class="img-fluid">
                                    </div>
                                    <div class="clients-logo">
                                        <img src="ui/assets/images/clients/google.svg" alt="Google" class="img-fluid">
                                    </div>
                                    <div class="clients-logo">
                                        <img src="ui/assets/images/clients/samsung.svg" alt="Samsung" class="img-fluid">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <ol class="carousel-indicators">
                            <li data-target="#landingClientCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#landingClientCarousel" data-slide-to="1"></li>
                            <li data-target="#landingClientCarousel" data-slide-to="2"></li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
