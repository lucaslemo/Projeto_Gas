<?php

use DI\ContainerBuilder;
use Poligas\Aplicacao\Infra\Persistence\ConnectionCreator;

$builder = new ContainerBuilder();
$builder->addDefinitions([
        \PDO::class => function () {
            return ConnectionCreator::createConnection();
    }
]);
$container = $builder->build();

return $container;
