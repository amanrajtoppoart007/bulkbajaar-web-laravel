@extends('vendor.layout.main')
@section('content')

    <div class="card">
        <div class="card-header">
            {{ trans('global.update') }} Bank Account Details
        </div>

        <div class="card-body">
            <form method="post" action="{{ route('vendor.update.bank-account') }}" enctype="multipart/form-data">
                @csrf
                <div class="row">
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
                                   name="account_number" id="account_number" value="{{ $profile->account_number ?? '' }}" required>
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
                <div class="form-group">
                    <button class="btn btn-danger" type="submit">
                        {{ trans('global.save') }}
                    </button>
                </div>
            </form>
        </div>
    </div>
@endsection
