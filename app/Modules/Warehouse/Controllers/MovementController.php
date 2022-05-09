<?php


namespace App\Modules\Warehouse\Controllers;


use App\Http\Controllers\Controller;
use App\Modules\Warehouse\Models\Inventory;
use App\Modules\Warehouse\Models\Movement;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rules\In;

class MovementController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Movement::with(['creator', 'inventories'])->get();
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $movement = Movement::create([
            'contractor' => $request['contractor'],
            'created_at' => $request['date'],
            'creator_id' => Auth::user()->id,
        ]);

        foreach ($request['inventories'] as $inventory) {
            $diff  = (int)$inventory['amount'] * $request['factor'];
            if (array_key_exists('is_new', $inventory)) {
                $inventory = Inventory::create([
                    'name' => $inventory['new_name'],
                    'amount' => $inventory['amount'],
                    'unit' => $inventory['unit'],
                ]);
            } else {
                $inventory = Inventory::findOrFail($inventory['id']);
                $inventory->update(['amount' => $inventory->amount + $diff]);
            }
            $movement->inventories()->attach($inventory['id'], ['amount' => $diff]);
        }

        return $movement;
    }
}
