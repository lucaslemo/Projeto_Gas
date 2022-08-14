<?php

namespace Poligas\Aplicacao\Infra\Repository;

use Poligas\Aplicacao\Model\Repository\RepositoryInterface;
use Poligas\Aplicacao\Model\Class\Usuario;

class PdoUserRepository implements RepositoryInterface
{
    private \PDO $connection;
    
    public function __construct(\PDO $connection)
    {
        $this->connection = $connection;
    }

    public function inserir(Usuario $usuario): bool{
        return false;
    }
    public function remover(Usuario $usuario): bool{
        return false;
    }
    public function atualizar(Usuario $usuario): bool{
        return false;
    }
    public function buscar(Usuario $usuario): bool{
        return false;
    }
}