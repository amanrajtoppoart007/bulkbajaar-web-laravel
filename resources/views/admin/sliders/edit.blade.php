@extends('layouts.admin')
@section('content')

<div class="card">
    <div class="card-header">
        {{ trans('global.create') }} {{ trans('cruds.slider.title_singular') }}
    </div>

    <div class="card-body">
        <form method="POST" id="sliderEditForm" action="{{ route("admin.sliders.update",$slider->id) }}" enctype="multipart/form-data">
            @csrf
            @method('PUT')
            <div class="form-group">
                <label class="required" for="name">{{ trans('cruds.slider.fields.name') }}</label>
                <input class="form-control {{ $errors->has('name') ? 'is-invalid' : '' }}" type="text" name="name" id="name" value="{{ old('name', $slider['name']) }}" readonly>
                <span class="help-block">{{ trans('cruds.slider.fields.name_helper') }}</span>
            </div>

                <div class="form-group">
                    <label class="required" for="images">{{ trans('cruds.slider.fields.images') }}</label>
                    <div class="needsclick dropzone {{ $errors->has('images') ? 'is-invalid' : '' }}"
                         id="images-dropzone">
                    </div>
                    @if($errors->has('images'))
                        <div class="invalid-feedback">
                            {{ $errors->first('images') }}
                        </div>
                    @endif
                    <span class="help-block">{{ trans('cruds.slider.fields.images_helper') }}</span>
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
        let uploadedImagesMap = {}
        Dropzone.options.imagesDropzone = {
            url: '{{ route('admin.sliders.storeMedia') }}',
            maxFilesize: 10, // MB
            acceptedFiles: '.jpeg,.jpg,.png,.gif',
            addRemoveLinks: true,
            headers: {
                'X-CSRF-TOKEN': "{{ csrf_token() }}"
            },
            params: {
                size: 10,
            },
            success: function (file, response) {
                $('form').append('<input type="hidden" name="images[]" value="' + response.name + '">')
                uploadedImagesMap[file.name] = response.name
            },
            removedfile: function (file) {
                console.log(file);
                file.previewElement.remove()
                let name;
                const {file_name=undefined} = file;
                if (typeof file_name !== 'undefined') {
                    name = file_name
                } else {
                    name = uploadedImagesMap[file.name]
                }
                $('form').find('input[name="images[]"][value="' + name + '"]').remove()
            },
            init: function () {
                @if(isset($slider) && $slider->images)
                    let files =
                        {!! json_encode($slider->images) !!};
                        for (let i in files) {
                        let file = files[i];
                        const {original_url,file_name} = file;
                        this.options.addedfile.call(this, file);
                        this.options.thumbnail.call(this, file, original_url);
                        file.previewElement.classList.add('dz-complete');
                        $('form').append('<input type="hidden" name="images[]" value="' + file_name + '">');
                    }
                @endif
            },
            error: function (file, response) {
                let message;
                if ($.type(response) === 'string') {
                     message = response //dropzone sends it's own error messages in string
                } else {
                     message = response.errors.file
                }
                file.previewElement.classList.add('dz-error')
                let _ref = file.previewElement.querySelectorAll('[data-dz-errormessage]');
                let _results = []
                for (let _i = 0, _len = _ref.length; _i < _len; _i++) {
                    let node = _ref[_i]
                    _results.push(node.textContent = message)
                }

                return _results
            }
        }

        $(document).ready(function(){

            $("form#sliderEditForm").on("submit",function(e){
                e.preventDefault();
                $.ajax({
                    url: "{{route('admin.sliders.update',$slider->id)}}",
                    method:"PUT",
                    data : $(this).serialize(),
                    cache: false,
                    processData: false,
                    headers : { 'X-CSRF-TOKEN':'{{csrf_token()}}'},
                    success:function(response)
                    {
                        if(response.status===1)
                        {
                             window.location.href = "{{route('admin.sliders.index')}}";
                        }
                        else
                        {
                            alert(JSON.stringify(response?.message));
                        }
                    },
                    error:function(response)
                    {
                          alert(JSON.stringify(response));
                    }
                });
            })
        });


    </script>
@endsection
