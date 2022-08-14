<?php

namespace Poligas\Aplicacao\Entity;

use Doctrine\ORM\Mapping\Entity;
use Doctrine\ORM\Mapping\Table;
use Doctrine\ORM\Mapping\Id;
use Doctrine\ORM\Mapping\GeneratedValue;
use Doctrine\ORM\Mapping\Column;

#[Entity]
#[Table(name:"produtos")]
class Produto
{
    #[Id, GeneratedValue, Column(type:"integer")]
    private int $id_produto;

    #[Column(type:"string")]
    private string $nome_produto;

    #[Column(type:"string")]
    private string $marca_produto;

    #[Column(type:"string")]
    private string $tipo_produto;

    #[Column(type:"string")]
    private string $valor_produto;
}
