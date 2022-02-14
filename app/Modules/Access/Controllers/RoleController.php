<?php


namespace App\Modules\Access\Controllers;


use App\Http\Controllers\Controller;
use App\Modules\Access\Models\Role;
use Illuminate\Http\Request;

class RoleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Role::all();
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $role = Role::create([
            'name' => $request['name'],
            'slug' => $request['slug'],
        ]);

        $role->permissions()->attach($request['permissions']);

        return response()->json([
            'role' => $role,
            'message' => "Роль успешно добавлена"
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show(int $id)
    {
        return Role::findOrFail($id);
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
        $role = Role::findOrFail($id);

        $role->permissions()->detach();
        $role->permissions()->attach(array_column($request['permissions'], 'id'));
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
        Role::findOrFail($id)->delete();
    }
}
