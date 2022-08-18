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

    public function find_one_by(array $values): Usuario|null
    {
        // Verifica se a funcao foi chamada com um array nao vazio
        if (count($values) === 0){
            return null;
        }

        // Monta a sql base para buscar um usuario
        $sql_code = "SELECT 
                id_usuario, 
                get_tipo_usuario, 
                nome_usuario, 
                login_usuario, 
                email_usuario, 
                senha_usuario, 
                data_cadastro 
            FROM usuarios
            WHERE ";
        
        // Monta os parametros em uma string
        $parametros = '';
        foreach ($values as $key => $value){
            $parametros = $parametros . ":{$key}=? AND ";
        }
    
        // Concatena a sql e prepara o statement
        $sql_code = $sql_code . rtrim($parametros, ' AND ') . ';';
        $stmt = $this->connection->prepare($sql_code);

        foreach ($values as $key => $value){
            $stmt->bindValue($key, $value, \PDO::PARAM_STR);
        }
        // Executa a query
        $stmt->execute();

        // Hidrata o resultado em uma instancia de Usuario
        $usuario = $this->hydrateOneValue($stmt->fetch(\PDO::FETCH_ASSOC));
        return $usuario;
    }

    private function hydrateOneValue(array $datalist): Usuario{
        var_dump($datalist);
        exit();
    }
}