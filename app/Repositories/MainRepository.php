<?php

namespace App\Repositories;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Collection;

class MainRepository implements MainRepositoryInterface
{
    public function __construct()
    {
        
    }

    public function tabelaVendas(): Collection
    {
        $subVendas =  DB::table('vendas AS V')
            ->join('clientes AS C', 'C.id_cliente', '=', 'V.get_id_cliente')
            ->join('tipos_pagamento AS TPG', 'TPG.id_tipo_pagamento', '=', 'V.get_id_tipo_pagamento')
            ->join('usuarios AS UV', 'UV.id_usuario', '=', 'V.get_id_usuario_vendedor')
            ->join('usuarios AS UE', 'UE.id_usuario', '=', 'V.get_id_entregador', 'LEFT')
            ->join('produtos_estoque AS PE', 'PE.id_produto_estoque', '=', 'V.get_id_produto_estoque')
            ->join('produtos AS P', 'P.id_produto', '=', 'PE.get_id_produto')
            ->join('tipos_produto AS TP', 'TP.id_tipo_produto', '=', 'P.get_id_tipo_produto')
            ->join('marcas AS M', 'M.id_marca', '=', 'P.get_id_marca')
            ->select(
                'V.ordem_venda AS ordem_de_venda',
                'C.nome_cliente AS cliente',
                DB::raw("CONCAT(UV.nome_usuario, ' ', UV.sobrenome_usuario) AS vendedor"),
                DB::raw("CONCAT(UE.nome_usuario, ' ', UE.sobrenome_usuario) AS entregador"),
                'TP.nome_tipo_produto AS produto',
                'M.marca AS marca',
                'V.qtd_produto_venda AS quantidade',
                'V.valor_produto_venda_und AS valor_unitario',
                DB::raw('SUM(V.valor_produto_venda_und * V.qtd_produto_venda) AS valor_total'),
                'TPG.nome_tipo_pagamento AS tipo_pagamento',
                'V.data_venda AS data_da_venda',
                'V.data_pagamento AS data_do_pagamento'
            )
            ->groupBy('V.id_vendas');

        $tabelaVendas = DB::query()->fromSub($subVendas, 'NV')
            ->select(
                'NV.ordem_de_venda AS ordem_de_venda',
                'NV.cliente AS cliente',
                'NV.vendedor AS vendedor',
                'NV.entregador AS entregador',
                'NV.entregador AS entregador',
                DB::raw('SUM(NV.quantidade) AS quantidade'),
                DB::raw('SUM(NV.valor_total) AS valor_total'),
                'NV.tipo_pagamento AS tipo_pagamento',
                'NV.data_da_venda AS data_da_venda',
                'NV.data_do_pagamento AS data_do_pagamento'
            )
            ->groupBy('NV.ordem_de_venda')->get();

        return $tabelaVendas;
    }
}