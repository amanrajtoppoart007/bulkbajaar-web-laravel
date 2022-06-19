<?php


namespace App\Http\Controllers\Api\V1\User;

use App\Http\Controllers\Api\BaseController;
use App\Http\Resources\Api\CartResource;
use App\Models\Cart;
use App\Models\Product;
use App\Models\ProductOption;
use App\Traits\ProductTrait;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CartController extends BaseController
{
    use ProductTrait;

    public function addToCart(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required|exists:products,id',
            'product_option_id' => 'required|exists:product_options,id',
            'quantity' => 'nullable|numeric',
        ]);

        if ($validator->fails()) {
            $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => $validator->errors()];
            return response()->json($result);
        }

        $isExists = Cart::where('product_option_id', $request->input('product_option_id'))->where('user_id', auth()->id())->exists();
        if ($isExists){
            $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'Product is already in cart'];
            return response()->json($result);
        }

        try {
            $product = Product::find($request->input('product_id'));
            $productOption = ProductOption::find($request->input('product_option_id'));



            $quantity = $product->moq;
            if ($request->input('quantity') && $request->input('quantity') >= $product->moq){
                $quantity = $request->input('quantity');
            }
             $weight = (float)$productOption->weight * (float)$quantity;
           $cart = Cart::create([
                'user_id' => auth()->id(),
                'product_id' => $product->id,
                'vendor_id'=>$product->vendor_id,
                'product_option_id' => $request->input('product_option_id'),
                'quantity' => $quantity,
                'weight'=>$weight
            ]);
            $result = ['status' => 1, 'response' => 'success', 'action' => 'added','data'=>$cart, 'message' => 'Product added to the cart successfully'];
        } catch (Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result);
    }

    public function getCarts(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'cart_ids' => 'nullable|array',
            'cart_ids.*' => "numeric"
        ]);

        if ($validator->fails()) {
            $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => $validator->errors()];
            return response()->json($result);
        }

        try {
            if ($request->input('cart_ids')){
                $carts = Cart::whereUserId(auth()->id())
                    ->whereIn('id', $request->input('cart_ids'))
                    ->with(['product', 'productOption'])->get();
            }else{
                $carts = Cart::whereUserId(auth()->id())->with(['product', 'productOption'])->get();
            }
                $data = CartResource::collection($carts);

            if (count($data)) {
                $result = ['status' => 1, 'response' => 'success', 'action' => 'fetched', 'data' => $data, 'message' => 'Cart data fetched successfully'];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'Your cart is empty'];
            }
        } catch (Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result);

    }

    public function updateCartQuantity(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'cart_id' => 'required|exists:carts,id',
            'quantity' => 'required|numeric',
        ]);

        if ($validator->fails()) {
            $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => $validator->errors()];
        }
        else
        {
            try {
                $cart = Cart::find($request->input('cart_id'))->load('product');
                if ($request->input('quantity') < $cart->product->moq) {
                    $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'Quantity is less than minimum order quantity'];
                } else {
                    $cart->quantity = $request->input('quantity');
                    $cart->save();
                    $result = ['status' => 1, 'response' => 'success', 'action' => 'updated', 'message' => 'Quantity updated successfully'];
                }
            } catch (Exception $exception) {
                $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
            }
        }
        return response()->json($result);
    }

    public function removeFromCart(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'cart_id' => 'required|exists:carts,id',
        ]);

        if ($validator->fails()) {
            $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => $validator->errors()];
            return response()->json($result);
        }

        try {
            if (Cart::destroy($request->input('cart_id'))) {
                $result = ['status' => 1, 'response' => 'success', 'action' => 'removed', 'message' => 'Product removed from cart successfully'];
            }else{
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'Something went wrong'];
            }
        } catch (Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result);
    }
}
