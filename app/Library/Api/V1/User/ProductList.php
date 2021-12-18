<?php


namespace App\Library\Api\V1\User;


use App\Models\Product;
use App\Traits\ProductTrait;
use App\Traits\ReviewTrait;

class ProductList
{
    use ReviewTrait, ProductTrait;

    public $products;

    public function __construct($products)
    {
        $this->products = $products;
    }

    public function execute()
    {
        $data = [];
        if (!empty($this->products)) {
            $i = 0;
            foreach ($this->products as $product) {
                $data[$i]['id'] = $product['id'];
                $data[$i]['name'] = $product['name'];
                $data[$i]['price'] = applyPrice($product['price'], $product['discount']);
                $data[$i]['mop'] = getMinimumOrderAmount($product['vendor_id']);
                $data[$i]['moq'] = $product['moq'];
                $data[$i]['sku'] = $product['sku'];
                $data[$i]['hsn'] = $product['hsn'];
                $data[$i]['vendor_id'] = $product['vendor_id'];
                $data[$i]['discount'] = $product['discount'];
                $data[$i]['discounted_price'] = $product['price'];
                $data[$i]['quantity'] = $product['quantity'];
                $data[$i]['description'] = $product['description'];
                $data[$i]['category'] = $product['product_category']['name'] ?? null;
                $data[$i]['sub_category'] = $product['product_sub_category']['name'] ?? null;
                $data[$i]['vendor'] = $product['vendor']['name'] ?? null;
                if (isset($product['images'][0]['thumbnail'])) {
                    $data[$i]['thumb_link'] = $product['images'][0]['thumbnail'] ? $product['images'][0]['thumbnail'] : null;
                } else {
                    $data[$i]['thumb_link'] = null;
                }
                $i++;
            }
        }
        return $data;
    }
}

