<?php

namespace App\Modules\Configs\Controllers;


use App\Http\Controllers\Controller;
use App\Modules\Configs\Models\Config;
use Illuminate\Http\Request;

class ConfigController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Config::all();
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
        $config = Config::findOrFail($id);

        $config->fill($request->all())->save();

        return ['config' => $config,
            'message' => "Параметр {$config->name} успешно изменен"];
    }
}
