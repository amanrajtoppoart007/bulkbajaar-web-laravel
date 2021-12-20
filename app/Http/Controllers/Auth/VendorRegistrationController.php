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
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class VendorRegistrationController extends Controller
{
    public function showRegistrationFormStepOne()
    {
        if (\auth('vendor')->check()){
            return redirect()->route('vendor.dashboard');
        }
        return view('vendor.auth.register.stepOne');
    }

    public function store(RegistrationStepOneRequest $request)
    {
        $validated = $request->validated();
        try {
            $validated['password'] = Hash::make($request->input('password'));
            $validated['name'] = $request->company_name;
            $validated['verified'] = 1;
            $vendor = Vendor::create($validated);

            //Send notification to admin
            session()->put('password', request()->input('password'));
            $url = route('vendor.register.step-two');
            Auth::guard('vendor')->login($vendor);
            $result = [
                "status" => 1,
                "response" => "success",
                "url" => $url,
                "message" => "Registration Successfully, please add address details.",
            ];
        } catch (\Exception $exception) {
            $result = ["status" => 0, "response" => "error", "message" => $exception->getMessage()];
        }

        return response()->json($result, 200);

    }

    public function showRegistrationFormStepTwo()
    {
        if (!is_null(\auth()->user()->profile)){
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

            $vendor = \auth()->user();
            $vendor->name = $request->company_name;
            $vendor->save();
            $validated['email'] = $vendor->email;
            $validated['mobile'] = $vendor->mobile;
            $vendorProfile = VendorProfile::updateOrCreate([
                'vendor_id' => \auth()->id()
            ],$validated);

            $url = route('vendor.register.step-three');
            DB::commit();
            $result = [
                "status" => 1,
                "response" => "success",
                "url" => $url,
                "message" => "Please upload documents",
            ];
        } catch (\Exception $exception) {
            DB::rollBack();
            $result = ["status" => 0, "response" => "error", "message" => $exception->getMessage()];
        }

        return response()->json($result, 200);

    }

    public function showRegistrationFormStepThree()
    {
        $vendor = \auth()->user();
        if (is_null($vendor->profile)){
            return redirect()->route('vendor.register.step-two');
        }

        if (!is_null($vendor->profile->pan_number) && !is_null($vendor->profile->gst_number)){
            return redirect()->route('vendor.dashboard');
        }
        return view('vendor.auth.register.stepThree');
    }

    public function storeStepThree(RegistrationStepThreeRequest $request)
    {
        $validated = $request->validated();
        DB::beginTransaction();
        try {
            $vendor = \auth()->user();
            $vendorProfile = VendorProfile::updateOrCreate([
                'vendor_id' => \auth()->id()
            ],$validated);

            if ($request->hasFile('gst')) {
                $vendorProfile->addMedia($request->file('gst'))->toMediaCollection('gst');
            }

            if ($request->hasFile('pan_card')) {
                $vendorProfile->addMedia($request->file('pan_card'))->toMediaCollection('pan_card');
            }

//            if ($franchisee->id && $franchisee->email) {
//                Mail::to($franchisee)->send(new FranchiseeWelcomeMessage());
//            }
//
//            if ($franchisee->id && $franchisee->mobile) {
//                $data['username'] = $franchisee->email;
//                $data['password'] = request()->input('password');
//                $data['mobile'] = $franchisee->mobile;
//                $this->sendRegisteredFranchiseeSms($data);
//            }

            //Send notification to admin

            //Send welcome email to vendor
            $data['id'] = $vendor->id;
            $data['name'] = $vendor->name;
            $data['email'] = $vendor->email;
            $data['username'] = $vendor->email;
            $data['password'] = session('password');
            $data['mobile'] = $vendor->mobile;

//            event(new VendorRegistered($data));

            $url = route("vendor.dashboard");
            DB::commit();
            $result = [
                "status" => 1,
                "response" => "success",
                "url" => $url,
                "message" => "Registration Successfully",
            ];
        } catch (\Exception $exception) {
            DB::rollBack();
            $result = ["status" => 0, "response" => "error", "message" => $exception->getMessage()];
        }

        return response()->json($result, 200);

    }
}
