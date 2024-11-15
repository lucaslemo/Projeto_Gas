<?php

namespace Poligas\Aplicacao\Model\Class;

class Usuario
{
    private int $id_usuario;
    private int $key_tipo_usuario;
    private string $tipo_usuario;
    private string $nome_usuario;
    private string $login_usuario;
    private string $email_usuario;
    private string $senha_usuario;
    private string $data_cadastro_usuario;

    public function __construct(string $login_usuario = null, string $senha_usuario = null){
        $this->login_usuario = $login_usuario;
        $this->senha_usuario = $senha_usuario;
    }

    // Metodos
    public function senhaEstaCorreta(string $senha): bool
    {
        return password_verify($senha, $this->senha_usuario);
    }

    // Get and Seters
    public function set_id(int $id_usuario): void{
        $this->id_usuario = $id_usuario;
    }

    public function get_id(): string{
        return $this->id_usuario;
    }

    public function get_key_tipo_usuario(): string{
        return $this->key_tipo_usuario;
    }

    public function set_key_tipo_usuario(int $novoTipo): void{
        $this->key_tipo_usuario = $novoTipo;
    }

    public function get_tipo_usuario(): string{
        return $this->tipo_usuario;
    }

    public function set_tipo_usuario(string $tipo_usuario): void{
        $this->tipo_usuario = $tipo_usuario;
    }

    public function get_nome(): string{
        return $this->nome_usuario;
    }

    public function set_nome(string $novoNome): void{
        $this->nome_usuario = $novoNome;
    }

    public function get_login(): string{
        return $this->login_usuario;
    }

    public function set_login(string $novoLogin): void{
        $this->login_usuario = $novoLogin;
    }

    public function get_email(): string{
        return $this->email_usuario;
    }

    public function set_email(string $novoEmail): void{
        $this->email_usuario = $novoEmail;
    }

    public function set_senha(string $novaSenha): void{
        $this->senha_usuario = $novaSenha;
    }

    public function get_data_cadastro(): string{
        return $this->data_cadastro_usuario;
    }

    public function set_data_cadastro($data_cadastro_usuario): void{
        $this->data_cadastro_usuario = $data_cadastro_usuario;
    }
}
