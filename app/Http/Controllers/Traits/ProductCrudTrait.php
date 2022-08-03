<?php

namespace App\Http\Controllers\Traits;

Trait ProductCrudTrait {

    public function storeProductOption()
    {

        foreach ($request->input('product_options') as $product_option){
                if (!in_array($product_option['color'], $colors)){
                    $colors[] = $product_option['color'];
                }
                if (!in_array($product_option['size'], $sizes)){
                    $sizes[] = $product_option['size'];
                }
                $i++;
            }

        $option =  $product->productOptions()->create([
                    'product_id' => $product->id,
                    'option' => $product_option['option'],
                    'color' => $product_option['color'],
                    'size' => $product_option['size'],
                    'unit' => $product_option['unit'],
                    'quantity' => $product_option['quantity'],
                ]);

        if($i==$request->input('default_image_index'))
                {
                    foreach ($request->input('images', []) as $file) {
                        $option->addMedia(storage_path('tmp/uploads/' . $file))->withCustomProperties([
                        'color'=>$product_option['color'],
                        'size'=>$product_option['size'],
                        'is_default'=>$isDefault,
                         'option_id'=>$option->id
                    ])->toMediaCollection('images');
                    }
                }

        $isDefault = $i==$request->input('default_image_index');


                $files = $request->file('product_options')[$i];
                foreach($files as $file)
                {
                    $path = $file->store('public');
                    if($path)
                    {
                        $option->addMediaFromDisk($path,'public')
                            ->withCustomProperties([
                                'color' => $product_option['color'],
                                'size' => $product_option['size'],
                                'is_default' => $isDefault,
                                 'option_id'=>$option->id
                            ])->toMediaCollection('images');
                    }

                }





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
    }
    public function updateProduct()
    {

    }
}
