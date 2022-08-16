<?php

namespace Poligas\Aplicacao\Controller;

use Poligas\Aplicacao\Entity\Usuario;
use Poligas\Aplicacao\Helper\MessageTrait;
use Psr\Http\Server\RequestHandlerInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Message\ResponseInterface;
use Nyholm\Psr7\Response;
use Poligas\Aplicacao\Infra\Repository\PdoUserRepository;

class ValidaLogin implements RequestHandlerInterface
{
    use MessageTrait;
    private $repositorioUsuarios;

    public function __construct(\PDO $connection) 
    {
        $this->repositorioUsuarios = new PdoUserRepository($connection);
    }

    public function handle(ServerRequestInterface $request): ResponseInterface
    {
        $username = \strip_tags($request->getParsedBody()['login']);
        $senha = \strip_tags($request->getParsedBody()['senha']);
        echo $username . "<br>";
        echo $senha . "<br>";
        exit();
        //password_hash('paulo', PASSWORD_ARGON2I);
        return new Response(200, ['Location' => '/dashboard'], "");
    }
}
