<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\CsvImportTrait;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\MassDestroyProductRequest;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;
use App\Models\Brand;
use App\Models\Product;
use App\Models\ProductCategory;
use App\Models\ProductPortalCharge;
use App\Models\ProductReturnCondition;
use App\Models\Vendor;
use App\Traits\SlugGeneratorTrait;
use Illuminate\Support\Facades\Gate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Symfony\Component\HttpFoundation\Response;
use Yajra\DataTables\Facades\DataTables;

class ProductController extends Controller
{
    use MediaUploadingTrait, CsvImportTrait, SlugGeneratorTrait;

    public function index(Request $request)
    {

        abort_if(Gate::denies('product_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        if ($request->ajax()) {
            $query = Product::with(['vendor', 'productCategory', 'productSubCategory'])->select(sprintf('%s.*', (new Product)->table));
            $table = Datatables::of($query);

            $table->addColumn('placeholder', '&nbsp;');
            $table->addColumn('actions', '&nbsp;');

            $table->editColumn('actions', function ($row) {
                $viewGate      = 'product_show';
                $editGate      = 'product_edit';
                $deleteGate    = 'product_delete';
                $crudRoutePart = 'products';

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
            $table->editColumn('name', function ($row) {
                return $row->name ? $row->name : "";
            });

            $table->editColumn('image', function ($row) {
                if (!empty($row->images[0])) {
                    $imageThumbUrl = $row->images[0]->getUrl('thumb');
                    return '<a href="'.$imageThumbUrl.'" target="_blank" style="display: inline-block"><img style="width:80px;height:80px" src="'.$imageThumbUrl.'"></a>';
                }
                return "";
            });
            $table->editColumn('price', function ($row) {
                return $row->price ? $row->price : "";
            });
            $table->editColumn('vendor', function ($row) {
                return $row->vendor->name ?? '';
            });

            $table->editColumn('category', function ($row) {
                return $row->productCategory->name ?? '';
            });
            $table->editColumn('sub_category', function ($row) {
                return $row->productSubCategory->name ?? '';
            });
            $table->editColumn('discount', function ($row) {
                return $row->discount ? $row->discount : "";
            });
            $table->addColumn('brand_title', function ($row) {
                return $row->brand ? $row->brand->title : '';
            });

            $table->rawColumns(['actions', 'placeholder', 'category','sub_category', 'image']);

            return $table->make(true);
        }

        $product_categories = ProductCategory::get();

        return view('admin.products.index', compact('product_categories'));
    }

    public function create()
    {
        abort_if(Gate::denies('product_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');
        $vendors = Vendor::all()->pluck('name', 'id');
        $categories = ProductCategory::all()->pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');

        $returnConditions = ProductReturnCondition::whereActive(true)->pluck('title', 'id');
        $brands = Brand::where('status', true)->pluck('title', 'id')->prepend(trans('global.pleaseSelect'), '');
        return view('admin.products.create', compact('categories' , 'vendors', 'returnConditions', 'brands'));
    }

    public function store(StoreProductRequest $request,Product $product)
    {
        DB::beginTransaction();
        try {
            $validated = $request->validated();
            $validated['slug'] = $this->generateSlug(Product::class, $request->input('name'));
            $validated['quantity'] = null;
            $product = $product->create($validated);
            if ($media = $request->input('ck-media', false)) {
                Media::whereIn('id', $media)->update(['model_id' => $product->id]);
            }
            if ($request->boolean('is_returnable')){
                $product->productReturnConditions()->sync($request->input('return_conditions'));
            }
            $product->save();
            DB::commit();
            $nextUrl = route('admin.productOptions.create',['productId'=>$product->id]);
            $result = ["status" => 1, "response"=>"success","nextUrl"=>$nextUrl, "message" => "Product added successfully"];
        }
        catch (\Exception $e) {
            DB::rollBack();
            $result = ["status" => 0, "response"=>"exception_error", "message" => $e->getMessage()];

        }
        return response()->json($result,200);
    }

    public function edit(Product $product)
    {
        abort_if(Gate::denies('product_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');
        $categories = ProductCategory::pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');
        $returnConditions = ProductReturnCondition::whereActive(true)->pluck('title', 'id');
        $selectedReturnConditions = $product->productReturnConditions->pluck('id')->toArray();
        $brands = Brand::where('status', true)->pluck('title', 'id')->prepend(trans('global.pleaseSelect'), '');

        return view('admin.products.edit',
            compact('categories', 'product',  'returnConditions', 'selectedReturnConditions', 'brands'));
    }

    public function update(UpdateProductRequest $request)
    {
        DB::beginTransaction();
        try {
            $validated = $request->validated();
            $product = Product::findOrFail($request->input('id'));
            $validated['quantity'] = null;
            $product->update($validated);
            if ($media = $request->input('ck-media', false)) {
                Media::whereIn('id', $media)->update(['model_id' => $product->id]);
            }
            if ($request->boolean('is_returnable')){
                $product->productReturnConditions()->sync($request->return_conditions);
            }else{
                $product->productReturnConditions()->sync([]);
            }
            /*
             *
             * $colors = [];
            $sizes  = [];$product->product_attributes = [
                [
                    'key' => 'color',
                    'values' => $colors
                ],
                [
                    'key' => 'size',
                    'values' => $sizes
                ],
            ];*/
            $product->save();
            DB::commit();
            $result = ["status" => 1,"response"=>"success", "message" => 'Product updated successfully'];

        } catch (\Exception $e) {
            DB::rollBack();
            $result = ["status"=>0,"response"=>"exception_error","message"=>$e->getMessage()];

        }
        return response()->json($result,200);
    }

    public function show(Product $product)
    {
        abort_if(Gate::denies('product_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');
        $product->load('productCategory', 'productSubCategory', 'vendor', 'productOptions', 'productReturnConditions');
        $portalChargePercent = getPortalChargePercentage($product->id);
        return view('admin.products.show', compact('product', 'portalChargePercent'));
    }

    public function destroy(Product $product)
    {
        abort_if(Gate::denies('product_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');
        $product->productOptions()->delete();
        $product->delete();
        return back();
    }

    public function massDestroy(MassDestroyProductRequest $request)
    {
        Product::whereIn('id', request('ids'))->delete();
        return response(null, Response::HTTP_NO_CONTENT);
    }

    public function storeCKEditorImages(Request $request)
    {
        abort_if(Gate::denies('product_create') && Gate::denies('product_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');
        $model         = new Product();
        $model->id     = $request->input('crud_id', 0);
        $model->exists = true;
        $media         = $model->addMediaFromRequest('upload')->toMediaCollection('ck-media');
        return response()->json(['id' => $media->id, 'url' => $media->getUrl()], Response::HTTP_CREATED);
    }

    public function massApprove(MassDestroyProductRequest $request)
    {
        Product::whereIn('id', request('ids'))->update(['approval_status' => 'APPROVED']);
        return response(null, Response::HTTP_NO_CONTENT);
    }

    public function approve(Product $product)
    {
        $product->approval_status = 'APPROVED';
        $product->save();
        return back()->with('message' ,'Approved successfully!');
    }

    public function updatePortalCharge(Request $request)
    {
        $request->validate([
            'product_id' => 'required|exists:products,id',
            'charge' => 'required|numeric|min:0|max:100'
        ]);

        try {
            ProductPortalCharge::updateOrCreate([
                'product_id' => $request->product_id,
            ], [
                'charge' => $request->charge,
            ]);
            $data = array(
                "status" => true,
                "msg" => 'Product charge updated successfully'
            );
            return json_encode($data);
        }catch (\Exception $e) {
            $data = array(
                "status" => false,
                "msg" => $e->getMessage()
            );
            return json_encode($data);
        }


    }
}
