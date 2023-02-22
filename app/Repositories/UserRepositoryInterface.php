<?php

namespace App\Repositories;

use Illuminate\Support\Collection;

interface UserRepositoryInterface
{
    public function userById(int $id): object;
    public function updateUsuario(int $id, string $nome, string $img): void;
}