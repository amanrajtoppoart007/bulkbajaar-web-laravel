<?php

namespace App\Http\Controllers\Admin;

use App\Events\VendorRegistered;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\CsvImportTrait;
use App\Http\Requests\MassDestroyVendorRequest;
use App\Http\Requests\StoreVendorRequest;
use App\Http\Requests\UpdateVendorRequest;
use App\Models\Block;
use App\Models\District;
use App\Models\Vendor;
use App\Models\Pincode;
use App\Models\State;
use App\Models\VendorProfile;
use Gate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Symfony\Component\HttpFoundation\Response;
use Yajra\DataTables\Facades\DataTables;
use App\Http\Controllers\Traits\MediaUploadingTrait;
class VendorController extends Controller
{
    use CsvImportTrait,MediaUploadingTrait;

    public function index(Request $request)
    {
        abort_if(Gate::denies('franchisee_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        if ($request->ajax()) {
            $query = Vendor::query()->select(sprintf('%s.*', (new Vendor)->table));
            $table = Datatables::of($query);

            $table->addColumn('placeholder', '&nbsp;');
            $table->addColumn('actions', '&nbsp;');

            $table->editColumn('actions', function ($row) {
                $viewGate = 'vendor_show';
                $editGate = 'vendor_edit';
                $deleteGate = 'vendor_delete';
                $crudRoutePart = 'vendors';

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
            $table->editColumn('email', function ($row) {
                return $row->email ? $row->email : "";
            });
            $table->editColumn('mobile', function ($row) {
                return $row->mobile ? $row->mobile : "";
            });

            $table->editColumn('user_type', function ($row) {
                return Vendor::USER_TYPE_SELECT[$row->user_type] ?? '-';
            });

            $table->editColumn('approval_status', function ($row) {
                return $row->approved ? 'Approved' : 'Un Approved';
            });

            $table->rawColumns(['actions', 'placeholder']);

            return $table->make(true);
        }

        return view('admin.vendors.index');
    }

    public function create()
    {
//        abort_if(Gate::denies('franchisee_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');
        $states = State::pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');
        return view('admin.vendors.create', compact('states'));
    }

    public function store(StoreVendorRequest $request)
    {
        DB::beginTransaction();
        try {
            $validated = $request->validated();
            $password = Str::random(10);

            $vendor = new Vendor();
            $vendor->name = $request->company_name;
            $vendor->email = $request->email;
            $vendor->mobile = $request->mobile;
            $vendor->user_type = $request->user_type;
            $vendor->password = Hash::make($password);
            $vendor->approved = true;
            $vendor->verified = true;
            $vendor->verified_at = now();
            $vendor->save();

            $validated['vendor_id'] = $vendor->id;

            $vendorProfile = VendorProfile::create($validated);

            DB::commit();
            //Send to welcome notification
            $data['name'] = $vendor->name;
            $data['email'] = $vendor->email;
            $data['username'] = $vendor->email;
            $data['password'] = $password;
            $data['mobile'] = $vendor->mobile;
            event(new VendorRegistered($data));
            return redirect()->route('admin.vendors.index');
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()->withErrors()->withInput();
        }
    }

    public function edit(Vendor $vendor)
    {
//        abort_if(Gate::denies('franchisee_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');
        $profile = $vendor->profile ?? null;
        $states = State::pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');
        $districts = District::all()->pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');
        return view('admin.vendors.edit', compact('vendor', 'profile',  'states', 'districts'));
    }

    public function update(UpdateVendorRequest $request, Vendor $vendor)
    {
        DB::beginTransaction();
        try {
            $vendor->name = $request->company_name;
            $vendor->email = $request->email;
            $vendor->mobile = $request->mobile;
            $vendor->approved = true;
            $vendor->verified = true;
            $vendor->verified_at = now();
            $vendor->user_type = $request->user_type;
            $vendor->save();

            VendorProfile::updateOrCreate([
                'vendor_id' => $vendor->id
            ], $request->validated());

            if ($request->input('shop_image', false)) {
                if (!$vendor->shop_image || $request->input('shop_image') !== $vendor->shop_image->file_name) {
                    if ($vendor->shop_image) {
                        $vendor->shop_image->delete();
                    }

                    $vendor->addMedia(storage_path('tmp/uploads/' . $request->input('shop_image')))->toMediaCollection('shopImage');
                }
            } elseif ($vendor->shop_image) {
                $vendor->shop_image->delete();
            }

            DB::commit();
            return redirect()->route('admin.vendors.index');
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()->withErrors()->withInput();
        }
    }

    public function show(Vendor $vendor)
    {
//        abort_if(Gate::denies('franchisee_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $vendor->load(['profile', 'profile.billingState', 'profile.billingDistrict', 'profile.pickupState', 'profile.pickupState']);
        $profile = $vendor->profile ?? null;
        return view('admin.vendors.show', compact('vendor', 'profile'));
    }

    public function destroy(Vendor $vendor)
    {
        abort_if(Gate::denies('franchisee_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $vendor->delete();

        return back();
    }

    public function massDestroy(MassDestroyVendorRequest $request)
    {
        Vendor::whereIn('id', request('ids'))->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }

    public function approve(Vendor $vendor)
    {
        $vendor->approved = 1;
        $vendor->save();
        return back()->with('message' ,'Approved successfully!');
    }

    public function massApprove(MassDestroyVendorRequest $request)
    {
        Vendor::whereIn('id', request('ids'))->update(['approved' => 1]);

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
