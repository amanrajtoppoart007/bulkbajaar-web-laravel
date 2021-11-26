<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Otp extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'vendor_id',
        'otp',
        'mobile',
        'sms_status',
        'v_token',
        'gateway_response',
        'is_expired',
        'created_at',
        'updated_at',
    ];
}
