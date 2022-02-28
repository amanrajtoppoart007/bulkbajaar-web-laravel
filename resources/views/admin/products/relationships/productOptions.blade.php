<div class="card">
    <div class="card-header">
        Option {{ trans('global.list') }}
    </div>

    <div class="card-body">
        <div class="table-responsive">
            <table class=" table table-bordered table-striped table-hover datatable datatable-articleArticleComments">
                <thead>
                <tr>
                    <th>
                        Is Default
                    </th>
                    <th>Images</th>
                    <th>
                        Option
                    </th>
                    <th>
                        Color
                    </th>
                    <th>
                        Size
                    </th>
                    <th>
                        Unit
                    </th>
                    <th>
                        {{ trans('cruds.productPrice.fields.quantity') }}
                    </th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                @foreach($productOptions as $key => $productOption)
                    <tr data-entry-id="{{ $productOption->id }}">
                        <td>
                            {{ $productOption->is_default==1 ?'Yes':'No' }}
                        </td>
                        <td>
                            <div class="row">
                                @foreach($productOption->images as $image)
                                    <div class="col-12 col-md-2 col-lg-12 col-xl-2">
                                        <img class="img-thumbnail" src="{{$image->thumbnail}}"
                                             alt="Product option image">
                                    </div>
                                @endforeach
                            </div>
                        </td>
                        <td>
                            {{ $productOption->option ?? '' }}
                        </td>
                        <td>
                            {{ $productOption->color ?? '' }}
                        </td>
                        <td>
                            {{ $productOption->size ?? '' }}
                        </td>
                        <td>
                            {{ $productOption->unit ?? '' }}
                        </td>
                        <td>
                            {{ $productOption->quantity ?? '' }}
                        </td>
                        <td>
                            <a href="{{route('admin.productOptions.edit',$productOption->id)}}" class="btn btn-info">Edit</a>
                            <button class="btn btn-danger">Delete</button>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
