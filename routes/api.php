<?php


use App\Http\Controllers\Api\V1\ProductController;
use App\Http\Controllers\Api\V1\RegionController;
use App\Http\Controllers\Api\V1\User\CartController;
use App\Http\Controllers\Api\V1\User\HomeController;
use App\Http\Controllers\Api\V1\User\OrderController;
use App\Http\Controllers\Api\V1\User\ProfileController;
use App\Http\Controllers\Api\V1\User\PushNotificationController;
use App\Http\Controllers\Api\V1\User\SliderController;
use App\Http\Controllers\Api\V1\User\VendorController;
use App\Http\Controllers\Api\V1\User\WishlistController;
use App\Http\Controllers\Api\V1\Vendor\AuthController;
use Illuminate\Support\Facades\Route;

Route::prefix('v1/user')->group(function (){
    Route::post('access_step_one', [\App\Http\Controllers\Api\V1\User\AuthController::class, 'access_step_one']);
    Route::post('access_step_two', [\App\Http\Controllers\Api\V1\User\AuthController::class, 'access_step_two']);

    Route::post('register/step-one/user-detail', [\App\Http\Controllers\Api\V1\User\AuthController::class, 'registrationStepOne']);
    Route::get('get-states', [ProfileController::class, 'getStates']);
    Route::get('get-districts', [ProfileController::class, 'getDistricts']);
    Route::get('get-blocks', [ProfileController::class, 'getBlocks']);
    Route::get('get-pincodes', [ProfileController::class, 'getPincodes']);
    Route::get('get-areas', [ProfileController::class, 'getAreas']);
    Route::get('get-address-types', [ProfileController::class, 'getAddressTypes']);
    Route::get('get-categories', [ProductController::class, 'getCategories']);
    Route::get('get-sub-categories', [ProductController::class, 'getSubCategories']);
    Route::get('get-brands', [HomeController::class, 'getBrands']);
    Route::get('get-products', [\App\Http\Controllers\Api\V1\User\ProductController::class, 'getProducts']);
    Route::get('get-sliders', [SliderController::class, 'getSliders']);
    Route::get('get-latest-products', [ProductController::class, 'getLatestProducts']);
    Route::get('get-top-rated-products', [ProductController::class, 'getTopRatedProducts']);
    Route::get('get-top-selling-products', [ProductController::class, 'getTopSellingProducts']);
    Route::post('get-product-details', [ProductController::class, 'getProductDetails']);
    Route::post('get-production-option-id',[ProductController::class,'getProductOptionId']);

    Route::get('get-vendors', [VendorController::class, 'getVendors']);
    Route::get('get-vendor-details', [VendorController::class, 'getVendorDetails']);

    Route::middleware('auth:sanctum')->group(function (){
        Route::post('register/step-two/user-address-detail', [\App\Http\Controllers\Api\V1\User\AuthController::class, 'registrationStepTwo']);
        Route::post('register/step-three/user-document-detail', [\App\Http\Controllers\Api\V1\User\AuthController::class, 'registrationStepThree']);

            Route::get('get-user', [ProfileController::class, 'getUser']);
            Route::post('update-document',[ProfileController::class,'updateDocument']);
            Route::post('get-profile-details', [ProfileController::class, 'getProfileDetails']);
            Route::post('update-profile', [ProfileController::class, 'updateProfile']);
            Route::post('add-address', [ProfileController::class, 'addAddress']);
            Route::post('update-address', [ProfileController::class, 'updateAddress']);
            Route::get('get-addresses', [ProfileController::class, 'getAddresses']);
            Route::post('make-default-address', [ProfileController::class, 'makeDefaultAddress']);
            Route::post('remove-address', [ProfileController::class, 'removeAddress']);
            Route::post('add-to-cart', [CartController::class, 'addToCart']);
            Route::get('get-carts', [CartController::class, 'getCarts']);
            Route::post('update-cart-quantity', [CartController::class, 'updateCartQuantity']);
            Route::post('remove-from-cart', [CartController::class, 'removeFromCart']);
            Route::post('place-order', [OrderController::class, 'placeOrder']);
            Route::post('make-payment', [OrderController::class, 'makePayment']);
            Route::get('get-orders', [OrderController::class, 'getOrders']);
            Route::get('get-order-details', [OrderController::class, 'getOrderDetails']);
            Route::get('get-order-group-details', [OrderController::class, 'getOrderGroupDetails']);
            Route::post('cancel-order', [OrderController::class, 'cancelOrder']);
            Route::post('return-order-items', [OrderController::class, 'returnOrderItems']);
            Route::post('write-review', [\App\Http\Controllers\Api\V1\User\ProductController::class, 'writeReview']);
            Route::post('add-to-wishlist', [WishlistController::class, 'addToWishlist']);
            Route::post('remove-from-wishlist', [WishlistController::class, 'removeFromWishlist']);
            Route::get('get-wishlists', [WishlistController::class, 'getWishlists']);
            Route::get('delete-all-wishlist-items', [WishlistController::class, 'removeAllFromWishlist']);
//        });
        Route::get('get-push-notifications', [PushNotificationController::class, 'getPushNotifications']);
        Route::get('get-push-notification', [PushNotificationController::class, 'getPushNotification']);
        Route::post('delete-push-notification', [PushNotificationController::class, 'deletePushNotification']);
    });
});


Route::group(['prefix' => 'v1', 'as' => 'api.', 'namespace' => 'Api\V1\Admin', 'middleware' => ['auth:sanctum']], function () {
    // Permissions
    Route::apiResource('permissions', 'PermissionsApiController');

    // Roles
    Route::apiResource('roles', 'RolesApiController');

    // Users
    Route::apiResource('users', 'UsersApiController');

    // Product Categories
    Route::post('product-categories/media', 'ProductCategoryApiController@storeMedia')->name('product-categories.storeMedia');
    Route::apiResource('product-categories', 'ProductCategoryApiController');

    // Product Tags
    Route::apiResource('product-tags', 'ProductTagApiController');

    // Products
    Route::post('products/media', 'ProductApiController@storeMedia')->name('products.storeMedia');
    Route::apiResource('products', 'ProductApiController');









    // Orders
    Route::apiResource('orders', 'OrderApiController');

    // Carts
    Route::apiResource('carts', 'CartApiController');

    // Vendors
    Route::apiResource('vendors', 'VendorApiController');



    // Pincodes
    Route::apiResource('pincodes', 'PincodeApiController');

    // States
    Route::apiResource('states', 'StateApiController');

    // Districts
    Route::apiResource('districts', 'DistrictApiController');



    // Blocks
    Route::apiResource('blocks', 'BlockApiController');

    // Areas
    Route::apiResource('areas', 'AreaApiController');

    // Brands
    Route::apiResource('brands', 'BrandApiController');



    // Logistics
    Route::apiResource('logistics', 'LogisticsApiController');

    // Transactions
    Route::apiResource('transactions', 'TransactionsApiController');

    // User Addresses
    Route::apiResource('user-addresses', 'UserAddressApiController');

    // Settings
    Route::apiResource('settings', 'SettingsApiController');

    // Admins
    Route::apiResource('admins', 'AdminApiController');

    // Cities
    Route::apiResource('cities', 'CityApiController');



    // User Profiles
    Route::post('user-profiles/media', 'UserProfileApiController@storeMedia')->name('user-profiles.storeMedia');
    Route::apiResource('user-profiles', 'UserProfileApiController');


});

Route::prefix('v1')->group(function (){
    Route::get('get-states', [RegionController::class, 'getStates']);
    Route::get('get-districts', [RegionController::class, 'getDistricts']);
    Route::get('get-categories', [ProductController::class, 'getCategories']);
    Route::get('get-sub-categories', [ProductController::class, 'getSubCategories']);

    Route::prefix('vendor')->group(function (){
        Route::post('registration_step_one', [AuthController::class, 'registrationStepOne']);
        Route::post('login_step_one', [AuthController::class, 'loginStepOne']);
        Route::post('login_step_two', [AuthController::class, 'loginStepTwo']);

        Route::middleware('auth:sanctum')->group(function (){
            Route::post('registration_step_two', [AuthController::class, 'registrationStepTwo']);
            Route::post('registration_step_three', [AuthController::class, 'registrationStepThree']);
            Route::post('registration_step_four', [AuthController::class, 'registrationStepFour']);
            Route::post('store-product', [\App\Http\Controllers\Api\V1\Vendor\ProductController::class, 'storeProduct']);
            Route::get('get-product', [\App\Http\Controllers\Api\V1\Vendor\ProductController::class, 'getProduct']);
            Route::post('update-product', [\App\Http\Controllers\Api\V1\Vendor\ProductController::class, 'updateProduct']);
            Route::get('get-products', [\App\Http\Controllers\Api\V1\Vendor\ProductController::class, 'getProducts']);
        });
    });
});
