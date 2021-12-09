<?php

namespace App\Http\Controllers\Vendor;

use App\Http\Controllers\Controller;
use App\Http\Requests\VendorUploadDocumentRequest;
use App\Models\Block;
use App\Models\District;
use App\Models\Vendor;
use App\Models\VendorProfile;
use App\Models\Pincode;
use App\Models\State;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;

class HomeController extends Controller
{
    public function __construct()
    {
        $this->middleware("auth:vendor");
    }

    public function index()
    {
        return view("vendor.dashboard");
    }

    public function showDocumentsUploadForm()
    {
        $franchiseeProfile = auth()->user()->profile;
        return view('vendor.uploadDocuments', compact('franchiseeProfile'));
    }

    public function uploadDocuments(VendorUploadDocumentRequest $request)
    {
        $vendorProfile = VendorProfile::where('vendor_id', auth()->user()->id)->first();


        if ($request->input('gst', false)) {
            $vendorProfile->addMedia(storage_path('tmp/uploads/' . $request->input('gst')))->toMediaCollection('gst');
        }

        if ($request->input('pan_card', false)) {
            $vendorProfile->addMedia(storage_path('tmp/uploads/' . $request->input('pan_card')))->toMediaCollection('pan_card');
        }


        return redirect()->route('vendor.dashboard');
    }


    public function showProfileForm()
    {
        $vendor = auth()->user();
        $profile = auth()->user()->profile;
        $states = State::all()->pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');
        $districts = District::all()->pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');
        return view('vendor.myProfile', compact('profile', 'states', 'districts', 'vendor'));
    }

    public function updateProfile(Request $request)
    {
        $validatedData = $request->validate([
            'mobile' => 'required|numeric|digits:10|unique:users|unique:vendors,mobile,' . auth()->id(),
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users', 'unique:vendors,email,' . auth()->id()],
            'company_name' => 'required|string',
            'user_type' => ['required', 'string', Rule::in(['MANUFACTURER', 'WHOLESALER'])],
            'representative_name' => 'required|string',
            'billing_address' => 'required|string',
            'billing_address_two' => 'nullable|string',
            'billing_state_id' => 'required|exists:states,id',
            'billing_district_id' => 'required|exists:districts,id',
            'billing_pincode' => 'required',
            'pickup_address' => 'required|string',
            'pickup_address_two' => 'nullable|string',
            'pickup_state_id' => 'required|exists:states,id',
            'pickup_district_id' => 'required|exists:districts,id',
            'pickup_pincode' => 'required',
            'pan_number' => 'required|string',
            'gst_number' => 'required|string',
        ]);

        DB::beginTransaction();
        try {
            $request->request->add(['name' => $request->company_name]);
            $request->request->add(['approved' => 0]);
            Vendor::find(auth()->id())->update($request->all());
            $request->request->add(['vendor' => auth()->id()]);
            VendorProfile::updateOrCreate([
                'vendor_id' => auth()->id()
            ], $request->all());
            DB::commit();
            return back()->with('message' ,'Profile updated successfully!');
        }catch (\Exception $exception){
            DB::rollBack();
            return back()->withInput()->withErrors($exception->getMessage());
        }
    }

    public function showChangePasswordForm()
    {
        return view('vendor.changePassword');
    }

    public function changePassword(Request $request)
    {
        $request->validate([
            'old_password' => 'required',
            'password' => 'required|string',
            'confirm_password' => 'required|same:password'
        ]);

        if(!Hash::check($request->old_password, auth()->user()->password)){
            return back()->withErrors(['error'=> 'You have entered wrong password'])->withInput();
        }
        auth()->user()->update(['password' => Hash::make($request->password)]);
        return back()->with('message' ,'Password changed successfully!');
    }

    public function showBankAccountForm()
    {
        $vendor = auth()->user();
        $profile = auth()->user()->profile;
        $states = State::all()->pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');
        $districts = District::all()->pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');
        return view('vendor.bankAccount', compact('profile', 'states', 'districts', 'vendor'));
    }

    public function updateBankAccount(Request $request)
    {
        $validatedData = $request->validate([
            'bank_name' => 'required|string',
            'account_number' => 'required|string',
            'account_holder_name' => 'required|string',
            'ifsc_code' => 'required|string',
        ]);
        try {
            $request->request->add(['vendor' => auth()->id()]);
            VendorProfile::updateOrCreate([
                'vendor_id' => auth()->id()
            ], $request->all());
            return back()->with('message' ,'Bank details updated successfully!');
        }catch (\Exception $exception){
            return back()->withInput()->withErrors($exception->getMessage());
        }
    }

    public function showMOPForm()
    {
        $profile = VendorProfile::where('vendor_id', auth()->id())->select(['id', 'mop'])->first();
        return view('vendor.minimumOrderPrice', compact('profile'));
    }

    public function updateMOP(Request $request)
    {
        $validatedData = $request->validate([
            'mop' => 'required|numeric',
        ]);
        try {
            $request->request->add(['vendor' => auth()->id()]);
            VendorProfile::updateOrCreate([
                'vendor_id' => auth()->id()
            ], $request->all());
            return back()->with('message' ,'Minimum order price updated successfully!');
        }catch (\Exception $exception){
            return back()->withInput()->withErrors($exception->getMessage());
        }
    }
}
