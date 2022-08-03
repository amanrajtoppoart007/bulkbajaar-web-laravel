@extends('layouts.admin')
@section('content')

<div class="card">
    <div class="card-header">
        {{ trans('global.show') }} {{ trans('cruds.user.title') }}
        <div class="float-right">
            <a class="btn btn-default" href="{{ route('admin.users.index') }}">
                {{ trans('global.back_to_list') }}
            </a>
        </div>
        @if(!$user->approved)
            <form action="{{ route('admin.users.approve', $user) }}" method="post" class="float-right">
                @csrf
                <button class="btn btn-success">Approve</button>
            </form>
        @endif
    </div>

    <div class="card-body">
        <div class="form-group">
            <table class="table table-bordered table-striped">
                <tbody>
                    <tr>
                        <th>
                            {{ trans('cruds.user.fields.id') }}
                        </th>
                        <td>
                            {{ $user->id }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            Company Name
                        </th>
                        <td>
                            {{ $user->name }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.user.fields.mobile') }}
                        </th>
                        <td>
                            {{ $user->mobile }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.user.fields.email') }}
                        </th>
                        <td>
                            {{ $user->email }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            Representative Name
                        </th>
                        <td>
                            {{ $userProfile->representative_name ?? '' }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            GST Number
                        </th>
                        <td>
                            {{ $userProfile->gst_number ?? '' }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            GST
                        </th>
                        <td>
                            @if($userProfile && $userProfile?->gst)
                                <a href="{{ $userProfile->gst->getUrl() }}" target="_blank" style="display: inline-block">
                                    <img src="{{ $userProfile->gst->getUrl() }}" height="50px" alt="">
                                </a>
                            @else
                                Not uploaded
                            @endif
                        </td>
                    </tr>
                    <tr>
                        <th>
                            PAN Number
                        </th>
                        <td>
                            {{$userProfile?->pan_number ?? '' }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            PAN Card
                        </th>
                        <td>
                            @if($userProfile && $userProfile?->pan_card)
                                <a href="{{ $userProfile?->pan_card->getUrl() }}" target="_blank" style="display: inline-block">
                                    <img src="{{ $userProfile->pan_card->getUrl() }}" height="50px" alt="">
                                </a>
                            @else
                                Not uploaded
                            @endif
                        </td>
                    </tr>
                    <tr>
                        <th>
                            Approval Status
                        </th>
                        <td>
                            {{ \App\Models\User::APPROVAL_STATUS_SELECT[$user->approved] ?? '' }}
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="card">
    <div class="card-header">
        {{ trans('global.relatedData') }}
    </div>
    <ul class="nav nav-tabs" role="tablist" id="relationship-tabs">
        <li class="nav-item">
            <a class="nav-link active" href="#user_orders" role="tab" data-toggle="tab">
                {{ trans('cruds.order.title') }}
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="#user_transactions" role="tab" data-toggle="tab">
                {{ trans('cruds.transaction.title') }}
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#user_user_addresses" role="tab" data-toggle="tab">
                {{ trans('cruds.userAddress.title') }}
            </a>
        </li>
        <li class="nav-item d-none">
            <a class="nav-link" href="#user_user_alerts" role="tab" data-toggle="tab">
                {{ trans('cruds.userAlert.title') }}
            </a>
        </li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active show" role="tabpanel" id="user_orders">
            @includeIf('admin.users.relationships.userOrders', ['orders' => $user->userOrders])
        </div>
        <div class="tab-pane" role="tabpanel" id="user_transactions">
            @includeIf('admin.users.relationships.userTransactions', ['transactions' => $user->userTransactions])
        </div>
        <div class="tab-pane" role="tabpanel" id="user_user_addresses">
            @includeIf('admin.users.relationships.userUserAddresses', ['userAddresses' => $user->userUserAddresses])
        </div>
        <div class="tab-pane d-none" role="tabpanel" id="user_user_alerts">
            @includeIf('admin.users.relationships.userUserAlerts', ['userAlerts' => $user->userUserAlerts])
        </div>
    </div>
</div>

@endsection
