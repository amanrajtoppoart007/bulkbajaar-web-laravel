
<div class="card">
    <div class="card-header">
        Return Request {{ trans('global.list') }}
    </div>

    <div class="card-body">
        <div class="table-responsive">
            <table class=" table table-bordered table-striped table-hover datatable datatable-orderReturnRequests">
                <thead>
                    <tr>
                        <th width="10">

                        </th>
                        <th>
                            {{ trans('cruds.transaction.fields.id') }}
                        </th>
                        <th>
                            Product
                        </th>
                        <th>
                            Order Qty
                        </th>
                        <th>
                            Return Qty
                        </th>
                        <th>
                            Reason
                        </th>

                        <th>
                            {{ trans('cruds.transaction.fields.status') }}
                        </th>
                        <th>
                            &nbsp;
                        </th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($orderReturnRequests as $key => $orderReturnRequest)
                        <tr data-entry-id="{{ $orderReturnRequest->id }}">
                            <td>

                            </td>
                            <td>
                                {{ $orderReturnRequest->id ?? '' }}
                            </td>
                            <td>
                                {{ $orderReturnRequest->product->name ?? '' }}
                            </td>
                            <td>
                                {{ $orderReturnRequest->orderItem->quantity ?? '' }}
                            </td>
                            <td>
                                {{ $orderReturnRequest->quantity ?? '' }}
                            </td>
                            <td>
                                {{ $orderReturnRequest->productReturnCondition->title ?? '' }}
                            </td>
                            <td>
                                {{ \App\Models\OrderReturnRequest::STATUS_SELECT[$orderReturnRequest->status] ?? '' }}
                            </td>

                            <td>
                                <a class="btn btn-xs btn-primary d-none" href="{{ route('admin.transactions.show', $orderReturnRequest->id) }}">
                                    {{ trans('global.view') }}
                                </a>
                            </td>

                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>

@section('scripts')
@parent
<script>
    $(function () {
  let dtButtons = $.extend(true, [], $.fn.dataTable.defaults.buttons)

  $.extend(true, $.fn.dataTable.defaults, {
    orderCellsTop: true,
    order: [[ 1, 'desc' ]],
    pageLength: 100,
  });
  let table = $('.datatable-orderReturnRequests:not(.ajaxTable)').DataTable({ buttons: dtButtons })
  $('a[data-toggle="tab"]').on('shown.bs.tab click', function(e){
      $($.fn.dataTable.tables(true)).DataTable()
          .columns.adjust();
  });

})

</script>
@endsection
