<?php


namespace App\Modules\Warehouse\Controllers;


use App\Http\Controllers\Controller;
use App\Modules\Warehouse\Models\Movement;
use App\Modules\Warehouse\Models\WarehouseRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class WarehouseRequestController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return WarehouseRequest::with(['creator', 'inventories'])->get();
    }

    /**
     * Display a listing of user warehouse requests.
     *
     * @return \Illuminate\Http\Response
     */
    public function auth_user_index()
    {
        return Auth::user()->warehouse_requests()->with(['creator', 'inventories'])->get();
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $warehouse_request = WarehouseRequest::create([
            'creator_id' => Auth::user()->id,
            'comment' => $request['comment'],
            'status_id' => 1,
        ]);

        foreach ($request['inventories'] as $inventory) {
            $warehouse_request->inventories()
                ->attach($inventory['id'], ['amount' => $inventory['selected_amount']]);
        }

        $warehouse_request->creator;
        $warehouse_request->inventories;

        return $warehouse_request;
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show(int $id)
    {
        return WarehouseRequest::findOrFail($id);
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
        $warehouse_request = WarehouseRequest::findOrFail($id);
        $warehouse_request->update(['status_id' => $request['status_id']]);

        if ($request['status_id'] == 2) {
            $movement = Movement::create([
                'contractor' => $warehouse_request->user->full_name,
                'creator_id' => Auth::user()->id,
            ]);

            $movement->inventories()->attach($warehouse_request->inventories->column('id'),
                ['amount' => $warehouse_request->inventories->map(function ($inventory) {
                    return -1 * $inventory->amount;
                })]);
        }

        $action = $warehouse_request->status_id == 2 ? "Одобрена" : "Отклонена";
        return ['warehouse_request' => $warehouse_request,
            'message' => "Заявка {$warehouse_request->id} успешно {$action}"];
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
        WarehouseRequest::findOrFail($id)->delete();
    }
}
