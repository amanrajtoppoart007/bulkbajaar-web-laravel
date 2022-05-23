<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Slider;
use Illuminate\Http\Request;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use Illuminate\Support\Facades\Validator;

class SliderController extends Controller
{
    use MediaUploadingTrait;

    public function index()
    {
        $sliders = Slider::all();
        return view('admin.sliders.index', compact('sliders'));
    }

    public function create()
    {
        return view('admin.sliders.create');
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'images.*' => 'required'
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withInput();
        }

        $slider = new Slider();
        $slider->name = $request->input('name');
        $slider->save();

        foreach ($request->input('images', []) as $file) {
            $slider->addMedia(storage_path('tmp/uploads/' . $file))->toMediaCollection('images');
        }
        return redirect()->route('admin.sliders.index');
    }

    public function show(Slider $slider)
    {
        return view('admin.sliders.show', compact('slider'));
    }

    public function edit($id)
    {
        $slider = Slider::find($id);
        return view('admin.sliders.edit', compact('slider'));
    }

    public function update(Request $request, $id)
    {
        $request->request->add(['id' => $id]);
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'images.*' => 'required'
        ]);
        if ($validator->fails()) {
            $result = ['status' => 0, 'response' => 'validation_error', 'message' => $validator->errors()->all()];
        } else {
            $slider = Slider::find($id);

            if ($slider) {
                if (count($slider->images) > 0) {
                    foreach ($slider->images as $media) {
                        if (!in_array($media->file_name, $request->input('images', []))) {
                            $media->delete();
                        }
                    }
                }

                $media = $slider->images->pluck('file_name')->toArray();

                foreach ($request->input('images', []) as $file) {
                    if (count($media) === 0 || !in_array($file, $media)) {
                        $slider->addMedia(storage_path('tmp/uploads/' . $file))->toMediaCollection('images');
                    }
                }
                $result = ['status' => 1, 'response' => 'success', 'message' => 'slider updated successfully'];

            } else {
                $result = ['status' => 0, 'response' => 'error', 'message' => 'slider not found'];

            }


        }
        return response()->json($result);
    }
}
