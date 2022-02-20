<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\CsvImportTrait;
use App\Http\Requests\MassDestroyBrandRequest;
use App\Http\Requests\StoreBrandRequest;
use App\Http\Requests\UpdateBrandRequest;
use App\Models\Brand;
use Gate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Symfony\Component\HttpFoundation\Response;
use Yajra\DataTables\Facades\DataTables;
use App\Http\Controllers\Traits\MediaUploadingTrait;

class BrandController extends Controller
{
    use CsvImportTrait,MediaUploadingTrait;

    public function index(Request $request)
    {
        abort_if(Gate::denies('brand_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        if ($request->ajax()) {
            $query = Brand::query()->select(sprintf('%s.*', (new Brand)->table));
            $table = Datatables::of($query);

            $table->addColumn('placeholder', '&nbsp;');
            $table->addColumn('actions', '&nbsp;');

            $table->editColumn('actions', function ($row) {
                $viewGate      = 'brand_show';
                $editGate      = 'brand_edit';
                $deleteGate    = 'brand_delete';
                $crudRoutePart = 'brands';

                return view('partials.datatablesActions', compact(
                    'viewGate',
                    'editGate',
                    'deleteGate',
                    'crudRoutePart',
                    'row'
                ));
            });

            $table->editColumn('id', function ($row) {
                return $row->id ? $row->id : "";
            });
            $table->editColumn('title', function ($row) {
                return $row->title ? $row->title : "";
            });
            $table->editColumn('status', function ($row) {
                return '<input type="checkbox" disabled ' . ($row->status ? 'checked' : null) . '>';
            });

            $table->editColumn('preview', function ($row) {
                return $row->image?->preview ?:asset('assets/img/no-image.png');
            });

            $table->rawColumns(['actions', 'placeholder', 'status']);


            return $table->make(true);
        }

        return view('admin.brands.index');
    }

    public function getBrand(Request $request)
    {
        $validator = Validator::make($request->all(),[
            "id"=>"required|numeric"
        ]);
        if(!$validator->fails())
        {
            $brand = Brand::find($request->input('id'));
            if($brand)
            {
                $data = ['id'=>$brand->id,'title'=>$brand->title];
                if($brand->image)
                {
                    $data['image'] =$brand->getMedia('image')->last();
                }
                else
                {
                    $data['image'] = null;
                }
              $result = ['status'=>1,'response'=>'success','data'=>$data,'message'=>'Data found'];
            }
            else
            {
               $result = ['status'=>0,'response'=>'error','message'=>'Data not found'];
            }

        }
        else
        {
            $msg = '';
            foreach ($validator->errors()->all() as $error) {
                $msg .= $error . "\n";
            }
            $result = ["status" => 0, "response" => "validation_error", "message" => $msg];

        }
        return response()->json($result,200);
    }

    public function create()
    {
        abort_if(Gate::denies('brand_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.brands.create');
    }

    public function store(StoreBrandRequest $request)
    {
        try {
            $brand = Brand::create($request->all());

            if ($request->input('image', false)) {
                $brand->addMedia(storage_path('tmp/uploads/' . $request->input('image')))->toMediaCollection('image');
            }

             $result = ['status'=>1,'response'=>'success','message'=>'Brand added successfully'];
        }
        catch (\Exception $exception)
        {
            $result = ['status'=>0,'response'=>'exception_error','message'=>$exception->getMessage()];
        }

        return response()->json($result,200);
    }

    public function edit(Brand $brand)
    {
        abort_if(Gate::denies('brand_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.brands.edit', compact('brand'));
    }

    public function update(UpdateBrandRequest $request, Brand $brand)
    {
        try {
            $request->request->add(['status' => $request->boolean('status')]);
            $brand->update($request->all());

            if ($request->input('image', false)) {
                if (!$brand->image || $request->input('image') !== $brand->image->file_name) {
                    if ($brand->image) {
                        $brand->image->delete();
                    }

                    $brand->addMedia(storage_path('tmp/uploads/' . $request->input('image')))->toMediaCollection('image');
                }
            }

            $result = ['status'=>1,'response'=>'success','message'=>'Brand updated successfully'];
        }
        catch (\Exception $exception)
        {
             $result = ['status'=>0,'response'=>'exception_error','message'=>$exception->getMessage()];
        }


        return response()->json($result,200);
    }

    public function show(Brand $brand)
    {
        abort_if(Gate::denies('brand_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $brand->load('brandProducts');

        return view('admin.brands.show', compact('brand'));
    }

    public function destroy(Brand $brand)
    {
        abort_if(Gate::denies('brand_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $brand->delete();

        return back();
    }

    public function massDestroy(MassDestroyBrandRequest $request)
    {
        Brand::whereIn('id', request('ids'))->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }



    public function updateBrand(UpdateBrandRequest $request)
    {
        $brand = Brand::find($request->id)->update($request->all());
        if($brand){
            $result = array('status'=> true, 'msg'=>'Brand updated successfully.');
        }else {
            $result = array('status'=>false, 'msg'=>'Something went wrong!!');
        }
        return json_encode($result);
    }
}
