<?php

namespace App\Http\Controllers\Auth;

use App\Events\VendorRegistered;
use App\Http\Controllers\Controller;
use App\Http\Requests\Vendor\RegistrationStepOneRequest;
use App\Http\Requests\Vendor\RegistrationStepThreeRequest;
use App\Http\Requests\Vendor\RegistrationStepTwoRequest;
use App\Http\Requests\VendorRegistrationRequest;
use App\Models\State;
use App\Models\Vendor;
use App\Models\VendorProfile;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Exception;

class VendorRegistrationController extends Controller
{
    public function showRegistrationFormStepOne()
    {
        if (auth('vendor')->check()){
            return redirect()->route('vendor.dashboard');
        }
        return view('vendor.auth.register.stepOne');
    }

    public function store(RegistrationStepOneRequest $request)
    {
        $validated = $request->validated();
        try {
            $validated['password'] = Hash::make($request->input('password'));
            $validated['name'] = $request->input('company_name');
            $validated['verified'] = 1;
            $vendor = Vendor::create($validated);

            //Send notification to admin
            session()->put('password', request()->input('password'));
            $url = route('vendor.register.step-two');
            Auth::guard('vendor')->login($vendor);
            $result = ["status" => 1,"response" => "success","url" => $url,"message" => "Registration Successfully, please add address details."];
        } catch (Exception $exception) {
            $result = ["status" => 0, "response" => "error", "message" => $exception->getMessage()];
        }

        return response()->json($result);

    }

    public function showRegistrationFormStepTwo()
    {
        if (!is_null(auth('vendor')->user()->profile)){
            return redirect()->route('vendor.register.step-three');
        }
        $states = State::all()->pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');
        return view('vendor.auth.register.stepTwo', compact('states'));
    }

    public function storeStepTwo(RegistrationStepTwoRequest $request)
    {
        $validated = $request->validated();
        DB::beginTransaction();
        try {

            $vendor = auth('vendor')->user();
            $vendor->name = $request->company_name;
            $vendor->user_type = $request->user_type;
            $vendor->save();
            $validated['email'] = $vendor->email;
            $validated['mobile'] = $vendor->mobile;

            if ($request->pickup_address_same == 0){
                $validated['pickup_address'] = $request->pickup_address;
                $validated['pickup_address_two'] = $request->pickup_address_two;
                $validated['pickup_state_id'] = $request->pickup_state_id;
                $validated['pickup_district_id'] = $request->pickup_district_id;
                $validated['pickup_pincode'] = $request->pickup_pincode;
            }else{
                $validated['pickup_address'] = $request->billing_address;
                $validated['pickup_address_two'] = $request->billing_address_two;
                $validated['pickup_state_id'] = $request->billing_state_id;
                $validated['pickup_district_id'] = $request->billing_district_id;
                $validated['pickup_pincode'] = $request->billing_pincode;
            }
            $vendorProfile = VendorProfile::updateOrCreate([
                'vendor_id' => auth('vendor')->id()
            ],$validated);

            $url = route('vendor.register.step-three');
            DB::commit();
            $result = [
                "status" => 1,
                "response" => "success",
                "url" => $url,
                "message" => "Please upload documents",
            ];
        } catch (Exception $exception) {
            DB::rollBack();
            $result = ["status" => 0, "response" => "error", "message" => $exception->getMessage()];
        }

        return response()->json($result, 200);

    }

    public function showRegistrationFormStepThree()
    {
        $vendor = auth('vendor')->user();
        if (is_null($vendor?->profile)){
            return redirect()->route('vendor.register.step-two');
        }

        if (!is_null($vendor?->profile->pan_number) && !is_null($vendor?->profile->gst_number)){
            return redirect()->route('vendor.dashboard');
        }
        return view('vendor.auth.register.stepThree');
    }

    public function storeStepThree(RegistrationStepThreeRequest $request)
    {
        $validated = $request->validated();
        DB::beginTransaction();
        try {
            $vendor = auth('vendor')->user();
            $vendorProfile = VendorProfile::updateOrCreate([
                'vendor_id' => auth('vendor')->id()
            ],$validated);

            if ($request->hasFile('gst')) {
                $vendorProfile->addMedia($request->file('gst'))->toMediaCollection('gst');
            }

            if ($request->hasFile('pan_card')) {
                $vendorProfile->addMedia($request->file('pan_card'))->toMediaCollection('pan_card');
            }
            //Send notification to admin

            //Send welcome email to vendor
            $data['id'] = $vendor->id;
            $data['name'] = $vendor->name;
            $data['email'] = $vendor->email;
            $data['username'] = $vendor->email;
            $data['password'] = session('password');
            $data['mobile'] = $vendor->mobile;

             event(new VendorRegistered($data));

            $url = route("vendor.dashboard");
            DB::commit();
            $result = ["status" => 1, "response" => "success", "url" => $url, "message" => "Registration Successfully"];
        } catch (Exception $exception) {
            DB::rollBack();
            $result = ["status" => 0, "response" => "error", "message" => $exception->getMessage()];
        }
        return response()->json($result);

    }
}
