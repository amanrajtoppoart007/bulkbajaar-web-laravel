<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTransactionsTable extends Migration
{
    public function up()
    {
        Schema::create('transactions', function (Blueprint $table) {
            $table->id();
            $table->string('payment_id')->nullable();
            $table->string('refund_id')->nullable();
            $table->string('gateway')->nullable();
            $table->string('entity')->nullable();
            $table->double('amount');
            $table->string('status');
            $table->string('currency')->nullable();
            $table->string('method')->nullable();
            $table->text('meta_data');
            $table->string('order_group')->index();
            $table->foreignId('user_id')->nullable()->constrained();
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
        Schema::dropIfExists('transactions');
    }
}
