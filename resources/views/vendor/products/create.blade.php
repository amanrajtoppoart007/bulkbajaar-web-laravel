@extends('vendor.layout.main')
@section('content')
    <div class="card">
        <div class="card-header">
            {{ trans('global.create') }} {{ trans('cruds.product.title_singular') }}
        </div>
        <div class="card-body">
            <form id="productForm" enctype="multipart/form-data">
                @csrf
                <div class="row">
                    <div class="col-6">
                        <div class="row">
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
                                    <label for="maximum_retail_price">MRP</label>
                                    <input class="form-control {{ $errors->has('maximum_retail_price') ? 'is-invalid' : '' }}"
                                           type="number"
                                           name="maximum_retail_price" id="maximum_retail_price" value="{{ old('maximum_retail_price', 0) }}">
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-group">
                                    <label for="discount">Discount</label>
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
                                    <label  for="charged_price">You will get (after deducting portal charge {{ $portalChargePercentage }}%)</label>
                                    <input class="form-control {{ $errors->has('charged_price') ? 'is-invalid' : '' }}"
                                           type="number"
                                           name="charged_price" id="charged_price" value="{{ old('charged_price', 0) }}" readonly>
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
                                    <label for="product_category_id">{{ trans('cruds.product.fields.category') }}</label>
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
                                    <label for="product_sub_category_id">{{ trans('cruds.product.fields.sub_category') }}</label>
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

                <div class="row">


                </div>
                <div class="form-group">
                    <button class="btn btn-danger" type="submit">
                        {{ trans('global.next') }}
                    </button>
                </div>
            </form>
        </div>
    </div>
@endsection

@section('scripts')
    <script>
        $(document).ready(function(){
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

                const form = new FormData(document.getElementById('productForm'));
                $.ajax({
                    url: "{{route('vendor.products.store')}}",
                    method: "POST",
                    data: form,
                    cache: false,
                    processData: false,
                    contentType: false,
                    success: function (result) {
                        const {message='',nextUrl='',status=0}= result;
                        if (status === 1) {

                            $.toast({
                                heading: 'Success',
                                text: message,
                                showHideTransition: 'slide',
                                icon: 'success',
                                position:'top-right',
                            });
                           window.location.href = nextUrl;
                        } else {

                            $.toast({
                                heading: 'Error',
                                text: message,
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

        let portalChargePercentage = "{{ $portalChargePercentage }}";
        const calculatePrice = () => {
            let mrp =   Number($('#maximum_retail_price').val());
            let discount = Number($('#discount').val());
            if(isNaN(mrp)) mrp = 0;
            if(isNaN(discount)) discount = 0;
            const price = mrp - ((mrp * discount) / 100);
            $('#price').val(price);
            $('#charged_price').val(price - ((price * portalChargePercentage) / 100))
        }
        $(document).on('blur', '#maximum_retail_price, #discount', function (){
            calculatePrice();
        });
        calculatePrice();
        });
    </script>
@endsection
