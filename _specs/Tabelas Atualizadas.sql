-- phpMyAdmin SQL Dump
-- version 4.3.7
-- http://www.phpmyadmin.net
--
-- Host: mysql04-farm2.uni5.net
-- Tempo de geração: 25/11/2022 às 14:45
-- Versão do servidor: 10.2.36-MariaDB-log
-- Versão do PHP: 5.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de dados: `bessapontes20`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(11) NOT NULL,
  `get_id_tipo_pessoa` int(11) NOT NULL,
  `nome_cliente` varchar(255) NOT NULL,
  `num_cliente` varchar(255) NOT NULL,
  `rua_cliente` varchar(255) NOT NULL,
  `bairro_cliente` varchar(255) NOT NULL,
  `cidade_cliente` varchar(255) NOT NULL,
  `cep_cliente` varchar(255) NOT NULL,
  `numero_cliente` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Fazendo dump de dados para tabela `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `get_id_tipo_pessoa`, `nome_cliente`, `num_cliente`, `rua_cliente`, `bairro_cliente`, `cidade_cliente`, `cep_cliente`, `numero_cliente`) VALUES
(1, 1, 'lucas lemos', '307', 'rua dos bobos', 'asa norte', 'varzea alegre', '1234-333', '912345432'),
(2, 1, 'pedro henrique', '308', 'rua do cheiro', 'asa sul', 'varzea alegre', '1333-321', '999995432');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedores`
--

CREATE TABLE IF NOT EXISTS `fornecedores` (
  `id_fornecedor` int(11) NOT NULL,
  `cnpj_fornecedor` varchar(255) NOT NULL,
  `nome_fornecedor` varchar(255) NOT NULL,
  `numero_fornecedor` varchar(255) NOT NULL,
  `cidade_fornecedor` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Fazendo dump de dados para tabela `fornecedores`
--

INSERT INTO `fornecedores` (`id_fornecedor`, `cnpj_fornecedor`, `nome_fornecedor`, `numero_fornecedor`, `cidade_fornecedor`) VALUES
(1, '12.123.123/1234-12', 'google', '932145436', 'juazeiro do norte'),
(2, '21.321.321/4321-21', 'amazon', '987654567', 'paraiba');

-- --------------------------------------------------------

--
-- Estrutura para tabela `marcas`
--

CREATE TABLE IF NOT EXISTS `marcas` (
  `id_marca` int(11) NOT NULL,
  `marca` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Fazendo dump de dados para tabela `marcas`
--

INSERT INTO `marcas` (`id_marca`, `marca`) VALUES
(1, 'ultragas'),
(2, 'nacionalgas'),
(3, 'copagas'),
(4, 'liquigas');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE IF NOT EXISTS `produtos` (
  `id_produto` int(11) NOT NULL,
  `get_id_tipo_produto` int(11) NOT NULL,
  `get_id_marca` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Fazendo dump de dados para tabela `produtos`
--

INSERT INTO `produtos` (`id_produto`, `get_id_tipo_produto`, `get_id_marca`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 3, 1),
(6, 3, 2),
(7, 3, 3),
(8, 3, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos_estoque`
--

CREATE TABLE IF NOT EXISTS `produtos_estoque` (
  `id_produto_estoque` int(11) NOT NULL,
  `get_id_produto` int(11) NOT NULL,
  `get_id_fornecedor` int(11) NOT NULL,
  `data_entrada_estoque` datetime NOT NULL,
  `qtd_produto_estoque` int(11) NOT NULL,
  `valor_produto_compra_und` decimal(15,2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Fazendo dump de dados para tabela `produtos_estoque`
--

INSERT INTO `produtos_estoque` (`id_produto_estoque`, `get_id_produto`, `get_id_fornecedor`, `data_entrada_estoque`, `qtd_produto_estoque`, `valor_produto_compra_und`) VALUES
(1, 5, 1, '2022-11-15 10:29:20', 35, '150.00'),
(2, 5, 2, '2022-11-17 10:29:20', 30, '200.00'),
(3, 6, 1, '2022-11-17 10:29:20', 8, '350.00'),
(4, 2, 2, '2022-11-20 10:29:20', 5, '500.00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `recupera_senha`
--

CREATE TABLE IF NOT EXISTS `recupera_senha` (
  `id_recupera_senha` int(11) NOT NULL,
  `get_id_usuario` int(11) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `data_pedido` datetime NOT NULL,
  `data_troca` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `supervisores`
--

CREATE TABLE IF NOT EXISTS `supervisores` (
  `id_supervisor` int(11) NOT NULL,
  `get_id_usuario_gerente` int(11) NOT NULL,
  `get_id_usuario_entregador` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Fazendo dump de dados para tabela `supervisores`
--

INSERT INTO `supervisores` (`id_supervisor`, `get_id_usuario_gerente`, `get_id_usuario_entregador`) VALUES
(1, 1, 4),
(2, 1, 5),
(3, 2, 6),
(4, 3, 7);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipos_pagamento`
--

CREATE TABLE IF NOT EXISTS `tipos_pagamento` (
  `id_tipo_pagamento` int(11) NOT NULL,
  `nome_tipo_pagamento` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Fazendo dump de dados para tabela `tipos_pagamento`
--

INSERT INTO `tipos_pagamento` (`id_tipo_pagamento`, `nome_tipo_pagamento`) VALUES
(1, 'dinheiro'),
(2, 'pix'),
(3, 'cartão de crédito'),
(4, 'cartão de débito'),
(5, 'cheque');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipos_pessoa`
--

CREATE TABLE IF NOT EXISTS `tipos_pessoa` (
  `id_tipo_pessoa` int(11) NOT NULL,
  `nome_tipo_pessoa` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Fazendo dump de dados para tabela `tipos_pessoa`
--

INSERT INTO `tipos_pessoa` (`id_tipo_pessoa`, `nome_tipo_pessoa`) VALUES
(1, 'pessoa fisica'),
(2, 'pessoa juridica');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipos_produto`
--

CREATE TABLE IF NOT EXISTS `tipos_produto` (
  `id_tipo_produto` int(11) NOT NULL,
  `nome_tipo_produto` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Fazendo dump de dados para tabela `tipos_produto`
--

INSERT INTO `tipos_produto` (`id_tipo_produto`, `nome_tipo_produto`) VALUES
(1, 'p2'),
(2, 'p5'),
(3, 'p13'),
(4, 'p20'),
(5, 'p45'),
(6, 'p90');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipos_usuario`
--

CREATE TABLE IF NOT EXISTS `tipos_usuario` (
  `id_tipo_usuario` int(11) NOT NULL,
  `nome_tipo_usuario` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Fazendo dump de dados para tabela `tipos_usuario`
--

INSERT INTO `tipos_usuario` (`id_tipo_usuario`, `nome_tipo_usuario`) VALUES
(1, 'gerente'),
(2, 'entregador');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `get_id_tipo_usuario` int(11) NOT NULL,
  `nome_usuario` varchar(255) NOT NULL,
  `sobrenome_usuario` varchar(255) NOT NULL,
  `login_usuario` varchar(255) NOT NULL,
  `email_usuario` varchar(255) NOT NULL,
  `senha_usuario` varchar(255) NOT NULL,
  `status_usuario` tinyint(4) NOT NULL,
  `data_cadastro` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Fazendo dump de dados para tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `get_id_tipo_usuario`, `nome_usuario`, `sobrenome_usuario`, `login_usuario`, `email_usuario`, `senha_usuario`, `status_usuario`, `data_cadastro`) VALUES
(1, 1, 'paulo', 'kaynan', 'paulintopatudo', 'paulo@email.com', '$argon2i$v=19$m=65536,t=4,p=1$L3Q1c2hjeTljYmQ4bTBJRA$AcW+6b9+fQMlVqCp3Zmz+T7kuzFZNbiQI6pEvAacYo4', 1, '2022-11-09 16:12:38'),
(2, 1, 'lucas', 'lemos monteiro', 'lucaslemo', 'lucas@email.com', '$argon2i$v=19$m=65536,t=4,p=1$L3Q1c2hjeTljYmQ4bTBJRA$AcW+6b9+fQMlVqCp3Zmz+T7kuzFZNbiQI6pEvAacYo4', 1, '2022-11-09 16:15:04'),
(3, 1, 'pedro', 'henrique feitosa fernandes', 'pedinpressao', 'pedro@email.com', '$argon2i$v=19$m=65536,t=4,p=1$L3Q1c2hjeTljYmQ4bTBJRA$AcW+6b9+fQMlVqCp3Zmz+T7kuzFZNbiQI6pEvAacYo4', 1, '2022-11-09 16:15:59'),
(4, 2, 'jose', 'pereira e souza', 'jose', 'jose@email.com', '$argon2i$v=19$m=65536,t=4,p=1$L3Q1c2hjeTljYmQ4bTBJRA$AcW+6b9+fQMlVqCp3Zmz+T7kuzFZNbiQI6pEvAacYo4', 1, '2022-11-09 16:17:52'),
(5, 2, 'joao', 'paulo silva', 'joao', 'joao@email.com', '$argon2i$v=19$m=65536,t=4,p=1$L3Q1c2hjeTljYmQ4bTBJRA$AcW+6b9+fQMlVqCp3Zmz+T7kuzFZNbiQI6pEvAacYo4', 1, '2022-11-09 16:23:37'),
(6, 2, 'felipe', 'de oliveira', 'felipe', 'felipe@email.com', '$argon2i$v=19$m=65536,t=4,p=1$L3Q1c2hjeTljYmQ4bTBJRA$AcW+6b9+fQMlVqCp3Zmz+T7kuzFZNbiQI6pEvAacYo4', 1, '2022-11-09 16:24:37'),
(7, 2, 'luiz', 'henrique', 'luiz', 'luiz@email.com', '$argon2i$v=19$m=65536,t=4,p=1$L3Q1c2hjeTljYmQ4bTBJRA$AcW+6b9+fQMlVqCp3Zmz+T7kuzFZNbiQI6pEvAacYo4', 1, '2022-11-09 16:25:13');

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendas`
--

CREATE TABLE IF NOT EXISTS `vendas` (
  `id_vendas` int(11) NOT NULL,
  `get_id_cliente` int(11) NOT NULL,
  `get_id_produto_estoque` int(11) NOT NULL,
  `get_id_tipo_pagamento` int(11) NOT NULL,
  `get_id_usuario_vendedor` int(11) NOT NULL,
  `get_id_entregador` int(11) DEFAULT NULL,
  `ordem_venda` varchar(255) NOT NULL,
  `valor_produto_venda_und` decimal(15,2) NOT NULL,
  `qtd_produto_venda` int(11) NOT NULL,
  `data_venda` datetime NOT NULL,
  `data_pagamento` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Fazendo dump de dados para tabela `vendas`
--

INSERT INTO `vendas` (`id_vendas`, `get_id_cliente`, `get_id_produto_estoque`, `get_id_tipo_pagamento`, `get_id_usuario_vendedor`, `get_id_entregador`, `ordem_venda`, `valor_produto_venda_und`, `qtd_produto_venda`, `data_venda`, `data_pagamento`) VALUES
(1, 1, 1, 1, 1, NULL, '1', '220.00', 2, '2022-11-20 10:29:20', '2022-11-20 10:29:20'),
(2, 2, 1, 2, 1, NULL, '2', '220.00', 3, '2022-11-20 10:29:20', '2022-11-20 10:29:20'),
(3, 2, 3, 2, 1, NULL, '2', '400.00', 2, '2022-11-20 10:29:20', '2022-11-20 10:29:20');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`), ADD KEY `clientes_ibfk_01` (`get_id_tipo_pessoa`);

--
-- Índices de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id_fornecedor`);

--
-- Índices de tabela `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id_marca`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_produto`), ADD KEY `produtos_ibfk_01` (`get_id_tipo_produto`), ADD KEY `produtos_ibfk_02` (`get_id_marca`);

--
-- Índices de tabela `produtos_estoque`
--
ALTER TABLE `produtos_estoque`
  ADD PRIMARY KEY (`id_produto_estoque`), ADD KEY `estoque_ibfk_01` (`get_id_produto`), ADD KEY `estoque_ibfk_02` (`get_id_fornecedor`);

--
-- Índices de tabela `recupera_senha`
--
ALTER TABLE `recupera_senha`
  ADD PRIMARY KEY (`id_recupera_senha`), ADD KEY `recupera_senha_ibfk_01` (`get_id_usuario`);

--
-- Índices de tabela `supervisores`
--
ALTER TABLE `supervisores`
  ADD PRIMARY KEY (`id_supervisor`), ADD KEY `supervisores_ibfk_01` (`get_id_usuario_gerente`), ADD KEY `supervisores_ibfk_02` (`get_id_usuario_entregador`);

--
-- Índices de tabela `tipos_pagamento`
--
ALTER TABLE `tipos_pagamento`
  ADD PRIMARY KEY (`id_tipo_pagamento`);

--
-- Índices de tabela `tipos_pessoa`
--
ALTER TABLE `tipos_pessoa`
  ADD PRIMARY KEY (`id_tipo_pessoa`);

--
-- Índices de tabela `tipos_produto`
--
ALTER TABLE `tipos_produto`
  ADD PRIMARY KEY (`id_tipo_produto`);

--
-- Índices de tabela `tipos_usuario`
--
ALTER TABLE `tipos_usuario`
  ADD PRIMARY KEY (`id_tipo_usuario`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`), ADD KEY `usuario_ibfk` (`get_id_tipo_usuario`);

--
-- Índices de tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id_vendas`), ADD KEY `vendas_ibfk_01` (`get_id_cliente`), ADD KEY `vendas_ibfk_02` (`get_id_produto_estoque`), ADD KEY `vendas_ibfk_03` (`get_id_tipo_pagamento`), ADD KEY `vendas_ibfk_04` (`get_id_usuario_vendedor`), ADD KEY `vendas_ibfk_05` (`get_id_entregador`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de tabela `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de tabela `produtos_estoque`
--
ALTER TABLE `produtos_estoque`
  MODIFY `id_produto_estoque` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de tabela `recupera_senha`
--
ALTER TABLE `recupera_senha`
  MODIFY `id_recupera_senha` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `supervisores`
--
ALTER TABLE `supervisores`
  MODIFY `id_supervisor` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de tabela `tipos_pagamento`
--
ALTER TABLE `tipos_pagamento`
  MODIFY `id_tipo_pagamento` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de tabela `tipos_pessoa`
--
ALTER TABLE `tipos_pessoa`
  MODIFY `id_tipo_pessoa` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de tabela `tipos_produto`
--
ALTER TABLE `tipos_produto`
  MODIFY `id_tipo_produto` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de tabela `tipos_usuario`
--
ALTER TABLE `tipos_usuario`
  MODIFY `id_tipo_usuario` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id_vendas` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `clientes`
--
ALTER TABLE `clientes`
ADD CONSTRAINT `clientes_ibfk_01` FOREIGN KEY (`get_id_tipo_pessoa`) REFERENCES `tipos_pessoa` (`id_tipo_pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
ADD CONSTRAINT `produtos_ibfk_01` FOREIGN KEY (`get_id_tipo_produto`) REFERENCES `tipos_produto` (`id_tipo_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `produtos_ibfk_02` FOREIGN KEY (`get_id_marca`) REFERENCES `marcas` (`id_marca`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `produtos_estoque`
--
ALTER TABLE `produtos_estoque`
ADD CONSTRAINT `estoque_ibfk_01` FOREIGN KEY (`get_id_produto`) REFERENCES `produtos` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `estoque_ibfk_02` FOREIGN KEY (`get_id_fornecedor`) REFERENCES `fornecedores` (`id_fornecedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `recupera_senha`
--
ALTER TABLE `recupera_senha`
ADD CONSTRAINT `recupera_senha_ibfk_01` FOREIGN KEY (`get_id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `supervisores`
--
ALTER TABLE `supervisores`
ADD CONSTRAINT `supervisores_ibfk_01` FOREIGN KEY (`get_id_usuario_gerente`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `supervisores_ibfk_02` FOREIGN KEY (`get_id_usuario_entregador`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `usuarios`
--
ALTER TABLE `usuarios`
ADD CONSTRAINT `usuario_ibfk` FOREIGN KEY (`get_id_tipo_usuario`) REFERENCES `tipos_usuario` (`id_tipo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `vendas`
--
ALTER TABLE `vendas`
ADD CONSTRAINT `vendas_ibfk_01` FOREIGN KEY (`get_id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `vendas_ibfk_02` FOREIGN KEY (`get_id_produto_estoque`) REFERENCES `produtos_estoque` (`id_produto_estoque`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `vendas_ibfk_03` FOREIGN KEY (`get_id_tipo_pagamento`) REFERENCES `tipos_pagamento` (`id_tipo_pagamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `vendas_ibfk_04` FOREIGN KEY (`get_id_usuario_vendedor`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `vendas_ibfk_05` FOREIGN KEY (`get_id_entregador`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
