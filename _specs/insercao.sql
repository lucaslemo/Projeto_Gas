USE poligasdb;

INSERT INTO `tipos_usuario` (`nome_tipo_usuario`) VALUES
('Administrador'),
('Gerente'),
('Entregador');

INSERT INTO `tipos_produto` (`nome_tipo_produto`) VALUES
('P2'),
('P5'),
('P13'),
('P20'),
('P45'),
('P90');

INSERT INTO `tipos_pessoa` (`nome_tipo_pessoa`) VALUES
('Pessoa Fisica'),
('Pessoa Juridica');

INSERT INTO `tipos_pagamento` (`nome_tipo_pagamento`) VALUES
('Dinheiro'),
('Pix'),
('Cartão de Crédito'),
('Cartão de Débito'),
('Cheque');

INSERT INTO `usuarios` (`get_id_tipo_usuario`, `nome_usuario`, `login_usuario`, `email_usuario`,`senha_usuario`, `data_cadastro`) VALUES 
(
    1, 
    'Paulo Kaynan', 
    'paulintopatudo', 
    'paulo@email.com', 
    '$argon2i$v=19$m=65536,t=4,p=1$L3Q1c2hjeTljYmQ4bTBJRA$AcW+6b9+fQMlVqCp3Zmz+T7kuzFZNbiQI6pEvAacYo4',
    NOW()
);

INSERT INTO `marcas` (`marca`) VALUES
('ULTRAGAS'),
('NACIONALGAS'),
('COPAGAS'),
('LIQUIGAS');

INSERT INTO `clientes` (`get_id_tipo_pessoa`, `nome_cliente`, `num_cliente`, `rua_cliente`,`bairro_cliente`, `cidade_cliente`, `cep_cliente`, `numero_cliente`) VALUES
(
    1, 
    'Lucas Lemos', 
    '307', 
    'Rua dos Bobos', 
    'Asa Norte',
    'Varzea Alegre',
    '1234-333',
    '912345432'
),
(
    1, 
    'Pedro Henrique', 
    '308', 
    'Rua do cheiro', 
    'Asa Sul',
    'Varzea Alegre',
    '1333-321',
    '999995432'
);

INSERT INTO `fornecedores` (`cnpj_fornecedor`, `nome_fornecedor`, `numero_fornecedor`, `cidade_fornecedor`) VALUES
(
    '12.123.123/1234-12',
    'Google',
    '932145436',
    'Juazeiro do Norte'
),
(
    '21.321.321/4321-21',
    'Amazon',
    '987654567',
    'Paraiba'
);

INSERT INTO `produtos` (`get_id_produto`, `get_id_marca`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(3, 1),
(3, 2),
(3, 3),
(3, 4);

INSERT INTO `produtos_estoque` (`get_id_produto_tipo`, `get_id_fornecedor`, `data_entrada_estoque`, `qtd_produto_estoque`, `valor_produto_compra`) VALUES
(5, 1, SUBDATE(NOW(), 7), 40, 150),
(5, 2, SUBDATE(NOW(), 5), 30, 200),
(6, 1, SUBDATE(NOW(), 5), 10, 350),
(2, 2, SUBDATE(NOW(), 2), 5, 500);

INSERT INTO `vendas` (`get_id_cliente`, `get_id_estoque`, `get_id_tipo_pagamento`, `get_id_usuario_vendedor`, `ordem_venda`, `valor_produto_venda_und`, `qtd_produto_venda`, `data_venda`, `data_pagamento`) VALUES
(1, 1, 1, 1, '1', 220, 2, SUBDATE(NOW(), 2), SUBDATE(NOW(), 2)),
(2, 1, 2, 1, '2', 220, 3, SUBDATE(NOW(), 2), SUBDATE(NOW(), 2)),
(2, 3, 2, 1, '2', 400, 2, SUBDATE(NOW(), 2), SUBDATE(NOW(), 2));

UPDATE `produtos_estoque`
SET `qtd_produto_estoque` = `qtd_produto_estoque` - 2
WHERE `produtos_estoque`.id_produto_estoque = 1;

UPDATE `produtos_estoque`
SET `qtd_produto_estoque` = `qtd_produto_estoque` - 3
WHERE `produtos_estoque`.id_produto_estoque = 1;

UPDATE `produtos_estoque`
SET `qtd_produto_estoque` = `qtd_produto_estoque` - 2
WHERE `produtos_estoque`.id_produto_estoque = 3;
