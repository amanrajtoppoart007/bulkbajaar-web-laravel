<?php

namespace App\Models;

use App\Notifications\Franchisee\ResetPasswordNotification;
use App\Traits\Auditable;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\SoftDeletes;
use \DateTimeInterface;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class Vendor extends Authenticatable implements HasMedia
{
    use SoftDeletes, Notifiable, Auditable, HasFactory, HasApiTokens,InteractsWithMedia;

    const ROLE_SELECT = [
        'vendor' => "Vendor"
    ];

    const USER_TYPE_SELECT = [
        'MANUFACTURER' => 'Manufacturer',
        'WHOLESALER' => 'Wholesaler',
    ];

    const APPROVAL_STATUS_SELECT = [
        '1' => 'Approved',
        '0' => 'Un Approved',
    ];

    public $table = 'vendors';

    protected $hidden = [
        'remember_token',
        'password',
    ];


    protected $appends = [
        'shop_image',
    ];

    protected $dates = [
        'email_verified_at',
        'mobile_verified_at',
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $fillable = [
        'name',
        'email',
        'password',
        'mobile',
        'user_type',
        'email_verified_at',
        'mobile_verified_at',
        'verification_token',
        'mobile_verification_token',
        'remember_token',
        'created_at',
        'updated_at',
        'deleted_at',
        'approved',
        'verified',
    ];


    public function getShopImageAttribute()
    {
        $file = $this->getMedia('shopImage')->last();
        if ($file) {
            $file->url       = $file->getUrl();
            $file->thumbnail = $file->getUrl('thumb');
            $file->preview   = $file->getUrl('preview');
        }

        return $file;
    }


    public function roles()
    {
        return $this->belongsToMany(Role::class, 'role_vendor');
    }

    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }

    public function getEmailVerifiedAtAttribute($value)
    {
        return $value ? Carbon::createFromFormat('Y-m-d H:i:s', $value)->format(config('panel.date_format') . ' ' . config('panel.time_format')) : null;
    }

    public function setEmailVerifiedAtAttribute($value)
    {
        $this->attributes['email_verified_at'] = $value ? Carbon::createFromFormat(config('panel.date_format') . ' ' . config('panel.time_format'), $value)->format('Y-m-d H:i:s') : null;
    }

    public function getMobileVerifiedAtAttribute($value)
    {
        return $value ? Carbon::createFromFormat('Y-m-d H:i:s', $value)->format(config('panel.date_format') . ' ' . config('panel.time_format')) : null;
    }

    public function setMobileVerifiedAtAttribute($value)
    {
        $this->attributes['mobile_verified_at'] = $value ? Carbon::createFromFormat(config('panel.date_format') . ' ' . config('panel.time_format'), $value)->format('Y-m-d H:i:s') : null;
    }


    public function profile()
    {
        return $this->hasOne(VendorProfile::class);
    }

    public function sendPasswordResetNotification($token)
    {
        $this->notify(new ResetPasswordNotification($token));
    }

    public function products(): HasMany
    {
        return $this->hasMany(Product::class);
    }

    /**
     * @param Media|null $media
     * @throws \Spatie\Image\Exceptions\InvalidManipulation
     */
    public function registerMediaConversions(Media $media = null): void
    {
        $this->addMediaConversion('thumb')->fit('crop',50,50)->nonQueued();;
        $this->addMediaConversion('preview')->fit('crop', 120, 120)->nonQueued();;
    }

}
