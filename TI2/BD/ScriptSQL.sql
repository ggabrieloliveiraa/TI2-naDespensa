-- MySQL Script generated by MySQL Workbench
-- sex 16 set 2022 02:26:12
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema naDespensa
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema naDespensa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `naDespensa` ;
USE `naDespensa` ;

-- -----------------------------------------------------
-- Table `naDespensa`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `naDespensa`.`Usuario` (
  `Nome de usuario` VARCHAR(45) NOT NULL,
  `Senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Nome de usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `naDespensa`.`Receita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `naDespensa`.`Receita` (
  `id` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Serve` INT NOT NULL,
  `Dificuldade` VARCHAR(45) NOT NULL,
  `Tempo de preparo` INT NOT NULL,
  `Modo de preparo` MEDIUMTEXT NOT NULL,
  `Imagens` BLOB NOT NULL,
  `Categoria` VARCHAR(45) NULL,
  `Usuario_Nome_Publicador` VARCHAR(45) NOT NULL,
  `Usuario_Nome_Curtiu` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `Usuario_Nome_Publicador`),
  INDEX `fk_Receita_Usuário1_idx` (`Usuario_Nome_Publicador` ASC) VISIBLE,
  INDEX `fk_Receita_Usuário2_idx` (`Usuario_Nome_Curtiu` ASC) VISIBLE,
  CONSTRAINT `fk_Receita_Usuário1`
    FOREIGN KEY (`Usuario_Nome_Publicador`)
    REFERENCES `naDespensa`.`Usuario` (`Nome de usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Receita_Usuário2`
    FOREIGN KEY (`Usuario_Nome_Curtiu`)
    REFERENCES `naDespensa`.`Usuario` (`Nome de usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `naDespensa`.`Ingrediente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `naDespensa`.`Ingrediente` (
  `Nome` VARCHAR(45) NOT NULL,
  `Usuario_Nome_PublicadorIngrediente` VARCHAR(45) NOT NULL,
  `Receita_id` INT NOT NULL,
  `Receita_Usuario_Nome_PublicadorReceita` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Nome`, `Usuario_Nome_PublicadorIngrediente`, `Receita_id`, `Receita_Usuario_Nome_PublicadorReceita`),
  INDEX `fk_Ingrediente_Usuário1_idx` (`Usuario_Nome_PublicadorIngrediente` ASC) VISIBLE,
  INDEX `fk_Ingrediente_Receita1_idx` (`Receita_id` ASC, `Receita_Usuario_Nome_PublicadorReceita` ASC) VISIBLE,
  CONSTRAINT `fk_Ingrediente_Usuário1`
    FOREIGN KEY (`Usuario_Nome_PublicadorIngrediente`)
    REFERENCES `naDespensa`.`Usuario` (`Nome de usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ingrediente_Receita1`
    FOREIGN KEY (`Receita_id` , `Receita_Usuario_Nome_PublicadorReceita`)
    REFERENCES `naDespensa`.`Receita` (`id` , `Usuario_Nome_Publicador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `naDespensa`.`table2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `naDespensa`.`table2` (
)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;