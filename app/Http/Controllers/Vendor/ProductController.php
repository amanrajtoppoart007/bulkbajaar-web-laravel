<?php

namespace App\Http\Controllers\Vendor;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\CsvImportTrait;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\MassDestroyProductRequest;
use App\Http\Requests\Vendor\StoreProductRequest;
use App\Http\Requests\Vendor\UpdateProductRequest;
use App\Models\Brand;
use App\Models\Product;
use App\Models\ProductCategory;
use App\Models\ProductOption;
use App\Models\ProductReturnCondition;
use App\Models\UnitType;
use App\Traits\SlugGeneratorTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Yajra\DataTables\Facades\DataTables;
use Symfony\Component\HttpFoundation\Response;

class ProductController extends Controller
{
    use MediaUploadingTrait, CsvImportTrait, SlugGeneratorTrait;

    public function index(Request $request)
    {
        if ($request->ajax()) {
            $query = Product::with(['productCategory', 'productSubCategory'])->select(sprintf('%s.*',
                (new Product)->table));
            $query->where('vendor_id', auth()->id());
            $table = Datatables::of($query);

            $table->addColumn('placeholder', '&nbsp;');
            $table->addColumn('actions', '&nbsp;');

            $table->editColumn('actions', function ($row) {
                $viewGate = 'product_show';
                $editGate = 'product_edit';
                $deleteGate = 'product_delete';
                $crudRoutePart = 'products';

                return view('vendor.include.datatablesActions', compact(
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
            $table->editColumn('description', function ($row) {
                return $row->description ? $row->description : "";
            });
            $table->editColumn('price', function ($row) {
                return $row->price ? $row->price : "";
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

            $table->editColumn('image', function ($row) {
                if (!empty($row->images[0])) {
                   return   $row->images[0]->getUrl('thumb');
                }
                return "";
            });

            $table->rawColumns(['actions', 'placeholder', 'category', 'sub_category']);

            return $table->make(true);
        }

        $product_categories = ProductCategory::pluck('name', 'id');

        return view('vendor.products.index', compact('product_categories'));
    }

    public function create()
    {
        $categories = ProductCategory::pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');
        $portalChargePercentage = getPortalChargePercentage();
        $returnConditions = ProductReturnCondition::whereActive(true)->pluck('title', 'id');
        $brands = Brand::where('status', true)->pluck('title', 'id')->prepend(trans('global.pleaseSelect'), '');
        return view('vendor.products.create', compact('categories' , 'portalChargePercentage', 'returnConditions', 'brands'));
    }

    public function show(Product $product)
    {
        abort_if($product->vendor_id != auth()->id(), 401);
        $product->load('productCategory', 'productSubCategory', 'productOptions');
        $portalChargePercent = getPortalChargePercentage($product->id);
        return view('vendor.products.show', compact('product', 'portalChargePercent'));
    }

    /**
     * @param StoreProductRequest $request
     * @return \Illuminate\Http\JsonResponse
     */

    public function store(StoreProductRequest $request,Product $product)
    {
        DB::beginTransaction();
        try {
            $validated = $request->validated();
            $validated['vendor_id'] = auth()->id();
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
            $nextUrl = route('vendor.options.create',['productId'=>$product->id]);
            $result = ["status" => 1, "response"=>"success","nextUrl"=>$nextUrl, "message" => "Product added successfully"];
        }
        catch (\Exception $e) {
            DB::rollBack();
            $result = ["status" => 0, "response"=>"exception_error", "message" => $e->getMessage()];

        }
        return response()->json($result);
    }

    public function edit(Product $product)
    {
        abort_if($product->vendor_id != auth()->id(), 401);
        $categories = ProductCategory::pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');
        $unitTypes = UnitType::select('name')->whereStatus(true)->get();
        $productOptions = ProductOption::where('product_id', $product->id)->get();
        $portalChargePercentage = getPortalChargePercentage($product->id);
        $returnConditions = ProductReturnCondition::whereActive(true)->pluck('title', 'id');
        $selectedReturnConditions = $product->productReturnConditions->pluck('id')->toArray();
        $brands = Brand::where('status', true)->pluck('title', 'id')->prepend(trans('global.pleaseSelect'), '');
        return view('vendor.products.edit',
            compact('categories', 'product',
                'unitTypes', 'productOptions',
                'portalChargePercentage',
                'returnConditions',
                'selectedReturnConditions',
                'brands'
            ));
    }

    /**
     * @param UpdateProductRequest $request
     * @return \Illuminate\Http\JsonResponse
     */

    public function update(UpdateProductRequest $request): \Illuminate\Http\JsonResponse
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
                $product->productReturnConditions()->sync($request->input('return_conditions'));
            }else{
                $product->productReturnConditions()->sync([]);
            }

            $product->save();
            DB::commit();
            $result = ["status" => 1,"response"=>"success", "message" => 'Product updated successfully'];

        } catch (\Exception $e) {
            DB::rollBack();
            $result = ["status"=>0,"response"=>"exception_error","message"=>$e->getMessage()];

        }
        return response()->json($result);
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
}
