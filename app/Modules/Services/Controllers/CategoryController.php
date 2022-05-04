<?php


namespace App\Modules\Services\Controllers;


use App\Http\Controllers\Controller;
use App\Modules\Services\Models\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Category::where('category_id', null)->with(['subCategories', 'icon'])->get();
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $category = Category::create([
            'name' => $request['name'],
            'icon_id' => $request['icon_id'],
            'category_id' => $request['category_id'],
        ]);

        return [
            'message' => "Категоория создана успешно",
            'category' =>  $category,
        ];
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show(int $id)
    {
        //
    }


    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $category = Category::findOrFail($id);
        $category->update([
            'name' => $request['name'],
            'icon_id' => $request['icon_id'],
            'category_id' => $request['category_id'],
        ]);

        return [
            'message' => "Категоория изменена успешно",
            'category' =>  $category,
        ];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     * @throws \Exception
     */
    public function destroy(int $id)
    {
        //
    }

}
