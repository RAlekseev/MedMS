<?php


namespace App\Modules\Contracts\Controllers;


use App\Http\Controllers\Controller;
use App\Modules\Contracts\Models\Contract;
use App\Modules\Services\Models\Category;
use Illuminate\Http\Request;

class ContractController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Contract::with(['services', 'patient'])->orderBy('created_at', 'desc')->get();
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
            'patient_id' => $request['user_id'],
        ]);

        $contract->services()->attach(array_column($request['services'], 'id'));

        $contract->send_email();
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
        $contract = Contract::with('services')->findOrFail($id);
        return $contract;
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

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     * @throws \Exception
     */
    public function destroy(int $id)
    {
        //
    }

}
