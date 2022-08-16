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

-----------------------------------------------------------

INSERT INTO `usuarios` (`get_tipo_usuario`, `nome_usuario`, `login_usuario`, `email_usuario`,`senha_usuario`, `data_cadastro`) VALUES (
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


