@extends('layouts.admin')
@section('content')

<div class="card">
    <div class="card-header">
        {{ trans('global.show') }} {{ trans('cruds.product.title') }}
        @if($product->approval_status == 'PENDING')
            <form action="{{ route('admin.products.approve', $product) }}" method="post" class="float-right">
                @csrf
                <button class="btn btn-success">Approve</button>
            </form>
        @endif
    </div>

    <div class="card-body">
        <div class="form-group">
            <div class="form-group">
                <a class="btn btn-default" href="{{ route('admin.products.index') }}">
                    {{ trans('global.back_to_list') }}
                </a>
            </div>
            <table class="table table-bordered table-striped">
                <tbody>
                <tr>
                    <th>
                        {{ trans('cruds.product.fields.id') }}
                    </th>
                    <td>
                        {{ $product->id }}
                    </td>
                </tr>
                <tr>
                    <th>
                        Seller
                    </th>
                    <td>
                        {{ $product->vendor->name ?? '' }}
                    </td>
                </tr>
                <tr>
                    <th>
                        {{ trans('cruds.product.fields.name') }}
                    </th>
                    <td>
                        {{ $product->name }}
                    </td>
                </tr>
                <tr>
                    <th>
                        Display Price
                    </th>
                    <td>
                        &#8377;{{ applyPrice($product->price, $product->discount) }}
                    </td>
                </tr>
                <tr>
                    <th>
                        {{ trans('cruds.product.fields.discount') }}
                    </th>
                    <td>
                        {{ $product->discount }}% (&#8377;{{ getPercentAmount($product->price, $product->discount) }})
                    </td>
                </tr>
                <tr>
                    <th>
                        {{ trans('cruds.product.fields.price') }}
                    </th>
                    <td>
                        &#8377;{{ $product->price }}
                    </td>
                </tr>
                <tr>
                    <th>
                        GST
                    </th>
                    <td>
                        {{ $product->gst }}%
                    </td>
                </tr>
                <tr>
                    <th>
                        Portal Charge %
                    </th>
                    <td>
                        <form id="charge-form">
                            <div class="input-group mb-3">
                                <input type="hidden" name="product_id" value="{{ $product->id }}">
                                <input type="number" name="charge" step="0.1" min="0" max="100" value="{{ $portalChargePercent }}" class="form-control" placeholder="Charge" aria-label="Charge" aria-describedby="button-addon2">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-success" type="submit" id="button-addon2"><i class="fas fa-save"></i></button>
                                </div>
                            </div>
                        </form>
                    </td>
                </tr>
                <tr>
                    <th>
                        Vendor Receive
                    </th>
                    <td>
                        &#8377;{{ $product->price - getPercentAmount($product->price, $portalChargePercent) }}
                    </td>
                </tr>
                <tr>
                    <th>
                        SKU
                    </th>
                    <td>
                        {{ $product->sku ?? '' }}
                    </td>
                </tr>
                <tr>
                    <th>
                        HSN
                    </th>
                    <td>
                        {{ $product->hsn ?? '' }}
                    </td>
                </tr>
                <tr>
                    <th>
                        Minimum Price Quantity
                    </th>
                    <td>
                        {{ $product->moq ?? 0 }}
                    </td>
                </tr>
                <tr>
                    <th>
                        Category
                    </th>
                    <td>
                        {{ $product->productCategory->name ?? '' }}
                    </td>
                </tr>
                <tr>
                    <th>
                        Sub Category
                    </th>
                    <td>
                        {{ $product->productSubCategory->name ?? '' }}
                    </td>
                </tr>
                <tr>
                    <th>
                        Brand
                    </th>
                    <td>
                        {{ $product->brand->title ?? '' }}
                    </td>
                </tr>
                <tr>
                    <th>
                        Expected Dispatch Time
                    </th>
                    <td>
                        {{ $product->dispatch_time ?? '' }}
                    </td>
                </tr>
                <tr>
                    <th>
                        {{ trans('cruds.product.fields.images') }}
                    </th>
                    <td>
                        @foreach($product->images as $key => $media)
                            <a href="{{ $media->getUrl() }}" target="_blank" style="display: inline-block">
                                <img src="{{ $media->getUrl('thumb') }}">
                            </a>
                        @endforeach
                    </td>
                </tr>
                <tr>
                    <th>
                        {{ trans('cruds.product.fields.description') }}
                    </th>
                    <td>
                        {{ $product->description }}
                    </td>
                </tr>
                <tr>
                    <th>
                        Refund & Return Policy
                    </th>
                    <td>
                        {{ $product->rrp ?? '' }}
                    </td>
                </tr>
                <tr>
                    <th>
                        Returnable
                    </th>
                    <td>
                        {{ $product->is_returnable ? 'Yes' : 'No' }}
                    </td>
                </tr>
                <tr>
                    <th>
                        Returnable Conditions
                    </th>
                    <td>
                        @foreach($product->productReturnConditions as $productReturnCondition)
                            {{ ($loop->index + 1) . '. ' .  $productReturnCondition->title ?? '' }}<br>
                        @endforeach
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="form-group">
                <a class="btn btn-default" href="{{ route('admin.products.index') }}">
                    {{ trans('global.back_to_list') }}
                </a>
            </div>
        </div>
    </div>
</div>
<div class="card">
    <div class="card-header">
        {{ trans('global.relatedData') }}
    </div>
    <ul class="nav nav-tabs" role="tablist" id="relationship-tabs">
        <li class="nav-item">
            <a class="nav-link active" href="#product_prices" role="tab" data-toggle="tab">
                Options
            </a>
        </li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active show" role="tabpanel" id="product_prices">
            @includeIf('admin.products.relationships.productPrices', ['productOptions' => $product->productOptions])
        </div>
    </div>
</div>
@endsection


@section('scripts')
    <script>
        $(document).on('submit', '#charge-form', function(e) {
            var formData = new FormData($(this)[0]);
            $.ajax({
                url: "{{route('admin.products.update-portal-charge')}}",
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
