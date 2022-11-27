-- Vendas
SELECT
    V.id_vendas AS id,
    V.ordem_venda AS ordem_de_venda,
    C.nome_cliente AS cliente,
    CONCAT(UV.nome_usuario, ' ', UV.sobrenome_usuario) AS vendedor,
    CONCAT(UE.nome_usuario, ' ', UE.sobrenome_usuario) AS entregador,
    TP.nome_tipo_produto AS produto,
    M.marca AS marca,
    V.qtd_produto_venda AS quantidade,
    V.valor_produto_venda_und AS valor_unitario,
    SUM(V.valor_produto_venda_und * V.qtd_produto_venda) AS valor_total,
    TPG.nome_tipo_pagamento AS tipo_pagamento,
    V.data_venda AS data_da_venda,
    V.data_pagamento AS data_do_pagamento
FROM vendas AS V
INNER JOIN clientes AS C
	ON V.get_id_cliente = C.id_cliente
INNER JOIN tipos_pagamento AS TPG
	ON V.get_id_tipo_pagamento = TPG.id_tipo_pagamento
INNER JOIN usuarios AS UV
	ON V.get_id_usuario_vendedor = UV.id_usuario
LEFT JOIN usuarios AS UE
	ON V.get_id_entregador = UE.id_usuario
INNER JOIN produtos_estoque AS PE
	ON V.get_id_produto_estoque = PE.id_produto_estoque
INNER JOIN produtos AS P
	ON PE.get_id_produto = P.id_produto
INNER JOIN tipos_produto AS TP
	ON P.get_id_tipo_produto = TP.id_tipo_produto
INNER JOIN marcas AS M
	ON P.get_id_marca = M.id_marca
GROUP BY V.id_vendas

-- ------------------------------------------------------

-- Produtos em estoque
SELECT
    TP.nome_tipo_produto AS produto,
    M.marca AS marca,
    SUM(PE.qtd_produto_estoque) AS quantidade,
    (MIN(PE.valor_produto_compra_und) + MAX(PE.valor_produto_compra_und)) / 2 AS valor_medio,
    (PE.qtd_produto_estoque * PE.valor_produto_compra_und) AS valor_total,
    MIN(PE.data_entrada_estoque) AS data_lote_mais_antigo,
    MAX(PE.data_entrada_estoque) AS data_lote_mais_novo
FROM produtos_estoque AS PE
INNER JOIN produtos AS P
	ON PE.get_id_produto = P.id_produto
INNER JOIN tipos_produto AS TP
	ON P.get_id_tipo_produto = TP.id_tipo_produto
INNER JOIN marcas AS M
	ON P.get_id_marca = M.id_marca
WHERE PE.qtd_produto_estoque > 0
GROUP BY PE.get_id_produto

-- ------------------------------------------------------

-- Lista Usuarios Entregadores (Gerente X)
SELECT
    U.id_usuario AS id,
    CONCAT(U.nome_usuario, ' ', U.sobrenome_usuario) AS nome,
    U.email_usuario AS email,
    U.data_cadastro AS data_cadastro,
    CONCAT(U2.nome_usuario, ' ', U2.sobrenome_usuario) AS gerente
FROM usuarios AS U
INNER JOIN supervisores AS S
	ON U.id_usuario = S.get_id_usuario_entregador
INNER JOIN usuarios AS U2
	ON S1.get_id_usuario_gerente = U2.id_usuario
WHERE S.get_id_usuario_gerente = X.id_usuario

-- ------------------------------------------------------

-- Balanço
SELECT
    SUM(V.valor_produto_venda_und * V.qtd_produto_venda) AS vendido,
    SUM(PE.valor_produto_compra_und * PE.qtd_produto_estoque) AS comprado,
    SUM(V.valor_produto_venda_und * V.qtd_produto_venda) - SUM(PE.valor_produto_compra_und * PE.qtd_produto_estoque) AS valor_total
FROM vendas as V
INNER JOIN produtos_estoque AS PE