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

        if($validator->fails()){
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

    public function update(Request $request,$id)
    {
        $request->request->add(['id'=>$id]);
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'images.*' => 'required'
        ]);
        if($validator->fails()){
            return redirect()->back()->withInput();
        }

        $slider = Slider::find($id);
        if($slider)
        {

        }
        else
        {
             return redirect()->back()->withErrors(['not_found'=>'slider not found']);
        }
        return redirect()->route('admin.sliders.index');
    }
}
