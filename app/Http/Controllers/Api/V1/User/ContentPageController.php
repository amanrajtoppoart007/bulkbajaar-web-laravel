<?php

namespace App\Http\Controllers\Api\V1\User;

use App\Http\Controllers\Controller;
use App\Models\ContentPage;
use Exception;
use Illuminate\Http\Request;

class ContentPageController extends Controller
{
    public function getPageContent($page)
    {

        try {
            $title = match ($page) {
                "privacy-policy" => 'Privacy Policy',
                "terms-and-conditions" => 'Terms & Conditions',
                "about-us" => 'About Us',
                default => '',
            };
            $content = ContentPage::where('title', 'like', "%$title%")->first();
            if (!empty($content)) {
                $result = ['status' => 1, 'response' => 'success', 'data' => $content];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'data' => 'Content not found'];
            }
        } catch (Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'data' => $exception->getMessage()];
        }
        return response()->json($result);
    }
}
