<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    public function run()
    {
        $users = [
            [
                'id'                 => 1,
                'name'               => 'Buyer',
                'email'              => 'buyer@bulkbajaar.com',
                'password'           => bcrypt('password'),
                'remember_token'     => null,
                'approved'           => 1,
                'verified'           => 1,
                'verified_at'        => '2021-01-26 15:07:08',
                'verification_token' => '',
                'mobile'             => '1234567890',
                'referral_code'      => '',
            ],
        ];

        User::insert($users);
    }
}
