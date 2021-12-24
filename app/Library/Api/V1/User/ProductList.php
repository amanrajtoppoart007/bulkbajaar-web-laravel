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
                $data[$i]['threshold_price'] = getMinimumOrderAmount($product['vendor_id']);
                $data[$i]['threshold_quantity'] = $product['moq'];
                $data[$i]['sku'] = $product['sku'];
                $data[$i]['hsn'] = $product['hsn'];
                $data[$i]['is_returnable'] = (bool)$product['is_returnable'];
                $data[$i]['vendor_id'] = $product['vendor_id'];
                $data[$i]['discount'] = $product['discount'];
                $data[$i]['discounted_price'] = $product['price'];
                $data[$i]['quantity'] = $product['quantity'];
                $data[$i]['description'] = $product['description'];
                $data[$i]['category'] = $product['product_category']['name'] ?? null;
                $data[$i]['sub_category'] = $product['product_sub_category']['name'] ?? null;
                $data[$i]['vendor'] = $product['vendor']['name'] ?? null;
                $data[$i]['liked'] = $this->checkIfProductLiked($product['id']);
                $data[$i]['product_options'] = [];
                $data[$i]['product_attributes'] = $product['product_attributes'] ?? [];

                if (isset($product['product_options'])) {
                    foreach ($product['product_options'] as $productOption){
                        $data[$i]['product_options'][] = [
                            'id' => $productOption['id'],
                            'product_id' => $productOption['product_id'],
                            'option' => $productOption['option'],
                            'unit' => $productOption['unit'],
                            'quantity' => $productOption['quantity'],
                            'size' => $productOption['size'],
                            'color' => $productOption['color'],
                            'liked' => $this->checkIfProductOptionLiked($productOption['id']),
                        ];
                    }
                }

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

