<?php

namespace App\Models;

use App\Traits\Auditable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use \DateTimeInterface;

class VendorProfile extends Model implements HasMedia
{
    use SoftDeletes, InteractsWithMedia, Auditable, HasFactory;

    public $table = 'vendor_profiles';

    protected $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $appends = [
        'pan_card',
        'gst',
    ];

    const PAYMENT_METHOD_RADIO = [
        'CASH'   => 'Cash',
        'CHEQUE' => 'Cheque',
        'RTGS'   => 'RTGS',
        'DD'     => 'DD in Favour of Company',
        'ONLINE'     => 'Online',
    ];

    protected $fillable = [
        'vendor_id',
        'company_name',
        'representative_name',
        'email',
        'mobile',
        'gst_number',
        'pan_number',
        'billing_address',
        'billing_address_two',
        'billing_state_id',
        'billing_district_id',
        'billing_pincode',
        'pickup_address',
        'pickup_address_two',
        'pickup_state_id',
        'pickup_district_id',
        'bank_name',
        'account_number',
        'pickup_pincode',
        'account_holder_name',
        'ifsc_code',
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }

    public function registerMediaConversions(Media $media = null): void
    {
        $this->addMediaConversion('thumb')->fit('crop', 50, 50);
        $this->addMediaConversion('preview')->fit('crop', 120, 120);
    }

    public function franchisee()
    {
        return $this->belongsTo(Vendor::class, 'franchisee_id');
    }

    public function organization_state()
    {
        return $this->belongsTo(State::class, 'organization_state_id');
    }

    public function organization_district()
    {
        return $this->belongsTo(District::class, 'organization_district_id');
    }

    public function organization_city()
    {
        return $this->belongsTo(Block::class, 'organization_city_id', 'id');
    }

    public function representative_state()
    {
        return $this->belongsTo(State::class, 'representative_state_id');
    }

    public function representative_district()
    {
        return $this->belongsTo(District::class, 'representative_district_id');
    }

    public function representative_city()
    {
        return $this->belongsTo(Block::class, 'representative_city_id', 'id');
    }

    public function getImageAttribute()
    {
        $file = $this->getMedia('image')->last();

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
}
