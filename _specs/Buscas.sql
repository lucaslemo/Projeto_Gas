-- Busca Usuario
SELECT
	U.id_usuario AS id,
	TU.nome_tipo_usuario AS cargo,
	CONCAT(U.nome_usuario, ' ', U.sobrenome_usuario) AS nome,
	U.login_usuario AS login,
	U.email_usuario AS email,
	U.senha_usuario AS senha,
	U.status_usuario AS `status`,
	U.data_cadastro AS `data`
FROM usuarios AS U
INNER JOIN tipos_usuario AS TU
	ON U.get_id_tipo_usuario = TU.id_tipo_usuario
WHERE U.id_usuario = 1
-- ------------------------------------------------------

-- Lista de Supervisores
SELECT
	S.id_supervisor AS id,
	CONCAT(U.nome_usuario, ' ', U.sobrenome_usuario) AS gerente,
	CONCAT(UE.nome_usuario, ' ', UE.sobrenome_usuario) AS entregador
FROM usuarios AS U
INNER JOIN supervisores AS S
	ON U.id_usuario = S.get_id_usuario_gerente
INNER JOIN usuarios AS UE
	ON S.get_id_usuario_entregador = UE.id_usuario
-- ------------------------------------------------------

-- Vendas
SELECT
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

-- Vendas Por Ordem de venda
SELECT
	NV.ordem_de_venda AS ordem_de_venda,
	NV.cliente AS cliente,
	NV.vendedor AS vendedor,
	NV.entregador AS entregador,
	SUM(NV.quantidade) AS quantidade,
	SUM(NV.valor_total) AS valor_total,
	NV.tipo_pagamento AS tipo_pagamento,
	NV.data_da_venda AS data_da_venda,
	NV.data_do_pagamento AS data_do_pagamento
FROM (SELECT
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
	GROUP BY V.id_vendas) AS NV
GROUP BY NV.ordem_de_venda
-- ------------------------------------------------------

-- Vendas não pagas
SELECT
	V.ordem_venda AS ordem_de_venda,
    C.nome_cliente AS cliente,
	C.numero_cliente AS contato,
    CONCAT(UV.nome_usuario, ' ', UV.sobrenome_usuario) AS vendedor,
    CONCAT(UE.nome_usuario, ' ', UE.sobrenome_usuario) AS entregador,
	SUM(V.qtd_produto_venda) AS quantidade,
	SUM(V.valor_produto_venda_und * V.qtd_produto_venda) AS valor_total
FROM vendas AS V
INNER JOIN clientes AS C
	ON V.get_id_cliente = C.id_cliente
INNER JOIN usuarios AS UV
	ON V.get_id_usuario_vendedor = UV.id_usuario
LEFT JOIN usuarios AS UE
	ON V.get_id_entregador = UE.id_usuario
WHERE V.data_pagamento IS NULL
GROUP BY V.ordem_venda
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
	ON S.get_id_usuario_gerente = U2.id_usuario
WHERE S.get_id_usuario_gerente = 1
-- ------------------------------------------------------

-- Balanço
SELECT
	SUM(PE.qtd_produto_estoque * PE.valor_produto_compra_und) + SUM(V.qtd_produto_venda * PE.valor_produto_compra_und) AS valor_compra,
	SUM(V.qtd_produto_venda * V.valor_produto_venda_und) AS valor_venda,
	SUM(PE.qtd_produto_estoque * PE.valor_produto_compra_und) AS valor_em_estoque,
	SUM(V.qtd_produto_venda * V.valor_produto_venda_und) - (SUM(PE.qtd_produto_estoque * PE.valor_produto_compra_und) + SUM(V.qtd_produto_venda * PE.valor_produto_compra_und)) AS balanco
FROM vendas AS V
RIGHT JOIN produtos_estoque AS PE
	ON V.get_id_produto_estoque = PE.id_produto_estoque
-- ------------------------------------------------------

-- Vendas por tipo de pessoa
SELECT
	COUNT(DISTINCT V.ordem_venda) AS vendas,
	(
        SELECT 
     		COUNT(DISTINCT V.ordem_venda) AS vendas_pf
        FROM vendas AS V
        INNER JOIN clientes AS C 
			ON V.get_id_cliente = C.id_cliente
        WHERE C.get_id_tipo_pessoa = 1
    ) AS vendas_pf,
	(
        SELECT 
     		COUNT(DISTINCT V.ordem_venda) AS vendas_pf
        FROM vendas AS V
        INNER JOIN clientes AS C 
			ON V.get_id_cliente = C.id_cliente
        WHERE C.get_id_tipo_pessoa = 2
    ) AS vendas_pj
FROM vendas AS V

-- Com porcentagem
SELECT
	COUNT(DISTINCT V.ordem_venda) AS vendas,
	(
        SELECT 
     		COUNT(DISTINCT V.ordem_venda) AS vendas_pf
        FROM vendas AS V
        INNER JOIN clientes AS C 
			ON V.get_id_cliente = C.id_cliente
        WHERE C.get_id_tipo_pessoa = 1
    )/COUNT(DISTINCT V.ordem_venda) * 100 AS vendas_pf,
	(
        SELECT 
     		COUNT(DISTINCT V.ordem_venda) AS vendas_pf
        FROM vendas AS V
        INNER JOIN clientes AS C 
			ON V.get_id_cliente = C.id_cliente
        WHERE C.get_id_tipo_pessoa = 2
    )/COUNT(DISTINCT V.ordem_venda) * 100 AS vendas_pj
FROM vendas AS V
-- ------------------------------------------------------

-- Vendas por tipo de pagamento
SELECT
	T.nome_tp AS tipo_pagamento,
	COUNT(T.id_tp) AS qtd
FROM (SELECT
      	V.get_id_tipo_pagamento AS id_tp,
      	TP.nome_tipo_pagamento AS nome_tp
      FROM vendas AS V
      INNER JOIN tipos_pagamento As TP
      	ON V.get_id_tipo_pagamento = TP.id_tipo_pagamento
      GROUP BY V.ordem_venda) AS T
GROUP BY T.nome_tp
-- ------------------------------------------------------

-- Vendas com/sem entregas
SELECT
	(SELECT COUNT(DISTINCT V.ordem_venda) FROM vendas AS V WHERE V.get_id_entregador IS NOT NULL) AS vendas_com,
	(SELECT COUNT(DISTINCT V.ordem_venda) FROM vendas AS V WHERE V.get_id_entregador IS NULL) AS vendas_sem
FROM vendas
LIMIT 1
-- ------------------------------------------------------

-- Produtos mais vendidos
SELECT
	TP.nome_tipo_produto AS produto,
	COUNT(V.id_vendas) AS por_venda
FROM vendas AS V
INNER JOIN produtos_estoque AS PE
	ON V.get_id_produto_estoque = PE.id_produto_estoque
INNER JOIN produtos AS P
	ON PE.get_id_produto = P.id_produto
INNER JOIN tipos_produto AS TP
	ON P.get_id_tipo_produto = TP.id_tipo_produto
GROUP BY TP.id_tipo_produto
-- ------------------------------------------------------