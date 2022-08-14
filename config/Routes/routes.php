<?php

use Poligas\Aplicacao\Controller\Estoque;
use Poligas\Aplicacao\Controller\FormularioLogin;
use Poligas\Aplicacao\Controller\TelaDashBoard;
use Poligas\Aplicacao\Controller\ValidaLogin;
use Poligas\Aplicacao\Controller\Logout;

return [
    '/' => FormularioLogin::class,
    '/login' => FormularioLogin::class,
    '/logout' => Logout::class,
    '/valida-login' => ValidaLogin::class,
    '/dashboard' => TelaDashBoard::class,
    '/estoque' => Estoque::class
];