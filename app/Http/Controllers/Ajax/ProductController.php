<?php

namespace App\Http\Controllers\Ajax;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ProductPrice;
use App\Models\ProductSubCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
    public function productSearchSelect2(Request $request)
    {
        $products = Product::where('name', 'LIKE', '%' . $request->term .'%')->select(['id', 'name'])->get();
        return response([
            'data' => $products,
        ]);
    }

    public function productPriceByProduct(Request $request)
    {
        $productPrices = ProductPrice::whereProductId($request->productId)->get();
        return response([
            'data' => $productPrices,
        ]);
    }

    public function getProductSubCategories(Request $request)
    {
        $validator = Validator::make($request->all(),[
            "product_category_id"=>"required|numeric"
        ]);
        if(!$validator->fails())
        {
            $subCategories = ProductSubCategory::where(['product_category_id'=>$request->input('product_category_id')])->get();
            if(!$subCategories->isEmpty())
            {
                $result = ["status"=>1,"response"=>"success","data"=>$subCategories,"message"=>"Data fetched"];
            }
            else
            {
                $result = ["status"=>0,"response"=>"error","message"=>"No data found"];
            }

        }
        else
        {
            $result = ["status"=>0,"response"=>"error","message"=>$validator->errors()->all()];
        }
        return response()->json($result);
    }
}
