@extends('layouts.admin')
@section('content')
    <div class="card">
        <div class="card-header">
            Add Buyer
        </div>
        <div class="card-body">
            <h6 class="text-danger">{{ trans('global.required_header') }}</h6>
            <form method="POST" action="{{ route("admin.users.store") }}" enctype="multipart/form-data"
                  autocomplete="off">
                @csrf
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label class="required" for="company_name">Company Name</label>
                            <input class="form-control {{ $errors->has('company_name') ? 'is-invalid' : '' }}" type="text"
                                   name="company_name" id="company_name" value="{{ old('company_name', '') }}" required>
                            @if($errors->has('company_name'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('company_name') }}
                                </div>
                            @endif
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label class="required" for="representative_name">Representative/Owner Name</label>
                            <input class="form-control {{ $errors->has('representative_name') ? 'is-invalid' : '' }}"
                                   type="text"
                                   name="representative_name" id="representative_name"
                                   value="{{ old('representative_name', '') }}" required>
                            @if($errors->has('representative_name'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('representative_name') }}
                                </div>
                            @endif
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label class="required" for="mobile">{{ trans('cruds.user.fields.mobile') }}</label>
                            <input class="form-control {{ $errors->has('mobile') ? 'is-invalid' : '' }}" type="number"
                                   maxlength="10"
                                   name="mobile" id="mobile" value="{{ old('mobile', '') }}" required>
                            @if($errors->has('mobile'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('mobile') }}
                                </div>
                            @endif
                            <span class="help-block">{{ trans('cruds.user.fields.mobile_helper') }}</span>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label class="required" for="email">{{ trans('cruds.user.fields.email') }}</label>
                            <input class="form-control {{ $errors->has('email') ? 'is-invalid' : '' }}" type="email"
                                   name="email" id="email" value="{{ old('email') }}" required>
                            @if($errors->has('email'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('email') }}
                                </div>
                            @endif
                            <span class="help-block">{{ trans('cruds.user.fields.email_helper') }}</span>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label
                                   for="gst_number">{{ trans('cruds.helpCenterProfile.fields.gst_number') }}</label>
                            <input class="form-control {{ $errors->has('gst_number') ? 'is-invalid' : '' }}"
                                   type="text"
                                   name="gst_number" id="gst_number" value="{{ old('gst_number') }}">
                            @if($errors->has('gst_number'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('gst_number') }}
                                </div>
                            @endif
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label class="required" for="pan_number">PAN Number</label>
                            <input class="form-control {{ $errors->has('gst_number') ? 'is-invalid' : '' }}"
                                   type="text"
                                   name="pan_number" id="pan_number" value="{{ old('pan_number') }}" required>
                            @if($errors->has('pan_number'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('pan_number') }}
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
                <div class="row">

                    <div class="col-6">
                        <div class="form-group">
                            <label class="required" for="billing_address">Billing Address</label>
                            <textarea class="form-control {{ $errors->has('billing_address') ? 'is-invalid' : '' }}"
                                      name="billing_address" id="billing_address"
                                      required>{{ old('billing_address') }}</textarea>
                            @if($errors->has('billing_address'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('billing_address') }}
                                </div>
                            @endif
                            <span
                                class="help-block">{{ trans('cruds.franchiseeProfile.fields.organization_address_helper') }}</span>
                        </div>
                        <div class="form-group">
                            <label for="billing_address_line_two">Billing Address Line 2</label>
                            <input
                                class="form-control {{ $errors->has('billing_address_line_two') ? 'is-invalid' : '' }}"
                                type="text" name="billing_address_line_two" id="billing_address_line_two"
                                value="{{ old('billing_address_line_two') }}">
                            @if($errors->has('billing_address_line_two'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('billing_address_line_two') }}
                                </div>
                            @endif
                        </div>

                        <div class="form-group">
                            <label class="required" for="billing_state_id">State</label>
                            <select
                                class="form-control select2 {{ $errors->has('billing_state_id') ? 'is-invalid' : '' }}"
                                name="billing_state_id" id="billing_state_id" required>
                                @foreach($states as $id => $state)
                                    <option
                                        value="{{ $id }}" {{ old('billing_state_id') == $id ? 'selected' : '' }}>{{ $state }}</option>
                                @endforeach
                            </select>
                            @if($errors->has('billing_state_id'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('billing_state_id') }}
                                </div>
                            @endif
                            <span
                                class="help-block">{{ trans('cruds.franchiseeProfile.fields.organization_state_helper') }}</span>
                        </div>
                        <div class="form-group">
                            <label class="required" for="billing_district_id">District</label>
                            <select
                                class="form-control select2 {{ $errors->has('billing_district_id') ? 'is-invalid' : '' }}"
                                name="billing_district_id" id="billing_district_id" required>

                            </select>
                            @if($errors->has('billing_district_id'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('billing_district_id') }}
                                </div>
                            @endif
                        </div>

                        <div class="form-group mb-3">
                            <label class="required"
                                   for="billing_pincode">Pincode</label>
                            <input class="form-control {{ $errors->has('billing_pincode') ? 'is-invalid' : '' }}"
                                   type="text"
                                   name="billing_pincode" id="billing_pincode"
                                   value="{{ old('billing_pincode') }}" required>
                            @if($errors->has('billing_pincode'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('billing_pincode') }}
                                </div>
                            @endif
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="mt-3">
                            <div class="form-check d-inline">
                                <input class="form-check-input shipping-address-type" type="radio" name="shipping_address_same" id="new" value="0" checked>
                                <label class="form-check-label" for="new">
                                    Add New
                                </label>
                            </div>
                            <div class="form-check d-inline">
                                <input class="form-check-input shipping-address-type" type="radio" name="shipping_address_same" id="same" value="1">
                                <label class="form-check-label" for="same">
                                    Same as billing address
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="required" for="shipping_address">Shipping Address</label>
                            <textarea class="form-control {{ $errors->has('shipping_address') ? 'is-invalid' : '' }}"
                                      name="shipping_address" id="shipping_address"
                                      required>{{ old('shipping_address') }}</textarea>
                            @if($errors->has('shipping_address'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('shipping_address') }}
                                </div>
                            @endif
                        </div>
                        <div class="form-group">
                            <label for="shipping_address_line_two">Shipping Address Line 2</label>
                            <input
                                class="form-control {{ $errors->has('shipping_address_line_two') ? 'is-invalid' : '' }}"
                                type="text" name="shipping_address_line_two" id="shipping_address_line_two"
                                value="{{ old('shipping_address_line_two') }}">
                            @if($errors->has('shipping_address_line_two'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('shipping_address_line_two') }}
                                </div>
                            @endif
                        </div>

                        <div class="form-group">
                            <label class="required" for="shipping_state_id">State</label>
                            <select
                                class="form-control select2 {{ $errors->has('shipping_state_id') ? 'is-invalid' : '' }}"
                                name="shipping_state_id" id="shipping_state_id" required>
                                @foreach($states as $id => $state)
                                    <option
                                        value="{{ $id }}" {{ old('shipping_state_id') == $id ? 'selected' : '' }}>{{ $state }}</option>
                                @endforeach
                            </select>
                            @if($errors->has('shipping_state_id'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('shipping_state_id') }}
                                </div>
                            @endif
                        </div>
                        <div class="form-group">
                            <label class="required" for="shipping_district_id">District</label>
                            <select
                                class="form-control select2 {{ $errors->has('shipping_district_id') ? 'is-invalid' : '' }}"
                                name="shipping_district_id" id="shipping_district_id" required>

                            </select>
                            @if($errors->has('shipping_district_id'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('shipping_district_id') }}
                                </div>
                            @endif
                        </div>

                        <div class="form-group mb-3">
                            <label class="required"
                                   for="shipping_pincode">Pincode</label>
                            <input class="form-control {{ $errors->has('shipping_pincode') ? 'is-invalid' : '' }}"
                                   type="text"
                                   name="shipping_pincode" id="shipping_pincode"
                                   value="{{ old('shipping_pincode') }}" required>
                            @if($errors->has('shipping_pincode'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('shipping_pincode') }}
                                </div>
                            @endif
                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <button class="btn btn-danger" type="submit">
                        {{ trans('global.save') }}
                    </button>
                </div>
            </form>
        </div>
    </div>
@endsection

@section('scripts')
    <script>
        $(document).ready(function () {

            $.ajaxSetup({headers: {'X-CSRF-TOKEN': '{{ csrf_token() }}'}});

            let billingState = "{{ old('billing_state_id') }}";
            let billingDistrict = "{{ old('billing_district_id') }}";

            let shippingState = "{{ old('shipping_state_id') }}";
            let shippingDistrict = "{{ old('shipping_district_id') }}";

            setTimeout(() => {
                $('#billing_state_id').val(billingState).trigger('change');
                $('#shipping_state_id').val(shippingState).trigger('change');
            }, 100)

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
                        }
                        $('#billing_district_id').val(billingDistrict).trigger('change');

                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(textStatus);
                    }
                });
            });

            $("#shipping_state_id").on("change", function () {

                $("#shipping_district_id").empty();
                $.ajax({
                    url: "{{route('ajax.district.list')}}",
                    type: 'POST',
                    data: {'state_id': $(this).val()},
                    dataType: 'json',
                    success: function (res) {
                        if (res.response === "success") {
                            let option = $($.parseHTML(`<option value="">Select District</option>`));
                            $("#shipping_district_id").append(option);
                            $.each(res.data, function (key, item) {
                                let $option = $($.parseHTML(`<option value="${item.id}">${item.name}</option>`));
                                $("#shipping_district_id").append($option);
                            });
                        }
                        $('#billing_district_id').val(shippingDistrict).trigger('change');
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(textStatus);
                    }
                });
            });

            $('.shipping-address-type').change(function (){
                if(this.value == 1){
                    $('#shipping_address, #shipping_address_line_two, #shipping_state_id, #shipping_district_id, #shipping_pincode').prop({
                        disabled: true,
                        required: false
                    })
                }else{
                    $('#shipping_address, #shipping_address_line_two, #shipping_state_id, #shipping_district_id, #shipping_pincode').prop({
                        disabled: false,
                        required: true
                    })
                }
            });
        });
    </script>
@endsection

