<?php

namespace Poligas\Aplicacao\Controller;

use Psr\Http\Server\RequestHandlerInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Message\ResponseInterface;
use Nyholm\Psr7\Response;

class Logout implements RequestHandlerInterface
{
    public function handle(ServerRequestInterface $request): ResponseInterface
    {
        session_unset();
        session_destroy();
        return new Response(200, ['Location' => '/login'], "");
    }
}
