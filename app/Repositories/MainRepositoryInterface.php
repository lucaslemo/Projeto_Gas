<?php

namespace App\Repositories;

use Illuminate\Support\Collection;

interface MainRepositoryInterface
{
    public function tabelaVendas(): Collection;
}