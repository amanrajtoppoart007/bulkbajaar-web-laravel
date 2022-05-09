@extends("vendor.layout.main")
@section("content")
    <div class="card">
        <div class="card-header">
            <div class="row">
                <div class="col"><h6 class="text-success">Product Options</h6></div>
                <div class="col text-right">
                    <a href="{{route('vendor.options.create',$product_id)}}" class="btn btn-success">Add Options</a>
                </div>
            </div>

        </div>
        <div class="card-body">
            @includeIf('vendor.products.relationships.productOptions', ['productOptions' => $options])
        </div>
    </div>
@endsection