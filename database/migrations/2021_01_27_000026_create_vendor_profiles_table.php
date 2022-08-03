<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVendorProfilesTable extends Migration
{
    public function up()
    {
        Schema::create('vendor_profiles', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->foreignId('vendor_id')->constrained();
            $table->string('company_name')->nullable();
            $table->string('representative_name')->nullable();
            $table->string('email')->nullable();
            $table->string('mobile')->nullable();
            $table->string('gst_number')->nullable();
            $table->string('pan_number')->nullable();
            $table->string('billing_address')->nullable();
            $table->string('billing_address_two')->nullable();
            $table->foreignId('billing_state_id')->nullable()->constrained('states');
            $table->foreignId('billing_district_id')->nullable()->constrained('districts');
            $table->string('billing_pincode')->nullable();
            $table->string('pickup_address')->nullable();
            $table->string('pickup_address_two')->nullable();
            $table->foreignId('pickup_state_id')->nullable()->constrained('states');
            $table->foreignId('pickup_district_id')->nullable()->constrained('districts');
            $table->string('pickup_pincode')->nullable();
            $table->string('bank_name')->nullable();
            $table->string('account_number')->nullable();
            $table->string('account_holder_name')->nullable();
            $table->string('ifsc_code')->nullable();
            $table->float('mop', )->default(0.00);
            $table->string('dispatch_delay_time')->nullable();
            $table->float('minimum_order_value', )->default(0.00);
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
        Schema::dropIfExists('vendor_profiles');
    }
}
