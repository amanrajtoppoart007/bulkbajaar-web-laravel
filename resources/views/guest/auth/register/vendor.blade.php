@extends("guest.layout.app")
@section("styles")
    <link href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.5.1/min/dropzone.min.css" rel="stylesheet"/>
@endsection
@section("content")
    <!-- Main (Start) -->
    <main data-aos="fade-in">

        <!-- Section First (Start) -->
        <section class="bg-light" id="registration-form-section">
            <br>
            <div class="container">
                <!-- Registration Form Card (Start) -->
                <div class="card border-0 shadow">

                    <form class="form-group" id="franchisee_registration_form" method="POST"
                          action="{{ route("store.vendor.register") }}"
                          enctype="multipart/form-data">
                    @csrf
                    <!-- Card Header -->
                        <div class="card-header bg-white" >
                            <h4 class="font-weight-bolder text-theme-1 mt-2">{{ trans('global.fill_the_registration_details') }}</h4>
                        </div>
                        <div class="card-body">
                            <div class="card">
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
                                                <input type="number" name="mobile" id="mobile"
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

                                        <div class="col-lg-3 col-md-6 col-sm-12">
                                            <div class="mt-3">
                                                <label class="font-weight-bolder text-dark"
                                                       for="role">User Type</label><label
                                                    class="text-danger ml-2 font-weight-bolder">*</label>
                                                <select class="custom-select w-100" name="user_type" id="user_type" required>
                                                    <option value="" selected disabled>Select User Type</option>
                                                    @foreach(App\Models\Vendor::USER_TYPE_SELECT as $key => $label)
                                                        <option
                                                            value="{{ $key }}">{{ $label }}</option>
                                                    @endforeach
                                                </select>
                                                <div class="invalid-feedback"></div>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <br>
                            <!-- Help Center Details (End) -->

                            <hr>

                            <!-- Business Details (Start) -->
                            <h5 class="font-weight-bold text-theme-1">{{ trans('global.enter_your_business_details') }}</h5>
                            <div class="row mt-3">

                                <!-- Orginazation Detail (Start) -->
                                <div class="col-lg-6 col-md-6 col-sm-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <h6 class="text-theme-1 font-weight-bolder" >Company Details</h6>
                                            <hr class="w-50 mx-auto">
                                            <div class="mt-3">
                                                <label class="font-weight-bolder text-dark" for="company_name">Company Name</label>
                                                <label
                                                    class="text-danger ml-2 font-weight-bolder">*</label>
                                                <input type="text" name="company_name" id="company_name"
                                                       class="input-group-text bg-transparent w-100 text-left" required>
                                                <div class="invalid-feedback"></div>

                                            </div>
                                            <div class="mt-3">
                                                <label class="font-weight-bolder text-dark"
                                                       for="representative_name">Owner/Representative Name</label>
                                                <label
                                                    class="text-danger ml-2 font-weight-bolder">*</label>
                                                <input type="text" name="representative_name" id="representative_name"
                                                       class="input-group-text bg-transparent w-100 text-left" required>
                                                <div class="invalid-feedback"></div>

                                            </div>
                                            <br>
                                            <h6 class="text-theme-1 font-weight-bolder" >Billing Address</h6>
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
                                                <input type="text" name="billing_pincode"
                                                       class="input-group-text bg-transparent w-100 text-left" id="billing_pincode" required>
                                                <div class="invalid-feedback"></div>
                                            </div>
                                            <br>
                                            <h6 class="text-theme-1 font-weight-bolder" >Pickup Address</h6>
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
                                                <input type="text" name="pickup_pincode"
                                                       class="input-group-text bg-transparent w-100 text-left" id="pickup_pincode">
                                                <div class="invalid-feedback"></div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <!-- Orginazation Detail (End) -->
                                <!-- Representative Detail (Start) -->
                                <div class="col-lg-6 col-md-6 col-sm-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <h6 class="text-theme-1 font-weight-bolder" >Documents</h6>
                                            <hr class="w-50 mx-auto">
                                            <div class="mt-3">
                                                <label class="font-weight-bolder text-dark" for="pan_number">PAN Number</label><label
                                                    class="text-danger ml-2 font-weight-bolder">*</label>
                                                <input type="text" name="pan_number" id="pan_number"
                                                       class="input-group-text bg-transparent w-100 text-left" required>
                                                <div class="invalid-feedback"></div>

                                            </div>

                                            <div class="mt-3">
                                                <label class="font-weight-bolder text-dark" for="pan_card">Upload PAN Card</label><label
                                                    class="text-danger ml-2 font-weight-bolder">*</label>
                                                <input type="file" name="pan_card" id="pan_card"
                                                       class="input-group-text bg-transparent w-100 text-left" required>
                                                <div class="invalid-feedback"></div>
                                            </div>

                                            <div class="mt-3">
                                                <label class="font-weight-bolder text-dark" for="gst_number">GST Number</label>
                                                <label
                                                    class="text-danger ml-2 font-weight-bolder">*</label>
                                                <input type="text" name="gst_number" id="gst_number"
                                                       class="input-group-text bg-transparent w-100 text-left">
                                                <div class="invalid-feedback"></div>
                                            </div>
                                            <div class="mt-3">
                                                <label class="font-weight-bolder text-dark" for="gst">Upload GST</label><label
                                                    class="text-danger ml-2 font-weight-bolder">*</label>
                                                <input type="file" name="gst" id="gst"
                                                       class="input-group-text bg-transparent w-100 text-left" required>
                                                <div class="invalid-feedback"></div>
                                            </div>
                                            <br>
                                            <h6 class="text-theme-1 font-weight-bolder">Bank Details</h6>
                                            <hr class="w-50 mx-auto">

                                            <div class="mt-3">
                                                <label class="font-weight-bolder text-dark"
                                                       for="bank_name">Bank Name</label>
                                                <label
                                                    class="text-danger ml-2 font-weight-bolder">*</label>
                                                <input type="text" name="bank_name" id="bank_name"
                                                       class="input-group-text bg-transparent w-100 text-left" required>
                                                <div class="invalid-feedback"></div>

                                            </div>

                                            <div class="mt-3">
                                                <label class="font-weight-bolder text-dark"
                                                       for="account_number">Account Number</label><label
                                                    class="text-danger ml-2 font-weight-bolder">*</label>
                                                <input type="text" name="account_number" id="account_number"
                                                       class="input-group-text bg-transparent w-100 text-left" required>
                                                <div class="invalid-feedback"></div>

                                            </div>
                                            <div class="mt-3">
                                                <label class="font-weight-bolder text-dark"
                                                       for="account_holder_name">Account Holder Name</label><label
                                                    class="text-danger ml-2 font-weight-bolder">*</label>
                                                <input type="text" name="account_holder_name" id="account_holder_name"
                                                       class="input-group-text bg-transparent w-100 text-left" required>
                                                <div class="invalid-feedback"></div>
                                            </div>
                                            <div class="mt-3">
                                                <label class="font-weight-bolder text-dark"
                                                       for="ifsc_code">IFSC Code</label><label
                                                    class="text-danger ml-2 font-weight-bolder">*</label>
                                                <input type="text" name="ifsc_code" id="ifsc_code"
                                                       class="input-group-text bg-transparent w-100 text-left" required>
                                                <div class="invalid-feedback"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Representative Detail (End) -->
                            </div>
                            <br>
                            <!-- Business Details (End) -->
                            <hr>
                        </div>
                        <!-- Card Body (End) -->

                        <!-- Card Footer -->
                        <div class="card-footer bg-white" >
                            <div class="form-check-inline">
                                <input type="checkbox" name="terms" class="custom-checkbox mt-n3 mr-2" required>
                                <p class="description-1">By Registering with us,you agree with our <a href="#"
                                                                                                      class="card-link">terms
                                        & conditions </a>and <a href="#" class="card-link">privacy policy</a></p>
                            </div>
                            <br>
                            <button id="submit-button" type="submit" class="btn btn-theme-1 rounded px-4">Submit<img
                                    src="{{ asset('assets/assets/icons/circle-arrow.svg') }}" alt="submit"
                                    class="btn-icon"></button>
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

            $("#franchisee_registration_form").on("submit", function (e) {
                e.preventDefault();
                $('#submit-button').prop('disabled', true);
                let formData = new FormData(document.getElementById('franchisee_registration_form'));

                $.ajax({
                    url: "{{route('store.vendor.register')}}",
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
                            $("#franchisee_registration_form")[0].reset();
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
                    error: function (jqXhr, json, errorThrown) {
                        $('#submit-button').prop('disabled', false);
                        let data = jqXhr.responseJSON;

                        if (data.errors) {
                            $.each(data.errors, function (index, item) {
                                $(`#${index}`).addClass("is-invalid").tooltip({title: item[0]});
                                $(`#${index}`).next('.invalid-feedback').text(item[0]);
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

    <script>
        $(document).ready(function () {

            $('.pickup-address-type').change(function (){
               if(this.value == 1){
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
                    error: function (jqXHR, textStatus, errorThrown) {
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
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(textStatus);
                    }
                });
            });
        });
    </script>
@endsection
