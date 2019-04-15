-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema base_a
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `base_a` ;

-- -----------------------------------------------------
-- Schema base_a
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `base_a` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema base_b
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `base_b` ;

-- -----------------------------------------------------
-- Schema base_b
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `base_b` ;
-- -----------------------------------------------------
-- Schema auth_base
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `auth_base` ;

-- -----------------------------------------------------
-- Schema auth_base
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `auth_base` ;
USE `base_a` ;

-- -----------------------------------------------------
-- Table `base_a`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `base_a`.`person` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cpf` VARCHAR(11) NOT NULL,
  `name` VARCHAR(255) NULL,
  PRIMARY KEY (`id`, `cpf`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC))
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
  `cnpj` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `base_a`.`debts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `base_a`.`debts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `person_id` INT NOT NULL,
  `institution_id` INT NOT NULL,
  `value` FLOAT NOT NULL,
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

USE `base_b` ;

-- -----------------------------------------------------
-- Table `base_b`.`personal_score`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `base_b`.`personal_score` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cpf` VARCHAR(11) NOT NULL,
  `age` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `cpf`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `base_b`.`goods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `base_b`.`goods` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `person_id` INT NOT NULL,
  `description` VARCHAR(150) NOT NULL,
  `value` FLOAT NOT NULL,
  PRIMARY KEY (`id`, `person_id`),
  INDEX `fk_goods_person_idx` (`person_id` ASC),
  CONSTRAINT `fk_goods_person`
    FOREIGN KEY (`person_id`)
    REFERENCES `base_b`.`personal_score` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `base_b`.`addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `base_b`.`addresses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `person_id` INT NOT NULL,
  `zipcode` VARCHAR(8) NOT NULL,
  `number` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`, `person_id`),
  INDEX `fk_address_person1_idx` (`person_id` ASC),
  CONSTRAINT `fk_address_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `base_b`.`personal_score` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `base_b`.`source_of_income`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `base_b`.`source_of_income` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `person_id` INT NOT NULL,
  `value` FLOAT NOT NULL,
  `description` VARCHAR(150) NULL,
  `periodicity` INT NOT NULL,
  PRIMARY KEY (`id`, `person_id`),
  INDEX `fk_source_of_income_person1_idx` (`person_id` ASC),
  CONSTRAINT `fk_source_of_income_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `base_b`.`personal_score` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `auth_base` ;

-- -----------------------------------------------------
-- Table `auth_base`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auth_base`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(500) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `base_a`.`person`
-- -----------------------------------------------------
START TRANSACTION;
USE `base_a`;
INSERT INTO `base_a`.`person` (`id`, `cpf`, `name`) VALUES (DEFAULT, '00000000191', 'José da Silva');
INSERT INTO `base_a`.`person` (`id`, `cpf`, `name`) VALUES (DEFAULT, '00000014141', 'Maria Gonçalves');

COMMIT;


-- -----------------------------------------------------
-- Data for table `base_a`.`address`
-- -----------------------------------------------------
START TRANSACTION;
USE `base_a`;
INSERT INTO `base_a`.`address` (`id`, `person_id`, `zipcode`, `number`) VALUES (DEFAULT, 1, '52000000', '33 A');
INSERT INTO `base_a`.`address` (`id`, `person_id`, `zipcode`, `number`) VALUES (DEFAULT, 2, '51000000', '1037');
INSERT INTO `base_a`.`address` (`id`, `person_id`, `zipcode`, `number`) VALUES (DEFAULT, 2, '51100000', '487');

COMMIT;


-- -----------------------------------------------------
-- Data for table `base_a`.`institution`
-- -----------------------------------------------------
START TRANSACTION;
USE `base_a`;
INSERT INTO `base_a`.`institution` (`id`, `company_name`, `cnpj`) VALUES (DEFAULT, 'Itau', '607011900001');

COMMIT;


-- -----------------------------------------------------
-- Data for table `base_a`.`debts`
-- -----------------------------------------------------
START TRANSACTION;
USE `base_a`;
INSERT INTO `base_a`.`debts` (`id`, `person_id`, `institution_id`, `value`, `register_date`, `payment_date`) VALUES (DEFAULT, 1, 1, 5000, '2019-02-17', NULL);
INSERT INTO `base_a`.`debts` (`id`, `person_id`, `institution_id`, `value`, `register_date`, `payment_date`) VALUES (DEFAULT, 1, 1, 7000, '2017-05-02', '2019-01-10');
INSERT INTO `base_a`.`debts` (`id`, `person_id`, `institution_id`, `value`, `register_date`, `payment_date`) VALUES (DEFAULT, 2, 1, 20000, '2015-08-10', '2019-04-01');

COMMIT;


-- -----------------------------------------------------
-- Data for table `base_b`.`personal_score`
-- -----------------------------------------------------
START TRANSACTION;
USE `base_b`;
INSERT INTO `base_b`.`personal_score` (`id`, `cpf`, `age`, `name`) VALUES (DEFAULT, '00000000191', '27', 'José da Silva');
INSERT INTO `base_b`.`personal_score` (`id`, `cpf`, `age`, `name`) VALUES (DEFAULT, '00000014141', '30', 'Maria Gonçalves');

COMMIT;


-- -----------------------------------------------------
-- Data for table `base_b`.`goods`
-- -----------------------------------------------------
START TRANSACTION;
USE `base_b`;
INSERT INTO `base_b`.`goods` (`id`, `person_id`, `description`, `value`) VALUES (DEFAULT, 1, 'Car - Fiat Uno 2014 4p', 25000);
INSERT INTO `base_b`.`goods` (`id`, `person_id`, `description`, `value`) VALUES (DEFAULT, 1, 'Apartment - 70m2', 300000);
INSERT INTO `base_b`.`goods` (`id`, `person_id`, `description`, `value`) VALUES (DEFAULT, 2, 'Car - Corolla 2016 4p', 55000);
INSERT INTO `base_b`.`goods` (`id`, `person_id`, `description`, `value`) VALUES (DEFAULT, 2, 'Apartment - 140m2', 550000);

COMMIT;


-- -----------------------------------------------------
-- Data for table `base_b`.`addresses`
-- -----------------------------------------------------
START TRANSACTION;
USE `base_b`;
INSERT INTO `base_b`.`addresses` (`id`, `person_id`, `zipcode`, `number`) VALUES (DEFAULT, 1, '52000000', '33 A');
INSERT INTO `base_b`.`addresses` (`id`, `person_id`, `zipcode`, `number`) VALUES (DEFAULT, 2, '51000000', '1037');
INSERT INTO `base_b`.`addresses` (`id`, `person_id`, `zipcode`, `number`) VALUES (DEFAULT, 2, '51100000', '487');

COMMIT;


-- -----------------------------------------------------
-- Data for table `base_b`.`source_of_income`
-- -----------------------------------------------------
START TRANSACTION;
USE `base_b`;
INSERT INTO `base_b`.`source_of_income` (`id`, `person_id`, `value`, `description`, `periodicity`) VALUES (DEFAULT, 1, 3500, 'Salary - System Administrator', 30);
INSERT INTO `base_b`.`source_of_income` (`id`, `person_id`, `value`, `description`, `periodicity`) VALUES (DEFAULT, 2, 4700, 'Salary - Teacher', 30);
INSERT INTO `base_b`.`source_of_income` (`id`, `person_id`, `value`, `description`, `periodicity`) VALUES (DEFAULT, 2, 2300, 'Salary - Teacher', 30);

COMMIT;


-- -----------------------------------------------------
-- Data for table `auth_base`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `auth_base`;
INSERT INTO `auth_base`.`user` (`id`, `username`, `password`, `email`) VALUES (DEFAULT, 'admin', 'a3198d4820bc608de2db4180a4fb0bbf8eede24def3e738afa471425c1d543a25966396a553957290742751e66891a7d6f84f3722681b06bb9d2e53feb16301d', 'admin@example.com');
INSERT INTO `auth_base`.`user` (`id`, `username`, `password`, `email`) VALUES (DEFAULT, 'lucas', '64d09d9930c8ecf79e513167a588cb75439b762ce8f9b22ea59765f32aa74ca19d2f1e97dc922a3d4954594a05062917fb24d1f8e72f2ed02a58ed7534f94d27', 'lucas@example.com');

COMMIT;

