<?php

use App\Http\Controllers\Vendor\ProductOptionController;
use Illuminate\Support\Facades\Route;

Route::middleware([ App\Http\Middleware\CheckIfVendorDocumentsAreUploaded::class, App\Http\Middleware\RedirectIfVendorAccountNotActivated::class,])->group(function () {
    Route::get('/', 'Vendor\HomeController@index')->name("dashboard");
    Route::resource('orders', 'Vendor\OrderController');
    Route::post('cancel-order', [App\Http\Controllers\Vendor\OrderController::class, 'cancelOrder'])->name('orders.cancel');
    Route::post('confirm-order', [App\Http\Controllers\Vendor\OrderController::class, 'confirmOrder'])->name('orders.confirm');
    Route::post('/orders/update-status', [App\Http\Controllers\Vendor\OrderController::class, 'updateStatus'])->name('orders.update-status');
    Route::get('orders/ship/{order:order_number}', [App\Http\Controllers\Vendor\OrderController::class, 'showShipForm'])->name('orders.show.ship-form');
    Route::post('orders/ship/{order}', [App\Http\Controllers\Vendor\OrderController::class, 'ship'])->name('orders.ship');
    Route::get('profile', 'Vendor\HomeController@showProfileForm')->name('profile');
    Route::get('shipment/pickkr/pickup-address', 'Vendor\HomeController@showPickkrPickupAddressForm')->name('shipment.pickkr.pickup-address');
    Route::post('profile/update', 'Vendor\HomeController@updateProfile')->name('update.profile');
    Route::get('change-password', 'Vendor\HomeController@showChangePasswordForm')->name('show.change.password.form');
    Route::post('change-password', 'Vendor\HomeController@changePassword')->name('change.password');


    Route::resource('products', 'Vendor\ProductController');
    Route::post('products/media', 'Vendor\ProductController@storeMedia')->name('products.storeMedia');
    Route::post('products/update', 'Vendor\ProductController@update')->name('products.update');
    Route::delete('products/multiple/delete', 'Vendor\ProductController@massDestroy')->name('products.massDestroy');

    Route::resource('options','Vendor\ProductOptionController');
    Route::post('product/option/media', 'Vendor\ProductOptionController@storeMedia')->name('options.storeMedia');
    Route::get('product/option/create/{productId}', [ProductOptionController::class,'create'])->name('options.create');
    Route::get('product/option/list/{id}', [ProductOptionController::class,'index'])->name('options.list');
    Route::post('product/option/remove/file', [ProductOptionController::class,'removeMedia'])->name('options.remove.files');

    Route::get('bank-account', 'Vendor\HomeController@showBankAccountForm')->name('bank-account');
    Route::post('bank-account/update', 'Vendor\HomeController@updateBankAccount')->name('update.bank-account');
    Route::get('mop', 'Vendor\HomeController@showMOPForm')->name('mop');
    Route::post('mop/update', 'Vendor\HomeController@updateMOP')->name('update.mop');

    Route::get('unit', [App\Http\Controllers\Vendor\UnitController::class, 'index'])->name('unit.index');
    Route::get('get-unit/{id}', [App\Http\Controllers\Vendor\UnitController::class, 'show'])->name('get.unit');
    Route::post('get-units', [App\Http\Controllers\Vendor\UnitController::class, 'getUnits'])->name('get.units');
    Route::post('add-unit', [App\Http\Controllers\Vendor\UnitController::class, 'store'])->name('unit.add');
    Route::post('update-unit', [App\Http\Controllers\Vendor\UnitController::class, 'update'])->name('unit.update');
    Route::delete('unit/destroy', [App\Http\Controllers\Vendor\UnitController::class, 'massDestroy'])->name('unit.massDestroy');
    Route::delete('unit/destroy/{unit}', [App\Http\Controllers\Vendor\UnitController::class, 'destroy'])->name('unit.destroy');
});




Route::get('/upload-documents', 'Vendor\HomeController@showDocumentsUploadForm')->name("show.upload.documents.form");
Route::post('/upload-documents', 'Vendor\HomeController@uploadDocuments')->name("upload.documents");

Route::get('/address-details', [App\Http\Controllers\Auth\VendorRegistrationController::class, 'showRegistrationFormStepTwo'])->name("register.step-two");
Route::post('/store/step-two', [App\Http\Controllers\Auth\VendorRegistrationController::class, 'storeStepTwo'])->name("register.step-two.store");
Route::get('/document-details', [App\Http\Controllers\Auth\VendorRegistrationController::class, 'showRegistrationFormStepThree'])->name("register.step-three");
Route::post('/store/step-three', [App\Http\Controllers\Auth\VendorRegistrationController::class, 'storeStepThree'])->name("register.step-three.store");
