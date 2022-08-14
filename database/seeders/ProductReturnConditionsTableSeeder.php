<?php

namespace Database\Seeders;

use App\Models\ProductReturnCondition;
use Illuminate\Database\Seeder;

class ProductReturnConditionsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(): void
    {
        $conditions = [
          [
              "title"=>'Damaged Product',
              "active"=>1,
              "created_at"=>now(),
              "updated_at"=>now(),
          ],
            [
                "title"=>'Wrong Product',
                "active"=>1,
                "created_at"=>now(),
                "updated_at"=>now(),
            ],
            [
                "title"=>'Wrong size/fit or color',
                "active"=>1,
                "created_at"=>now(),
                "updated_at"=>now(),
            ],
        ];
        ProductReturnCondition::insert($conditions);
    }
}
