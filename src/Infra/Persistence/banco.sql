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
-- Table poligasdb.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome_usuario` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `login_usuario` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `email_usuario` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `senha_usuario` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `nivel_usuario` VARCHAR(2) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `data_cadastro` DATETIME NOT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table poligasdb.`produtos_tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `produtos_tipo` (
  `id_ptoduto_tipo` INT NOT NULL AUTO_INCREMENT,
  `nome_produto` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `marca_produto` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  PRIMARY KEY (`id_ptoduto_tipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table poligasdb.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nome_cliente` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `num_cliente` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `rua_cliente` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `bairro_cliente` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `cidade_cliente` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `cep_cliente` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `numero_cliente` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table poligasdb.`fornecedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fornecedores` (
  `id_fornecedor` INT NOT NULL AUTO_INCREMENT,
  `cnpj_fornecedor` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `nome_fornecedor` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `numero_fornecedor` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `cidade_fornecedor` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  PRIMARY KEY (`id_fornecedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table poligasdb.`produtos_estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `produtos_estoque` (
  `id_ptoduto_tipo_estoque` INT NULL AUTO_INCREMENT,
  `get_id_ptoduto_tipo_tipo` INT NOT NULL,
  `get_id_fornecedor` INT NOT NULL,
  `qtd_produto_estoque` INT NOT NULL,
  `valor_produto_compra` CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `valor_produto_venda` CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `lote` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  PRIMARY KEY (`id_ptoduto_tipo_estoque`),
  INDEX `estoque_ibfk_01_idx` (`get_id_ptoduto_tipo_tipo` ASC) VISIBLE,
  INDEX `estoque_ibfk_02_idx` (`get_id_fornecedor` ASC) VISIBLE,
  CONSTRAINT `estoque_ibfk_01`
    FOREIGN KEY (`get_id_ptoduto_tipo_tipo`)
    REFERENCES `produtos_tipo` (`id_ptoduto_tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `estoque_ibfk_02`
    FOREIGN KEY (`get_id_fornecedor`)
    REFERENCES `fornecedores` (`id_fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table poligasdb.`vendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas` (
  `id_vendas` INT NOT NULL AUTO_INCREMENT,
  `get_id_cliente` INT NOT NULL,
  `get_id_estoque` INT NOT NULL,
  `ordem_compra` INT NOT NULL,
  `data_venda` DATETIME NOT NULL,
  `tipo_de_pagamento` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  PRIMARY KEY (`id_vendas`),
  INDEX `compras_cliente_ibfk_01_idx` (`get_id_cliente` ASC) VISIBLE,
  INDEX `vendas_ibfk_02_idx` (`get_id_estoque` ASC) VISIBLE,
  CONSTRAINT `vendas_ibfk_01`
    FOREIGN KEY (`get_id_cliente`)
    REFERENCES .`clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `vendas_ibfk_02`
    FOREIGN KEY (`get_id_estoque`)
    REFERENCES `produtos_estoque` (`id_ptoduto_tipo_estoque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table poligasdb.`recupera_senha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recupera_senha` (
  `id_recupera_senha` INT NOT NULL AUTO_INCREMENT,
  `token` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `email` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `data_pedido` DATETIME NOT NULL,
  `data_troca` DATETIME NULL,
  PRIMARY KEY (`id_recupera_senha`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
