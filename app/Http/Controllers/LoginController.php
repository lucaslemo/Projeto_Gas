<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function index(Request $request)
    {
        $mensagem = $request->session()->get('mensagem.login');
        return response(view('login.index')->with('titulo', 'Login')
            ->with('mensagem', $mensagem));
    }

    public function store(Request $request)
    {
        $login = $request->input('login');
        $senha = $request->input('senha');
        $remember = !is_null($request->input('remember')) ? true : false;

        if(! Auth::attempt(['login_usuario' => $login, 'password' => $senha, 'status_usuario' => 1], $remember)){
            return to_route('login.index')
                ->with('mensagem.login', 'Usuário ou senha Incorretos');
        }

        $nomeUsuario = ucfirst('Lucas');
        return to_route('dashboard.index')
            ->with('mensagem.dashboard', "Bem Vindo! <strong>{$nomeUsuario}.</strong>");
    }

    public function destroy()
    {
        Auth::logout();
        return to_route('login.index');
    }
}
