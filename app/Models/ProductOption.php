<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;

class ProductOption extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'product_id',
        'option',
        'unit',
        'quantity',
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $hidden = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    public function product(): BelongsTo
    {
        return $this->belongsTo(Product::class);
    }
}
