<?php

namespace Poligas\Aplicacao\Controller;

use Poligas\Aplicacao\Helper\RenderHtmlTrait;
use Nyholm\Psr7\Response;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\RequestHandlerInterface;

class Tela404 implements RequestHandlerInterface
{
    use RenderHtmlTrait;

    public function handle(ServerRequestInterface $request): ResponseInterface
    {
        $protocolo = 'http://';
        $host = $request->getServerParams()['HTTP_HOST'];
        $uri = $request->getServerParams()['REQUEST_URI'];
        $pagina = $protocolo . $host . $uri;
        $html = $this->renderizaHtml(
            '/Erro/404-html.php', 
            [
                'titulo' => '404 - Página Não Encontrada', 
                'pagina' => $pagina
            ]
        );

        return new Response(404, [], $html);
    }
}
