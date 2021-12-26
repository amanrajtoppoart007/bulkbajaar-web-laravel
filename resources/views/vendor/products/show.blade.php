@extends('vendor.layout.main')
@section('content')

<div class="card">
    <div class="card-header">
        {{ trans('global.show') }} {{ trans('cruds.product.title') }}
    </div>

    <div class="card-body">
        <div class="form-group">
            <div class="form-group">
                <a class="btn btn-default" href="{{ route('vendor.products.index') }}">
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
                            {{ trans('cruds.product.fields.name') }}
                        </th>
                        <td>
                            {{ $product->name }}
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
                            Display Price
                        </th>
                        <td>
                            {{ applyPrice($product->price, $product->discount) }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.product.fields.discount') }}
                        </th>
                        <td>
                            {{ $product->discount }}%
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.product.fields.price') }}
                        </th>
                        <td>
                            {{ $product->price }}
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
                            {{ $portalChargePercent }}%
                        </td>
                    </tr>
                    <tr>
                        <th>
                            You will get
                        </th>
                        <td>
                            {{ $product->price - getPercentAmount($product->price, $portalChargePercent) }}
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
                            Minimum Order Quantity
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
                <a class="btn btn-default" href="{{ route('vendor.products.index') }}">
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
            <a class="nav-link active" href="#product_options" role="tab" data-toggle="tab">
                Options
            </a>
        </li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active show" role="tabpanel" id="product_options">
            @includeIf('vendor.products.relationships.productOptions', ['productOptions' => $product->productOptions])
        </div>
    </div>
</div>


@endsection
