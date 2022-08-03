@extends("guest.layout.app")
@section("content")
    <!-- Main (Start) -->
    <main data-aos="fade-in">

        <!-- Section First (Start) -->
        <section class="bg-light" id="registration-form-section">
            <br>
            <div class="container">
                <div class="card border-0 shadow">
                    <form class="form-group" id="seller_registration_form" method="POST"
                          enctype="multipart/form-data">
                    @csrf
                    <!-- Card Header -->
                        <div class="card-header bg-white">
                            <h5 class="font-weight-bolder text-theme-1 mt-2">{{ trans('global.enter_your_business_details') }}</h5>
                        </div>

                        <!-- Card Body (Start) -->
                        <div class="card-body">

                            <div class="row">

                                <!-- Organization Detail (Start) -->
                                <div class="col-lg-12 col-md-12 col-sm-12 mb-4">
                                    <div class="card">
                                        <div class="card-body">
                                            <h6 class="text-theme-1 font-weight-bolder">Company Details</h6>
                                            <div class="row">
                                                <div class="col-4">
                                                    <div class="mt-3">
                                                        <label class="font-weight-bolder text-dark" for="company_name">Company Name</label>
                                                        <label
                                                            class="text-danger ml-2 font-weight-bolder">*</label>
                                                        <input type="text" name="company_name" id="company_name"
                                                               class="input-group-text bg-transparent w-100 text-left" required>
                                                        <div class="invalid-feedback"></div>
                                                    </div>
                                                </div>
                                                <div class="col-4">
                                                    <div class="mt-3">
                                                        <label class="font-weight-bolder text-dark"
                                                               for="user_type">User Type</label><label
                                                            class="text-danger ml-2 font-weight-bolder">*</label>
                                                        <select class="custom-select w-100" name="user_type" id="user_type" required>
                                                            <option value="">Select User Type</option>
                                                            @foreach(App\Models\Vendor::USER_TYPE_SELECT as $key => $label)
                                                                <option
                                                                    value="{{ $key }}">{{ $label }}</option>
                                                            @endforeach
                                                        </select>
                                                        <div class="invalid-feedback"></div>
                                                    </div>
                                                </div>
                                                <div class="col-4">
                                                    <div class="mt-3">
                                                        <label class="font-weight-bolder text-dark"
                                                               for="representative_name">Owner/Representative Name</label>
                                                        <label
                                                            class="text-danger ml-2 font-weight-bolder">*</label>
                                                        <input type="text" name="representative_name" id="representative_name"
                                                               class="input-group-text bg-transparent w-100 text-left" required>
                                                        <div class="invalid-feedback"></div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Organization Detail (End) -->
                                <div class="col-lg-6 col-md-6 col-sm-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <h6 class="text-theme-1 font-weight-bolder">Billing Address</h6>
                                            <hr class="w-50 mx-auto">
                                            <div class="mt-3">
                                                <label class="font-weight-bolder text-dark"
                                                       for="billing_address">Address</label>
                                                <label
                                                    class="text-danger ml-2 font-weight-bolder">*</label>
                                                <input type="text" name="billing_address"
                                                       class="input-group-text bg-transparent w-100 text-left" id="billing_address" required>
                                                <div class="invalid-feedback"></div>
                                            </div>
                                            <div class="mt-3">
                                                <label class="font-weight-bolder text-dark"
                                                       for="billing_address_two">Address Line 2</label>
                                                <input type="text" name="billing_address_two"
                                                       class="input-group-text bg-transparent w-100 text-left" id="billing_address_two">
                                                <div class="invalid-feedback"></div>
                                            </div>

                                            <div class="mt-3">
                                                <label class="font-weight-bolder text-dark"
                                                       for="billing_state_id">{{ trans('cruds.helpCenterProfile.fields.organization_state') }}</label>
                                                <label
                                                    class="text-danger ml-2 font-weight-bolder">*</label>
                                                <select class="custom-select w-100" name="billing_state_id" id="billing_state_id" required>
                                                    <option value="" selected disabled>Select State</option>
                                                    @foreach($states as $id => $state)
                                                        <option
                                                            value="{{ $id }}" {{ old('billing_state_id') == $id ? 'selected' : '' }}>{{ $state }}</option>
                                                    @endforeach
                                                </select>
                                                <div class="invalid-feedback"></div>

                                            </div>

                                            <div class="mt-3">
                                                <label class="font-weight-bolder text-dark"
                                                       for="billing_district_id">{{ trans('cruds.helpCenterProfile.fields.organization_district') }}</label>
                                                <label
                                                    class="text-danger ml-2 font-weight-bolder">*</label>
                                                <select class="custom-select w-100" name="billing_district_id" id="billing_district_id" required>
                                                    <option value="" selected disabled>Select District</option>
                                                </select>
                                                <div class="invalid-feedback"></div>
                                            </div>
                                            <div class="mt-3">
                                                <label class="font-weight-bolder text-dark"
                                                       for="billing_pincode">Pincode</label>
                                                <label
                                                    class="text-danger ml-2 font-weight-bolder">*</label>
                                                <input type="number" name="billing_pincode"
                                                       class="input-group-text bg-transparent w-100 text-left" id="billing_pincode" required>
                                                <div class="invalid-feedback"></div>
                                            </div>
                                            <br>

                                        </div>
                                    </div>
                                </div>
                                <!-- Representative Detail (Start) -->
                                <div class="col-lg-6 col-md-6 col-sm-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <h6 class="text-theme-1 font-weight-bolder">Pickup Address</h6>
                                            <hr class="w-50 mx-auto">
                                            <div class="mt-3">
                                                <div class="form-check">
                                                    <input class="form-check-input pickup-address-type" type="radio" name="pickup_address_same" id="new" value="0" checked>
                                                    <label class="form-check-label" for="new">
                                                        Add New
                                                    </label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input pickup-address-type" type="radio" name="pickup_address_same" id="same" value="1">
                                                    <label class="form-check-label" for="same">
                                                        Same as billing address
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="mt-3">
                                                <label class="font-weight-bolder text-dark"
                                                       for="pickup_address">Address</label>
                                                <input type="text" name="pickup_address"
                                                       class="input-group-text bg-transparent w-100 text-left" id="pickup_address">
                                                <div class="invalid-feedback"></div>
                                            </div>
                                            <div class="mt-3">
                                                <label class="font-weight-bolder text-dark"
                                                       for="pickup_address_two">Address Line 2</label>
                                                <input type="text" name="pickup_address_two"
                                                       class="input-group-text bg-transparent w-100 text-left" id="pickup_address_two">
                                                <div class="invalid-feedback"></div>
                                            </div>

                                            <div class="mt-3">
                                                <label class="font-weight-bolder text-dark"
                                                       for="pickup_state_id">{{ trans('cruds.helpCenterProfile.fields.organization_state') }}</label>
                                                <select class="custom-select w-100" name="pickup_state_id" id="pickup_state_id">
                                                    <option value="" selected disabled>Select State</option>
                                                    @foreach($states as $id => $state)
                                                        <option
                                                            value="{{ $id }}" {{ old('billing_state_id') == $id ? 'selected' : '' }}>{{ $state }}</option>
                                                    @endforeach
                                                </select>
                                                <div class="invalid-feedback"></div>

                                            </div>

                                            <div class="mt-3">
                                                <label class="font-weight-bolder text-dark"
                                                       for="pickup_district_id">{{ trans('cruds.helpCenterProfile.fields.organization_district') }}</label>
                                                <select class="custom-select w-100" name="pickup_district_id" id="pickup_district_id">
                                                    <option value="" selected disabled>Select District</option>
                                                </select>
                                                <div class="invalid-feedback"></div>
                                            </div>
                                            <div class="mt-3">
                                                <label class="font-weight-bolder text-dark"
                                                       for="pickup_pincode">Pincode</label>
                                                <input type="number" name="pickup_pincode"
                                                       onkeyup=""
                                                       class="input-group-text bg-transparent w-100 text-left" id="pickup_pincode">
                                                <div class="invalid-feedback"></div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <!-- Representative Detail (End) -->
                            </div>
                        </div>
                        <!-- Card Body (End) -->

                        <!-- Card Footer -->
                        <div class="card-footer bg-white text-center">
                            <button id="submit-button" type="submit" class="btn btn-primary text-white fw-bold">
                                <span>Next Step</span>
                                <span class="mx-1"><img src="{{ asset('assets/assets/icons/circle-arrow.svg') }}" alt="submit" class="btn-icon"></span>
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

              $("#pickup_pincode,#billing_pincode").on("keydown",function(e){

                if(($(this).val()).length>=6)
                {
                    e.preventDefault();
                }
            });

            $("#seller_registration_form").on("submit", function (e) {
                e.preventDefault();
                $('#submit-button').prop('disabled', true);
                let formData = new FormData(document.getElementById('seller_registration_form'));

                $.ajax({
                    url: "{{route('vendor.register.step-two.store')}}",
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
                            let errors = '';
                            $.each(data.errors, function (index, item) {
                                const errorElement =$(`#${index}`) ;
                                errorElement.addClass("is-invalid").tooltip({title: item[0]});
                                errorElement.next('.invalid-feedback').text(item[0]);

                                errors +=`${item[0]}\n`;

                            });
                            toastr.error(errors, '', {
                                    progressBar: true,
                                    timeOut: 2000,
                                    positionClass: 'toast-top-left'
                                });
                        } else {
                            if (data.message) {
                                // $.notify(data.message, 'white');
                                toastr.error(data.message, '', {
                                    progressBar: true,
                                    timeOut: 2000,
                                    positionClass: 'toast-top-left'
                                });
                            }
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

    <script>
        $(document).ready(function () {

            $('.pickup-address-type').change(function (){
                if(this.value === 1){
                    $('#pickup_address, #pickup_state_id, #pickup_district_id, #pickup_pincode').prop({
                        disabled: true,
                        required: false
                    })
                }else{
                    $('#pickup_address, #pickup_state_id, #pickup_district_id, #pickup_pincode').prop({
                        disabled: false,
                        required: true
                    })
                }
            });

            $.ajaxSetup({headers: {'X-CSRF-TOKEN': '{{ csrf_token() }}'}});
            $("#billing_state_id").on("change", function () {

                $("#billing_district_id").empty();
                $.ajax({
                    url: "{{route('ajax.district.list')}}",
                    type: 'POST',
                    data: {'state_id': $(this).val()},
                    dataType: 'json',
                    success: function (res) {
                        if (res.response === "success") {
                            let option = $($.parseHTML(`<option value="">Select District</option>`));
                            $("#billing_district_id").append(option);
                            $.each(res.data, function (key, item) {
                                let $option = $($.parseHTML(`<option value="${item.id}">${item.name}</option>`));
                                $("#billing_district_id").append($option);
                            });
                            // $("#organization_district_id").select2();
                        }


                    },
                    error: function (jqXHR, textStatus) {
                        console.log(textStatus);
                    }
                });
            });


            $("#pickup_state_id").on("change", function () {

                $("#pickup_district_id").empty();
                $.ajax({
                    url: "{{route('ajax.district.list')}}",
                    type: 'POST',
                    data: {'state_id': $(this).val()},
                    dataType: 'json',
                    success: function (res) {
                        if (res.response === "success") {
                            let option = $($.parseHTML(`<option value="">Select District</option>`));
                            $("#pickup_district_id").append(option);
                            $.each(res.data, function (key, item) {
                                let $option = $($.parseHTML(`<option value="${item.id}">${item.name}</option>`));
                                $("#pickup_district_id").append($option);
                            });
                            // $("#representative_district_id").select2();
                        }


                    },
                    error: function (jqXHR, textStatus) {
                        console.log(textStatus);
                    }
                });
            });
        });
    </script>
@endsection
