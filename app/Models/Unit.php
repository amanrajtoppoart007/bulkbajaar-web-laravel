<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Unit extends Model
{
    use HasFactory;

    protected $fillable = ['unit','unit_type','status'];

    public function unit_types()
    {
        return $this->belongsTo(UnitType::class,'unit_type','name');
    }
}
