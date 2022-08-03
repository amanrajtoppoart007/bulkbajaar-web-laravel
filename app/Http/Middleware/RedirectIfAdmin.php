<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RedirectIfAdmin
{
    /**
     * @param Request $request
     * @param Closure $next
     * @param string $guard
     * @return \Illuminate\Http\RedirectResponse|mixed
     */
    public function handle(Request $request, Closure $next, string $guard = 'admin')
    {
         if (Auth::guard($guard)->check())
        {
            return redirect()->route('admin.dashboard');
        }
        return $next($request);
    }
}
