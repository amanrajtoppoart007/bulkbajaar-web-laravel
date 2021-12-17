<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ trans('panel.site_title') }}_{{ _('INVOICE') }}_{{ $invoice->invoice_number }}</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet"/>
</head>

<body>
<div class="container">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-12 text-center"><h1>INVOICE</h1></div>
                <div class="col-6">
                    <h5>Bulk Bajaar</h5>
                    <span>Address Line 1,</span><br>
                    <span>Address Line 2</span><br>
                    <span>email</span><br>
                    <span> Phone</span>
                </div>
                <div class="col-6 text-right">
{{--                    <img height="100px" src="{{ asset('assets/assets/images/logo-1.png') }}" alt="">--}}
                    Logo
                </div>
            </div>
            <div class="row mt-5">
                <div class="col-6">
                    <h4>Bill To</h4>
                    <span>{{ $order->user->name }}</span><br>
                    <span>{{ $order->billingAddress->address ?? '' }}</span><br>
                    @isset($order->billingAddress->address_line_two)
                        <span>{{ $order->billingAddress->address_line_two ?? '' }}</span><br>
                    @endisset
                    <span>{{ $order->billingAddress->district->name ?? '' }}</span>,
                    <span>{{ $order->billingAddress->state->name ?? '' }}</span>
                    -
                    <span>{{ $order->billingAddress->pincode ?? '' }}</span><br>
                    <span>{{ $order->user->mobile ?? '' }}</span>
                </div>
                <div class="col-6 text-right">
                    <h4>Invoice Details</h4>
                    <div class="row">
                        <div class="col-6">Invoice #:</div>
                        <div class="col-6">{{ $invoice->invoice_number }}</div>
                        <div class="col-6">Invoice Date:</div>
                        <div
                            class="col-6">{{ \Illuminate\Support\Carbon::parse($invoice->date_time)->format('d M Y h:i:s') }}</div>
                        <div class="col-6">Mode of payment:</div>
                        <div class="col-6">{{ $invoice->payment_type }}</div>

                        <div class="col-6">Payment Status:</div>
                        <div class="col-6">{{ $order->payment_status }}</div>

                    </div>
                </div>
            </div>
            <div class="table-responsive mt-5">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th style="width: 350px">Description</th>
                        <th>Price</th>
                        <th>Qty</th>
                        <th>Discount</th>
                        <th>Total</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($order->orderItems  as $orderItem)
                        <tr>
                            <td>
                                {{ $orderItem->product->name ?? '' }}
                                @if($orderItem->product_option_id)
                                    {{ $orderItem->productOption->option ?? '' }}
                                @endif
                            </td>
                            <td>
                                &#8377;{{ $orderItem->amount }}
                            </td>
                            <td>
                                {{ $orderItem->quantity }}
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
                        <th rowspan="6" colspan="4" style="text-align: center">Thank your for your business</th>
                    </tr>
                    <tr>
                        <th colspan="5">SUBTOTAL: <span class="pull-right">&#8377;{{ $order->sub_total + $order->charge_amount }}</span></th>
                    </tr>
                    <tr>
                        <th colspan="5">DISCOUNT: <span class="pull-right">- &#8377;{{ $order->discount_amount }}</span></th>
                    </tr>
                    <tr>
                        <th colspan="5">GRAND TOTAL:<span class="pull-right">&#8377;{{ $order->grand_total }}</span>
                        </th>
                    </tr>
                    </tfoot>
                </table>
            </div>

            <div>
                <h6>Terms & Conditions</h6>
                <hr>
                <span>Bill once paid cannot be refunded.</span><br>
                <span>Please confirm amount within 5 days of invoice generated.</span>
            </div>
        </div>
    </div>
</div>
</body>

</html>
