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
            $table->double('amount');
            $table->unsignedSmallInteger('quantity');
            $table->double('discount', 5, 2);
            $table->double('discount_amount');
            $table->decimal('charge_percent', 5,2)->default(0)->comment('platform charge');
            $table->decimal('charge_amount')->default(0)->comment('platform charge');
            $table->unsignedTinyInteger('gst')->default(0);
            $table->decimal('gst_amount')->default(0);
            $table->double('total_amount');
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
