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
            @if(in_array($order->status, \App\Models\Order::RETURN_FORM_ALLOWEDD))
                <button type="button" class="btn btn-sm btn-warning" id="refund-button" data-toggle="modal" data-target="#refundModal">Refund</button>
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
                <span>{{ \App\Models\Order::STATUS_SELECT[$order->status] ?? $order->status }}</span>
            </div>
            <div class="col-4">
                <label for="" class="font-weight-bolder">{{ trans('global.date') }}: </label>
                <span>{{ date('d-m-Y H:i:s', strtotime($order->created_at)) }}</span>
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
                @if(!$order->payment_verified_by_id)
                    <button class="btn btn-xs btn-danger" id="verify-payment-button">Verify</button>
                @endif
            </div>
            <div class="col-4">
                <label for="" class="font-weight-bolder">Buyer: </label>
                <span><a href="{{ route('admin.users.show', $order->user_id) }}" target="_blank">{{ $order->user->name ?? '' }}</a></span>
            </div>
            <div class="col-4">
                <label for="" class="font-weight-bolder">Seller: </label>
                <span><a href="{{ route('admin.vendors.show', $order->vendor_id) }}" target="_blank">{{ $order->vendor->name ?? '' }}</a></span>
            </div>
        </div>
        <div class="row mt-4">
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
                    <th>Display Price</th>
                    <th>Vendor Price</th>
                    <th>{{ trans('cruds.orderItem.fields.quantity') }}</th>
                    <th colspan="2">Charge</th>
                    <th colspan="2">{{ trans('cruds.orderItem.fields.discount') }}</th>
                    <th colspan="2">GST</th>
                    <th>{{ trans('cruds.orderItem.fields.total_amount') }}</th>
                </tr>
                </thead>
                <tbody>
                @foreach($order->orderItems  as $orderItem)
                    <tr>
                        <td>
                            {{ $orderItem->product->name }} - {{ $orderItem->productOption->option ?? '' }}, {{ $orderItem->productOption->color ?? '' }}, {{ $orderItem->productOption->size ?? '' }}
                        </td>
                        <td>
                            &#8377;{{ applyPrice($orderItem->amount, $orderItem->discount) }}
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
                    <th colspan="5">{{ trans('global.sub_total') }}: <span class="pull-right">&#8377;{{ $order->sub_total + $order->discount_amount }}</span></th>
                </tr>
                <tr>
                    <th colspan="6"></th>
                    <th colspan="5">{{ trans('global.discount') }}: <span class="text-success pull-right">- &#8377;{{ $order->discount_amount }}</span></th>
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
        <li class="nav-item">
            <a class="nav-link" href="#order_return_requests" role="tab" data-toggle="tab">
                Return Requests
            </a>
        </li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active show" role="tabpanel" id="order_transactions">
            @includeIf('admin.orders.relationships.orderTransactions', ['transactions' => $order->transactions])
        </div>
        <div class="tab-pane" role="tabpanel" id="order_return_requests">
            @includeIf('admin.orders.relationships.orderReturnRequests', ['orderReturnRequests' => $order->orderReturnRequests])
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

<div class="modal fade" id="refundModal" role="dialog" aria-labelledby="returnModal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Refund form</h4>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">×</span></button>
            </div>
            <form id="refundForm">
                <input type="hidden" name="id" id="id" value="{{ $order->id }}">
                <div class="modal-body">
                    <div class="form-group">
                        <label>Select</label>
                        <table class=" table table-bordered table-striped table-hover">
                            <thead>
                            <tr>
                                <th width="10">

                                </th>
                                <th>
                                    Product
                                </th>
                                <th>
                                    Price
                                </th>
                                <th>
                                    Order Qty
                                </th>
                                <th>
                                    Return Qty
                                </th>
                                <th>
                                    Refund Amount
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            @php $totalRefundAmount = 0 @endphp
                            @foreach($order->orderReturnRequests as $index => $orderReturnRequest)
                                @php
                                    $refundAmount = ($orderReturnRequest->orderItem->amount ?? 0) * $orderReturnRequest->quantity;
                                    $totalRefundAmount += $refundAmount;
                                @endphp
                                <tr data-entry-id="{{ $orderReturnRequest->id }}">
                                    <td>
                                        <div class="form-check">
                                            <input type="checkbox" name="requested_items[{{ $index }}][id]" class="form-check-input select-refund-id" value="{{ $orderReturnRequest->id }}" checked>
                                        </div>
                                    </td>
                                    <td>
                                        {{ $orderReturnRequest->product->name ?? '' }}
                                    </td>
                                    <td>
                                        {{ $orderReturnRequest->orderItem->amount ?? '' }}
                                    </td>
                                    <td>
                                        {{ $orderReturnRequest->orderItem->quantity ?? '' }}
                                    </td>
                                    <td>
                                        {{ $orderReturnRequest->quantity ?? '' }}
                                    </td>

                                    <td>
                                        <div class="form-group">
                                            <input type="number" name="requested_items[{{ $index }}][amount]" class="form-control refund-amount" id="amount-{{ $orderReturnRequest->id }}" placeholder="Refund Amount" value="{{ $refundAmount }}">
                                        </div>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="5"></td>
                                <td>
                                    <div class="form-group">
                                        <input type="number" name="amount" id="total-refund-amount" class="form-control" placeholder="Refund Amount" value="{{ $totalRefundAmount }}" required>
                                    </div>
                                </td>
                            </tr>
                            </tfoot>
                        </table>
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


            $(document).on('change', '.select-refund-id', function (){
                if (this.checked){
                    $(this).closest('tr').find('.refund-amount').prop({
                        disabled: false,
                        required: true
                    })
                }else {
                    $(this).closest('tr').find('.refund-amount').prop({
                        disabled: true,
                        required: false
                    })
                }
                calculateTotal()
            })

            $(document).on('change', '.refund-amount', function (){
                calculateTotal()
            })

            const calculateTotal = () => {
                let total = 0;
                $('.refund-amount').map(function (){
                    if($(this).is(':disabled')){
                        total += 0;
                    }else{
                        total += parseFloat($(this).val())
                    }
                });
                $('#total-refund-amount').val(total)
            }

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

            $('#refundForm').submit(function (event){
                event.preventDefault();
                $.post("{{ route("admin.orders.refund") }}", $(this).serialize(), result => {
                    alert(result.message);
                    if(result.status){
                        location.reload()
                    }
                }, 'json')
            });
        });

    </script>
@endsection
