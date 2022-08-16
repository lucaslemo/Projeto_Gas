<?php

namespace Poligas\Aplicacao\Controller;

use Poligas\Aplicacao\Helper\RenderHtmlTrait;
use Poligas\Aplicacao\Helper\MessageTrait;
use Nyholm\Psr7\Response;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\RequestHandlerInterface;


class Estoque implements RequestHandlerInterface
{
    use RenderHtmlTrait;
    use MessageTrait;
    private $repositorio;

    public function __construct(\PDO $connection) 
    {
        
    }

    public function handle(ServerRequestInterface $request): ResponseInterface
    {
        $html = $this->renderizaHtml('/Main/estoque-html.php', ['titulo' => 'Estoque - Poligás']);
        return new Response(200, [], $html);
    }
}
