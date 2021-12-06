@extends('layouts.admin')
@section('content')

<div class="card">
    <div class="card-header">
        {{ trans('global.show') }} {{ trans('cruds.order.title') }}
        <div class="float-right">
            <a class="btn btn-sm btn-default" href="{{ route('admin.orders.index') }}">
                {{ trans('global.back_to_list') }}
            </a>
            @if(strtoupper($order->status) == "PENDING")
                <button class="btn btn-sm btn-danger" id="cancel-button">
                    {{ trans('global.cancel') }}
                </button>
            @endif
            @if(strtoupper($order->status) == "CANCELLED" && strtoupper($order->payment_type) == "ONLINE" && strtoupper($order->payment_status) == "SUCCESS")
                <button class="btn btn-sm btn-danger" id="refund-button">
                    {{ trans('global.refund') }}
                </button>
            @endif
            @if($order->status != 'CANCELLED' || $order->status != 'RECEIVED')
                <button type="button" class="btn btn-sm btn-warning" id="status-button" data-toggle="modal" data-target="#statusModal">{{ trans('global.update_status') }}</button>
            @endif
            @if($order->is_invoice_generated)
                <a target="_blank" href="{{ route('orders.print.invoice', $order->invoice->invoice_number ?? '') }}" class="btn btn-sm btn-danger">
                    {{ trans('global.print') }} {{ trans('global.invoice') }}
                </a>
            @else
                <button class="btn btn-sm btn-danger" id="generate-invoice-button">
                    {{ trans('global.generate') }} {{ trans('global.invoice') }}
                </button>
            @endif
        </div>
    </div>

    <div class="card-body">
        <div class="row">
            <div class="col-4">
                <div class="form-group">
                    <label for="" class="font-weight-bolder">{{ trans('cruds.order.fields.order_number') }}
                        : </label>
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
                    <label for="" class="font-weight-bolder">{{ trans('cruds.order.fields.payment_type') }}
                        : </label>
                    <span>{{ $order->payment_type }}</span>
                </div>
            </div>
            <div class="col-4">
                <label for="" class="font-weight-bolder">{{ trans('cruds.order.fields.payment_status') }}: </label>
                <span>{{ $order->payment_status }}</span>
                @if(!$order->is_payment_verified)
                    <button class="btn btn-xs btn-danger" id="verify-payment-button">Verify</button>
                @endif
            </div>
            <div class="col-4">
                <label for="" class="font-weight-bolder">Status: </label>
                <span>{{ $order->status ?? '' }}</span>
            </div>
            <div class="col-4">
                <label for="" class="font-weight-bolder">Seller: </label>
                <span>{{ $order->vendor->name ?? '' }}</span>
            </div>
        </div>
        <div class="row">
            <div class="col-6">
                <label for="" class="font-weight-bolder">Billing Address: </label>
                <br>
                <span>{{ $order->billingAddress->name ?? '' }}</span>,
                <span>{{ $order->billingAddress->address ?? '' }}</span>,
                <span>{{ $order->billingAddress->address_line_two ?? '' }}</span>,
                <span>{{ $order->billingAddress->district->name ?? '' }}</span>,
                <span>{{ $order->billingAddress->state->name ?? '' }}</span> -
                <span>{{ $order->billingAddress->pincode ?? '' }}</span>
            </div>
            <div class="col-6">
                <label for="" class="font-weight-bolder">Shipping Address: </label>
                <br>
                <span>{{ $order->shippingAddress->name ?? '' }}</span>,
                <span>{{ $order->shippingAddress->address ?? '' }}</span>,
                <span>{{ $order->shippingAddress->address_line_two ?? '' }}</span>,
                <span>{{ $order->shippingAddress->district->name ?? '' }}</span>,
                <span>{{ $order->shippingAddress->state->name ?? '' }}</span> -
                <span>{{ $order->shippingAddress->pincode ?? '' }}</span>
            </div>
        </div>
        <hr>
        <h6>{{ trans('cruds.orderItem.title_singular') }} {{ trans('global.list') }}</h6>
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th style="min-width: 150px; max-width: 200px">{{ trans('cruds.orderItem.fields.product') }}</th>
                    <th>Option</th>
                    <th>{{ trans('cruds.orderItem.fields.amount') }}</th>
                    <th>{{ trans('cruds.orderItem.fields.quantity') }}</th>
                    <th colspan="2">Charge</th>
                    <th colspan="2">{{ trans('cruds.orderItem.fields.discount') }}</th>
                    <th>{{ trans('cruds.orderItem.fields.total_amount') }}</th>
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
                            {{ $orderItem->charge_percent }}%
                        </td>
                        <td>
                            &#8377;{{ $orderItem->charge_amount }}
                        </td>
                        <td>
                            {{ $orderItem->discount }}%
                        </td>
                        <td>
                            &#8377;{{ $orderItem->discount_amount }}
                        </td>
                        <td>
                            &#8377;{{ $orderItem->total_amount }}
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
                    <th colspan="5">Charge: <span class="text-danger pull-right">+ &#8377;{{ $order->charge_amount }}</span></th>
                </tr>
                <tr>
                    <th colspan="4"></th>
                    <th colspan="5">{{ trans('global.discount') }}: <span class="text-success pull-right">- &#8377;{{ $order->discount_amount }}</span></th>
                </tr>
                <tr>
                    <th colspan="4"></th>
                    <th colspan="5">{{ trans('global.grand_total') }}: <span class="pull-right">&#8377;{{ $order->grand_total }}</span></th>
                </tr>
                <tr>
                    <th colspan="4"></th>
                    <th colspan="5">Paid: <span class="pull-right">&#8377;{{ $order->amount_paid }}</span></th>
                </tr>
                <tr>
                    <th colspan="4"></th>
                    <th colspan="5">Balance: <span class="pull-right">&#8377;{{ $order->grand_total - $order->amount_paid }}</span></th>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>

<div class="card">
    <div class="card-header">
        {{ trans('global.relatedData') }}
    </div>
    <ul class="nav nav-tabs" role="tablist" id="relationship-tabs">
        <li class="nav-item">
            <a class="nav-link active" href="#order_transactions" role="tab" data-toggle="tab">
                {{ trans('cruds.transaction.title') }}
            </a>
        </li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active show" role="tabpanel" id="order_transactions">
            @includeIf('admin.orders.relationships.orderTransactions', ['transactions' => $order->transactions])
        </div>
    </div>
</div>

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
                            @foreach(App\Models\Order::STATUS_SELECT_FOR_ADMIN as $key => $item)
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
                if(confirm('Are you sure want to cancel this order?')){
                    $.post("{{ route('admin.orders.cancel') }}", {orderId}, result => {
                        alert(result.message)
                        if(result.status){
                            location.reload();
                        }
                    }, 'json')
                }
            });

            $('#verify-payment-button').click(() => {
                if(confirm('Are you sure want to verify payment?')){
                    $.post("{{ route('admin.orders.verify.payment') }}", {orderId}, result => {
                        alert(result.message)
                        if(result.status){
                            location.reload();
                        }
                    }, 'json')
                }
            });

            $('#generate-invoice-button').click(() => {
                $.post("{{ route('admin.orders.generate.invoice') }}", {orderId}, result => {
                    alert(result.message)
                    if (result.status) {
                        location.reload();
                    }
                }, 'json')
            });

            $('#statusForm').submit(function (event){
                event.preventDefault();

                $.post("{{ route("admin.orders.update.status") }}", $(this).serialize(), result => {
                    alert(result.message);
                    if(result.status){
                        location.reload()
                    }
                }, 'json')
            });
        });

    </script>
@endsection
