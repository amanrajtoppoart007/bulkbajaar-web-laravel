<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrderReturnRequestsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
         Schema::create('order_return_requests', function (Blueprint $table) {
            $table->id();
            $table->foreignId('order_id')->constrained();
            $table->foreignId('order_item_id')->constrained();
            $table->foreignId('product_id')->constrained();
            $table->foreignId('product_option_id')->nullable()->constrained();
            $table->foreignId('product_return_condition_id')->nullable()->constrained();
            $table->unsignedSmallInteger('quantity');
            $table->boolean('vendor_visibility')->default(false);
            $table->foreignId('vendor_id')->nullable()->constrained();
            $table->string('status')->default('PENDING');
            $table->string('comment')->nullable();
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
        Schema::dropIfExists('order_return_requests');
    }
}
