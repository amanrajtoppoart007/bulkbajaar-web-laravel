<?php

namespace App\Http\Middleware;

use App\Providers\RouteServiceProvider;
use Closure;
use Illuminate\Support\Facades\Auth;

class RedirectIfAuthenticated
{
    /**
     * @param $request
     * @param Closure $next
     * @param ...$guards
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector|mixed
     */
    public function handle($request, Closure $next, ...$guards)
    {
        $guards = empty($guards) ? [null] : $guards;

        foreach ($guards as $guard) {
            if (Auth::guard($guard)->check()) {
                if ($guard == 'vendor'){
                    return redirect(RouteServiceProvider::VENDOR_HOME);
                }
                if ($guard == 'admin'){
                    return redirect(RouteServiceProvider::ADMIN_HOME);
                }
                 if ($guard == 'logistics'){
                    return redirect(RouteServiceProvider::LOGISTICS_HOME);
                }
                return redirect(RouteServiceProvider::HOME);
            }
        }

        return $next($request);
    }
}
