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
                          enctype="multipart/form-data">
                    @csrf
                    <!-- Card Header -->
                        <div class="card-header bg-white">
                            <h4 class="font-weight-bolder text-theme-1 mt-2">Enter your business details</h4>
                            <p class="fw-bolder text-success">
                                Aadhar detail is required for identity validation.
                                Pan & Gst details are required for  invoice and accounting purpose.
                                You can fill the bank detail  but it is optional.
                                Your details are safe with us.
                            </p>
                        </div>

                        <!-- Card Body (Start) -->
                        <div class="card-body">
                            <div class="row">
                                                <div class="col-6">
                                                    <div class="mt-3">
                                                        <label class="font-weight-bolder text-dark" for="pan_number">PAN Number</label><label
                                                            class="text-danger ml-2 font-weight-bolder">*</label>
                                                        <input type="text" name="pan_number" id="pan_number"
                                                               class="input-group-text bg-transparent w-100 text-left" required>
                                                        <div class="invalid-feedback"></div>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="mt-3">
                                                        <label class="font-weight-bolder text-dark" for="pan_card">Upload PAN Card</label><label
                                                            class="text-danger ml-2 font-weight-bolder">*</label>
                                                        <input type="file" name="pan_card" id="pan_card"
                                                               class="input-group-text bg-transparent w-100 text-left" required>
                                                        <div class="invalid-feedback"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-6">
                                                    <div class="mt-3">
                                                        <label class="font-weight-bolder text-dark" for="gst_number">GST Number</label>
                                                        <label
                                                            class="text-danger ml-2 font-weight-bolder">*</label>
                                                        <input type="text" name="gst_number" id="gst_number"
                                                               class="input-group-text bg-transparent w-100 text-left">
                                                        <div class="invalid-feedback"></div>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="mt-3">
                                                        <label class="font-weight-bolder text-dark" for="gst">Upload GST</label><label
                                                            class="text-danger ml-2 font-weight-bolder">*</label>
                                                        <input type="file" name="gst" id="gst"
                                                               class="input-group-text bg-transparent w-100 text-left" required>
                                                        <div class="invalid-feedback"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-6">
                                                    <div class="mt-3">
                                                        <label class="font-weight-bolder text-dark"
                                                               for="bank_name">Bank Name <small>(Optional)</small></label>
                                                        <input type="text" name="bank_name" id="bank_name"
                                                               class="input-group-text bg-transparent w-100 text-left">
                                                        <div class="invalid-feedback"></div>

                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="mt-3">
                                                        <label class="font-weight-bolder text-dark" for="account_number">Account Number <small>(Optional)</small></label>
                                                        <input type="text" name="account_number" id="account_number"
                                                               class="input-group-text bg-transparent w-100 text-left">
                                                        <div class="invalid-feedback"></div>

                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="mt-3">
                                                        <label class="font-weight-bolder text-dark"
                                                               for="account_holder_name">Account Holder Name <small>(Optional)</small></label>
                                                        <input type="text" name="account_holder_name" id="account_holder_name"
                                                               class="input-group-text bg-transparent w-100 text-left">
                                                        <div class="invalid-feedback"></div>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="mt-3">
                                                        <label class="font-weight-bolder text-dark"
                                                               for="ifsc_code">IFSC Code <small>(Optional)</small></label>
                                                        <input type="text" name="ifsc_code" id="ifsc_code"
                                                               class="input-group-text bg-transparent w-100 text-left">
                                                        <div class="invalid-feedback"></div>
                                                    </div>
                                                </div>
                                            </div>
                        </div>
                        <!-- Card Body (End) -->

                        <!-- Card Footer -->
                        <div class="card-footer bg-white" align="center">
                            <button id="submit-button" type="submit" class="btn btn-primary text-white fw-bolder">
                                <span>Submit</span>
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


             $(document).on("keypress","#account_number",function(e){
            if(!validateNumber(e,16))
            {
                e.preventDefault();
            }
        });
        function validateNumber(event,length) {
            let key = window.event ? event.keyCode : event.which;
            if(event.target.value?.length>=length)
            {
                return (event.keyCode === 8 || event.keyCode === 46
                    || event.keyCode === 37 || event.keyCode === 39);

            }
            else
            {
                 return !(key < 48 || key > 57);
            }
        }

            $("#franchisee_registration_form").on("submit", function (e) {
                e.preventDefault();
                $('#submit-button').prop('disabled', true);
                let formData = new FormData(document.getElementById('franchisee_registration_form'));

                $.ajax({
                    url: "{{route('vendor.register.step-three.store')}}",
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
@endsection
