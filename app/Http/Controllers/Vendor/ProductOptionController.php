<?php

namespace App\Http\Controllers\Vendor;

use App\Http\Controllers\Controller;
use App\Http\Requests\Vendor\StoreProductOptionRequest;
use App\Http\Requests\Vendor\UpdateProductOptionRequest;
use App\Models\OrderItem;
use App\Models\Product;
use App\Models\ProductOption;
use App\Models\UnitType;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use Exception;
use Illuminate\Support\Facades\DB;

class ProductOptionController extends Controller
{
    use MediaUploadingTrait;
    public function __construct()
    {
        return $this->middleware("auth:vendor");
    }

    public function index($id)
    {
         $options = ProductOption::where(['product_id'=>$id])->get();
         $product_id = $id;
         return view("vendor.products.options.index",compact("options","product_id"));
    }
    public function create($productId)
    {
          $product_id = $productId;
          $unitTypes          = UnitType::select('name')->whereStatus(true)->get();
          $options = ProductOption::where(['product_id'=>$product_id])->get();
          return view("vendor.products.options.create",compact('product_id','unitTypes','options'));
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
            $weight = $request->input('weight');
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
                $params['weight'] = $weight ?? 0;
                $params['is_default'] = $isDefault;
                 $productOption = ProductOption::create($params);
                    $colors = [];
                    $sizes = [];
                    $options = ProductOption::where(['product_id' => $product_id])->get();
                    foreach ($options as $option) {
                        if ($isDefault) {
                             $option->is_default = $option->id==$productOption->id?1:0;
                              $option->save();
                        }
                        if(!in_array($option->color,$colors))
                        {
                           $colors[] = $option->color;

                        }
                        if(!in_array($option->size,$sizes))
                        {
                           $sizes[] = $option->size;
                        }
                        $option->save();
                    }
                    $product = Product::find($product_id);
                    $product->product_attributes = [
                        [
                            'key' => 'color',
                            'values' => $colors
                        ],
                        [
                            'key' => 'size',
                            'values' => $sizes
                        ],
                    ];
                    $product->save();

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
            DB::rollBack();
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
          $unitTypes= UnitType::select('name')->whereStatus(true)->get();
          $options = ProductOption::where(['id'=>$id])->get();
         return view("vendor.products.options.edit",compact('option','options','unitTypes'));
    }

    public function update(UpdateProductOptionRequest $request,$id)
    {
         DB::beginTransaction();
        try {
            $productOption = ProductOption::find($id);
            $product_id = $request->input('product_id');
            $color = $request->input('color');
            $size = $request->input('size');
            $unit = $request->input('unit');
            $qty = $request->input('quantity');
             $weight = $request->input('weight');
            $isDefault = $request->input('is_default') === 'on'? 1:'0';
            $option = $color.'-'.$size;
            if(ProductOption::where(['id'=>$request->input('id')])->first())
            {
                $params['product_id'] = $product_id;
                $params['color'] = $color;
                $params['size'] = $size;
                $params['option'] = $option;
                $params['unit'] = $unit;
                $params['quantity'] = $qty ?? 0;
                $params['weight'] = $weight ?? 0;
                $params['is_default'] = $isDefault;
                ProductOption::where(['id'=>$request->input('id')])->update($params);

                   $colors = [];
                    $sizes = [];
                 $options = ProductOption::where(['product_id' => $product_id])->get();
                    foreach ($options as $option) {
                        if ($isDefault) {
                              $option->is_default = $option->id==$productOption->id?1:0;
                              $option->save();
                        }
                        if(!in_array($option->color,$colors))
                        {
                           $colors[] = $option->color;

                        }
                        if(!in_array($option->size,$sizes))
                        {
                           $sizes[] = $option->size;
                        }
                        $option->save();
                    }
                    $product = Product::find($product_id);
                    $product->product_attributes = [
                        [
                            'key' => 'color',
                            'values' => $colors
                        ],
                        [
                            'key' => 'size',
                            'values' => $sizes
                        ],
                    ];
                    $product->save();

                if (count($productOption->images) > 0) {
                    foreach ($productOption->images as $media) {
                        if (!in_array($media->file_name, $request->input('images', []))) {
                            $media->delete();
                        }
                    }
                }
                 $media = $productOption->images->pluck('file_name')->toArray();

                foreach ($request->input('images', []) as $file) {
                    if (count($media) === 0 || !in_array($file, $media)) {
                        $productOption->addMedia(storage_path('tmp/uploads/' . $file))->withCustomProperties([
                            'color' => $color,
                            'size' => $size,
                            'option_id' => $productOption->id
                        ])->toMediaCollection('images');
                    }
                }
                 DB::commit();
                $result = ["status"=>1,"response"=>"success","message"=>"variation successfully created"];
            }
            else
            {
                 DB::rollBack();
                $result = ["status"=>0,"response"=>"error","message"=>"variation not exist"];
            }

        }
        catch (Exception $exception)
        {
            DB::rollBack();
            $result = ["status"=>0,"response"=>"exception_error","message"=>$exception->getMessage()];
        }
        return response()->json($result);
    }
    public function destroy($id)
    {
       DB::beginTransaction();
        try {
            $productOption = ProductOption::find($id);
            if($productOption)
            {
                if (!OrderItem::where(['product_option_id'=>$id])->count() > 0) {
                    $productOption->delete();
                    DB::commit();
                    $result = ["status" => 1, "response" => "success", "message" => 'Item deleted successfully'];
                } else {
                    DB::rollBack();
                    $result = ["status" => 0, "response" => "exception_error", "message" => 'Order are in place against this item'];
                }
            }
            else
            {
                $result = ["status"=>0,"response"=>"exception_error","message"=>"Option not found"];
            }

        }
        catch (Exception $exception)
        {
             DB::rollBack();
            $result = ["status"=>0,"response"=>"exception_error","message"=>$exception->getMessage()];
        }

        return response()->json($result);
    }
}
