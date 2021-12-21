@extends('layouts.admin')
@section('content')

<div class="card">
    <div class="card-header">
        {{ trans('global.show') }} {{ trans('cruds.franchisee.title') }}
        @if(!$vendor->approved)
        <form action="{{ route('admin.vendors.approve', $vendor) }}" method="post" class="float-right">
            @csrf
            <button class="btn btn-success">Approve</button>
        </form>
        @endif
    </div>

    <div class="card-body">
        <div class="form-group">
            <div class="form-group">
                <a class="btn btn-default" href="{{ route('admin.vendors.index') }}">
                    {{ trans('global.back_to_list') }}
                </a>
            </div>
            <table class="table table-bordered table-striped">
                <tbody>
                    <tr>
                        <th>
                            {{ trans('cruds.franchisee.fields.id') }}
                        </th>
                        <td>
                            {{ $vendor->id }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.franchisee.fields.name') }}
                        </th>
                        <td>
                            {{ $profile->company_name ?? '' }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.franchisee.fields.email') }}
                        </th>
                        <td>
                            {{ $vendor->email }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.franchisee.fields.mobile') }}
                        </th>
                        <td>
                            {{ $vendor->mobile }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            Representative name
                        </th>
                        <td>
                            {{ $profile->representative_name ?? '' }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            GST Number
                        </th>
                        <td>
                            {{ $profile->gst_number ?? '' }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            GST
                        </th>
                        <td>
                            @if($profile->gst)
                                <a href="{{ $profile->gst->getUrl() }}" target="_blank" style="display: inline-block">
                                    <img src="{{ $profile->gst->getUrl() }}" height="50px">
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
                            {{ $profile->pan_number ?? '' }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            PAN Card
                        </th>
                        <td>
                            @if($profile->pan_card)
                                <a href="{{ $profile->pan_card->getUrl() }}" target="_blank" style="display: inline-block">
                                    <img src="{{ $profile->pan_card->getUrl() }}" height="50px">
                                </a>
                            @else
                                Not uploaded
                            @endif
                        </td>
                    </tr>
                    <tr>
                        <th>
                            User Type
                        </th>
                        <td>
                            {{ \App\Models\Vendor::USER_TYPE_SELECT[$vendor->user_type] ?? '' }}
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2">Billing Address</th>
                    </tr>
                    <tr>
                        <th>
                            Address
                        </th>
                        <td>
                            {{ $profile->billing_address ?? '' }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            Address Line 2
                        </th>
                        <td>
                            {{ $profile->billing_address_line_two ?? '' }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            State
                        </th>
                        <td>
                            {{ $profile->billingState->name ?? '' }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            District
                        </th>
                        <td>
                            {{ $profile->billingDistrict->name ?? '' }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            Pincode
                        </th>
                        <td>
                            {{ $profile->billing_pincode ?? '' }}
                        </td>
                    </tr>

                    <tr>
                        <th colspan="2">Pickup Address</th>
                    </tr>
                    <tr>
                        <th>
                            Address
                        </th>
                        <td>
                            {{ $profile->pickup_address ?? '' }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            Address Line 2
                        </th>
                        <td>
                            {{ $profile->pickup_address_line_two ?? '' }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            State
                        </th>
                        <td>
                            {{ $profile->pickupState->name ?? '' }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            District
                        </th>
                        <td>
                            {{ $profile->pickupDistrict->name ?? '' }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            Pincode
                        </th>
                        <td>
                            {{ $profile->pickup_pincode ?? '' }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            Bank Name
                        </th>
                        <td>
                            {{ $profile->bank_name ?? '' }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            Account Number
                        </th>
                        <td>
                            {{ $profile->account_number ?? '' }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            Account Holder Name
                        </th>
                        <td>
                            {{ $profile->account_holder_name ?? '' }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            IFSC Code
                        </th>
                        <td>
                            {{ $profile->ifsc_code ?? '' }}
                        </td>
                    </tr>

                </tbody>
            </table>
            <div class="form-group">
                <a class="btn btn-default" href="{{ route('admin.vendors.index') }}">
                    {{ trans('global.back_to_list') }}
                </a>
            </div>
        </div>
    </div>
</div>



@endsection
