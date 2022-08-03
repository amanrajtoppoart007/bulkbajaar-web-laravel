<?php

namespace Database\Seeders;

use App\Models\Admin;
use Illuminate\Database\Seeder;

class AdminsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $admins = [
            [
                'id'                 => 1,
                'name'               => 'Admin',
                'email'              => 'admin@bulkbajaar.com',
                'password'           => bcrypt('password'),
                'remember_token'     => null,
                'approved'           => 1,
                'verified'           => 1,
                'verified_at'        => date("Y-m-d H:i:s"),
                'verification_token' => '',
                'mobile'             => '0123456789',
            ],
            [
                'id'                 => 2,
                'name'               => 'Demo',
                'email'              => 'demo@bulkbajaar.com',
                'password'           => bcrypt('password'),
                'remember_token'     => null,
                'approved'           => 1,
                'verified'           => 1,
                'verified_at'        => date("Y-m-d H:i:s"),
                'verification_token' => '',
                'mobile'             => '0123456788',
            ],
        ];

        Admin::insert($admins);
    }
}
