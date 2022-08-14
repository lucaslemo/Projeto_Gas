<?php

namespace Poligas\Aplicacao\Controller;

use Poligas\Aplicacao\Helper\RenderHtmlTrait;
use Poligas\Aplicacao\Helper\MessageTrait;
use Poligas\Aplicacao\Entity\Usuario;
use Nyholm\Psr7\Response;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\RequestHandlerInterface;

use Doctrine\ORM\EntityManagerInterface;

class TelaDashBoard implements RequestHandlerInterface
{
    use RenderHtmlTrait;
    use MessageTrait;
    private $repositorioUsuarios;

    public function __construct(EntityManagerInterface $entityManager) 
    {
        $this->repositorioUsuarios = $entityManager->getRepository(Usuario::class);
    }

    public function handle(ServerRequestInterface $request): ResponseInterface
    {
        $html = $this->renderizaHtml('/Main/dashboard-html.php', ['titulo' => 'Dashboard - PoliGás']);
        return new Response(200, [], $html);
    }
}
