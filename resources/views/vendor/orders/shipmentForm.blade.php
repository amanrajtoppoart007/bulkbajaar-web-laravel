@extends('vendor.layout.main')
@section('content')

    <div class="card">
        <div class="card-header">
            Shipment Form
        </div>

        <div class="card-body">
            <form method="POST" action="{{ route("vendor.orders.ship", $order) }}" enctype="multipart/form-data">
                @csrf
                <div class="row">
                    <div class="col-6">
                        <h4>From</h4>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="required" for="from_name">Name</label>
                                    <input class="form-control {{ $errors->has('from_name') ? 'is-invalid' : '' }}" type="text" name="from_name" id="from_name" value="{{ old('from_name', $profile->representative_name ?? '') }}" required>
                                    @if($errors->has('from_name'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('from_name') }}
                                        </div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="from_email">Email</label>
                                    <input class="form-control {{ $errors->has('from_email') ? 'is-invalid' : '' }}" type="text" name="from_email" id="from_email" value="{{ old('from_email', $vendor->email ?? '') }}">
                                    @if($errors->has('from_email'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('from_email') }}
                                        </div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="required" for="from_phone_number">Phone Number</label>
                                    <input class="form-control {{ $errors->has('from_phone_number') ? 'is-invalid' : '' }}" type="text" name="from_phone_number" id="from_phone_number" value="{{ old('from_phone_number', $vendor->mobile ?? '') }}" required>
                                    @if($errors->has('from_phone_number'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('from_phone_number') }}
                                        </div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="required" for="from_address">Address</label>
                                    <input class="form-control {{ $errors->has('from_address') ? 'is-invalid' : '' }}" type="text" name="from_address" id="from_address" value="{{ old('from_address', $fromAddress ?? '') }}" required>
                                    @if($errors->has('from_address'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('from_address') }}
                                        </div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="required" for="from_pincode">Pincode</label>
                                    <input class="form-control {{ $errors->has('from_pincode') ? 'is-invalid' : '' }}" type="text" name="from_pincode" id="from_pincode" value="{{ old('from_pincode', $profile->pickup_pincode ?? '') }}" required>
                                    @if($errors->has('from_pincode'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('from_pincode') }}
                                        </div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="pickup_gstin">GST</label>
                                    <input class="form-control {{ $errors->has('pickup_gstin') ? 'is-invalid' : '' }}" type="text" name="pickup_gstin" id="pickup_gstin" value="{{ old('pickup_gstin', $profile->gst_number ?? '') }}">
                                    @if($errors->has('pickup_gstin'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('pickup_gstin') }}
                                        </div>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <h4>To</h4>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="required" for="to_name">Name</label>
                                    <input class="form-control {{ $errors->has('to_name') ? 'is-invalid' : '' }}" type="text" name="to_name" id="to_name" value="{{ old('to_name', $user->name ?? '') }}" required>
                                    @if($errors->has('to_name'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('to_name') }}
                                        </div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="from_email">Email</label>
                                    <input class="form-control {{ $errors->has('to_email') ? 'is-invalid' : '' }}" type="text" name="to_email" id="to_email" value="{{ old('to_email', $user->email ?? '') }}">
                                    @if($errors->has('to_email'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('to_email') }}
                                        </div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="required" for="to_phone_number">Phone Number</label>
                                    <input class="form-control {{ $errors->has('to_phone_number') ? 'is-invalid' : '' }}" type="text" name="to_phone_number" id="to_phone_number" value="{{ old('to_phone_number', $user->mobile ?? '') }}" required>
                                    @if($errors->has('to_phone_number'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('to_phone_number') }}
                                        </div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="required" for="to_address">Address</label>
                                    <input class="form-control {{ $errors->has('to_address') ? 'is-invalid' : '' }}" type="text" name="to_address" id="to_address" value="{{ old('to_address', $toAddress ?? '') }}" required>
                                    @if($errors->has('to_address'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('to_address') }}
                                        </div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="required" for="to_pincode">Pincode</label>
                                    <input class="form-control {{ $errors->has('to_pincode') ? 'is-invalid' : '' }}" type="text" name="to_pincode" id="to_pincode" value="{{ old('to_pincode', $shippingAddress->pincode ?? '') }}" required>
                                    @if($errors->has('to_pincode'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('to_pincode') }}
                                        </div>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <h4>Items</h4>
                        <table class="table">
                            <thead>
                            <th>Product</th>
                            <th>SKU</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>TAX(%)</th>
                            </thead>
                            <tbody>
                            @php $quantity = 0; @endphp
                            @foreach($order->orderItems as $index => $orderItem)
                                @php $quantity += $orderItem->quantity; @endphp
                                <tr>
                                    <td>
                                        <input type="text" class="form-control" name="item_list[{{ $index }}][item_name]" value="{{ $orderItem->product->name }} - {{ $orderItem->productOption->option ?? '' }}, {{ $orderItem->productOption->color ?? '' }}, {{ $orderItem->productOption->size ?? '' }}" required>
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" name="item_list[{{ $index }}][sku]" value="{{ $orderItem->product->sku ?? '' }}" required>
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" name="item_list[{{ $index }}][price]" value="{{ $orderItem->amount }}" required>
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" name="item_list[{{ $index }}][quantity]" value="{{ $orderItem->quantity }}" required>
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" name="item_list[{{ $index }}][item_tax_percentage]" value="{{ $orderItem->gst }}" required>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="col-12">
                        <h4>Shipment Details</h4>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="required" for="item_name">Item Name</label>
                                    <input class="form-control {{ $errors->has('item_name') ? 'is-invalid' : '' }}" type="text" name="item_name" id="item_name" value="{{ old('quantity', $itemName) }}" required>
                                    @if($errors->has('item_name'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('item_name') }}
                                        </div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label class="required" for="quantity">Quantity (total no of items)</label>
                                    <input class="form-control {{ $errors->has('quantity') ? 'is-invalid' : '' }}" type="number" name="quantity" id="quantity" value="{{ old('quantity', $quantity) }}" required>
                                    @if($errors->has('quantity'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('quantity') }}
                                        </div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label class="required" for="item_weight">Weight (KG)</label>
                                    <input class="form-control {{ $errors->has('item_weight') ? 'is-invalid' : '' }}" type="number" name="item_weight" id="item_weight" value="{{ old('item_weight',$weight) }}" required>
                                    @if($errors->has('item_weight'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('item_weight') }}
                                        </div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label class="required" for="item_breadth">Breadth (CM)</label>
                                    <input class="form-control {{ $errors->has('item_breadth') ? 'is-invalid' : '' }}" type="number" name="item_breadth" id="item_breadth" value="{{ old('item_breadth') }}" required>
                                    @if($errors->has('item_breadth'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('item_breadth') }}
                                        </div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label class="required" for="item_height">Height (CM)</label>
                                    <input class="form-control {{ $errors->has('item_height') ? 'is-invalid' : '' }}" type="number" name="item_height" id="item_height" value="{{ old('item_height') }}" required>
                                    @if($errors->has('item_height'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('item_height') }}
                                        </div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label class="required" for="item_length">Length (CM)</label>
                                    <input class="form-control {{ $errors->has('item_length') ? 'is-invalid' : '' }}" type="number" name="item_length" id="item_length" value="{{ old('item_length') }}" required>
                                    @if($errors->has('item_length'))
                                        <div class="invalid-feedback">
                                            {{ $errors->first('item_length') }}
                                        </div>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label class="required" for="invoice_value">Invoice Value</label>
                            <input class="form-control {{ $errors->has('invoice_value') ? 'is-invalid' : '' }}" type="number" name="invoice_value" id="invoice_value" value="{{ old('invoice_value', $order->grand_total ?? 0) }}" required>
                            @if($errors->has('invoice_value'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('invoice_value') }}
                                </div>
                            @endif
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label for="total_discount">Total Discount</label>
                            <input class="form-control {{ $errors->has('total_discount') ? 'is-invalid' : '' }}" type="number" name="total_discount" id="total_discount" value="{{ old('total_discount', $order->discount_amount) }}">
                            @if($errors->has('total_discount'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('total_discount') }}
                                </div>
                            @endif
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label for="cod_amount">COD Amount</label>
                            <input class="form-control {{ $errors->has('cod_amount') ? 'is-invalid' : '' }}" type="number" name="cod_amount" id="cod_amount" value="{{ old('cod_amount', $order->grand_total - $order->amount_paid) }}" >
                            @if($errors->has('cod_amount'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('cod_amount') }}
                                </div>
                            @endif
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label for="invoice_number">Invoice No</label>
                            <input class="form-control {{ $errors->has('invoice_number') ? 'is-invalid' : '' }}" type="text" name="invoice_number" id="invoice_number" value="{{ old('invoice_number', $order->invoice->invoice_number ?? '') }}" >
                            @if($errors->has('invoice_number'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('invoice_number') }}
                                </div>
                            @endif
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label for="ewaybill_no">Ewaybill No (Required if invoice value > 50000)</label>
                            <input class="form-control {{ $errors->has('ewaybill_no') ? 'is-invalid' : '' }}" type="text" name="ewaybill_no" id="ewaybill_no" value="{{ old('ewaybill_no') }}" >
                            @if($errors->has('ewaybill_no'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('ewaybill_no') }}
                                </div>
                            @endif
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <button class="btn btn-danger" type="submit">
                        Submit
                    </button>
                </div>
            </form>
        </div>
    </div>
@endsection
