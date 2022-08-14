<?php

namespace Poligas\Aplicacao\Entity;

use Doctrine\ORM\Mapping\Entity;
use Doctrine\ORM\Mapping\Table;
use Doctrine\ORM\Mapping\Id;
use Doctrine\ORM\Mapping\GeneratedValue;
use Doctrine\ORM\Mapping\Column;

#[Entity]
#[Table(name:"estoque")]
class Estoque
{
    #[Id, GeneratedValue, Column(type:"integer")]
    private int $id_estoque;

    #[Column(type:"integer")]
    private int $get_id_produto;

    #[Column(type:"integer")]
    private int $get_id_fornecedor;

    #[Column(type:"string")]
    private string $valor_produto;

    #[Column(type:"string")]
    private string $lote;
}
