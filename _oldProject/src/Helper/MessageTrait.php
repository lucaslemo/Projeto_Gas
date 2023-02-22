<?php

namespace Poligas\Aplicacao\Helper;

trait MessageTrait
{
    public function mostraMensagem(string $mensagem, string $mensagem_tipo): void
    {
        $_SESSION['mensagem'] = $mensagem;
        $_SESSION['tipo-mensagem'] = $mensagem_tipo;
    }
}