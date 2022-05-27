<?php

namespace App\Modules\Users\Controllers;


use App\Http\Controllers\Controller;
use App\Modules\Users\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return User::with('roles')->get();
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $random_pass = strtolower(Str::random(4));
        $user = User::create([
            'first_name' => $request['first_name'],
            'last_name' => $request['last_name'],
            'middle_name' => $request['middle_name'],
            'email' => $request['email'],
            'phone' => $request['phone'],
            'password' => bcrypt($random_pass),
            'birthday' => $request['birthday'],
        ]);

        $user->roles()->attach($request['roles']);

        return ['user' => $user,
            'message' => "Пользователь успешно добавлен login: {$user->email}  pass: {$random_pass}"];
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show(int $id)
    {
        return User::findOrFail($id);
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
        $user = User::findOrFail($id);

        if ($user->roles->toArray() != $request['roles']) {
            $user->roles()->detach();
            $user->roles()->attach(array_column($request['roles'], 'id'));
            $user->tokens()->delete();
        }

        $user->fill($request->all())->save();

        return ['user' => $user,
            'message' => "Пользователь {$user->name} успешно изменен"];
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
        User::findOrFail($id)->delete();
    }

    public function employees()
    {
        return User::employees();
    }

    public function change_pass($id)
    {
        $random_pass = strtolower(Str::random(4));
        $user = User::findOrFail($id);
        $result = $user->update(['password' => bcrypt($random_pass)]);

        return json_encode("Login: {$user->email}
        Password: {$random_pass} \n Сохраните пароль! При обновленнии страницы он станет недоступен");
    }
}
