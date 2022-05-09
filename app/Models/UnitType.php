<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UnitType extends Model
{
    use HasFactory;

    /**
     * @var array|string[]
     */
    public static array $defaultUnits = ['PCS','LENGTH','WEIGHT','VOLUME'];

    public function units()
    {
        return $this->hasMany(Unit::class,'unit_type','name');
    }
}
