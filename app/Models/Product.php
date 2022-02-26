<?php

namespace App\Models;

use App\Traits\Auditable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use \DateTimeInterface;

class Product extends Model
{
    use SoftDeletes, Auditable, HasFactory;

    public $table = 'products';

    protected $appends = [
        'images',
        'image_list',
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

    public function tags()
    {
        return $this->belongsToMany(ProductTag::class);
    }

    public function getImagesAttribute()
    {
        $option = $this->productOptions()->where(['is_default'=>1])->first();
        if($option)
        {
            $files = $option->getMedia('images');
            $files->each(function ($item) {
                $item->url = $item->getUrl();
                $item->thumbnail = $item->getUrl('thumb');
                $item->preview = $item->getUrl('preview');
            });
            return $files;
        }
        return null;

    }

      public function getImageListAttribute()
    {
        $images = [];
        $options = $this->productOptions()->get();
            $i=0;
            foreach($options as $option)
            {
                $files = $option->getMedia('images');

                $image = [];
                foreach($files as $item)
                {
                     $image['url'] = $item->getUrl();
                     $image['thumbnail'] = $item->getUrl('thumb');
                     $image['preview']  = $item->getUrl('preview');
                     $image['color']    = $option->color;
                     $image['size']     = $option->size;
                     $image['option_id'] = $option->id;
                }
                if($image)
                {
                   $images[$i] = $image;
                   $i++;
                }
            }
            return (object)$images;

    }


    public function brand()
    {
        return $this->belongsTo(Brand::class, 'brand_id');
    }


    public function reviews()
    {
        return $this->hasMany(Review::class);
    }

    public function vendor()
    {
        return $this->belongsTo(Vendor::class);
    }

    public function productCategory()
    {
        return $this->belongsTo(ProductCategory::class);
    }

    public function productSubCategory()
    {
        return $this->belongsTo(ProductSubCategory::class);
    }

    public function productOptions()
    {
        return $this->hasMany(ProductOption::class);
    }

    public function orderItems()
    {
        return $this->hasMany(OrderItem::class);
    }

    public function productReturnConditions()
    {
        return $this->belongsToMany(ProductReturnCondition::class, 'product_product_return_condition');
    }
}
