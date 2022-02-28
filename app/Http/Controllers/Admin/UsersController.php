<?php

namespace App\Http\Controllers\Admin;

use App\Events\UserRegistered;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\CsvImportTrait;
use App\Http\Requests\MassDestroyUserRequest;
use App\Http\Requests\StoreUserRequest;
use App\Http\Requests\UpdateUserRequest;
use App\Models\Role;
use App\Models\State;
use App\Models\User;
use App\Models\UserAddress;
use App\Models\UserProfile;
use App\Notifications\RegistrationSuccessSms;
use App\Traits\UniqueIdentityGeneratorTrait;
use Carbon\Carbon;
use Illuminate\Support\Facades\Gate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Symfony\Component\HttpFoundation\Response;
use Yajra\DataTables\Facades\DataTables;

class UsersController extends Controller
{
    use CsvImportTrait, UniqueIdentityGeneratorTrait;

    public function index(Request $request)
    {
        abort_if(Gate::denies('user_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        if ($request->ajax()) {
            $query = User::select(sprintf('%s.*', (new User)->table));
            $table = Datatables::of($query);

            $table->addColumn('placeholder', '&nbsp;');
            $table->addColumn('actions', '&nbsp;');

            $table->editColumn('actions', function ($row) {
                $viewGate = 'user_show';
                $editGate = 'user_edit';
                $deleteGate = 'user_delete';
                $crudRoutePart = 'users';

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
            $table->editColumn('name', function ($row) {
                return $row->name ? $row->name : "";
            });
            $table->editColumn('mobile', function ($row) {
                return $row->mobile ?? '';
            });
            $table->editColumn('email', function ($row) {
                return $row->email ?? '';
            });

            $table->editColumn('approval_status', function ($row) {
                return $row->approved ? 'Approved' : 'Un Approved';
            });
            $table->editColumn('verified', function ($row) {
                return '<input  type="checkbox" class="user-verification-status" data-status="' . $row->verified . '" data-id="' . $row->id . '"   ' . ($row->verified ? 'checked' : null) . '>';
            });

            $table->rawColumns(['actions', 'placeholder', 'approval_status']);

            return $table->make(true);
        }

        $roles = Role::get();

        return view('admin.users.index', compact('roles'));
    }

    public function create()
    {
        abort_if(Gate::denies('user_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $states = State::all()->pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');

        return view('admin.users.create', compact('states'));
    }

    public function store(StoreUserRequest $request)
    {
//        abort_if(Gate::denies('user_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');
        DB::beginTransaction();
        try {
            $password = Str::random(10);
            $request->request->add(['approved' => 1]);
            $request->request->add(['verified' => 1]);
            $request->request->add(['password' => $password]);
            $request->request->add(['name' => $request->company_name]);
            $user = User::create($request->all());
            UserProfile::createProfile(array_merge($request->all(), ['user_id' => $user->id]));
            $billingAddressData = [
                'user_id' => $user->id,
                'address' => $request->billing_address,
                'address_two' => $request->billing_address_two,
                'state_id' => $request->billing_state_id,
                'district_id' => $request->billing_district_id,
                'pincode' => $request->billing_pincode,
                'address_type' => 'BILLING',
            ];
            UserAddress::create($billingAddressData);
            if (!$request->boolean('shipping_address_same')){
                UserAddress::create([
                    'user_id' => $user->id,
                    'address' => $request->shipping_address,
                    'address_two' => $request->shipping_address_two,
                    'state_id' => $request->shipping_state_id,
                    'district_id' => $request->shipping_district_id,
                    'pincode' => $request->shipping_pincode,
                    'is_default' => 1,
                    'address_type' => 'SHIPPING',
                ]);
            }else{
                UserAddress::create(array_merge($billingAddressData, ['address_type' => 'SHIPPING', 'is_default' => 1]));
            }
//         $user->notify(new RegistrationSuccessSms());

            $data['name'] = $user->name;
            $data['email'] = $user->email;
            $data['username'] = $user->email;
            $data['password'] = $password;
            $data['mobile'] = $user->mobile;
            DB::commit();
            event(new UserRegistered($data));
            return redirect()->route('admin.users.show', $user->id);
        } catch (\Exception $exception) {
            DB::rollBack();
            return back()->withErrors($exception->getMessage());
        }
    }

    public function edit(User $user)
    {
        abort_if(Gate::denies('user_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $states = State::all()->pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');

        $billingAddress = UserAddress::where('user_id', $user->id)->where('address_type', 'BILLING')->first();
        $shippingAddress = UserAddress::where('user_id', $user->id)->where('address_type', 'SHIPPING')->first();
        $userProfile = UserProfile::where(['user_id' => $user->id])->first();

        return view('admin.users.edit', compact('user','userProfile', 'states', 'billingAddress', 'shippingAddress'));
    }

    public function update(UpdateUserRequest $request, User $user)
    {
        $request->request->add(['name' => $request->company_name]);
        $user->update($request->all());

        UserProfile::updateOrCreate([
            'user_id' => $user->id,
        ], $request->all());

        UserAddress::updateOrCreate([
            'id' => $request->billing_address_id,
            'user_id' => $user->id
        ], [
            'user_id' => $user->id,
            'address' => $request->billing_address,
            'address_two' => $request->billing_address_two,
            'state_id' => $request->billing_state_id,
            'district_id' => $request->billing_district_id,
            'pincode' => $request->billing_pincode,
            'address_type' => 'BILLING',
        ]);

        UserAddress::updateOrCreate([
            'id' => $request->shipping_address_id,
            'user_id' => $user->id
        ], [
            'user_id' => $user->id,
            'address' => $request->shipping_address,
            'address_two' => $request->shipping_address_two,
            'state_id' => $request->shipping_state_id,
            'district_id' => $request->shipping_district_id,
            'pincode' => $request->shipping_pincode,
            'is_default' => 1,
            'address_type' => 'SHIPPING',
        ]);
        return redirect()->route('admin.users.show', $user->id);
    }

    public function show(User $user)
    {
        abort_if(Gate::denies('user_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $user->load('userProfile', 'userOrders','userTransactions', 'userUserAddresses', 'userUserAlerts');

        $userProfile = $user->userProfile ?? null;

        return view('admin.users.show', compact('user', 'userProfile'));
    }

    public function destroy(User $user)
    {
        abort_if(Gate::denies('user_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $user->delete();

        return back();
    }

    public function massDestroy(MassDestroyUserRequest $request)
    {
        User::whereIn('id', request('ids'))->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }

    public function changeApprovalStatus(Request $request)
    {
        $request->validate([
            'id' => 'required|numeric|exists:users,id',
            'status' => 'in:0,1'
        ]);

        try {
            $user = User::find($request->input('id'));
            $user->approved = !($request->input('status'));
            $user->save();
            $result = ["status" => 1, "response" => "success", "message" => "User approval status changed successfully"];
        } catch (\Exception $exception) {
            $result = ["status" => 0, "response" => "error", "message" => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function changeVerificationStatus(Request $request)
    {
        $request->validate([
            'id' => 'required|numeric|exists:users,id',
            'status' => 'in:0,1'
        ]);

        try {
            $user = User::find($request->input('id'));
            $user->verified = !($request->input('status'));
            $user->save();
            $result = ["status" => 1, "response" => "success", "message" => "User verification status changed successfully"];
        } catch (\Exception $exception) {
            $result = ["status" => 0, "response" => "error", "message" => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function massApprove(MassDestroyUserRequest $request)
    {
        User::whereIn('id', request('ids'))->update(['approved' => 1]);

        return response(null, Response::HTTP_NO_CONTENT);
    }

    public function approve(User $user)
    {
        $user->approved = 1;
        $user->save();
        return back()->with('message' ,'Approved successfully!');
    }
}
