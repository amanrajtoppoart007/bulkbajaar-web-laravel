@extends('layouts.admin')
@section('content')

    <div class="card">
        <div class="card-header">
            {{ trans('global.edit') }} {{ trans('cruds.helpCenterProfile.title_singular') }}
        </div>

        <div class="card-body">
            <form method="POST" action="{{ route("admin.help-center-profiles.update", [$helpCenterProfile->id]) }}"
                  enctype="multipart/form-data">
                @method('PUT')
                @csrf
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label class="required"
                                   for="help_center_id">{{ trans('cruds.helpCenterProfile.fields.help_center') }}</label>
                            <input type="hidden" name="help_center_id" value="{{ $helpCenterProfile->help_center_id }}">
                            <select class="form-control select2 {{ $errors->has('help_center') ? 'is-invalid' : '' }}"
                                     id="help_center_id" disabled>
                                @foreach($help_centers as $id => $help_center)
                                    <option
                                        value="{{ $id }}" {{ (old('help_center_id') ? old('help_center_id') : $helpCenterProfile->help_center->id ?? '') == $id ? 'selected' : '' }}>{{ $help_center }}</option>
                                @endforeach
                            </select>
                            @if($errors->has('help_center'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('help_center') }}
                                </div>
                            @endif
                            <span
                                class="help-block">{{ trans('cruds.helpCenterProfile.fields.help_center_helper') }}</span>
                        </div>
                    </div>

                    <div class="col-6">
                        <div class="form-group">
                            <label class="required"
                                   for="primary_contact">{{ trans('cruds.helpCenterProfile.fields.primary_contact') }}</label>
                            <input class="form-control {{ $errors->has('primary_contact') ? 'is-invalid' : '' }}"
                                   type="text" name="primary_contact" id="primary_contact"
                                   value="{{ old('primary_contact', $helpCenterProfile->primary_contact) }}" required>
                            @if($errors->has('primary_contact'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('primary_contact') }}
                                </div>
                            @endif
                            <span
                                class="help-block">{{ trans('cruds.helpCenterProfile.fields.primary_contact_helper') }}</span>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label class="required"
                                   for="secondary_contact">{{ trans('cruds.helpCenterProfile.fields.secondary_contact') }}</label>
                            <input class="form-control {{ $errors->has('secondary_contact') ? 'is-invalid' : '' }}"
                                   type="text" name="secondary_contact" id="secondary_contact"
                                   value="{{ old('secondary_contact', $helpCenterProfile->secondary_contact) }}"
                                   required>
                            @if($errors->has('secondary_contact'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('secondary_contact') }}
                                </div>
                            @endif
                            <span
                                class="help-block">{{ trans('cruds.helpCenterProfile.fields.secondary_contact_helper') }}</span>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label class="required"
                                   for="email">{{ trans('cruds.helpCenterProfile.fields.email') }}</label>
                            <input class="form-control {{ $errors->has('email') ? 'is-invalid' : '' }}" type="text"
                                   name="email" id="email" value="{{ old('email', $helpCenterProfile->email) }}"
                                   required>
                            @if($errors->has('email'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('email') }}
                                </div>
                            @endif
                            <span class="help-block">{{ trans('cruds.helpCenterProfile.fields.email_helper') }}</span>
                        </div>
                    </div>

                    <div class="col-6">
                        <div class="form-group">
                            <label for="work_area">{{ trans('cruds.helpCenterProfile.fields.work_area') }}</label>
                            <input class="form-control {{ $errors->has('work_area') ? 'is-invalid' : '' }}" type="text"
                                   name="work_area" id="work_area"
                                   value="{{ old('work_area', $helpCenterProfile->work_area) }}">
                            @if($errors->has('work_area'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('work_area') }}
                                </div>
                            @endif
                            <span
                                class="help-block">{{ trans('cruds.helpCenterProfile.fields.work_area_helper') }}</span>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label for="gst_number">{{ trans('cruds.helpCenterProfile.fields.gst_number') }}</label>
                            <input class="form-control {{ $errors->has('gst_number') ? 'is-invalid' : '' }}" type="text"
                                   name="gst_number" id="gst_number"
                                   value="{{ old('gst_number', $helpCenterProfile->gst_number) }}">
                            @if($errors->has('gst_number'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('gst_number') }}
                                </div>
                            @endif
                            <span
                                class="help-block">{{ trans('cruds.helpCenterProfile.fields.gst_number_helper') }}</span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <h5>{{ trans('global.organisation_details') }}</h5>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label
                                        for="organization_name">{{ trans('cruds.helpCenterProfile.fields.organization_name') }}</label>
                                    <input
                                        class="form-control {{ $errors->has('organization_name') ? 'is-invalid' : '' }}"
                                        type="text" name="organization_name" id="organization_name"
                                        value="{{ old('organization_name', $helpCenterProfile->organization_name) }}">
                                    @if($errors->has('organization_name'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('organization_name') }}
                                        </div>
                                    @endif
                                    <span
                                        class="help-block">{{ trans('cruds.helpCenterProfile.fields.organization_name_helper') }}</span>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label
                                        for="organization_address">{{ trans('cruds.helpCenterProfile.fields.organization_address') }}</label>
                                    <textarea
                                        class="form-control {{ $errors->has('organization_address') ? 'is-invalid' : '' }}"
                                        name="organization_address"
                                        id="organization_address">{{ old('organization_address', $helpCenterProfile->organization_address) }}</textarea>
                                    @if($errors->has('organization_address'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('organization_address') }}
                                        </div>
                                    @endif
                                    <span
                                        class="help-block">{{ trans('cruds.helpCenterProfile.fields.organization_address_helper') }}</span>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label
                                        for="organization_address_line_two">{{ trans('cruds.helpCenterProfile.fields.organization_address_line_two') }}</label>
                                    <input
                                        class="form-control {{ $errors->has('organization_address_line_two') ? 'is-invalid' : '' }}"
                                        type="text" name="organization_address_line_two"
                                        id="organization_address_line_two"
                                        value="{{ old('organization_address_line_two', $helpCenterProfile->organization_address_line_two) }}">
                                    @if($errors->has('organization_address_line_two'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('organization_address_line_two') }}
                                        </div>
                                    @endif
                                    <span
                                        class="help-block">{{ trans('cruds.helpCenterProfile.fields.organization_address_line_two_helper') }}</span>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label
                                        for="organization_street">{{ trans('cruds.helpCenterProfile.fields.organization_street') }}</label>
                                    <input
                                        class="form-control {{ $errors->has('organization_street') ? 'is-invalid' : '' }}"
                                        type="text" name="organization_street" id="organization_street"
                                        value="{{ old('organization_street', $helpCenterProfile->organization_street) }}">
                                    @if($errors->has('organization_street'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('organization_street') }}
                                        </div>
                                    @endif
                                    <span
                                        class="help-block">{{ trans('cruds.helpCenterProfile.fields.organization_street_helper') }}</span>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label
                                        for="organization_state_id">{{ trans('cruds.helpCenterProfile.fields.organization_state') }}</label>
                                    <select
                                        class="form-control select2 {{ $errors->has('organization_state_id') ? 'is-invalid' : '' }}"
                                        name="organization_state_id" id="organization_state_id">
                                        @foreach($organization_states as $id => $organization_state)
                                            <option
                                                value="{{ $id }}" {{ (old('organization_state_id') ? old('organization_state_id') : $helpCenterProfile->organization_state->id ?? '') == $id ? 'selected' : '' }}>{{ $organization_state }}</option>
                                        @endforeach
                                    </select>
                                    @if($errors->has('organization_state_id'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('organization_state_id') }}
                                        </div>
                                    @endif
                                    <span
                                        class="help-block">{{ trans('cruds.helpCenterProfile.fields.organization_state_helper') }}</span>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label
                                        for="organization_district_id">{{ trans('cruds.helpCenterProfile.fields.organization_district') }}</label>
                                    <select
                                        class="form-control select2 {{ $errors->has('organization_district_id') ? 'is-invalid' : '' }}"
                                        name="organization_district_id" id="organization_district_id">
                                        @foreach($organization_districts as $id => $organization_district)
                                            <option
                                                value="{{ $id }}" {{ (old('organization_district_id') ? old('organization_district_id') : $helpCenterProfile->organization_district->id ?? '') == $id ? 'selected' : '' }}>{{ $organization_district }}</option>
                                        @endforeach
                                    </select>
                                    @if($errors->has('organization_district_id'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('organization_district_id') }}
                                        </div>
                                    @endif
                                    <span
                                        class="help-block">{{ trans('cruds.helpCenterProfile.fields.organization_district_helper') }}</span>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label
                                        for="organization_city_id">{{ trans('cruds.helpCenterProfile.fields.organization_city') }}</label>
                                    <select
                                        class="form-control select2 {{ $errors->has('organization_city_id') ? 'is-invalid' : '' }}"
                                        name="organization_city_id" id="organization_city_id">
                                        @foreach($organization_cities as $id => $organization_city)
                                            <option
                                                value="{{ $id }}" {{ (old('organization_city_id') ? old('organization_city_id') : $helpCenterProfile->organization_city->id ?? '') == $id ? 'selected' : '' }}>{{ $organization_city }}</option>
                                        @endforeach
                                    </select>
                                    @if($errors->has('organization_city_id'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('organization_city_id') }}
                                        </div>
                                    @endif
                                    <span
                                        class="help-block">{{ trans('cruds.helpCenterProfile.fields.organization_city_helper') }}</span>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label
                                        for="organization_pincode_id">{{ trans('cruds.helpCenterProfile.fields.organization_pincode') }}</label>
                                    <select
                                        class="form-control select2 {{ $errors->has('organization_pincode_id') ? 'is-invalid' : '' }}"
                                        name="organization_pincode_id" id="organization_pincode_id">
                                        @foreach($pincodes as $id => $pincode)
                                            <option
                                                value="{{ $id }}" {{ (old('organization_pincode_id') ? old('organization_pincode_id') : $helpCenterProfile->organization_pincode->id ?? '') == $id ? 'selected' : '' }}>{{ $pincode }}</option>
                                        @endforeach
                                    </select>
                                    @if($errors->has('organization_pincode_id'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('organization_pincode_id') }}
                                        </div>
                                    @endif
                                    <span
                                        class="help-block">{{ trans('cruds.helpCenterProfile.fields.organization_pincode_helper') }}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="row">
                            <h5>{{ trans('global.representative_details') }}</h5>
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label class="required"
                                               for="representative_name">{{ trans('cruds.helpCenterProfile.fields.representative_name') }}</label>
                                        <input
                                            class="form-control {{ $errors->has('representative_name') ? 'is-invalid' : '' }}"
                                            type="text" name="representative_name" id="representative_name"
                                            value="{{ old('representative_name', $helpCenterProfile->representative_name) }}"
                                            required>
                                        @if($errors->has('representative_name'))
                                            <div class="invalid-feedback">
                                                {{ $errors->first('representative_name') }}
                                            </div>
                                        @endif
                                        <span
                                            class="help-block">{{ trans('cruds.helpCenterProfile.fields.representative_name_helper') }}</span>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label
                                            for="representative_designation">{{ trans('cruds.helpCenterProfile.fields.representative_designation') }}</label>
                                        <input
                                            class="form-control {{ $errors->has('representative_designation') ? 'is-invalid' : '' }}"
                                            type="text" name="representative_designation"
                                            id="representative_designation"
                                            value="{{ old('representative_designation', $helpCenterProfile->representative_designation) }}">
                                        @if($errors->has('representative_designation'))
                                            <div class="invalid-feedback">
                                                {{ $errors->first('representative_designation') }}
                                            </div>
                                        @endif
                                        <span
                                            class="help-block">{{ trans('cruds.helpCenterProfile.fields.representative_designation_helper') }}</span>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label
                                            class="required"
                                            for="representative_address">{{ trans('cruds.helpCenterProfile.fields.representative_address') }}</label>
                                        <textarea
                                            class="form-control {{ $errors->has('representative_address') ? 'is-invalid' : '' }}"
                                            name="representative_address"
                                            id="representative_address" required>{{ old('representative_address', $helpCenterProfile->representative_address ?? '') }}</textarea>
                                        @if($errors->has('representative_address'))
                                            <div class="invalid-feedback">
                                                {{ $errors->first('representative_address') }}
                                            </div>
                                        @endif
                                        <span
                                            class="help-block">{{ trans('cruds.helpCenterProfile.fields.representative_address_helper') }}</span>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label
                                            for="representative_address_line_two">{{ trans('cruds.helpCenterProfile.fields.representative_address_line_two') }}</label>
                                        <textarea
                                            class="form-control {{ $errors->has('representative_address_line_two') ? 'is-invalid' : '' }}"
                                            name="representative_address_line_two"
                                            id="representative_address_line_two">{{ old('representative_address_line_two', $helpCenterProfile->representative_address_line_two ?? '') }}</textarea>
                                        @if($errors->has('representative_address_line_two'))
                                            <div class="invalid-feedback">
                                                {{ $errors->first('representative_address_line_two') }}
                                            </div>
                                        @endif
                                        <span
                                            class="help-block">{{ trans('cruds.helpCenterProfile.fields.representative_address_line_two_helper') }}</span>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label class="required"
                                            for="representative_street">{{ trans('cruds.helpCenterProfile.fields.representative_street') }}</label>
                                        <input
                                            class="form-control {{ $errors->has('representative_street') ? 'is-invalid' : '' }}"
                                            type="text" name="representative_street" id="representative_street"
                                            value="{{ old('representative_street', $helpCenterProfile->representative_street ?? '') }}"
                                        required>
                                        @if($errors->has('representative_street'))
                                            <div class="invalid-feedback">
                                                {{ $errors->first('representative_street') }}
                                            </div>
                                        @endif
                                        <span
                                            class="help-block">{{ trans('cruds.helpCenterProfile.fields.representative_street_helper') }}</span>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label class="required"
                                               for="representative_state_id">{{ trans('cruds.helpCenterProfile.fields.representative_state') }}</label>
                                        <select
                                            class="form-control select2 {{ $errors->has('representative_state_id') ? 'is-invalid' : '' }}"
                                            name="representative_state_id" id="representative_state_id" required>
                                            @foreach($representative_states as $id => $representative_state)
                                                <option
                                                    value="{{ $id }}" {{ (old('representative_state_id') ? old('representative_state_id') : $helpCenterProfile->representative_state->id ?? '') == $id ? 'selected' : '' }}>{{ $representative_state }}</option>
                                            @endforeach
                                        </select>
                                        @if($errors->has('representative_state_id'))
                                            <div class="invalid-feedback">
                                                {{ $errors->first('representative_state_id') }}
                                            </div>
                                        @endif
                                        <span
                                            class="help-block">{{ trans('cruds.helpCenterProfile.fields.representative_state_helper') }}</span>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label class="required"
                                               for="representative_district_id">{{ trans('cruds.helpCenterProfile.fields.representative_district') }}</label>
                                        <select
                                            class="form-control select2 {{ $errors->has('representative_district_id') ? 'is-invalid' : '' }}"
                                            name="representative_district_id" id="representative_district_id" required>
                                            @foreach($representative_districts as $id => $representative_district)
                                                <option
                                                    value="{{ $id }}" {{ (old('representative_district_id') ? old('representative_district_id') : $helpCenterProfile->representative_district->id ?? '') == $id ? 'selected' : '' }}>{{ $representative_district }}</option>
                                            @endforeach
                                        </select>
                                        @if($errors->has('representative_district_id'))
                                            <div class="invalid-feedback">
                                                {{ $errors->first('representative_district_id') }}
                                            </div>
                                        @endif
                                        <span
                                            class="help-block">{{ trans('cruds.helpCenterProfile.fields.representative_district_helper') }}</span>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label class="required"
                                               for="representative_city_id">{{ trans('cruds.helpCenterProfile.fields.representative_city') }}</label>
                                        <select
                                            class="form-control select2 {{ $errors->has('representative_city_id') ? 'is-invalid' : '' }}"
                                            name="representative_city_id" id="representative_city_id" required>
                                            @foreach($representative_cities as $id => $representative_city)
                                                <option
                                                    value="{{ $id }}" {{ (old('representative_city_id') ? old('representative_city_id') : $helpCenterProfile->representative_city->id ?? '') == $id ? 'selected' : '' }}>{{ $representative_city }}</option>
                                            @endforeach
                                        </select>
                                        @if($errors->has('representative_city'))
                                            <div class="invalid-feedback">
                                                {{ $errors->first('representative_city') }}
                                            </div>
                                        @endif
                                        <span
                                            class="help-block">{{ trans('cruds.helpCenterProfile.fields.representative_city_helper') }}</span>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label class="required"
                                               for="representative_pincode_id">{{ trans('cruds.helpCenterProfile.fields.representative_city') }}</label>
                                        <select
                                            class="form-control select2 {{ $errors->has('representative_pincode_id') ? 'is-invalid' : '' }}"
                                            name="representative_pincode_id" id="representative_pincode_id" required>
                                            @foreach($pincodes as $id => $pincode)
                                                <option
                                                    value="{{ $id }}" {{ (old('representative_pincode_id') ? old('representative_city_id') : $helpCenterProfile->representative_pincode->id ?? '') == $id ? 'selected' : '' }}>{{ $pincode }}</option>
                                            @endforeach
                                        </select>
                                        @if($errors->has('representative_pincode_id'))
                                            <div class="invalid-feedback">
                                                {{ $errors->first('representative_pincode_id') }}
                                            </div>
                                        @endif
                                        <span
                                            class="help-block">{{ trans('cruds.helpCenterProfile.fields.representative_city_helper') }}</span>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label for="image">{{ trans('cruds.helpCenterProfile.fields.image') }}</label>
                            <div class="needsclick dropzone {{ $errors->has('image') ? 'is-invalid' : '' }}"
                                 id="image-dropzone">
                            </div>
                            @if($errors->has('image'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('image') }}
                                </div>
                            @endif
                            <span class="help-block">{{ trans('cruds.helpCenterProfile.fields.image_helper') }}</span>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label class="required" for="aadhaar_card">{{ trans('cruds.helpCenterProfile.fields.aadhaar_card') }}</label>
                            <div class="needsclick dropzone {{ $errors->has('aadhaar_card') ? 'is-invalid' : '' }}"
                                 id="aadhaar_card-dropzone">
                            </div>
                            @if($errors->has('aadhaar_card'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('aadhaar_card') }}
                                </div>
                            @endif
                            <span
                                class="help-block">{{ trans('cruds.helpCenterProfile.fields.aadhaar_card_helper') }}</span>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label class="required" for="pan_card">{{ trans('cruds.helpCenterProfile.fields.pan_card') }}</label>
                            <div class="needsclick dropzone {{ $errors->has('pan_card') ? 'is-invalid' : '' }}"
                                 id="pan_card-dropzone">
                            </div>
                            @if($errors->has('pan_card'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('pan_card') }}
                                </div>
                            @endif
                            <span
                                class="help-block">{{ trans('cruds.helpCenterProfile.fields.pan_card_helper') }}</span>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label class="required"
                                for="address_proof">{{ trans('cruds.helpCenterProfile.fields.address_proof') }}</label>
                            <div class="needsclick dropzone {{ $errors->has('address_proof') ? 'is-invalid' : '' }}"
                                 id="address_proof-dropzone">
                            </div>
                            @if($errors->has('address_proof'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('address_proof') }}
                                </div>
                            @endif
                            <span
                                class="help-block">{{ trans('cruds.helpCenterProfile.fields.address_proof_helper') }}</span>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label
                                        for="registration_fees">{{ trans('cruds.helpCenterProfile.fields.registration_fees') }}</label>
                                    <input
                                        class="form-control {{ $errors->has('registration_fees') ? 'is-invalid' : '' }}"
                                        type="number" name="registration_fees" id="registration_fees"
                                        value="{{ old('registration_fees', $helpCenterProfile->registration_fees) }}"
                                        step="0.01">
                                    @if($errors->has('registration_fees'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('registration_fees') }}
                                        </div>
                                    @endif
                                    <span
                                        class="help-block">{{ trans('cruds.helpCenterProfile.fields.registration_fees_helper') }}</span>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label>{{ trans('cruds.helpCenterProfile.fields.payment_method') }}</label>
                                    @foreach(App\Models\HelpCenterProfile::PAYMENT_METHOD_RADIO as $key => $label)
                                        <div
                                            class="form-check {{ $errors->has('payment_method') ? 'is-invalid' : '' }}">
                                            <input class="form-check-input" type="radio" id="payment_method_{{ $key }}"
                                                   name="payment_method" value="{{ $key }}"
                                                   {{ old('payment_method', $helpCenterProfile->payment_method) === (string) $key ? 'checked' : '' }}>
                                            <label class="form-check-label"
                                                   for="payment_method_{{ $key }}">{{ $label }}</label>
                                        </div>
                                    @endforeach
                                    @if($errors->has('payment_method'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('payment_method') }}
                                        </div>
                                    @endif
                                    <span
                                        class="help-block">{{ trans('cruds.helpCenterProfile.fields.payment_method_helper') }}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label
                                   for="signature">{{ trans('cruds.helpCenterProfile.fields.signature') }}</label>
                            <div class="needsclick dropzone {{ $errors->has('signature') ? 'is-invalid' : '' }}"
                                 id="signature-dropzone">
                            </div>
                            @if($errors->has('signature'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('signature') }}
                                </div>
                            @endif
                            <span
                                class="help-block">{{ trans('cruds.helpCenterProfile.fields.signature_helper') }}</span>
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


            let orgState = "{{ old('organization_state_id', $helpCenterProfile->organization_state_id) ?? '' }}";
            let orgDistrict = "{{ old('organization_district_id', $helpCenterProfile->organization_district_id) ?? '' }}";
            let orgBlock = "{{ old('organization_city_id', $helpCenterProfile->organization_city_id) ?? '' }}";
            let orgPincode = "{{ old('organization_pincode_id', $helpCenterProfile->organization_pincode_id) ?? '' }}";

            let repState = "{{ old('representative_state_id', $helpCenterProfile->representative_state_id) ?? '' }}";
            let repDistrict = "{{ old('representative_district_id', $helpCenterProfile->representative_district_id) ?? '' }}";
            let repBlock = "{{ old('representative_city_id', $helpCenterProfile->representative_city_id) ?? '' }}";
            let repPincode = "{{ old('representative_pincode_id', $helpCenterProfile->representative_pincode_id) ?? '' }}";

            setTimeout(() => {
                $("#organization_state_id").val(orgState).trigger('change');
                $("#representative_state_id").val(repState).trigger('change');
            }, 100);

            $("#organization_state_id").on("change", function () {

                $("#organization_district_id").empty();
                $.ajax({
                    url: "{{route('ajax.district.list')}}",
                    type: 'POST',
                    data: {'state_id': $(this).val()},
                    dataType: 'json',
                    success: function (res) {
                        if (res.response === "success") {
                            let option = $($.parseHTML(`<option value="">Select District</option>`));
                            $("#organization_district_id").append(option);
                            $.each(res.data, function (key, item) {
                                let $option = $($.parseHTML(`<option value="${item.id}">${item.name}</option>`));
                                $("#organization_district_id").append($option);
                            });
                        }
                        $('#organization_district_id').val(orgDistrict).trigger('change');
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(textStatus);
                    }
                });
            });

            $("#organization_district_id").on("change", function () {

                $("#organization_city_id").empty();
                $.ajax({
                    url: "{{route('ajax.block.list')}}",
                    type: 'POST',
                    data: {'district_id': $(this).val()},
                    dataType: 'json',
                    success: function (res) {
                        if (res.response === "success") {
                            let option = $($.parseHTML(`<option value="">Select Block</option>`));
                            $("#organization_city_id").append(option);
                            $.each(res.data, function (key, item) {
                                let $option = $($.parseHTML(`<option value="${item.id}">${item.name}</option>`));
                                $("#organization_city_id").append($option);
                            });
                        }
                        $('#organization_city_id').val(orgBlock).trigger('change');
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(textStatus);
                    }
                });
            });

            $("#organization_city_id").on("change", function () {

                $("#organization_pincode_id").empty();
                $.ajax({
                    url: "{{route('ajax.pincode.list')}}",
                    type: 'POST',
                    data: {'block_id': $(this).val()},
                    dataType: 'json',
                    success: function (res) {
                        if (res.response === "success") {
                            let option = $($.parseHTML(`<option value="">Select Pincode</option>`));
                            $("#organization_pincode_id").append(option);
                            $.each(res.data, function (key, item) {
                                let $option = $($.parseHTML(`<option value="${item.id}">${item.pincode}</option>`));
                                $("#organization_pincode_id").append($option);
                            });
                        }
                        $('#organization_pincode_id').val(orgPincode).trigger('change');
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(textStatus);
                    }
                });
            });
            $("#representative_state_id").on("change", function () {

                $("#representative_district_id").empty();
                $.ajax({
                    url: "{{route('ajax.district.list')}}",
                    type: 'POST',
                    data: {'state_id': $(this).val()},
                    dataType: 'json',
                    success: function (res) {
                        if (res.response === "success") {
                            let option = $($.parseHTML(`<option value="">Select District</option>`));
                            $("#representative_district_id").append(option);
                            $.each(res.data, function (key, item) {
                                let $option = $($.parseHTML(`<option value="${item.id}">${item.name}</option>`));
                                $("#representative_district_id").append($option);
                            });
                        }
                        $('#representative_district_id').val(repDistrict).trigger('change');
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(textStatus);
                    }
                });
            });

            $("#representative_district_id").on("change", function () {

                $("#representative_city_id").empty();
                $.ajax({
                    url: "{{route('ajax.block.list')}}",
                    type: 'POST',
                    data: {'district_id': $(this).val()},
                    dataType: 'json',
                    success: function (res) {
                        if (res.response === "success") {
                            let option = $($.parseHTML(`<option value="">Select Block</option>`));
                            $("#representative_city_id").append(option);
                            $.each(res.data, function (key, item) {
                                let $option = $($.parseHTML(`<option value="${item.id}">${item.name}</option>`));
                                $("#representative_city_id").append($option);
                            });
                        }
                        $('#representative_city_id').val(repBlock).trigger('change');
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(textStatus);
                    }
                });
            });

            $("#representative_city_id").on("change", function () {

                $("#representative_pincode_id").empty();
                $.ajax({
                    url: "{{route('ajax.pincode.list')}}",
                    type: 'POST',
                    data: {'block_id': $(this).val()},
                    dataType: 'json',
                    success: function (res) {
                        if (res.response === "success") {
                            let option = $($.parseHTML(`<option value="">Select Pincode</option>`));
                            $("#representative_pincode_id").append(option);
                            $.each(res.data, function (key, item) {
                                let $option = $($.parseHTML(`<option value="${item.id}">${item.pincode}</option>`));
                                $("#representative_pincode_id").append($option);
                            });
                        }
                        $('#representative_pincode_id').val(repPincode).trigger('change');
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(textStatus);
                    }
                });
            });
        });
    </script>
    <script>
        Dropzone.options.imageDropzone = {
            url: '{{ route('admin.help-center-profiles.storeMedia') }}',
            maxFilesize: 2, // MB
            acceptedFiles: '.jpeg,.jpg,.png,.gif',
            maxFiles: 1,
            addRemoveLinks: true,
            headers: {
                'X-CSRF-TOKEN': "{{ csrf_token() }}"
            },
            params: {
                size: 2,
                width: 4096,
                height: 4096
            },
            success: function (file, response) {
                $('form').find('input[name="image"]').remove()
                $('form').append('<input type="hidden" name="image" value="' + response.name + '">')
            },
            removedfile: function (file) {
                file.previewElement.remove()
                if (file.status !== 'error') {
                    $('form').find('input[name="image"]').remove()
                    this.options.maxFiles = this.options.maxFiles + 1
                }
            },
            init: function () {
                @if(isset($helpCenterProfile) && $helpCenterProfile->image)
                var file = {!! json_encode($helpCenterProfile->image) !!}
                this.options.addedfile.call(this, file)
                this.options.thumbnail.call(this, file, file.preview)
                file.previewElement.classList.add('dz-complete')
                $('form').append('<input type="hidden" name="image" value="' + file.file_name + '">')
                this.options.maxFiles = this.options.maxFiles - 1
                @endif
            },
            error: function (file, response) {
                if ($.type(response) === 'string') {
                    var message = response //dropzone sends it's own error messages in string
                } else {
                    var message = response.errors.file
                }
                file.previewElement.classList.add('dz-error')
                _ref = file.previewElement.querySelectorAll('[data-dz-errormessage]')
                _results = []
                for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                    node = _ref[_i]
                    _results.push(node.textContent = message)
                }

                return _results
            }
        }
    </script>
    <script>
        Dropzone.options.aadhaarCardDropzone = {
            url: '{{ route('admin.help-center-profiles.storeMedia') }}',
            maxFilesize: 2, // MB
            maxFiles: 1,
            addRemoveLinks: true,
            headers: {
                'X-CSRF-TOKEN': "{{ csrf_token() }}"
            },
            params: {
                size: 2
            },
            success: function (file, response) {
                $('form').find('input[name="aadhaar_card"]').remove()
                $('form').append('<input type="hidden" name="aadhaar_card" value="' + response.name + '">')
            },
            removedfile: function (file) {
                file.previewElement.remove()
                if (file.status !== 'error') {
                    $('form').find('input[name="aadhaar_card"]').remove()
                    this.options.maxFiles = this.options.maxFiles + 1
                }
            },
            init: function () {
                @if(isset($helpCenterProfile) && $helpCenterProfile->aadhaar_card)
                var file = {!! json_encode($helpCenterProfile->aadhaar_card) !!}
                this.options.addedfile.call(this, file)
                file.previewElement.classList.add('dz-complete')
                $('form').append('<input type="hidden" name="aadhaar_card" value="' + file.file_name + '">')
                this.options.maxFiles = this.options.maxFiles - 1
                @endif
            },
            error: function (file, response) {
                if ($.type(response) === 'string') {
                    var message = response //dropzone sends it's own error messages in string
                } else {
                    var message = response.errors.file
                }
                file.previewElement.classList.add('dz-error')
                _ref = file.previewElement.querySelectorAll('[data-dz-errormessage]')
                _results = []
                for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                    node = _ref[_i]
                    _results.push(node.textContent = message)
                }

                return _results
            }
        }
    </script>
    <script>
        Dropzone.options.panCardDropzone = {
            url: '{{ route('admin.help-center-profiles.storeMedia') }}',
            maxFilesize: 2, // MB
            maxFiles: 1,
            addRemoveLinks: true,
            headers: {
                'X-CSRF-TOKEN': "{{ csrf_token() }}"
            },
            params: {
                size: 2
            },
            success: function (file, response) {
                $('form').find('input[name="pan_card"]').remove()
                $('form').append('<input type="hidden" name="pan_card" value="' + response.name + '">')
            },
            removedfile: function (file) {
                file.previewElement.remove()
                if (file.status !== 'error') {
                    $('form').find('input[name="pan_card"]').remove()
                    this.options.maxFiles = this.options.maxFiles + 1
                }
            },
            init: function () {
                @if(isset($helpCenterProfile) && $helpCenterProfile->pan_card)
                var file = {!! json_encode($helpCenterProfile->pan_card) !!}
                this.options.addedfile.call(this, file)
                file.previewElement.classList.add('dz-complete')
                $('form').append('<input type="hidden" name="pan_card" value="' + file.file_name + '">')
                this.options.maxFiles = this.options.maxFiles - 1
                @endif
            },
            error: function (file, response) {
                if ($.type(response) === 'string') {
                    var message = response //dropzone sends it's own error messages in string
                } else {
                    var message = response.errors.file
                }
                file.previewElement.classList.add('dz-error')
                _ref = file.previewElement.querySelectorAll('[data-dz-errormessage]')
                _results = []
                for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                    node = _ref[_i]
                    _results.push(node.textContent = message)
                }

                return _results
            }
        }
    </script>
    <script>
        Dropzone.options.addressProofDropzone = {
            url: '{{ route('admin.help-center-profiles.storeMedia') }}',
            maxFilesize: 2, // MB
            maxFiles: 1,
            addRemoveLinks: true,
            headers: {
                'X-CSRF-TOKEN': "{{ csrf_token() }}"
            },
            params: {
                size: 2
            },
            success: function (file, response) {
                $('form').find('input[name="address_proof"]').remove()
                $('form').append('<input type="hidden" name="address_proof" value="' + response.name + '">')
            },
            removedfile: function (file) {
                file.previewElement.remove()
                if (file.status !== 'error') {
                    $('form').find('input[name="address_proof"]').remove()
                    this.options.maxFiles = this.options.maxFiles + 1
                }
            },
            init: function () {
                @if(isset($helpCenterProfile) && $helpCenterProfile->address_proof)
                var file = {!! json_encode($helpCenterProfile->address_proof) !!}
                this.options.addedfile.call(this, file)
                file.previewElement.classList.add('dz-complete')
                $('form').append('<input type="hidden" name="address_proof" value="' + file.file_name + '">')
                this.options.maxFiles = this.options.maxFiles - 1
                @endif
            },
            error: function (file, response) {
                if ($.type(response) === 'string') {
                    var message = response //dropzone sends it's own error messages in string
                } else {
                    var message = response.errors.file
                }
                file.previewElement.classList.add('dz-error')
                _ref = file.previewElement.querySelectorAll('[data-dz-errormessage]')
                _results = []
                for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                    node = _ref[_i]
                    _results.push(node.textContent = message)
                }

                return _results
            }
        }
    </script>
    <script>
        Dropzone.options.signatureDropzone = {
            url: '{{ route('admin.help-center-profiles.storeMedia') }}',
            maxFilesize: 2, // MB
            maxFiles: 1,
            addRemoveLinks: true,
            headers: {
                'X-CSRF-TOKEN': "{{ csrf_token() }}"
            },
            params: {
                size: 2
            },
            success: function (file, response) {
                $('form').find('input[name="signature"]').remove()
                $('form').append('<input type="hidden" name="signature" value="' + response.name + '">')
            },
            removedfile: function (file) {
                file.previewElement.remove()
                if (file.status !== 'error') {
                    $('form').find('input[name="signature"]').remove()
                    this.options.maxFiles = this.options.maxFiles + 1
                }
            },
            init: function () {
                @if(isset($helpCenterProfile) && $helpCenterProfile->signature)
                var file = {!! json_encode($helpCenterProfile->signature) !!}
                this.options.addedfile.call(this, file)
                file.previewElement.classList.add('dz-complete')
                $('form').append('<input type="hidden" name="signature" value="' + file.file_name + '">')
                this.options.maxFiles = this.options.maxFiles - 1
                @endif
            },
            error: function (file, response) {
                if ($.type(response) === 'string') {
                    var message = response //dropzone sends it's own error messages in string
                } else {
                    var message = response.errors.file
                }
                file.previewElement.classList.add('dz-error')
                _ref = file.previewElement.querySelectorAll('[data-dz-errormessage]')
                _results = []
                for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                    node = _ref[_i]
                    _results.push(node.textContent = message)
                }

                return _results
            }
        }
    </script>
@endsection
