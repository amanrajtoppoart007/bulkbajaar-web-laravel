<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->foreignId('user_id')->constrained();
            $table->foreignId('billing_address_id')->constrained('user_addresses');
            $table->foreignId('shipping_address_id')->constrained('user_addresses');
            $table->string('order_number');
            $table->string('order_group_number');
            $table->foreignId('vendor_id')->nullable()->constrained();
            $table->string('payment_type')->nullable();
            $table->decimal('sub_total');
            $table->decimal('discount_amount')->nullable();
            $table->decimal('charge_percent', 5,2)->default(0)->comment('platform chargecharge');
            $table->decimal('charge_amount')->default(0)->comment('platform charge');
            $table->decimal('grand_total');
            $table->decimal('amount_paid')->default(0);
            $table->string('payment_status')->nullable();
            $table->string('status')->default('PENDING');
            $table->boolean('is_invoice_generated')->default(false);
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
    }
}
