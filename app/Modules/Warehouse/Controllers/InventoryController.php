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

}
