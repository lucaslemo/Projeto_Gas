-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20-Fev-2023 às 17:06
-- Versão do servidor: 10.4.25-MariaDB
-- versão do PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_poligas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `get_id_tipo_pessoa` int(11) NOT NULL,
  `nome_cliente` varchar(255) NOT NULL,
  `num_cliente` varchar(255) NOT NULL,
  `rua_cliente` varchar(255) NOT NULL,
  `bairro_cliente` varchar(255) NOT NULL,
  `cidade_cliente` varchar(255) NOT NULL,
  `cep_cliente` varchar(255) NOT NULL,
  `numero_cliente` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `get_id_tipo_pessoa`, `nome_cliente`, `num_cliente`, `rua_cliente`, `bairro_cliente`, `cidade_cliente`, `cep_cliente`, `numero_cliente`) VALUES
(1, 1, 'antonio soares', '307', 'rua dos bobos', 'asa norte', 'varzea alegre', '1234-333', '912345432'),
(2, 1, 'joao cancelo', '308', 'rua do cheiro', 'asa sul', 'varzea alegre', '1333-321', '999995432'),
(3, 2, 'restaurante fogo e brasa', '2568', 'rua santo antonio', 'rio', 'varzea alegre', '1265-413', '988654875'),
(4, 2, 'escola saber saber', '2828', 'rua das flores', 'asa norte', 'varzea alegre', '9875-413', '977698575'),
(5, 2, 'restaurante vegano', '785', 'rua lucia almeida', 'rio', 'varzea alegre', '9335-633', '976547576');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `id_fornecedor` int(11) NOT NULL,
  `cnpj_fornecedor` varchar(255) NOT NULL,
  `nome_fornecedor` varchar(255) NOT NULL,
  `numero_fornecedor` varchar(255) NOT NULL,
  `cidade_fornecedor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `fornecedores`
--

INSERT INTO `fornecedores` (`id_fornecedor`, `cnpj_fornecedor`, `nome_fornecedor`, `numero_fornecedor`, `cidade_fornecedor`) VALUES
(1, '12.123.123/1234-12', 'google', '932145436', 'juazeiro do norte'),
(2, '21.321.321/4321-21', 'amazon', '987654567', 'paraiba'),
(3, '65.215.834/1748-32', 'kodak', '957632652', 'barbalha'),
(4, '83.175.810/4321-09', 'digital', '999654769', 'crato');

-- --------------------------------------------------------

--
-- Estrutura da tabela `marcas`
--

CREATE TABLE `marcas` (
  `id_marca` int(11) NOT NULL,
  `marca` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `marcas`
--

INSERT INTO `marcas` (`id_marca`, `marca`) VALUES
(1, 'ultragas'),
(2, 'nacionalgas'),
(3, 'copagas'),
(4, 'liquigas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id_produto` int(11) NOT NULL,
  `get_id_tipo_produto` int(11) NOT NULL,
  `get_id_marca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id_produto`, `get_id_tipo_produto`, `get_id_marca`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 3, 1),
(6, 3, 2),
(7, 3, 3),
(8, 3, 4),
(9, 2, 1),
(10, 2, 2),
(11, 2, 3),
(12, 2, 4),
(13, 4, 1),
(14, 4, 2),
(15, 4, 3),
(16, 4, 4),
(17, 5, 1),
(18, 5, 2),
(19, 5, 3),
(20, 5, 4),
(21, 6, 1),
(22, 6, 2),
(23, 6, 3),
(24, 6, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_estoque`
--

CREATE TABLE `produtos_estoque` (
  `id_produto_estoque` int(11) NOT NULL,
  `get_id_produto` int(11) NOT NULL,
  `get_id_fornecedor` int(11) NOT NULL,
  `data_entrada_estoque` datetime NOT NULL,
  `qtd_produto_estoque` int(11) NOT NULL,
  `valor_produto_compra_und` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos_estoque`
--

INSERT INTO `produtos_estoque` (`id_produto_estoque`, `get_id_produto`, `get_id_fornecedor`, `data_entrada_estoque`, `qtd_produto_estoque`, `valor_produto_compra_und`) VALUES
(1, 21, 4, '2022-11-24 08:44:00', 0, '119.00'),
(2, 11, 3, '2022-11-24 08:26:00', 0, '107.00'),
(3, 7, 2, '2022-11-25 08:39:00', 0, '115.00'),
(4, 5, 4, '2022-11-25 08:21:00', 0, '114.00'),
(5, 24, 4, '2022-11-26 08:25:00', 0, '114.00'),
(6, 8, 2, '2022-11-26 08:46:00', 0, '106.00'),
(7, 18, 1, '2022-11-27 08:24:00', 0, '100.00'),
(8, 12, 2, '2022-11-27 08:18:00', 0, '118.00'),
(9, 19, 2, '2022-11-27 08:21:00', 0, '106.00'),
(10, 2, 2, '2022-11-28 08:37:00', 0, '117.00'),
(11, 18, 3, '2022-11-28 08:29:00', 0, '118.00'),
(12, 9, 4, '2022-11-29 08:07:00', 0, '103.00'),
(13, 22, 3, '2022-11-29 08:02:00', 0, '114.00'),
(14, 8, 4, '2022-11-29 08:38:00', 0, '101.00'),
(95, 7, 1, '2022-12-02 08:59:00', 0, '112.00'),
(96, 19, 4, '2022-12-02 08:22:00', 0, '109.00'),
(97, 13, 1, '2022-12-02 08:54:00', 4, '118.00'),
(98, 8, 2, '2022-11-03 08:26:00', 3, '105.00'),
(99, 3, 2, '2022-12-03 08:55:00', 1, '108.00'),
(100, 15, 1, '2022-11-03 08:49:00', 2, '107.00'),
(101, 15, 1, '2022-12-03 09:53:00', 1, '110.00'),
(102, 8, 2, '2022-12-02 08:53:00', 2, '111.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `recupera_senha`
--

CREATE TABLE `recupera_senha` (
  `id_recupera_senha` int(11) NOT NULL,
  `get_id_usuario` int(11) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `data_pedido` datetime NOT NULL,
  `data_troca` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `recupera_senha`
--

INSERT INTO `recupera_senha` (`id_recupera_senha`, `get_id_usuario`, `hash`, `data_pedido`, `data_troca`) VALUES
(1, 5, '$argon2i$v=19$m=16,t=2,p=1$d2E4bTR5cmZQUmpwUHRUMA$bNkIvb/cH6Qrc4byEHffcQ', '2022-11-30 14:31:41', NULL),
(2, 2, '$argon2i$v=19$m=16,t=2,p=1$d2E4bTR5cmZQUmpwUHRUMA$bNkIvb/cH6Qrc4byEHffcQ', '2022-12-04 14:12:33', '2022-12-04 14:14:03'),
(3, 7, '$argon2i$v=19$m=16,t=2,p=1$d2E4bTR5cmZQUmpwUHRUMA$bNkIvb/cH6Qrc4byEHffcQ', '2022-12-05 12:10:12', '2022-12-05 12:17:10'),
(4, 6, '$argon2i$v=19$m=16,t=2,p=1$d2E4bTR5cmZQUmpwUHRUMA$bNkIvb/cH6Qrc4byEHffcQ', '2022-12-06 06:13:16', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `supervisores`
--

CREATE TABLE `supervisores` (
  `id_supervisor` int(11) NOT NULL,
  `get_id_usuario_gerente` int(11) NOT NULL,
  `get_id_usuario_entregador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `supervisores`
--

INSERT INTO `supervisores` (`id_supervisor`, `get_id_usuario_gerente`, `get_id_usuario_entregador`) VALUES
(1, 1, 4),
(2, 1, 5),
(3, 2, 6),
(4, 3, 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipos_pagamento`
--

CREATE TABLE `tipos_pagamento` (
  `id_tipo_pagamento` int(11) NOT NULL,
  `nome_tipo_pagamento` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipos_pagamento`
--

INSERT INTO `tipos_pagamento` (`id_tipo_pagamento`, `nome_tipo_pagamento`) VALUES
(1, 'dinheiro'),
(2, 'pix'),
(3, 'cartão de crédito'),
(4, 'cartão de débito'),
(5, 'cheque');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipos_pessoa`
--

CREATE TABLE `tipos_pessoa` (
  `id_tipo_pessoa` int(11) NOT NULL,
  `nome_tipo_pessoa` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipos_pessoa`
--

INSERT INTO `tipos_pessoa` (`id_tipo_pessoa`, `nome_tipo_pessoa`) VALUES
(1, 'pessoa fisica'),
(2, 'pessoa juridica');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipos_produto`
--

CREATE TABLE `tipos_produto` (
  `id_tipo_produto` int(11) NOT NULL,
  `nome_tipo_produto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipos_produto`
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
-- Estrutura da tabela `tipos_usuario`
--

CREATE TABLE `tipos_usuario` (
  `id_tipo_usuario` int(11) NOT NULL,
  `nome_tipo_usuario` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipos_usuario`
--

INSERT INTO `tipos_usuario` (`id_tipo_usuario`, `nome_tipo_usuario`) VALUES
(1, 'gerente'),
(2, 'entregador');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `get_id_tipo_usuario` int(11) NOT NULL,
  `nome_usuario` varchar(255) NOT NULL,
  `sobrenome_usuario` varchar(255) NOT NULL,
  `login_usuario` varchar(255) NOT NULL,
  `email_usuario` varchar(255) NOT NULL,
  `senha_usuario` varchar(255) NOT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `status_usuario` tinyint(4) NOT NULL,
  `data_cadastro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `get_id_tipo_usuario`, `nome_usuario`, `sobrenome_usuario`, `login_usuario`, `email_usuario`, `senha_usuario`, `img_path`, `remember_token`, `status_usuario`, `data_cadastro`) VALUES
(1, 1, 'paulo', 'kaynan', 'paulintopatudo', 'paulo@email.com', '$2y$10$SEVdpaU/rGFPNGwQxssqnOAR/hoYDVVr3GzUCkfhAOrqDhjkdkrQm', NULL, NULL, 1, '2022-11-09 16:12:38'),
(2, 1, 'lucas', 'lemos monteiro', 'lucaslemo', 'lucas@email.com', '$2y$10$SEVdpaU/rGFPNGwQxssqnOAR/hoYDVVr3GzUCkfhAOrqDhjkdkrQm', 'profilePhotos/pzLOJsVpTIjipfnTbl74yC8WN16EHRjww9yuoTdn.jpg', 'IBSmhHKDRhKADVoJc4lg4nXAxBGgbUL3WRUG93pFRMb4FQw4JMIYWw0oKkNg', 1, '2022-11-09 16:15:04'),
(3, 1, 'pedro', 'henrique feitosa fernandes', 'pedinpressao', 'pedro@email.com', '$2y$10$SEVdpaU/rGFPNGwQxssqnOAR/hoYDVVr3GzUCkfhAOrqDhjkdkrQm', NULL, NULL, 1, '2022-11-09 16:15:59'),
(4, 2, 'jose', 'pereira e souza', 'jose', 'jose@email.com', '$2y$10$SEVdpaU/rGFPNGwQxssqnOAR/hoYDVVr3GzUCkfhAOrqDhjkdkrQm', NULL, NULL, 1, '2022-11-09 16:17:52'),
(5, 2, 'joao', 'paulo silva', 'joao', 'joao@email.com', '$2y$10$SEVdpaU/rGFPNGwQxssqnOAR/hoYDVVr3GzUCkfhAOrqDhjkdkrQm', NULL, NULL, 1, '2022-11-09 16:23:37'),
(6, 2, 'felipe', 'de oliveira', 'felipe', 'felipe@email.com', '$2y$10$SEVdpaU/rGFPNGwQxssqnOAR/hoYDVVr3GzUCkfhAOrqDhjkdkrQm', NULL, NULL, 1, '2022-11-09 16:24:37'),
(7, 2, 'luiz', 'henrique', 'luiz', 'luiz@email.com', '$2y$10$SEVdpaU/rGFPNGwQxssqnOAR/hoYDVVr3GzUCkfhAOrqDhjkdkrQm', NULL, NULL, 1, '2022-11-09 16:25:13');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`id_vendas`, `get_id_cliente`, `get_id_produto_estoque`, `get_id_tipo_pagamento`, `get_id_usuario_vendedor`, `get_id_entregador`, `ordem_venda`, `valor_produto_venda_und`, `qtd_produto_venda`, `data_venda`, `data_pagamento`) VALUES
(28, 2, 2, 2, 1, 5, '1ccc7d2d968fb345082e4ec3ac3e899b8439c863', '117.00', 1, '2022-11-24 17:32:48', '2022-11-25 18:05:48'),
(29, 2, 1, 2, 1, 5, '1ccc7d2d968fb345082e4ec3ac3e899b8439c863', '144.00', 3, '2022-11-24 17:32:48', '2022-11-25 18:05:48'),
(30, 3, 2, 3, 3, 5, '96bf0138261dde32c30504c09fc9b4c4564bb001', '120.00', 5, '2022-11-24 18:02:48', '2022-11-25 16:36:48'),
(31, 2, 3, 2, 2, 6, 'c0bb6300ed189cbfec23b40feced46529e1412c3', '151.00', 5, '2022-11-25 20:47:48', NULL),
(32, 3, 4, 5, 2, 7, 'b758b58eac19234c7ccda975b2680bbd986addf2', '134.00', 5, '2022-11-25 17:47:48', '2022-11-26 17:55:48'),
(33, 3, 4, 5, 2, 7, 'b758b58eac19234c7ccda975b2680bbd986addf2', '150.00', 3, '2022-11-25 17:47:48', '2022-11-26 17:55:48'),
(34, 3, 4, 5, 2, 7, 'b758b58eac19234c7ccda975b2680bbd986addf2', '134.00', 1, '2022-11-25 17:47:48', '2022-11-26 17:55:48'),
(35, 5, 5, 2, 2, 5, '599d34201b699da246b408619649e3a080997502', '127.00', 1, '2022-11-26 20:35:48', '2022-11-27 17:47:48'),
(36, 5, 5, 2, 2, 5, '599d34201b699da246b408619649e3a080997502', '140.00', 5, '2022-11-26 20:35:48', '2022-11-27 17:47:48'),
(37, 2, 6, 4, 1, 5, '33551bdb1390266c5777519f90929a7953ec6598', '146.00', 1, '2022-11-26 20:36:48', '2022-11-27 17:21:48'),
(38, 5, 6, 3, 1, NULL, '8448922cdd39f3d406c00fa6693b49e0ee9644f0', '133.00', 4, '2022-11-26 18:20:48', '2022-11-27 17:31:48'),
(39, 5, 6, 3, 1, NULL, '8448922cdd39f3d406c00fa6693b49e0ee9644f0', '143.00', 1, '2022-11-26 18:20:48', '2022-11-27 17:31:48'),
(40, 5, 6, 3, 1, NULL, '8448922cdd39f3d406c00fa6693b49e0ee9644f0', '134.00', 5, '2022-11-26 18:20:48', '2022-11-27 17:31:48'),
(41, 2, 8, 3, 2, NULL, '74401afbc45262e30e1243eee27ae8744c13fcbd', '145.00', 2, '2022-11-27 21:04:48', '2022-11-28 17:37:48'),
(42, 5, 9, 3, 3, NULL, 'e00c28495baf44c7df97b75dc9504acd17928fc0', '134.00', 3, '2022-11-27 20:02:48', '2022-11-28 17:07:48'),
(43, 5, 9, 3, 3, NULL, 'e00c28495baf44c7df97b75dc9504acd17928fc0', '125.00', 4, '2022-11-27 20:02:48', '2022-11-28 17:07:48'),
(44, 5, 7, 3, 3, NULL, 'e00c28495baf44c7df97b75dc9504acd17928fc0', '135.00', 2, '2022-11-27 20:02:48', '2022-11-28 17:07:48'),
(45, 1, 7, 2, 2, NULL, '63f31635f844532cdc53233f3e6c2a1ff18f7914', '134.00', 2, '2022-11-27 20:41:48', '2022-11-28 17:59:48'),
(46, 1, 8, 2, 2, NULL, '63f31635f844532cdc53233f3e6c2a1ff18f7914', '147.00', 3, '2022-11-27 20:41:48', '2022-11-28 17:59:48'),
(47, 5, 11, 1, 2, NULL, '63104f2cd56448ed65c220a144d5d20cb4d2db57', '158.00', 3, '2022-11-28 19:48:48', NULL),
(48, 5, 11, 1, 2, NULL, '63104f2cd56448ed65c220a144d5d20cb4d2db57', '153.00', 1, '2022-11-28 19:48:48', NULL),
(49, 5, 10, 2, 2, NULL, '73e1aedeaa4a8ec7300e266cf90d2da4e3a2f3ec', '131.00', 5, '2022-11-28 18:52:48', '2022-11-29 17:07:48'),
(50, 5, 10, 2, 2, NULL, '73e1aedeaa4a8ec7300e266cf90d2da4e3a2f3ec', '143.00', 2, '2022-11-28 18:52:48', '2022-11-29 17:07:48'),
(51, 3, 14, 5, 2, NULL, '10dcb3a4cbf00d877bf0e56a1444d455f0a892f9', '135.00', 3, '2022-11-29 19:41:48', '2022-11-30 17:44:48'),
(52, 5, 14, 1, 2, 5, '8a7d4dba481e61500487573e71ae2f6bb5b94639', '137.00', 2, '2022-11-29 18:44:48', '2022-11-30 17:28:48'),
(53, 2, 13, 5, 1, 4, 'e27c4a4b8add32cd9d96fed8a935d0529c277424', '137.00', 2, '2022-11-29 17:31:48', '2022-11-30 16:49:48'),
(54, 2, 13, 5, 1, 4, 'e27c4a4b8add32cd9d96fed8a935d0529c277424', '154.00', 3, '2022-11-29 17:31:48', '2022-11-30 16:49:48'),
(55, 2, 12, 5, 1, 4, 'e27c4a4b8add32cd9d96fed8a935d0529c277424', '133.00', 5, '2022-11-29 17:31:48', '2022-11-30 16:49:48'),
(56, 4, 95, 2, 2, 5, 'wa7d4dbadjtur6500487573e71ae2f6bb5b94wsp', '137.00', 2, '2023-01-22 18:44:48', '2023-01-22 18:44:48'),
(57, 3, 95, 1, 2, 5, 'vfgd4dbadjt34rrr0487573e71ae2f6bb5b94wsp', '137.00', 2, '2023-01-23 17:44:48', '2023-01-23 18:44:48'),
(58, 3, 96, 3, 2, 5, '23454dbadjt34rrr0487573e71ae2f6bb5b94wsp', '137.00', 2, '2023-01-23 22:44:48', '2023-01-23 22:44:48');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `clientes_ibfk_01` (`get_id_tipo_pessoa`);

--
-- Índices para tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id_fornecedor`);

--
-- Índices para tabela `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id_marca`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_produto`),
  ADD KEY `produtos_ibfk_01` (`get_id_tipo_produto`),
  ADD KEY `produtos_ibfk_02` (`get_id_marca`);

--
-- Índices para tabela `produtos_estoque`
--
ALTER TABLE `produtos_estoque`
  ADD PRIMARY KEY (`id_produto_estoque`),
  ADD KEY `estoque_ibfk_01` (`get_id_produto`),
  ADD KEY `estoque_ibfk_02` (`get_id_fornecedor`);

--
-- Índices para tabela `recupera_senha`
--
ALTER TABLE `recupera_senha`
  ADD PRIMARY KEY (`id_recupera_senha`),
  ADD KEY `recupera_senha_ibfk_01` (`get_id_usuario`);

--
-- Índices para tabela `supervisores`
--
ALTER TABLE `supervisores`
  ADD PRIMARY KEY (`id_supervisor`),
  ADD KEY `supervisores_ibfk_01` (`get_id_usuario_gerente`),
  ADD KEY `supervisores_ibfk_02` (`get_id_usuario_entregador`);

--
-- Índices para tabela `tipos_pagamento`
--
ALTER TABLE `tipos_pagamento`
  ADD PRIMARY KEY (`id_tipo_pagamento`);

--
-- Índices para tabela `tipos_pessoa`
--
ALTER TABLE `tipos_pessoa`
  ADD PRIMARY KEY (`id_tipo_pessoa`);

--
-- Índices para tabela `tipos_produto`
--
ALTER TABLE `tipos_produto`
  ADD PRIMARY KEY (`id_tipo_produto`);

--
-- Índices para tabela `tipos_usuario`
--
ALTER TABLE `tipos_usuario`
  ADD PRIMARY KEY (`id_tipo_usuario`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `usuario_ibfk` (`get_id_tipo_usuario`);

--
-- Índices para tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id_vendas`),
  ADD KEY `vendas_ibfk_01` (`get_id_cliente`),
  ADD KEY `vendas_ibfk_02` (`get_id_produto_estoque`),
  ADD KEY `vendas_ibfk_03` (`get_id_tipo_pagamento`),
  ADD KEY `vendas_ibfk_04` (`get_id_usuario_vendedor`),
  ADD KEY `vendas_ibfk_05` (`get_id_entregador`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `produtos_estoque`
--
ALTER TABLE `produtos_estoque`
  MODIFY `id_produto_estoque` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT de tabela `recupera_senha`
--
ALTER TABLE `recupera_senha`
  MODIFY `id_recupera_senha` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `supervisores`
--
ALTER TABLE `supervisores`
  MODIFY `id_supervisor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tipos_pagamento`
--
ALTER TABLE `tipos_pagamento`
  MODIFY `id_tipo_pagamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tipos_pessoa`
--
ALTER TABLE `tipos_pessoa`
  MODIFY `id_tipo_pessoa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tipos_produto`
--
ALTER TABLE `tipos_produto`
  MODIFY `id_tipo_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `tipos_usuario`
--
ALTER TABLE `tipos_usuario`
  MODIFY `id_tipo_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id_vendas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_01` FOREIGN KEY (`get_id_tipo_pessoa`) REFERENCES `tipos_pessoa` (`id_tipo_pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_01` FOREIGN KEY (`get_id_tipo_produto`) REFERENCES `tipos_produto` (`id_tipo_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `produtos_ibfk_02` FOREIGN KEY (`get_id_marca`) REFERENCES `marcas` (`id_marca`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `produtos_estoque`
--
ALTER TABLE `produtos_estoque`
  ADD CONSTRAINT `estoque_ibfk_01` FOREIGN KEY (`get_id_produto`) REFERENCES `produtos` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `estoque_ibfk_02` FOREIGN KEY (`get_id_fornecedor`) REFERENCES `fornecedores` (`id_fornecedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `recupera_senha`
--
ALTER TABLE `recupera_senha`
  ADD CONSTRAINT `recupera_senha_ibfk_01` FOREIGN KEY (`get_id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `supervisores`
--
ALTER TABLE `supervisores`
  ADD CONSTRAINT `supervisores_ibfk_01` FOREIGN KEY (`get_id_usuario_gerente`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `supervisores_ibfk_02` FOREIGN KEY (`get_id_usuario_entregador`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuario_ibfk` FOREIGN KEY (`get_id_tipo_usuario`) REFERENCES `tipos_usuario` (`id_tipo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `vendas_ibfk_01` FOREIGN KEY (`get_id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vendas_ibfk_02` FOREIGN KEY (`get_id_produto_estoque`) REFERENCES `produtos_estoque` (`id_produto_estoque`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vendas_ibfk_03` FOREIGN KEY (`get_id_tipo_pagamento`) REFERENCES `tipos_pagamento` (`id_tipo_pagamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vendas_ibfk_04` FOREIGN KEY (`get_id_usuario_vendedor`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vendas_ibfk_05` FOREIGN KEY (`get_id_entregador`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
