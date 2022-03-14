<?php

namespace App\Http\Controllers\Api\V1\User;

use App\Http\Controllers\Controller;
use App\Http\Resources\Api\AddressResource;
use App\Http\Resources\Api\UserResource;
use App\Models\Cart;
use App\Models\User;
use App\Models\UserAddress;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CheckOutController extends Controller
{
    public function index(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'cart_ids' => 'nullable|array',
                'cart_ids.*' => "numeric"
            ]);
            if (!$validator->fails()) {
                $total = 0;
                $gst_total = 0;
                $shipping_charge = 0;

                $user = new UserResource(User::find(auth()->id()));
                $addresses = AddressResource::collection(UserAddress::where('user_id', auth()->id())->get());
                if ($request->input('cart_ids')) {
                    $carts = Cart::whereUserId(auth()->id())
                        ->whereIn('id', $request->input('cart_ids'))
                        ->with(['product', 'productOption'])->get();
                } else {
                    $carts = Cart::whereUserId(auth()->id())->with(['product', 'productOption'])->get();
                }
                foreach($carts as $cart)
                {
                    $product = $cart->product;
                    $cart_price = (float) $product->price* (float) $cart->quantity;
                    $total += $cart_price;
                    $gst_total += (float)(($cart_price *  $product?->gst ?? 0 )/100);
                }
                $grand_total = $total + $gst_total + $shipping_charge;

                $data = [
                    'user'=>$user,
                    'addresses'=>$addresses,
                    'checkout'=>[
                        'total'=>$total,
                        'gst_total'=>$gst_total,
                        'shipping_charge'=>$shipping_charge,
                        'grand_total'=>$grand_total,
                        'cart_count'=>$carts->count(),
                    ]
                ];
                  $result = ['status' => 1, 'response' => 'success','data'=>$data, 'message' => 'Data fetch successfully'];

            } else {
                $result = ['status' => 0, 'response' => 'validation_error', 'message' => $validator->errors()];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'exception_error', 'message' => $exception->getMessage()];
        }


        return response()->json($result);


    }
}
