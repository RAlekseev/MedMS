<?php


namespace App\Modules\Services\Controllers;


use App\Http\Controllers\Controller;
use App\Modules\Services\Models\Category;
use App\Modules\Services\Models\Service;
use Illuminate\Http\Request;

class GuestServiceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return [
            'services' => Service::with(['parentServices', 'childServices', 'category'])->get(),
            'categories' => Category::where('category_id', null)->with(['subCategories'])->get(),
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
        return Service::findOrFail($id);
    }
}
