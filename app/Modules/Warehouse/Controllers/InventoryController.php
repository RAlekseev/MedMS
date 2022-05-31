<?php


namespace App\Modules\Warehouse\Controllers;


use App\Http\Controllers\Controller;
use App\Modules\Warehouse\Models\Inventory;

class InventoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Inventory::with(['movements'])->get();
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
        Inventory::findOrFail($id)->delete();
    }

}
