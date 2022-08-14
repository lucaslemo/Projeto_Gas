<?php

namespace Poligas\Aplicacao\Entity;

use Doctrine\ORM\Mapping\Entity;
use Doctrine\ORM\Mapping\Table;
use Doctrine\ORM\Mapping\Id;
use Doctrine\ORM\Mapping\GeneratedValue;
use Doctrine\ORM\Mapping\Column;

#[Entity]
#[Table(name:"usuarios")]
class Usuario
{
    #[Id, GeneratedValue, Column(type:"integer")]
    private int $id_usuario;

    #[Column(type:"string")]
    private string $nome_usuario;

    #[Column(type:"string")]
    private string $login_usuario;

    #[Column(type:"string")]
    private string $email_usuario;

    #[Column(type:"string")]
    private string $senha_usuario;

    #[Column(type:"string")]
    private string $nivel_usuario;

    public function senhaEstaCorreta(string $senha): bool
    {
        return password_verify($senha, $this->senha_usuario);
    }
}
