<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Modules\Users\Controllers\UserController;
use \App\Modules\Auth\Controllers\LoginController;
use \App\Modules\Auth\Controllers\RegistrationController;
use \App\Modules\Access\Controllers\RoleController;
use \App\Modules\Access\Controllers\PermissionController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});



Route::post('login', [LoginController::class, 'login']);
Route::post('registration', [RegistrationController::class, 'register']);

Route::apiResource('/permissions', PermissionController::class);
Route::apiResource('/roles', RoleController::class);

Route::get('users/change_pass/{id}', [UserController::class, 'change_pass']);
Route::apiResource('/users', UserController::class);
