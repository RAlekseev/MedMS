<?php


namespace App\Modules\Departments\Controllers;


use App\Http\Controllers\Controller;
use App\Models\Department;
use Illuminate\Http\Request;

class DepartmentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Department::with(['employees'])->get();
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $department = Department::create([
            'name' => $request['name'],
            'description' => $request['description'],
            'icon_id' => $request['icon_id'],
        ]);

        $department->users()->attach(array_column($request['employees'], 'id'));

        return response()->json([
            'service' => $department,
            'message' => "Отделение успешно создано"
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
        return Department::findOrFail($id);
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
        $department = Department::findOrFail($id);

        if ($department->users->toArray() != $request['employees']) {
            $department->users()->detach();
            $department->users()->attach(array_column($request['employees'], 'id'));
        }

        $department->fill($request->all())->save();

        return ['service' => $department,
            'message' => "Отделение {$department->name} успешно изменено"];
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
        Department::findOrFail($id)->delete();
    }
}
