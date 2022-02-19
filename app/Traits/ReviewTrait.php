<?php
namespace App\Traits;

use App\Models\Product;
use App\Models\Review;

trait ReviewTrait {

    public function calculateRatingAverage($productId){
        $product = Product::find($productId);
        $one = $two = $three = $four = $five = 0;

        foreach ($product->reviews as $review){
            if($review->star == 1) $one++;
            if($review->star == 2) $two++;
            if($review->star == 3) $three++;
            if($review->star == 4) $four++;
            if($review->star == 5) $five++;
        }
        $starTotal = ($one + $two + $three + $four + $five);
        if($starTotal == 0){
            return 0;
        }
        $average = (($one * 1) + ($two * 2) + ($three * 3) + ($four * 4) + ($five * 5)) / ($one + $two + $three + $four + $five);
        return number_format($average, 2);
    }

    public function getProductReviewCounts($productId){

        $reviews = Review::where('product_id', $productId)->pluck('star')->countBy();

        $total = $reviews->sum();

        $sum = $reviews->map(function ($d, $key) use ($reviews) {
            return $key * $d;
        })->sum();

        return [
            1 => $reviews[1] ?? 0,
            2 => $reviews[2] ?? 0,
            3 => $reviews[3] ?? 0,
            4 => $reviews[4] ?? 0,
            5 => $reviews[5] ?? 0,
            'total' => $total,
            'average' => number_format($total == 0 ? 0 : $sum / $total, 2),
        ];
    }

}
