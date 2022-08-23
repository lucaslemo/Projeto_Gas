<?php

namespace Poligas\Aplicacao\Controller;

use Poligas\Aplicacao\Helper\MessageTrait;
use Psr\Http\Server\RequestHandlerInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Message\ResponseInterface;
use Nyholm\Psr7\Response;
use Poligas\Aplicacao\Helper\ItsLogado;
use Poligas\Aplicacao\Helper\ItsLogadoTrait;
use Poligas\Aplicacao\Infra\Repository\PdoUserRepository;


class ValidaLogin implements RequestHandlerInterface
{
    use MessageTrait;
    use ItsLogadoTrait;

    private $repositorioUsuarios;

    public function __construct(\PDO $connection) 
    {
        $this->repositorioUsuarios = new PdoUserRepository($connection);
    }

    public function handle(ServerRequestInterface $request): ResponseInterface
    {
        // Verifica se o usuario ja esta logado
        $this->verificaLogadoLogin();

        // Dados do POST
        $login = \strip_tags($request->getParsedBody()['login']);
        $senha = \strip_tags($request->getParsedBody()['senha']);

        // Busca no repositótio
        try {
            $usuario = $this->repositorioUsuarios->find_one_by(['login_usuario' => $login]);
        } catch (\PDOException $e) {
            echo $e->getMessage();
            exit();
        }

        // Verifica se a senha esta correta e redireciona
        if ($usuario === null || !$usuario->senhaEstaCorreta($senha)){
            $this->mostraMensagem("Login ou Senha Inválidos!", "danger");
            return new Response(302, ['Location' => '/login'], "");
        }
        $_SESSION['logado'] = true;
        $_SESSION['nome'] = $usuario->get_nome();
        $_SESSION['id'] = $usuario->get_id();
        $_SESSION['tipo'] = $usuario->get_tipo_usuario();
        $_SESSION['tipo_id'] = $usuario->get_key_tipo_usuario();
        return new Response(200, ['Location' => '/dashboard'], "");
        //password_hash('paulo', PASSWORD_ARGON2I);
    }
}
