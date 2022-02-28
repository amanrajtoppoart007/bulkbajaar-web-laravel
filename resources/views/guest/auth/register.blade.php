@extends("guest.layout.app")
@section("content")
    <!-- Main (Start) -->
    <main data-aos="fade-in">

        <!-- Section First (Start) -->
        <section class="bg-light" id="panjikaran-section">
            <div class="container">
                <div class="card border-0 shadow">
                    <div class="card-body text-center">
                        <p class="description-1 text-secondary">Select the user type for registration</p>
                        <div class="row mt-3">
                            <div class="col-lg-4 col-md-2 col-sm-12">
                                <a href="{{route('vendor.register')}}" class="card-link">
                                    <div class="card panjikaran-card">
                                        <div class="card-body">
                                            <img src="{{ asset('assets/assets/icons/panjikaran/franchise.svg') }}"
                                                 alt="franchise" class="img-fluid img-thumbnail p-3 bg-white shadow">
                                            <h5 class="font-weight-bolder text-theme-1 mt-4">Seller</h5>
                                        </div>
                                    </div>
                                </a>
                            </div>

                        </div>

                    </div>
                </div>

            </div>
            <br>
        </section>
        <!-- Section First (End) -->

    </main>
    <!-- Main (End) -->
@endsection
