@extends("layouts.admin")
@section("content")
    <form id="productOptionForm" action="{{route('admin.productOptions.store')}}" enctype="multipart/form-data">
        @csrf
        <input type="hidden" name="product_id" value="{{$product_id}}">
      <div class="card">
         <div class="card-header">
            {{ trans('global.create') }} {{ trans('cruds.product.title_singular') }} - Create Variation
        </div>
        <div class="card-body">
              <div class="row">
                  <input type="hidden" name="unit" id="unit" value="">
                    <div class="col-md-8">
                        <div class="form-group mb-2">
                            <label for="unit_type">Select Unit Type</label>
                            <select name="unit_type" id="unit_type" class="select2" required>
                                <option value="">Select Unit Type</option>
                                @foreach($unitTypes as $type)
                                    <option value="{{ $type->name }}">{{ $type->name }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group mb-2">
                            <label for="size">Select Size</label>
                            <select name="size" id="size" class="select2" required>
                                @foreach(\App\Models\ProductOption::SIZE_SELECT as $size)
                                    <option value="{{ $size }}">{{ $size }}</option>
                                @endforeach
                            </select>
                        </div>
                                <div class="form-group mb-2">
                                    <label for="color">Select Color</label>
                                    <select name="color" id="color" class="select2">
                                        @foreach(\App\Models\ProductOption::COLOR_SELECT as $color)
                                            <option value="{{ $color }}">{{ $color }}</option>
                                        @endforeach
                                    </select>
                                </div>




                        <div class="form-group mb-2">
                            <label for="quantity">Quantity</label>
                            <input type="text" name="quantity" id="quantity" class="form-control" value="">
                        </div>


                        <div class="form-group">
                            <div class="form-check">
                                <input class="form-check-input form-check" type="checkbox" name="is_default" id="is_default" required>
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

                            <button type="submit" class="btn btn-primary mb-2">Generate
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
            Save Option
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
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>

                            @foreach($options as $option)
                                 <tr>
                                <td>{{$option?->is_default ? 'Yes':'No'}}</td>
                                <td>
                                    <div class="row">
                                        @foreach($option->images as $image)
                                          <div class="col">
                                              <a href="{{$image->thumbnail}}" target="_blank">
                                                 <img style="width: 35px;height: 35px" class="img-thumbnail" src="{{$image->thumbnail}}" alt="Product option image">
                                              </a>
                                          </div>
                                        @endforeach
                                    </div>

                                </td>
                                <td>{{$option?->option}}</td>
                                <td>{{$option?->color}}</td>
                                <td>{{$option?->size}}</td>
                                <td>{{$option?->unit}}</td>
                                <td>{{$option?->quantity}}</td>
                                <td>
                                     <a href="{{route('admin.productOptions.edit',$option->id)}}" class="btn btn-info">Edit</a>
                                </td>
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
                    error: function (jqXHR, textStatus) {

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
            init: function () {},
            error: function (file, response) {
                let message;
                if ($.type(response) === 'string') {
                     message = response //dropzone sends it's own error messages in string
                } else {
                     message = response.errors.file
                }
                file.previewElement.classList.add('dz-error')
               let _ref = file.previewElement.querySelectorAll('[data-dz-errormessage]');
               let  _results = []
                for (let _i = 0, _len = _ref.length; _i < _len; _i++) {
                   let node = _ref[_i]
                    _results.push(node.textContent = message)
                }
                return _results
            }
        }
        $(document).on("submit","#productOptionForm",function(e){
            e.preventDefault();

            $.ajax({
                url: "{{route('admin.productOptions.store')}}",
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
                          window.location.href=window.location.href;


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

        $(document).ready(function(){

            $("#color").select2({
                tags: true
            });
             $("#size").select2({
                tags: true
            });
            $("#unit_type").on("change",function(){
                $("#unit").val($(this).val());

                $.ajax({
                    url: "{{route('admin.get.units')}}",
                    method:"POST",
                    data: {
                        'unit_type': $(this).val(),
                    },
                    success:function(result)
                    {
                       const {response,message} = result;
                       if(response==="success")
                       {
                           const {data} = result;
                           let options='<option value="">Select Measurement</option>';
                           data.map(function(item){
                              options+=`<option value="${item.unit}">${item.unit}</option>`
                         });
                           $("#size").html(options);
                       }
                       else
                       {
                           $.toast({
                               heading: 'Error',
                               text: message?.toString(),
                               showHideTransition: 'slide',
                               icon: "error",
                               position: 'top-right',
                           });
                       }
                    }
                })
            });
        });

    </script>
@endsection
