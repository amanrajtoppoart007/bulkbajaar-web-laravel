<?php

namespace Database\Seeders;

use App\Models\Role;
use Illuminate\Database\Seeder;

class RolesTableSeeder extends Seeder
{
    public function run()
    {
        $roles = [
            [
                'id'    => 1,
                'title' => 'Admin',
            ],
            [
                'id'    => 2,
                'title' => 'Vendor',
            ],
            [
                'id'    => 3,
                'title' => 'Logistics',
            ],
            [
                'id'    => 4,
                'title' => 'Moderator',
            ],
        ];

        Role::insert($roles);
    }
}
