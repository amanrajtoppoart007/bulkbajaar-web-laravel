@extends("layouts.admin")
@section("content")
    <div class="card">
        <div class="card-header">
            <h6 class="text-success">Product Options</h6>
        </div>
        <div class="card-body">
            @includeIf('admin.products.relationships.productOptions', ['productOptions' => $options])
        </div>
    </div>
@endsection
