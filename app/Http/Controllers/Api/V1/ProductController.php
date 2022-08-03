<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Library\Api\V1\User\CategoryList;
use App\Library\Api\V1\User\SubCategoryList;
use App\Models\ProductCategory;
use App\Models\ProductSubCategory;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function getCategories(Request $request)
    {
        try {
            $query = ProductCategory::query();

            if (!empty($request->input('keyword'))) {
                $query->where(function ($q) use ($request) {
                    $q->where('name', 'LIKE', "%".$request->input('keyword')."%");
                });
            }

            $categories = $query->paginate(10);
            if (count($categories)) {
                $categoryList = $categories->toArray();
                $data['current_page'] = $categoryList['current_page'];
                $data['next_page_url'] = $categoryList['next_page_url'];
                $data['last_page_url'] = $categoryList['last_page_url'];
                $data['per_page'] = $categoryList['per_page'];
                $data['total'] = $categoryList['total'];
                $data['list'] = $categoryList['data'];
                $class = new CategoryList($categoryList['data']);
                $data['list'] = $class->execute();
                $result = [
                    'status' => 1,
                    'response' => 'success',
                    'action' => 'fetched',
                    'data' => $data,
                    'message' => 'Category data fetched successfully'
                ];
            } else {
                $result = ['status' => 0, 'response' => 'error', 'action' => 'retry', 'message' => 'No category found'];
            }

        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }

    public function getSubCategories(Request $request)
    {
        try {
            $query = ProductSubCategory::query();
            if ($request->input('keyword')) {
                $query->where(function ($q) use ($request) {
                    $q->where('name', 'LIKE', "%".$request->input('keyword')."%");
                });
            }

            if ($request->input('category_id')) {
                $query->where('product_category_id', $request->input('category_id'));
            }

            $subCategories = $query->with('category')->paginate(10);
            if (count($subCategories)) {
                $subCategoryList = $subCategories->toArray();
                $data['current_page'] = $subCategoryList['current_page'];
                $data['next_page_url'] = $subCategoryList['next_page_url'];
                $data['last_page_url'] = $subCategoryList['last_page_url'];
                $data['per_page'] = $subCategoryList['per_page'];
                $data['total'] = $subCategoryList['total'];
                $data['list'] = $subCategoryList['data'];
                $class = new SubCategoryList($subCategoryList['data']);
                $data['list'] = $class->execute();
                $result = [
                    'status' => 1,
                    'response' => 'success',
                    'action' => 'fetched',
                    'data' => $data,
                    'message' => 'SubCategory data fetched successfully'
                ];
            } else {
                $result = [
                    'status' => 0,
                    'response' => 'error',
                    'action' => 'retry',
                    'message' => 'No sub category found'
                ];
            }
        } catch (\Exception $exception) {
            $result = ['status' => 0, 'response' => 'error', 'message' => $exception->getMessage()];
        }
        return response()->json($result, 200);
    }
}
