<?php

namespace Poligas\Aplicacao\Infra\Persistence;

Class ConnectionCreator{

    public static function createConnection(): \PDO
    {
        $path = __DIR__ . '/db.sqlite';
        $connection =  new \PDO('sqlite:' . $path);
        $connection->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);

        return $connection;
    }
}
