<?php

namespace App\Http\Resources\Api;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{

    public function toArray($request): array
    {
        $profile = $this?->userProfile;
        return [
            'name' => $this?->name ?? '',
            'email' => $this?->email ?? '',
            'mobile' => $this?->mobile ?? '',
            'company_name' => $profile?->company_name ?? '',
            'representative_name' => $profile?->representative_name ?? '',
            'gst_number' => $profile?->gst_number ?? '',
            'pan_number' => $profile?->pan_number ?? '',
            'profile_photo' => $profile?->profile_photo?->getUrl(),
        ];
    }
}
