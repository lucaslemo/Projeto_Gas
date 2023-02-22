<?php

namespace App\Repositories;

use Illuminate\Support\Facades\DB;

class UserRepository implements UserRepositoryInterface
{
    public function __construct()
    {
        
    }

    public function userById(int $id): object
    {
        $usuario =  DB::table('usuarios AS U')
            ->join('tipos_usuario AS TU', 'TU.id_tipo_usuario', '=', 'U.get_id_tipo_usuario')
            ->select(
                'U.nome_usuario AS primeiro_nome',
                'U.sobrenome_usuario AS ultimo_nome',
                'TU.nome_tipo_usuario AS cargo',
                'U.login_usuario AS login',
                'U.email_usuario AS email',
                'U.senha_usuario AS senha',
                'U.status_usuario AS `status`',
                'U.img_path AS img_path'
            )->where('U.id_usuario', '=', $id)->first();

        return $usuario;
    }

    public function updateUsuario(int $id, string $nome, string $imgPath): void
    {
        DB::statement("UPDATE usuarios SET img_path = ? WHERE usuarios.id_usuario = ?", [$imgPath, $id]);
    }
}