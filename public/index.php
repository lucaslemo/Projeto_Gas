<?php

use Poligas\Aplicacao\Controller\Tela404;
use Nyholm\Psr7\Factory\Psr17Factory;
use Nyholm\Psr7Server\ServerRequestCreator;
use Poligas\Aplicacao\Util\ItsLogadoException;
use Poligas\Aplicacao\Util\ItsNotLogadoException;
use Psr\Container\ContainerInterface;
use Psr\Http\Server\RequestHandlerInterface;

require __DIR__ . '/../vendor/autoload.php';

// Recebe a url do request
$url = parse_url($_SERVER['REQUEST_URI']);
$caminho = $url['path'];

// Recebe as rotas da aplicacao
$rotas = require __DIR__ . '/../config/Routes/routes.php';

// Inicializa o container para instanciar as classes de controle
/** @var ContainerInterface $container */
$container = require __DIR__ . '/../config/dependencies.php';

// Implementacao do psr7 pela ferramenta nyholm/psr7-server https://github.com/Nyholm/psr7-server
$psr17Factory = new Psr17Factory();
$creator = new ServerRequestCreator(
    $psr17Factory, // ServerRequestFactory
    $psr17Factory, // UriFactory
    $psr17Factory, // UploadedFileFactory
    $psr17Factory  // StreamFactory
);
$serverRequest = $creator->fromGlobals();

// Verifica se a url exite no array de rotas
if (!array_key_exists($caminho, $rotas)){
    $classeControladora = Tela404::class;
} else {
    // Inicia a sessao
    if (!isset($_SESSION)){
        session_start();
    }
    $classeControladora = $rotas[$caminho];
}

// Instancia classe de controle
/** @var RequestHandlerInterface $controlador */
$controlador = $container->get($classeControladora);

// Faz o processamento do request pelo controlador
try {
    $resposta = $controlador->handle($serverRequest);
} catch (ItsLogadoException | ItsNotLogadoException $exception) {
    $classeControladora = $exception->getRedirect();
    $controlador = $container->get($classeControladora);
    $resposta = $controlador->handle($serverRequest);
}


// Recupera os cabecalhos da resposta
foreach ($resposta->getHeaders() as $name => $values) {
    foreach ($values as $value) {
        header(sprintf('%s: %s', $name, $value), false);
    }
}

// Mostra o html gerado pela classe de controle
echo $resposta->getBody();
