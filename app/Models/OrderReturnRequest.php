<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

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

    public function orderItem(): BelongsTo
    {
        return $this->belongsTo(OrderItem::class);
    }

    public function order(): BelongsTo
    {
        return $this->belongsTo(Order::class);
    }

    public function product(): BelongsTo
    {
        return $this->belongsTo(Product::class);
    }

    public function productReturnCondition() : BelongsTo
    {
        return $this->belongsTo(ProductReturnCondition::class);
    }

    public function vendor(): BelongsTo
    {
        return $this->belongsTo(Vendor::class);
    }
}
