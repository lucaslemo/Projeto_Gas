SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


CREATE DATABASE IF NOT EXISTS poligasdb DEFAULT CHARACTER SET utf8mb4;
USE poligasdb ;

-- -----------------------------------------------------
-- Table poligasdb.`tipos_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tipos_usuario` (
  `id_tipo_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome_tipo_usuario` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table poligasdb.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `get_id_tipo_usuario` INT NOT NULL,
  `nome_usuario` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `login_usuario` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `email_usuario` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `senha_usuario` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `data_cadastro` DATETIME NOT NULL,
  PRIMARY KEY (`id_usuario`),
  CONSTRAINT `usuario_ibfk`
    FOREIGN KEY (`get_id_tipo_usuario`)
    REFERENCES `tipos_usuario` (`id_tipo_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table poligasdb.`tipos_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tipos_produto` (
  `id_produto_tipo` INT NOT NULL AUTO_INCREMENT,
  `nome_tipo_produto` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  PRIMARY KEY (`id_produto_tipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table poligasdb.`marcas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `marcas` (
  `id_marcas` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  PRIMARY KEY (`id_marcas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table poligasdb.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `produtos` (
  `id_produto` INT NOT NULL AUTO_INCREMENT,
  `get_id_produto` INT NOT NULL,
  `get_id_marca` INT NOT NULL,
  PRIMARY KEY (`id_produto`),
  CONSTRAINT `produtos_ibfk_01`
    FOREIGN KEY (`get_id_produto`)
    REFERENCES `tipos_produto` (`id_produto_tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `produtos_ibfk_02`
    FOREIGN KEY (`get_id_marca`)
    REFERENCES `marcas` (`id_marcas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table poligasdb.`tipos_pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tipos_pessoa` (
  `id_tipo_pessoa` INT NOT NULL AUTO_INCREMENT,
  `nome_tipo_pessoa` VARCHAR(255) CHARACTER SET 'utf8mb4' NOT NULL,
  PRIMARY KEY (`id_tipo_pessoa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table poligasdb.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `get_id_tipo_pessoa` INT NOT NULL,
  `nome_cliente` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `num_cliente` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `rua_cliente` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `bairro_cliente` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `cidade_cliente` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `cep_cliente` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `numero_cliente` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  PRIMARY KEY (`id_cliente`),
  CONSTRAINT `clientes_ibfk_01`
    FOREIGN KEY (`get_id_tipo_pessoa`)
    REFERENCES `tipos_pessoa` (`id_tipo_pessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table poligasdb.`fornecedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fornecedores` (
  `id_fornecedor` INT NOT NULL AUTO_INCREMENT,
  `cnpj_fornecedor` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `nome_fornecedor` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `numero_fornecedor` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `cidade_fornecedor` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  PRIMARY KEY (`id_fornecedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table poligasdb.`produtos_estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `produtos_estoque` (
  `id_produto_estoque` INT NOT NULL AUTO_INCREMENT,
  `get_id_produto_tipo` INT NOT NULL,
  `get_id_fornecedor` INT NOT NULL,
  `data_entrada_estoque` DATETIME NOT NULL,
  `qtd_produto_estoque` INT NOT NULL,
  `valor_produto_compra` DECIMAL(15,2) NOT NULL,
  PRIMARY KEY (`id_produto_estoque`),
  CONSTRAINT `estoque_ibfk_01`
    FOREIGN KEY (`get_id_produto_tipo`)
    REFERENCES `produtos` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `estoque_ibfk_02`
    FOREIGN KEY (`get_id_fornecedor`)
    REFERENCES `fornecedores` (`id_fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table poligasdb.`tipos_pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tipos_pagamento` (
  `id_tipo_pagamento` INT NOT NULL AUTO_INCREMENT,
  `nome_tipo_pagamento` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  PRIMARY KEY (`id_tipo_pagamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table poligasdb.`vendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas` (
  `id_vendas` INT NOT NULL AUTO_INCREMENT,
  `get_id_cliente` INT NOT NULL,
  `get_id_estoque` INT NOT NULL,
  `get_id_tipo_pagamento` INT NOT NULL,
  `get_id_usuario_vendedor` INT NOT NULL,
  `get_id_entregador` INT NULL,
  `ordem_venda` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `valor_produto_venda_und` DECIMAL(15,2) NOT NULL,
  `qtd_produto_venda` INT NOT NULL,
  `data_venda` DATETIME NOT NULL,
  `data_pagamento` DATETIME NULL,
  PRIMARY KEY (`id_vendas`),
  CONSTRAINT `vendas_ibfk_01`
    FOREIGN KEY (`get_id_cliente`)
    REFERENCES `clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `vendas_ibfk_02`
    FOREIGN KEY (`get_id_estoque`)
    REFERENCES `produtos_estoque` (`id_produto_estoque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `vendas_ibfk_03`
    FOREIGN KEY (`get_id_tipo_pagamento`)
    REFERENCES `tipos_pagamento` (`id_tipo_pagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `vendas_ibfk_04`
    FOREIGN KEY (`get_id_usuario_vendedor`)
    REFERENCES `usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `vendas_ibfk_05`
    FOREIGN KEY (`get_id_entregador`)
    REFERENCES `usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table poligasdb.`recupera_senha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recupera_senha` (
  `id_recupera_senha` INT NOT NULL AUTO_INCREMENT,
  `get_id_usuario` INT NOT NULL,
  `token` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `data_pedido` DATETIME NOT NULL,
  `data_troca` DATETIME NULL,
  PRIMARY KEY (`id_recupera_senha`),
  CONSTRAINT `recupera_senha_ibfk_01`
    FOREIGN KEY (`get_id_usuario`)
    REFERENCES `usuarios` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
