-- MySQL Script generated by MySQL Workbench
-- Tue Aug 16 07:27:50 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome_usuario` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `login_usuario` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `email_usuario` VARCHAR(255) NOT NULL,
  `senha_usuario` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_as_cs' NOT NULL,
  `nivel_usuario` VARCHAR(2) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `data_cadastro` DATETIME NOT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`produtos_tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`produtos_tipo` (
  `id_produto` INT NOT NULL AUTO_INCREMENT,
  `nome_produto` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `marca_produto` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  PRIMARY KEY (`id_produto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tipo_pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tipo_pessoa` (
  `id_tipo_pessoa` INT NOT NULL AUTO_INCREMENT,
  `pessoa` VARCHAR(255) CHARACTER SET 'utf8mb4' NOT NULL,
  PRIMARY KEY (`id_tipo_pessoa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clientes` (
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
  INDEX `clientes_ibfk_01_idx` (`get_id_tipo_pessoa` ASC) VISIBLE,
  CONSTRAINT `clientes_ibfk_01`
    FOREIGN KEY (`get_id_tipo_pessoa`)
    REFERENCES `mydb`.`tipo_pessoa` (`id_tipo_pessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`fornecedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`fornecedores` (
  `id_fornecedor` INT NOT NULL AUTO_INCREMENT,
  `cnpj_fornecedor` VARCHAR(255) NOT NULL,
  `nome_fornecedor` VARCHAR(255) NOT NULL,
  `numero_fornecedor` VARCHAR(45) NOT NULL,
  `cidade_fornecedor` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_fornecedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`produtos_estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`produtos_estoque` (
  `id_produto_estoque` INT NOT NULL AUTO_INCREMENT,
  `get_id_produto_tipo` INT NOT NULL,
  `get_id_fornecedor` INT NOT NULL,
  `data_entrada_estoque` DATETIME NOT NULL,
  `qtd_produto_estoque` INT NOT NULL,
  `valor_produto_compra` DECIMAL NOT NULL,
  PRIMARY KEY (`id_produto_estoque`),
  INDEX `estoque_ibfk_01_idx` (`get_id_produto_tipo` ASC) VISIBLE,
  INDEX `estoque_ibfk_02_idx` (`get_id_fornecedor` ASC) VISIBLE,
  CONSTRAINT `estoque_ibfk_01`
    FOREIGN KEY (`get_id_produto_tipo`)
    REFERENCES `mydb`.`produtos_tipo` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `estoque_ibfk_02`
    FOREIGN KEY (`get_id_fornecedor`)
    REFERENCES `mydb`.`fornecedores` (`id_fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tipo_pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tipo_pagamento` (
  `id_tipo_pagamento` INT NOT NULL AUTO_INCREMENT,
  `pagamento` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_tipo_pagamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`vendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vendas` (
  `id_vendas` INT NOT NULL AUTO_INCREMENT,
  `get_id_cliente` INT NOT NULL,
  `get_id_estoque` INT NOT NULL,
  `get_id_tipo_pagamento` INT NOT NULL,
  `get_id_usuario_vendedor` INT NOT NULL,
  `get_id_entregador` INT NULL,
  `ordem_venda` VARCHAR(255) NOT NULL,
  `valor_produto_venda_und` DECIMAL NOT NULL,
  `data_venda` DATETIME NOT NULL,
  `data_pagamento` DATETIME NOT NULL,
  PRIMARY KEY (`id_vendas`),
  INDEX `compras_cliente_ibfk_01_idx` (`get_id_cliente` ASC) VISIBLE,
  INDEX `vendas_ibfk_02_idx` (`get_id_estoque` ASC) VISIBLE,
  INDEX `vendas_ibfk_03_idx` (`get_id_tipo_pagamento` ASC) VISIBLE,
  INDEX `vendas_ibfk_04_idx` (`get_id_usuario_vendedor` ASC) VISIBLE,
  INDEX `vendas_ibfk_05_idx` (`get_id_entregador` ASC) VISIBLE,
  CONSTRAINT `vendas_ibfk_01`
    FOREIGN KEY (`get_id_cliente`)
    REFERENCES `mydb`.`clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `vendas_ibfk_02`
    FOREIGN KEY (`get_id_estoque`)
    REFERENCES `mydb`.`produtos_estoque` (`id_produto_estoque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `vendas_ibfk_03`
    FOREIGN KEY (`get_id_tipo_pagamento`)
    REFERENCES `mydb`.`tipo_pagamento` (`id_tipo_pagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `vendas_ibfk_04`
    FOREIGN KEY (`get_id_usuario_vendedor`)
    REFERENCES `mydb`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `vendas_ibfk_05`
    FOREIGN KEY (`get_id_entregador`)
    REFERENCES `mydb`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`recupera_senha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`recupera_senha` (
  `id_recupera_senha` INT NOT NULL AUTO_INCREMENT,
  `get_id_usuario` INT NOT NULL,
  `token` VARCHAR(255) NOT NULL,
  `data_pedido` DATETIME NOT NULL,
  `data_troca` DATETIME NULL,
  PRIMARY KEY (`id_recupera_senha`),
  INDEX `recupera_senha_ibfk_01_idx` (`get_id_usuario` ASC) VISIBLE,
  CONSTRAINT `recupera_senha_ibfk_01`
    FOREIGN KEY (`get_id_usuario`)
    REFERENCES `mydb`.`usuarios` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;