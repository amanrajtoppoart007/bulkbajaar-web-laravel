<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\MassDestroyFaqCategoryRequest;
use App\Http\Requests\StoreFaqCategoryRequest;
use App\Http\Requests\UpdateFaqCategoryRequest;
use App\Models\FaqCategory;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class FaqCategoryController extends Controller
{
    public function index()
    {
        abort_if(Gate::denies('faq_category_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $faqCategories = FaqCategory::all();

        return view('admin.faqCategories.index', compact('faqCategories'));
    }

    public function create()
    {
        abort_if(Gate::denies('faq_category_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.faqCategories.create');
    }

    public function store(StoreFaqCategoryRequest $request)
    {
        $faqCategory = FaqCategory::create($request->all());

        return redirect()->route('admin.faq-categories.index');
    }

    public function edit(FaqCategory $faqCategory)
    {
        abort_if(Gate::denies('faq_category_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.faqCategories.edit', compact('faqCategory'));
    }

    public function update(UpdateFaqCategoryRequest $request, FaqCategory $faqCategory)
    {
        $faqCategory->update($request->all());

        return redirect()->route('admin.faq-categories.index');
    }

    public function show(FaqCategory $faqCategory)
    {
        abort_if(Gate::denies('faq_category_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.faqCategories.show', compact('faqCategory'));
    }

    public function destroy(FaqCategory $faqCategory)
    {
        abort_if(Gate::denies('faq_category_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $faqCategory->delete();

        return back();
    }

    public function massDestroy(MassDestroyFaqCategoryRequest $request)
    {
        FaqCategory::whereIn('id', request('ids'))->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }

    public function getCategory(Request $request)
    {
        $category = FaqCategory::find($request->id);
        if ($category) {
            $result = array('status' => true, 'msg' => 'FAQ Category found.', 'data' => $category);
        } else {
            $result = array('status' => false, 'msg' => 'Something went wrong!!');
        }
        return json_encode($result);
    }

    public function addCategory(StoreFaqCategoryRequest $request)
    {
        $category = FaqCategory::create($request->all());
        if($category){
            $result = array('status'=> true, 'msg'=>'FAQ Category added successfully.');
        }else {
            $result = array('status'=>false, 'msg'=>'Something went wrong!!');
        }
        return json_encode($result);
    }

    public function updateCategory(UpdateFaqCategoryRequest $request)
    {
        $category = FaqCategory::find($request->id)->update($request->all());
        if($category){
            $result = array('status'=> true, 'msg'=>'FAQ Category updated successfully.');
        }else {
            $result = array('status'=>false, 'msg'=>'Something went wrong!!');
        }
        return json_encode($result);
    }
}
