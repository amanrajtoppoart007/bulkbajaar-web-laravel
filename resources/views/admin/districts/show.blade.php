@extends('layouts.admin')
@section('content')

<div class="card">
    <div class="card-header">
        {{ trans('global.show') }} {{ trans('cruds.district.title') }}
    </div>

    <div class="card-body">
        <div class="form-group">
            <div class="form-group">
                <a class="btn btn-default" href="{{ route('admin.districts.index') }}">
                    {{ trans('global.back_to_list') }}
                </a>
            </div>
            <table class="table table-bordered table-striped">
                <tbody>
                    <tr>
                        <th>
                            {{ trans('cruds.district.fields.id') }}
                        </th>
                        <td>
                            {{ $district->id }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.district.fields.name') }}
                        </th>
                        <td>
                            {{ $district->name }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.district.fields.state') }}
                        </th>
                        <td>
                            {{ $district->state->name ?? '' }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.district.fields.status') }}
                        </th>
                        <td>
                            <input type="checkbox" disabled="disabled" {{ $district->status ? 'checked' : '' }}>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="form-group">
                <a class="btn btn-default" href="{{ route('admin.districts.index') }}">
                    {{ trans('global.back_to_list') }}
                </a>
            </div>
        </div>
    </div>
</div>

@endsection
