<?php

namespace Poligas\Aplicacao\Controller;

use Poligas\Aplicacao\Helper\RenderHtmlTrait;
use Poligas\Aplicacao\Helper\MessageTrait;
use Nyholm\Psr7\Response;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\RequestHandlerInterface;


class FormularioLogin implements RequestHandlerInterface
{
    use RenderHtmlTrait;
    use MessageTrait;

    public function handle(ServerRequestInterface $request): ResponseInterface
    {
        $html = $this->renderizaHtml('/Login/login-html.php', ['titulo' => 'Login - PoliGás']);
        return new Response(200, [], $html);
    }
}