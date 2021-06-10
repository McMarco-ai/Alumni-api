-- MySQL Script generated by MySQL Workbench
-- Thu Jun 10 16:24:56 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sql4405171
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `sql4405171` ;

-- -----------------------------------------------------
-- Schema sql4405171
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sql4405171` DEFAULT CHARACTER SET utf8 ;
USE `sql4405171` ;

-- -----------------------------------------------------
-- Table `sql4405171`.`Role_Tutor_Embaixador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql4405171`.`Role_Tutor_Embaixador` ;

CREATE TABLE IF NOT EXISTS `sql4405171`.`Role_Tutor_Embaixador` (
  `id_role` INT NOT NULL,
  `descricao` VARCHAR(200) NULL,
  PRIMARY KEY (`id_role`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sql4405171`.`Genero`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql4405171`.`Genero` ;

CREATE TABLE IF NOT EXISTS `sql4405171`.`Genero` (
  `id_genero` INT NOT NULL,
  `sexo` VARCHAR(45) NULL,
  PRIMARY KEY (`id_genero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sql4405171`.`Alumni`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql4405171`.`Alumni` ;

CREATE TABLE IF NOT EXISTS `sql4405171`.`Alumni` (
  `id_nroEstudante` INT(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `dataNascimento` DATE NULL,
  `morada` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `descricao` VARCHAR(200) NULL,
  `telemovel` VARCHAR(9) NULL,
  `password` VARCHAR(256) NULL,
  `id_role` INT NOT NULL,
  `id_genero` INT NOT NULL,
  PRIMARY KEY (`id_nroEstudante`),
  INDEX `fk_Alumni_Role_Tutor_Embaixador1_idx` (`id_role` ASC) ,
  INDEX `fk_Alumni_Genero1_idx` (`id_genero` ASC) ,
  CONSTRAINT `fk_Alumni_Role_Tutor_Embaixador1`
    FOREIGN KEY (`id_role`)
    REFERENCES `sql4405171`.`Role_Tutor_Embaixador` (`id_role`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumni_Genero1`
    FOREIGN KEY (`id_genero`)
    REFERENCES `sql4405171`.`Genero` (`id_genero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sql4405171`.`Skills`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql4405171`.`Skills` ;

CREATE TABLE IF NOT EXISTS `sql4405171`.`Skills` (
  `id_skills` INT NOT NULL,
  `tipoSkill` VARCHAR(100) NULL,
  PRIMARY KEY (`id_skills`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sql4405171`.`Alumni_Skills`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql4405171`.`Alumni_Skills` ;

CREATE TABLE IF NOT EXISTS `sql4405171`.`Alumni_Skills` (
  `id_skills` INT NOT NULL,
  `id_nroEstudante` INT(45) NOT NULL,
  `percentagem` INT NULL,
  CONSTRAINT `fk_Alumni_Skills_Skills1`
    FOREIGN KEY (`id_skills`)
    REFERENCES `sql4405171`.`Skills` (`id_skills`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumni_Skills_Alumni1`
    FOREIGN KEY (`id_nroEstudante`)
    REFERENCES `sql4405171`.`Alumni` (`id_nroEstudante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sql4405171`.`CodigoPostal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql4405171`.`CodigoPostal` ;

CREATE TABLE IF NOT EXISTS `sql4405171`.`CodigoPostal` (
  `id_codigoPostal` VARCHAR(8) NOT NULL,
  `localidade` VARCHAR(45) NULL,
  PRIMARY KEY (`id_codigoPostal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sql4405171`.`Empresa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql4405171`.`Empresa` ;

CREATE TABLE IF NOT EXISTS `sql4405171`.`Empresa` (
  `id_empresa` INT NOT NULL AUTO_INCREMENT,
  `nomeEmpresa` VARCHAR(45) NULL,
  `telemovel` VARCHAR(9) NULL,
  `morada` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `id_codigoPostal` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`id_empresa`),
  INDEX `fk_Empresa_CodigoPostal1_idx` (`id_codigoPostal` ASC) ,
  CONSTRAINT `fk_Empresa_CodigoPostal1`
    FOREIGN KEY (`id_codigoPostal`)
    REFERENCES `sql4405171`.`CodigoPostal` (`id_codigoPostal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sql4405171`.`Tipo_Emprego`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql4405171`.`Tipo_Emprego` ;

CREATE TABLE IF NOT EXISTS `sql4405171`.`Tipo_Emprego` (
  `id_tipoEmprego` INT NOT NULL,
  `descricao` VARCHAR(400) NULL,
  PRIMARY KEY (`id_tipoEmprego`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sql4405171`.`Professor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql4405171`.`Professor` ;

CREATE TABLE IF NOT EXISTS `sql4405171`.`Professor` (
  `id_nroProfessor` VARCHAR(45) NOT NULL,
  `password` VARCHAR(256) NULL,
  `nome` VARCHAR(45) NULL,
  `telemovel` VARCHAR(9) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`id_nroProfessor`),
  UNIQUE INDEX `id_nroProfessor_UNIQUE` (`id_nroProfessor` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sql4405171`.`Bolsa_Emprego`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql4405171`.`Bolsa_Emprego` ;

CREATE TABLE IF NOT EXISTS `sql4405171`.`Bolsa_Emprego` (
  `id_bolsas` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(400) NULL,
  `fotoLink` VARCHAR(200) NULL,
  `estado` VARCHAR(45) NULL,
  `data_publicacao` VARCHAR(45) NULL,
  `data_inicio` VARCHAR(45) NULL,
  `id_empresa` INT NOT NULL,
  `id_tipoEmprego` INT NOT NULL,
  `id_nroProfessor` VARCHAR(45) NOT NULL,
  `ofertaLink` VARCHAR(200) NULL,
  PRIMARY KEY (`id_bolsas`),
  INDEX `fk_Bolsa Emprego_Empresa1_idx` (`id_empresa` ASC) ,
  INDEX `fk_Bolsa Emprego_Tipo Emprego1_idx` (`id_tipoEmprego` ASC) ,
  INDEX `fk_Bolsa Emprego_Professor1_idx` (`id_nroProfessor` ASC) ,
  CONSTRAINT `fk_Bolsa Emprego_Empresa1`
    FOREIGN KEY (`id_empresa`)
    REFERENCES `sql4405171`.`Empresa` (`id_empresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bolsa Emprego_Tipo Emprego1`
    FOREIGN KEY (`id_tipoEmprego`)
    REFERENCES `sql4405171`.`Tipo_Emprego` (`id_tipoEmprego`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bolsa Emprego_Professor1`
    FOREIGN KEY (`id_nroProfessor`)
    REFERENCES `sql4405171`.`Professor` (`id_nroProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sql4405171`.`Alumni_Bolsa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql4405171`.`Alumni_Bolsa` ;

CREATE TABLE IF NOT EXISTS `sql4405171`.`Alumni_Bolsa` (
  `id_bolsas` INT NOT NULL,
  `id_nroEstudante` INT(45) NOT NULL,
  INDEX `fk_Alumni_Bolsa_Bolsa Emprego1_idx` (`id_bolsas` ASC) ,
  INDEX `fk_Alumni_Bolsa_Alumni1_idx` (`id_nroEstudante` ASC) ,
  CONSTRAINT `fk_Alumni_Bolsa_Bolsa Emprego1`
    FOREIGN KEY (`id_bolsas`)
    REFERENCES `sql4405171`.`Bolsa_Emprego` (`id_bolsas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumni_Bolsa_Alumni1`
    FOREIGN KEY (`id_nroEstudante`)
    REFERENCES `sql4405171`.`Alumni` (`id_nroEstudante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sql4405171`.`Tipo_Evento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql4405171`.`Tipo_Evento` ;

CREATE TABLE IF NOT EXISTS `sql4405171`.`Tipo_Evento` (
  `id_tipoEvento` INT NOT NULL,
  `descricao` VARCHAR(400) NULL,
  PRIMARY KEY (`id_tipoEvento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sql4405171`.`Evento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql4405171`.`Evento` ;

CREATE TABLE IF NOT EXISTS `sql4405171`.`Evento` (
  `id_evento` INT(45) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NULL,
  `data` DATE NULL,
  `fotoLink` VARCHAR(200) NULL,
  `informacao` VARCHAR(200) NULL,
  `id_nroProfessor` VARCHAR(45) NOT NULL,
  `id_tipoEvento` INT NOT NULL,
  PRIMARY KEY (`id_evento`),
  INDEX `fk_Evento_Professor1_idx` (`id_nroProfessor` ASC) ,
  INDEX `fk_Evento_Tipo Evento1_idx` (`id_tipoEvento` ASC) ,
  CONSTRAINT `fk_Evento_Professor1`
    FOREIGN KEY (`id_nroProfessor`)
    REFERENCES `sql4405171`.`Professor` (`id_nroProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Evento_Tipo Evento1`
    FOREIGN KEY (`id_tipoEvento`)
    REFERENCES `sql4405171`.`Tipo_Evento` (`id_tipoEvento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sql4405171`.`Tools`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql4405171`.`Tools` ;

CREATE TABLE IF NOT EXISTS `sql4405171`.`Tools` (
  `id_tools` INT NOT NULL,
  `tipoTool` VARCHAR(100) NULL,
  PRIMARY KEY (`id_tools`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sql4405171`.`Alumni_Tools`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql4405171`.`Alumni_Tools` ;

CREATE TABLE IF NOT EXISTS `sql4405171`.`Alumni_Tools` (
  `id_tools` INT NOT NULL,
  `id_nroEstudante` INT(45) NOT NULL,
  `percentagem` INT NULL,
  CONSTRAINT `fk_Alumni_Skills_Skills10`
    FOREIGN KEY (`id_tools`)
    REFERENCES `sql4405171`.`Tools` (`id_tools`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumni_Skills_Alumni10`
    FOREIGN KEY (`id_nroEstudante`)
    REFERENCES `sql4405171`.`Alumni` (`id_nroEstudante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sql4405171`.`Cursos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql4405171`.`Cursos` ;

CREATE TABLE IF NOT EXISTS `sql4405171`.`Cursos` (
  `id_cursos` INT NOT NULL,
  `tipoCurso` VARCHAR(100) NULL,
  PRIMARY KEY (`id_cursos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sql4405171`.`Alumni_Cursos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql4405171`.`Alumni_Cursos` ;

CREATE TABLE IF NOT EXISTS `sql4405171`.`Alumni_Cursos` (
  `id_cursos` INT NOT NULL,
  `id_nroEstudante` INT(45) NOT NULL,
  `anoCurso` INT NULL,
  CONSTRAINT `fk_Alumni_Skills_Skills100`
    FOREIGN KEY (`id_cursos`)
    REFERENCES `sql4405171`.`Cursos` (`id_cursos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumni_Skills_Alumni100`
    FOREIGN KEY (`id_nroEstudante`)
    REFERENCES `sql4405171`.`Alumni` (`id_nroEstudante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sql4405171`.`Links`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql4405171`.`Links` ;

CREATE TABLE IF NOT EXISTS `sql4405171`.`Links` (
  `id_links` INT NOT NULL,
  `tipoLink` VARCHAR(100) NULL,
  PRIMARY KEY (`id_links`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sql4405171`.`Alumni_Links`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql4405171`.`Alumni_Links` ;

CREATE TABLE IF NOT EXISTS `sql4405171`.`Alumni_Links` (
  `id_links` INT NOT NULL,
  `id_nroEstudante` INT(45) NOT NULL,
  `link` VARCHAR(300) NULL,
  CONSTRAINT `fk_Alumni_Skills_Skills1000`
    FOREIGN KEY (`id_links`)
    REFERENCES `sql4405171`.`Links` (`id_links`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumni_Skills_Alumni1000`
    FOREIGN KEY (`id_nroEstudante`)
    REFERENCES `sql4405171`.`Alumni` (`id_nroEstudante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sql4405171`.`Alumni_Evento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql4405171`.`Alumni_Evento` ;

CREATE TABLE IF NOT EXISTS `sql4405171`.`Alumni_Evento` (
  `id_nroEstudante` INT(45) NOT NULL,
  `id_evento` INT(45) NOT NULL,
  INDEX `fk_Alumni_Bolsa_Alumni1_idx` (`id_nroEstudante` ASC) ,
  INDEX `fk_Alumni_Evento_Evento1_idx` (`id_evento` ASC) ,
  CONSTRAINT `fk_Alumni_Bolsa_Alumni10`
    FOREIGN KEY (`id_nroEstudante`)
    REFERENCES `sql4405171`.`Alumni` (`id_nroEstudante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumni_Evento_Evento1`
    FOREIGN KEY (`id_evento`)
    REFERENCES `sql4405171`.`Evento` (`id_evento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sql4405171`.`Testemunha`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql4405171`.`Testemunha` ;

CREATE TABLE IF NOT EXISTS `sql4405171`.`Testemunha` (
  `id_cursos` INT NOT NULL,
  `id_nroEstudante` INT(45) NOT NULL,
  `descricao` VARCHAR(150) NULL,
  `fotoLink` VARCHAR(150) NULL,
  `id_testemunha` INT NULL AUTO_INCREMENT,
  UNIQUE INDEX `id_testemunha_UNIQUE` (`id_testemunha` ASC),
  CONSTRAINT `fk_Alumni_Skills_Skills1001`
    FOREIGN KEY (`id_cursos`)
    REFERENCES `sql4405171`.`Cursos` (`id_cursos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumni_Skills_Alumni1001`
    FOREIGN KEY (`id_nroEstudante`)
    REFERENCES `sql4405171`.`Alumni` (`id_nroEstudante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
