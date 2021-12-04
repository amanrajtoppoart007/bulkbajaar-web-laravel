<?php

namespace App\Models;

use App\Traits\Auditable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use \DateTimeInterface;

class Order extends Model
{
    use SoftDeletes, Auditable, HasFactory;

    public $table = 'orders';

    const STATUS_SELECT_FOR_ADMIN = [
        'PENDING'    => 'Pending',
        'CONFIRMED'    => 'Confirmed',
        'REJECTED'    => 'Rejected',
        'SHIPPED'    => 'Shipped',
        'OUT_FOR_DELIVERED'    => 'Out For Delivered',
        'DELIVERED'    => 'Delivered',
        'RETURN_REQUESTED'    => 'Return - Requested',
        'RETURN_RECEIVED'    => 'Return - Received',
        'RETURN_REFUNDED'    => 'Return - Refunded',
    ];

    const STATUS_SELECT_FOR_VENDOR = [
        'PENDING'    => 'Pending',
        'CONFIRMED'    => 'Confirmed',
        'REJECTED'    => 'Rejected',
        'SHIPPED'    => 'Shipped',
        'OUT_FOR_DELIVERED'    => 'Out For Delivered',
        'DELIVERED'    => 'Delivered',
        'RETURN_RECEIVED'    => 'Return - Received',
    ];

    const STATUS_SELECT = [
        'PENDING'    => 'Pending',
        'CONFIRMED'    => 'Confirmed',
        'REJECTED'    => 'Rejected',
        'SHIPPED'    => 'Shipped',
        'OUT_FOR_DELIVERED'    => 'Out For Delivered',
        'DELIVERED'    => 'Delivered',
        'RETURN_REQUESTED'    => 'Return - Requested',
        'RETURN_RECEIVED'    => 'Return - Received',
        'RETURN_REFUNDED'    => 'Return - Refunded',
        'CANCELLED'    => 'Cancelled',
    ];

    public static $searchable = [
        'payment_type',
    ];

    protected $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    const PAYMENT_TYPE_SELECT = [
        'ONLINE' => 'Online',
        'COD'    => 'COD',
        'HALF'    => 'Up front 50 %',
    ];

    const PAYMENT_STATUS_SElECT = [
        'PENDING' => 'Pending',
        'PARTLY_PAID'    => 'Partly Paid',
        'PAID'    => 'Paid',
    ];

    protected $fillable = [
        'order_number',
        'order_group_number',
        'user_id',
        'payment_type',
        'billing_address_id',
        'shipping_address_id',
        'vendor_id',
        'sub_total',
        'discount_amount',
        'charge_percent',
        'charge_amount',
        'grand_total',
        'amount_paid',
        'payment_status',
        'status',
        'is_invoice_generated',
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $attributes = [
        'payment_status' => 'PENDING'
    ];

    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }

    public function transactions()
    {
        return $this->hasMany(Transaction::class, 'order_group', 'order_group_number');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function billingAddress()
    {
        return $this->belongsTo(UserAddress::class, 'billing_address_id');
    }

    public function shippingAddress()
    {
        return $this->belongsTo(UserAddress::class, 'shipping_address_id');
    }

    public function orderItems()
    {
        return $this->hasMany(OrderItem::class);
    }

    public function invoice()
    {
        return $this->morphOne(Invoice::class, 'invoiceable');
    }

    public function vendor()
    {
        return $this->belongsTo(Vendor::class, 'vendor_id');
    }
}
