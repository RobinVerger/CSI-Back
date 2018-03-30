-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema fil_rouge_2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema fil_rouge_2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fil_rouge_2` DEFAULT CHARACTER SET utf8 ;
USE `fil_rouge_2` ;

-- -----------------------------------------------------
-- Table `fil_rouge_2`.`enquete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fil_rouge_2`.`enquete` (
  `id_enquete` INT(11) NOT NULL AUTO_INCREMENT,
  `nom_enquete` VARCHAR(45) NULL DEFAULT NULL,
  `type_affaire` VARCHAR(45) NULL DEFAULT NULL,
  `date_creation` DATE NULL DEFAULT NULL,
  `localisation` VARCHAR(45) NULL DEFAULT NULL,
  `statut` VARCHAR(45) NULL DEFAULT NULL,
  `classee` TINYINT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id_enquete`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fil_rouge_2`.`enquete_old`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fil_rouge_2`.`enquete_old` (
  `enquete_id_archive` INT(11) NOT NULL,
  `nom_enquete_archive` VARCHAR(45) NULL DEFAULT NULL,
  `type_affaire_archive` VARCHAR(45) NULL DEFAULT NULL,
  `date_creation_archive` VARCHAR(45) NULL DEFAULT NULL,
  `localisation_archive` VARCHAR(45) NULL DEFAULT NULL,
  `statut_archive` VARCHAR(45) NULL DEFAULT NULL,
  `classee` TINYINT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`enquete_id_archive`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fil_rouge_2`.`humain`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fil_rouge_2`.`humain` (
  `id_humain` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `prenom` VARCHAR(45) NULL DEFAULT NULL,
  `date_naissance` DATE NULL DEFAULT NULL,
  `genre` VARCHAR(45) NULL DEFAULT NULL,
  `photo` VARCHAR(1000) NULL DEFAULT NULL,
  `date_deces` DATE NULL DEFAULT NULL,
  `adresse` VARCHAR(45) NULL DEFAULT NULL,
  `grade` VARCHAR(45) NULL DEFAULT NULL,
  `competences` VARCHAR(45) NULL DEFAULT NULL,
  `date_prise_service` DATE NULL DEFAULT NULL,
  `actif` VARCHAR(45) NULL DEFAULT NULL,
  `telephone` VARCHAR(45) NULL DEFAULT NULL,
  `taille` FLOAT NULL DEFAULT NULL,
  `poids` INT(11) NULL DEFAULT NULL,
  `signe_distinctif` VARCHAR(45) NULL DEFAULT NULL,
  `empreinte` VARCHAR(1000) NULL DEFAULT NULL,
  `casier` TINYINT(4) NULL DEFAULT NULL,
  `nombre_condamnation` INT(11) NULL DEFAULT NULL,
  `type_condamnation` VARCHAR(45) NULL DEFAULT NULL,
  `nationalite` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_humain`))
ENGINE = InnoDB
AUTO_INCREMENT = 18
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fil_rouge_2`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fil_rouge_2`.`status` (
  `id` INT(11) NOT NULL,
  `status` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fil_rouge_2`.`personne_impliquee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fil_rouge_2`.`personne_impliquee` (
  `id_personne_implique` INT(11) NOT NULL AUTO_INCREMENT,
  `humain_id` INT(11) NOT NULL,
  `enquete_id` INT(11) NOT NULL,
  `status_id` INT(11) NOT NULL,
  PRIMARY KEY (`id_personne_implique`),
  INDEX `fk_personne_impliquee_enquete1_idx` (`enquete_id` ASC),
  INDEX `fk_personne_impliquee_status1_idx` (`status_id` ASC),
  INDEX `fk_personne_impliquee_Humain1` (`humain_id` ASC),
  CONSTRAINT `fk_personne_impliquee_Humain1`
    FOREIGN KEY (`humain_id`)
    REFERENCES `fil_rouge_2`.`humain` (`id_humain`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_personne_impliquee_enquete1`
    FOREIGN KEY (`enquete_id`)
    REFERENCES `fil_rouge_2`.`enquete` (`id_enquete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_personne_impliquee_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `fil_rouge_2`.`status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 34
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
