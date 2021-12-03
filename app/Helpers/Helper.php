<?php

function applyPrice($amount, $percentage = null, $discount = 0){
    if (is_null($percentage)) $percentage = getPortalChargePercentage();
    $total = ($amount + ($amount * $percentage / 100));
    if ($discount > 0){
        $total -= $total * $discount / 100;
    }
    return ceil($total);
}

//To get portal charge applied to each product
function getPortalChargePercentage(): float
{
    return 5;
}

function getPercentAmount($amount, $percent){
    return ($amount * $percent) / 100;
}

//To get minimum order amount set by vendor
function getMinimumOrderAmount($vendorId = null): float
{
    return rand(1, 50000000);
}

function getMaximumCodAllowed(): int
{
    return 50000;
}

function checkIfUserCanPlaceOrderWithCod($userId): bool
{
    return true;
}
