@extends('vendor.layout.main')
@section('content')

    <div class="card">
        <div class="card-header">
            Shipment Form
        </div>

        <div class="card-body">
            <form method="POST" action="{{ route("admin.admins.store") }}" enctype="multipart/form-data">
                <input type="hidden" name="order_id" value="{{ $order->id }}">
                <input type="hidden" name="order_date" value="{{ $order->created_at }}">
                @csrf
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label class="required" for="pickup_location">Pickup location</label>
                            <input class="form-control {{ $errors->has('pickup_location') ? 'is-invalid' : '' }}" type="text" name="pickup_location" id="pickup_location" value="{{ old('pickup_location', '') }}" required>
                            @if($errors->has('pickup_location'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('pickup_location') }}
                                </div>
                            @endif
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label for="company_name">Company Name</label>
                            <input class="form-control {{ $errors->has('company_name') ? 'is-invalid' : '' }}" type="text" name="company_name" id="company_name" value="{{ old('company_name') }}">
                            @if($errors->has('company_name'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('company_name') }}
                                </div>
                            @endif
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label class="required" for="billing_customer_name">Billing Customer Name</label>
                            <input class="form-control {{ $errors->has('billing_customer_name') ? 'is-invalid' : '' }}" type="text" name="billing_customer_name" id="billing_customer_name" value="{{ old('billing_customer_name') }}" required readonly>
                            @if($errors->has('billing_customer_name'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('billing_customer_name') }}
                                </div>
                            @endif
                        </div>
                    </div>

                </div>








                <div class="form-group">
                    <button class="btn btn-danger" type="submit">
                        Submit
                    </button>
                </div>
            </form>
        </div>
    </div>
@endsection
