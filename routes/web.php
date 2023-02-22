<?php

use App\Http\Controllers\DashboardController;
use App\Http\Controllers\EstoqueController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\UsuariosController;
use App\Http\Middleware\Autenticador;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/laravel', function () {
    return view('welcome');
});

Route::get('/', function () {
    return to_route('login.index');
})->name('login');

Route::resource('/login', LoginController::class)
    ->only(['index', 'store', 'destroy']);

Route::middleware([Autenticador::class])->group(function () {
    Route::resource('/dashboard', DashboardController::class)
        ->only(['index']);

    Route::resource('/estoque', EstoqueController::class)
        ->only(['index']);

    Route::resource('/usuario', UsuariosController::class)
        ->only(['show', 'update']);
});
