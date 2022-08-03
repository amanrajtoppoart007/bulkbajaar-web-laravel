<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ProductReturnCondition;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class ProductReturnConditionController extends Controller
{
    public function index()
    {
        $conditions = ProductReturnCondition::get();
        return view('admin.productReturnConditions.index', compact('conditions'));
    }

    public function destroy(ProductReturnCondition $productReturnCondition)
    {
        $productReturnCondition->delete();

        return back();
    }

    public function massDestroy(Request $request)
    {
        ProductReturnCondition::whereIn('id', request('ids'))->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }

    public function getCondition(Request $request)
    {
        $condition = ProductReturnCondition::find($request->id);
        if ($condition) {
            $result = array('status' => true, 'msg' => 'COndition found.', 'data' => $condition);
        } else {
            $result = array('status' => false, 'msg' => 'Something went wrong!!');
        }
        return json_encode($result);
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255'
        ]);
        $condition = ProductReturnCondition::create([
            'title'=>$request->input('title'),
            'active'=>1
        ]);
        if($condition){
            $result = array('status'=> true, 'msg'=>'Return condition added successfully.');
        }else {
            $result = array('status'=>false, 'msg'=>'Something went wrong!!');
        }
        return json_encode($result);
    }

    public function update(Request $request)
    {
        $request->validate([
            'id' => 'required',
            'title' => 'required|string|max:255'
        ]);
        $condition = ProductReturnCondition::find($request->id)->update($request->only('title'));
        if($condition){
            $result = array('status'=> true, 'msg'=>'Return condition updated successfully.');
        }else {
            $result = array('status'=>false, 'msg'=>'Something went wrong!!');
        }
        return json_encode($result);
    }
}
