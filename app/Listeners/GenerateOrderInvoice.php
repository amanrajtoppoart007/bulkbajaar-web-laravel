<?php

namespace App\Listeners;

use App\Events\OrderCreated;
use App\Models\Invoice;
use App\Traits\UniqueIdentityGeneratorTrait;
use Carbon\Carbon;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Support\Facades\DB;

class GenerateOrderInvoice implements ShouldQueue
{
    use UniqueIdentityGeneratorTrait;

    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param OrderCreated $event
     * @return void
     */
    public function handle(OrderCreated $event)
    {

        $order = $event->order;
        DB::beginTransaction();
        try {
            $invoice = new Invoice();
            $invoice->invoice_number = $this->generateInvoiceNumber();
            $invoice->date_time = Carbon::now()->format('Y-m-d h:i:s');
            $invoice->order_id = $order->id;
            $invoice->user_id = $order->user_id;
            $invoice->vendor_id = $order->vendor_id;
            $invoice->payment_type = $order->payment_type;
            $invoice->amount = $order->sub_total;
            $invoice->charge = $order->charge_amount;
            $invoice->discount = $order->discount_amount;
            $invoice->gst = $order->gst_amount;
            $invoice->total = $order->grand_total;
            $invoice->save();
            $order->is_invoice_generated = true;
            $order->save();
            DB::commit();
            return true;
        } catch (\Exception $exception) {
            DB::rollBack();
            return $exception->getMessage();
        }

    }
}
