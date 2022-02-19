<?php

namespace App\Library\Api\V1\User;

class BrandList
{
    public $brands;

    public function __construct($brands)
    {
        $this->brands = $brands;
    }

    public function execute()
    {
        $data = [];
        if (!empty($this->brands)) {
            $i = 0;
            foreach ($this->brands as $brand) {
                $data[$i]['id'] = $brand['id'];
                $data[$i]['title'] = $brand['title'];
                $i++;
            }
        }
        return $data;
    }
}
