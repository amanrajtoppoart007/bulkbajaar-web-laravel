<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class UnApprovedApi
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
        if (!auth()->user()->approved){
            $result = [
                'status' => 0,
                'response' => 'error',
                'action' => 'wait',
                'message' => 'Your account is currently under review. You will be notified in 24-48 hours.'
            ];
            return response()->json($result, 200);
        }
        return $next($request);
    }
}
