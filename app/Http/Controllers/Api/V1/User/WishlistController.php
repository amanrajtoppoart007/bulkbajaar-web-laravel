<?php


namespace App\Http\Controllers\Api\V1\User;


use App\Models\Wishlist;
use App\Traits\ProductTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use \App\Http\Controllers\Api\BaseController as BaseController;
class WishlistController extends BaseController
{
    use ProductTrait;
    public function addToWishlist(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required|exists:products,id',
            'product_option_id' => 'required|exists:product_options,id',
        ]);

        if ($validator->fails()) {
            $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => $validator->errors()];
            return response()->json($result, 200);
        }

        $isExists = Wishlist::where('product_option_id', $request->product_option_id)->where('user_id', auth()->id())->exists();
        if ($isExists){
            $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'Product is already in cart'];
            return response()->json($result, 200);
        }

        try {
            $wishlist = new Wishlist();
            $wishlist->product_id = $request->input('product_id');
            $wishlist->product_option_id = $request->input('product_option_id');
            $wishlist->user_id = auth()->user()->id;

            if ($wishlist->save()) {
                $result = ['status' => 1, 'response' => 'success', 'action' => 'added', 'message' => 'Product added to wishlist successfully'];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'Something went wrong'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function removeFromWishlist(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required|exists:wishlists',
            'product_option_id' => 'required|exists:wishlists',
        ]);

        if ($validator->fails()) {
            $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => $validator->errors()];
            return response()->json($result, 200);
        }

        try {
            if (Wishlist::where('product_option_id', $request->product_option_id)->where('user_id', auth()->id())->delete()){
                $result = ['status' => 1, 'response' => 'success', 'action' => 'removed', 'message' => 'Product removed from wishlist successfully'];
            }else{
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'Something went wrong'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function getWishlists()
    {
        try {
            $data = [];
            $wishlists = Wishlist::where('user_id', auth()->id())->with(['product', 'productOption'])->get();
            foreach ($wishlists as $wishlist) {
                $product = $wishlist->product;
                $data[] = [
                    'id' => $wishlist->id,
                    'product_id' => $wishlist->product_id,
                    'product' => $product->name ?? '',
                    'product_option_id' => $wishlist->product_price_id,
                    'product_option' => [
                        'id' => $wishlist->productOption->id ?? null,
                        'product_id' => $wishlist->productOption->product_id ?? null,
                        'option' => $wishlist->productOption->option ?? null,
                        'unit' => $wishlist->productOption->unit ?? null,
                        'size' => $wishlist->productOption->size ?? null,
                        'color' => $wishlist->productOption->color ?? null,
                        'quantity' => $wishlist->productOption->quantity ?? null,
                    ],
                    'price' => applyPrice($product->price, $product->discount),
                    'gst' => $product->gst,
                    'gst_type' => $product->gst_type,
                    'discount' => $product->discount,
                    'discounted_amount' => applyPrice($product->price, null, $product->discount),
                    'thumb_link' => isset($product->images[0]) ? $product->images[0]->thumbnail : null
                ];
            }

            if (count($data)) {
                $result = ['status' => 1, 'response' => 'success', 'action' => 'fetched', 'data' => $data, 'message' => 'Wishlist data fetched successfully'];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'Your wishlist is empty'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function removeAllFromWishlist(Request $request)
    {

        try {
            if (Wishlist::truncate()){
                $result = ['status' => 1, 'response' => 'success', 'action' => 'removed', 'message' => 'Product removed from wishlist successfully'];
            }else{
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'Something went wrong'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

}
