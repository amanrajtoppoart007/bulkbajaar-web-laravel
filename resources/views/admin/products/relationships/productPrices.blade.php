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
                        Images
                    </th>
                    <th>
                        {{ trans('cruds.productPrice.fields.id') }}
                    </th>
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
                </tr>
                </thead>
                <tbody>
                @foreach($productOptions as $key => $productOption)
                    <tr data-entry-id="{{ $productOption->id }}">
                        <td>
                            @if($productOption->images)
                                @foreach($productOption->images as $image)
                                    <img style="width:80px;height:80px;border-radius:4px;margin:4px" class="img-thumbnail" src="{{$image->preview_url}}" alt="">
                                @endforeach
                            @endif
                        </td>
                        <td>
                            {{ $productOption->id ?? '' }}
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
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
