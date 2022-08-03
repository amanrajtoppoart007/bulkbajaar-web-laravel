@extends('vendor.layout.main')
@section('content')

    <div class="card">
        <div class="card-header">
            {{ trans('cruds.uploadDocuments.title') }}
        </div>

        <div class="card-body">
            <form method="POST" action="{{ route("vendor.upload.documents") }}" enctype="multipart/form-data">
                @csrf
                <div class="row">

                    <div class="col-6">
                        <div class="form-group">
                            <label class="required"
                                   for="gst">GST</label>
                            <div class="needsclick dropzone {{ $errors->has('gst') ? 'is-invalid' : '' }}"
                                 id="gst-dropzone">
                            </div>
                            @if($errors->has('gst'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('gst') }}
                                </div>
                            @endif
                            <span
                                class="help-block">{{ trans('cruds.helpCenterProfile.fields.aadhaar_card_helper') }}</span>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label class="required"
                                   for="pan_card">{{ trans('cruds.helpCenterProfile.fields.pan_card') }}</label>
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
        Dropzone.options.gstDropzone = {
            url: '{{ route('registration.storeMedia') }}',
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
                $('form').find('input[name="gst"]').remove()
                $('form').append('<input type="hidden" name="gst" value="' + response.name + '">')
            },
            removedfile: function (file) {
                file.previewElement.remove()
                if (file.status !== 'error') {
                    $('form').find('input[name="gst"]').remove()
                    this.options.maxFiles = this.options.maxFiles + 1
                }
            },
            init: function () {
                @if(isset($franchiseeProfile) && $franchiseeProfile->gst)
                var file = {!! json_encode($franchiseeProfile->gst) !!}
                    this.options.addedfile.call(this, file)
                file.previewElement.classList.add('dz-complete')
                $('form').append('<input type="hidden" name="gst" value="' + file.file_name + '">')
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
            url: '{{ route('registration.storeMedia') }}',
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
                @if(isset($franchiseeProfile) && $franchiseeProfile->pan_card)
                var file = {!! json_encode($franchiseeProfile->pan_card) !!}
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
@endsection
