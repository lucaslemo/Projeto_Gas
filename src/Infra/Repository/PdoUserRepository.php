<?php

namespace Poligas\Aplicacao\Infra\Repository;

use Exception;
use Poligas\Aplicacao\Model\Repository\RepositoryInterface;
use Poligas\Aplicacao\Model\Class\Usuario;

class PdoUserRepository implements RepositoryInterface
{
    private \PDO $connection;
    
    public function __construct(\PDO $connection)
    {
        $this->connection = $connection;
    }

    public function find_login(string $login): object
    {
        $sql_code = "SELECT id_usuario, get_tipo_usuario, nome_usuario, login_usuario, email_usuario, senha_usuario, data_cadastro FROM usuarios WHERE login_usuario=?;";
        $stmt = $this->connection->prepare($sql_code);
        $stmt->bindValue(1, $login, \PDO::PARAM_STR);
        $stmt->execute();
        $loginData = $stmt->fetchAll(\PDO::FETCH_ASSOC);
        if (count($loginData) === 0){
            throw new Exception('Não encontrado');
        }
        $usuario = new Usuario($loginData[0]['login_usuario']);
        // Continua
        return $usuario;
    }
}