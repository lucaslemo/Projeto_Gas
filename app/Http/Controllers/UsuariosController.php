<?php

namespace App\Http\Controllers;

use App\Repositories\UserRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UsuariosController extends Controller
{
    public function __construct(private UserRepository $repository)
    {
        
    }

    public function show(Request $request){
        $mensagem = $request->session()->get('mensagem.usuario');
        return response(view('usuario.show')->with('titulo', 'Dashboard')
            ->with('userId', $request->route('usuario'))
            ->with('mensagem', $mensagem));
    }

    public function update(Request $request){
        $id = Auth::id();
        $nomeCompleto = $request->input('nome_completo');
        $imgPath = null;
        if (!is_null($request->file('foto_perfil'))){
            $imgPath = $request->file('foto_perfil')->store('profilePhotos', 'public');
        }
        $this->repository->updateUsuario($id, $nomeCompleto, $imgPath);
        return to_route('usuario.show', ['usuario' => $id])
            ->with('mensagem.usuario', "Usuario Editado com Sucesso!");
    }
}
