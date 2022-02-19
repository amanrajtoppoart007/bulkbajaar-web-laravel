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
