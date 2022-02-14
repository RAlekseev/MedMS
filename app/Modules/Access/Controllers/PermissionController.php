<?php


namespace App\Modules\Access\Controllers;


use App\Http\Controllers\Controller;
use App\Modules\Access\Models\Permission;
use Illuminate\Http\Request;

class PermissionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Permission::all();
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $permission = Permission::create([
            'name' => $request['name'],
            'slug' => $request['slug'],
        ]);

        return ['permission' => $permission,
            'message' => "Право доступа успешно добавлено"];
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show(int $id)
    {
        return Permission::findOrFail($id);
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
        $role = Permission::findOrFail($id);
        $role->fill($request->all())->save();

        return ['user' => $role,
            'message' => "Роль {$role->name} успешно изменена"];
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
        Permission::findOrFail($id)->delete();
    }

}
