<?php

namespace Poligas\Aplicacao\Helper;

use Poligas\Aplicacao\Util\ItsNotLogadoException;
use Poligas\Aplicacao\Util\ItsLogadoException;

trait ItsLogadoTrait
{
    /**
     * @throws ItsNotLogadoException
     */
    public function verificaLogadoMain(): void
    {
        if (!isset($_SESSION['logado'])){
            throw new ItsNotLogadoException();
        }
    }

    /**
     * @throws ItsLogadoException
     */
    public function verificaLogadoLogin(): void
    {
        if (isset($_SESSION['logado'])){
            throw new ItsLogadoException();
        }
    }
}
