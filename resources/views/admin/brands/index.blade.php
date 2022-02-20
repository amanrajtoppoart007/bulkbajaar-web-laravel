@extends('layouts.admin')
@section('content')
    @can('brand_create')
        <div style="margin-bottom: 10px;" class="row">
            <div class="col-lg-12">
                <button class="btn btn-success" id="addButton">
                    {{ trans('global.add') }} {{ trans('cruds.brand.title_singular') }}
                </button>
                <button class="btn btn-warning" data-toggle="modal" data-target="#csvImportModal">
                    {{ trans('global.app_csvImport') }}
                </button>
                @include('csvImport.modal', ['model' => 'Brand', 'route' => 'admin.brands.parseCsvImport'])
            </div>
        </div>
    @endcan
    <div class="card">
        <div class="card-header">
            {{ trans('cruds.brand.title_singular') }} {{ trans('global.list') }}
        </div>

        <div class="card-body">
            <table class=" table table-bordered table-striped table-hover ajaxTable datatable datatable-Brand">
                <thead>
                <tr>
                    <th>
                      #
                    </th>
                    <th>
                        {{ trans('cruds.brand.fields.id') }}
                    </th>
                    <th>
                        {{ trans('cruds.brand.fields.title') }}
                    </th>
                    <th>
                        {{ trans('cruds.brand.fields.status') }}
                    </th>
                     <th>
                        Preview
                    </th>
                    <th>
                        &nbsp;
                    </th>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <input class="search" type="text" placeholder="{{ trans('global.search') }}">
                    </td>
                    <td>
                        <input class="search" type="text" placeholder="{{ trans('global.search') }}">
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                </thead>
            </table>
        </div>
    </div>
    <div class="modal fade" id="addModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">{{ trans('global.create') }}/{{ trans('global.edit') }} {{ trans('cruds.brand.title_singular') }}</h4>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">×</span></button>
                </div>
                <form action="{{route('admin.brands.store')}}"  id="brandForm" method="post" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" name="id" id="id" value="">
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="required" for="title">{{ trans('cruds.brand.fields.title') }}</label>
                            <input class="form-control {{ $errors->has('title') ? 'is-invalid' : '' }}" type="text" name="title" id="title" value="{{ old('title', '') }}" required>
                            @if($errors->has('title'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('title') }}
                                </div>
                            @endif
                            <span class="help-block">{{ trans('cruds.brand.fields.title_helper') }}</span>
                        </div>
                        <div class="form-group">
                            <label for="image-dropzone">Image</label>
                            <div class="needsclick dropzone {{ $errors->has('image') ? 'is-invalid' : '' }}"
                                 id="image-dropzone">
                            </div>
                            @if($errors->has('image'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('image') }}
                                </div>
                            @endif
                            <span class="help-block">Image should not be greater than 5MB and size should be 100*100</span>
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
          Dropzone.autoDiscover=false;
          var imageDropzone;
        $(document).ready(function () {



            function imageDropBox()
            {
                $("div#image-dropzone").dropzone({
                url: '{{ route('admin.brands.storeMedia') }}',
                maxFilesize: 2, // MB
                acceptedFiles: '.jpeg,.jpg,.png,.gif',
                maxFiles: 1,
                addRemoveLinks: true,
                headers: {
                    'X-CSRF-TOKEN': "{{ csrf_token() }}"
                },
                params: {
                    size: 2,
                    width: 4096,
                    height: 4096
                },
                success: function (file, response) {
                    const brandForm = $('#brandForm');
                    brandForm.find('input[name="image"]').remove()
                    brandForm.append('<input type="hidden" name="image" value="' + response.name + '">')
                },
                removedfile: function (file) {
                    file.previewElement.remove()
                    if (file.status !== 'error') {
                        $('#brandForm').find('input[name="image"]').remove()
                        this.options.maxFiles = this.options.maxFiles + 1
                    }
                },
                init: function () {
                     imageDropzone = this;
                },
                error: function (file, response) {
                    if ($.type(response) === 'string') {
                        let message = response //dropzone sends it's own error messages in string
                    } else {
                        let message = response.errors.file
                    }
                    file.previewElement.classList.add('dz-error')
                    _ref = file.previewElement.querySelectorAll('[data-dz-errormessage]')
                    _results = []
                    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                        node = _ref[_i]
                        _results.push(node.textContent = message)
                    }

                    return _results
                },
            });
            }


            let dtButtons = $.extend(true, [], $.fn.dataTable.defaults.buttons)
            @can('brand_delete')
            let deleteButtonTrans = '{{ trans('global.datatables.delete') }}';
            let deleteButton = {
                text: deleteButtonTrans,
                url: "{{ route('admin.brands.massDestroy') }}",
                className: 'btn-danger',
                action: function (e, dt, node, config) {
                    let ids = $.map(dt.rows({selected: true}).data(), function (entry) {
                        return entry.id
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

            let dtOverrideGlobals = {
                buttons: dtButtons,
                processing: true,
                serverSide: true,
                retrieve: true,
                aaSorting: [],
                ajax: "{{ route('admin.brands.index') }}",
                columns: [
                    {data: 'placeholder', name: 'placeholder'},
                    {data: 'id', name: 'id'},
                    {data: 'title', name: 'title'},
                    {data: 'status', name: 'status'},
                    { data:null, name: 'preview',render : function(row,data,type){
                            return `<img src="${row.preview}" style="width:100px;height:100px;" class="preview-img">`;
                        }},
                    {data: 'actions', name: '{{ trans('global.actions') }}'}
                ],
                orderCellsTop: true,
                order: [[1, 'desc']],
                pageLength: 10,
            };
            let table = $('.datatable-Brand').DataTable(dtOverrideGlobals);
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

            jQuery.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            $('#addButton').on('click', function () {
                imageDropzone.destroy();
                $("#image-dropzone").find('div.dz-preview.dz-complete.dz-image-preview').remove();
                imageDropBox();
                $('#addModal').modal('show');
            });

            $(document).on('click', '.model-edit-button', function (e) {
                e.preventDefault();
                const url = `{{route('admin.brands.getBrand')}}?id=${$(this).attr('data-id')}`
                $.ajax({
                    url: url,
                    type: 'get',
                    success: function (result) {
                        if (result.status === 1) {
                            $("#title").val(result?.data?.title);
                            $("#id").val(result?.data?.id);

                            console.log(imageDropzone);

                            if(imageDropzone)
                            {
                                imageDropzone.destroy();
                                $("#image-dropzone").find('div.dz-preview.dz-complete.dz-image-preview').remove();
                                imageDropBox();
                            }


                            if(result.data.image)
                            {
                                let file = {name: result.data.image.name, size: result.data.image.size}
                                imageDropzone.emit("addedfile", file);
                                imageDropzone.emit("thumbnail", file, result.data.image.preview_url);
                                imageDropzone.emit("complete", file);
                            }
                            else
                            {
                                let file = {name: 'no-image', size: 14610}
                                imageDropzone.emit("addedfile", file);
                                imageDropzone.emit("thumbnail", file, "{{asset('assets/img/no-image.png')}}");
                                imageDropzone.emit("complete", file);
                            }
                            $('#addModal').modal('show');
                        }
                    }
                })
            });

            function update() {

            }

            function add() {
                const formData = new FormData(document.getElementById('brandForm'));
                $.ajax({
                    url: "{{ route("admin.brands.store") }}",
                    method: 'POST',
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function (result) {
                        if (result.status === 1) {
                            $("#addModal").modal("hide");
                            alert(result?.message);
                        } else {
                            alert(result?.message);
                        }
                    },
                    error: function (result) {

                    }
                });
            }

            $('#brandForm').submit(function (event) {
                event.preventDefault();
                if (isUpdate) {
                    update();
                } else {
                    add();
                }
            });
         imageDropBox();
        });

    </script>

@endsection
