<?php
Route::get('test/sms/api','TestController');
Route::post('submit/enquiry/form','Guest\EnquiryController@store')->name('store.guest.enquiry');

Route::group(['prefix' => 'vendor'], function () {
    Route::get('login', 'Vendor\LoginController@index')->name("vendor.login");
    Route::post('login', 'Vendor\LoginController@login')->name("vendor.login.check");
    Route::post('logout', 'Vendor\LoginController@logout')->name("vendor.logout");
    Route::get('password/reset', 'Vendor\ForgotPasswordController@showLinkRequestForm')->name("vendor.password.request");
    Route::post('password/email', 'Vendor\ForgotPasswordController@sendResetLinkEmail')->name("vendor.password.email");
    Route::post('password/reset', 'Vendor\ResetPasswordController@reset')->name("vendor.password.update");
    Route::get('password/reset/{token}', 'Vendor\ResetPasswordController@showResetForm')->name("vendor.password.reset");
});
Route::group(['prefix' => 'logistics'], function () {
    Route::get('login', 'LogisticsAuth\LoginController@index')->name("logistics.login");
    Route::post('login', 'LogisticsAuth\LoginController@login')->name("logistics.login.check");
    Route::post('logout', 'LogisticsAuth\LoginController@logout')->name("logistics.logout");
    Route::get('password/reset', 'LogisticsAuth\ForgotPasswordController@showLinkRequestForm')->name("logistics.password.request");
    Route::post('password/email', 'LogisticsAuth\ForgotPasswordController@sendResetLinkEmail')->name("logistics.password.email");
    Route::post('password/reset', 'LogisticsAuth\ResetPasswordController@reset')->name("logistics.password.update");
    Route::get('password/reset/{token}', 'LogisticsAuth\ResetPasswordController@showResetForm')->name("logistics.password.reset");
});
Route::group(['prefix' => 'admin'], function () {
    Route::get('login', 'AdminAuth\LoginController@showLoginForm')->name('admin.login');
    Route::post('login', 'AdminAuth\LoginController@login')->name('admin.login.check');
    Route::post('logout', 'AdminAuth\LoginController@logout')->name('admin.logout');
    Route::get('password/reset', 'AdminAuth\ForgotPasswordController@showLinkRequestForm')->name("admin.password.request");
    Route::post('password/email', 'AdminAuth\ForgotPasswordController@sendResetLinkEmail')->name("admin.password.email");
    Route::post('password/reset', 'AdminAuth\ResetPasswordController@reset')->name("admin.password.update");
    Route::get('password/reset/{token}', 'AdminAuth\ResetPasswordController@showResetForm')->name("admin.password.reset");
});

Route::prefix('ajax')->group(function(){
   Route::post('get/states', 'Ajax\RegionController@getDistricts')->name('ajax.district.list');
   Route::post('get/blocks', 'Ajax\RegionController@getBlockList')->name('ajax.block.list');
   Route::post('get/pincodes', 'Ajax\RegionController@getPincodeList')->name('ajax.pincode.list');
   Route::post('get/areas', 'Ajax\RegionController@getAreaList')->name('ajax.area.list');
   Route::get('get-pincodes-and-areas-by-block', [\App\Http\Controllers\Ajax\RegionController::class, 'getPincodesAndAreasByBlock'])->name('ajax.pincodes.and.areas.list');
   Route::get('products-search-select2', [\App\Http\Controllers\Ajax\ProductController::class, 'productSearchSelect2'])->name('ajax.products.search.select2');
   Route::get('product-price-by-product', [\App\Http\Controllers\Ajax\ProductController::class, 'productPriceByProduct'])->name('ajax.products.price.by.product');
   Route::match(['get', 'post'], 'get/sub-categories', [\App\Http\Controllers\Ajax\ProductController::class, 'getProductSubCategories'])->name('ajax.products.sub-category.list');
});

Route::get('/', 'Guest\HomeController@index')->name('guest.home');
Route::get('/solution/{entity}', 'Guest\HomeController@solution')->name('solutions');
Route::get('/services', 'Guest\HomeController@services')->name('services');
Route::get('/career', 'Guest\HomeController@career')->name('career');
Route::get('/about', 'Guest\HomeController@about')->name('about');
Route::get('/contact', 'Guest\HomeController@contact')->name('contact');
Route::get('/privacy-policy', 'Guest\HomeController@privacy')->name('privacy');
Route::get('/terms-conditions', 'Guest\HomeController@terms')->name('terms');
Route::get('userVerification/{token}', 'UserVerificationController@approve')->name('userVerification');
Route::get('/web-view-terms-conditions', 'Guest\HomeController@webViewTerms');
Route::get('/web-view-about', 'Guest\HomeController@webViewAbout');
Route::get('/web-view-privacy-policy', 'Guest\HomeController@webViewPrivacyPolicy');
Auth::routes();


Route::prefix('registration')->group(function () {
     Route::get('/farmer', 'Auth\RegisterController@farmer')->name("farmer.register");
     Route::post('/farmer/store', 'Auth\RegisterController@storeFarmer')->name("store.farmer.register");
     Route::get('/vendor', 'Auth\RegisterController@vendor')->name("vendor.register");
     Route::post('upload/media', 'Auth\RegisterController@storeMedia')->name('registration.storeMedia');
     Route::post('/vendor/store', 'Auth\RegisterController@storeVendor')->name("store.vendor.register");

     Route::get('/message/{user}/{entity_id}/{token}', 'Auth\RegisterController@message')->name("registration.message");
});

Route::group(['prefix' => 'profile', 'as' => 'profile.', 'namespace' => 'Auth', 'middleware' => ['auth']], function () {
// Change password
    if (file_exists(app_path('Http/Controllers/Auth/ChangePasswordController.php'))) {
        Route::get('password', 'ChangePasswordController@edit')->name('password.edit');
        Route::post('password', 'ChangePasswordController@update')->name('password.update');
        Route::post('profile', 'ChangePasswordController@updateProfile')->name('password.updateProfile');
        Route::post('profile/destroy', 'ChangePasswordController@destroy')->name('password.destroyProfile');
    }
});

Route::middleware([\App\Http\Middleware\AuthCommonRouteMiddleware::class])->group(function (){
    Route::get('print-invoice/{invoiceNo}', 'InvoiceController@printInvoice')->name('orders.print.invoice');
});

Route::get('test',[\App\Http\Controllers\TestController::class,'test']);
