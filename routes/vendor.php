<?php

Route::middleware([ \App\Http\Middleware\CheckIfVendorDocumentsAreUploaded::class, \App\Http\Middleware\RedirectIfVendorAccountNotActivated::class,])->group(function () {
    Route::get('/', 'Vendor\HomeController@index')->name("dashboard");
    Route::resource('orders', 'Vendor\OrderController');
    Route::post('cancel-order', [\App\Http\Controllers\Vendor\OrderController::class, 'cancelOrder'])->name('orders.cancel');
    Route::post('confirm-order', [\App\Http\Controllers\Vendor\OrderController::class, 'confirmOrder'])->name('orders.confirm');
    Route::post('/orders/update-status', [\App\Http\Controllers\Vendor\OrderController::class, 'updateStatus'])->name('orders.update-status');
    Route::get('orders/ship/{order:order_number}', [\App\Http\Controllers\Vendor\OrderController::class, 'showShipForm'])->name('orders.show.ship-form');
    Route::post('orders/ship/{order}', [\App\Http\Controllers\Vendor\OrderController::class, 'ship'])->name('orders.ship');
    Route::get('profile', 'Vendor\HomeController@showProfileForm')->name('profile');
    Route::get('shipment/pickkr/pickup-address', 'Vendor\HomeController@showPickkrPickupAddressForm')->name('shipment.pickkr.pickup-address');
    Route::post('profile/update', 'Vendor\HomeController@updateProfile')->name('update.profile');
    Route::get('change-password', 'Vendor\HomeController@showChangePasswordForm')->name('show.change.password.form');
    Route::post('change-password', 'Vendor\HomeController@changePassword')->name('change.password');
    Route::resource('products', 'Vendor\ProductController');
    Route::post('products/media', 'Vendor\ProductController@storeMedia')->name('products.storeMedia');
    Route::post('products/update', 'Vendor\ProductController@update')->name('products.update');

    Route::get('bank-account', 'Vendor\HomeController@showBankAccountForm')->name('bank-account');
    Route::post('bank-account/update', 'Vendor\HomeController@updateBankAccount')->name('update.bank-account');
    Route::get('mop', 'Vendor\HomeController@showMOPForm')->name('mop');
    Route::post('mop/update', 'Vendor\HomeController@updateMOP')->name('update.mop');
});




Route::get('/upload-documents', 'Vendor\HomeController@showDocumentsUploadForm')->name("show.upload.documents.form");
Route::post('/upload-documents', 'Vendor\HomeController@uploadDocuments')->name("upload.documents");

Route::get('/address-details', [\App\Http\Controllers\Auth\VendorRegistrationController::class, 'showRegistrationFormStepTwo'])->name("register.step-two");
Route::post('/store/step-two', [\App\Http\Controllers\Auth\VendorRegistrationController::class, 'storeStepTwo'])->name("register.step-two.store");
Route::get('/document-details', [\App\Http\Controllers\Auth\VendorRegistrationController::class, 'showRegistrationFormStepThree'])->name("register.step-three");
Route::post('/store/step-three', [\App\Http\Controllers\Auth\VendorRegistrationController::class, 'storeStepThree'])->name("register.step-three.store");
