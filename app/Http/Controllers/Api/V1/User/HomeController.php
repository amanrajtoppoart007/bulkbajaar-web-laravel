<?php

namespace App\Http\Controllers\Api\V1\User;

use App\Http\Controllers\Controller;
use App\Http\Resources\Api\BrandResource;
use App\Models\Brand;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function getBrands()
    {
        try {
           $brands = Brand::all();
           if(!empty($brands))
           {
                $data = BrandResource::collection($brands);
                $result = ["status"=>1,"response"=>"success","data"=>$data,"message"=>"data found"];
           }
           else
           {
               $result = ["status"=>0,"response"=>"error","message"=>"No data found"];
           }
        }
        catch (\Exception $exception)
        {
            $result = ["status"=>0,"response"=>"exception_error","message"=>$exception->getMessage()];
        }
        return response()->json($result,200);
    }
}
