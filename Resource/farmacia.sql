-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 02-05-2020 a las 03:11:02
-- Versión del servidor: 10.4.10-MariaDB
-- Versión de PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `farmacia`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `listcity`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listcity` (`vid` INT)  BEGIN
	SELECT id, name, description, department_id
    FROM city
    order by id;
END$$

DROP PROCEDURE IF EXISTS `listdepartment`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listdepartment` (`vid` INT)  BEGIN
	SELECT id, name, description
    FROM department
    order by id;
END$$

DROP PROCEDURE IF EXISTS `listlaboratory`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listlaboratory` (`vid` INT)  BEGIN
	SELECT id, name, description
    FROM laboratory
    order by id;
END$$

DROP PROCEDURE IF EXISTS `listrol`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listrol` (`vid` INT)  BEGIN
	SELECT id, name, description
    FROM rol
    order by id;
END$$

DROP PROCEDURE IF EXISTS `listshelf`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listshelf` (`vid` INT)  BEGIN
	SELECT id, name, description
    FROM shelf
    order by id;
END$$

DROP PROCEDURE IF EXISTS `liststate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `liststate` (`vid` INT)  BEGIN
	SELECT id, name
    FROM state
    order by id;
END$$

DROP PROCEDURE IF EXISTS `listtypeproduct`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listtypeproduct` (`vid` INT)  BEGIN
	SELECT id, name, description
    FROM typeproduct
    order by id;
END$$

--
-- Funciones
--
DROP FUNCTION IF EXISTS `deletecity`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `deletecity` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'funcion que elimina una ciudad'
BEGIN
	declare res int default 0;
	delete from city where id = vid;
    set res = 1;
    return res;
RETURN 1;
END$$

DROP FUNCTION IF EXISTS `deletedepartment`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `deletedepartment` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'funcion que elimina una departamento'
BEGIN
	declare res int default 0;
	delete from department where id = vid;
    set res = 1;
    return res;
RETURN 1;
END$$

DROP FUNCTION IF EXISTS `deletelaboratory`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `deletelaboratory` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'funcion que elimina una ciudad'
BEGIN
	declare res int default 0;
	delete from laboratory where id = vid;
    set res = 1;
    return res;
RETURN 1;
END$$

DROP FUNCTION IF EXISTS `deleterol`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `deleterol` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'funcion que elimina una ciudad'
BEGIN
	declare res int default 0;
	delete from rol where id = vid;
    set res = 1;
    return res;
RETURN 1;
END$$

DROP FUNCTION IF EXISTS `deleteshelf`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `deleteshelf` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'funcion que elimina una ciudad'
BEGIN
	declare res int default 0;
	delete from shelf where id = vid;
    set res = 1;
    return res;
RETURN 1;
END$$

DROP FUNCTION IF EXISTS `deletestate`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `deletestate` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'funcion que elimina una ciudad'
BEGIN
	declare res int default 0;
	delete from state where id = vid;
    set res = 1;
    return res;
RETURN 1;
END$$

DROP FUNCTION IF EXISTS `deletetypeproduct`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `deletetypeproduct` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'funcion que elimina una ciudad'
BEGIN
	declare res int default 0;
	delete from typeproduct where id = vid;
    set res = 1;
    return res;
RETURN 1;
END$$

DROP FUNCTION IF EXISTS `savecity`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `savecity` (`vname` VARCHAR(50), `vdescription` VARCHAR(50), `vdepartment_id` INTEGER) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almace una ciudad'
BEGIN
	declare res int default 0;
if not exists(select name from city where name=vname)
	then
		insert into city(name, description, department_id)
			values (vname, vdescription, vdepartment_id);
            set res = 1;
end if;
RETURN res;
END$$

DROP FUNCTION IF EXISTS `savedepartment`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `savedepartment` (`vname` VARCHAR(50), `vdescription` VARCHAR(50)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almace una ciudad'
BEGIN
	declare res int default 0;
if not exists(select name from department where name=vname)
	then
		insert into department(name, description)
			values (vname, vdescription);
            set res = 1;
end if;
RETURN res;
END$$

DROP FUNCTION IF EXISTS `savelaboratory`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `savelaboratory` (`vname` VARCHAR(50), `vdescription` VARCHAR(50)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almace una ciudad'
BEGIN
	declare res int default 0;
if not exists(select name from laboratory where name=vname)
	then
		insert into laboratory(name, description)
			values (vname, vdescription);
            set res = 1;
end if;
RETURN res;
END$$

DROP FUNCTION IF EXISTS `saverol`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `saverol` (`vname` VARCHAR(50), `vdescription` VARCHAR(50)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almace una ciudad'
BEGIN
	declare res int default 0;
if not exists(select name from rol where name=vname)
	then
		insert into rol(name, description)
			values (vname, vdescription);
            set res = 1;
end if;
RETURN res;
END$$

DROP FUNCTION IF EXISTS `saveshelf`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `saveshelf` (`vname` VARCHAR(50), `vdescription` VARCHAR(50)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almace una ciudad'
BEGIN
	declare res int default 0;
if not exists(select name from shelf where name=vname)
	then
		insert into shelf(name, description)
			values (vname, vdescription);
            set res = 1;
end if;
RETURN res;
END$$

DROP FUNCTION IF EXISTS `savestate`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `savestate` (`vname` VARCHAR(50)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almace una ciudad'
BEGIN
	declare res int default 0;
if not exists(select name from state where name=vname)
	then
		insert into state(name)
			values (vname);
            set res = 1;
end if;
RETURN res;
END$$

DROP FUNCTION IF EXISTS `savetypeproduct`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `savetypeproduct` (`vname` VARCHAR(50), `vdescription` VARCHAR(50)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almace una ciudad'
BEGIN
	declare res int default 0;
if not exists(select name from typeproduct where name=vname)
	then
		insert into typeproduct(name, description)
			values (vname, vdescription);
            set res = 1;
end if;
RETURN res;
END$$

DROP FUNCTION IF EXISTS `updatecity`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `updatecity` (`vid` INT, `vname` VARCHAR(50), `vdescription` VARCHAR(50), `vdepartment_id` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica una ciudad'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select name from city where name=vname and id<>vid)
		THEN

            UPDATE city
            SET  name=vname, description=vdescription, department_id = vdepartment_id
            WHERE id=vid;

	set res=1;
								
			
		END IF;

	RETURN res;
END$$

DROP FUNCTION IF EXISTS `updatedepartment`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `updatedepartment` (`vid` INT, `vname` VARCHAR(50), `vdescription` VARCHAR(50)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica una ciudad'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select name from department where name=vname and id<>vid)
		THEN

            UPDATE department
            SET  name=vname, description=vdescription
            WHERE id=vid;

	set res=1;
								
			
		END IF;

	RETURN res;
END$$

DROP FUNCTION IF EXISTS `updatelaboratory`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `updatelaboratory` (`vid` INT, `vname` VARCHAR(50), `vdescription` VARCHAR(50)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica una ciudad'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select name from laboratory where name=vname and id<>vid)
		THEN

            UPDATE laboratory
            SET  name=vname, description=vdescription
            WHERE id=vid;

	set res=1;
								
			
		END IF;

	RETURN res;
END$$

DROP FUNCTION IF EXISTS `updaterol`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `updaterol` (`vid` INT, `vname` VARCHAR(50), `vdescription` VARCHAR(50)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica una ciudad'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select name from rol where name=vname and id<>vid)
		THEN

            UPDATE rol
            SET  name=vname, description=vdescription
            WHERE id=vid;

	set res=1;
								
			
		END IF;

	RETURN res;
END$$

DROP FUNCTION IF EXISTS `updateshelf`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `updateshelf` (`vid` INT, `vname` VARCHAR(50), `vdescription` VARCHAR(50)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica una ciudad'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select name from shelf where name=vname and id<>vid)
		THEN

            UPDATE shelf
            SET  name=vname, description=vdescription
            WHERE id=vid;

	set res=1;
								
			
		END IF;

	RETURN res;
END$$

DROP FUNCTION IF EXISTS `updatestate`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `updatestate` (`vid` INT, `vname` VARCHAR(50)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica una ciudad'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select name from state where name=vname and id<>vid)
		THEN

            UPDATE state
            SET  name=vname
            WHERE id=vid;

	set res=1;
								
			
		END IF;

	RETURN res;
END$$

DROP FUNCTION IF EXISTS `updatetypeproduct`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `updatetypeproduct` (`vid` INT, `vname` VARCHAR(50), `vdescription` VARCHAR(50)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica una ciudad'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select name from typeproduct where name=vname and id<>vid)
		THEN

            UPDATE typeproduct
            SET  name=vname, description=vdescription
            WHERE id=vid;

	set res=1;
								
			
		END IF;

	RETURN res;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `description` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `city_department_fk` (`department_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `city`
--

INSERT INTO `city` (`id`, `name`, `description`, `department_id`) VALUES
(4, 'asdasdasdad', 'asdasdasd', 4),
(5, 'Alvaroasdasd', 'Parrandaasdasdad', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `department`
--

INSERT INTO `department` (`id`, `name`, `description`) VALUES
(7, 'Departameinto', 'asdasdasd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detailsale`
--

DROP TABLE IF EXISTS `detailsale`;
CREATE TABLE IF NOT EXISTS `detailsale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `detailsale_inventory_fk` (`inventory_id`),
  KEY `detailsale_sale_fk` (`sale_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventory`
--

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE IF NOT EXISTS `inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `milligrams` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `admissiondate` date DEFAULT NULL,
  `expirationdate` date DEFAULT NULL,
  `lotecode` varchar(10) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `provider_id` int(11) NOT NULL,
  `shelf_id` int(11) NOT NULL,
  `typeproduct_id` int(11) NOT NULL,
  `laboratory_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_laboratory_fk` (`laboratory_id`),
  KEY `inventory_provider_fk` (`provider_id`),
  KEY `inventory_shelf_fk` (`shelf_id`),
  KEY `inventory_status_fk` (`status_id`),
  KEY `inventory_typeproduct_fk` (`typeproduct_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pharmacy_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_pharmacy_fk` (`pharmacy_id`),
  KEY `invoice_sale_fk` (`sale_id`),
  KEY `invoice_user_fk` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratory`
--

DROP TABLE IF EXISTS `laboratory`;
CREATE TABLE IF NOT EXISTS `laboratory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `laboratory`
--

INSERT INTO `laboratory` (`id`, `name`, `description`) VALUES
(1, 'asdasdaasdasdasd', 'sdasdasdasdasdasd'),
(3, 'asdasdasdasdasasdas', 'dasdasdasdasad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pharmacy`
--

DROP TABLE IF EXISTS `pharmacy`;
CREATE TABLE IF NOT EXISTS `pharmacy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `logo` varchar(5000) DEFAULT NULL,
  `nit` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provider`
--

DROP TABLE IF EXISTS `provider`;
CREATE TABLE IF NOT EXISTS `provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `nit` varchar(100) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `provider_city_fk` (`city_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `name`, `description`) VALUES
(2, 'Administradorasdasdasd', 'Gestiona todas la acciones en la farmaciaasdasdasd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sale`
--

DROP TABLE IF EXISTS `sale`;
CREATE TABLE IF NOT EXISTS `sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `saledate` date DEFAULT NULL,
  `saletotal` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_user_fk` (`client_id`),
  KEY `sale_user_fkv2` (`employee_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shelf`
--

DROP TABLE IF EXISTS `shelf`;
CREATE TABLE IF NOT EXISTS `shelf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `shelf`
--

INSERT INTO `shelf` (`id`, `name`, `description`) VALUES
(2, 'Estante1', 'asdasdasd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `state`
--

DROP TABLE IF EXISTS `state`;
CREATE TABLE IF NOT EXISTS `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `state`
--

INSERT INTO `state` (`id`, `name`) VALUES
(3, 'diegoddddd'),
(2, 'asdasdasdasdasdasdasd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `typeproduct`
--

DROP TABLE IF EXISTS `typeproduct`;
CREATE TABLE IF NOT EXISTS `typeproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `typeproduct`
--

INSERT INTO `typeproduct` (`id`, `name`, `description`) VALUES
(3, 'asdasda', 'asdasd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `documenttype` varchar(50) DEFAULT NULL,
  `documentnumber` varchar(50) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `rol_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `admissiondate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_city_fk` (`city_id`),
  KEY `user_rol_fk` (`rol_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
