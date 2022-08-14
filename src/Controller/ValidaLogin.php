<?php

namespace Poligas\Aplicacao\Controller;

use Poligas\Aplicacao\Entity\Usuario;
use Poligas\Aplicacao\Helper\MessageTrait;
use Doctrine\ORM\EntityManagerInterface;
use Psr\Http\Server\RequestHandlerInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Message\ResponseInterface;
use Nyholm\Psr7\Response;

class ValidaLogin implements RequestHandlerInterface
{
    use MessageTrait;
    private $repositorioUsuarios;

    public function __construct(EntityManagerInterface $entityManager) 
    {
        $this->repositorioUsuarios = $entityManager->getRepository(Usuario::class);
    }

    public function handle(ServerRequestInterface $request): ResponseInterface
    {
        $username = \strip_tags($request->getParsedBody()['username']);
        $senha = \strip_tags($request->getParsedBody()['senha']);

        return new Response(200, ['Location' => '/dashboard'], "");
    }
}
