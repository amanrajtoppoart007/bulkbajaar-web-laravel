<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\District;
use App\Models\State;
use Illuminate\Http\Request;

class RegionController extends Controller
{
    public function getStates(Request $request)
    {
        try {
            $query = State::query();
            if ($request->input('keyword')) {
                $query->where(function ($q) use ($request) {
                    $q->where('name', 'LIKE', "%".$request->input('keyword')."%");
                });
            }

            $states = $query->select('id', 'name')->whereStatus(true)->get()->toArray();
            if ($states) {
                $result = [
                    'status' => 1,
                    'response' => 'success',
                    'action' => 'fetched',
                    'data' => $states,
                    'message' => 'States fetched successfully'
                ];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'No state found'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function getDistricts(Request $request)
    {
        try {
            $query = District::query();
            if ($request->input('keyword')) {
                $query->where(function ($q) use ($request) {
                    $q->where('name', 'LIKE', "%".$request->input('keyword')."%");
                });
            }

            if ($request->input('state_id')) {
                $query->where('state_id', $request->input('state_id'));
            }

            $districts = $query->select('id', 'name')->whereStatus(true)->get()->toArray();
            if ($districts) {
                $result = [
                    'status' => 1,
                    'response' => 'success',
                    'action' => 'fetched',
                    'data' => $districts,
                    'message' => 'Districts fetched successfully'
                ];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'No District found'];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }
}
