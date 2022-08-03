<?php

namespace App\Http\Controllers\Api\V1\User;

use App\Http\Controllers\Api\BaseController;
use App\Http\Resources\Api\ProductResource;
use App\Http\Resources\Api\VendorResource;
use App\Models\Product;
use App\Models\Vendor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Exception;

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
            $vendors = $query->with(['profile.pickupDistrict'])->withCount('products')->paginate(500);
            if (count($vendors)) {
                $data['list'] = VendorResource::collection($vendors);
                $meta = [
                    'current_page' => $vendors?->currentPage(),
                    'next_page_url' => $vendors?->nextPageUrl(),
                    'last_page_url' => $vendors?->lastPage(),
                    'per_page' => $vendors?->perPage(),
                    'total' => $vendors?->total(),
                ];
                $data = array_merge($data,$meta);
                $result = ['status' => 1, 'response' => 'success', 'action' => 'fetched', 'data' => $data, 'message' => 'Vendor list fetched successfully'];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'No category found'];
            }

        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result);
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
            $result = ['status' => 0, 'response' => 'validation_error', 'action' => 'retry', 'message' => $validator->errors()->all()];
        } else {
            $vendor = Vendor::with(['products'])->find($request->input('vendor_id'));
            try {
                $vendor->load(['profile','profile.pickupState', 'profile.pickupDistrict']);
                $data = new VendorResource($vendor);
                $products = Product::with(['productOptions'])->where(['vendor_id'=>$request->input('vendor_id'),'approval_status'=>'APPROVED'])->get();
                $result = ['status' => 1, 'response' => 'success', 'action' => 'fetched', 'data' => $data, 'products'=> ProductResource::collection($products), 'message' => 'Vendor fetched successfully.'];
            } catch (Exception $exception) {
                $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
            }
        }
        return response()->json($result, 200);
    }
}
