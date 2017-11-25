-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema 4Patas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema 4Patas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `4Patas` DEFAULT CHARACTER SET utf8 ;
USE `4Patas` ;

-- -----------------------------------------------------
-- Table `4Patas`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `4Patas`.`Cliente` (
  `cartão_cidadão` VARCHAR(12) NOT NULL,
  `nome` VARCHAR(64) NOT NULL,
  `email` VARCHAR(64) NOT NULL,
  `telefone` INT NOT NULL,
  `rua` VARCHAR(48) NOT NULL,
  `localidade` VARCHAR(32) NOT NULL,
  `código_postal` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`cartão_cidadão`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `4Patas`.`Animal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `4Patas`.`Animal` (
  `id_animal` INT NOT NULL,
  `nome` VARCHAR(32) NOT NULL,
  `espécie` VARCHAR(32) NOT NULL,
  `raça` VARCHAR(32) NOT NULL,
  `nascimento` DATE NOT NULL,
  `peso` VARCHAR(12) NOT NULL,
  `Cliente_cartão_cidadão` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`id_animal`),
  INDEX `fk_Animal_Cliente1_idx` (`Cliente_cartão_cidadão` ASC),
  CONSTRAINT `fk_Animal_Cliente1`
    FOREIGN KEY (`Cliente_cartão_cidadão`)
    REFERENCES `4Patas`.`Cliente` (`cartão_cidadão`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `4Patas`.`Médico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `4Patas`.`Médico` (
  `id_médico` INT NOT NULL,
  `nome` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`id_médico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `4Patas`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `4Patas`.`Consulta` (
  `id_consulta` INT NOT NULL,
  `data_consulta` DATE NOT NULL,
  `hora_início` TIME NOT NULL,
  `hora_fim` TIME NOT NULL,
  `preço` DECIMAL(6,2) NOT NULL,
  `Médico_id_médico` INT NOT NULL,
  `Animal_id_animal` INT NOT NULL,
  PRIMARY KEY (`id_consulta`),
  INDEX `fk_Consulta_Médico1_idx` (`Médico_id_médico` ASC),
  INDEX `fk_Consulta_Animal1_idx` (`Animal_id_animal` ASC),
  CONSTRAINT `fk_Consulta_Médico1`
    FOREIGN KEY (`Médico_id_médico`)
    REFERENCES `4Patas`.`Médico` (`id_médico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Animal1`
    FOREIGN KEY (`Animal_id_animal`)
    REFERENCES `4Patas`.`Animal` (`id_animal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `4Patas`.`Diagnóstico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `4Patas`.`Diagnóstico` (
  `id_diag` INT NOT NULL,
  `observações` TEXT NOT NULL,
  `Consulta_id_consulta` INT NOT NULL,
  PRIMARY KEY (`id_diag`),
  INDEX `fk_Diagnóstico_Consulta1_idx` (`Consulta_id_consulta` ASC),
  CONSTRAINT `fk_Diagnóstico_Consulta1`
    FOREIGN KEY (`Consulta_id_consulta`)
    REFERENCES `4Patas`.`Consulta` (`id_consulta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `4Patas`.`Medicamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `4Patas`.`Medicamentos` (
  `Diagnóstico_id_diag` INT NOT NULL,
  `id_med` INT NOT NULL,
  `nome` VARCHAR(64) NULL,
  `dosagem` VARCHAR(12) NULL,
  PRIMARY KEY (`Diagnóstico_id_diag`, `id_med`),
  INDEX `fk_Medicamentos_Diagnóstico1_idx` (`Diagnóstico_id_diag` ASC),
  CONSTRAINT `fk_Medicamentos_Diagnóstico1`
    FOREIGN KEY (`Diagnóstico_id_diag`)
    REFERENCES `4Patas`.`Diagnóstico` (`id_diag`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `4Patas`.`Vacinas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `4Patas`.`Vacinas` (
  `Diagnóstico_id_diag` INT NOT NULL,
  `id_vac` INT NOT NULL,
  `nome` VARCHAR(64) NULL,
  `dosagem` VARCHAR(12) NULL,
  PRIMARY KEY (`Diagnóstico_id_diag`, `id_vac`),
  INDEX `fk_Vacinas_Diagnóstico1_idx` (`Diagnóstico_id_diag` ASC),
  CONSTRAINT `fk_Vacinas_Diagnóstico1`
    FOREIGN KEY (`Diagnóstico_id_diag`)
    REFERENCES `4Patas`.`Diagnóstico` (`id_diag`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
