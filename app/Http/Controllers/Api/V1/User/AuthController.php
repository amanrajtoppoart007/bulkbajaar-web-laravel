<?php

namespace App\Http\Controllers\Api\V1\User;

use App\Events\UserRegistered;
use App\Http\Controllers\Api\BaseController;
use App\Mail\UserWelcomeMessage;
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
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use PhpParser\Node\Stmt\TryCatch;

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
                if (Vendor::where('mobile', $request->input('mobile'))->exists()) {
                    $result = ['response' => 'success', 'action' => 'register', 'message' => 'Already registered'];
                    return response()->json($result);
                }
                if (User::where('mobile', $request->input('mobile'))->doesntExist()) {
                    $data['service_type'] = "registration";
                    $action = 'register';

                } else {
                    $data['service_type'] = "login";
                    $action = 'login';
                }

                Otp::where('mobile', $request->input('mobile'))->update(['is_expired' => '1']);
                $otp = rand(1000, 9999);
                /**
                 * for play store verification , remove in product version
                 */
                if ($request->input('mobile') == '1234567890') {
                    $otp = 1234;
                }
                $data['otp'] = $otp;
                $data['mobile'] = $request->input('mobile');
                $response = $this->sendOtpSms($data);
                $otpObj = new Otp();
                $otpObj->mobile = $request->input('mobile');
                $otpObj->otp = $otp;
                $otpObj->sms_status = $response?->type;
                $otpObj->gateway_response = json_encode($response);
                $otpObj->save();
                $result = ['response' => 'success', 'action' => $action, 'otp' => $otp, 'message' => 'Please check your mobile for OTP'];

            } catch (Exception $exception) {
                $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
            }
        }


        return response()->json($result);

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
                $otpData = Otp::where('mobile', $request->input('mobile'))->where('is_expired', '0')->first();

                if (!empty($otpData)) {
                    if ($otpData->otp == $request->input('otp')) {
                        $v_token = rand(100000, 999999);
                        $obj = Otp::findOrFail($otpData->id);
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


        return response()->json($result);
    }

    public function registrationStepOne(Request $request)
    {
        $validator = Validator::make($request->json()->all(), [
            'name' => 'required|string',
            'mobile' => 'required|numeric|digits:10|unique:users,mobile,NULL,id,deleted_at,NULL|unique:vendors,mobile,NULL,id,deleted_at,NULL',
            'email' => 'required|email|unique:users,email,NULL,id,deleted_at,NULL|unique:vendors,email,NULL,id,deleted_at,NULL',
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
                if ($request->has('name')) {
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

        return response()->json($result);

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
                    'address' => $request->input('billing_address'),
                    'address_two' => $request->input('billing_address_two'),
                    'state_id' => $request->input('billing_state_id'),
//                    'district_id' => $request->billing_district_id,
                    'pincode' => $request->input('billing_pincode'),
                    'address_type' => 'BILLING',
                ];

                UserAddress::create($billingAddressData);

                if ($request->input('shipping_address_same') == 0) {
                    UserAddress::create([
                        'user_id' => $user->id,
                        'address' => $request->input('shipping_address'),
                        'address_two' => $request->input('shipping_address_two'),
                        'state_id' => $request->input('shipping_state_id'),
//                        'district_id' => $request->shipping_district_id,
                        'pincode' => $request->input('shipping_pincode'),
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

        return response()->json($result);
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
                $this->sendNewRegistrationNotification();
                $result = [
                    'status' => 1,
                    'response' => 'success',
                    'action' => 'registered',
                    'message' => 'Registration completed. Your account is currently under review. You will be notified in 24-48 hours.'
                ];

            } catch (Exception $exception) {
                $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()
                ];
            }
        }
        return response()->json($result);
    }

    public function sendNotification()
    {
        $this->sendNewRegistrationNotification();
    }

    private function sendNewRegistrationNotification()
    {
        //Send notification to admin for approval
        $user = User::find(auth()->id());
        $userData['id'] = auth()->id();
        $userData['name'] = $user?->name;
        $userData['username'] = $user?->email;
        $userData['email'] = $user?->email;
        $userData['mobile'] = $user?->mobile;
        event(new UserRegistered($userData));


    }

}
