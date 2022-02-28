-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema db_digital-card
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_digital-card
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_digital-card` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `db_digital-card` ;

-- -----------------------------------------------------
-- Table `db_digital-card`.`tb_pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_digital-card`.`tb_pessoa` (
  `id_pessoa` INT NOT NULL AUTO_INCREMENT,
  `email_pessoa` VARCHAR(50) NOT NULL,
  `senha_pessoa` VARCHAR(30) NOT NULL,
  `nome_pessoa` VARCHAR(30) NOT NULL,
  `sobrenome_pessoa` VARCHAR(50) NOT NULL,
  `sexo_pessoa` CHAR(1) NULL,
  `biografia_pessoa` LONGTEXT NULL,
  `profissão_pessoa` VARCHAR(30) NULL,
  `idade_pessoa` INT NULL,
  `data_nascimento_pessoa` DATE NULL,
  `raça_pessoa` ENUM('branco', 'preto', 'pardo', 'amarelo', 'indígena') NULL,
  PRIMARY KEY (`id_pessoa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_digital-card`.`tb_contato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_digital-card`.`tb_contato` (
  `id_contato` INT NOT NULL AUTO_INCREMENT,
  `id_pessoa_contato` INT NOT NULL,
  `link_contato` VARCHAR(50) NOT NULL,
  `tipo_contato` VARCHAR(30) NULL,
  PRIMARY KEY (`id_contato`, `id_pessoa_contato`),
  INDEX `fk_tb_contato_tb_pessoa_idx` (`id_pessoa_contato` ASC) VISIBLE,
  CONSTRAINT `fk_tb_contato_tb_pessoa`
    FOREIGN KEY (`id_pessoa_contato`)
    REFERENCES `db_digital-card`.`tb_pessoa` (`id_pessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_digital-card`.`tb_checkin_acessa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_digital-card`.`tb_checkin_acessa` (
  `id_pessoa` INT NOT NULL,
  `id_contato` INT NOT NULL,
  `id_pessoa_contato` INT NOT NULL,
  `data_checkin_acessa` DATE NOT NULL,
  `horário_checkin_acessa` TIME NOT NULL,
  `localização_checkin_acessa` VARCHAR(50) NOT NULL,
  `dispositivo_checkin_acessa` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id_pessoa`, `id_contato`, `id_pessoa_contato`),
  INDEX `fk_tb_checkin_acessa_tb_contato1_idx` (`id_contato` ASC, `id_pessoa_contato` ASC) VISIBLE,
  CONSTRAINT `fk_tb_checkin_acessa_tb_pessoa1`
    FOREIGN KEY (`id_pessoa`)
    REFERENCES `db_digital-card`.`tb_pessoa` (`id_pessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_checkin_acessa_tb_contato1`
    FOREIGN KEY (`id_contato` , `id_pessoa_contato`)
    REFERENCES `db_digital-card`.`tb_contato` (`id_contato` , `id_pessoa_contato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_digital-card`.`tb_recado_recebido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_digital-card`.`tb_recado_recebido` (
  `id_recado_recebido` INT NOT NULL AUTO_INCREMENT,
  `id_pessoa_recado_recebido` INT NOT NULL,
  `mensagem_recado_recebido` LONGTEXT NULL,
  PRIMARY KEY (`id_recado_recebido`, `id_pessoa_recado_recebido`),
  INDEX `fk_tb_recado_tb_pessoa1_idx` (`id_pessoa_recado_recebido` ASC) VISIBLE,
  CONSTRAINT `fk_tb_recado_tb_pessoa1`
    FOREIGN KEY (`id_pessoa_recado_recebido`)
    REFERENCES `db_digital-card`.`tb_pessoa` (`id_pessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_digital-card`.`tb_recado_deixado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_digital-card`.`tb_recado_deixado` (
  `id_recado_deixado` INT NOT NULL AUTO_INCREMENT,
  `id_pessoa_recado_deixado` INT NOT NULL,
  `mensagem_recado_deixado` LONGTEXT NULL,
  PRIMARY KEY (`id_recado_deixado`, `id_pessoa_recado_deixado`),
  INDEX `fk_tb_recado_deixado_tb_pessoa1_idx` (`id_pessoa_recado_deixado` ASC) VISIBLE,
  CONSTRAINT `fk_tb_recado_deixado_tb_pessoa1`
    FOREIGN KEY (`id_pessoa_recado_deixado`)
    REFERENCES `db_digital-card`.`tb_pessoa` (`id_pessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_digital-card`.`tb_modelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_digital-card`.`tb_modelo` (
  `id_modelo` INT NOT NULL AUTO_INCREMENT,
  `largura_modelo` DECIMAL NULL,
  `comprimento_modelo` DECIMAL NULL,
  `cor_background_modelo` CHAR(25) NULL,
  `fonte_modelo` VARCHAR(45) NULL,
  `tamanho_fonte_modelo` INT NULL,
  `estilo_fonte_modelo` CHAR(10) NULL,
  `template_modelo` ENUM('standard, light, dark') NULL,
  PRIMARY KEY (`id_modelo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_digital-card`.`tb_modelo_pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_digital-card`.`tb_modelo_pessoa` (
  `tb_modelo_id_modelo` INT NOT NULL,
  `tb_pessoa_id_pessoa` INT NOT NULL,
  PRIMARY KEY (`tb_modelo_id_modelo`, `tb_pessoa_id_pessoa`),
  INDEX `fk_tb_modelo_has_tb_pessoa_tb_pessoa1_idx` (`tb_pessoa_id_pessoa` ASC) VISIBLE,
  INDEX `fk_tb_modelo_has_tb_pessoa_tb_modelo1_idx` (`tb_modelo_id_modelo` ASC) VISIBLE,
  CONSTRAINT `fk_tb_modelo_has_tb_pessoa_tb_modelo1`
    FOREIGN KEY (`tb_modelo_id_modelo`)
    REFERENCES `db_digital-card`.`tb_modelo` (`id_modelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_modelo_has_tb_pessoa_tb_pessoa1`
    FOREIGN KEY (`tb_pessoa_id_pessoa`)
    REFERENCES `db_digital-card`.`tb_pessoa` (`id_pessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
