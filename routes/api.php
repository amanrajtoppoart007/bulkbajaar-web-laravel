<?php


use Illuminate\Support\Facades\Route;

Route::prefix('v1')->group(function () {

    Route::get('get-states', [App\Http\Controllers\Api\V1\RegionController::class, 'getStates']);

    Route::get('get-districts', [App\Http\Controllers\Api\V1\RegionController::class, 'getDistricts']);

    Route::prefix('user')->group(function () {
         Route::get('get-page-content/{page}', [App\Http\Controllers\Api\V1\User\ContentPageController::class, 'getPageContent']);
        Route::post('access_step_one', [App\Http\Controllers\Api\V1\User\AuthController::class, 'access_step_one']);
        Route::post('access_step_two', [App\Http\Controllers\Api\V1\User\AuthController::class, 'access_step_two']);

        Route::post('register/step-one/user-detail', [App\Http\Controllers\Api\V1\User\AuthController::class, 'registrationStepOne']);
        Route::get('get-states', [App\Http\Controllers\Api\V1\User\ProfileController::class, 'getStates']);
        Route::get('get-districts', [App\Http\Controllers\Api\V1\User\ProfileController::class, 'getDistricts']);
        Route::get('get-blocks', [App\Http\Controllers\Api\V1\User\ProfileController::class, 'getBlocks']);
        Route::get('get-pincodes', [App\Http\Controllers\Api\V1\User\ProfileController::class, 'getPincodes']);
        Route::get('get-areas', [App\Http\Controllers\Api\V1\User\ProfileController::class, 'getAreas']);
        Route::get('get-address-types', [App\Http\Controllers\Api\V1\User\ProfileController::class, 'getAddressTypes']);
        Route::get('get-categories', [App\Http\Controllers\Api\V1\User\CategoryController::class, 'index']);
        Route::get('get-sub-categories', [App\Http\Controllers\Api\V1\User\ProductController::class, 'getSubCategories']);
        Route::get('get-brands', [App\Http\Controllers\Api\V1\User\HomeController::class, 'getBrands']);
        Route::get('get-products', [App\Http\Controllers\Api\V1\User\ProductController::class, 'getProducts']);
        Route::get('get-sliders', [App\Http\Controllers\Api\V1\User\SliderController::class, 'getSliders']);
        Route::get('get-latest-products', [App\Http\Controllers\Api\V1\User\ProductController::class, 'getLatestProducts']);
        Route::get('get-top-rated-products', [App\Http\Controllers\Api\V1\User\ProductController::class, 'getTopRatedProducts']);
        Route::get('get-top-selling-products', [App\Http\Controllers\Api\V1\User\ProductController::class, 'getTopSellingProducts']);
        Route::post('get-product-details', [App\Http\Controllers\Api\V1\User\ProductController::class, 'getProductDetails']);
        Route::post('get-product-option-id', [App\Http\Controllers\Api\V1\User\ProductController::class, 'getProductOptionId']);

        Route::get('get-vendors', [App\Http\Controllers\Api\V1\User\VendorController::class, 'getVendors']);
        Route::get('get-vendor-details', [App\Http\Controllers\Api\V1\User\VendorController::class, 'getVendorDetails']);


        Route::get('get-category-list', [App\Http\Controllers\Api\V1\User\CategoryController::class, 'index']);

        Route::middleware('auth:sanctum')->group(function () {
            Route::post('register/step-two/user-address-detail', [App\Http\Controllers\Api\V1\User\AuthController::class, 'registrationStepTwo']);
            Route::post('register/step-three/user-document-detail', [App\Http\Controllers\Api\V1\User\AuthController::class, 'registrationStepThree']);
            Route::post('change-password', [App\Http\Controllers\Api\V1\User\AccountController::class, 'changePassword']);

            Route::get('get-checkout-details', [App\Http\Controllers\Api\V1\User\CheckOutController::class, 'index']);

            Route::get('get-user', [App\Http\Controllers\Api\V1\User\ProfileController::class, 'getUser']);
            Route::post('update-document', [App\Http\Controllers\Api\V1\User\ProfileController::class, 'updateDocument']);
            Route::post('get-profile-details', [App\Http\Controllers\Api\V1\User\ProfileController::class, 'getProfileDetails']);
            Route::post('update-profile', [App\Http\Controllers\Api\V1\User\ProfileController::class, 'updateProfile']);
            Route::post('add-address', [App\Http\Controllers\Api\V1\User\ProfileController::class, 'addAddress']);
            Route::post('update-address', [App\Http\Controllers\Api\V1\User\ProfileController::class, 'updateAddress']);
            Route::get('get-addresses', [App\Http\Controllers\Api\V1\User\ProfileController::class, 'getAddresses']);
            Route::post('make-default-address', [App\Http\Controllers\Api\V1\User\ProfileController::class, 'makeDefaultAddress']);
            Route::post('remove-address', [App\Http\Controllers\Api\V1\User\ProfileController::class, 'removeAddress']);
            Route::post('add-to-cart', [App\Http\Controllers\Api\V1\User\CartController::class, 'addToCart']);
            Route::get('get-carts', [App\Http\Controllers\Api\V1\User\CartController::class, 'getCarts']);
            Route::post('update-cart-quantity', [App\Http\Controllers\Api\V1\User\CartController::class, 'updateCartQuantity']);
            Route::post('remove-from-cart', [App\Http\Controllers\Api\V1\User\CartController::class, 'removeFromCart']);
            Route::post('place-order', [App\Http\Controllers\Api\V1\User\OrderController::class, 'placeOrder']);
            Route::post('make-payment', [App\Http\Controllers\Api\V1\User\OrderController::class, 'makePayment']);
            Route::get('get-orders', [App\Http\Controllers\Api\V1\User\OrderController::class, 'getOrders']);
            Route::get('get-order-details', [App\Http\Controllers\Api\V1\User\OrderController::class, 'getOrderDetails']);
            Route::get('get-order-group-details', [App\Http\Controllers\Api\V1\User\OrderController::class, 'getOrderGroupDetails']);
            Route::post('cancel-order', [App\Http\Controllers\Api\V1\User\OrderController::class, 'cancelOrder']);
            Route::post('return-order-items', [App\Http\Controllers\Api\V1\User\OrderController::class, 'returnOrderItems']);
            Route::post('write-review', [App\Http\Controllers\Api\V1\User\ProductController::class, 'writeReview']);
            Route::post('add-to-wishlist', [App\Http\Controllers\Api\V1\User\WishlistController::class, 'addToWishlist']);
            Route::post('remove-from-wishlist', [App\Http\Controllers\Api\V1\User\WishlistController::class, 'removeFromWishlist']);
            Route::get('get-wishlists', [App\Http\Controllers\Api\V1\User\WishlistController::class, 'getWishlists']);
            Route::get('delete-all-wishlist-items', [App\Http\Controllers\Api\V1\User\WishlistController::class, 'removeAllFromWishlist']);
            Route::get('get-push-notifications', [App\Http\Controllers\Api\V1\User\PushNotificationController::class, 'getPushNotifications']);
            Route::get('get-push-notification', [App\Http\Controllers\Api\V1\User\PushNotificationController::class, 'getPushNotification']);
            Route::post('delete-push-notification', [App\Http\Controllers\Api\V1\User\PushNotificationController::class, 'deletePushNotification']);
        });
    });
    Route::prefix('vendor')->group(function () {
        Route::post('registration_step_one', [App\Http\Controllers\Api\V1\Vendor\AuthController::class, 'registrationStepOne']);
        Route::post('login_step_one', [App\Http\Controllers\Api\V1\Vendor\AuthController::class, 'loginStepOne']);
        Route::post('login_step_two', [App\Http\Controllers\Api\V1\Vendor\AuthController::class, 'loginStepTwo']);

        Route::middleware('auth:sanctum')->group(function () {
            Route::post('registration_step_two', [App\Http\Controllers\Api\V1\Vendor\AuthController::class, 'registrationStepTwo']);
            Route::post('registration_step_three', [App\Http\Controllers\Api\V1\Vendor\AuthController::class, 'registrationStepThree']);
            Route::post('registration_step_four', [App\Http\Controllers\Api\V1\Vendor\AuthController::class, 'registrationStepFour']);
            Route::post('store-product', [App\Http\Controllers\Api\V1\Vendor\ProductController::class, 'storeProduct']);
            Route::get('get-product', [App\Http\Controllers\Api\V1\Vendor\ProductController::class, 'getProduct']);
            Route::post('update-product', [App\Http\Controllers\Api\V1\Vendor\ProductController::class, 'updateProduct']);
            Route::get('get-products', [App\Http\Controllers\Api\V1\Vendor\ProductController::class, 'getProducts']);
        });
    });
});
