-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema base_a
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema base_a
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `base_a` DEFAULT CHARACTER SET utf8 ;
USE `base_a` ;

-- -----------------------------------------------------
-- Table `base_a`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `base_a`.`person` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cpf` VARCHAR(11) NOT NULL,
  `name` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `base_a`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `base_a`.`address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `person_id` INT NOT NULL,
  `zipcode` VARCHAR(8) NOT NULL,
  `number` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`, `person_id`),
  INDEX `fk_endereco_pessoa_idx` (`person_id` ASC),
  CONSTRAINT `fk_endereco_pessoa`
    FOREIGN KEY (`person_id`)
    REFERENCES `base_a`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `base_a`.`institution`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `base_a`.`institution` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `company_name` VARCHAR(45) NOT NULL,
  `cnpj` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `base_a`.`debts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `base_a`.`debts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `person_id` INT NOT NULL,
  `institution_id` INT NOT NULL,
  `value` DECIMAL NOT NULL,
  `register_date` DATETIME NOT NULL,
  `payment_date` DATETIME NULL,
  PRIMARY KEY (`id`, `person_id`, `institution_id`),
  INDEX `fk_dividas_pessoa1_idx` (`person_id` ASC),
  INDEX `fk_dividas_instituicao1_idx` (`institution_id` ASC),
  CONSTRAINT `fk_dividas_pessoa1`
    FOREIGN KEY (`person_id`)
    REFERENCES `base_a`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dividas_instituicao1`
    FOREIGN KEY (`institution_id`)
    REFERENCES `base_a`.`institution` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
