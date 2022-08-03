<?php

namespace App\Http\Controllers\Api\V1\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\ChangePasswordRequest;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Mockery\Matcher\HasKey;

class AccountController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:api');
    }

    public function changePassword(ChangePasswordRequest $request)
    {

        try {
            $user = User::find(auth()->user()->id);
            $user->password = Hash::make($request->input('password'));
            $user->save();
            $result = ["status"=>1,"response"=>"success","message"=>"Password changed successfully"];

        }
        catch (\Exception $exception)
        {
            $result = ["status"=>0,"response"=>"exception_error","message"=>$exception->getMessage()];
        }

        return response()->json($result,200);

    }
}
