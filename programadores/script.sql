-- MySQL Script generated by MySQL Workbench
-- 08/16/16 06:59:50
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema bd_programadores
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd_programadores
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_programadores` DEFAULT CHARACTER SET utf8 ;
USE `bd_programadores` ;

-- -----------------------------------------------------
-- Table `bd_programadores`.`Programador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_programadores`.`Programador` (
  `idProgramador` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `salarioBase` INT NOT NULL,
  PRIMARY KEY (`idProgramador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_programadores`.`Proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_programadores`.`Proyecto` (
  `idProyecto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `duracion` INT NOT NULL,
  `cliente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProyecto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_programadores`.`Tarea`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_programadores`.`Tarea` (
  `idTarea` INT NOT NULL AUTO_INCREMENT,
  `costo` INT NOT NULL,
  `duracion` INT NOT NULL,
  `estado` ENUM('proceso', 'terminada') NOT NULL,
  `fecha` DATE NOT NULL,
  `Programador_idProgramador` INT NOT NULL,
  `Proyecto_idProyecto` INT NOT NULL,
  PRIMARY KEY (`idTarea`),
  INDEX `fk_Tarea_Programador_idx` (`Programador_idProgramador` ASC),
  INDEX `fk_Tarea_Proyecto1_idx` (`Proyecto_idProyecto` ASC),
  CONSTRAINT `fk_Tarea_Programador`
    FOREIGN KEY (`Programador_idProgramador`)
    REFERENCES `bd_programadores`.`Programador` (`idProgramador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tarea_Proyecto1`
    FOREIGN KEY (`Proyecto_idProyecto`)
    REFERENCES `bd_programadores`.`Proyecto` (`idProyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;