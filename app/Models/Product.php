<?php

namespace App\Models;

use App\Traits\Auditable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use \DateTimeInterface;

class Product extends Model implements HasMedia
{
    use SoftDeletes, InteractsWithMedia, Auditable, HasFactory;

    public $table = 'products';

    protected $appends = [
        'images',
    ];

    protected $attributes = [
        'discount' => 0,
        'gst' => 18,
        'gst_type' => 'exclusive',
    ];

    protected $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $fillable = [
        'vendor_id',
        'name',
        'slug',
        'description',
        'price',
        'moq',
        'discount',
        'gst',
        'gst_type',
        'product_category_id',
        'product_sub_category_id',
        'dispatch_time',
        'rrp',
        'approval_status',
        'quantity',
        'sku',
        'hsn',
        'order_count',
        'brand_id',
        'is_returnable',
        'product_attributes',
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    public const APPROVAL_STATUS_SELECT = [
        'PENDING' => 'Pending',
        'APPROVED' => 'Approved',
        'REJECTED' => 'Reject',
    ];

    protected $casts = [
        'product_attributes' => 'json'
    ];


    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }

    public function registerMediaConversions(Media $media = null): void
    {
        $this->addMediaConversion('thumb');
        $this->addMediaConversion('preview');
    }

    public function tags()
    {
        return $this->belongsToMany(ProductTag::class);
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

    public function brand()
    {
        return $this->belongsTo(Brand::class, 'brand_id');
    }


    public function reviews()
    {
        return $this->hasMany(Review::class);
    }

    public function vendor(): BelongsTo
    {
        return $this->belongsTo(Vendor::class);
    }

    public function productCategory(): BelongsTo
    {
        return $this->belongsTo(ProductCategory::class);
    }

    public function productSubCategory(): BelongsTo
    {
        return $this->belongsTo(ProductSubCategory::class);
    }

    public function productOptions(): HasMany
    {
        return $this->hasMany(ProductOption::class);
    }

    public function orderItems() : HasMany
    {
        return $this->hasMany(OrderItem::class);
    }

    public function productReturnConditions(): BelongsToMany
    {
        return $this->belongsToMany(ProductReturnCondition::class, 'product_product_return_condition');
    }
}
