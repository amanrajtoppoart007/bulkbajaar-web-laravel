<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use \DateTimeInterface;

class UserAddress extends Model
{
    use SoftDeletes, HasFactory;

    public $table = 'user_addresses';

    protected $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    const ADDRESS_TYPE_RADIO = [
        'SHIPPING' => 'Shipping',
        'BILLING' => 'Billing',
    ];

    protected $fillable = [
        'user_id',
        'name',
        'address',
        'address_line_two',
        'state_id',
        'district_id',
        'village',
        'address_type',
        'pincode',
        'is_default',
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }

    public function addressOrders()
    {
        return $this->hasMany(Order::class, 'address_id', 'id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function district()
    {
        return $this->belongsTo(District::class, 'district_id');
    }

    public function block()
    {
        return $this->belongsTo(Block::class, 'block_id');
    }

    public function state()
    {
        return $this->belongsTo(State::class, 'state_id');
    }

    public function area()
    {
        return $this->belongsTo(Area::class, 'area_id');
    }
}
