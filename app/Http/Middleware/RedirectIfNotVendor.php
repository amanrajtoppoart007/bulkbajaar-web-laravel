<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RedirectIfNotVendor
{
    /**
     * @param Request $request
     * @param Closure $next
     * @param string $guard
     * @return mixed
     */
    public function handle(Request $request, Closure $next, string $guard = 'vendor'): mixed
    {
        if (!Auth::guard($guard)->check())
        {
            return redirect()->route('vendor.login');
        }

        return $next($request);
    }
}
