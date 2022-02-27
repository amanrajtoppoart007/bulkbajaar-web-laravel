<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductProductReturnConditionPivotTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
         Schema::create('product_product_return_condition', function (Blueprint $table) {
            $table->foreignId('product_id')->constrained();
            $table->unsignedBigInteger('product_return_condition_id');
            $table->foreign('product_return_condition_id', 'return_condition_id_fk_2995560')
                ->references('id')->on('product_return_conditions')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('product_product_return_condition');
    }
}
