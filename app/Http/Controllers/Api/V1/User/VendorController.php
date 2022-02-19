<?php

namespace App\Http\Controllers\Api\V1\User;

use App\Http\Controllers\Controller;
use App\Library\Api\V1\User\VendorList;
use App\Models\OrderItem;
use App\Models\Product;
use App\Models\Vendor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class VendorController extends \App\Http\Controllers\Api\BaseController
{
    public function getVendors(Request $request)
    {
        try {
            $query = Vendor::query();

            if (!empty($request->input('keyword'))) {
                $query->where(function ($q) use ($request) {
                    $q->where('name', 'LIKE', "%" . $request->input('keyword') . "%");
                });
            }

//            $query->where('approved', true);

            $vendors = $query->with(['profile.pickupDistrict'])->withCount('products')->paginate(10);
            if (count($vendors)) {
                $vendorList = $vendors->toArray();
                $data['current_page'] = $vendorList['current_page'];
                $data['next_page_url'] = $vendorList['next_page_url'];
                $data['last_page_url'] = $vendorList['last_page_url'];
                $data['per_page'] = $vendorList['per_page'];
                $data['total'] = $vendorList['total'];
                $class = new VendorList($vendorList['data']);
                $data['list'] = $class->execute();
                $result = ['status' => 1, 'response' => 'success', 'action' => 'fetched', 'data' => $data, 'message' => 'Vendor list fetched successfully'];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'No category found'];
            }

        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function getVendorDetails(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'vendor_id' => 'required|exists:vendors,id',
        ]);

        if ($validator->fails()) {
            $result = [
                'status' => 0,
                'response' => 'validation_error',
                'action' => 'retry',
                'message' => $validator->errors()->all()
            ];
        } else {
            $vendor = Vendor::find($request->vendor_id);
            try {

                $vendor->load(['profile','profile.pickupState', 'profile.pickupDistrict']);

                $data = [
                    'id' => $vendor->id,
                    'name' => $vendor->name,
                    'shop_image'=>$vendor->shop_image ? $vendor->shop_image->preview : null,
                    'company_name' => $vendor->profile->company_name ?? '',
                    'representative_name' => $vendor->profile->representative_name ?? '',
                    'gst_number' => $vendor->profile->gst_number ?? '',
                    'pan_number' => $vendor->profile->pan_number ?? '',
                    'pickup_address' => $vendor->profile->pickup_address ?? '',
                    'pickup_address_two' => $vendor->profile->pickup_address_two ?? '',
                    'pickup_state' => $vendor->profile->pickupState->name ?? '',
                    'pickup_district' => $vendor->profile->pickupDistrict->name ?? '',
                    'pickup_pincode' => $vendor->profile->pickup->pincode ?? '',
                    'mop' => getMinimumOrderAmount($vendor->id),
                ];
                $result = [
                    'status' => 1,
                    'response' => 'success',
                    'action' => 'fetched',
                    'data' => $data,
                    'message' => 'Vendor fetched successfully.'
                ];
            } catch (\Exception $exception) {
                $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
            }
        }

        return response()->json($result, 200);

    }
}
