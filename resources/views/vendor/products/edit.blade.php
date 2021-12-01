@extends('vendor.layout.main')
@section('content')

    <div class="card">
        <div class="card-header">
            {{ trans('global.edit') }} {{ trans('cruds.product.title_singular') }}
        </div>

        <div class="card-body">
            <form id="productForm" enctype="multipart/form-data">
                <input type="hidden" name="id" value="{{ $product->id }}">
                @csrf
                <div class="row">
                    <div class="col-6">
                        <div class="row">


                            <div class="col-12">
                                <div class="form-group">
                                    <label class="required" for="name">{{ trans('cruds.product.fields.name') }}</label>
                                    <input class="form-control {{ $errors->has('name') ? 'is-invalid' : '' }}"
                                           type="text"
                                           name="name" id="name" value="{{ old('name', $product->name) }}" required>
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
                                    <label class="required" for="price">Price</label>
                                    <input class="form-control {{ $errors->has('price') ? 'is-invalid' : '' }}"
                                           type="number"
                                           name="price" id="price" value="{{ old('price', $product->price) }}" required>
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
                                           name="moq" id="moq" value="{{ old('moq', $product->moq) }}" required>
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
                                    <label for="discount">Discount</label>
                                    <input class="form-control {{ $errors->has('discount') ? 'is-invalid' : '' }}"
                                           type="number"
                                           name="discount" id="discount" value="{{ old('discount', $product->discount) }}">
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
                                    <label for="dispatch_time">Expected Dispatch Time</label>
                                    <input class="form-control {{ $errors->has('dispatch_time') ? 'is-invalid' : '' }}"
                                           type="text"
                                           name="dispatch_time" id="dispatch_time" value="{{ old('dispatch_time', $product->dispatch_time) }}">
                                    @if($errors->has('dispatch_time'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('dispatch_time') }}
                                        </div>
                                    @endif
                                    <span class="help-block">{{ trans('cruds.product.fields.name_helper') }}</span>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-group">
                                    <label for="product_category_id">{{ trans('cruds.product.fields.category') }}</label>
                                    <select
                                        class="form-control select2 {{ $errors->has('product_category_id') ? 'is-invalid' : '' }}"
                                        name="product_category_id" id="product_category_id">
                                        @foreach($categories as $id => $category)
                                            <option
                                                value="{{ $id }}" {{ $id == old('product_category_id', $product->product_category_id) ? 'selected' : '' }}>{{ $category }}</option>
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
                                    <label for="product_sub_category_id">{{ trans('cruds.product.fields.sub_category') }}</label>
                                    <select
                                        class="form-control select2 {{ $errors->has('product_sub_category_id') ? 'is-invalid' : '' }}"
                                        name="product_sub_category_id" id="product_sub_category_id">
                                        @foreach($subCategories as $id => $subCategory)
                                            <option
                                                value="{{ $id }}" {{ $id == old('product_sub_category_id', $product->product_sub_category_id) ? 'selected' : '' }}>{{ $subCategory }}</option>
                                        @endforeach
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
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="description">{{ trans('cruds.product.fields.description') }}</label>
                                    <textarea class="form-control {{ $errors->has('description') ? 'is-invalid' : '' }}"
                                              name="description"
                                              id="description">{{ old('description', $product->description) }}</textarea>
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
                                              name="rrp" id="rrp">{{ old('rrp', $product->rrp) }}</textarea>
                                    @if($errors->has('rrp'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('rrp') }}
                                        </div>
                                    @endif
                                    <span
                                        class="help-block">{{ trans('cruds.product.fields.description_helper') }}</span>
                                </div>
                            </div>
                            <div class="col-12 table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>Option</th>
                                        <th>{{ trans('cruds.productPrice.fields.unit_type') }}</th>
                                        <th>{{ trans('cruds.productPrice.fields.quantity') }}</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @forelse($productOptions as $productOption)
                                        <tr>
                                            <td>
                                                <input type="hidden" name="pu_id[]" value="{{$productOption->id}}">

                                                <input class="form-control" style="min-width: 100px" type="text" value="{{ $productOption->option }}" name="option[]"
                                                       required>
                                            </td>
                                            <td>
                                                <select class="form-control" name="unit[]" style="min-width: 100px;">
                                                    @foreach($unitTypes as $unitType)
                                                        <option
                                                            value="{{ $unitType->name }}" {{ $productOption->unit == $unitType->name ? 'selected' : '' }}>{{ $unitType->name }}</option>
                                                    @endforeach
                                                </select>
                                            </td>
                                            <td>
                                                <input class="form-control" style="min-width: 100px" type="number"
                                                       step="1" value="{{ $productOption->quantity }}" name="quantity[]">
                                            </td>
                                            <td>
                                                @if($loop->last)
                                                    <button type="button" class="btn btn-sm btn-success add-button"><i
                                                            class="fa fa-plus"></i></button>
                                                @else
                                                    <button type="button" class="btn btn-sm btn-danger delete-button"><i
                                                            class="fa fa-trash"></i></button>
                                                @endif
                                            </td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td>
                                                <input class="form-control" type="text"
                                                       name="option[]" style="min-width: 100px">
                                            </td>
                                            <td>
                                                <select class="form-control" name="unit[]" style="min-width: 100px;">
                                                    @foreach($unitTypes as $unitType)
                                                        <option
                                                            value="{{ $unitType->name }}" {{ old('unit') == $unitType->name ? 'selected' : '' }}>{{ $unitType->name }}</option>
                                                    @endforeach
                                                </select>
                                            </td>
                                            <td>
                                                <input class="form-control" style="min-width: 100px" type="number" step="1" name="quantity[]">
                                            </td>
                                            <td>
                                                <button type="button" class="btn btn-sm btn-success add-button"><i class="fa fa-plus"></i></button>
                                            </td>
                                        </tr>
                                    @endforelse
                                    </tbody>
                                </table>
                            </div>
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
        var uploadedImagesMap = {}
        Dropzone.options.imagesDropzone = {
            url: '{{ route('vendor.products.storeMedia') }}',
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
                $('form').append('<input type="hidden" name="images[]" value="' + response.name + '">')
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
                    $('form').append('<input type="hidden" name="images[]" value="' + file.file_name + '">')
                }
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

        const addProductUnitTemplate = () => {
            let unitTypes = <?= json_encode($unitTypes) ?>;
            let unitSelect = `<select class="form-control" name="unit[]" style="min-width: 100px" required>`;
            $.each(unitTypes, (i, e) => {
                unitSelect += `<option value="${e.name}">${e.name}</option>`;
            })
            unitSelect += "</select>";

            let template = `<tr>`+
                `<td><input type="hidden" name="pu_id[]"><input class="form-control" type="text" step="1" name="option[]" style="min-width: 100px"></td>`+
                `<td>${unitSelect}</td>`+
                `<td><input class="form-control" type="number" step="1" name="quantity[]" style="min-width: 100px"></td>`+
                `<td><button type="button" class="btn btn-sm btn-success add-button"><i class="fa fa-plus"></i></button></td>`+
                `</tr>`;

            $('table tbody').append(template)
        }

        $(document).on('click', '.add-button', function (){
            let tr = $(this).closest('tr');

            let isNotEmpty = $($(tr).find('input')).filter(function () {
                return $.trim($(this).val()).length == 0
            }).length == 0;

            if(isNotEmpty){
                addProductUnitTemplate()
                let deleteButton = '<button type="button" class="btn btn-danger btn-sm delete-button"><i class="fa fa-trash"></i></button>';
                $(this).parent().append(deleteButton);
                $(this).remove();
            }else{
                alert('Please enter values then add more')
            }
        });

        $(document).on('click', '.delete-button', function (){
            let tr = $(this).closest('tr');
            $(tr).remove()
        });

        $(document).on('submit', '#productForm', function(e) {
            var formData = new FormData($(this)[0]);
            $.ajax({
                url: "{{route('vendor.products.update')}}",
                type: 'POST',
                dataType: 'json',
                data: formData,
                cache: false,
                processData: false,
                contentType: false,
                success: function(result) {
                    if (result.status) {
                        alert(result.msg);
                        setTimeout(function() {
                            location.reload();
                            window.location = "{{ route('vendor.products.index') }}"
                        }, 100);
                    } else {
                        alert(result);
                    }
                },
                error: function(result) {
                    console.log(result);
                }
            });

            e.preventDefault();
        });
    </script>
@endsection
