<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class CheckIfVendorDocumentsAreUploaded
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if(!is_null(auth()->user()->profile)){
            if (auth()->user()->profile->pan_card && auth()->user()->profile->gst) {
                return $next($request);
            }
        }
        return redirect()->route('vendor.register.step-two');
    }
}
