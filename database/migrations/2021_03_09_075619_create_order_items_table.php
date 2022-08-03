<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrderItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('order_items', function (Blueprint $table) {
            $table->id();
            $table->foreignId('order_id')->constrained();
            $table->string('order_number')->nullable();
            $table->foreignId('product_id')->constrained();
            $table->foreignId('product_option_id')->nullable()->constrained();
            $table->float('price')->nullable();
            $table->integer('quantity')->nullable();
            $table->float('mrp')->nullable();
            $table->float('mrp_total')->nullable();
            $table->float('amount');
            $table->float('discount')->comment('discount %');
            $table->float('discount_amount')->comment('discount');
            $table->float('charge_percent')->default(0)->comment('platform charge');
            $table->float('charge_amount')->default(0)->comment('platform charge');
            $table->float('total_amount');
            $table->string('status')->default('PENDING');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('order_items');
    }
}
