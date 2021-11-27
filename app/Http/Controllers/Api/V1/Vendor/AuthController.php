<?php

namespace App\Http\Controllers\Api\V1\Vendor;

use App\Http\Controllers\Controller;
use App\Models\Otp;
use App\Models\Vendor;
use App\Models\VendorProfile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class AuthController extends Controller
{
    public function registrationStepOne(Request $request)
    {
        $validator = Validator::make($request->json()->all(), [
            'mobile' => 'required|numeric|digits:10|unique:users|unique:vendors',
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users', 'unique:vendors'],
            'password' => ['required', 'string', 'confirmed'],
            'device_token' => 'nullable',
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
                Otp::where('mobile', $request->input('mobile'))->update(['is_expired' => '1']);
                $otp = rand(1000, 9999);
                $data['otp'] = $otp;
                $data['service_type'] = "registration";
                $data['mobile'] = $request->input('mobile');
                $vendor = Vendor::create([
                    'mobile' => $request->mobile,
                    'email' => $request->email,
                    'password' => Hash::make($request->password),
                    'device_token' => $request->device_token
                ]);
//                $gatewayResponse = $this->sendOtpSms($data);
                $otpObj = new Otp();
                $otpObj->vendor_id = $vendor->id;
                $otpObj->mobile = $request->mobile;
                $otpObj->otp = $otp;
                $otpObj->sms_status = null;
//                $otpObj->gateway_response = json_encode($gatewayResponse);
                $otpObj->save();
                $access_token = $vendor->createToken('user_token')->plainTextToken;
                $vendor['access_token'] = $access_token;
                $result = [
                    'status' => 1,
                    'response' => 'success',
                    'action' => 'step2',
                    "data" => [
                        'otp' => $otp,
                        'user' => $vendor
                    ],
                    'message' => 'Please check your mobile for OTP'
                ];
            } catch (\Exception $exception) {
                $result = [
                    'status' => 0,
                    'response' => 'error',
                    'message' => $exception->getMessage()
                ];
            }
        }
        return response()->json($result, 200);
    }

    public function registrationStepTwo(Request $request)
    {
        $validator = Validator::make($request->json()->all(), [
            'otp' => 'required|numeric',
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
                $otp = Otp::where('vendor_id', auth()->id())->where('is_expired', 0)->first();
                if (is_null($otp) || $otp->otp != $request->otp) {
                    $result = [
                        'status' => 0,
                        'response' => 'error',
                        'action' => 'retry',
                        'message' => 'Please enter a valid OTP.'
                    ];
                } else {
                    $v_token = rand(100000, 999999);
                    $otp->v_token = $v_token;
                    $otp->is_expired = 1;
                    $otp->save();
                    $result = [
                        'status' => 1,
                        'response' => 'success',
                        'action' => 'step3',
                        'message' => 'Please fill Company Details'
                    ];
                }
            } catch (\Exception $exception) {
                $result = [
                    'status' => 0,
                    'response' => 'error',
                    'message' => $exception->getMessage()
                ];
            }
        }
        return response()->json($result, 200);
    }

    public function registrationStepThree(Request $request)
    {
        $validator = Validator::make($request->json()->all(), [
            'company_name' => 'required|string',
            'user_type' => ['required', 'string', Rule::in(['MANUFACTURER', 'WHOLESALER'])],
            'representative_name' => 'required|string',
            'email' => 'required|email',
            'mobile' => 'required|numeric|digits:10',
            'billing_address' => 'required|string',
            'billing_address_two' => 'nullable|string',
            'billing_state_id' => 'required|exists:states,id',
            'billing_district_id' => 'required|exists:districts,id',
            'billing_pincode' => 'required',
            'pickup_address_same' => 'required|in:0,1',
            'pickup_address' => 'required_if:pickup_address_same,0|string',
            'pickup_address_two' => 'nullable|string',
            'pickup_state_id' => 'required_if:pickup_address_same,0|exists:states,id',
            'pickup_district_id' => 'required_if:pickup_address_same,0|exists:districts,id',
            'pickup_pincode' => 'required_if:pickup_address_same,0',
        ]);

        if ($validator->fails()) {
            $result = [
                'status' => 0,
                'response' => 'validation_error',
                'action' => 'retry',
                'message' => $validator->errors()->all()
            ];
        } else {
            DB::beginTransaction();
            try {
                $user = auth()->user();
                $user->user_type = strtoupper($request->user_type);
                $user->save();
                $isSame = $request->boolean('pickup_address_same');
                $user->profile()->updateOrCreate([
                    'vendor_id' => auth()->id()
                ], [
                    'company_name' => $request->company_name,
                    'representative_name' => $request->representative_name,
                    'email' => $request->email,
                    'mobile' => $request->mobile,
                    'billing_address' => $request->billing_address,
                    'billing_address_two' => $request->billing_address_two,
                    'billing_state_id' => $request->billing_state_id,
                    'billing_district_id' => $request->billing_district_id,
                    'billing_pincode' => $request->billing_pincode,
                    'pickup_address' => $isSame ? $request->billing_address : $request->pickup_address,
                    'pickup_address_two' => $isSame ? $request->billing_address_two : $request->pickup_address_two,
                    'pickup_state_id' => $isSame ? $request->billing_state_id : $request->pickup_state_id,
                    'pickup_district_id' => $isSame ? $request->billing_district_id : $request->pickup_district_id,
                    'pickup_pincode' => $isSame ? $request->billing_pincode : $request->pickup_pincode,
                ]);
                $result = [
                    'status' => 1,
                    'response' => 'success',
                    'action' => 'step4',
                    'message' => 'Please fill bank details'
                ];
                DB::commit();
            } catch (\Exception $exception) {
                DB::rollBack();
                $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
            }
        }

        return response()->json($result, 200);
    }

    public function registrationStepFour(Request $request)
    {
        $validator = Validator::make($request->json()->all(), [
            'pan_number' => 'required|string',
            'gst_number' => 'required|string',
            'bank_name' => 'required|string',
            'account_number' => 'required|string',
            'account_holder_name' => 'required|string',
            'ifsc_code' => 'required|string',
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
                VendorProfile::updateOrCreate([
                    'vendor_id' => auth()->id()
                ],
                    $request->all()
                );
                $result = [
                    'status' => 1,
                    'response' => 'success',
                    'action' => 'registered',
                    'message' => 'Registration completed. Your account is currently under review. You will be notified in 24-48 hours.'
                ];
                //Send notification to admin for approval
            } catch (\Exception $exception) {
                $result = [
                    'status' => 0,
                    'response' => 'error',
                    'message' => $exception->getMessage()
                ];
            }
        }

        return response()->json($result, 200);
    }

    public function loginStepOne(Request $request)
    {
        $validator = Validator::make($request->json()->all(), [
            'mobile' => 'required|exists:vendors,mobile',
            'password' => 'required|string',
        ]);

        if ($validator->fails()) {
            $result = [
                'status' => 0,
                'response' => 'validation_error',
                'action' => 'retry',
                'message' => $validator->errors()->all()
            ];
        } else {
            $vendor = Vendor::where('mobile', $request->mobile)->first();
            if (!Hash::check($request->password, $vendor->password)) {
                $result = [
                    'status' => 0,
                    'response' => 'error',
                    'action' => 'retry',
                    'message' => 'Credentials do not match our record.'
                ];
            } else {
                try {
                    Otp::where('mobile', $request->input('mobile'))->update(['is_expired' => '1']);
                    $otp = rand(1000, 9999);
                    $data['otp'] = $otp;
                    $data['service_type'] = "login";
                    $data['mobile'] = $request->input('mobile');

//                $gatewayResponse = $this->sendOtpSms($data);
                    $otpObj = new Otp();
                    $otpObj->vendor_id = $vendor->id;
                    $otpObj->mobile = $request->mobile;
                    $otpObj->otp = $otp;
                    $otpObj->sms_status = null;
//                $otpObj->gateway_response = json_encode($gatewayResponse);
                    $otpObj->save();

                    $result = [
                        'status' => 1,
                        'response' => 'success',
                        'action' => 'step2',
                        "data" => [
                            'otp' => $otp,
                        ],
                        'message' => 'Please check your mobile for OTP'
                    ];
                } catch (\Exception $exception) {
                    $result = [
                        'status' => 0,
                        'response' => 'error',
                        'message' => $exception->getMessage()
                    ];
                }
            }

        }

        return response()->json($result, 200);
    }

    public function loginStepTwo(Request $request)
    {
        $validator = Validator::make($request->json()->all(), [
            'mobile' => 'required|exists:vendors,mobile',
            'otp' => 'required|numeric',
            'device_token' => 'nullable',
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
                Otp::where('mobile', $request->input('mobile'))->update(['is_expired' => '1']);
                $vendor = Vendor::where('mobile', $request->mobile)->first();
                $vendor->device_token = $request->device_token;
                $access_token = $vendor->createToken('user_token')->plainTextToken;
                $vendor['access_token'] = $access_token;
                $result = [
                    'status' => 1,
                    'response' => 'success',
                    'action' => 'logged_in',
                    "data" => [
                        'user' => $vendor,
                    ],
                    'message' => 'You are logged in successfully.'
                ];
            } catch (\Exception $exception) {
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
