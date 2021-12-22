<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderReturnRequest extends Model
{
    use HasFactory;

    protected $fillable = [
        'order_id',
        'order_item_id',
        'product_id',
        'product_option_id',
        'product_return_condition_id',
        'quantity',
        'vendor_visibility',
        'vendor_id',
        'status',
        'comment',
        'created_at',
        'updated_at'
    ];

    public const STATUS_SELECT = [
        'PENDING' => 'Pending',
        'CANCELLED' => 'Cancelled',
        'REJECTED' => 'REJECTED',
        'ACCEPTED' => 'Accepted',
        'REFUND_INITIATED' => 'Refund Initiated',
        'REFUNDED' => 'Refunded',
    ];
}
