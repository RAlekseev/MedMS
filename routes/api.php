<?php

use App\Modules\Common\Controllers\SearchController;
use App\Modules\Configs\Controllers\ConfigController;
use App\Modules\Departments\Controllers\DepartmentController;
use App\Modules\Warehouse\Controllers\MovementController;
use App\Modules\Icon\Controllers\IconController;
use App\Modules\Media\Controllers\MediaController;
use App\Modules\Services\Controllers\CategoryController;
use App\Modules\Contracts\Controllers\ContractController;
use App\Modules\Contracts\Controllers\PatientContractController;
use App\Modules\Services\Controllers\GuestServiceController;
use App\Modules\Services\Controllers\ServiceController;
use App\Modules\Warehouse\Controllers\InventoryController;
use App\Modules\Warehouse\Controllers\WarehouseRequestController;
use App\Modules\WorkingHour\Controllers\WorkingHourController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Modules\Users\Controllers\UserController;
use \App\Modules\Auth\Controllers\LoginController;
use \App\Modules\Auth\Controllers\RegistrationController;
use \App\Modules\Access\Controllers\RoleController;
use \App\Modules\Access\Controllers\PermissionController;
use \App\Modules\DocTemplates\Controllers\DocTemplateController;

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

Route::middleware(['auth'])->group(function () {
    Route::apiResource('/permissions', PermissionController::class);
    Route::apiResource('/roles', RoleController::class);

    Route::get('users/employees', [UserController::class, 'employees']);
    Route::get('users/change_pass/{id}', [UserController::class, 'change_pass']);
    Route::apiResource('/users', UserController::class);

    Route::apiResource('/categories', CategoryController::class);
    Route::apiResource('/services', ServiceController::class);

    Route::apiResource('/contracts', ContractController::class);

    Route::apiResource('/working_hours', WorkingHourController::class);
    Route::apiResource('/patient/contracts', PatientContractController::class)->except(['destroy', 'store']);
    Route::patch('/configs/{config}', [ConfigController::class, 'update']);
    Route::apiResource('/doc_templates', DocTemplateController::class);

    Route::post('media/store', [MediaController::class, 'store']);
    Route::get('media/get', [MediaController::class, 'get']);

    Route::get('warehouse/inventories', [InventoryController::class, 'index']);
    Route::delete('warehouse/inventories/{id}', [InventoryController::class, 'destroy']);
    Route::get('warehouse/movements', [MovementController::class, 'index']);
    Route::post('warehouse/movements', [MovementController::class, 'store']);

    Route::get('warehouse/my_requests', [WarehouseRequestController::class, 'auth_user_index']);
    Route::apiResource('warehouse/requests', WarehouseRequestController::class);

    Route::apiResource('/departments', DepartmentController::class);
});

Route::post('/patient/contracts', [PatientContractController::class, 'store']);

Route::apiResource('/icons', IconController::class);

Route::get('/configs', [ConfigController::class, 'index']);
Route::apiResource('/guest_services', GuestServiceController::class)->except(['store', 'update', 'destroy']);
Route::post('search', [SearchController::class, 'index']);

Route::post('logout', [LoginController::class, 'logout']);
Route::post('login', [LoginController::class, 'login']);
Route::post('registration', [RegistrationController::class, 'register']);



