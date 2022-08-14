<?php

namespace Poligas\Aplicacao\Model\Class;

class Usuario
{
    private int $id_usuario;

    public function __construct(
        private string $nome_usuario,
        private string $login_usuario,
        private string $email_usuario,
        private string $senha_usuario,
        private string $nivel_usuario
    ){}

    // Metodos
    public function senhaEstaCorreta(string $senha): bool
    {
        return password_verify($senha, $this->senha_usuario);
    }

    // Get and Seters
    
}
