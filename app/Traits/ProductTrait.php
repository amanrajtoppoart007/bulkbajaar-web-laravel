<?php

namespace App\Traits;
use App\Models\MasterStock;
use App\Models\Product;
use App\Models\ProductStock;
use App\Models\Wishlist;

trait ProductTrait
{

    public function checkProductStock($productId, $pincode = null, $area = null)
    {
        $query = ProductStock::query();
        return $query->whereProductId($productId)->sum('quantity');
    }

    public function checkProductPriceStock($productPriceId, $pincode = null, $web = false, $area = null)
    {
        $query = ProductStock::query();
        return $query->whereProductPriceId($productPriceId)
            ->sum('quantity');
    }

    public function getLowestPrice($productId)
    {
        return Product::find($productId)->productPrices()->orderBy('price', 'asc')->first();
    }

    public function checkIfProductLiked($productId)
    {
        return Wishlist::whereProductId($productId)->whereUserId(auth('sanctum')->id())->exists();
    }

    public function checkIfProductOptionLiked($productOptionId)
    {
        return Wishlist::whereProductOptionId($productOptionId)->whereUserId(auth('sanctum')->id())->exists();
    }

    public static function checkMasterStock($productPriceId){
        return MasterStock::whereProductPriceId($productPriceId)->sum('stock');
    }

    public static function checkMasterStockWithFranchisee($productPriceId, $franchiseeId){
        $masterStock = MasterStock::whereProductPriceId($productPriceId)->sum('stock');
        $franchiseeStock = ProductStock::whereProductPriceId($productPriceId)->whereFranchiseeId($franchiseeId)->sum('quantity');
        return $masterStock + $franchiseeStock;
    }

    public static function checkFranchiseeStock($productPriceId, $franchiseeId){
        return ProductStock::whereProductPriceId($productPriceId)->whereFranchiseeId($franchiseeId)->sum('quantity');
    }
}
