<?php

namespace Poligas\Aplicacao\Util;

use Poligas\Aplicacao\Controller\TelaDashBoard;


class ItsLogadoException extends \DomainException
{
    public function getRedirect(): string
    {
        return TelaDashBoard::class;
    }
}
