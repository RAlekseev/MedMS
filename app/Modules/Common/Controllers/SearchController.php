<?php


namespace App\Modules\Common\Controllers;


use App\Http\Controllers\Controller;
use App\Modules\Services\Models\Category;
use App\Modules\Services\Models\Service;
use Illuminate\Http\Request;

class SearchController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $results = Service::where('name', 'like', '%' . $request['query'] . '%')->with(['category'])->get();

        return ['result' => $results];
    }

}
