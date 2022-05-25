@extends("layouts.admin")
@section("content")
    <form id="productOptionForm" action="{{route('admin.productOptions.store')}}" enctype="multipart/form-data">
        @csrf
        @method("PUT")
        <input type="hidden" name="product_id" id="product_id" value="{{$option->product_id}}">
        <input type="hidden" name="id" id="option_id" value="{{$option->id}}">
      <div class="card">
         <div class="card-header">
             <div class="row">
                 <div class="col">
                     Edit Option - {{$option->color}}-{{$option->size}}
                 </div>
                 <div class="col text-right">
                     <a href="{{route('admin.productOptions.create',$option->product_id)}}" class=" btn btn-success">
                         Create New Option
                     </a>
                 </div>
             </div>
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
                            <label for="weight">Weight (In KG)</label>
                            <input type="text" name="weight" id="weight" class="form-control" value="{{$option->weight}}" required>
                        </div>

                        <div class="form-group mb-2">
                            <label for="quantity">Quantity</label>
                            <input type="text" name="quantity" id="quantity" class="form-control" value="{{$option->quantity}}" required>
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

                            <button type="submit" class="btn btn-primary mb-2">{{trans('global.save_changes')}}</button>
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
                            <th>Weight(In KG)</th>
                            <th>{{ trans('cruds.productPrice.fields.unit_type') }}</th>
                            <th>{{ trans('cruds.productPrice.fields.quantity') }}</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>

                            @foreach($options as $item)
                                <tr class="{{$item->id==$option->id?'bg-success':''}}">
                                    <td>{{$option?->is_default ? 'Yes':'No'}}</td>
                                    <td>
                                        <div class="row">
                                            @foreach($item->images as $image)
                                                <div class="col">
                                                    <img style="width: 35px;height: 35px" class="img-thumbnail"
                                                         src="{{$image->thumbnail}}" alt="Product option image">
                                                </div>
                                            @endforeach
                                        </div>

                                    </td>
                                    <td>{{$item?->option}}</td>
                                    <td>{{$item?->color}}</td>
                                    <td>{{$item?->size}}</td>
                                    <td>{{$option?->weight}} kg</td>
                                    <td>{{$item?->unit}}</td>
                                    <td>{{$item?->quantity}}</td>
                                    <td>
                                        @if($item->id!=$option->id)
                                            <a href="{{route('admin.productOptions.edit',$item->id)}}"
                                               class="btn btn-info">Edit</a>
                                        @else
                                            <button class="btn btn-info disabled">Edit</button>
                                        @endif
                                        <button
                                            data-redirect-url="{{route('admin.productOptions.list',$item->product_id)}}"
                                            data-delete-url="{{route('admin.productOptions.destroy',$item->id)}}"
                                            class="btn btn-danger delete-option-btn">Delete</button>
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
                const {file_name=undefined} = file;
                if (typeof file_name !== 'undefined') {
                    name = file_name;
                } else {
                    name = uploadedImagesMap[file.name];
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
            init: function () {
             @if(isset($option) && $option->images)
                let files =
                {!! json_encode($option->images) !!};
                    for (let i in files) {
                    let file = files[i];
                    const {preview_url='',file_name=''}=file;
                    this.options.addedfile.call(this, file);
                    this.options.thumbnail.call(this, file, preview_url);
                    file.previewElement.classList.add('dz-complete');
                    $('form#productOptionForm').append(`<input type="hidden" name="images[]" value="${file_name}">`);
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
                let _ref = file.previewElement.querySelectorAll('[data-dz-errormessage]')
                let _results = []
                for (let _i = 0, _len = _ref.length; _i < _len; _i++) {
                    let node = _ref[_i]
                    _results.push(node.textContent = message)
                }
                return _results
            }
        }

        $(document).ready(function(){
             $("#color").select2({
                tags: true
            });
             $("#size").select2({
                tags: true
            });
        });
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
                         location.reload();
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
                error: function (jqXHR, textStatus) {

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
        <script>
        $(document).ready(function(){
           $(document).on('click','.delete-option-btn',function(e){
               e.preventDefault();
               const deleteUrl = $(this).attr('data-delete-url');
               const redirectUrl = $(this).attr('data-redirect-url');
               Swal.fire({
                   title: 'Are you want to delete this option?',
                   showDenyButton: true,
                   showCancelButton: false,
                   confirmButtonText: 'Yes',
                   denyButtonText: `No`,
               }).then((choice) => {
                  const {isConfirmed=false,isDenied=true} = choice
                   if (isConfirmed) {
                       $.ajax({
                           url:deleteUrl,
                           method:'POST',
                           headers: { 'x-csrf-token':_token},
                           data: { _method: 'DELETE'},
                           success:function(response)
                           {
                               if(response.status===1)
                               {
                                   $.toast({
                                       heading: 'Success',
                                       text: response?.message,
                                       showHideTransition: 'slide',
                                       icon: 'success',
                                       position: 'top-right',
                                   });
                                   location.href=redirectUrl;
                               }
                               else
                               {
                                  $.toast({
                                       heading: 'Success',
                                       text: response?.message,
                                       showHideTransition: 'slide',
                                       icon: 'success',
                                       position: 'top-right',
                                   });
                               }

                           },
                           error:function(jqxHR)
                           {
                                $.toast({
                                       heading: 'Error',
                                       text: JSON.stringify(jqxHR),
                                       showHideTransition: 'slide',
                                       icon: 'error',
                                       position: 'top-right',
                                   });
                           }
                       })
                   } else if (isDenied) {
                       Swal.fire('User action cancelled', '', 'info')
                   }
               });
           });
        });
    </script>
@endsection

