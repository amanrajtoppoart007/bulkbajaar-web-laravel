<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\CsvImportTrait;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\MassDestroyArticleRequest;
use App\Http\Requests\StoreArticleRequest;
use App\Http\Requests\UpdateArticleRequest;
use App\Models\Article;
use App\Models\ArticleTag;
use App\Models\User;
use Gate;
use Illuminate\Http\Request;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Symfony\Component\HttpFoundation\Response;

class ArticleController extends Controller
{
    use MediaUploadingTrait, CsvImportTrait;

    public function index()
    {
        abort_if(Gate::denies('article_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $articles = Article::with(['user', 'tags', 'media'])->get();

        $users = User::get();

        $article_tags = ArticleTag::get();

        return view('frontend.articles.index', compact('articles', 'users', 'article_tags'));
    }

    public function create()
    {
        abort_if(Gate::denies('article_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $users = User::all()->pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');

        $tags = ArticleTag::all()->pluck('title', 'id');

        return view('frontend.articles.create', compact('users', 'tags'));
    }

    public function store(StoreArticleRequest $request)
    {
        $article = Article::create($request->all());
        $article->tags()->sync($request->input('tags', []));

        if ($request->input('primary_image', false)) {
            $article->addMedia(storage_path('tmp/uploads/' . $request->input('primary_image')))->toMediaCollection('primary_image');
        }

        if ($media = $request->input('ck-media', false)) {
            Media::whereIn('id', $media)->update(['model_id' => $article->id]);
        }

        return redirect()->route('frontend.articles.index');
    }

    public function edit(Article $article)
    {
        abort_if(Gate::denies('article_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $users = User::all()->pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');

        $tags = ArticleTag::all()->pluck('title', 'id');

        $article->load('user', 'tags');

        return view('frontend.articles.edit', compact('users', 'tags', 'article'));
    }

    public function update(UpdateArticleRequest $request, Article $article)
    {
        $article->update($request->all());
        $article->tags()->sync($request->input('tags', []));

        if ($request->input('primary_image', false)) {
            if (!$article->primary_image || $request->input('primary_image') !== $article->primary_image->file_name) {
                if ($article->primary_image) {
                    $article->primary_image->delete();
                }

                $article->addMedia(storage_path('tmp/uploads/' . $request->input('primary_image')))->toMediaCollection('primary_image');
            }
        } elseif ($article->primary_image) {
            $article->primary_image->delete();
        }

        return redirect()->route('frontend.articles.index');
    }

    public function show(Article $article)
    {
        abort_if(Gate::denies('article_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $article->load('user', 'tags', 'articleArticleComments', 'articleArticleLikes');

        return view('frontend.articles.show', compact('article'));
    }

    public function destroy(Article $article)
    {
        abort_if(Gate::denies('article_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $article->delete();

        return back();
    }

    public function massDestroy(MassDestroyArticleRequest $request)
    {
        Article::whereIn('id', request('ids'))->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }

    public function storeCKEditorImages(Request $request)
    {
        abort_if(Gate::denies('article_create') && Gate::denies('article_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $model         = new Article();
        $model->id     = $request->input('crud_id', 0);
        $model->exists = true;
        $media         = $model->addMediaFromRequest('upload')->toMediaCollection('ck-media');

        return response()->json(['id' => $media->id, 'url' => $media->getUrl()], Response::HTTP_CREATED);
    }
}
