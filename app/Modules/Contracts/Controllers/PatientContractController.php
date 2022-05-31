<?php


namespace App\Modules\Contracts\Controllers;


use App\Http\Controllers\Controller;
use App\Modules\Users\Models\User;
use App\Modules\Contracts\Models\Contract;
use App\Modules\Services\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

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
        if (Auth::check()) {
            $user_id = Auth::user()->id;
        } else {
            $user = User::where('email', $request['user']['email'])->first();
            if (!$user) {
                $user = User::create_from_request($request['user']);
            }
            $user_id = $user->id;
        }

        $contract = Contract::create([
            'patient_id' => $user_id,
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
