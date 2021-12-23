@extends('layouts.admin')
@section('content')

<div class="card">
    <div class="card-header">
        {{ trans('global.show') }} {{ trans('cruds.transaction.title') }}
        <div class="float-right">
            <a class="btn btn-sm btn-default" href="{{ route('admin.transactions.index') }}">
                {{ trans('global.back_to_list') }}
            </a>
        </div>
    </div>

    <div class="card-body">
        <div class="row">
            <div class="col-4">
                <div class="form-group">
                    <label for="" class="font-weight-bolder">Payment ID
                        : </label>
                    <span>{{ $transaction->payment_id ?? '' }}</span>
                </div>
            </div><div class="col-4">
                <div class="form-group">
                    <label for="" class="font-weight-bolder">Type
                        : </label>
                    <span>{{ $transaction->entity ?? '' }}</span>
                </div>
            </div>
            <div class="col-4">
                <div class="form-group">
                <label for="" class="font-weight-bolder">{{ trans('cruds.order.fields.status') }}: </label>
                <span>{{ $transaction->status ?? '' }}</span>
                </div>
            </div>
            <div class="col-4">
                <div class="form-group">
                <label for="" class="font-weight-bolder">{{ trans('global.date') }}: </label>
                <span>{{ date('d-m-Y H:i:s', strtotime($transaction->created_at)) }}</span>
                </div>
            </div>
            <div class="col-4">
                <div class="form-group">
                <label for="" class="font-weight-bolder">Currency: </label>
                <span>{{ $transaction->currency ?? '' }}</span>
                </div>
            </div>
            <div class="col-4">
                <div class="form-group">
                <label for="" class="font-weight-bolder">Method: </label>
                <span>{{ $transaction->method ?? '' }}</span>
                </div>
            </div>
            <div class="col-4">
                <div class="form-group">
                <label for="" class="font-weight-bolder">Buyer: </label>
                <span><a href="{{ route('admin.users.show', $transaction->user_id) }}" target="_blank">{{ $transaction->user->name ?? '' }}</a></span>
                </div>
            </div>
            <div class="col-4">
                <div class="form-group">
                <label for="" class="font-weight-bolder">Payment Gateway: </label>
                <span>{{ $transaction->gateway ?? '' }}</span>
                </div>
            </div>
            <div class="col-4">
                <div class="form-group">
                <label for="" class="font-weight-bolder">Amount: </label>
                <span>{{ ($transaction->amount ?? 0) / 100 }}</span>
                </div>
            </div>
        </div>
        <hr>
        <h6>{{ trans('cruds.order.title_singular') }} {{ trans('global.list') }}</h6>
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th style="min-width: 150px; max-width: 200px">Order No</th>
                    <th>Vendor</th>
                    <th>{{ trans('cruds.orderItem.fields.amount') }}</th>
                    <th>Charge</th>
                    <th>{{ trans('cruds.orderItem.fields.discount') }}</th>
                    <th>{{ trans('cruds.orderItem.fields.total_amount') }}</th>
                    <th>Status</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                @foreach($orders as $order)
                    <tr>
                        <td>
                            {{ $order->order_number ?? '' }}
                        </td>
                        <td>
                            {{ $order->vendor->name ?? '' }}
                        </td>
                        <td>
                            {{ $order->sub_total ?? '' }}
                        </td>
                        <td>
                            &#8377;{{ $order->charge_amount ?? '' }}
                        </td>
                        <td>
                            &#8377;{{ $order->discount_amount ?? '' }}
                        </td>
                        <td>
                            &#8377;{{ $order->grand_total ?? '' }}
                        </td>
                        <td>
                            {{ \App\Models\Order::STATUS_SELECT[$order->status] ?? '' }}
                        </td>
                        <td>
                            <a class="btn btn-sm btn-info" href="{{ route('admin.orders.show', $order) }}" target="_blank">View</a>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>



@endsection
