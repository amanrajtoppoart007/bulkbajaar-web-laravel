@extends('layouts.admin')
@section('content')

<div class="card">
    <div class="card-header">
        {{ trans('global.edit') }} {{ trans('cruds.franchisee.title_singular') }}
    </div>

    <div class="card-body">
        <h6 class="text-danger">{{ trans('global.required_header') }}</h6>
        <form method="POST" action="{{ route("admin.vendors.update", [$vendor->id]) }}" enctype="multipart/form-data">
            @method('PUT')
            @csrf
            <div class="row">
                <div class="col-6">
                    <div class="form-group">
                        <label class="required" for="company_name">Company Name</label>
                        <input class="form-control {{ $errors->has('company_name') ? 'is-invalid' : '' }}" type="text" name="company_name" id="company_name" value="{{ old('company_name', $profile->company_name ?? '') }}">
                        @if($errors->has('company_name'))
                            <div class="invalid-feedback">
                                {{ $errors->first('company_name') }}
                            </div>
                        @endif
                        <span class="help-block">{{ trans('cruds.franchisee.fields.name_helper') }}</span>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group mb-3">
                        <label class="required" for="representative_name">Representative/Owner Name</label>
                        <input class="form-control {{ $errors->has('representative_name') ? 'is-invalid' : '' }}"
                               type="text"
                               name="representative_name" id="representative_name" value="{{ $profile->representative_name ?? '' }}" required>
                        @if($errors->has('representative_name'))
                            <div class="invalid-feedback">
                                {{ $errors->first('representative_name') }}
                            </div>
                        @endif
                    </div>
                </div>

                <div class="col-6">
                    <div class="form-group">
                        <label class="required" for="email">{{ trans('cruds.franchisee.fields.email') }}</label>
                        <input class="form-control {{ $errors->has('email') ? 'is-invalid' : '' }}" type="email" name="email" id="email" value="{{ old('email', $vendor->email ?? '') }}" required>
                        @if($errors->has('email'))
                            <div class="invalid-feedback">
                                {{ $errors->first('email') }}
                            </div>
                        @endif
                        <span class="help-block">{{ trans('cruds.franchisee.fields.email_helper') }}</span>
                    </div>
                </div>

                <div class="col-6">
                    <div class="form-group">
                        <label class="required" for="mobile">{{ trans('cruds.franchisee.fields.mobile') }}</label>
                        <input class="form-control {{ $errors->has('mobile') ? 'is-invalid' : '' }}" type="text" name="mobile" id="mobile" value="{{ old('mobile', $vendor->mobile ?? '') }}" required>
                        @if($errors->has('mobile'))
                            <div class="invalid-feedback">
                                {{ $errors->first('mobile') }}
                            </div>
                        @endif
                        <span class="help-block">{{ trans('cruds.franchisee.fields.mobile_helper') }}</span>
                    </div>
                </div>


                <div class="col-6">
                    <div class="form-group">
                        <label class="required">User Type</label>
                        <select class="form-control {{ $errors->has('user_type') ? 'is-invalid' : '' }}" name="user_type" id="user_type" required>
                            <option value disabled {{ old('role', null) === null ? 'selected' : '' }}>{{ trans('global.pleaseSelect') }}</option>
                            @foreach(App\Models\Vendor::USER_TYPE_SELECT as $key => $label)
                                <option value="{{ $key }}" {{ old('role', $vendor->user_type) === (string) $key ? 'selected' : '' }}>{{ $label }}</option>
                            @endforeach
                        </select>
                        @if($errors->has('user_type'))
                            <div class="invalid-feedback">
                                {{ $errors->first('user_type') }}
                            </div>
                        @endif
                        <span class="help-block">{{ trans('cruds.franchisee.fields.role_helper') }}</span>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label class="required" for="gst_number">{{ trans('cruds.helpCenterProfile.fields.gst_number') }}</label>
                        <input class="form-control {{ $errors->has('gst_number') ? 'is-invalid' : '' }}"
                               type="text"
                               name="gst_number" id="gst_number" value="{{ $profile->gst_number ?? '' }}" required>
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
                               name="pan_number" id="pan_number" value="{{ $profile->pan_number ?? '' }}" required>
                        @if($errors->has('pan_number'))
                            <div class="invalid-feedback">
                                {{ $errors->first('pan_number') }}
                            </div>
                        @endif
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label class="required" for="bank_name">Bank Name</label>
                        <input class="form-control {{ $errors->has('bank_name') ? 'is-invalid' : '' }}" type="text" name="bank_name" id="bank_name" value="{{ old('bank_name', $profile->bank_name ?? '') }}">
                        @if($errors->has('bank_name'))
                            <div class="invalid-feedback">
                                {{ $errors->first('bank_name') }}
                            </div>
                        @endif
                        <span class="help-block">{{ trans('cruds.franchisee.fields.name_helper') }}</span>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group mb-3">
                        <label class="required" for="account_number">Account Number</label>
                        <input class="form-control {{ $errors->has('account_number') ? 'is-invalid' : '' }}"
                               type="text"
                               name="account_number" id="account_number" value="{{ old('account_number', $profile->account_number ?? '') }}" required>
                        @if($errors->has('account_number'))
                            <div class="invalid-feedback">
                                {{ $errors->first('account_number') }}
                            </div>
                        @endif
                    </div>
                </div>

                <div class="col-6">
                    <div class="form-group">
                        <label class="required" for="account_holder_name">Account Holder Name</label>
                        <input class="form-control {{ $errors->has('account_holder_name') ? 'is-invalid' : '' }}" type="text" name="account_holder_name" id="account_holder_name" value="{{ old('account_holder_name', $profile->account_holder_name ?? '') }}" required>
                        @if($errors->has('account_holder_name'))
                            <div class="invalid-feedback">
                                {{ $errors->first('account_holder_name') }}
                            </div>
                        @endif
                    </div>
                </div>

                <div class="col-6">
                    <div class="form-group">
                        <label class="required" for="ifsc_code">IFSC Code</label>
                        <input class="form-control {{ $errors->has('ifsc_code') ? 'is-invalid' : '' }}" type="text" name="ifsc_code" id="ifsc_code" value="{{ old('ifsc_code', $profile->ifsc_code ?? '') }}" required>
                        @if($errors->has('ifsc_code'))
                            <div class="invalid-feedback">
                                {{ $errors->first('ifsc_code') }}
                            </div>
                        @endif
                    </div>
                </div>
            </div>
            <div class="row">

                <div class="col-6">
                    <div class="form-group">
                        <label class="required" for="billing_address">Billing Address</label>
                        <textarea class="form-control {{ $errors->has('billing_address') ? 'is-invalid' : '' }}" name="billing_address" id="billing_address" required>{{ old('billing_address', $profile->billing_address ?? '') }}</textarea>
                        @if($errors->has('billing_address'))
                            <div class="invalid-feedback">
                                {{ $errors->first('billing_address') }}
                            </div>
                        @endif
                        <span class="help-block">{{ trans('cruds.franchiseeProfile.fields.organization_address_helper') }}</span>
                    </div>
                    <div class="form-group">
                        <label for="billing_address_line_two">Billing Address Line 2</label>
                        <input class="form-control {{ $errors->has('billing_address_line_two') ? 'is-invalid' : '' }}" type="text" name="billing_address_line_two" id="billing_address_line_two" value="{{ old('billing_address_line_two', $profile->billing_address_line_two ?? '') }}">
                        @if($errors->has('billing_address_line_two'))
                            <div class="invalid-feedback">
                                {{ $errors->first('billing_address_line_two') }}
                            </div>
                        @endif
                        <span class="help-block">{{ trans('cruds.franchiseeProfile.fields.organization_address_line_two_helper') }}</span>
                    </div>

                    <div class="form-group">
                        <label class="required" for="billing_state_id">State</label>
                        <select class="form-control select2 {{ $errors->has('billing_state_id') ? 'is-invalid' : '' }}" name="billing_state_id" id="billing_state_id" required>
                            @foreach($states as $id => $state)
                                <option value="{{ $id }}" {{ (old('billing_state_id') ? old('billing_state_id') : $profile->billing_state_id ?? '') == $id ? 'selected' : '' }}>{{ $state }}</option>
                            @endforeach
                        </select>
                        @if($errors->has('billing_state_id'))
                            <div class="invalid-feedback">
                                {{ $errors->first('billing_state_id') }}
                            </div>
                        @endif
                        <span class="help-block">{{ trans('cruds.franchiseeProfile.fields.organization_state_helper') }}</span>
                    </div>
                    <div class="form-group">
                        <label class="required" for="billing_district_id">District</label>
                        <select class="form-control select2 {{ $errors->has('billing_district_id') ? 'is-invalid' : '' }}" name="billing_district_id" id="billing_district_id" required>
                            @foreach($districts as $id => $district)
                                <option value="{{ $id }}" {{ (old('billing_district_id') ? old('billing_district_id') : $profile->billing_district_id ?? '') == $id ? 'selected' : '' }}>{{ $district }}</option>
                            @endforeach
                        </select>
                        @if($errors->has('billing_district_id'))
                            <div class="invalid-feedback">
                                {{ $errors->first('billing_district_id') }}
                            </div>
                        @endif
                        <span class="help-block">{{ trans('cruds.franchiseeProfile.fields.organization_city_helper') }}</span>
                    </div>

                    <div class="form-group mb-3">
                        <label class="required"
                               for="billing_pincode">Pincode</label>
                        <input class="form-control {{ $errors->has('billing_pincode') ? 'is-invalid' : '' }}"
                               type="text"
                               name="billing_pincode" id="billing_pincode" value="{{ $profile->billing_pincode ?? '' }}" required>
                        @if($errors->has('billing_pincode'))
                            <div class="invalid-feedback">
                                {{ $errors->first('billing_pincode') }}
                            </div>
                        @endif
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label class="required" for="pickup_address">Pickup Address</label>
                        <textarea class="form-control {{ $errors->has('pickup_address') ? 'is-invalid' : '' }}" name="pickup_address" id="pickup_address" required>{{ old('pickup_address', $profile->pickup_address ?? '') }}</textarea>
                        @if($errors->has('pickup_address'))
                            <div class="invalid-feedback">
                                {{ $errors->first('pickup_address') }}
                            </div>
                        @endif
                        <span class="help-block">{{ trans('cruds.franchiseeProfile.fields.organization_address_helper') }}</span>
                    </div>
                    <div class="form-group">
                        <label for="pickup_address_line_two">Pickup Address Line 2</label>
                        <input class="form-control {{ $errors->has('pickup_address_line_two') ? 'is-invalid' : '' }}" type="text" name="pickup_address_line_two" id="pickup_address_line_two" value="{{ old('pickup_address_line_two', $profile->pickup_address_line_two ?? '') }}">
                        @if($errors->has('pickup_address_line_two'))
                            <div class="invalid-feedback">
                                {{ $errors->first('pickup_address_line_two') }}
                            </div>
                        @endif
                        <span class="help-block">{{ trans('cruds.franchiseeProfile.fields.organization_address_line_two_helper') }}</span>
                    </div>

                    <div class="form-group">
                        <label class="required" for="pickup_state_id">State</label>
                        <select class="form-control select2 {{ $errors->has('pickup_state_id') ? 'is-invalid' : '' }}" name="pickup_state_id" id="pickup_state_id" required>
                            @foreach($states as $id => $state)
                                <option value="{{ $id }}" {{ (old('pickup_state_id') ? old('pickup_state_id') : $profile->pickup_state_id ?? '') == $id ? 'selected' : '' }}>{{ $state }}</option>
                            @endforeach
                        </select>
                        @if($errors->has('pickup_state_id'))
                            <div class="invalid-feedback">
                                {{ $errors->first('pickup_state_id') }}
                            </div>
                        @endif
                        <span class="help-block">{{ trans('cruds.franchiseeProfile.fields.organization_state_helper') }}</span>
                    </div>
                    <div class="form-group">
                        <label class="required" for="pickup_district_id">District</label>
                        <select class="form-control select2 {{ $errors->has('pickup_district_id') ? 'is-invalid' : '' }}" name="pickup_district_id" id="pickup_district_id" required>
                            @foreach($districts as $id => $district)
                                <option value="{{ $id }}" {{ (old('billing_district_id') ? old('billing_district_id') : $profile->billing_district_id ?? '') == $id ? 'selected' : '' }}>{{ $district }}</option>
                            @endforeach
                        </select>
                        @if($errors->has('pickup_district_id'))
                            <div class="invalid-feedback">
                                {{ $errors->first('pickup_district_id') }}
                            </div>
                        @endif
                        <span class="help-block">{{ trans('cruds.franchiseeProfile.fields.organization_city_helper') }}</span>
                    </div>

                    <div class="form-group mb-3">
                        <label class="required"
                               for="pickup_pincode">Pincode</label>
                        <input class="form-control {{ $errors->has('pickup_pincode') ? 'is-invalid' : '' }}"
                               type="text"
                               name="pickup_pincode" id="pickup_pincode" value="{{ $profile->pickup_pincode ?? '' }}" required>
                        @if($errors->has('pickup_pincode'))
                            <div class="invalid-feedback">
                                {{ $errors->first('pickup_pincode') }}
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
    @parent
    <script>
        $(function () {

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
                            $("#billing_district_id").select2();
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
                            $("#pickup_district_id").select2();
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
