<?php

namespace Poligas\Aplicacao\Util;

use Poligas\Aplicacao\Controller\FormularioLogin;

class ItsNotLogadoException extends \DomainException
{
    public function getRedirect(): string
    {
        return FormularioLogin::class;
    }
}
