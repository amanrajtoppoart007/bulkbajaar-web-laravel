@extends('layouts.admin')
@section('content')
 <form id="productForm" enctype="multipart/form-data">
                @csrf
    <div class="card">
        <div class="card-header">
            {{ trans('global.create') }} {{ trans('cruds.product.title_singular') }} - Basic Details
        </div>

        <div class="card-body">

                <div class="row">
                    <div class="col-6">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="required" for="vendor_id">Seller</label>
                                    <select
                                        class="form-control select2 {{ $errors->has('vendor_id') ? 'is-invalid' : '' }}"
                                        name="vendor_id" id="vendor_id" required>
                                        <option value="">Select Seller</option>
                                        @foreach($vendors as $id => $vendor)
                                            <option
                                                value="{{ $id }}" {{ old('vendor_id') == $id ? 'selected' : '' }}>{{ $vendor }}</option>
                                        @endforeach
                                    </select>
                                    @if($errors->has('vendor_id'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('vendor_id') }}
                                        </div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="required" for="name">{{ trans('cruds.product.fields.name') }}</label>
                                    <input class="form-control {{ $errors->has('name') ? 'is-invalid' : '' }}"
                                           type="text"
                                           name="name" id="name" value="{{ old('name', '') }}" required>
                                    @if($errors->has('name'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('name') }}
                                        </div>
                                    @endif
                                    <span class="help-block">{{ trans('cruds.product.fields.name_helper') }}</span>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="required" for="sku">SKU</label>
                                    <input class="form-control {{ $errors->has('sku') ? 'is-invalid' : '' }}"
                                           type="text"
                                           name="sku" id="sku" value="{{ old('sku', '') }}" required>
                                    @if($errors->has('sku'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('sku') }}
                                        </div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="hsn">HSN</label>
                                    <input class="form-control {{ $errors->has('hsn') ? 'is-invalid' : '' }}"
                                           type="text"
                                           name="hsn" id="hsn" value="{{ old('hsn', '') }}">
                                    @if($errors->has('hsn'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('hsn') }}
                                        </div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="required" for="price">Price</label>
                                    <input class="form-control {{ $errors->has('price') ? 'is-invalid' : '' }}"
                                           type="number"
                                           name="price" id="price" value="{{ old('price', '') }}" required>
                                    @if($errors->has('price'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('price') }}
                                        </div>
                                    @endif
                                    <span class="help-block">{{ trans('cruds.product.fields.name_helper') }}</span>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="required" for="price">Minimum Order Quantity</label>
                                    <input class="form-control {{ $errors->has('moq') ? 'is-invalid' : '' }}"
                                           type="number"
                                           name="moq" id="moq" value="{{ old('moq', '') }}" required>
                                    @if($errors->has('moq'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('moq') }}
                                        </div>
                                    @endif
                                    <span class="help-block">{{ trans('cruds.product.fields.name_helper') }}</span>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="required" for="discount">Discount</label>
                                    <input class="form-control {{ $errors->has('discount') ? 'is-invalid' : '' }}"
                                           type="number"
                                           name="discount" id="discount" value="{{ old('discount', 0) }}" required>
                                    @if($errors->has('discount'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('discount') }}
                                        </div>
                                    @endif
                                    <span class="help-block">{{ trans('cruds.product.fields.name_helper') }}</span>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="required" for="gst">GST</label>
                                    <input class="form-control {{ $errors->has('gst') ? 'is-invalid' : '' }}"
                                           type="number"
                                           name="gst" id="gst" value="{{ old('gst', 18) }}" required>
                                    @if($errors->has('gst'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('gst') }}
                                        </div>
                                    @endif
                                    <span class="help-block">{{ trans('cruds.product.fields.name_helper') }}</span>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="dispatch_time">Expected Dispatch Time</label>
                                    <input class="form-control {{ $errors->has('dispatch_time') ? 'is-invalid' : '' }}"
                                           type="text"
                                           name="dispatch_time" id="dispatch_time" value="{{ old('dispatch_time', '') }}">
                                    @if($errors->has('dispatch_time'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('dispatch_time') }}
                                        </div>
                                    @endif
                                    <span class="help-block">{{ trans('cruds.product.fields.name_helper') }}</span>
                                </div>
                            </div>



                        </div>
                    </div>
                    <div class="col-6">
                        <div class="row">
                             <div class="col-12">
                                <div class="form-group">
                                    <label for="product_category_id">Category</label>
                                    <select
                                        class="form-control select2 {{ $errors->has('product_category_id') ? 'is-invalid' : '' }}"
                                        name="product_category_id" id="product_category_id">
                                        @foreach($categories as $id => $category)
                                            <option
                                                value="{{ $id }}" {{ $id == old('product_category_id') ? 'selected' : '' }}>{{ $category }}</option>
                                        @endforeach
                                    </select>
                                    @if($errors->has('product_category_id'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('product_category_id') }}
                                        </div>
                                    @endif
                                    <span class="help-block">{{ trans('cruds.product.fields.category_helper') }}</span>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="product_sub_category_id">Sub Category</label>
                                    <select
                                        class="form-control select2 {{ $errors->has('product_sub_category_id') ? 'is-invalid' : '' }}"
                                        name="product_sub_category_id" id="product_sub_category_id">
                                    </select>
                                    @if($errors->has('product_sub_category_id'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('product_sub_category_id') }}
                                        </div>
                                    @endif
                                    <span class="help-block">{{ trans('cruds.product.fields.sub_category_helper') }}</span>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="brand_id">Brand</label>
                                    <select
                                        class="form-control select2 {{ $errors->has('brand_id') ? 'is-invalid' : '' }}"
                                        name="brand_id" id="brand_id">
                                        @foreach($brands as $id => $brand)
                                            <option
                                                value="{{ $id }}" {{ $id == old('brand_id') ? 'selected' : '' }}>{{ $brand }}</option>
                                        @endforeach
                                    </select>
                                    @if($errors->has('brand_id'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('brand_id') }}
                                        </div>
                                    @endif
                                </div>
                            </div>
                             <div class="col-12">
                                <div class="form-group">
                                    <label for="images">{{ trans('cruds.product.fields.images') }}</label>
                                    <div class="needsclick dropzone {{ $errors->has('images') ? 'is-invalid' : '' }}"
                                         id="images-dropzone">
                                    </div>
                                    @if($errors->has('images'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('images') }}
                                        </div>
                                    @endif
                                    <span class="help-block">{{ trans('cruds.product.fields.images_helper') }}</span>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="description">{{ trans('cruds.product.fields.description') }}</label>
                                    <textarea class="form-control {{ $errors->has('description') ? 'is-invalid' : '' }}"
                                              name="description" id="description">{{ old('description') }}</textarea>
                                    @if($errors->has('description'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('description') }}
                                        </div>
                                    @endif
                                    <span
                                        class="help-block">{{ trans('cruds.product.fields.description_helper') }}</span>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="rrp">Refund & Return Policy</label>
                                    <textarea class="form-control {{ $errors->has('rrp') ? 'is-invalid' : '' }}"
                                              name="rrp" id="rrp">{{ old('rrp') }}</textarea>
                                    @if($errors->has('rrp'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('rrp') }}
                                        </div>
                                    @endif
                                    <span
                                        class="help-block">{{ trans('cruds.product.fields.description_helper') }}</span>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="is_returnable" id="is_returnable" value="1" checked>
                                        <label class="form-check-label" for="is_returnable">Is this product returnable?</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    Return will be allowed with these conditions
                                    @foreach($returnConditions as $key => $returnCondition)
                                        <div class="form-check">
                                            <input class="form-check-input return_conditions" type="checkbox" name="return_conditions[]" id="conditions-{{ $key }}" value="{{ $key }}">
                                            <label class="form-check-label" for="conditions-{{ $key }}">{{$returnCondition}}</label>
                                        </div>
                                    @endforeach
                                </div>
                            </div>


                        </div>
                    </div>
                </div>




        </div>
    </div>

    <div class="card">
         <div class="card-header">
            {{ trans('global.create') }} {{ trans('cruds.product.title_singular') }} - Create Variation
        </div>
        <div class="card-body">
              <div class="row">
                    <div class="col-12">
                                <div class="form-group mb-2">
                                    <label for="color">Select Color</label>
                                    <select name="" id="color" class="select2" multiple>
                                        @foreach(\App\Models\ProductOption::COLOR_SELECT as $color)
                                            <option value="{{ $color }}">{{ $color }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group mb-2">
                                    <label for="size">Select Size</label>
                                    <select name="" id="size" class="select2" multiple>
                                        @foreach(\App\Models\ProductOption::SIZE_SELECT as $size)
                                            <option value="{{ $size }}">{{ $size }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <button type="button" class="btn btn-primary mb-2" id="generate-option-button">Generate Options</button>
                            </div>
                            <div class="col-12 table-responsive">
                                <table class="table">
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

      <div class="card">
        <div class="card-body">
           <div class="form-group">
                    <button class="btn btn-danger" type="submit">
                        {{ trans('global.save') }}
                    </button>
                </div>
        </div>
    </div>
 </form>


@endsection

@section('scripts')
    <script>
          $(document).ready(function () {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': "{{ csrf_token() }}"
                }
            });
            $(document).on('submit', '#productForm', function(e) {
                e.preventDefault();

                let isReturnable = $('#is_returnable').is(':checked')
            if (isReturnable){
                const atLeastOneIsChecked = $('.return_conditions:checked').length > 0;
                if (!atLeastOneIsChecked){
                    alert('Please select at least one return condition.')
                    return;
                }
            }

            if(variations.length <= 0){
                alert('Please create variations')
                return;
            }

            let isNotEmpty = $('.option, .color').filter(function (){
                return $.trim($(this).val()).length === 0
            }).length === 0;

            if(!isNotEmpty){
                alert('Option or color from any variation cannot be blank')
                return;
            }

                const form = new FormData(document.getElementById('productForm'));
                $.ajax({
                    url: "{{route('admin.products.store')}}",
                    method: "POST",
                    data: form,
                    cache: false,
                    processData: false,
                    contentType: false,
                    success: function (result) {
                        if (result?.status === 1) {
                            Swal.fire({
                                title: 'Success!',
                                text: result?.message,
                                icon: "success",
                                buttonsStyling: false,
                                confirmButtonText: "Ok,Got it",
                                customClass: {
                                    confirmButton: "btn btn-primary"
                                }
                            });
                            window.location.href = '{{route('admin.products.index')}}';
                        } else {
                            Swal.fire({
                                    title: 'Error',
                                    text: result?.message,
                                    icon: "error",
                                    buttonsStyling: false,
                                    confirmButtonText: "Ok, got it!",
                                    customClass: {
                                        confirmButton: "btn btn-primary"
                                    }
                                });
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        Swal.fire({
                            text: textStatus,
                            icon: "error",
                            buttonsStyling: false,
                            confirmButtonText: "Ok, got it!",
                            customClass: {
                                confirmButton: "btn btn-primary"
                            }
                        });

                    }
                });
            })
        })
    </script>
    <script>
        var uploadedImagesMap = {}
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
                $('form#productForm').append('<input type="hidden" name="images[]" value="' + response.name + '">')
                uploadedImagesMap[file.name] = response.name
            },
            removedfile: function (file) {
                console.log(file)
                file.previewElement.remove()
                var name = ''
                if (typeof file.file_name !== 'undefined') {
                    name = file.file_name
                } else {
                    name = uploadedImagesMap[file.name]
                }
                $('form').find('input[name="images[]"][value="' + name + '"]').remove()
            },
            init: function () {
                @if(isset($product) && $product->images)
                var files =
                    {!! json_encode($product->images) !!}
                    for (var i in files) {
                    var file = files[i]
                    this.options.addedfile.call(this, file)
                    this.options.thumbnail.call(this, file, file.preview)
                    file.previewElement.classList.add('dz-complete')
                    $('form#productForm').append('<input type="hidden" name="images[]" value="' + file.file_name + '">')
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

        $('#generate-option-button').click(() => {
            let colors = $('#color').val()
            let sizes = $('#size').val();
            generateVariations(colors, sizes)
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


        let category = "{{ old('product_category_id') }}";
        let subCategory = "{{ old('product_sub_category_id') }}";

        setTimeout(() => {
            $('#product_category_id').val(category).trigger('change');
        }, 100)

        $("#product_category_id").on("change", function () {

            $("#product_sub_category_id").empty();
            $.ajax({
                url: "{{route('ajax.products.sub-category.list')}}",
                type: 'POST',
                data: {'product_category_id': $(this).val()},
                dataType: 'json',
                success: function (res) {
                    if (res.response === "success") {
                        let option = $($.parseHTML(`<option value="">Select Sub Category</option>`));
                        $("#product_sub_category_id").append(option);
                        $.each(res.data, function (key, item) {
                            let $option = $($.parseHTML(`<option value="${item.id}">${item.name}</option>`));
                            $("#product_sub_category_id").append($option);
                        });
                    }
                    $('#product_sub_category_id').val(subCategory).trigger('change');

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus);
                }
            });
        });
    </script>
@endsection
