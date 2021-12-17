<?php

namespace App\Http\Controllers;

use App\Models\Invoice;
use App\Models\Order;
use Illuminate\Http\Request;

class InvoiceController extends Controller
{
    public function printInvoice($invoiceNo)
    {

        $invoice = Invoice::where('invoice_number', $invoiceNo)->first();
        $invoice->load(['order.billingAddress', 'order.shippingAddress']);
        if(is_null($invoiceNo)){
            abort(404);
        }


        $order = $invoice->order;

        return view('extra.orderInvoice', compact('invoice', 'order'));
    }
}
