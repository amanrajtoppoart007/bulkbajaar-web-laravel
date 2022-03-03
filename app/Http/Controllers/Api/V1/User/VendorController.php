<?php

namespace App\Http\Controllers\Api\V1\User;

use App\Http\Controllers\Api\BaseController;
use App\Http\Resources\Api\VendorResource;
use App\Library\Api\V1\User\VendorList;
use App\Models\Vendor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class VendorController extends BaseController
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
            $query->where('approved', 1);
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

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */

    public function getVendorDetails(Request $request): \Illuminate\Http\JsonResponse
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
            $vendor = Vendor::withCount(['products'])->find($request->input('vendor_id'));
            try {
                $vendor->load(['profile','profile.pickupState', 'profile.pickupDistrict']);
                $data = new VendorResource($vendor);
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
