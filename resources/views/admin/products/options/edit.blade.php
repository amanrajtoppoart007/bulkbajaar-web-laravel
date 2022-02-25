@extends("layouts.admin")
@section("content")
    <form id="productOptionForm" action="{{route('admin.productOptions.store')}}" enctype="multipart/form-data">
        @csrf
        @method("PUT")
        <input type="hidden" name="product_id" id="product_id" value="{{$option->product_id}}">
        <input type="hidden" name="id" id="option_id" value="{{$option->id}}">
      <div class="card">
         <div class="card-header">
            {{ trans('global.create') }} {{ trans('cruds.product.title_singular') }} - Create Variation
        </div>
        <div class="card-body">
              <div class="row">
                    <div class="col-md-8">
                                <div class="form-group mb-2">
                                    <label for="color">Select Color</label>
                                    <select name="color" id="color" class="select2">
                                        @foreach(\App\Models\ProductOption::COLOR_SELECT as $color)
                                            <option value="{{ $color }}" {{$color==$option->color?'selected':''}}>{{ $color }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group mb-2">
                                    <label for="size">Select Size</label>
                                    <select name="size" id="size" class="select2">
                                        @foreach(\App\Models\ProductOption::SIZE_SELECT as $size)
                                            <option value="{{ $size }}" {{$size==$option->size?'selected':''}}>{{ $size }}</option>
                                        @endforeach
                                    </select>
                                </div>

                        <div class="form-group mb-2">
                            <label for="unit">Select Unit</label>
                            <select name="unit" id="unit" class="select2">
                                @foreach($unitTypes as $type)
                                    <option value="{{ $type->name }}" {{$type->name==$option->unit?'selected':''}}>{{ $type->name }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group mb-2">
                            <label for="quantity">Quantity</label>
                            <input type="text" name="quantity" id="quantity" class="form-control" value="{{$option->quantity}}">
                        </div>


                        <div class="form-group">
                            <div class="form-check">
                                <input class="form-check-input form-check" type="checkbox" name="is_default" id="is_default" {{$option->is_default?'checked':''}}>
                                <label class="form-check-label" for="is_default">
                                    Default Variation
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="images">Image</label>
                            <div class="needsclick dropzone" id="images-dropzone"></div>
                            <span class="help-block">Upload Variation image</span>
                        </div>
                        <div class="form-group">

                            <button type="submit" class="btn btn-primary mb-2">Edit
                                Options
                            </button>
                        </div>

                            </div>

                </div>
        </div>
    </div>
        </form>
    <div class="card">
        <div class="card-header">
            Generated Options
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-12 col-md-12 col-xl-12 col-lg-12 table-responsive">
                    <table class="table table-borderless">
                        <thead>
                        <tr>
                            <th>Default</th>
                            <th>Image</th>
                            <th>Option</th>
                            <th>Color</th>
                            <th>Size</th>
                            <th>{{ trans('cruds.productPrice.fields.unit_type') }}</th>
                            <th>{{ trans('cruds.productPrice.fields.quantity') }}</th>
                        </tr>
                        </thead>
                        <tbody>

                            @foreach($options as $option)
                                 <tr>
                                <td>{{$option?->is_default ? 'Yes':'No'}}</td>
                                <td>
                                    <div class="row">
                                        @foreach($option->images as $image)
                                          <div class="col-12 col-md-2 col-lg-12 col-xl-2">
                                              <img class="img-thumbnail" src="{{$image->thumbnail}}" alt="Product option image">
                                          </div>
                                        @endforeach
                                    </div>

                                </td>
                                <td>{{$option?->option}}</td>
                                <td>{{$option?->color}}</td>
                                <td>{{$option?->size}}</td>
                                <td>{{$option?->unit}}</td>
                                <td>{{$option?->quantity}}</td>
                                </tr>
                            @endforeach

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection

@section("scripts")
    <script>
        let uploadedImagesMap = {}
        Dropzone.options.imagesDropzone = {
            url: '{{ route('admin.products.storeMedia') }}',
            maxFilesize: 2, // MB
            acceptedFiles: '.jpeg,.jpg,.png,.gif',
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
                $('form#productOptionForm').append('<input type="hidden" name="images[]" value="' + response.name + '">')
                uploadedImagesMap[file.name] = response.name
            },
            removedfile: function (file) {
                let name = ''
                if (typeof file.file_name !== 'undefined') {
                    name = file.file_name
                } else {
                    name = uploadedImagesMap[file.name]
                }
                $.ajax({
                    url: "{{route('admin.productOptions.remove.files')}}",
                    method: 'POST',
                    data: {
                        filename:name,
                    },
                    success:function()
                    {
                         file.previewElement.remove();
                        $('form#productOptionForm').find('input[name="images[]"][value="' + name + '"]').remove()
                    },
                    error: function (jqXHR, textStatus, errorThrown) {

                        $.toast({
                            heading: 'Error',
                            text: textStatus,
                            showHideTransition: 'slide',
                            icon: "error",
                            position: 'top-right',
                        });
                    }
                })

            },
            init: function () {
             @if(isset($option) && $option->images)
                let files =
                {!! json_encode($option->images) !!}
                    for (let i in files) {
                    let file = files[i]
                    this.options.addedfile.call(this, file)
                    this.options.thumbnail.call(this, file, file.preview_url)
                    file.previewElement.classList.add('dz-complete')
                    $('form#productOptionForm').append('<input type="hidden" name="images[]" value="' + file.file_name + '">')
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
                _ref = file.previewElement.querySelectorAll('[data-dz-errormessage]')
                _results = []
                for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                    node = _ref[_i]
                    _results.push(node.textContent = message)
                }
                return _results
            }
        }
        $(document).on("submit","#productOptionForm",function(e){
            e.preventDefault();

            $.ajax({
                url: "{{route('admin.productOptions.update',$option->id)}}",
                method:'POST',
                cache: false,
                processData: false,
                contentType: false,
                data: new FormData(document.getElementById('productOptionForm')),
                success:function(result)
                {
                    if (result?.status === 1) {

                        $.toast({
                                heading: 'Success',
                                text: result?.message,
                                showHideTransition: 'slide',
                                icon: 'success',
                                position:'top-right',
                            });
                         setTimeout(()=>{
                             window.location.href=window.location.href;
                         },6000)


                        } else {

                            $.toast({
                                heading: 'Error',
                                text: result?.message,
                                showHideTransition: 'slide',
                                icon: "error",
                                position:'top-right',
                            });

                        }
                },
                error: function (jqXHR, textStatus, errorThrown) {

                        $.toast({
                            heading: 'Error',
                            text: textStatus,
                            showHideTransition: 'slide',
                            icon: "error",
                            position: 'top-right',
                        });
                    }
            });
        });

    </script>
@endsection

