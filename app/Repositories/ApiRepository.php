<?php

namespace App\Repositories;

use Illuminate\Support\Facades\DB;

use function PHPUnit\Framework\isEmpty;

class ApiRepository implements ApiRepositoryInterface
{
    public function autoUser(string $login, string $senha): bool
    {
        $result =  DB::select(
            "SELECT U.id_usuario AS id, U.senha_usuario AS senha FROM usuarios AS U WHERE U.login_usuario = ?;",
            [$login]
        );
        if (isEmpty($result)){
            return false;
        }
        return true;
    }
}

