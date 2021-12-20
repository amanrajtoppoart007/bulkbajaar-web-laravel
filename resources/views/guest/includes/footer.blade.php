<!-- Footer (Start) -->
<footer class="bg-white rounded-0" id="footer">
    <br>
    <div class="container card-body">
        <div class="row">

            <div class="col-lg-3 col-md-6 col-sm-12">
{{--                <img src="{{asset('assets/assets/images/logo-1.png')}}" alt="logo" class="logo img-fluid ml-n2">--}}
                <p class="text-success font-weight-bolder">
                    Company Address
                <a href="mailto:" class="card-link font-weight-bolder text-theme-1">demo@company.com</a>
                    <br>
                <a href="tel:" class="card-link font-weight-bolder text-theme-1">+91 1234567890</a>
                <br>
                <br>
            </div>

            <div class="col-lg-3 col-md-6 col-sm-12">
                <h5 class="text-theme-1 font-weight-bolder">Solutions</h5>
{{--                <ul>--}}
{{--                    <li class="d-block my-4"><a href="{{route('solutions','farmer')}}"--}}
{{--                                                class="card-link text-success font-weight-bolder"><img--}}
{{--                                src="{{ asset('assets/assets/icons/right-arrow.svg') }}" alt="right-arrow" class="mr-2">Solution--}}
{{--                            For Farmers</a></li>--}}

{{--                    <li class="d-block my-4"><a href="{{route('solutions','small-business')}}"--}}
{{--                                                class="card-link text-success font-weight-bolder"><img--}}
{{--                                src="{{ asset('assets/assets/icons/right-arrow.svg') }}" alt="right-arrow" class="mr-2">Solution--}}
{{--                            For Business</a></li>--}}

{{--                    <li class="d-block my-4"><a href="{{route('solutions','institutions')}}"--}}
{{--                                                class="card-link text-success font-weight-bolder"><img--}}
{{--                                src="{{ asset('assets/assets/icons/right-arrow.svg') }}" alt="right-arrow" class="mr-2">Solution--}}
{{--                            For Institutions</a></li>--}}
{{--                </ul>--}}
            </div>

            <div class="col-lg-3 col-md-6 col-sm-12">
                <h5 class="text-theme-1 font-weight-bolder">Company</h5>
                <ul>
                    <li class="d-block my-4"><a href="{{route('contact')}}"
                                                class="card-link text-success font-weight-bolder"><img
                                src="{{ asset('assets/assets/icons/right-arrow.svg') }}" alt="right-arrow" class="mr-2">Contact
                            Us</a></li>

                    <li class="d-block my-4"><a href="{{route('terms')}}"
                                                class="card-link text-success font-weight-bolder"><img
                                src="{{ asset('assets/assets/icons/right-arrow.svg') }}" alt="right-arrow" class="mr-2">Terms
                            of service</a></li>

                    <li class="d-block my-4"><a href="{{route('privacy')}}"
                                                class="card-link text-success font-weight-bolder"><img
                                src="{{ asset('assets/assets/icons/right-arrow.svg') }}" alt="right-arrow" class="mr-2">Privacy
                            policy</a></li>
                </ul>
            </div>

            <div class="col-lg-3 col-md-6 col-sm-12">
                <h5 class="text-theme-1 font-weight-bolder">Our Social Networks</h5>
                <p class="text-theme-1 font-weight-bolder">You are welcome to join us in our social media pages</p>
                <div>
                    <a href="https://www.facebook.com" class="btn btn-theme-1 pb-2 rounded"><img
                            src="{{ asset('assets/assets/icons/facebook.svg') }}" alt="facebook"></a>
                    <a href="https://www.youtube.com"
                       class="btn btn-theme-1 pb-2 rounded"><img src="{{ asset('assets/assets/icons/youtube.svg') }}"
                                                                 alt="youtube"></a>
                    <a href="#" class="btn btn-theme-1 pb-2 rounded"><img
                            src="{{ asset('assets/assets/icons/twitter.svg') }}" alt="twitter"></a>
                </div>
            </div>

        </div>
    </div>
    <div class="container-fluid card-body d-lg-flex d-md-block d-sm-block justify-content-around bg-theme-1">
        <h6 class="text-white d-inline mt-2">2021 © Copyright <b>{{ env('APP_NAME', 'Bulk Bajaar') }} </b>. All Rights Reserved</h6>
        <br>
        <h6 class="text-white d-inline mt-2"><a href="https://www.softwarefuels.com/" class="card-link text-white">Designed
                by SOFTWAREFUELS CONSULTANCY SERVICES PRIVATE LIMITED</a></h6>
    </div>
</footer>
<!-- Footer (End) -->
