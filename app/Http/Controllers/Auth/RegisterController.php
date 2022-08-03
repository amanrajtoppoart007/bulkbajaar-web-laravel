<?php

namespace App\Http\Controllers\Auth;

use App\Events\UserRegistered;
use App\Events\VendorRegistered;
use App\Events\HelpCenterRegistered;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\VendorRegistrationRequest;
use App\Http\Requests\HelpCenterRegistrationRequest;
use App\Library\TextLocal\TextLocal;
use App\Mail\VendorWelcomeMessage;
use App\Mail\HelpCenterWelcomeMessage;
use App\Mail\UserWelcomeMessage;
use App\Models\City;
use App\Models\District;
use App\Models\Vendor;
use App\Models\VendorProfile;
use App\Models\HelpCenter;
use App\Models\HelpCenterProfile;

use App\Http\Controllers\Controller;
use App\Http\Requests\FarmerRegistrationRequest;
use App\Models\Crop;
use App\Models\Membership;
use App\Models\Pincode;
use App\Models\State;
use App\Models\User;
use App\Models\UserAddress;
use App\Models\UserProfile;
use App\Traits\SmsSenderTrait;
use App\Traits\UniqueIdentityGeneratorTrait;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class RegisterController extends Controller
{

    use MediaUploadingTrait, SmsSenderTrait, UniqueIdentityGeneratorTrait;

    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */


    public function __construct()
    {
        $this->middleware(['guest', 'guest:vendor']);
    }

    public function showRegistrationForm()
    {
        return view("guest.auth.register");
    }

    public function farmer()
    {
        $crops = Crop::with(['media'])->get();
        $states = State::get();
        return view("guest.auth.register.farmer", compact("crops", "states"));
    }

    public function storeFarmer(FarmerRegistrationRequest $request)
    {
        $request->validated();
        DB::beginTransaction();
        try {
            $request->request->add(['registration_number' => $this->generateRegistrationNumber()]);
            $user = User::create($request->all());
            $profile = UserProfile::createProfile(array_merge($request->all(), ['user_id' => $user->id]));
            $address = UserAddress::create(array_merge($request->all(),
                ['user_id' => $user->id, 'address_type' => 'billing']));

//            Mail::to($user)->send(new UserWelcomeMessage());

            $data['username'] = $user->email;
            $data['email'] = $user->email;
            $data['name'] = $user->name;
            $data['password'] = request()->input('password');
            $data['mobile'] = $user->mobile;

//            $this->sendRegisteredUserSms($data);

            event(new UserRegistered($data));

            $url = route("registration.message",
                [
                    'user' => 'user',
                    'entity_id' => Crypt::encryptString($user->id),
                    'token' => Crypt::encryptString(request()->input('password')),
                ]);
            DB::commit();
            $result = [
                "status" => 1,
                "response" => "success",
                "url" => $url,
                "message" => "Farmer registration successful"
            ];
        } catch (\Exception $exception) {
            DB::rollBack();
            $result = ["status" => 0, "response" => "error", "message" => $exception->getMessage()];
        }

        return response()->json($result);
    }


    public function vendor()
    {
        $states = State::all()->pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');
        return view('guest.auth.register.vendor', compact('states'));
    }

    public function storeVendor(VendorRegistrationRequest $request)
    {
        $validated = $request->validated();
        DB::beginTransaction();
        try {
            $validated['password'] = Hash::make($request->input('password'));
            $validated['name'] = $request->company_name;
            $validated['verified'] = 1;
            $vendor = Vendor::create($validated);
            $validated['vendor_id'] = $vendor->id;
            $vendorProfile = VendorProfile::create($validated);

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

            //Send welcome emial to vendor
            $data['name'] = $vendor->name;
            $data['email'] = $vendor->email;
            $data['username'] = $vendor->email;
            $data['password'] = request()->input('password');
            $data['mobile'] = $vendor->mobile;
//            event(new VendorRegistered($data));

            $url = route("registration.message",
                [
                    'user' => 'vendor',
                    'entity_id' => Crypt::encryptString($vendor->id),
                    'token' => Crypt::encryptString(request()->input('password')),
                ]);
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

    public function message($user, $entity_id, $token)
    {
        $id = Crypt::decryptString($entity_id);
        switch ($user) {
            case "vendor":
                $user = Vendor::find($id);
                break;
            case "help-center":
                $user = HelpCenter::find($id);
                break;
            default:
                $user = User::find($id);
        }
        $token = Crypt::decryptString($token);

        return view("guest.auth.register.message", compact('user', 'token'));

    }

}
