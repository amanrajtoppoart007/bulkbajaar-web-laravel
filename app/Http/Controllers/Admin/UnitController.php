<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Unit;
use App\Models\UnitType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Exception;
use Symfony\Component\HttpFoundation\Response;

class UnitController extends Controller
{
    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    public function index()
    {
        $units = Unit::all();
        $unitTypes = UnitType::$defaultUnits;
        return view('admin.unit.index',compact('units','unitTypes'));
    }


    public function getUnits(Request $request)
    {
        $validator = Validator::make($request->all(),['unit_type'=>'required']);

        if(!$validator->fails())
        {
            try {
                 $units = Unit::where(['unit_type'=>$request->input('unit_type')])->get();
                 if($units)
                 {
                   $result = ['status'=>1,'response'=>'success','data'=>$units,'message'=>'Units found'];
                 }
                 else{
                     $result = ['status'=>0,'response'=>'error','message'=>'Units not found'];
                 }
            }
            catch (Exception $exception)
            {
               $result = ['status'=>0,'response'=>'error','message'=>$exception->getMessage()];
            }
        }
        else
        {
             $result = ['status'=>0,'response'=>'validation_error','message'=>$validator->errors()->all()];
        }
        return response()->json($result);
    }



    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'unit'=>'string|required',
            'unit_type'=>'string|required',
        ]);
        if(!$validator->fails())
        {
            try {
                 Unit::create($validator->validated());
                 $result = ['status'=>1,'response'=>'success','message'=>'Unit Created successfully'];
            }
            catch (Exception $exception)
            {
               $result = ['status'=>0,'response'=>'error','message'=>$exception->getMessage()];
            }
        }
        else
        {
           $result = ['status'=>0,'response'=>'validation_error','message'=>$validator->errors()->all()];
        }

        return response()->json($result);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function show(Request $request,$id)
    {
        $request->request->add(['id'=>$id]);
        $validator = Validator::make($request->all(),[
            'id'=>'numeric|required',
        ]);
        if(!$validator->fails())
        {
            try {
                 $unit = Unit::find($id);
                 $result = ['status'=>1,'response'=>'success','data'=>$unit,'message'=>'Unit found'];
            }
            catch (Exception $exception)
            {
               $result = ['status'=>0,'response'=>'error','message'=>$exception->getMessage()];
            }
        }
        else
        {
           $result = ['status'=>0,'response'=>'validation_error','message'=>$validator->errors()->all()];
        }

        return response()->json($result);
    }



    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'id'=>'numeric|required',
            'unit'=>'string|required',
            'unit_type'=>'string|required',
        ]);
        if(!$validator->fails())
        {
            try {
                 $unit = Unit::find($request->input('id'));
                 $unit->update($validator->validated());
                 $result = ['status'=>1,'response'=>'success','message'=>'Unit updated successfully'];
            }
            catch (Exception $exception)
            {
               $result = ['status'=>1,'response'=>'error','message'=>$exception->getMessage()];
            }
        }
        else
        {
           $result = ['status'=>0,'response'=>'validation_error','message'=>$validator->errors()->all()];
        }

        return response()->json($result);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy(Request $request,$id)
    {
         $request->request->add(['id'=>$id]);
        $validator = Validator::make($request->all(),[
            'id'=>'numeric|required',
        ]);
        if(!$validator->fails())
        {
            try {
                 $unit = Unit::find($id);
                 $unit->delete();
                 $result = ['status'=>1,'response'=>'success','message'=>'Unit deleted successfully'];
            }
            catch (Exception $exception)
            {
               $result = ['status'=>0,'response'=>'error','message'=>$exception->getMessage()];
            }
        }
        else
        {
           $result = ['status'=>0,'response'=>'validation_error','message'=>$validator->errors()->all()];
        }

        return response()->json($result);
    }

     public function massDestroy(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'ids'   => 'required|array',
            'ids.*' => 'exists:unit_types,id',
        ]);

        if ($validator->fails()) {
            return array('status' => false, 'msg' => 'Please select!!');
        }
        Unit::whereIn('id', request('ids'))->delete();
        return response(null, Response::HTTP_NO_CONTENT);
    }
}
