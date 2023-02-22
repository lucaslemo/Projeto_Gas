<?php

namespace App\Repositories;

use Illuminate\Support\Collection;

interface ApiRepositoryInterface
{
    public function autoUser(string $login, string $senha): bool;

}