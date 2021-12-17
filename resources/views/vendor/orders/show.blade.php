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
                @if($order->is_invoice_generated)
                    <a target="_blank" href="{{ route('orders.print.invoice', $order->invoice->invoice_number ?? '') }}" class="btn btn-sm btn-danger">
                        {{ trans('global.print') }} {{ trans('global.invoice') }}
                    </a>
                @endif
                @if(in_array($order->status, \App\Models\Order::CANCELLATION_ALLOWED))
                    <a target="_blank" href="{{ route('vendor.orders.show.ship-form', $order->order_number ?? '') }}" class="btn btn-sm btn-success">
                        Ship
                    </a>
                @endif
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
                    <span>{{ $order->status }}</span>
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
                    <label for="" class="font-weight-bolder">Buyer: </label>
                    <span>{{ $order->user->name ?? '' }}</span>
                </div>
            </div>
            <hr>
            <h6>Order Item {{ trans('global.list') }}</h6>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th style="min-width: 150px; max-width: 200px">{{ trans('cruds.franchiseeOrderItem.fields.product') }}</th>
                        <th>Option</th>
                        <th>{{ trans('cruds.franchiseeOrderItem.fields.price') }}</th>
                        <th>{{ trans('cruds.franchiseeOrderItem.fields.quantity') }}</th>
                        <th colspan="2">{{ trans('cruds.franchiseeOrderItem.fields.discount') }}</th>
                        <th>{{ trans('cruds.franchiseeOrderItem.fields.total_amount') }}</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($order->orderItems  as $orderItem)
                        <tr>
                            <td>
                                {{ $orderItem->product->name }}
                            </td>
                            <td>
                                {{ $orderItem->productOption->option ?? '' }}
                            </td>
                            <td>
                                &#8377;{{ $orderItem->amount }}
                            </td>
                            <td>
                                {{ $orderItem->quantity }}
                            </td>

                            <td>
                                {{ $orderItem->discount }}%
                            </td>
                            <td>
                                &#8377;{{ $orderItem->discount_amount }}
                            </td>
                            <td>
                                &#8377;{{ ($orderItem->amount * $orderItem->quantity) - $orderItem->discount_amount }}
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                    <tfoot>
                    <tr>
                        <th colspan="4"></th>
                        <th colspan="5">{{ trans('global.sub_total') }}: <span class="pull-right">&#8377;{{ $order->sub_total }}</span></th>
                    </tr>
                    <tr>
                        <th colspan="4"></th>
                        <th colspan="5">{{ trans('global.discount') }}: <span class="text-success pull-right">- &#8377;{{ $order->discount_amount }}</span></th>
                    </tr>
                    <tr>
                        <th colspan="4"></th>
                        <th colspan="5">{{ trans('global.grand_total') }}: <span class="pull-right">&#8377;{{ $order->sub_total - $order->discount_amount }}</span></th>
                    </tr>
                    </tfoot>
                </table>
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
        });

    </script>
@endsection
