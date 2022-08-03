<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use \DateTimeInterface;

class Transaction extends Model
{
    use SoftDeletes, HasFactory;

    public $table = 'transactions';

    protected $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    const STATUS_SELECT = [
        'completed' => 'Completed',
        'pending'   => 'Pending',
        'cancelled' => 'Cancelled',
        'Success' => 'Success',
    ];

    public const RAZORPAY_PAYMENT_STATUSES = [
        'created',
        'authorized',
        'captured',
        'refunded',
        'failed',
    ];

    protected $fillable = [
        'payment_id',
        'refund_id',
        'gateway',
        'entity',
        'amount',
        'status',
        'currency',
        'method',
        'meta_data',
        'order_group',
        'user_id',
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $attributes = [
        'gateway' => 'razorpay'
    ];

    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }

    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
