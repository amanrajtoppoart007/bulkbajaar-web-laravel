@extends('vendor.layout.main')
@section('content')

    <div class="card">
        <div class="card-header">

            Order Details
            <div class="float-right">
                <a class="btn btn-default" href="{{ route('vendor.orders.index') }}">
                    {{ trans('global.back_to_list') }}
                </a>
                @if(strtoupper($order->status) == "PENDING")
                    <button class="btn btn-danger" id="cancel-button">
                        {{ trans('global.cancel') }}
                    </button>
                @endif
                @if(strtoupper($order->status) == "PENDING")
                    <button class="btn btn-success" id="confirm-button">
                        Confirm
                    </button>
                @endif

                <button type="button" class="btn btn-warning" id="status-button" data-toggle="modal" data-target="#statusModal">{{ trans('global.update_status') }}</button>

                @if($order->is_invoice_generated)
                    <a target="_blank" href="{{ route('orders.print.invoice', $order->invoice->invoice_number ?? '') }}" class="btn btn-sm btn-danger">
                        {{ trans('global.print') }} {{ trans('global.invoice') }}
                    </a>
                @endif
                <a target="_blank" href="{{ route('vendor.orders.show.ship-form', $order->order_number ?? '') }}" class="btn btn-success">
                    Ship
                </a>
            </div>
        </div>

        <div class="card-body">
            <div class="row">
                <div class="col-4">
                    <div class="form-group">
                        <label for="" class="font-weight-bolder">{{ trans('cruds.order.fields.order_number') }}: </label>
                        <span>{{ $order->order_number }}</span>
                    </div>
                </div>
                <div class="col-4">
                    <label for="" class="font-weight-bolder">{{ trans('cruds.order.fields.status') }}: </label>
                    <span>{{ \App\Models\Order::STATUS_SELECT[$order->status] ?? $order->status }}</span>
                </div>
                <div class="col-4">
                    <label for="" class="font-weight-bolder">{{ trans('global.date') }}: </label>
                    <span>{{ date('d-m-Y', strtotime($order->created_at)) }}</span>
                </div>
                <div class="col-4">
                    <div class="form-group">
                        <label for="" class="font-weight-bolder">{{ trans('cruds.order.fields.payment_type') }}: </label>
                        <span>{{ \App\Models\Order::PAYMENT_TYPE_SELECT[$order->payment_type] ?? '' }}</span>
                    </div>
                </div>
                <div class="col-4">
                    <label for="" class="font-weight-bolder">{{ trans('cruds.order.fields.payment_status') }}: </label>
                    <span>{{ \App\Models\Order::PAYMENT_STATUS_SElECT[$order->payment_status] ?? '' }}</span>
                </div>
                <div class="col-4">
                    <label for="" class="font-weight-bolder">{{ trans('cruds.franchiseeOrderItem.fields.buyer') }}: </label>
                    <span>{{ $order->user->name ?? '' }}</span>
                </div>
            </div>
            <hr>
            <h6>Order Item {{ trans('global.list') }}</h6>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                <tr>
                    <th style="min-width: 150px; max-width: 200px">{{ trans('cruds.orderItem.fields.product') }}</th>
                    <th>Mrp</th>
                    <th>Discount</th>
                    <th>Price</th>
                    <th>{{ trans('cruds.orderItem.fields.quantity') }}</th>
                    <th>SubTotal</th>
                    <th colspan="2">Charge</th>
                    <th colspan="2">GST</th>
                    <th>{{ trans('cruds.orderItem.fields.total_amount') }}</th>
                </tr>
                </thead>
                    <tbody>
                @php $mrp_total=0; $discount_total=0; @endphp
                @foreach($order->orderItems  as $orderItem)

                    @php
                        $mrp = ($orderItem?->product?->maximum_retail_price??0)*$orderItem->quantity;
                        $mrp_total+=$mrp;
                        $discount_total+= getPercentAmount($mrp,$orderItem->discount??0);
                        @endphp
                    <tr>

                        <td>
                            {{ $orderItem->product->name }} - {{ $orderItem->productOption->option ?? '' }}, {{ $orderItem->productOption->color ?? '' }}, {{ $orderItem->productOption->size ?? '' }}
                        </td>
                        <td>

                            {{ $orderItem?->product?->maximum_retail_price }}
                        </td>
                        <td>
                            {{ $orderItem->discount }}%
                        </td>
                        <td>
                            &#8377;{{ $orderItem->amount }}
                        </td>
                        <td>
                            {{ $orderItem->quantity }}
                        </td>
                        <td>
                            {{$orderItem->amount}}*{{ $orderItem->quantity }}=₹{{$orderItem->discount_amount}}
                        </td>
                        <td>
                            {{ $orderItem->charge_percent }}%
                        </td>
                        <td>
                            &#8377;{{ $orderItem->charge_amount }}
                        </td>
                        <td>
                            {{ $orderItem->gst }}%
                        </td>
                        <td>
                            &#8377;{{ $orderItem->gst_amount }}
                        </td>
                        <td>
                            &#8377;{{ $orderItem->total_amount }}
                        </td>
                    </tr>
                @endforeach
                </tbody>
                <tfoot>
                <tr>
                    <th colspan="6"></th>
                    <th colspan="5">{{ trans('global.mrp_total') }}: <span class="pull-right">&#8377;{{ $mrp_total }}</span></th>
                </tr>
                <tr>
                    <th colspan="6"></th>
                    <th colspan="5">{{ trans('global.discount') }}: <span class="text-success pull-right">- &#8377;{{ $discount_total }}</span></th>
                </tr>
                 <tr>
                    <th colspan="6"></th>
                    <th colspan="5">{{ trans('global.total') }}: <span class="pull-right"> &#8377;{{ $order->sub_total }}</span></th>
                </tr>
                <tr>
                    <th colspan="6"></th>
                    <th colspan="5">{{ trans('global.gst') }}: <span class="text-danger pull-right">+ &#8377;{{ $order->gst_amount }}</span></th>
                </tr>
                <tr>
                    <th colspan="6"></th>
                    <th colspan="5">{{ trans('global.grand_total') }}: <span class="pull-right">&#8377;{{ $order->grand_total }}</span></th>
                </tr>
                <tr>
                    <th colspan="6"></th>
                    <th colspan="5">Paid: <span class="pull-right">&#8377;{{ $order->amount_paid }}</span></th>
                </tr>
                <tr>
                    <th colspan="6"></th>
                    <th colspan="5">Balance: <span class="pull-right">&#8377;{{ $order->grand_total - $order->amount_paid }}</span></th>
                </tr>
                <tr>
                    <th colspan="6"></th>
                    <th colspan="5">Portal Charge: <span class="text-danger pull-right">- &#8377;{{ $order->charge_amount }}</span></th>
                </tr>
                <tr>
                    <th colspan="6"></th>
                    <th colspan="5">Vendor receive: <span class="pull-right">&#8377;{{ $order->grand_total - $order->charge_amount }}</span></th>
                </tr>

                </tfoot>
                </table>
            </div>
        </div>
    </div>

    @if($order->orderReturnRequests->count())
    <div class="card">
        <div class="card-header">
            Order Returns
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th style="min-width: 150px; max-width: 200px">{{ trans('cruds.franchiseeOrderItem.fields.product') }}</th>

                        <th>Price</th>
                        <th>Order Qty</th>
                        <th>Return Qty</th>
                        <th>Reason</th>
                        <th>Status</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($order->orderReturnRequests  as $orderReturnRequest)
                        <tr>
                            <td>
                                {{ $orderReturnRequest->product->name ?? '' }}
                            </td>
                            <td>
                                &#8377;{{ $orderReturnRequest->orderItem->amount ?? '' }}
                            </td>
                            <td>
                                {{ $orderReturnRequest->orderItem->quantity ?? 0 }}
                            </td>
                            <td>
                                {{ $orderReturnRequest->quantity ?? 0 }}
                            </td>
                            <td>
                                {{ $orderReturnRequest->productReturnCondition->title ?? '' }}
                            </td>

                            <td>
                                {{ \App\Models\OrderReturnRequest::STATUS_SELECT[$orderReturnRequest->status] ?? '' }}
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    @endif

    <div class="modal fade" id="statusModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">{{ trans('global.update_status') }}</h4>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">×</span></button>
                </div>
                <form id="statusForm">
                    <input type="hidden" name="id" id="id" value="{{ $order->id }}">
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="required" for="status">{{ trans('cruds.franchiseeOrder.fields.status') }}</label>
                            <select class="custom-select select2" name="status">
                                <option value="">{{ trans('global.pleaseSelect') }}</option>
                                @foreach(App\Models\Order::STATUS_SELECT_FOR_VENDOR as $key => $item)
                                    <option value="{{ $key }}" {{ $order->status == $key ? 'selected' : '' }}>{{ $item }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
                        <button class="btn btn-danger" type="submit">{{ trans('global.save') }}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
@section('scripts')
    @parent
    <script>
        $(function () {
            jQuery.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            let orderId = "{{ $order->id }}";

            $('#cancel-button').click(() => {
                if(confirm('Are you sure want to cancel the order?')){
                    $.post("{{ route('vendor.orders.cancel') }}", {orderId}, result => {
                        alert(result.message)
                        if(result.status){
                            location.reload()
                        }
                    }, 'json');
                }
            })

            $('#confirm-button').click(() => {
                if(confirm('Are you sure want to confirm the order?')){
                    $.post("{{ route('vendor.orders.confirm') }}", {orderId}, result => {
                        alert(result.message)
                        if(result.status){
                            location.reload()
                        }
                    }, 'json');
                }
            })

            $('#statusForm').submit(function (event){
                event.preventDefault();

                $.post("{{ route("vendor.orders.update-status") }}", $(this).serialize(), result => {
                    alert(result.message);
                    if(result.status){
                        location.reload()
                    }
                }, 'json')
            });
        });

    </script>
@endsection
