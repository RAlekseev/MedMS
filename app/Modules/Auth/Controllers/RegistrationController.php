<?php


namespace App\Modules\Auth\Controllers;


use App\Modules\Users\Models\User;
use App\Modules\Auth\Requests\RegisterUserRequest;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Log;

class RegistrationController
{
    public function register(RegisterUserRequest $request)
    {
        try {
            $user = User::create([
                'last_name' => $request->last_name,
                'first_name' => $request->first_name,
                'middle_name' => $request->middle_name,
                'email' => $request->email,
                'phone' => $request->phone,
                'password' => bcrypt($request->password)
            ]);

            return response()->json([], Response::HTTP_OK);
        } catch (\Exception $e) {
            Log::error($e->getMessage(), ['trace' => $e->getTraceAsString()]);
            return response()->json([], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
}
