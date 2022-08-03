@extends('layouts.admin')
@section('content')
    @can('content_category_create')
        <div style="margin-bottom: 10px;" class="row">
            <div class="col-lg-12">
                <button class="btn btn-success" id="addButton">
                    {{ trans('global.add') }} {{ trans('cruds.contentCategory.title_singular') }}
                </button>
            </div>
        </div>
    @endcan
    <div class="card">
        <div class="card-header">
            {{ trans('cruds.contentCategory.title_singular') }} {{ trans('global.list') }}
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table class=" table table-bordered table-striped table-hover datatable datatable-ContentCategory">
                    <thead>
                    <tr>
                        <th width="10">

                        </th>
                        <th>
                            {{ trans('cruds.contentCategory.fields.id') }}
                        </th>
                        <th>
                            {{ trans('cruds.contentCategory.fields.name') }}
                        </th>
                        <th>
                            {{ trans('cruds.contentCategory.fields.slug') }}
                        </th>
                        <th>
                            &nbsp;
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($contentCategories as $key => $contentCategory)
                        <tr data-entry-id="{{ $contentCategory->id }}">
                            <td>

                            </td>
                            <td>
                                {{ $contentCategory->id ?? '' }}
                            </td>
                            <td>
                                {{ $contentCategory->name ?? '' }}
                            </td>
                            <td>
                                {{ $contentCategory->slug ?? '' }}
                            </td>
                            <td>
                                @can('content_category_show')
                                    <a class="btn btn-xs btn-primary"
                                       href="{{ route('admin.content-categories.show', $contentCategory->id) }}">
                                        {{ trans('global.view') }}
                                    </a>
                                @endcan

                                @can('content_category_edit')
                                    <button class="btn btn-xs btn-info editButton"
                                       data-id="{{ $contentCategory->id }}">
                                        {{ trans('global.edit') }}
                                    </button>
                                @endcan

                                @can('content_category_delete')
                                    <form action="{{ route('admin.content-categories.destroy', $contentCategory->id) }}"
                                          method="POST" onsubmit="return confirm('{{ trans('global.areYouSure') }}');"
                                          style="display: inline-block;">
                                        <input type="hidden" name="_method" value="DELETE">
                                        <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                        <input type="submit" class="btn btn-xs btn-danger"
                                               value="{{ trans('global.delete') }}">
                                    </form>
                                @endcan

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
                    <h4 class="modal-title">{{ trans('global.create') }}/{{ trans('global.edit') }} {{ trans('cruds.contentCategory.title_singular') }}</h4>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">×</span></button>
                </div>
                <form id="brandForm">
                    <input type="hidden" name="id" id="id">
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="required" for="name">{{ trans('cruds.contentCategory.fields.name') }}</label>
                            <input class="form-control {{ $errors->has('name') ? 'is-invalid' : '' }}" type="text"
                                   name="name" id="name" value="{{ old('name', '') }}" required>
                            @if($errors->has('name'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('name') }}
                                </div>
                            @endif
                            <span class="help-block">{{ trans('cruds.contentCategory.fields.name_helper') }}</span>
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
            @can('content_category_delete')
            let deleteButtonTrans = '{{ trans('global.datatables.delete') }}'
            let deleteButton = {
                text: deleteButtonTrans,
                url: "{{ route('admin.content-categories.massDestroy') }}",
                className: 'btn-danger',
                action: function (e, dt, node, config) {
                    var ids = $.map(dt.rows({selected: true}).nodes(), function (entry) {
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
            @endcan

            $.extend(true, $.fn.dataTable.defaults, {
                orderCellsTop: true,
                order: [[1, 'desc']],
                pageLength: 10,
            });
            let table = $('.datatable-ContentCategory:not(.ajaxTable)').DataTable({buttons: dtButtons})
            $('a[data-toggle="tab"]').on('shown.bs.tab click', function (e) {
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
                $('#brandForm').trigger('reset');
                $('#addModal').modal('show');
            });
            $('#brandForm').submit(function (event) {
                event.preventDefault();
                let url = isUpdate ? "{{ route('admin.content-category.update') }}" : "{{ route("admin.content-category.add") }}";
                $.post(url, $(this).serialize(), result => {
                    alert(result.msg)
                    if (result.status) {
                        location.reload()
                    }
                }, 'json');
            });

            $('.editButton').click(function () {
                let id = $(this).data('id');
                isUpdate = true;
                $.get("{{ route('admin.get.content-category') }}", {id}, result => {
                    if (result.status) {
                        $('#name').val(result.data.name);
                        $('#id').val(result.data.id);
                        $('#addModal').modal('show');
                    }
                }, 'json');
            });

        })

    </script>
@endsection
