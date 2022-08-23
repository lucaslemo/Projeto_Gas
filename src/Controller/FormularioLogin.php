<?php

namespace Poligas\Aplicacao\Controller;

use Poligas\Aplicacao\Helper\RenderHtmlTrait;
use Nyholm\Psr7\Response;
use Poligas\Aplicacao\Helper\ItsLogadoTrait;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\RequestHandlerInterface;


class FormularioLogin implements RequestHandlerInterface
{
    use RenderHtmlTrait;
    use ItsLogadoTrait;

    public function handle(ServerRequestInterface $request): ResponseInterface
    {
        // Verifica se o usuario ja esta logado
        $this->verificaLogadoLogin();

        // Renderiza o formulário
        $html = $this->renderizaHtml('/Login/login-html.php', ['titulo' => 'Login - Poligás']);
        return new Response(200, [], $html);
    }
}