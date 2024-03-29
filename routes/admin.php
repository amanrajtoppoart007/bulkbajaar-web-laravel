<?php
use Illuminate\Support\Facades\Route;

Route::get('/home', 'Admin\HomeController@index')->name('home');
    Route::get('/dashboard', 'Admin\HomeController@index')->name('dashboard');
    // Permissions
    Route::delete('permissions/destroy', 'Admin\PermissionsController@massDestroy')->name('permissions.massDestroy');
    Route::resource('permissions', 'Admin\PermissionsController');

    // Roles
    Route::delete('roles/destroy', 'Admin\RolesController@massDestroy')->name('roles.massDestroy');
    Route::resource('roles', 'Admin\RolesController');

    // Users
    Route::delete('users/destroy', 'Admin\UsersController@massDestroy')->name('users.massDestroy');
    Route::post('users/mass-approve', 'Admin\UsersController@massApprove')->name('users.massApprove');
    Route::post('users/parse-csv-import', 'Admin\UsersController@parseCsvImport')->name('users.parseCsvImport');
    Route::post('users/process-csv-import', 'Admin\UsersController@processCsvImport')->name('users.processCsvImport');
    Route::post('users/approve/{user}', 'Admin\UsersController@approve')->name('users.approve');
    Route::resource('users', 'Admin\UsersController');
    Route::post('users/change/approval/status', 'Admin\UsersController@changeApprovalStatus')->name('users.changeApprovalStatus');
    Route::post('users/change/verification/status', 'Admin\UsersController@changeVerificationStatus')->name('users.changeVerificationStatus');

    // Product Categories
    Route::delete('product-categories/destroy', 'Admin\ProductCategoryController@massDestroy')->name('product-categories.massDestroy');
    Route::post('product-categories/media', 'Admin\ProductCategoryController@storeMedia')->name('product-categories.storeMedia');
    Route::post('product-categories/ckmedia', 'Admin\ProductCategoryController@storeCKEditorImages')->name('product-categories.storeCKEditorImages');
    Route::resource('product-categories', 'Admin\ProductCategoryController');

    // Product Tags
    Route::delete('product-tags/destroy', 'Admin\ProductTagController@massDestroy')->name('product-tags.massDestroy');
    Route::resource('product-tags', 'Admin\ProductTagController');
    Route::get('get-product-tag', [App\Http\Controllers\Admin\ProductTagController::class, 'getProductTag'])->name('get.product-tag');
    Route::post('add-product-tag', [App\Http\Controllers\Admin\ProductTagController::class, 'addProductTag'])->name('product-tag.add');
    Route::post('update-product-tag', [App\Http\Controllers\Admin\ProductTagController::class, 'updateProductTag'])->name('product-tag.update');

    // Products
    Route::delete('products/destroy', 'Admin\ProductController@massDestroy')->name('products.massDestroy');
    Route::post('products/media', 'Admin\ProductController@storeMedia')->name('products.storeMedia');
    Route::post('products/ckmedia', 'Admin\ProductController@storeCKEditorImages')->name('products.storeCKEditorImages');
    Route::post('products/parse-csv-import', 'Admin\ProductController@parseCsvImport')->name('products.parseCsvImport');
    Route::post('products/process-csv-import', 'Admin\ProductController@processCsvImport')->name('products.processCsvImport');
    Route::post('products/mass-approve', 'Admin\ProductController@massApprove')->name('products.massApprove');
    Route::post('products/approve/{product}', 'Admin\ProductController@approve')->name('products.approve');
    Route::resource('products', 'Admin\ProductController');
    Route::post('products/update', 'Admin\ProductController@update')->name('products.update');
    Route::post('products/update-portal-charge', 'Admin\ProductController@updatePortalCharge')->name('products.update-portal-charge');

    Route::resource('productOptions','Admin\ProductOptionController');
    Route::get('product/option/create/{productId}', [App\Http\Controllers\Admin\ProductOptionController::class,'create'])->name('productOptions.create');
    Route::get('product/option/list/{id}', [App\Http\Controllers\Admin\ProductOptionController::class,'index'])->name('productOptions.list');
    Route::post('product/option/remove/file', [App\Http\Controllers\Admin\ProductOptionController::class,'removeMedia'])->name('productOptions.remove.files');

// User Alerts
    Route::delete('user-alerts/destroy', 'Admin\UserAlertsController@massDestroy')->name('user-alerts.massDestroy');
    Route::resource('user-alerts', 'Admin\UserAlertsController', ['except' => ['edit', 'update']]);
    Route::get('get-user-alert', [App\Http\Controllers\Admin\UserAlertsController::class, 'getUserAlert'])->name('get.user-alert');
    Route::post('add-user-alert', [App\Http\Controllers\Admin\UserAlertsController::class, 'addUserAlert'])->name('user-alert.add');
    Route::post('update-user-alert', [App\Http\Controllers\Admin\UserAlertsController::class, 'updateUserAlert'])->name('user-alert.update');

    // Content Categories
    Route::delete('content-categories/destroy', 'Admin\ContentCategoryController@massDestroy')->name('content-categories.massDestroy');
    Route::resource('content-categories', 'Admin\ContentCategoryController');
    Route::get('get-content-category', [App\Http\Controllers\Admin\ContentCategoryController::class, 'getCategory'])->name('get.content-category');
    Route::post('add-content-category', [App\Http\Controllers\Admin\ContentCategoryController::class, 'addCategory'])->name('content-category.add');
    Route::post('update-content-category', [App\Http\Controllers\Admin\ContentCategoryController::class, 'updateCategory'])->name('content-category.update');

    // Enquiries
    Route::delete('enquiries/destroy', 'Admin\EnquiryController@massDestroy')->name('enquiries.massDestroy');
    Route::resource('enquiries', 'Admin\EnquiryController');

    // Content Tags
    Route::delete('content-tags/destroy', 'Admin\ContentTagController@massDestroy')->name('content-tags.massDestroy');
    Route::resource('content-tags', 'Admin\ContentTagController');
    Route::get('get-content-tag', [App\Http\Controllers\Admin\ContentTagController::class, 'getTag'])->name('get.content-tag');
    Route::post('add-content-tag', [App\Http\Controllers\Admin\ContentTagController::class, 'addTag'])->name('content-tag.add');
    Route::post('update-content-tag', [App\Http\Controllers\Admin\ContentTagController::class, 'updateTag'])->name('content-tag.update');

    // Content Pages
    Route::delete('content-pages/destroy', 'Admin\ContentPageController@massDestroy')->name('content-pages.massDestroy');
    Route::post('content-pages/media', 'Admin\ContentPageController@storeMedia')->name('content-pages.storeMedia');
    Route::post('content-pages/ckmedia', 'Admin\ContentPageController@storeCKEditorImages')->name('content-pages.storeCKEditorImages');
    Route::resource('content-pages', 'Admin\ContentPageController');

    // Faq Categories
    Route::delete('faq-categories/destroy', 'Admin\FaqCategoryController@massDestroy')->name('faq-categories.massDestroy');
    Route::resource('faq-categories', 'Admin\FaqCategoryController');
    Route::get('get-faq-category', [App\Http\Controllers\Admin\FaqCategoryController::class, 'getCategory'])->name('get.faq-category');
    Route::post('add-faq-category', [App\Http\Controllers\Admin\FaqCategoryController::class, 'addCategory'])->name('faq-category.add');
    Route::post('update-faq-category', [App\Http\Controllers\Admin\FaqCategoryController::class, 'updateCategory'])->name('faq-category.update');

    // Faq Questions
    Route::delete('faq-questions/destroy', 'Admin\FaqQuestionController@massDestroy')->name('faq-questions.massDestroy');
    Route::post('faq-questions/parse-csv-import', 'Admin\FaqQuestionController@parseCsvImport')->name('faq-questions.parseCsvImport');
    Route::post('faq-questions/process-csv-import', 'Admin\FaqQuestionController@processCsvImport')->name('faq-questions.processCsvImport');
    Route::resource('faq-questions', 'Admin\FaqQuestionController');

    // Audit Logs
    Route::resource('audit-logs', 'Admin\AuditLogsController', ['except' => ['create', 'store', 'edit', 'update', 'destroy']]);

    // Orders
    Route::delete('orders/destroy', 'Admin\OrderController@massDestroy')->name('orders.massDestroy');
    Route::post('orders/parse-csv-import', 'Admin\OrderController@parseCsvImport')->name('orders.parseCsvImport');
    Route::post('orders/process-csv-import', 'Admin\OrderController@processCsvImport')->name('orders.processCsvImport');
    Route::resource('orders', 'Admin\OrderController');
    Route::post('orders/cancel', 'Admin\OrderController@cancelOrder')->name('orders.cancel');
    Route::post('orders/verify-payment', 'Admin\OrderController@verifyPayment')->name('orders.verify.payment');
    Route::post('orders/generate-invoice', 'Admin\OrderController@generateInvoice')->name('orders.generate.invoice');
    Route::post('orders/update-status', 'Admin\OrderController@updateStatus')->name('orders.update.status');
    Route::post('orders/update-stock', 'Admin\OrderController@updateStock')->name('orders.update.stock');
    Route::post('orders/refund', 'Admin\OrderController@refund')->name('orders.refund');

// Carts
    Route::delete('carts/destroy', 'Admin\CartController@massDestroy')->name('carts.massDestroy');
    Route::post('carts/parse-csv-import', 'Admin\CartController@parseCsvImport')->name('carts.parseCsvImport');
    Route::post('carts/process-csv-import', 'Admin\CartController@processCsvImport')->name('carts.processCsvImport');
    Route::resource('carts', 'Admin\CartController');

    // Vendors
    Route::delete('vendors/destroy', 'Admin\VendorController@massDestroy')->name('vendors.massDestroy');
    Route::post('vendors/mass-approve', 'Admin\VendorController@massApprove')->name('vendors.massApprove');
    Route::post('vendors/parse-csv-import', 'Admin\VendorController@parseCsvImport')->name('vendors.parseCsvImport');
    Route::post('vendors/process-csv-import', 'Admin\VendorController@processCsvImport')->name('vendors.processCsvImport');
    Route::post('vendors/approve/{vendor}', 'Admin\VendorController@approve')->name('vendors.approve');
    Route::post('vendors/media', 'Admin\VendorController@storeMedia')->name('vendors.storeMedia');
    Route::resource('vendors', 'Admin\VendorController');

    // Pincodes
    Route::delete('pincodes/destroy', 'Admin\PincodeController@massDestroy')->name('pincodes.massDestroy');
    Route::post('pincodes/parse-csv-import', 'Admin\PincodeController@parseCsvImport')->name('pincodes.parseCsvImport');
    Route::post('pincodes/process-csv-import', 'Admin\PincodeController@processCsvImport')->name('pincodes.processCsvImport');
    Route::resource('pincodes', 'Admin\PincodeController');
    Route::get('get-pincode', [App\Http\Controllers\Admin\PincodeController::class, 'getPincode'])->name('get.pincode');
    Route::post('add-pincode', [App\Http\Controllers\Admin\PincodeController::class, 'addPincode'])->name('pincode.add');
    Route::post('update-pincode', [App\Http\Controllers\Admin\PincodeController::class, 'updatePincode'])->name('pincode.update');

    // States
    Route::delete('states/destroy', 'Admin\StateController@massDestroy')->name('states.massDestroy');
    Route::post('states/parse-csv-import', 'Admin\StateController@parseCsvImport')->name('states.parseCsvImport');
    Route::post('states/process-csv-import', 'Admin\StateController@processCsvImport')->name('states.processCsvImport');
    Route::resource('states', 'Admin\StateController');
    Route::get('get-state', [App\Http\Controllers\Admin\StateController::class, 'getState'])->name('get.state');
    Route::post('add-state', [App\Http\Controllers\Admin\StateController::class, 'addState'])->name('state.add');
    Route::post('update-state', [App\Http\Controllers\Admin\StateController::class, 'updateState'])->name('state.update');

    // Districts
    Route::delete('districts/destroy', 'Admin\DistrictController@massDestroy')->name('districts.massDestroy');
    Route::post('districts/parse-csv-import', 'Admin\DistrictController@parseCsvImport')->name('districts.parseCsvImport');
    Route::post('districts/process-csv-import', 'Admin\DistrictController@processCsvImport')->name('districts.processCsvImport');
    Route::resource('districts', 'Admin\DistrictController');
    Route::get('get-district', [App\Http\Controllers\Admin\DistrictController::class, 'getDistrict'])->name('get.district');
    Route::post('add-district', [App\Http\Controllers\Admin\DistrictController::class, 'addDistrict'])->name('district.add');
    Route::post('update-district', [App\Http\Controllers\Admin\DistrictController::class, 'updateDistrict'])->name('district.update');

    // Blocks
    Route::delete('blocks/destroy', 'Admin\BlockController@massDestroy')->name('blocks.massDestroy');
    Route::post('blocks/parse-csv-import', 'Admin\BlockController@parseCsvImport')->name('blocks.parseCsvImport');
    Route::post('blocks/process-csv-import', 'Admin\BlockController@processCsvImport')->name('blocks.processCsvImport');
    Route::resource('blocks', 'Admin\BlockController');
    Route::get('get-block', [App\Http\Controllers\Admin\BlockController::class, 'getBlock'])->name('get.block');
    Route::post('add-block', [App\Http\Controllers\Admin\BlockController::class, 'addBlock'])->name('block.add');
    Route::post('update-block', [App\Http\Controllers\Admin\BlockController::class, 'updateBlock'])->name('block.update');

    // Areas
    Route::delete('areas/destroy', 'Admin\AreaController@massDestroy')->name('areas.massDestroy');
    Route::post('areas/parse-csv-import', 'Admin\AreaController@parseCsvImport')->name('areas.parseCsvImport');
    Route::post('areas/process-csv-import', 'Admin\AreaController@processCsvImport')->name('areas.processCsvImport');
    Route::resource('areas', 'Admin\AreaController');
    Route::get('get-area', [App\Http\Controllers\Admin\AreaController::class, 'getArea'])->name('get.area');
    Route::post('add-area', [App\Http\Controllers\Admin\AreaController::class, 'addArea'])->name('area.add');
    Route::post('update-area', [App\Http\Controllers\Admin\AreaController::class, 'updateArea'])->name('area.update');

    // Brands
    Route::delete('brands/destroy', 'Admin\BrandController@massDestroy')->name('brands.massDestroy');
    Route::post('brands/parse-csv-import', 'Admin\BrandController@parseCsvImport')->name('brands.parseCsvImport');
    Route::post('brands/process-csv-import', 'Admin\BrandController@processCsvImport')->name('brands.processCsvImport');
    Route::resource('brands', 'Admin\BrandController');
    Route::get('get-brand', [App\Http\Controllers\Admin\BrandController::class, 'getBrand'])->name('brands.getBrand');

    Route::post('brands/media', [App\Http\Controllers\Admin\BrandController::class, 'storeMedia'])->name('brands.storeMedia');



    // Logistics
    Route::delete('logistics/destroy', 'Admin\LogisticsController@massDestroy')->name('logistics.massDestroy');
    Route::post('logistics/parse-csv-import', 'Admin\LogisticsController@parseCsvImport')->name('logistics.parseCsvImport');
    Route::post('logistics/process-csv-import', 'Admin\LogisticsController@processCsvImport')->name('logistics.processCsvImport');
    Route::resource('logistics', 'Admin\LogisticsController');

    // Transactions
    Route::delete('transactions/destroy', 'Admin\TransactionsController@massDestroy')->name('transactions.massDestroy');
    Route::resource('transactions', 'Admin\TransactionsController');

    // User Addresses
    Route::delete('user-addresses/destroy', 'Admin\UserAddressController@massDestroy')->name('user-addresses.massDestroy');
    Route::post('user-addresses/parse-csv-import', 'Admin\UserAddressController@parseCsvImport')->name('user-addresses.parseCsvImport');
    Route::post('user-addresses/process-csv-import', 'Admin\UserAddressController@processCsvImport')->name('user-addresses.processCsvImport');
    Route::resource('user-addresses', 'Admin\UserAddressController');

    // Settings
    Route::delete('settings/destroy', 'Admin\SettingsController@massDestroy')->name('settings.massDestroy');
    Route::post('settings/parse-csv-import', 'Admin\SettingsController@parseCsvImport')->name('settings.parseCsvImport');
    Route::post('settings/process-csv-import', 'Admin\SettingsController@processCsvImport')->name('settings.processCsvImport');
    Route::resource('settings', 'Admin\SettingsController');

    // Admins
    Route::delete('admins/destroy', 'Admin\AdminController@massDestroy')->name('admins.massDestroy');
    Route::post('admins/parse-csv-import', 'Admin\AdminController@parseCsvImport')->name('admins.parseCsvImport');
    Route::post('admins/process-csv-import', 'Admin\AdminController@processCsvImport')->name('admins.processCsvImport');
    Route::resource('admins', 'Admin\AdminController');

    // Cities
    Route::delete('cities/destroy', 'Admin\CityController@massDestroy')->name('cities.massDestroy');
    Route::post('cities/parse-csv-import', 'Admin\CityController@parseCsvImport')->name('cities.parseCsvImport');
    Route::post('cities/process-csv-import', 'Admin\CityController@processCsvImport')->name('cities.processCsvImport');
    Route::resource('cities', 'Admin\CityController');
    Route::get('get-city', [App\Http\Controllers\Admin\CityController::class, 'getCity'])->name('get.city');
    Route::post('add-city', [App\Http\Controllers\Admin\CityController::class, 'addCity'])->name('city.add');
    Route::post('update-city', [App\Http\Controllers\Admin\CityController::class, 'updateCity'])->name('city.update');




// User Profiles
    Route::delete('user-profiles/destroy', 'Admin\UserProfileController@massDestroy')->name('user-profiles.massDestroy');
    Route::post('user-profiles/media', 'Admin\UserProfileController@storeMedia')->name('user-profiles.storeMedia');
    Route::post('user-profiles/ckmedia', 'Admin\UserProfileController@storeCKEditorImages')->name('user-profiles.storeCKEditorImages');
    Route::resource('user-profiles', 'Admin\UserProfileController');

    // Crops
    Route::delete('crops/destroy', 'Admin\CropController@massDestroy')->name('crops.massDestroy');
    Route::post('crops/media', 'Admin\CropController@storeMedia')->name('crops.storeMedia');
    Route::post('crops/ckmedia', 'Admin\CropController@storeCKEditorImages')->name('crops.storeCKEditorImages');
    Route::resource('crops', 'Admin\CropController');



    Route::get('global-search', 'Admin\GlobalSearchController@search')->name('globalSearch');
    Route::get('user-alerts/read', 'Admin\UserAlertsController@read');

    //Unit

    Route::get('unit', [App\Http\Controllers\Admin\UnitController::class, 'index'])->name('unit.index');
    Route::get('get-unit/{id}', [App\Http\Controllers\Admin\UnitController::class, 'show'])->name('get.unit');
    Route::post('get-units', [App\Http\Controllers\Admin\UnitController::class, 'getUnits'])->name('get.units');
    Route::post('add-unit', [App\Http\Controllers\Admin\UnitController::class, 'store'])->name('unit.add');
    Route::post('update-unit', [App\Http\Controllers\Admin\UnitController::class, 'update'])->name('unit.update');
    Route::delete('unit/destroy', [App\Http\Controllers\Admin\UnitController::class, 'massDestroy'])->name('unit.massDestroy');
    Route::delete('unit/destroy/{unit}', [App\Http\Controllers\Admin\UnitController::class, 'destroy'])->name('unit.destroy');

    //unitTypes

    Route::get('unit-types', [App\Http\Controllers\Admin\UnitTypeController::class, 'index'])->name('unit-types.index');
    Route::get('get-unit-type', [App\Http\Controllers\Admin\UnitTypeController::class, 'getUnitType'])->name('get.unit-type');
    Route::post('add-unit-type', [App\Http\Controllers\Admin\UnitTypeController::class, 'addUnitType'])->name('unit-type.add');
    Route::post('update-unit-type', [App\Http\Controllers\Admin\UnitTypeController::class, 'updateUnitType'])->name('unit-type.update');
    Route::delete('unit-types/destroy', [App\Http\Controllers\Admin\UnitTypeController::class, 'massDestroy'])->name('unit-types.massDestroy');
    Route::delete('unit-types/destroy/{unitType}', [App\Http\Controllers\Admin\UnitTypeController::class, 'destroy'])->name('unit-types.destroy');

    Route::get('get-districts-by-state', [App\Http\Controllers\Admin\DistrictController::class, 'getDistrictsByState'])->name('get.districts.by.state');
    Route::get('get-blocks-by-district', [App\Http\Controllers\Admin\BlockController::class, 'getBlockByDistrict'])->name('get.blocks.by.district');
    Route::get('get-pincodes-and-areas-by-block', [App\Http\Controllers\Admin\PincodeController::class, 'getPincodesAndAreasByBlock'])->name('get.pincodes.and.areas.by.block');

    // Product Categories
    Route::delete('product-sub-categories/destroy', 'Admin\ProductSubCategoryController@massDestroy')->name('product-sub-categories.massDestroy');
    Route::post('product-sub-categories/media', 'Admin\ProductSubCategoryController@storeMedia')->name('product-sub-categories.storeMedia');
    Route::post('product-sub-categories/ckmedia', 'Admin\ProductSubCategoryController@storeCKEditorImages')->name('product-sub-categories.storeCKEditorImages');
    Route::resource('product-sub-categories', 'Admin\ProductSubCategoryController');



    //SLIDERS
    Route::resource('sliders', 'Admin\SliderController');
    Route::post('sliders/media', 'Admin\SliderController@storeMedia')->name('sliders.storeMedia');

    Route::get('change-password', [App\Http\Controllers\Admin\ChangePasswordController::class, 'showChangePasswordForm'])->name('show.change.password.form');
    Route::post('change-password', [App\Http\Controllers\Admin\ChangePasswordController::class, 'changePassword'])->name('change.password');

    //SLIDERS
    Route::resource('site-setting', 'Admin\SiteSettingController');
    Route::post('site-setting/ckmedia', 'Admin\SiteSettingController@storeCKEditorImages')->name('site-setting.storeCKEditorImages');

    //Push Notification
    Route::get('push-notifications', [App\Http\Controllers\Admin\PushNotificationController::class, 'index'])->name('push-notifications.index');
    Route::post('push-notifications/store', [App\Http\Controllers\Admin\PushNotificationController::class, 'store'])->name('push-notifications.store');
    Route::post('push-notifications/delete', [App\Http\Controllers\Admin\PushNotificationController::class, 'destroy'])->name('push-notifications.destroy');
    Route::delete('push-notifications/destroy', [App\Http\Controllers\Admin\PushNotificationController::class, 'massDestroy'])->name('push-notifications.massDestroy');
    Route::post('push-notifications/media', 'Admin\PushNotificationController@storeMedia')->name('push-notifications.storeMedia');
    Route::post('push-notifications/send', [App\Http\Controllers\Admin\PushNotificationController::class, 'send'])->name('push-notifications.send');




    //BILLS AND STOCK
    Route::resource('bills', 'Admin\BillController');
    Route::resource('master-stocks', 'Admin\MasterStockController');
    Route::post('master-stocks/update-stock', 'Admin\MasterStockController@updateStock')->name('master-stocks.update.stock');

    Route::get('shiprocket-settings', [App\Http\Controllers\Admin\ShipRocketController::class, 'index'])->name('shiprocket.settings.index');
    Route::post('shiprocket-settings/save', [App\Http\Controllers\Admin\ShipRocketController::class, 'save'])->name('shiprocket.settings.save');

    // Product Return Conditions
    Route::delete('product-return-conditions/destroy', 'Admin\ProductReturnConditionController@massDestroy')->name('product-return-conditions.massDestroy');
    Route::resource('product-return-conditions', 'Admin\ProductReturnConditionController');
    Route::get('get-product-return-condition', [App\Http\Controllers\Admin\ProductReturnConditionController::class, 'getCondition'])->name('get.product-return-conditions');
    Route::post('add-product-return-condition', [App\Http\Controllers\Admin\ProductReturnConditionController::class, 'store'])->name('product-return-conditions.add');
    Route::post('update-product-return-condition', [App\Http\Controllers\Admin\ProductReturnConditionController::class, 'update'])->name('product-return-conditions.update');


Route::group(['prefix' => 'report'], function () {
    Route::get('profit', [App\Http\Controllers\Admin\Report\ProfitController::class, 'index'])->name('report.profit');
});
