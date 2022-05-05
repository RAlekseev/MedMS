<?php


namespace App\Modules\Icon\Controllers;


use App\Http\Controllers\Controller;
use App\Modules\Icon\Models\Icon;
use App\Modules\Icon\Models\IconType;
use Illuminate\Http\Request;

class IconController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return IconType::with('icons')->get();
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $icon = Icon::create([
            'source' => $request['name'],
            'icon_type_id' => $request['icon_type_id'],
        ]);

        if (count($request->files)) {
            $icon->update(['source' => $icon->storeFile($request)]);
        }

        return [
            'icon' => $icon,
            'message' => 'Иконка успешно добавлена'
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

    }
}
