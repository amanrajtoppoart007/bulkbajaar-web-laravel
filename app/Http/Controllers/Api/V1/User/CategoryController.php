<?php

namespace App\Http\Controllers\Api\V1\User;

use App\Http\Controllers\Controller;
use App\Http\Resources\Api\CategoryResource;
use App\Models\ProductCategory;
use Exception;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function index(Request $request): \Illuminate\Http\JsonResponse
    {
        try {
            $data = CategoryResource::collection(ProductCategory::all());
            $result = ["status"=>1,"response"=>"success","data"=>$data,"message"=>"data fetched"];
        }
        catch (Exception $exception)
        {
               $result = ["status"=>0,"response"=>"exception_error","message"=>$exception->getMessage()];
        }
          return response()->json($result);
    }
}
