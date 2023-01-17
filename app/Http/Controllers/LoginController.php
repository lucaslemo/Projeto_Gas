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

    public function validaLogin(Request $request)
    {
        $login = $request->input('login');
        $senha = $request->input('senha');
        $usuario = DB::table('usuarios')->where('login_usuario', $login)->first();

        if(is_null($usuario) || !password_verify($senha, $usuario->senha_usuario)){
            $request->session()->flash('mensagem.login', 'Usuário ou senha Incorretos');
            return redirect('/login');
        }

        $nomeUsuario = ucfirst($usuario->nome_usuario);
        $request->session()->flash('mensagem.dashboard', "Bem Vindo! <strong>{$nomeUsuario}.</strong>");
        return redirect('/dashboard');
    }

    public function logout()
    {
        return redirect('/login');
    }
}
