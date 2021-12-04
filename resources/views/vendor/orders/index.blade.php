@extends('vendor.layout.main')
@section('content')
    <div class="card">
        <div class="card-header">
            My Order {{ trans('global.list') }}
        </div>

        <div class="card-body">
            <table class=" table table-bordered table-striped table-hover ajaxTable datatable datatable-Order">
                <thead>
                <tr>
                    <th></th>
                    <th>
                        {{ trans('cruds.franchiseeOrder.fields.order_number') }}
                    </th>
                    <th>
                        Buyer
                    </th>
                    <th>
                        Payment Status
                    </th>
                    <th>
                        Sub Total
                    </th>
                    <th>
                        {{ trans('cruds.franchiseeOrder.fields.discount') }}
                    </th>
                    <th>
                        Grand Total
                    </th>
                    <th>
                        {{ trans('cruds.franchiseeOrder.fields.status') }}
                    </th>
                    <th></th>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input class="search" type="text" placeholder="{{ trans('global.search') }}">
                    </td>
                    <td>
                        <input class="search" type="text" placeholder="{{ trans('global.search') }}">
                    </td>
                    <td>
                        <select class="search" strict="true">
                            <option value>{{ trans('global.all') }}</option>
                            @foreach(App\Models\Order::PAYMENT_STATUS_SElECT as $key => $item)
                                <option value="{{ $key }}">{{ $item }}</option>
                            @endforeach
                        </select>
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <select class="search" strict="true">
                            <option value>{{ trans('global.all') }}</option>
                            @foreach(App\Models\Order::STATUS_SELECT as $key => $item)
                                <option value="{{ $key }}">{{ $item }}</option>
                            @endforeach
                        </select>
                    </td>
                    <td></td>
                </tr>
                </thead>
            </table>
        </div>
    </div>
@endsection
@section('scripts')
    @parent
    <script>
        $(function () {
            let dtButtons = $.extend(true, [], $.fn.dataTable.defaults.buttons)
            let dtOverrideGlobals = {
                buttons: dtButtons,
                processing: true,
                serverSide: true,
                retrieve: true,
                aaSorting: [],
                ajax: "{{ route('vendor.orders.index') }}",
                columns: [
                    {data: 'placeholder', name: 'placeholder'},
                    {data: 'order_number', name: 'order_number'},
                    {data: 'user', name: 'user.name'},
                    {data: 'payment_status', name: 'payment_status'},
                    {data: 'sub_total', name: 'sub_total'},
                    {data: 'discount_amount', name: 'discount_amount'},
                    {data: 'total_amount', name: 'total_amount'},
                    {data: 'status', name: 'status'},
                    {data: 'actions', name: '{{ trans('global.actions') }}'}
                ],
                orderCellsTop: true,
                order: [[1, 'desc']],
                pageLength: 10,
            };
            let table = $('.datatable-Order').DataTable(dtOverrideGlobals);
            $('a[data-toggle="tab"]').on('shown.bs.tab click', function (e) {
                $($.fn.dataTable.tables(true)).DataTable()
                    .columns.adjust();
            });

            let visibleColumnsIndexes = null;
            $('.datatable thead').on('input', '.search', function () {
                let strict = $(this).attr('strict') || false
                let value = strict && this.value ? "^" + this.value + "$" : this.value

                let index = $(this).parent().index()
                if (visibleColumnsIndexes !== null) {
                    index = visibleColumnsIndexes[index]
                }

                table
                    .column(index)
                    .search(value, strict)
                    .draw()
            });
            table.on('column-visibility.dt', function (e, settings, column, state) {
                visibleColumnsIndexes = []
                table.columns(":visible").every(function (colIdx) {
                    visibleColumnsIndexes.push(colIdx);
                });
            })
        });

    </script>
@endsection
