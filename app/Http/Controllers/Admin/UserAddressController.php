<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\CsvImportTrait;
use App\Http\Requests\MassDestroyUserAddressRequest;
use App\Http\Requests\StoreUserAddressRequest;
use App\Http\Requests\UpdateUserAddressRequest;
use App\Models\Area;
use App\Models\Block;
use App\Models\District;
use App\Models\Pincode;
use App\Models\State;
use App\Models\User;
use App\Models\UserAddress;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Yajra\DataTables\Facades\DataTables;

class UserAddressController extends Controller
{
    use CsvImportTrait;

    public function index(Request $request)
    {
        abort_if(Gate::denies('user_address_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        if ($request->ajax()) {
            $query = UserAddress::with(['user', 'district', 'state'])->select(sprintf('%s.*', (new UserAddress)->table));
            $table = Datatables::of($query);

            $table->addColumn('placeholder', '&nbsp;');
            $table->addColumn('actions', '&nbsp;');

            $table->editColumn('actions', function ($row) {
                $viewGate      = 'user_address_show';
                $editGate      = 'user_address_edit';
                $deleteGate    = 'user_address_delete';
                $crudRoutePart = 'user-addresses';

                return view('partials.datatablesActions', compact(
                    'viewGate',
                    'editGate',
                    'deleteGate',
                    'crudRoutePart',
                    'row'
                ));
            });

            $table->editColumn('id', function ($row) {
                return $row->id ? $row->id : "";
            });
            $table->addColumn('user_name', function ($row) {
                return $row->user ? $row->user->name : '';
            });

            $table->addColumn('pincode', function ($row) {
                return $row->pincode ?? '';
            });

            $table->addColumn('district_name', function ($row) {
                return $row->district ? $row->district->name : '';
            });

            $table->addColumn('state_name', function ($row) {
                return $row->state ? $row->state->name : '';
            });

            $table->editColumn('address', function ($row) {
                return $row->address ? $row->address : "";
            });
            $table->editColumn('address_type', function ($row) {
                return $row->address_type ? UserAddress::ADDRESS_TYPE_RADIO[$row->address_type] : '';
            });

            $table->rawColumns(['actions', 'placeholder', 'user', 'district', 'block', 'state']);

            return $table->make(true);
        }

        $users     = User::get(['id', 'name']);
        $districts = District::get(['id', 'name']);
        $states    = State::get(['id', 'name']);

        return view('admin.userAddresses.index', compact('users', 'districts', 'states'));
    }

    public function create()
    {
        abort_if(Gate::denies('user_address_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $users = User::all()->pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');

        $states = State::all()->pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');

        return view('admin.userAddresses.create', compact('users','states'));
    }

    public function store(StoreUserAddressRequest $request)
    {
        $userAddress = UserAddress::create($request->all());

        return redirect()->route('admin.user-addresses.index');
    }

    public function edit(UserAddress $userAddress)
    {
        abort_if(Gate::denies('user_address_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $users = User::all()->pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');

        $states = State::all()->pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');

        return view('admin.userAddresses.edit', compact('users',  'states', 'userAddress'));
    }

    public function update(UpdateUserAddressRequest $request, UserAddress $userAddress)
    {
        $userAddress->update($request->all());

        return redirect()->route('admin.user-addresses.index');
    }

    public function show(UserAddress $userAddress)
    {
        abort_if(Gate::denies('user_address_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $userAddress->load('user', 'district', 'state');

        return view('admin.userAddresses.show', compact('userAddress'));
    }

    public function destroy(UserAddress $userAddress)
    {
        abort_if(Gate::denies('user_address_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $userAddress->delete();

        return back();
    }

    public function massDestroy(MassDestroyUserAddressRequest $request)
    {
        UserAddress::whereIn('id', request('ids'))->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
