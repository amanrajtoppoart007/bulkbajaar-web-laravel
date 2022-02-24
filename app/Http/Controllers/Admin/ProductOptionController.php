<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreProductOptionRequest;
use App\Models\ProductOption;
use App\Models\UnitType;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use Illuminate\Support\Facades\DB;

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
    public function create($productId)
    {
          $product_id = $productId;
          $unitTypes          = UnitType::select('name')->whereStatus(true)->get();
          $options = ProductOption::where(['product_id'=>$product_id])->get();

          return view("admin.products.options.create",compact('product_id','unitTypes','options'));
    }

    public function store(StoreProductOptionRequest $request)
    {
         DB::beginTransaction();
        try {

            $product_id = $request->input('product_id');
            $color = $request->input('color');
            $size = $request->input('size');
            $unit = $request->input('unit');
            $qty = $request->input('quantity');
            $isDefault = $request->input('is_default') === 'on'? 1:'0';
            $option = $color.'-'.$size;
            $params = [
                'product_id'=>$product_id,
                'color'=>$color,
                'size'=>$size,
            ];

            if(!ProductOption::where($params)->first())
            {
                $params['option'] = $option;
                $params['unit'] = $unit;
                $params['quantity'] = $qty ?? 0;
                $params['is_default'] = $isDefault;
                if($isDefault)
                {
                    $options = ProductOption::where(['product_id' => $product_id])->get();
                    foreach ($options as $option) {
                        $option->is_default = 0;
                        $option->save();
                    }
                }

                $productOption = ProductOption::create($params);
                foreach ($request->input('images', []) as $file) {
                    $productOption->addMedia(storage_path('tmp/uploads/' . $file))->withCustomProperties([
                        'color' => $color,
                        'size' => $size,
                        'option_id' => $productOption->id
                    ])->toMediaCollection('images');
                }
                 DB::commit();
                $result = ["status"=>1,"response"=>"success","message"=>"variation successfully created"];
            }
            else
            {
                 DB::rollBack();
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
    public function edit($id)
    {
         $option = ProductOption::find($id);
         return view("admin.products.options.edit",compact('option'));
    }

    public function update()
    {

    }
    public function destroy()
    {

    }
}
