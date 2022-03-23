<?php


namespace App\Http\Controllers\Api\V1\User;

use App\Http\Controllers\Api\BaseController;
use App\Http\Resources\Api\ProductResource;
use App\Library\Api\V1\User\BrandList;
use App\Library\Api\V1\User\ProductList;
use App\Library\Api\V1\User\SubCategoryList;
use App\Models\Brand;
use App\Models\Product;
use App\Models\ProductOption;
use App\Models\ProductSubCategory;
use App\Models\Review;
use App\Traits\ProductTrait;
use App\Traits\ReviewTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ProductController extends BaseController
{
    use ProductTrait, ReviewTrait;

    public function getLatestProducts(Request $request)
    {
        try {
            $products = Product::latest()
               ->where('approval_status', 'APPROVED')
                ->with('productCategory', 'productSubCategory', 'vendor', 'productOptions', 'brand')
                ->limit($request->input('limit',100))->get();
            if (count($products)) {
                $data['list'] = ProductResource::collection($products);
                $result = ['status' => 1, 'response' => 'success', 'action' => 'fetched', 'data' => $data, 'message' => 'Product data fetched successfully'];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'No product found'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result);
    }

    public function getProductOptionId(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'product_id'=>'required|integer',
            'color'=>'nullable|string',
            'size'=>'nullable|string'
        ]);
        if(!$validator->fails())
        {
            try {
                $option = ProductOption::where('product_id', $request->input('product_id'));
                if ($request->has('color')) {
                    $option->where('color', $request->input('color'));
                }
                $option = $option->first();
                if($option)
                {
                    if ($request->has('size')) {
                        $data['product_option_id'] = $request->has('size') == $option?->size ? $option?->id : null;
                    } else {
                        $data['product_option_id'] = null;
                    }

                    $data['images'] =  [];
                    if($option->images)
                    {
                        foreach($option->images as $image)
                        {
                            $data['images'][] = $image->original_url;
                        }
                    }
                    $result = ['status' => 1, 'response' => 'success', 'action' => 'fetched', 'data' => $data, 'message' => 'Product data fetched successfully'];
                }
                else
                {
                    $result = ['status' => 0, 'response' => 'failed', 'action' => 'retry', 'message' => 'No data found'];
                }
            } catch (\Exception $exception) {
                $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
            }
        }
        else
        {
            $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => $validator->errors()];

        }

        return response()->json($result);
    }

    public function getTopRatedProducts(Request $request)
    {
        try {
            $products = Product::limit($request->input('limit',100))
                ->where('approval_status', 'APPROVED')
                ->withCount('reviews')->orderBy('reviews_count', 'desc')
                ->with('productCategory', 'productSubCategory', 'brand', 'vendor', 'productOptions')
                ->get();
            if (count($products)) {
                $data['list'] = ProductResource::collection($products);
                $result = ['status' => 1, 'response' => 'success', 'action' => 'fetched', 'data' => $data, 'message' => 'Product data fetched successfully'];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'No product found'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result);
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
            $review->user_id = auth()->id();
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
        return response()->json($result);

    }

    public function getProductDetails(Request $request)
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
            $product = Product::find($request->input('product_id'));
            try {

                $product->load(['productCategory','productSubCategory', 'brand', 'productOptions', 'vendor', 'productReturnConditions:id,title']);

                $reviewCounts = $this->getProductReviewCounts($product->id);
                $data = [
                    'id' => $product->id,
                    'vendor_id' => $product->vendor_id,
                    'vendor_name'=>$product?->vendor?->name,
                    'vendor'=>[
                        'id'=>$product?->vendor_id,
                        'name'=>$product?->vendor?->name,
                        'product_count'=>$product?->vendor?->products?->count(),
                        'minimum_order_price'=>$product?->vendor?->vendor_profile?->mop,
                    ],
                    'name' => $product->name,
                    'sku' => $product->sku,
                    'hsn' => $product->hsn,
                    'description' => $product->description,
                    'price' => $product?->price,
                    'discount' => $product->discount,
                    'maximum_retail_price'=>$product?->maximum_retail_price,
                    'gst' => $product->gst,
                    'gst_type' => $product->gst_type,
                    'threshold_quantity' => $product->moq,
                    'threshold_price' => getMinimumOrderAmount($product->vendor_id),
                    'discounted_price' => $product->price,
                    'category' => $product->productCategory->name ?? '',
                    'sub_category' => $product->productSubCategory->name ?? '',
                    'brand' => $product->brand->title ?? '',
                    'dispatch_time' => $product->dispatch_time,
                    'refund_and_return_policy' => $product->rrp,
                    'liked' => $this->checkIfProductLiked($product->id),
                    'return_conditions' => $product->productReturnConditions ?? [],
                    'product_attributes' => $product->product_attributes ?? [],
                    'ratings' => $reviewCounts ?? [],
                    'rating' => $reviewCounts['average'] ?? 0,
                    'image_list'=>$product?->image_list
                ];
                $data['product_options'] = [];
                $data['images'] = [];

                if (isset($product->images)) {
                    foreach ($product->images as $image){
                        $data['images'][] = $image->url;
                    }
                }

                if (isset($product->productOptions)) {
                    foreach ($product->productOptions as $productOption){
                        $data['product_options'][] = [
                            'id' => $productOption->id,
                            'product_id' => $productOption->product_id,
                            'option' => $productOption->option,
                            'size' => $productOption->size,
                            'color' => $productOption->color,
                            'unit' => $productOption->unit,
                            'quantity' => $productOption->quantity,
                            'liked' => $this->checkIfProductOptionLiked($productOption->id),
                        ];
                    }
                }

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
        return response()->json($result);
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
                $class = new SubCategoryList($subCategoryList['data']);
                $data['list'] = $class->execute();
                $result = ['status' => 1, 'response' => 'success', 'action' => 'fetched', 'data' => $data, 'message' => 'SubCategory data fetched successfully'];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'No sub category found'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result);
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

            if ($request->has('category')) {
                $query->whereHas('productCategory', function ($q) use($request){
                   $q->where('name', 'LIKE', "%".$request->input('category')."%");
                });
            }

            if ($request->has('categories')) {
                $query->whereHas('productCategory', function ($q) use($request){
                   $q->whereIn('id', $request->input('categories'));
                });
            }

            if ($request->has('subCategory')) {
                 $query->whereHas('productSubCategory', function ($q) use($request){
                   $q->where('name', 'LIKE', "%".$request->input('subCategory')."%");
                });
            }

            if ($request->has('vendor')) {
                $query->whereHas('vendor', function ($q) use($request){
                   $q->where('name', 'LIKE', "%".$request->input('vendor')."%");
                });
            }

            if ($request->has('vendor_id')) {
                $query->where('vendor_id',$request->input('vendor_id'));

            }

            if ($request->has('brand')) {
                 $query->whereHas('brand', function ($q) use($request){
                   $q->where('title', 'LIKE', "%".$request->input('brand')."%");
                });
            }

            if ($request->has('brands')) {
                $query->whereHas('brand', function ($q) use($request){
                   $q->whereIn('id', $request->input('brands'));
                });
            }

            if ($request->has('priceRange.min_price')) {
                $query->where('price','>=', $request->input('priceRange.min_price'));
            }

            if ($request->has('priceRange.min_price')) {
                $query->where('price','<=', $request->input('priceRange.min_price'));
            }
              $query->where('approval_status', 'APPROVED');
            $products = $query->with(['productCategory', 'productSubCategory', 'vendor', 'productOptions', 'brand'])->paginate(200);
            if (count($products)) {
                $productList = $products->toArray();
                $data['current_page'] = $productList['current_page'];
                $data['next_page_url'] = $productList['next_page_url'];
                $data['last_page_url'] = $productList['last_page_url'];
                $data['per_page'] = $productList['per_page'];
                $data['total'] = $productList['total'];
                $data['list'] = ProductResource::collection($products);
                $result = ['status'=>1,'response'=>'success','action'=>'fetched','data'=>$data,'message'=>'Products data fetched successfully'];
            } else {
                $result = ['status'=>0,'response'=>'error','action'=>'retry','message'=>'No product found'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result);
    }

    public function getTopSellingProducts(Request $request)
    {
        try {
            $products = Product::limit(10)
            ->where('approval_status', 'APPROVED')
                ->orderByDesc('order_count')
                ->with('productCategory', 'productSubCategory', 'vendor', 'productOptions', 'brand')
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
        return response()->json($result);
    }




    public function getBrands(Request $request)
    {
        try {
            $query = Brand::query();

            if (!empty($request->input('keyword'))) {
                $query->where(function ($q) use ($request) {
                    $q->where('title', 'LIKE', "%" . $request->input('keyword') . "%");
                });
            }

            $brands = $query->paginate(10);
            if (count($brands)) {
                $brandList = $brands->toArray();
                $data['current_page'] = $brandList['current_page'];
                $data['next_page_url'] = $brandList['next_page_url'];
                $data['last_page_url'] = $brandList['last_page_url'];
                $data['per_page'] = $brandList['per_page'];
                $data['total'] = $brandList['total'];
                $class = new BrandList($brandList['data']);
                $data['list'] = $class->execute();
                $result = ['status' => 1, 'response' => 'success', 'action' => 'fetched', 'data' => $data, 'message' => 'Brand data fetched successfully'];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'No brand found'];
            }

        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result);
    }

}
