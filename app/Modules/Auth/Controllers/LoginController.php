<?php


namespace App\Modules\Auth\Controllers;


use App\Models\User;
use App\Modules\Auth\Requests\LoginUserRequest;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

class LoginController
{
    /**
     * @param LoginUserRequest $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function login(LoginUserRequest $request)
    {
        $user = User::whereEmail($request->email)->first();

        if (!$user) {
            return response()->json([
                'message' => 'Неверная почта или пароль!',
                'status' => 422
            ], 422);
        }

        // Если пользователь с таким email адресом найден - проверим совпадает
        // ли его пароль с указанным
        if (!Hash::check(request('password'), $user->password)) {
            return response()->json([
                'message' => 'Неверная почта или пароль!',
                'status' => 422
            ], 422);
        }

        if (Auth::attempt($request->validated())) {
            $user = Auth::user();
            $token = $user->createToken('api');
            return response()->json([
                'user' => $user,
                'token' => $token->plainTextToken
            ]);
        }

        return response()->json([
            'message' => 'Ошибка авторизации',
            'status' => 422
        ], Response::HTTP_UNAUTHORIZED);
    }
}
