<?php

namespace App\Http\Controllers\Api\V1\User;

use App\Events\UserRegistered;
use App\Http\Controllers\Api\BaseController;
use App\Models\UserAddress;
use App\Models\UserProfile;
use App\Models\Vendor;
use App\Traits\SmsSenderTrait;
use Exception;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Otp;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthController extends BaseController
{
    use SmsSenderTrait;

    public function access_step_one(Request $request)
    {
        $validator = Validator::make($request->json()->all(), [
            'mobile' => 'required|numeric|digits:10',
        ]);

        if ($validator->fails()) {
            $result = [
                'status' => 0,
                'response' => 'validation_error',
                'action' => 'retry',
                'message' => $validator->errors()->all()
            ];
        } else {
            try {
                if (Vendor::where('mobile', $request->input('mobile'))->exists()){
                    $result = [
                        'response' => 'success',
                        'action' => 'register',
                        'message' => 'Already registered'
                    ];
                    return response()->json($result, 200);
                }
                if (User::where('mobile', $request->input('mobile'))->doesntExist()) {
                    Otp::where('mobile', $request->input('mobile'))->update(['is_expired' => '1']);
                    $otp = rand(1000, 9999);
                    $data['otp'] = $otp;
                    $data['service_type'] = "registration";
                    $data['mobile'] = $request->input('mobile');
//                    $gatewayResponse = $this->sendOtpSms($data);
                    $otpObj = new Otp();
                    $otpObj->mobile = $request->input('mobile');
                    $otpObj->otp = $otp;
//                    $otpObj->sms_status = $gatewayResponse->status;
//                    $otpObj->gateway_response = json_encode($gatewayResponse);
                    $otpObj->save();
                    $result = [
                        'response' => 'success',
                        'action' => 'register',
                        'otp' => $otp,
                        'message' => 'Please check your mobile for OTP'
                    ];
                } else {
                    Otp::where('mobile', $request->input('mobile'))->update(['is_expired' => '1']);
                    $otp = rand(1000, 9999);
                    $data['otp'] = $otp;
                    $data['service_type'] = "login";
                    $data['mobile'] = $request->input('mobile');
//                    $gatewayResponse = $this->sendOtpSms($data);
                    $otpObj = new Otp();
                    $otpObj->mobile = $request->input('mobile');
                    $otpObj->otp = $otp;
//                    $otpObj->sms_status = $gatewayResponse->status;
//                    $otpObj->gateway_response = json_encode($gatewayResponse);
                    $otpObj->save();

                    $result = [
                        'response' => 'success',
                        'action' => 'login',
                        'otp' => $otp,
                        'message' => 'Please check your mobile for OTP'
                    ];

                }
            } catch (Exception $exception) {
                $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
            }
        }


        return response()->json($result, 200);

    }

    public function access_step_two(Request $request)
    {
        $validator = Validator::make($request->json()->all(), [
            'mobile' => 'required|numeric|digits:10',
            'otp' => 'required|numeric|digits:4',
            'device_token' => 'nullable',
        ]);

        if ($validator->fails()) {

            $result = ['status' => 0, 'response' => 'failed', 'message' => $validator->errors()->all()];
        } else {
            DB::beginTransaction();
            try {
                $otpdata = Otp::where('mobile', $request->input('mobile'))->where('is_expired', '0')->first();

                if (!empty($otpdata)) {
                    if ($otpdata->otp == $request->input('otp')) {
                        $v_token = rand(100000, 999999);
                        $obj = Otp::findOrFail($otpdata->id);
                        $obj->v_token = $v_token;
                        $obj->is_expired = '1';
                        $obj->save();

                        if (User::where('mobile', $request->input('mobile'))->exists()) {
                            $userData = [
                                'device_token' => $request->input('device_token')
                            ];
                            User::where('mobile', $request->input('mobile'))->update($userData);
                            $user = User::where('mobile', $request->input('mobile'))->first();
                            $access_token = $user->createToken('user_token')->plainTextToken;
                            $user['access_token'] = $access_token;
                            $result = [
                                'response' => 'success',
                                'action' => 'logged_in',
                                'data' => $user,
                                'message' => 'User logged in successfully'
                            ];
                            DB::commit();
                        } else {
                            DB::commit();
                            $data['verification_token'] = $v_token;
                            $result = [
                                'response' => 'success',
                                'action' => 'register',
                                'data' => $data,
                                'message' => 'Otp verification successful ,please create your account'
                            ];
                        }
                    } else {
                        DB::rollBack();
                        $result = ['response' => 'error', 'action' => 'retry', 'message' => 'Otp verification failed'];
                    }
                } else {
                    DB::rollBack();
                    $result = [
                        'response' => 'error',
                        'action' => 'retry',
                        'message' => 'Something went wrong ,please try after some time'
                    ];
                }
            } catch (Exception $exception) {
                DB::rollBack();
                $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
            }
        }


        return response()->json($result, 200);
    }

    public function registrationStepOne(Request $request)
    {
        $validator = Validator::make($request->json()->all(), [
            'name'=>'required',
            'mobile' => 'required|numeric|digits:10|unique:users,mobile|unique:vendors,mobile',
            'email' => 'required|email|unique:users,email|unique:vendors,email',
            'password' => ['required', 'string', 'confirmed'],
            'device_token' => 'nullable',
        ]);

        if ($validator->fails()) {
            $result = ['status' => 0, 'response' => 'validation_error', 'message' => $validator->errors()->all()];
        } else {
            try {
                $input = $request->json()->all();
                $user = new User();
                $user->email = $input['email'];
                $user->mobile = $input['mobile'];
                $user->password = Hash::make($input['password']);
                $user->device_token = $input['device_token'];
                if($request->has('name'))
                {
                    $user->name = $input['name'];
                }
                if ($user->save()) {
                    $data = User::where('id', $user->id)->select('id', 'name', 'email', 'mobile')->first();
                    $data['access_token'] = $user->createToken('user_token')->plainTextToken;
                    $result = [
                        'status' => 1,
                        'response' => 'success',
                        'action' => 'add_address details',
                        'data' => $data,
                        'message' => 'Please add address details.'
                    ];
                } else {
                    $result = [
                        'status' => 0,
                        'response' => 'error',
                        'action' => 'retry',
                        'message' => 'User register failed'
                    ];
                }

            } catch (Exception $exception) {
                $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
            }
        }

        return response()->json($result, 200);

    }

    public function registrationStepTwo(Request $request)
    {
        $validator = Validator::make($request->json()->all(), [
            'company_name' => 'required|string',
            'representative_name' => 'required|string',
            'billing_address' => 'required|string',
            'billing_address_two' => 'nullable|string',
            'billing_state_id' => 'required|exists:states,id',
//            'billing_district_id' => 'required|exists:districts,id',
            'billing_pincode' => 'required',
            'shipping_address_same' => 'required|in:0,1',
            'shipping_address' => 'required_if:shipping_address_same,0|string',
            'shipping_address_two' => 'nullable|string',
            'shipping_state_id' => 'required_if:shipping_address_same,0|exists:states,id',
//            'shipping_district_id' => 'required_if:shipping_address_same,0|exists:districts,id',
            'shipping_pincode' => 'required_if:shipping_address_same,0',
        ]);

        if ($validator->fails()) {
            $result = ['status' => 0, 'response' => 'validation_error', 'message' => $validator->errors()->all()];
        } else {
            DB::beginTransaction();
            try {
                $input = $request->json()->all();
                $user = User::find(auth()->id());

                $user->name = $input['company_name'];
                $user->save();
                $userProfile = new UserProfile();
                $userProfile->company_name = $input['company_name'];
                $userProfile->representative_name = $input['representative_name'];
                $userProfile->email = $user->email;
                $userProfile->mobile = $user->mobile;
                $userProfile->user_id = $user->id;
                $userProfile->save();

                $billingAddressData = [
                    'user_id' => $user->id,
                    'address' => $request->billing_address,
                    'address_two' => $request->billing_address_two,
                    'state_id' => $request->billing_state_id,
//                    'district_id' => $request->billing_district_id,
                    'pincode' => $request->billing_pincode,
                    'address_type' => 'BILLING',
                ];

                UserAddress::create($billingAddressData);

                if ($request->shipping_address_same == 0) {
                    UserAddress::create([
                        'user_id' => $user->id,
                        'address' => $request->shipping_address,
                        'address_two' => $request->shipping_address_two,
                        'state_id' => $request->shipping_state_id,
//                        'district_id' => $request->shipping_district_id,
                        'pincode' => $request->shipping_pincode,
                        'is_default' => 1,
                        'address_type' => 'SHIPPING',
                    ]);
                } else {
                    UserAddress::create(array_merge($billingAddressData,
                        ['is_default' => 1, 'address_type' => 'SHIPPING']));
                }

                $result = [
                    'status' => 1,
                    'response' => 'success',
                    'action' => 'upload',
                    'message' => 'Please upload documents.'
                ];
                DB::commit();
            } catch (Exception $exception) {
                DB::rollBack();
                $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
            }
        }

        return response()->json($result, 200);
    }

    public function registrationStepThree(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'pan_number' => 'required|string',
            'gst_number' => 'nullable|string',
            'pan' => 'required|mimes:jpeg,png',
            'gst' => 'required|mimes:jpeg,png',
        ]);

        if ($validator->fails()) {
            $result = [
                'status' => 0,
                'response' => 'validation_error',
                'action' => 'retry',
                'message' => $validator->errors()->all()
            ];
        } else {
            try {

                $profile = UserProfile::updateOrCreate([
                    'user_id' => auth()->id()
                ],
                    $request->all()
                );

                if ($request->hasFile('gst')) {
                    $profile->addMedia($request->file('gst'))->toMediaCollection('gst');
                }
                if ($request->hasFile('pan')) {
                    $profile->addMedia($request->file('pan'))->toMediaCollection('pan_card');
                }
                $result = [
                    'status' => 1,
                    'response' => 'success',
                    'action' => 'registered',
                    'message' => 'Registration completed. Your account is currently under review. You will be notified in 24-48 hours.'
                ];
                //Send notification to admin for approval
                /*$userData['id'] = auth()->id();
                $userData['name'] = auth()->user()?->name;
                $userData['username'] = auth()->user()?->email;
                $userData['email'] = auth()->user()?->email;
                $userData['mobile'] = auth()->user()?->mobile;
                event(new UserRegistered($userData));*/
            } catch (Exception $exception) {
                $result = [
                    'status' => 0,
                    'response' => 'error',
                    'message' => $exception->getMessage()
                ];
            }
        }
        return response()->json($result, 200);
    }
}
