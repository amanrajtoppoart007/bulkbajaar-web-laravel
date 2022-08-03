<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ShipRocketSetting;
use Illuminate\Http\Request;

class ShipRocketController extends Controller
{
    public function index()
    {
        $shiprocket = ShipRocketSetting::first();
        return view('admin.shiprocketSettings.index', compact('shiprocket'));
    }

    public function save(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required|string',
        ]);

        $shiprocket = ShipRocketSetting::first();
        if (is_null($shiprocket)){
            $shiprocket = new ShipRocketSetting();
        }

        $shiprocket->email = $request->input('email');
        $shiprocket->password = $request->input('password');
        if($shiprocket->save()){
            return redirect()->back()->with('message', 'Setting saved.');
        }
        return back()->withInput()->withErrors();
    }
}
