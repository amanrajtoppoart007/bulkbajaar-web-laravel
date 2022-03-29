<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    use HasFactory;

    protected $fillable = [
        'order_id',
        'order_number',
        'product_id',
        'product_option_id',
        'amount',
        'price',
        'mrp',
        'mrp_total',
        'quantity',
        'discount',
        'discount_amount',
        'charge_percent',
        'charge_amount',
        'gst',
        'gst_amount',
        'total_amount',
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $attributes = [
        'gst' => 18
    ];

    protected $guarded = [];

    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function productOption()
    {
        return $this->belongsTo(ProductOption::class);
    }
}
