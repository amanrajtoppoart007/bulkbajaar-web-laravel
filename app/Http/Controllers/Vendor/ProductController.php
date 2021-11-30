<?php

namespace App\Http\Controllers\Vendor;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\CsvImportTrait;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\Vendor\StoreProductRequest;
use App\Http\Requests\Vendor\UpdateProductRequest;
use App\Models\Product;
use App\Models\ProductCategory;
use App\Models\ProductOption;
use App\Models\ProductSubCategory;
use App\Models\UnitType;
use App\Traits\SlugGeneratorTrait;
use Gate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Yajra\DataTables\Facades\DataTables;

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
                    return $row->images[0]->getUrl('thumb');
                    return '<a href="'.$imageUrl.'" target="_blank" style="display: inline-block"><img src="'.$imageThumbUrl.'"></a>';
                }
                return "";
            });

            $table->rawColumns(['actions', 'placeholder', 'category', 'sub_category']);

            return $table->make(true);
        }

        $product_categories = ProductCategory::pluck('name', 'id');
        $subCategories = ProductSubCategory::pluck('name', 'id');

        return view('vendor.products.index', compact('product_categories', 'subCategories'));
    }

    public function create()
    {
        $categories = ProductCategory::pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');
        $subCategories = ProductSubCategory::pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');
        $unitTypes = UnitType::select('name')->whereStatus(true)->get();
        return view('vendor.products.create', compact('categories', 'unitTypes', 'subCategories'));
    }

    public function show(Product $product)
    {
        //abort_if(Gate::denies('product_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $product->load('productCategory', 'productSubCategory', 'productOptions');

        return view('vendor.products.show', compact('product'));
    }

    public function store(StoreProductRequest $request)
    {
        DB::beginTransaction();
        try {
            $validated = $request->validated();
            $validated['vendor_id'] = auth()->id();
            $validated['slug'] = $this->generateSlug(Product::class, $request->name);
            $validated['quantity'] = null;
            $product = Product::create($validated);

            foreach ($request->input('images', []) as $file) {
                $product->addMedia(storage_path('tmp/uploads/'.$file))->toMediaCollection('images');
            }
            if ($media = $request->input('ck-media', false)) {
                Media::whereIn('id', $media)->update(['model_id' => $product->id]);
            }

            $productOptions = $request->only('unit', 'quantity', 'option');
            $size = sizeof($productOptions['option']);
            $productOptionsArr = [];
            foreach ($productOptions as $key => $value) {
                for ($i = 0; $i < $size; $i++) {
                    $productOptionsArr[$i][$key] = !empty($value[$i]) ? $value[$i] : null;
                }
            }
            foreach ($productOptionsArr as $value) {
                if (!empty($value['option'])) {
                    $data = [
                        'product_id' => $product->id,
                        'unit' => !empty($value['unit']) ? $value['unit'] : null,
                        'quantity' => !empty($value['quantity']) ? $value['quantity'] : null,
                        'option' => $value['option'],
                    ];
                    ProductOption::create($data);
                }
            }

            DB::commit();
            $data = array(
                "status" => true,
                "msg" => 'Product added successfully'
            );
            //Send notification to admin for approval
//            event(new ProductCreated($product));
            return json_encode($data);
        } catch (Exception $e) {
            DB::rollBack();
            $data = array(
                "status" => false,
                "msg" => 'Something went wrong!!'
            );
            return json_encode($data);
        }
    }

    public function edit(Product $product)
    {
        $categories = ProductCategory::pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');
        $subCategories = ProductSubCategory::pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');
        $unitTypes = UnitType::select('name')->whereStatus(true)->get();
        $productOptions = ProductOption::where('product_id', $product->id)->get();
        return view('vendor.products.edit',
            compact('categories', 'product', 'unitTypes', 'subCategories', 'productOptions'));
    }

    public function update(UpdateProductRequest $request)
    {
        DB::beginTransaction();
        try {
            $validated = $request->validated();
            $product = Product::findOrFail($request->id);
            $validated['quantity'] = null;
            $validated['approval_status'] = 'PENDING';
            $product->update($validated);

            if (count($product->images) > 0) {
                foreach ($product->images as $media) {
                    if (!in_array($media->file_name, $request->input('images', []))) {
                        $media->delete();
                    }
                }
            }

            $media = $product->images->pluck('file_name')->toArray();

            foreach ($request->input('images', []) as $file) {
                if (count($media) === 0 || !in_array($file, $media)) {
                    $product->addMedia(storage_path('tmp/uploads/'.$file))->toMediaCollection('images');
                }
            }

            if ($media = $request->input('ck-media', false)) {
                Media::whereIn('id', $media)->update(['model_id' => $product->id]);
            }
            $productUnits = $request->only('pu_id', 'unit', 'quantity', 'option');
            $size = sizeof($productUnits['option']);
            $productUnitsArr = [];
            foreach ($productUnits as $key => $value) {
                for ($i = 0; $i < $size; $i++) {
                    $productUnitsArr[$i][$key] = !empty($value[$i]) ? $value[$i] : null;
                }
            }
            foreach ($productUnitsArr as $value) {
                if (!empty($value['option'])) {
                    $productUnit = [
                        'product_id' => $product->id,
                        'unit' => !empty($value['unit']) ? $value['unit'] : null,
                        'quantity' => !empty($value['quantity']) ? $value['quantity'] : null,
                        'option' => $value['option'],
                    ];
                    ProductOption::updateOrCreate([
                        'id' => $value['pu_id']
                    ], $productUnit);
                }
            }
            DB::commit();
            $data = array(
                "status" => true,
                "msg" => 'Product updated successfully'
            );
            return json_encode($data);
        } catch (Exception $e) {
            DB::rollBack();
            $data = array(
                "status" => false,
                "msg" => 'Something went wrong!!'
            );
            return json_encode($data);
        }
    }
}
