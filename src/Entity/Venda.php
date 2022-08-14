<?php

namespace Poligas\Aplicacao\Entity;

use Doctrine\ORM\Mapping\Entity;
use Doctrine\ORM\Mapping\Table;
use Doctrine\ORM\Mapping\Id;
use Doctrine\ORM\Mapping\GeneratedValue;
use Doctrine\ORM\Mapping\Column;

#[Entity]
#[Table(name:"vendas")]
class Venda
{
    #[Id, GeneratedValue, Column(type:"integer")]
    private int $id_venda;

    #[Column(type:"integer")]
    private int $get_id_cliente;

    #[Column(type:"integer")]
    private int $get_id_estoque;

    #[Column(type:"string")]
    private string $ordem_compra;

    #[Column(type:"string")]
    private string $data_venda;

    #[Column(type:"string")]
    private string $tipo_de_pagamento;
}
