<?php

namespace Poligas\Aplicacao\Entity;

use Doctrine\ORM\Mapping\Entity;
use Doctrine\ORM\Mapping\Table;
use Doctrine\ORM\Mapping\Id;
use Doctrine\ORM\Mapping\GeneratedValue;
use Doctrine\ORM\Mapping\Column;

#[Entity]
#[Table(name:"clientes")]
class Cliente
{
    #[Id, GeneratedValue, Column(type:"integer")]
    private int $id_cliente;

    #[Column(type:"string")]
    private string $nome_cliente;

    #[Column(type:"string")]
    private string $num_cliente;

    #[Column(type:"string")]
    private string $rua_cliente;

    #[Column(type:"string")]
    private string $bairro_cliente;

    #[Column(type:"string")]
    private string $cidade_cliente;

    #[Column(type:"string")]
    private string $cep_cliente;

    #[Column(type:"string")]
    private string $numero_cliente;
}
