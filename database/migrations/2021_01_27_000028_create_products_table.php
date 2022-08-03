<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->foreignId('vendor_id')->nullable()->constrained();
            $table->string('name')->nullable();
            $table->string('slug')->unique();
            $table->longText('description')->nullable();
            $table->float('gst')->nullable();
            $table->string('gst_type')->nullable();
            $table->float('maximum_retail_price')->nullable();
            $table->decimal('discount', 5, 2)->default(0);
            $table->decimal('price', 15, 2)->nullable();
            $table->unsignedSmallInteger('moq')->default(4)->comment('Minimum order quantity');
            $table->foreignId('product_category_id')->nullable()->constrained();
            $table->foreignId('product_sub_category_id')->nullable()->constrained();
            $table->string('dispatch_time')->nullable()->comment('Expected Dispatch Time');
            $table->text('rrp')->nullable()->comment('Refund & Return Policy');
            $table->string('approval_status')->default('PENDING');
            $table->unsignedInteger('quantity')->nullable();
            $table->string('sku')->nullable();
            $table->string('hsn')->nullable();
            $table->unsignedBigInteger('order_count')->default(0);
            $table->integer('is_returnable')->default(0);
            $table->json('product_attributes')->nullable();
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
        Schema::dropIfExists('products');
    }
}
