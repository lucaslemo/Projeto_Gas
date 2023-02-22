<?php

namespace Poligas\Aplicacao\Infra\Persistence;

Class ConnectionCreator
{
    public static function createConnection(): \PDO
    {
        try {
            // Conexao com o mysql
            $host = 'localhost';
            $dbName = 'poligasdb';
            $username = 'root';
            $password = '';
            $connection =  new \PDO(
                'mysql:host=' . $host . ';dbname=' . $dbName, 
                $username, 
                $password
            );
            $connection->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);

            return $connection;
        } catch (\PDOException $e) {
            echo $e->getMessage() . '<br>';
        }
    }
}
