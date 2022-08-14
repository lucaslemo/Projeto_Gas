<?php

use DI\ContainerBuilder;
use Poligas\Aplicacao\Infra\EntityManagerCreator;
use Doctrine\ORM\EntityManagerInterface;

$builder = new ContainerBuilder();
$builder->addDefinitions([
        EntityManagerInterface::class => function () {
            return EntityManagerCreator::createEntityManager();
    }
]);
$container = $builder->build();

return $container;
