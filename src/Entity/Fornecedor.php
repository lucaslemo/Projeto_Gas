<?php

namespace Poligas\Aplicacao\Entity;

use Doctrine\ORM\Mapping\Entity;
use Doctrine\ORM\Mapping\Table;
use Doctrine\ORM\Mapping\Id;
use Doctrine\ORM\Mapping\GeneratedValue;
use Doctrine\ORM\Mapping\Column;

#[Entity]
#[Table(name:"fornecedores")]
class Fornecedor
{
    #[Id, GeneratedValue, Column(type:"integer")]
    private int $id_fornecedor;

    #[Column(type:"string")]
    private string $cnpj_fornecedor;

    #[Column(type:"string")]
    private string $nome_fornecedor;

    #[Column(type:"string")]
    private string $numero_fornecedor;

    #[Column(type:"string")]
    private string $cidade_fornecedor;
}
