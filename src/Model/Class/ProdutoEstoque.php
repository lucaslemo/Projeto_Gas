<?php

namespace Poligas\Aplicacao\Model\Class;

class ProdutoEstoque
{
    private int $id_produto_estoque;

    private ProdutoTipo $produto_tipo;

    public function __construct(
        private string $valor_produto_estoque,
        private string $lote_produto_estoque
    )
    {}
}
