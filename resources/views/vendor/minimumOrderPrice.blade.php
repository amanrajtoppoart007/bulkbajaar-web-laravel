@extends('vendor.layout.main')
@section('content')

    <div class="card">
        <div class="card-header">
            {{ trans('global.update') }} Minimum order price
        </div>

        <div class="card-body">
            <form method="post" action="{{ route('vendor.update.mop') }}" enctype="multipart/form-data">
                @csrf
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label class="required" for="mop">Minimum order price</label>
                            <input class="form-control {{ $errors->has('mop') ? 'is-invalid' : '' }}" type="text" name="mop" id="mop" value="{{ old('mop', $profile->mop ?? 0) }}">
                            @if($errors->has('mop'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('mop') }}
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
