@extends("vendor.layout.main")
@section("content")

    <div class="row">
         <div class="col-12 col-md-9 col-lg-9 col-xl-9">
                <div class="card">
                    <div class="card-header bg-secondary">
                        {{ trans('global.dashboard') }}
                    </div>
                    <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <a href="{{ route('vendor.products.index') }}"
                                       class="card text-white bg-danger text-center">
                                        <div class="card-body pb-0">
                                            <div class="text-value font-20">{{$product_count}}</div>
                                            <div>Total Products</div>
                                            <br/>
                                        </div>
                                    </a>
                                </div>
                                <div class="col">
                                    <a href="{{ route('vendor.orders.index') }}"
                                       class="card text-white bg-warning text-center">
                                        <div class="card-body pb-0">
                                            <div class="text-value font-20">{{$pending_orders}}</div>
                                            <div>Pending Orders</div>
                                            <br/>
                                        </div>
                                    </a>
                                </div>
                                <div class="col">
                                    <a href="{{ route('vendor.orders.index')}}"
                                       class="card text-white bg-info text-center">
                                        <div class="card-body pb-0">
                                            <div class="text-value font-20">{{$received_orders}}</div>
                                            <div>New Orders</div>
                                            <br/>
                                        </div>
                                    </a>
                                </div>
                                <div class="col">
                                    <a href="{{ route('vendor.orders.index') }}">
                                        <div class="card text-white bg-success text-center">
                                            <div class="card-body pb-0">
                                                <div class="text-value font-20">{{$total_orders}}</div>
                                                <div>Total Orders</div>
                                                <br/>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>

                    </div>
                </div>
            </div>
    </div>
@endsection
