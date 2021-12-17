<?php


namespace App\Library\Api\V1\User;


use App\Models\Product;
use App\Traits\ProductTrait;
use App\Traits\ReviewTrait;

class VendorList
{
    public $vendors;

    public function __construct($vendors)
    {
        $this->vendors = $vendors;
    }

    public function execute()
    {
        $data = [];
        if (!empty($this->vendors)) {
            $i = 0;
            foreach ($this->vendors as $vendor) {
                $data[$i]['id'] = $vendor['id'];
                $data[$i]['name'] = $vendor['name'];
                $data[$i]['mop'] = getMinimumOrderAmount($vendor['id']);
                $data[$i]['district'] = $vendor['profile']['pickup_district']['name'] ?? '';
                $data[$i]['total_product'] = $vendor['products_count'];
                $i++;
            }
        }
        return $data;
    }
}

