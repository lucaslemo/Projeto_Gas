<?php

namespace Poligas\Aplicacao\Model\Repository;

use Poligas\Aplicacao\Model\Class\Usuario;

interface RepositoryInterface
{

    public function inserir(Usuario $usuario): bool;
    public function remover(Usuario $usuario): bool;
    public function atualizar(Usuario $usuario): bool;
    public function buscar(Usuario $usuario): bool;
}