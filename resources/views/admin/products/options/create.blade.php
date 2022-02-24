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
                    <div class="col-md-8">
                                <div class="form-group mb-2">
                                    <label for="color">Select Color</label>
                                    <select name="color" id="color" class="select2">
                                        @foreach(\App\Models\ProductOption::COLOR_SELECT as $color)
                                            <option value="{{ $color }}">{{ $color }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group mb-2">
                                    <label for="size">Select Size</label>
                                    <select name="size" id="size" class="select2">
                                        @foreach(\App\Models\ProductOption::SIZE_SELECT as $size)
                                            <option value="{{ $size }}">{{ $size }}</option>
                                        @endforeach
                                    </select>
                                </div>

                        <div class="form-group mb-2">
                            <label for="unit">Select Unit</label>
                            <select name="unit" id="unit" class="select2">
                                @foreach($unitTypes as $type)
                                    <option value="{{ $type->name }}">{{ $type->name }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group mb-2">
                            <label for="quantity">Quantity</label>
                            <input type="text" name="quantity" id="quantity" class="form-control" value="">
                        </div>


                        <div class="form-group">
                            <div class="form-check">
                                <input class="form-check-input form-check" type="radio" name="is_default" id="is_default">
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
            Generated Variations
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
                            <th></th>
                        </tr>
                        </thead>
                        <tbody></tbody>
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
            init: function () {},
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


        let variations = [];

        const generateVariations = (colors, sizes) => {
            if(colors.length<=0)
            {
                alert('Please select at least one color');
                variations = [];
                return;
            }

            colors?.forEach((color, i)=>{
                if(sizes?.length > 0)
                {
                    sizes?.forEach((size, j)=>{
                        let option = `${color}-${size}`;
                        const exists = variations.filter(opt => opt.option === option).length > 0;
                        if (!exists) {
                            let object = {
                                option,
                                color,
                                size,
                                quantity: 0,
                                unit: ''
                            }
                            variations.push(object);
                        }
                    });
                }else {
                    let option = color;
                    const exists = variations.filter(opt => opt.option === option).length > 0;
                    if (!exists) {
                        let object = {
                            option,
                            color,
                            size: '',
                            quantity: 0,
                            unit: ''
                        }
                        variations.push(object);
                    }
                }
            });
            createOptions();
        }

        $(document).on("submit","#productOptionForm",function(e){
            e.preventDefault();

            $.ajax({
                url: "{{route('admin.productOptions.store')}}",
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
        })

        const createOptions = () => {
            let template = '';
            variations?.forEach((variation, index)=>{
                template += productOptionTemplate(variation, index);
            });
            $('table tbody').html(template)
        }

        const productOptionTemplate = (variation, index) => {

            let unitTypes = <?= json_encode($unitTypes) ?>;
            let unitSelect = `<select class="form-control" name="product_options[${index}][unit]" style="min-width: 100px">`;
            $.each(unitTypes, (i, e) => {
                unitSelect += `<option value="${e.name}" ${variation.unit === e.name ? 'selected' : ''}>${e.name}</option>`;
            })
            unitSelect += "</select>";

            return `<tr data-index="${index}">`+
                        `<td><input class="form-check-input" type="radio" name="default_image_index" value="${index}" style="min-width: 100px"  ${index===0?'checked':''}></td>`+
                        `<td><input class="form-control" type="file" name="product_options[${index}][image]" value="" style="min-width: 100px" required></td>`+
                        `<td><input class="form-control option" type="text" name="product_options[${index}][option]" value="${variation.option}" style="min-width: 100px" required></td>`+
                        `<td><input class="form-control color" type="text" name="product_options[${index}][color]" value="${variation.color}" style="min-width: 100px" required></td>`+
                        `<td><input class="form-control size" type="text" name="product_options[${index}][size]" value="${variation.size}" style="min-width: 100px"></td>`+
                        `<td>${unitSelect}</td>`+
                        `<td><input class="form-control quantity" type="text" name="product_options[${index}][quantity]" value="${variation.quantity}" style="min-width: 100px"></td>`+
                        `<td><button type="button" class="btn btn-sm btn-danger delete-button"><i class="fa fa-times"></i></button></td>`+
                    `</tr>`;


        }

        $(document).on('click', '.delete-button', function (){
            let tr = $(this).closest('tr');
            let index = $(tr).data('index');
            variations.splice(index, 1);
            $(tr).remove()
        });

    </script>
@endsection
