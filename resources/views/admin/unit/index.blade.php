@extends('layouts.admin')
@section('content')

    <div class="card">
        <div class="card-header">
            <div class="row justify-content-between">
                <div class="col-lg-6">
                    {{ trans('cruds.unit.title_singular') }} {{ trans('global.list') }}
                </div>
                <div class="col-lg-6">
                    <button class="btn btn-success float-right" id="addButton">
                        {{ trans('global.add') }} {{ trans('cruds.unit.title_singular') }}
                    </button>
                </div>
            </div>

        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table class=" table table-bordered table-striped table-hover datatable datatable-unitType">
                    <thead>
                    <tr>
                        <th>

                        </th>
                        <th>
                            {{ trans('cruds.unit.fields.id') }}
                        </th>
                        <th>
                            {{ trans('cruds.unit.fields.unit') }}
                        </th>
                         <th>
                            {{ trans('cruds.unit.fields.unit_type') }}
                        </th>
                        <th>
                            {{ trans('cruds.unit.fields.status') }}
                        </th>
                        <th>
                            &nbsp;
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($units as $key => $unit)
                        <tr data-entry-id="{{ $unit->id }}">
                            <td>

                            </td>
                            <td>
                                {{ $unit->id ?? '' }}
                            </td>
                            <td>
                                {{ $unit->unit ?? '' }}
                            </td>
                            <td>
                                {{ $unit->unit_type ?? '' }}
                            </td>
                            <td>
                                <input type="checkbox" disabled="disabled" {{ $unit->status ? 'checked' : '' }}>
                            </td>
                            <td>
                                <button data-view-url="{{route('admin.get.unit',['id'=>$unit->id])}}"  class="btn btn-xs btn-info editButton" data-id="{{ $unit->id }}">
                                    {{ trans('global.edit') }}
                                </button>

                                <form action="{{ route('admin.unit.destroy', $unit->id) }}"
                                      method="POST" onsubmit="return confirm('{{ trans('global.areYouSure') }}');"
                                      style="display: inline-block;">
                                    <input type="hidden" name="_method" value="DELETE">
                                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                    <input type="submit" class="btn btn-xs btn-danger"
                                           value="{{ trans('global.delete') }}">
                                </form>
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        </div>

    </div>
    <div class="modal fade" id="addModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add/Edit Unit </h4>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">×</span></button>
                </div>
                <form id="unitForm">
                    <input type="hidden" name="id" id="id">
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="required" for="unit">{{ trans('cruds.unit.fields.unit') }}</label>
                            <input class="form-control" type="text"
                                   name="unit" id="unit" value="" required>
                            <span class="help-block">{{ trans('cruds.unit.fields.unit_helper') }}</span>
                        </div>
                        <div class="form-group">
                            <label class="required" for="unit_type">{{ trans('cruds.unit.fields.unit_type') }}</label>
                            <select class="form-control"
                                    name="unit_type" id="unit_type" required>
                               @foreach($unitTypes as $type)
                                    <option value="{{$type}}">{{$type}}</option>
                               @endforeach
                            </select>
                            <span class="help-block">{{ trans('cruds.unit.fields.unit_helper') }}</span>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
                        <button class="btn btn-danger" type="submit">{{ trans('global.save') }}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

@endsection
@section('scripts')
    @parent
    <script>
        $(function () {
            let dtButtons = $.extend(true, [], $.fn.dataTable.defaults.buttons)

            let deleteButtonTrans = '{{ trans('global.datatables.delete') }}'
            let deleteButton = {
                text: deleteButtonTrans,
                url: "{{ route('admin.unit.massDestroy') }}",
                className: 'btn-danger',
                action: function (e, dt, node, config) {
                    let ids = $.map(dt.rows({selected: true}).nodes(), function (entry) {
                        return $(entry).data('entry-id')
                    });

                    if (ids.length === 0) {
                        alert('{{ trans('global.datatables.zero_selected') }}')

                        return
                    }

                    if (confirm('{{ trans('global.areYouSure') }}')) {
                        $.ajax({
                            headers: {'x-csrf-token': _token},
                            method: 'POST',
                            url: config.url,
                            data: {ids: ids, _method: 'DELETE'}
                        })
                            .done(function () {
                                location.reload()
                            })
                    }
                }
            }
            dtButtons.push(deleteButton)

            $.extend(true, $.fn.dataTable.defaults, {
                orderCellsTop: true,
                order: [[1, 'desc']],
                pageLength: 10,
            });
            $('.datatable-unitType:not(.ajaxTable)').DataTable({buttons: dtButtons})
            $('a[data-toggle="tab"]').on('shown.bs.tab click', function () {
                $($.fn.dataTable.tables(true)).DataTable()
                    .columns.adjust();
            });


            jQuery.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            let isUpdate = false;
            $('#addButton').click(() => {
                isUpdate = false;
                $('#id').val('');
                $('#unitForm').trigger('reset');
                $('#addModal').modal('show');
            });
            $('#unitForm').submit(function (event) {
                event.preventDefault();
                let url = isUpdate ? "{{ route('admin.unit.update') }}" : "{{ route("admin.unit.add") }}";

                $.ajax({
                    url:url,
                    method:'POST',
                    data: $(this).serialize(),
                    success:function(result)
                    {
                         const {message}= result;
                        if(result.response==="success")
                        {

                              $.toast({
                                heading: 'Success',
                                text: message,
                                showHideTransition: 'slide',
                                icon: "success",
                                position: 'top-right',
                            });
                              window.location.href = window.location.href;
                        }
                        else if(result.response==='validation_error')
                        {
                           let msg ='';
                           message?.map(function(item){
                               msg+=`${item}\n`;
                           });

                           $.toast({
                                heading: 'Validation Error',
                                text: msg,
                                showHideTransition: 'slide',
                                icon: "success",
                                position: 'top-right',
                            });
                        }
                        else
                        {

                        }
                    },
                    error:function(error)
                    {
                        console.log(error);
                    }
                });

            });

            $('.editButton').click(function () {
                let id = $(this).data('id');
                isUpdate = true;
                let url = $(this).attr('data-view-url');


                $.ajax({
                    url:url,
                    method:'GET',
                    data: {id:id},
                    dataType:'json',
                    success:function(result)
                    {
                        if(result.response==="success")
                        {
                            $('#unit').val(result.data.unit);
                            $("#unit_type").val(result.data.unit_type);
                            $('#id').val(result.data.id);
                            $('#addModal').modal('show');
                        }
                        else if(result.response==='validation_error')
                        {
                            const {message}= result;
                           let msg ='';
                           message?.map(function(item){
                               msg+=`${item}\n`;
                           });

                            $.toast({
                                heading: 'Validation Error',
                                text: msg,
                                showHideTransition: 'slide',
                                icon: "success",
                                position: 'top-right',
                            });
                        }
                        else
                        {

                        }
                    },
                    error:function(error)
                    {
                        console.log(error);
                    }
                });
            });
        })

    </script>
@endsection
