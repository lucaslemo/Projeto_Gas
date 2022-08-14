<?php

use Poligas\Aplicacao\Controller\FormularioLogin;
use Poligas\Aplicacao\Controller\TelaDashBoard;
use Poligas\Aplicacao\Controller\ValidaLogin;

return [
    '/' => FormularioLogin::class,
    '/login' => FormularioLogin::class,
    '/valida-login' => ValidaLogin::class,
    '/dashboard' => TelaDashBoard::class
];