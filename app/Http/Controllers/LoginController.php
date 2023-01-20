<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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
        $usuario = DB::table('usuarios')->where('login_usuario', $login)->first();

        if(is_null($usuario) || !password_verify($senha, $usuario->senha_usuario)){
            return to_route('login.index')
                ->with('mensagem.login', 'Usuário ou senha Incorretos');
        }

        // $request->session()->
        $nomeUsuario = ucfirst($usuario->nome_usuario);
        return to_route('dashboard.index')
            ->with('mensagem.dashboard', "Bem Vindo! <strong>{$nomeUsuario}.</strong>");
    }

    public function destroy()
    {
        return to_route('login.index');
    }
}
