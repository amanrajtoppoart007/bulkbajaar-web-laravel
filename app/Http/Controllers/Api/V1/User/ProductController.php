<?php


namespace App\Http\Controllers\Api\V1\User;

use App\Library\Api\V1\User\CategoryList;
use App\Library\Api\V1\User\ProductList;
use App\Library\Api\V1\User\SubCategoryList;
use App\Models\Product;
use App\Models\ProductCategory;
use App\Models\ProductSubCategory;
use App\Models\Review;
use App\Traits\ProductTrait;
use App\Traits\ReviewTrait;
use Illuminate\Http\Request;
use Validator;

class ProductController extends \App\Http\Controllers\Api\BaseController
{
    use ProductTrait, ReviewTrait;

    public function getLatestProducts(Request $request)
    {
        try {
            $products = Product::latest()
//                ->where('approval_status', 'APPROVED')
                ->with('productCategory', 'productSubCategory', 'reviews', 'vendor', 'productOptions')
                ->limit(10)->get()->toArray();
            if (count($products)) {
                $class = new ProductList($products);
                $data['list'] = $class->execute();
                $result = ['status' => 1, 'response' => 'success', 'action' => 'fetched', 'data' => $data, 'message' => 'Product data fetched successfully'];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'No product found'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function getTopRatedProducts(Request $request)
    {
        try {
            $products = Product::limit(10)
                ->where('approval_status', 'APPROVED')
                ->withCount('reviews')->orderBy('reviews_count', 'desc')
                ->with('productCategory', 'productSubCategory', 'reviews', 'vendor', 'productOptions')
                ->get()->toArray();
            if (count($products)) {
                $class = new ProductList($products);
                $data['list'] = $class->execute();
                $result = ['status' => 1, 'response' => 'success', 'action' => 'fetched', 'data' => $data, 'message' => 'Product data fetched successfully'];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'No product found'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function writeReview(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required|exists:products,id',
            'star' => 'required',
            'review' => 'nullable',
        ]);
        if ($validator->fails()) {
            $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => $validator->errors()];
            return response()->json($result, 200);
        }

        try {
            $review = new Review();
            $review->product_id = $request->input('product_id');
            $review->user_id = auth()->user()->id;
            $review->review = $request->input('review');
            $review->star = $request->input('star');
            if ($review->save()) {
                $result = ['status' => 1, 'response' => 'success', 'action' => 'added', 'message' => 'Your review added successfully successfully'];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'Something went wrong'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);

    }

    public function getProductDetails(Request $request)
    {
        $validator = \Illuminate\Support\Facades\Validator::make($request->json()->all(), [
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
            try {

                $product->load(['productCategory','productSubCategory', 'productOptions', 'vendor', 'productReturnConditions:id,title']);

                $data = [
                    'id' => $product->id,
                    'vendor_id' => $product->vendor_id,
                    'name' => $product->name,
                    'description' => $product->description,
                    'price' => applyPrice($product->price, null, $product->discount),
                    'moq' => $product->moq,
                    'discount' => $product->discount,
                    'category' => $product->productCategory->name ?? '',
                    'sub_category' => $product->productSubCategory->name ?? '',
                    'dispatch_time' => $product->dispatch_time,
                    'rrp' => $product->rrp,
                    'product_options' => $product->productOptions,
                    'vendor' => $product->vendor->name ?? '',
                    'return_conditions' => $product->productReturnConditions ?? [],
                ];
                $result = [
                    'status' => 1,
                    'response' => 'success',
                    'action' => 'fetched',
                    'data' => $data,
                    'message' => 'Product fetched successfully.'
                ];
            } catch (\Exception $exception) {
                $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
            }
        }

        return response()->json($result, 200);

    }

    public function getCategories(Request $request)
    {
        try {
            $query = ProductCategory::query();

            if (!empty($request->input('keyword'))) {
                $query->where(function ($q) use ($request) {
                    $q->where('name', 'LIKE', "%" . $request->input('keyword') . "%");
                });
            }

            $categories = $query->paginate(10);
            if (count($categories)) {
                $categoryList = $categories->toArray();
                $data['current_page'] = $categoryList['current_page'];
                $data['next_page_url'] = $categoryList['next_page_url'];
                $data['last_page_url'] = $categoryList['last_page_url'];
                $data['per_page'] = $categoryList['per_page'];
                $data['total'] = $categoryList['total'];
                $data['list'] = $categoryList['data'];
                $class = new CategoryList($categoryList['data']);
                $data['list'] = $class->execute();
                $result = ['status' => 1, 'response' => 'success', 'action' => 'fetched', 'data' => $data, 'message' => 'Category data fetched successfully'];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'No category found'];
            }

        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function getSubCategories(Request $request)
    {
        try {
            $query = ProductSubCategory::query();
            if ($request->input('keyword')) {
                $query->where(function ($q) use ($request) {
                    $q->where('name', 'LIKE', "%" . $request->input('keyword') . "%");
                });
            }

            if ($request->input('category_id')) {
                $query->where('product_category_id', $request->input('category_id'));
            }

            $subCategories = $query->with('category')->paginate(10);
            if (count($subCategories)) {
                $subCategoryList = $subCategories->toArray();
                $data['current_page'] = $subCategoryList['current_page'];
                $data['next_page_url'] = $subCategoryList['next_page_url'];
                $data['last_page_url'] = $subCategoryList['last_page_url'];
                $data['per_page'] = $subCategoryList['per_page'];
                $data['total'] = $subCategoryList['total'];
                $data['list'] = $subCategoryList['data'];
                $class = new SubCategoryList($subCategoryList['data']);
                $data['list'] = $class->execute();
                $result = ['status' => 1, 'response' => 'success', 'action' => 'fetched', 'data' => $data, 'message' => 'SubCategory data fetched successfully'];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'No sub category found'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
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

            if ($request->input('vendor_id')) {
                $query->where('vendor_id', $request->input('vendor_id'));
                $query->orderByDesc('order_count');
            }

            if ($request->input('min_price')) {
                $query->where('price','>=', $request->input('min_price'));
            }

            if ($request->input('max_price')) {
                $query->where('price','<=', $request->input('max_price'));
            }

//            $query->where('approval_status', 'APPROVED');

            $products = $query->with(['productCategory', 'productSubCategory', 'vendor', 'productOptions'])->paginate(10);
            if (count($products)) {
                $productList = $products->toArray();
                $data['current_page'] = $productList['current_page'];
                $data['next_page_url'] = $productList['next_page_url'];
                $data['last_page_url'] = $productList['last_page_url'];
                $data['per_page'] = $productList['per_page'];
                $data['total'] = $productList['total'];
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

    public function getTopSellingProducts(Request $request)
    {
        try {
            $products = Product::limit(10)
//                ->where('approval_status', 'APPROVED')
                ->orderByDesc('order_count')
                ->with('productCategory', 'productSubCategory', 'reviews', 'vendor', 'productOptions')
                ->get()->toArray();
            if (count($products)) {
                $class = new ProductList($products);
                $data['list'] = $class->execute();
                $result = ['status' => 1, 'response' => 'success', 'action' => 'fetched', 'data' => $data, 'message' => 'Product data fetched successfully'];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'No product found'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

}
