<?php

namespace App\Http\Controllers\Api\V1\Vendor;

use App\Http\Controllers\Controller;
use App\Library\Api\V1\Vendor\ProductList;
use App\Models\Product;
use App\Models\ProductOption;
use App\Traits\SlugGeneratorTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
    use SlugGeneratorTrait;

    public function storeProduct(Request $request)
    {
//        if (!auth()->user()->approved){
//            $result = [
//                'status' => 0,
//                'response' => 'error',
//                'action' => 'wait',
//                'message' => 'Your account is currently under review. You will be notified in 24-48 hours.'
//            ];
//            return response()->json($result, 200);
//        }
        $validator = Validator::make($request->json()->all(), [
            'name' => 'required|string',
            'price' => 'required|numeric',
            'mop' => 'nullable|numeric',
            'moq' => 'required|numeric',
            'discount' => 'nullable|numeric|max:100',
            'dispatch_time' => 'nullable|string',
            'rrp' => 'nullable',
            'quantity' => 'nullable|numeric',
            'category_id' => 'nullable|exists:product_categories,id',
            'sub_category_id' => 'nullable|exists:product_sub_categories,id',
            'description' => 'nullable',
            'options' => 'nullable|array',
            'options.*.option' => 'required|string',
            'options.*.unit' => 'nullable|string',
            'options.*.quantity' => 'nullable|numeric',
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
                $product = Product::create([
                    'vendor_id' => auth()->id(),
                    'name' => $request->name,
                    'slug' => $this->generateSlug(Product::class, $request->name),
                    'description' => $request->description,
                    'price' => $request->price,
                    'mop' => $request->mop,
                    'moq' => $request->moq,
                    'discount' => $request->discount,
                    'product_category_id' => $request->category_id,
                    'product_sub_category_id' => $request->sub_category_id,
                    'dispatch_time' => $request->dispatch_time,
                    'rrp' => $request->rrp,
                    'quantity' => $request->quantity,
                ]);

                foreach ($request->options ?? [] as $option){
                    ProductOption::create([
                        'product_id' => $product->id,
                        'option' => $option['option'],
                        'unit' => $option['unit'],
                        'quantity' => $option['quantity'],
                    ]);
                }

                $result = [
                    'status' => 1,
                    'response' => 'success',
                    'action' => 'added',
                    'message' => 'Product added successfully.'
                ];
                //Send notification to admin for approval
            } catch (\Exception $exception) {
                $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
            }
        }

        return response()->json($result, 200);
    }

    public function updateProduct(Request $request)
    {
//        if (!auth()->user()->approved){
//            $result = [
//                'status' => 0,
//                'response' => 'error',
//                'action' => 'wait',
//                'message' => 'Your account is currently under review. You will be notified in 24-48 hours.'
//            ];
//            return response()->json($result, 200);
//        }
        $validator = Validator::make($request->json()->all(), [
            'product_id' => 'required|exists:products,id',
            'name' => 'required|string',
            'price' => 'required|numeric',
            'mop' => 'nullable|numeric',
            'moq' => 'required|numeric',
            'discount' => 'nullable|numeric|max:100',
            'dispatch_time' => 'nullable|string',
            'rrp' => 'nullable',
            'quantity' => 'nullable|numeric',
            'category_id' => 'nullable|exists:product_categories,id',
            'sub_category_id' => 'nullable|exists:product_sub_categories,id',
            'description' => 'nullable',
            'options' => 'nullable|array',
            'options.*.option' => 'required|string',
            'options.*.unit' => 'nullable|string',
            'options.*.quantity' => 'nullable|numeric',
        ]);

        if ($validator->fails()) {
            $result = [
                'status' => 0,
                'response' => 'validation_error',
                'action' => 'retry',
                'message' => $validator->errors()->all()
            ];
        } else {
            $product = Product::find($request->product_id);
            if ($product->vendor_id != auth()->id()){
                $result = [
                    'status' => 0,
                    'response' => 'validation_error',
                    'action' => 'retry',
                    'message' => 'This product does not belong to you.'
                ];
            }else{
                try {
                    $product->update([
                        'name' => $request->name,
                        'description' => $request->description,
                        'price' => $request->price,
                        'mop' => $request->mop,
                        'moq' => $request->moq,
                        'discount' => $request->discount,
                        'product_category_id' => $request->category_id,
                        'product_sub_category_id' => $request->sub_category_id,
                        'dispatch_time' => $request->dispatch_time,
                        'rrp' => $request->rrp,
                        'quantity' => $request->quantity,
                        'approval_status' => 'PENDING',
                    ]);
                    $product->productOptions()->delete();

                    foreach ($request->options ?? [] as $option){
                        ProductOption::create([
                            'product_id' => $product->id,
                            'option' => $option['option'],
                            'unit' => $option['unit'],
                            'quantity' => $option['quantity'],
                        ]);
                    }

                    $result = [
                        'status' => 1,
                        'response' => 'success',
                        'action' => 'updated',
                        'message' => 'Product updated successfully.'
                    ];
                    //Send notification to admin for approval
                } catch (\Exception $exception) {
                    $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
                }
            }
        }

        return response()->json($result, 200);
    }

    public function getProduct(Request $request)
    {
        $validator = Validator::make($request->json()->all(), [
            'product_id' => 'required|exists:products,id',
        ]);

        if ($validator->fails()) {
            $result = [
                'status' => 0,
                'response' => 'validation_error',
                'action' => 'retry',
                'message' => $validator->errors()->all()
            ];
        } else {
            $product = Product::find($request->product_id);
            if ($product->vendor_id != auth()->id()){
                $result = [
                    'status' => 0,
                    'response' => 'validation_error',
                    'action' => 'retry',
                    'message' => 'This product does not belong to you.'
                ];
            }else{
                try {
                    $product->load(['productCategory','productSubCategory', 'productOptions']);
                    $result = [
                        'status' => 1,
                        'response' => 'success',
                        'action' => 'fetched',
                        'data' => $product,
                        'message' => 'Product fetched successfully.'
                    ];
                } catch (\Exception $exception) {
                    $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
                }
            }
        }

        return response()->json($result, 200);
    }

    public function getProducts(Request $request)
    {
        try {
            $query = Product::query();
            if ($request->input('keyword')) {
                $query->where(function ($q) use ($request) {
                    $q->where('name', 'LIKE', "%".$request->input('keyword')."%");
                });
            }

            if ($request->input('category_id')) {
                $query->where('product_category_id', $request->input('category_id'));
            }
            if ($request->input('sub_category_id')) {
                $query->where('product_category_id', $request->input('sub_category_id'));
            }

            $products = $query->with(['productCategory', 'productSubCategory'])->paginate(10);
            if (count($products)) {
                $productList = $products->toArray();
                $data['current_page'] = $productList['current_page'];
                $data['next_page_url'] = $productList['next_page_url'];
                $data['last_page_url'] = $productList['last_page_url'];
                $data['per_page'] = $productList['per_page'];
                $data['total'] = $productList['total'];
                $data['list'] = $productList['data'];
                $class = new ProductList($productList['data']);
                $data['list'] = $class->execute();
                $result = [
                    'status' => 1,
                    'response' => 'success',
                    'action' => 'fetched',
                    'data' => $data,
                    'message' => 'Products data fetched successfully'
                ];
            } else {
                $result = [
                    'status' => 0,
                    'response' => 'error',
                    'action' => 'retry',
                    'message' => 'No product found'
                ];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }
}
