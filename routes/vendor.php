<?php

Route::middleware([ \App\Http\Middleware\CheckIfVendorDocumentsAreUploaded::class,])->group(function () {
    Route::get('/', 'Vendor\HomeController@index')->name("dashboard");
    Route::resource('orders', 'Vendor\OrderController');
    Route::post('cancel-order', [\App\Http\Controllers\Vendor\OrderController::class, 'cancelOrder'])->name('orders.cancel');
    Route::get('profile', 'Vendor\HomeController@showProfileForm')->name('profile');
    Route::post('profile/update', 'Vendor\HomeController@updateProfile')->name('update.profile');
    Route::get('change-password', 'Vendor\HomeController@showChangePasswordForm')->name('show.change.password.form');
    Route::post('change-password', 'Vendor\HomeController@changePassword')->name('change.password');
    Route::resource('products', 'Vendor\ProductController');
    Route::post('products/media', 'Vendor\ProductController@storeMedia')->name('products.storeMedia');
    Route::post('products/update', 'Vendor\ProductController@update')->name('products.update');

    Route::get('bank-account', 'Vendor\HomeController@showBankAccountForm')->name('bank-account');
    Route::post('bank-account/update', 'Vendor\HomeController@updateBankAccount')->name('update.bank-account');
});

Route::get('/upload-documents', 'Vendor\HomeController@showDocumentsUploadForm')->name("show.upload.documents.form");
Route::post('/upload-documents', 'Vendor\HomeController@uploadDocuments')->name("upload.documents");
