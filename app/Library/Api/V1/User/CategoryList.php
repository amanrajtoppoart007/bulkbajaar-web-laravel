<?php

namespace App\Library\Api\V1\User;

class CategoryList
{
    public $categories;

    public function __construct($categories)
    {
        $this->categories = $categories;
    }

    public function execute()
    {
        $data = [];
        if (!empty($this->categories)) {
            $i = 0;
            foreach ($this->categories as $category) {
                $data[$i]['id'] = $category['id'];
                $data[$i]['name'] = $category['name'];
                $data[$i]['description'] = $category['description'];
                if (isset($category['photo']['original_url'])) {
                    $data[$i]['thumb_link'] = $category['photo']['original_url'] ? $category['photo']['original_url'] : null;
                } else {
                    $data[$i]['thumb_link'] = null;
                }
                $i++;
            }
        }
        return $data;
    }
}
