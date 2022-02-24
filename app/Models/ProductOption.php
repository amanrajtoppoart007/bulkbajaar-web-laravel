<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class ProductOption extends Model implements HasMedia
{
    use HasFactory, SoftDeletes,InteractsWithMedia;

    protected $fillable = [
        'product_id',
        'option',
        'unit',
        'size',
        'color',
        'quantity',
        'is_default',
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $hidden = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $appends =[
        'images'
    ];

    public const SIZE_SELECT = [
        'XXL',
        'XL',
        'L',
        'M',
        'S',
        'XS',
    ];

    public const COLOR_SELECT = [
        'Green',
        'Blue',
        'Yellow',
        'Pink',
        'Black',
        'White',
        'RED',
        'CYAN',
        'GREY',
        'ORANGE',
        'SKYBLUE',
        'DARKBLUE',
        'LIGHTGREEN',
    ];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    /**
     * @throws \Spatie\Image\Exceptions\InvalidManipulation
     */
    public function registerMediaConversions(Media $media = null): void
    {
        $this->addMediaConversion('thumb')->fit('crop',80,80)->nonQueued();
        $this->addMediaConversion('preview')->fit('crop',200,200)->nonQueued();
    }

    public function getImagesAttribute()
    {
        $files = $this->getMedia('images');
        $files->each(function ($item) {
            $item->url       = $item->getUrl();
            $item->thumbnail = $item->getUrl('thumb');
            $item->preview   = $item->getUrl('preview');
        });
        return $files;
    }
}
