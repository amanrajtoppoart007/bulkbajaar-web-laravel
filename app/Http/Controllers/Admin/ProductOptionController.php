<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreProductOptionRequest;
use App\Models\ProductOption;
use App\Models\UnitType;
use App\Http\Controllers\Traits\MediaUploadingTrait;

class ProductOptionController extends Controller
{

    use MediaUploadingTrait;

    public function removeUploadedFiles()
    {
            $this->removeMedia();
    }
      public function index()
    {

    }
    public function create($productId): \Illuminate\Contracts\View\View|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\Foundation\Application
    {
          $product_id = $productId;
          $unitTypes          = UnitType::select('name')->whereStatus(true)->get();
          return view("admin.products.options.create",compact('product_id','unitTypes'));
    }

    public function store(StoreProductOptionRequest $request): \Illuminate\Http\JsonResponse
    {
        try {
            $color = $request->input('color');
            $size = $request->input('size');
            $unit = $request->input('unit');
            $qty = $request->input('quantity');
            $isDefault = $request->input('is_default');
            $option = $color.'-'.$size;
            $params = [
                'product_id'=>$request->input('product_id'),
                'color'=>$color,
                'size'=>$size,
            ];

            if(!ProductOption::where($params)->first())
            {
                $params['option'] = $option;
                $params['unit'] = $unit;
                $params['quantity'] = $qty ?? 0;
                $productOption = ProductOption::create($params);
                foreach ($request->input('images', []) as $file) {
                    $productOption->addMedia(storage_path('tmp/uploads/' . $file))->withCustomProperties([
                        'color' => $color,
                        'size' => $size,
                        'is_default' => $isDefault,
                        'option_id' => $productOption->id
                    ])->toMediaCollection('images');
                }
                $result = ["status"=>1,"response"=>"success","message"=>"variation successfully created"];
            }
            else
            {
                $result = ["status"=>0,"response"=>"error","message"=>"variation already exist"];
            }

        }
        catch (\Exception $exception)
        {
            $result = ["status"=>0,"response"=>"exception_error","message"=>$exception->getMessage()];
        }
        return response()->json($result,200);
    }

    public function show()
    {

    }
    public function edit()
    {

    }

    public function update()
    {

    }
    public function destroy()
    {

    }
}
