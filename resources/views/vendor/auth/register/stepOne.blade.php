@extends("guest.layout.app")
@section("content")
    <!-- Main (Start) -->
    <main data-aos="fade-in">
        <!-- Section First (Start) -->
        <section class="bg-light" id="registration-form-section">
            <br>
            <div class="container">
                <div class="card border-0 shadow">

                    <form class="form-group" action="{{route('vendor.register.store')}}" id="seller_registration_form" method="POST">
                    @csrf
                    <!-- Card Header -->
                        <div class="card-header bg-white text-center">
                            <h4 class="fw-bolder text-theme-1 mt-2 ">{{ trans('global.fill_the_registration_details') }}</h4>
                        </div>

                        <!-- Card Body (Start) -->
                        <div class="card-body">

                            <!-- Help Center Details (Start) -->

                            <div class="row justify-content-between w-100">
                                <div class="col md-2">
                                    <h6 class="fw-bold">Seller Registration Detail</h6>
                                </div>
                                <div class="col md-2 text-right">
                                    <h6 class="fw-bold">Step 1/3</h6>
                                </div>
                            </div>
                            <div class="card border-0">
                                <div class="card-body pt-0">
                                    <div class="row">

                                        <div class="col-lg-3 col-md-6 col-sm-12">
                                            <div class="mt-3">
                                                <label class="font-weight-bolder text-dark"
                                                       for="email">{{ trans('cruds.helpCenter.fields.email') }}</label><label
                                                    class="text-danger ml-2 font-weight-bolder">*</label>
                                                <input type="email" name="email" id="email"
                                                       class="input-group-text bg-transparent w-100 text-left" required>
                                                <div class="invalid-feedback"></div>

                                            </div>
                                        </div>

                                        <div class="col-lg-3 col-md-6 col-sm-12">
                                            <div class="mt-3">
                                                <label class="font-weight-bolder text-dark"
                                                       for="mobile">{{ trans('cruds.helpCenter.fields.mobile') }}</label><label
                                                    class="text-danger ml-2 font-weight-bolder">*</label>
                                                <input type="number" minlength="10" maxlength="10" name="mobile" id="mobile"
                                                       class="input-group-text bg-transparent w-100 text-left" required>
                                                <div class="invalid-feedback"></div>

                                            </div>
                                        </div>


                                        <div class="col-lg-3 col-md-6 col-sm-12">
                                            <div class="mt-3">
                                                <label class="font-weight-bolder text-dark"
                                                       for="password">{{ trans('cruds.helpCenter.fields.password') }}</label><label
                                                    class="text-danger ml-2 font-weight-bolder">*</label>
                                                <input type="password" name="password" id="password"
                                                       class="input-group-text bg-transparent w-100 text-left" required>
                                                <div class="invalid-feedback"></div>

                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-12">
                                            <div class="mt-3">
                                                <label class="font-weight-bolder text-dark"
                                                       for="password_confirmation">Confirm Password</label><label
                                                    class="text-danger ml-2 font-weight-bolder">*</label>
                                                <input type="password" name="password_confirmation" id="password_confirmation"                                                       class="input-group-text bg-transparent w-100 text-left" required>
                                                <div class="invalid-feedback"></div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Card Body (End) -->

                        <!-- Card Footer -->
                        <div class="card-footer bg-white text-center">
                            <div class="form-check-inline">
                                <input type="checkbox" name="terms" class="custom-checkbox mt-n3 mr-2" required>
                                <p class="fw-bold text-secondary">By Registering with us,you agree with our
                                    <a href="{{route('terms')}}" class="card-link link-text-primary">terms & conditions</a>
                                    <span>and</span>
                                    <a href="{{route('privacy')}}" class="card-link link-text-primary">privacy policy</a>
                                </p>
                            </div>
                            <br>
                            <button id="submit-button" type="submit" class="btn btn-primary text-white fw-bold">
                                <span>Next Step</span>
                                <span class="mx-1"><img src="{{ asset('assets/assets/icons/circle-arrow.svg') }}" alt="submit" class="btn-icon"/></span>
                            </button>
                        </div>

                    </form>
                </div>
                <!-- Registration Form Card (End) -->

            </div>
            <br>
        </section>
        <!-- Section First (End) -->

    </main>
    <!-- Main (End) -->
@endsection

@section('script')
    <script>
        $(document).ready(function () {

              $("#mobile").on("keydown",function(e){

                if(($(this).val()).length>=10)
                {
                    e.preventDefault();
                }
            });

            $("#seller_registration_form").on("submit", function (e) {
                e.preventDefault();
                $('#submit-button').prop('disabled', true);
                let formData = new FormData(document.getElementById('seller_registration_form'));

                $.ajax({
                    url: "{{route('vendor.register.store')}}",
                    type: 'POST',
                    data: formData,
                    dataType: 'json',
                    contentType: false,
                    cache: false,
                    processData: false,
                    beforeSend: function () {
                        $("#overlay").show();
                    },
                    success: function (res) {
                        if (res.response === "success") {
                            // $.notify(res.message, 'white');
                            toastr.success(res.message, '', {
                                progressBar: true,
                                timeOut: 2000,
                                positionClass: 'toast-top-left'
                            });
                            $("#seller_registration_form")[0].reset();
                            window.open(res.url, '_self');
                        } else {
                            // $.notify(res.message, 'white');
                            toastr.error(res.message, '', {
                                progressBar: true,
                                timeOut: 2000,
                                positionClass: 'toast-top-left'
                            });
                        }
                        $('#submit-button').prop('disabled', false);
                    },
                    error: function (jqXhr) {
                        $('#submit-button').prop('disabled', false);
                        let data = jqXhr.responseJSON;

                        if (data.errors) {
                            $.each(data.errors, function (index, item) {
                                const errorElement =$(`#${index}`) ;
                                errorElement.addClass("is-invalid").tooltip({title: item[0]});
                                errorElement.next('.invalid-feedback').text(item[0]);
                                // $.notify(item[0], 'white');
                                toastr.error(item[0], '', {
                                    progressBar: true,
                                    timeOut: 2000,
                                    positionClass: 'toast-top-left'
                                });
                            })
                        }
                        if (data.message) {
                            // $.notify(data.message, 'white');
                            toastr.error(data.message, '', {
                                progressBar: true,
                                timeOut: 2000,
                                positionClass: 'toast-top-left'
                            });
                        }
                    },

                    complete: function () {
                        $('#submit-button').prop('disabled', false);
                        $("#overlay").hide();
                    }
                });
            });
        });
    </script>
@endsection
