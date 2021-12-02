<?php

function applyPrice($amount, $percentage = null, $discount = 0){
    if (is_null($percentage)) $percentage = getPortalChargePercentage();
    $total = ($amount + ($amount * $percentage / 100));
    if ($discount > 0){
        $total = $total - ($amount * $discount / 100);
    }
    return $total;
}

//To get portal charge applied to each product
function getPortalChargePercentage(){
    return 5;
}
