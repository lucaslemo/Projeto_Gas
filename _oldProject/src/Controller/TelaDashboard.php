<?php

namespace Poligas\Aplicacao\Controller;

use Poligas\Aplicacao\Helper\RenderHtmlTrait;
use Poligas\Aplicacao\Helper\MessageTrait;
use Nyholm\Psr7\Response;
use Poligas\Aplicacao\Helper\ItsLogadoTrait;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\RequestHandlerInterface;


class TelaDashBoard implements RequestHandlerInterface
{
    use RenderHtmlTrait;
    use MessageTrait;
    use ItsLogadoTrait;

    private $repositorio;

    public function __construct(\PDO $connection) 
    {
        
    }

    public function handle(ServerRequestInterface $request): ResponseInterface
    {
        // Verifica se o usuario esta logado
        $this->verificaLogadoMain();

        $arrayNome = explode(' ', $_SESSION['nome']);
        $nomeAbreviado = strtoupper(substr($arrayNome[0], 0, 1)) . '. ' . ucfirst($arrayNome[1]);
        $nomeCompleto = ucfirst($arrayNome[0]) . ' ' . ucfirst($arrayNome[1]);
        $tipoUsuario = $_SESSION['tipo'];
        $html = $this->renderizaHtml(
            '/Main/dashboard-html.php', 
            [
                'titulo' => 'Dashboard - Poligás',
                'nomeAbreviado' => $nomeAbreviado,
                'nomeCompleto' => $nomeCompleto,
                'tipoUsuario' => $tipoUsuario
            ]
        );
        return new Response(200, [], $html);
    }
}
