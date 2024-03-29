<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Arr;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use \DateTimeInterface;

class UserProfile extends Model implements HasMedia
{
    use SoftDeletes, InteractsWithMedia, HasFactory;

    public $table = 'user_profiles';

    protected $appends = [
        'image',
        'gst',
        'pan_card',
        'gst_image',
        'pan_card_image',
        'profile_photo',
    ];

    protected $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];


    protected $fillable = [
        'user_id',
        'company_name',
        'representative_name',
        'email',
        'mobile',
        'pan_number',
        'gst_number',
        'created_at',
        'updated_at',
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


    public static function createProfile($array)
    {
        return UserProfile::create($array);
    }

    public  function updateProfile($array)
    {
        $without = Arr::except($array, ['crops']);
        $crops = ['crops'=>json_encode($array['crops'])];
        $update = array_merge($without,$crops);
        return $this->where(['user_id'=>$array['user_id']])->update($update);
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id','id');
    }

    public function getImageAttribute()
    {
        $file = $this->getMedia('profile_photo')->last();

        if ($file) {
            $file->url       = $file->getUrl();
            $file->thumbnail = $file->getUrl('thumb');
            $file->preview   = $file->getUrl('preview');
        }

        return $file;
    }



    public function getGstAttribute()
    {
        return $this->getMedia('gst')->last();
    }

    public function getPanCardAttribute()
    {
        return $this->getMedia('pan_card')->last();
    }

    public function getProfilePhotoAttribute()
    {
        return $this->getMedia('profile_photo')->last();
    }

    public function getGstImageAttribute()
    {
         $image =  $this->getMedia('gst_image')->last();
        if($image)
        {
            return $image->getFullUrl();
        }
        return null;
    }

    public function getPanCardImageAttribute()
    {
        $image = $this->getMedia('pan_card')->last();
        if($image)
        {
            return $image->getFullUrl();
        }
        return null;

    }
}
