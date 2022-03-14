<?php


namespace App\Http\Controllers\Api\V1\User;

use App\Http\Resources\Api\AddressResource;
use App\Http\Resources\UserApiResource;
use App\Models\Area;
use App\Models\Block;
use App\Models\District;
use App\Models\Order;
use App\Models\Pincode;
use App\Models\State;
use App\Models\User;
use App\Models\UserAddress;
use App\Models\UserProfile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;
use Validator;

class ProfileController extends \App\Http\Controllers\Api\BaseController
{
    public function getProfileDetails()
    {
        try {
            $user = auth()->user();
            $profile = $user->userProfile;

            $data = [
                'name' => $user->name ?? '',
                'email' => $user->email ?? '',
                'mobile' => $user->mobile ?? '',
                'company_name' => $profile->company_name ?? '',
                'representative_name' => $profile->representative_name ?? '',
                'gst_number' => $profile->gst_number ?? '',
                'pan_number' => $profile->pan_number ?? '',
                'profile_photo' => $profile?->profile_photo?->getUrl(),
            ];
            if (!empty($data)) {
                $result = ['status' => 1, 'response' => 'success', 'action' => 'fetched', 'data' => $data, 'message' => 'Profile data fetched successfully'];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'Profile not found'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function updateProfile(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'mobile' => 'required',
            'email' => 'required',
            'name' => 'required|string',
            'company_name' => 'required|string',
            'representative_name' => 'required|string',
            'gst_number' => 'required|string',
            'pan_number' => 'required|string',
            'profile_photo' => 'required|mimes:jpeg,png',
            'gst'=>'required|mimes:jpeg,png',
            'pan'=>'required|mimes:jpeg,png',

        ]);

        if ($validator->fails()) {
            $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => $validator->errors()];
            return response()->json($result, 200);
        }
        try {

            $user = auth()->user();
            $user->name = $request->input('name');
            $user->email = $request->input('email');
            $user->mobile = $request->input('mobile');
            $profile = UserProfile::updateOrCreate([
                'user_id' => auth()->id()
            ], [
                'company_name' => $request->input('company_name'),
                'representative_name' => $request->input('representative_name'),
                'gst_number' => $request->input('gst_number'),
                'pan_number' => $request->input('pan_number'),
            ]);
            if ($request->hasFile('profile_photo')) {
                $profile->clearMediaCollection('profile_photo');
                $profile->addMedia($request->file('profile_photo'))->toMediaCollection('profile_photo');
            }

            if ($request->hasFile('pan')) {
                $profile->clearMediaCollection('pan');
                $profile->addMedia($request->file('pan'))->toMediaCollection('pan');
            }

             if ($request->hasFile('gst')) {
                $profile->clearMediaCollection('gst');
               $profile->addMedia($request->file('gst'))->toMediaCollection('gst');
            }

            if ($user->save()) {
                $result = ['status' => 1, 'response' => 'success', 'action' => 'updated', 'message' => 'Profile updated successfully'];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'Something went wrong'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);

    }

    public function getStates(Request $request)
    {
        try {
            $query = State::query();
            if ($request->input('keyword')) {
                $query->where(function ($q) use ($request) {
                    $q->where('name', 'LIKE', "%" . $request->input('keyword') . "%");
                });
            }

            $states = $query->select('id', 'name')->whereStatus(true)->get()->toArray();
            if ($states) {
                $result = ['status' => 1, 'response' => 'success', 'action' => 'fetched', 'data' => $states, 'message' => 'States fetched successfully'];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'No state found'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function getDistricts(Request $request)
    {
        try {
            $query = District::query();
            if ($request->input('keyword')) {
                $query->where(function ($q) use ($request) {
                    $q->where('name', 'LIKE', "%" . $request->input('keyword') . "%");
                });
            }

            if ($request->input('state_id')) {
                $query->where('state_id', $request->input('state_id'));
            }

            $districts = $query->select('id', 'name')->whereStatus(true)->get()->toArray();
            if ($districts) {
                $result = ['status' => 1, 'response' => 'success', 'action' => 'fetched', 'data' => $districts, 'message' => 'Districts fetched successfully'];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'No District found'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function getBlocks(Request $request)
    {
        try {
            $query = Block::query();
            if ($request->input('keyword')) {
                $query->where(function ($q) use ($request) {
                    $q->where('name', 'LIKE', "%" . $request->input('keyword') . "%");
                });
            }

            if ($request->input('district_id')) {
                $query->where('district_id', $request->input('district_id'));
            }

            $blocks = $query->select('id', 'name')->whereStatus(true)->get()->toArray();
            if ($blocks) {
                $result = ['status' => 1, 'response' => 'success', 'action' => 'fetched', 'data' => $blocks, 'message' => 'Blocks fetched successfully'];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'No Block found'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function getPincodes(Request $request)
    {
        try {
            $query = Pincode::query();
            if ($request->input('keyword')) {
                $query->where(function ($q) use ($request) {
                    $q->where('pincode', 'LIKE', "%" . $request->input('keyword') . "%");
                });
            }

            if ($request->input('block_id')) {
                $query->where('block_id', $request->input('block_id'));
            }

            $pincodes = $query->select('id', 'pincode')->whereStatus(true)->get()->toArray();
            if ($pincodes) {
                $result = ['status' => 1, 'response' => 'success', 'action' => 'fetched', 'data' => $pincodes, 'message' => 'Pincodes fetched successfully'];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'No Pincode found'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function getAreas(Request $request)
    {
        try {
            $query = Area::query();
            if ($request->input('keyword')) {
                $query->where(function ($q) use ($request) {
                    $q->where('area', 'LIKE', "%" . $request->input('keyword') . "%");
                });
            }

            if ($request->input('pincode_id')) {
                $query->where('pincode_id', $request->input('pincode_id'));
            }

            $areas = $query->select('id', 'area')->whereStatus(true)->get()->toArray();

            if ($areas) {
                $result = ['status' => 1, 'response' => 'success', 'action' => 'fetched', 'data' => $areas, 'message' => 'Areas fetched successfully'];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'No Area found'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function getAddressTypes()
    {
        try {
            $addressTypes = [];
            foreach (UserAddress::ADDRESS_TYPE_RADIO as $key => $value) {
                $addressTypes[] = [
                    'name' => $value,
                    'value' => $key
                ];
            }

            if ($addressTypes) {
                $result = ['status' => 1, 'response' => 'success', 'action' => 'fetched', 'data' => $addressTypes, 'message' => 'Address Types fetched successfully'];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'No address type found'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function addAddress(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'nullable|string',
            'address' => 'required',
            'address_type' => ['required', Rule::in(['SHIPPING', 'BILLING'])],
            'address_line_two' => 'nullable',
            'state_id' => 'required|exists:states,id',
            'district_id' => 'required|exists:districts,id',
            'pincode' => 'required',
        ]);

        if ($validator->fails()) {
            $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => $validator->errors()];
            return response()->json($result, 200);
        }

        try {
            $address = new UserAddress();
            $address->user_id = auth()->user()->id;
            $address->name = $request->name ?? auth()->user()->name;
            $address->address = $request->input('address');
            $address->address_line_two = $request->input('address_line_two');
            $address->address_type = strtoupper($request->input('address_type') ?? 'BILLING');
            $address->state_id = $request->input('state_id');
            $address->district_id = $request->input('district_id');
            $address->pincode = $request->input('pincode');

            if ($address->save()) {
                $result = ['status' => 1, 'response' => 'success', 'action' => 'added', 'message' => 'Address added successfully'];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'Something went wrong'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function updateAddress(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required|exists:user_addresses',
            'name' => 'nullable|string',
            'address' => 'required',
            'address_type' => ['required', Rule::in(['SHIPPING', 'BILLING'])],
            'address_line_two' => 'nullable',
            'state_id' => 'required|exists:states,id',
            'district_id' => 'required|exists:districts,id',
            'pincode' => 'required',
        ]);

        if ($validator->fails()) {
            $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => $validator->errors()];
            return response()->json($result, 200);
        }
        if (!UserAddress::whereId($request->input('id'))->whereUserId(auth()->user()->id)->exists()) {
            $result = ['status' => 0, 'response' => 'error', 'action' => 'rejected', 'message' => "This address does not belong to you."];
            return response()->json($result, 200);
        }
        $result = [];

        try {
            $address = UserAddress::find($request->input('id'));
            if ($address) {
                $address->name = $request->input('name') ?? auth()->user()->name;
                $address->address = $request->input('address');
                $address->address_type = strtoupper($request->input('address_type'));
                $address->address_line_two = $request->input('address_line_two');
                $address->state_id = $request->input('state_id');
                $address->district_id = $request->input('district_id');
                $address->pincode = $request->input('pincode');

                if ($address->save()) {
                    $result = ['status' => 1, 'response' => 'success', 'action' => 'updated', 'message' => 'Address updated successfully'];
                } else {
                    $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'Something went wrong'];
                }
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function getAddresses(Request $request)
    {
        try {
            $query = UserAddress::query();
            $query->where('user_id', auth()->id());
            if ($request->input('address_type')) {
                $query->where('address_type', $request->input('address_type'));
            }
            $data = AddressResource::collection($query->get());
            if ($data) {
                $result = ['status' => 1, 'response' => 'success', 'action' => 'fetched', 'data' => $data, 'message' => 'Addresses fetched successfully'];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'No address found'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function makeDefaultAddress(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required|exists:user_addresses',
        ]);

        if ($validator->fails()) {
            $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => $validator->errors()];
            return response()->json($result, 200);
        }

        if (!UserAddress::whereId($request->input('id'))->whereUserId(auth()->user()->id)->exists()) {
            $result = ['status' => 0, 'response' => 'error', 'action' => 'rejected', 'message' => "This address does not belong to you."];
            return response()->json($result, 200);
        }

        $result = [];
        try {
            $address = UserAddress::find($request->input('id'));
            if ($address) {
                UserAddress::whereUserId(auth()->user()->id)->update(['is_default' => false]);
                $address->is_default = true;
                if ($address->save()) {
                    $result = ['status' => 1, 'response' => 'success', 'action' => 'updated', 'message' => 'Address marked as default successfully'];
                } else {
                    $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'Something went wrong'];
                }
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function removeAddress(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required|exists:user_addresses',
        ]);

        if ($validator->fails()) {
            $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => $validator->errors()];
            return response()->json($result, 200);
        }

        if (!UserAddress::whereId($request->input('id'))->whereUserId(auth()->user()->id)->exists()) {
            $result = ['status' => 0, 'response' => 'error', 'action' => 'rejected', 'message' => "This address does not belong to you."];
            return response()->json($result, 200);
        }

        try {
            $exceptOrderStatuses = Order::ADDRESS_DELETE_ALLOWED;
            if (Order::whereShippingAddressId($request->id)->whereIn('status', $exceptOrderStatuses)->exists()) {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'This address has active order.'];
            } else {
                if (UserAddress::destroy($request->input('id'))) {
                    $result = ['status' => 1, 'response' => 'success', 'action' => 'updated', 'message' => 'Address deleted successfully'];
                } else {
                    $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'Something went wrong'];
                }
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }


    public function getUser()
    {
        try {
          $user = User::find(auth()->user()->id);
          if(!empty($user))
          {
              $user = new UserApiResource($user);
              $result = ['status' => 1, 'response' => 'success','data'=>$user, 'message' => 'User fetched successfully'];
          }
          else
          {
               $result = ['status' => 0, 'response' => 'error', 'message' => 'User not found'];
          }
        }
        catch (\Exception $exception)
        {
             $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function updateDocument(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'docType' => 'required|string',
            'gst'=>'nullable|mimes:jpeg,png|required_without:shop_bill_invoice',
            'shop_bill_invoice'=>'nullable|mimes:jpeg,png|required_without:gst',

        ]);

        if ($validator->fails()) {
            $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => $validator->errors()];
            return response()->json($result, 200);
        }
        try {

            $user = auth()->user();
            $profile = UserProfile::where('user_id',$user->id)->first();

            if ($request->hasFile('gst_image') && $request->input('docType')==='gst') {
                $profile->clearMediaCollection('gst_image');
                $profile->addMedia($request->file('gst_image'))->toMediaCollection('gst_image');
            }



             if ($request->hasFile('shop_bill_invoice') && $request->input('docType')==='shop_bill_invoice') {
                $profile->clearMediaCollection('shop_bill_invoice');
               $profile->addMedia($request->file('shop_bill_invoice'))->toMediaCollection('shop_bill_invoice');
            }

            if ($profile->save()) {
                $result = ['status' => 1, 'response' => 'success', 'action' => 'updated', 'message' => 'Profile updated successfully'];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'Something went wrong'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);

    }
}
