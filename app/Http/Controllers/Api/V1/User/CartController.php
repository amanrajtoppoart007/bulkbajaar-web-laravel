<?php


namespace App\Http\Controllers\Api\V1\User;

use App\Models\Cart;
use App\Models\Product;
use App\Traits\ProductTrait;
use Illuminate\Http\Request;
use Validator;

class CartController extends \App\Http\Controllers\Api\BaseController
{
    use ProductTrait;

    public function addToCart(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required|exists:products,id',
            'product_option_id' => 'nullable|exists:product_options,id',
            'quantity' => 'nullable|numeric',
        ]);

        if ($validator->fails()) {
            $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => $validator->errors()];
            return response()->json($result, 200);
        }

        if ($request->product_option_id){
            $isExists = Cart::where('product_option_id', $request->product_option_id)->where('user_id', auth()->id())->exists();
            if ($isExists){
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'Product is already in cart'];
                return response()->json($result, 200);
            }

        }else{
            $isExists = Cart::where('product_id', $request->product_id)->where('user_id', auth()->id())->exists();
            if ($isExists){
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'Product is already in cart'];
                return response()->json($result, 200);
            }
        }

        try {
            $product = Product::find($request->product_id);

            $quantity = $product->moq;
            if ($request->quantity && $request->quantity >= $product->moq){
                $quantity = $request->quantity;
            }

            Cart::create([
                'user_id' => auth()->id(),
                'product_id' => $product->id,
                'product_option_id' => $request->product_option_id,
                'quantity' => $quantity,
            ]);
            $result = ['status' => 1, 'response' => 'success', 'action' => 'added', 'message' => 'Product added to the cart successfully'];
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function getCarts()
    {
        try {
            $data = [];
            $carts = Cart::whereUserId(auth()->user()->id)->with(['product', 'productOption'])->get();
            foreach ($carts as $cart) {
                $product = $cart->product;
                $price = applyPrice($product->price, $product->discount);
                $discountedPrice = $product->price;
                $totalPrice = $discountedPrice * $cart->quantity;
                $data[] = [
                    'id' => $cart->id,
                    'product_id' => $cart->product_id,
                    'product' => $product->name,
                    'product_option_id' => $cart->product_option_id,
                    'product_option' => [
                        'option' => $cart->productOption->option ?? null,
                        'unit' => $cart->productOption->unit ?? null,
                        'quantity' => $cart->productOption->quantity ?? null,
                    ],
                    'quantity' => $cart->quantity,
                    'amount' => $price,
                    'discount' => $cart->product->discount ?? 0,
                    'discounted_amount' => $discountedPrice,
                    'total' => $totalPrice,
                    'thumb_link' => isset($product->images[0]) ? $product->images[0]->thumbnail : null
                ];
            }

            if (count($data)) {
                $result = ['status' => 1, 'response' => 'success', 'action' => 'fetched', 'data' => $data, 'message' => 'Cart data fetched successfully'];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'Your cart is empty'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);

    }

    public function updateCartQuantity(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'cart_id' => 'required|exists:carts,id',
            'quantity' => 'required|numeric',
        ]);

        if ($validator->fails()) {
            $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => $validator->errors()];
            return response()->json($result, 200);
        }

        try {
            $cart = Cart::find($request->cart_id)->load('product');
            if ($request->quantity < $cart->product->moq){
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'Quantity is less than minimum order quantity'];
            }else{
                $cart->quantity = $request->quantity;
                $cart->save();
                $result = ['status' => 1, 'response' => 'success', 'action' => 'updated', 'message' => 'Quantity updated successfully'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function removeFromCart(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'cart_id' => 'required|exists:carts,id',
        ]);

        if ($validator->fails()) {
            $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => $validator->errors()];
            return response()->json($result, 200);
        }

        try {
            if (Cart::destroy($request->input('cart_id'))) {
                $result = ['status' => 1, 'response' => 'success', 'action' => 'removed', 'message' => 'Product removed from cart successfully'];
            }else{
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'Something went wrong'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }
}
