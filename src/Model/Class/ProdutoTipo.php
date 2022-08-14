<?php

namespace Poligas\Aplicacao\Model\Class;

class ProdutoTipo
{
    private int $id_produto_tipo;

    public function __construct(
        private string $nome_produto_tipo,
        private string $marca_produto_tipo,
        private string $tipo_produto_tipo,
        private string $valor_produto_tipo
    ){}

    // Get ans Seters
    public function id_produto_tipo(): int
    {
        return $this->id_produto_tipo;
    }
}
