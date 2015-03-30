-- MySQL Script generated by MySQL Workbench
-- 03/23/15 17:54:55
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema bfree
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `bfree` ;

-- -----------------------------------------------------
-- Schema bfree
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bfree` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `bfree` ;

-- -----------------------------------------------------
-- Table `bfree`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bfree`.`role` ;

CREATE TABLE IF NOT EXISTS `bfree`.`role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idUserRole_UNIQUE` (`id` ASC),
  UNIQUE INDEX `Role_UNIQUE` (`role` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bfree`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bfree`.`user` ;

CREATE TABLE IF NOT EXISTS `bfree`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NULL,
  `lastname` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idUser_UNIQUE` (`id` ASC),
  INDEX `fk_user_role_idx` (`role_id` ASC),
  CONSTRAINT `fk_user_role`
    FOREIGN KEY (`role_id`)
    REFERENCES `bfree`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bfree`.`coordinate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bfree`.`coordinate` ;

CREATE TABLE IF NOT EXISTS `bfree`.`coordinate` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `x` DOUBLE NULL,
  `y` DOUBLE NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idCoordinate_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bfree`.`organization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bfree`.`organization` ;

CREATE TABLE IF NOT EXISTS `bfree`.`organization` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` LONGTEXT NULL,
  `user_id` INT NOT NULL,
  `coordinate_id` INT NOT NULL,
  `image` VARCHAR(45) NULL,
  `category` VARCHAR(45) NULL,
  `subcategory` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idObject_UNIQUE` (`id` ASC),
  INDEX `fk_organization_user1_idx` (`user_id` ASC),
  INDEX `fk_organization_coordinate1_idx` (`coordinate_id` ASC),
  CONSTRAINT `fk_organization_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `bfree`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_organization_coordinate1`
    FOREIGN KEY (`coordinate_id`)
    REFERENCES `bfree`.`coordinate` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bfree`.`element`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bfree`.`element` ;

CREATE TABLE IF NOT EXISTS `bfree`.`element` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` LONGTEXT NULL,
  `image` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idElement_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bfree`.`comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bfree`.`comment` ;

CREATE TABLE IF NOT EXISTS `bfree`.`comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `text` LONGTEXT NULL,
  `date` DATETIME NULL,
  `user_id` INT NOT NULL,
  `organization_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idComment_UNIQUE` (`id` ASC),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_comment_organization1_idx` (`organization_id` ASC),
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `bfree`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_organization1`
    FOREIGN KEY (`organization_id`)
    REFERENCES `bfree`.`organization` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bfree`.`organization_has_element`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bfree`.`organization_has_element` ;

CREATE TABLE IF NOT EXISTS `bfree`.`organization_has_element` (
  `organization_id` INT NOT NULL,
  `element_id` INT NOT NULL,
  PRIMARY KEY (`organization_id`, `element_id`),
  INDEX `fk_organization_has_element_element1_idx` (`element_id` ASC),
  INDEX `fk_organization_has_element_organization1_idx` (`organization_id` ASC),
  CONSTRAINT `fk_organization_has_element_organization1`
    FOREIGN KEY (`organization_id`)
    REFERENCES `bfree`.`organization` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_organization_has_element_element1`
    FOREIGN KEY (`element_id`)
    REFERENCES `bfree`.`element` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `bfree`.`role`
-- -----------------------------------------------------
START TRANSACTION;
USE `bfree`;
INSERT INTO `bfree`.`role` (`id`, `role`) VALUES (1, 'ADMIN');
INSERT INTO `bfree`.`role` (`id`, `role`) VALUES (2, 'ORGANIZATION');
INSERT INTO `bfree`.`role` (`id`, `role`) VALUES (3, 'PERSON');

COMMIT;


-- -----------------------------------------------------
-- Data for table `bfree`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `bfree`;
INSERT INTO `bfree`.`user` (`id`, `firstname`, `lastname`, `email`, `password`, `role_id`) VALUES (1, 'Ivan', 'Ivanov', 'i@ya.ru', 'password', 1);
INSERT INTO `bfree`.`user` (`id`, `firstname`, `lastname`, `email`, `password`, `role_id`) VALUES (2, 'Petr', 'Petrov', 'p@ya.ru', 'password', 2);
INSERT INTO `bfree`.`user` (`id`, `firstname`, `lastname`, `email`, `password`, `role_id`) VALUES (3, 'Andrei', 'Andreev', 'a@ya.ru', 'password', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `bfree`.`coordinate`
-- -----------------------------------------------------
START TRANSACTION;
USE `bfree`;
INSERT INTO `bfree`.`coordinate` (`id`, `x`, `y`) VALUES (1, 80, 50);

COMMIT;


-- -----------------------------------------------------
-- Data for table `bfree`.`organization`
-- -----------------------------------------------------
START TRANSACTION;
USE `bfree`;
INSERT INTO `bfree`.`organization` (`id`, `name`, `description`, `user_id`, `coordinate_id`, `image`, `category`, `subcategory`) VALUES (1, 'Epolet', 'Place for family', 2, 1, NULL, NULL, NULL);

COMMIT;
