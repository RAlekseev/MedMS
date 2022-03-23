<?php


namespace App\Modules\Contracts\Controllers;


use App\Http\Controllers\Controller;
use App\Modules\Contracts\Models\Contract;
use App\Modules\Services\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PatientContractController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        return Auth::user()->contracts()->with(['services'])->get();
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $contract = Contract::create([
            'patient_id' => Auth::user()->id,
        ]);

        $contract->services()->attach(array_column($request['services'], 'id'));

        return [
            'contract' => $contract,
            'message' => 'Услуги успешно оформлены',
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
        //
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
        //
    }

}
