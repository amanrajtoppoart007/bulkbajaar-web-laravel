@extends('layouts.admin')
@section('content')
    <form id="productForm" enctype="multipart/form-data">
        <input type="hidden" name="id" value="{{ $product->id }}">
        @csrf
        <div class="card">
            <div class="card-header">
                {{ trans('global.edit') }} {{ trans('cruds.product.title_singular') }}
            </div>

            <div class="card-body">
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
                                    <label class="required" for="sku">SKU</label>
                                    <input class="form-control {{ $errors->has('sku') ? 'is-invalid' : '' }}"
                                           type="text"
                                           name="sku" id="sku" value="{{ old('sku', $product->sku ?? '') }}" required>
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
                                           name="hsn" id="hsn" value="{{ old('hsn', $product->hsn ?? '') }}">
                                    @if($errors->has('hsn'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('hsn') }}
                                        </div>
                                    @endif
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
                                    <label class="required" for="discount">Discount</label>
                                    <input class="form-control {{ $errors->has('discount') ? 'is-invalid' : '' }}"
                                           type="number"
                                           name="discount" id="discount"
                                           value="{{ old('discount', $product->discount) }}" required>
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
                                           name="gst" id="gst" max="100" value="{{ old('gst', $product->gst ?? 18) }}"
                                           required>
                                    @if($errors->has('gst'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('gst') }}
                                        </div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="dispatch_time">Expected Dispatch Time</label>
                                    <input class="form-control {{ $errors->has('dispatch_time') ? 'is-invalid' : '' }}"
                                           type="text"
                                           name="dispatch_time" id="dispatch_time"
                                           value="{{ old('dispatch_time', $product->dispatch_time) }}">
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
                                    <span
                                        class="help-block">{{ trans('cruds.product.fields.sub_category_helper') }}</span>
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
                                                value="{{ $id }}" {{ $id == old('brand_id', $product->brand_id) ? 'selected' : '' }}>{{ $brand }}</option>
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
                            <div class="col-12">
                                <div class="form-group">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="is_returnable"
                                               id="is_returnable"
                                               value="1" {{ $product->is_returnable ? 'checked' : '' }}>
                                        <label class="form-check-label" for="is_returnable">Is this product
                                            returnable?</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    Return will be allowed with these conditions
                                    @foreach($returnConditions as $key => $returnCondition)
                                        <div class="form-check">
                                            <input
                                                class="form-check-input return_conditions"
                                                type="checkbox"
                                                name="return_conditions[]"
                                                id="conditions-{{ $key }}"
                                                value="{{ $key }}"
                                                {{ in_array($key, $selectedReturnConditions) ? 'checked' : '' }}
                                            >
                                            <label class="form-check-label"
                                                   for="conditions-{{ $key }}">{{$returnCondition}}</label>
                                        </div>
                                    @endforeach
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <button class="btn btn-danger" type="submit">
                        {{ trans('global.save') }}
                    </button>
                    <a href="{{route('admin.productOptions.list',$product->id)}}" class="btn btn-success">Edit Product Options</a>
                </div>
            </div>
        </div>


    </form>

@endsection

@section('scripts')
    <script>
        $(document).on('submit', '#productForm', function (e) {
            e.preventDefault();
            let isReturnable = $('#is_returnable').is(':checked')
            if (isReturnable) {
                const atLeastOneIsChecked = $('.return_conditions:checked').length > 0;
                if (!atLeastOneIsChecked) {
                    alert('Please select at least one return condition.')
                    return;
                }
            }
            let formData = new FormData($(this)[0]);
            $.ajax({
                url: "{{route('admin.products.update')}}",
                type: 'POST',
                dataType: 'json',
                data: formData,
                cache: false,
                processData: false,
                contentType: false,
                success: function (result) {
                    if (result.status) {
                        $.toast({
                            heading: 'Success',
                            text: result?.message,
                            showHideTransition: 'slide',
                            icon: 'success',
                            position: 'top-right',
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

        let category = "{{ old('product_category_id', $product->product_category_id ?? '') }}";
        let subCategory = "{{ old('product_sub_category_id', $product->product_sub_category_id ?? '') }}";

        setTimeout(() => {
            $('#product_category_id').val(category).trigger('change');
        }, 100);




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
                error: function (jqXHR, textStatus) {
                    console.log(textStatus);
                }
            });
        });
    </script>
@endsection
