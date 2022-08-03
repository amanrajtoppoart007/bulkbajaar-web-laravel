<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductReturnCondition extends Model
{
    use HasFactory;

    protected $hidden = ['pivot', 'created_at', 'updated_at'];

    protected $fillable = [
        'title',
        'active',
        'created_at',
        'updated_at'
    ];
}
