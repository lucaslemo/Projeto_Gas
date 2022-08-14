<?php

namespace Poligas\Aplicacao\Helper;

trait RenderHtmlTrait
{
    public function renderizaHtml(string $caminhoTamplate, array $dados): string
    {
        extract($dados);
        ob_start();
        require __DIR__ . '/../../view/' . $caminhoTamplate;
        $html = ob_get_contents();
        ob_clean();

        return $html;
    }
}