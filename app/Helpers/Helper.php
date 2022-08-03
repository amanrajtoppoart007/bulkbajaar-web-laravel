<?php

function applyPrice($amount, $percentage = 0){
    $total = $amount + getPercentAmount($amount, $percentage);
    return round($total, 2);
}

//To get portal charge applied to each product
function getPortalChargePercentage($productId = null)
{
    $charge = 5;
    if (!is_null($productId)){
        $charge = \App\Models\ProductPortalCharge::where('product_id', $productId)->first()->charge ?? null;
        if (is_null($charge)) $charge = 5;
    }
    return $charge;
}

function getPercentAmount($amount, $percent){
    return ($amount * $percent) / 100;
}

//To get minimum order amount set by vendor
function getMinimumOrderAmount($vendorId): float
{
    return \App\Models\VendorProfile::where('vendor_id', $vendorId)->first()->mop ?? 0;
}

function getMaximumCodAllowed(): int
{
    return 50000;
}

function checkIfUserCanPlaceOrderWithCod($userId): bool
{
    return true;
}

function getOrderNumbersByOrderGroup($orderGroup){
    return \App\Models\Order::where('order_group_number', $orderGroup)->pluck('order_number');
}


