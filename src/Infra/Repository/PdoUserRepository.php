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

    public function find_one_by(array $values): Usuario|null
    {
        // Verifica se a funcao foi chamada com um array nao vazio
        if (count($values) === 0){
            return null;
        }

        // Monta a sql base para buscar um usuario
        $sql_code = "SELECT 
                usuarios.id_usuario,
                usuarios.get_id_tipo_usuario,
                usuarios.nome_usuario,
                usuarios.login_usuario,
                usuarios.email_usuario,
                usuarios.senha_usuario,
                usuarios.data_cadastro,
                tipos_usuario.nome_tipo_usuario
            FROM usuarios
            INNER JOIN tipos_usuario
                ON usuarios.get_id_tipo_usuario = tipos_usuario.id_tipo_usuario 
            WHERE ";

        // Monta os parametros em uma string
        foreach ($values as $key => $value){
            $sql_code = $sql_code . "usuarios.{$key}" . ' = ' . ":{$key} AND ";
        }
        $sql_code = rtrim($sql_code, ' AND ') . ';';

        // Bind values
        $stmt = $this->connection->prepare($sql_code);
        foreach ($values as $key => $value){
            $stmt->bindValue($key, $value, \PDO::PARAM_STR);
        }

        // Executa a query
        $stmt->execute();
        $datalist = $stmt->fetch(\PDO::FETCH_ASSOC);

        // Verifica se o usuario foi encontrado
        if ($datalist === false){
            return null;
        }

        // Hidrata o resultado em uma instancia de Usuario
        $usuario = $this->hydrateOneValue($datalist);
        return $usuario;
    }

    private function hydrateOneValue(array $datalist): Usuario{
        $usuario = new Usuario($datalist['login_usuario'], $datalist['senha_usuario']);
        $usuario->set_id($datalist['id_usuario']);
        $usuario->set_nome($datalist['nome_usuario']);
        $usuario->set_tipo_usuario($datalist['nome_tipo_usuario']);
        $usuario->set_key_tipo_usuario($datalist['get_id_tipo_usuario']);
        $usuario->set_email($datalist['email_usuario']);
        $usuario->set_data_cadastro($datalist['data_cadastro']);
        return $usuario;
    }
}