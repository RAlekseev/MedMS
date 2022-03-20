<?php


namespace App\Modules\Services\Controllers;


use App\Http\Controllers\Controller;
use App\Modules\Services\Models\Service;
use Illuminate\Http\Request;

class ServiceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Service::with(['parentServices', 'childServices', 'category'])->get();
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $service = Service::create([
            'name' => $request['name'],
            'price' => (int)$request['price'],
            'description' => $request['description'],
            'category_id' => $request['category_id'],
        ]);

        $service->childServices()->attach(array_column($request['child_services'], 'id'));

        $service->childServices;
        $service->parentServices;
        $service->category;

        return response()->json([
            'service' => $service,
            'message' => "Услуга успешно добавлена"
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
        return Service::findOrFail($id);
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
        $service = Service::findOrFail($id);


        if ($service->childServices->toArray() != $request['child_services']) {
            $service->childServices()->detach();
            $service->childServices()->attach(array_column($request['child_services'], 'id'));
        }

        $service->fill($request->all())->save();

        $service->category;

        return ['service' => $service,
            'message' => "Услуга {$service->name} успешно изменена"];
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
        Service::findOrFail($id)->delete();
    }
}
