-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 28-05-2020 a las 02:11:26
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
DROP PROCEDURE IF EXISTS `history`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `history` (`vid` INT)  BEGIN
	SELECT *
    FROM sale
    WHERE client_id = vid;
END$$

DROP PROCEDURE IF EXISTS `listcity`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listcity` (`vid` INT)  BEGIN
	SELECT id, name, description, department_id
    FROM city
    order by id;
END$$

DROP PROCEDURE IF EXISTS `listclient`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listclient` (`vid` INT)  BEGIN
	SELECT id, name, lastname, documenttype, documentnumber, gender, age, birthdate, points, password, rol_id, city_id, admissiondate
    FROM user
    WHERE rol_id = 3
    order by id;
END$$

DROP PROCEDURE IF EXISTS `listdepartment`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listdepartment` (`vid` INT)  BEGIN
	SELECT id, name, description
    FROM department
    order by id;
END$$

DROP PROCEDURE IF EXISTS `listemployee`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listemployee` (`vid` INT)  BEGIN
	SELECT id, name, lastname, documenttype, documentnumber, gender, age, birthdate, points, password, rol_id, city_id, admissiondate
    FROM user
    WHERE rol_id = 1
    order by id;
END$$

DROP PROCEDURE IF EXISTS `listinventory`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listinventory` (`vid` INT)  BEGIN
	SELECT id, milligrams,name,
						description,
                        admissiondate,
                        expirationdate,
                        lotecode,
                        quantity,
                        price,
                        provider_id,
                        shelf_id,
                        typeproduct_id,
                        laboratory_id,
                        status_id,
                        imagen
    FROM inventory
    order by id;
END$$

DROP PROCEDURE IF EXISTS `listlaboratory`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listlaboratory` (`vid` INT)  BEGIN
	SELECT id, name, description
    FROM laboratory
    order by id;
END$$

DROP PROCEDURE IF EXISTS `listpharmacy`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listpharmacy` (`vid` INT)  BEGIN
	SELECT id, name, imagen, nit
    FROM pharmacy
    order by id;
END$$

DROP PROCEDURE IF EXISTS `listprovider`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listprovider` (`vid` INT)  BEGIN
	SELECT id, name, nit, address, city_id
    FROM provider
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

DROP PROCEDURE IF EXISTS `listuser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listuser` (`vid` INT)  BEGIN
	SELECT id, name, lastname, documenttype, documentnumber, gender, age, birthdate, points, password, rol_id, city_id, admissiondate
    FROM user
    order by id;
END$$

DROP PROCEDURE IF EXISTS `totalsale`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `totalsale` (`vid` INT, `vquantity` INT)  BEGIN
	SELECT price * vquantity as total
    FROM inventory
    where id = vid;
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

DROP FUNCTION IF EXISTS `deleteinventory`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `deleteinventory` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'funcion que elimina un producto'
BEGIN
	declare res int default 0;
	delete from inventory where id = vid;
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

DROP FUNCTION IF EXISTS `deletepharmacy`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `deletepharmacy` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'funcion que elimina una farmacia'
BEGIN
	declare res int default 0;
	delete from pharmacy where id = vid;
    set res = 1;
    return res;
RETURN 1;
END$$

DROP FUNCTION IF EXISTS `deleteprovider`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `deleteprovider` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'funcion que elimina un proveedor'
BEGIN
	declare res int default 0;
	delete from provider where id = vid;
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

DROP FUNCTION IF EXISTS `deleteuser`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `deleteuser` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'funcion que elimina un usuario'
BEGIN
	declare res int default 0;
	delete from user where id = vid;
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

DROP FUNCTION IF EXISTS `saveinventory`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `saveinventory` (`vmilligrams` INT, `vname` VARCHAR(100), `vdescription` VARCHAR(5000), `vadmissiondate` DATE, `vexpirationdate` DATE, `vlotecode` VARCHAR(10), `vquantity` INT, `vprice` INT, `vprovider_id` INT, `vshelf_id` INT, `vtypeproduct_id` INT, `vlaboratory_id` INT, `vstatus_id` INT, `vimagen` VARCHAR(5000)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que guarda una medicamento'
BEGIN
	declare res int default 0;
   if not exists(select name from inventory where lotecode=vlotecode)
	then
		insert into inventory(milligrams,
								name,
								description,
                                admissiondate,
                                expirationdate,
                                lotecode,
                                quantity,
                                price,
                                provider_id,
                                shelf_id,
                                typeproduct_id,
                                laboratory_id,
                                status_id,
                                imagen)
			     values (vmilligrams,
								vname,
								vdescription,
                                vadmissiondate,
                                vexpirationdate,
                                vlotecode,
                                vquantity,
                                vprice,
                                vprovider_id,
                                vshelf_id,
                                vtypeproduct_id,
                                vlaboratory_id,
                                vstatus_id,
                                vimagen);
            set res = 1;
            end if;
RETURN 1;
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

DROP FUNCTION IF EXISTS `savepharmacy`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `savepharmacy` (`vname` VARCHAR(50), `vimagen` VARCHAR(5000), `vnit` VARCHAR(200)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almace una farmacia'
BEGIN
	declare res int default 0;
if not exists(select name from pharmacy where name=vname)
	then
		insert into pharmacy(name, imagen, nit)
			values (vname, vimagen, vnit);
            set res = 1;
end if;
RETURN res;
END$$

DROP FUNCTION IF EXISTS `saveprovider`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `saveprovider` (`vname` VARCHAR(50), `vnit` VARCHAR(100), `vaddress` VARCHAR(50), `vcity_id` INTEGER) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almace un proveedor'
BEGIN
	declare res int default 0;
if not exists(select name from provider where name=vname)
	then
		insert into provider(name, nit, address, city_id)
			values (vname, vnit, vaddress, vcity_id);
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

DROP FUNCTION IF EXISTS `savesale`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `savesale` (`vsaledate` DATE, `vsaletotal` INT, `vclient_id` INT, `vemployee_id` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que guarda una venta'
BEGIN
	declare res int default 0;
   if not exists(select * from sale where client_id=150000)
	then
		insert into sale(saledate, saletotal, client_id, employee_id)
			     values (vsaledate, vsaletotal, vclient_id, vemployee_id);
            set res = 1;
            end if;
RETURN 1;
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

DROP FUNCTION IF EXISTS `saveuser`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `saveuser` (`vname` VARCHAR(50), `vlastname` VARCHAR(50), `vdocumenttype` VARCHAR(50), `vdocumentnumber` VARCHAR(50), `vgender` VARCHAR(50), `vage` INTEGER, `vbirthdate` DATETIME, `vpoints` INTEGER, `vpassword` VARCHAR(100), `vrol_id` INTEGER, `vcity_id` INTEGER, `vadmissiondate` DATETIME) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almace una ciudad'
BEGIN
	declare res int default 0;
if not exists(select name from user where documentnumber=vdocumentnumber)
	then
		insert into user(name,
						 lastname,
                         documenttype,
                         documentnumber,
                         gender,
                         age,
                         birthdate,
                         points,
                         password,
                         rol_id,
                         city_id,
                         admissiondate)
			     values (vname,
						 vlastname,
                         vdocumenttype,
                         vdocumentnumber,
                         vgender,
                         vage,
                         vbirthdate,
                         vpoints,
                         vpassword,
                         vrol_id,
                         vcity_id,
                         vadmissiondate);
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

DROP FUNCTION IF EXISTS `updateinventory`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `updateinventory` (`vid` INT, `vmiligrams` INT, `vname` VARCHAR(100), `vdescription` VARCHAR(5000), `vadmissiondate` DATE, `vexpirationdate` DATE, `vlotecode` VARCHAR(10), `vquantity` INT, `vprice` INT, `vprovider_id` INT, `vshelf_id` INT, `vtypeproduct_id` INT, `vlaboratory_id` INT, `vstatus_id` INT, `vimagen` VARCHAR(5000)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica una ciudad'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select name from inventory where name=vname and id<>vid)
		THEN
            UPDATE inventory
            SET  milligrams = vmiligrams,
								name = vname,
								description = vdescription,
                                admissiondate = vadmissiondate,
                                expirationdate = vexpirationdate,
                                lotecode = vlotecode,
                                quantity = vquantity,
                                price = vprice,
                                provider_id = vprovider_id,
                                shelf_id = vshelf_id,
                                typeproduct_id = vtypeproduct_id,
                                laboratory_id = vlaboratory_id,
                                status_id = vstatus_id,
                                imagen = vimagen
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

DROP FUNCTION IF EXISTS `updatepharmacy`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `updatepharmacy` (`vid` INT, `vname` VARCHAR(50), `vimagen` VARCHAR(5000), `vnit` VARCHAR(200)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica una farmacia'
BEGIN 
    DECLARE res INT DEFAULT 0;
IF NOT EXISTS(select name from pharmacy where name=vname and id<>vid)
		THEN
            UPDATE pharmacy
            SET  name=vname, imagen=vimagen, nit = vnit
            WHERE id=vid;
	set res=1;
		END IF;
	RETURN res;
END$$

DROP FUNCTION IF EXISTS `updatepoint`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `updatepoint` (`vid` INTEGER, `vpoints` INTEGER) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica un usuario'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select id from user where  id=vid)
		THEN

            UPDATE user
            SET  points = vpoints
            WHERE id=vid;

	set res=1;
								
			
		END IF;

	RETURN res;
END$$

DROP FUNCTION IF EXISTS `updateprovider`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `updateprovider` (`vid` INT, `vname` VARCHAR(50), `vnit` VARCHAR(100), `vaddress` VARCHAR(50), `vcity_id` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica un proveedor'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select name from provider where name=vname and id<>vid)
		THEN

            UPDATE provider
            SET  name=vname, nit=vnit, address = vaddress, city_id = vcity_id
            WHERE id=vid;

	set res=1;
								
			
		END IF;

	RETURN res;
END$$

DROP FUNCTION IF EXISTS `updatequantity`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `updatequantity` (`vid` INT, `vquantity` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica la cantidad de los productos.'
BEGIN 
    DECLARE res INT DEFAULT 0;
IF EXISTS(select id from inventory where id=vid)
		THEN
            UPDATE inventory
            SET  id = vid,
				 quantity = quantity - vquantity
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

DROP FUNCTION IF EXISTS `updateuser`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `updateuser` (`vid` INTEGER, `vname` VARCHAR(50), `vlastname` VARCHAR(50), `vdocumenttype` VARCHAR(50), `vdocumentnumber` VARCHAR(50), `vgender` VARCHAR(50), `vage` INTEGER, `vbirthdate` DATETIME, `vpoints` INTEGER, `vpassword` VARCHAR(100), `vrol_id` INTEGER, `vcity_id` INTEGER, `vadmissiondate` DATETIME) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica un usuario'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select name from user where documentnumber=vdocumentnumber and id<>vid)
		THEN

            UPDATE user
            SET  name=vname, lastname=vlastname, documenttype=vdocumenttype, documentnumber = vdocumentnumber, age = vage,
            gender = vgender, birthdate = vbirthdate, points = vpoints, password = vpassword,
            rol_id = vrol_id, city_id = vcity_id, admissiondate = vadmissiondate
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
  `description` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `city_department_fk` (`department_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `city`
--

INSERT DELAYED INTO `city` (`id`, `name`, `description`, `department_id`) VALUES
(24, 'asd', 'asd', 68),
(23, 'salento', 'Salento', 68),
(20, 'Armenia', 'Armenia', 68),
(21, 'Calarca', 'Calarca', 68);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `department`
--

INSERT DELAYED INTO `department` (`id`, `name`, `description`) VALUES
(68, 'Quindio', 'Quindio');

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detailsale`
--

INSERT DELAYED INTO `detailsale` (`id`, `inventory_id`, `sale_id`, `quantity`) VALUES
(1, 47, 1, 4);

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
  `imagen` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_laboratory_fk` (`laboratory_id`),
  KEY `inventory_provider_fk` (`provider_id`),
  KEY `inventory_shelf_fk` (`shelf_id`),
  KEY `inventory_status_fk` (`status_id`),
  KEY `inventory_typeproduct_fk` (`typeproduct_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inventory`
--

INSERT DELAYED INTO `inventory` (`id`, `milligrams`, `name`, `description`, `admissiondate`, `expirationdate`, `lotecode`, `quantity`, `price`, `provider_id`, `shelf_id`, `typeproduct_id`, `laboratory_id`, `status_id`, `imagen`) VALUES
(47, 9, 'asdasdasd', 'sdasdasd', '2020-05-22', '2020-02-01', 'asdas', 1, 1000, 12, 9, 5, 19, 3, 'Resource/Img/Inventory/2020_5_23_31100541_1301964629903999_7828916508636039120_n.jpg'),
(48, 10, 'prueba', 'asdasdasdas', '2020-05-25', '2020-01-01', 'asda', 0, 4, 12, 9, 5, 19, 3, 'Resource/Img/Inventory/2020_5_25_wallpaperflare.com_wallpaper (1).jpg');

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
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `laboratory`
--

INSERT DELAYED INTO `laboratory` (`id`, `name`, `description`) VALUES
(19, 'Bayer', 'Si es Bayer es bueno'),
(20, 'MK', 'medicamentos totalmente confiables');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pharmacy`
--

DROP TABLE IF EXISTS `pharmacy`;
CREATE TABLE IF NOT EXISTS `pharmacy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `imagen` varchar(5000) DEFAULT NULL,
  `nit` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pharmacy`
--

INSERT DELAYED INTO `pharmacy` (`id`, `name`, `imagen`, `nit`) VALUES
(16, 'Farmacia', 'Resource/Img/Pharmacy/2020_5_20_31100541_1301964629903999_7828916508636039120_n.jpg', 'ads1');

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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `provider`
--

INSERT DELAYED INTO `provider` (`id`, `name`, `nit`, `address`, `city_id`) VALUES
(12, 'Proveedor 1', '12345', 'Carrera tal calle tal', 20),
(13, 'proveedor2', '123456', 'carrera tal calle 2', 21);

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT DELAYED INTO `rol` (`id`, `name`, `description`) VALUES
(1, 'Empleado', 'Gestion de inventario/ventas'),
(2, 'Administrador', 'Gestiona todas la acciones en la farmacias'),
(3, 'cliente', 'usuario comun');

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
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sale`
--

INSERT DELAYED INTO `sale` (`id`, `saledate`, `saletotal`, `client_id`, `employee_id`) VALUES
(8, '2020-05-27', 8012, 44, 41),
(7, '2020-05-26', 8012, 46, 43),
(6, '2020-05-26', 8012, 44, 43),
(9, '2020-05-27', 8012, 46, 41),
(10, '2020-05-27', 8012, 44, 41),
(11, '2020-05-27', 8012, 44, 41),
(12, '2020-05-27', 2012, 44, 41),
(13, '2020-05-27', 2012, 44, 43),
(14, '2020-05-27', 6008, 44, 43),
(15, '2020-05-27', 8012, 44, 41),
(16, '2020-05-27', 4004, 44, 41),
(17, '2020-05-27', 11008, 44, 41),
(18, '2020-05-27', 4004, 44, 41),
(19, '2020-05-27', 2004, 44, 41),
(20, '2020-05-27', 3000, 44, 41),
(21, '2020-05-27', 3000, 44, 41),
(22, '2020-05-27', 12, 44, 41),
(23, '2020-05-27', 3000, 44, 41),
(24, '2020-05-27', 6016, 44, 41),
(25, '2020-05-27', 8016, 44, 41),
(26, '2020-05-27', 4016, 44, 41),
(27, '2020-05-27', 10020, 44, 41),
(28, '2020-05-27', 7000, 44, 41),
(29, '2020-05-27', 32, 44, 41),
(30, '2020-05-27', 10000, 44, 41),
(31, '2020-05-27', 32, 44, 41),
(32, '2020-05-27', 3000, 44, 41),
(33, '2020-05-27', 6000, 44, 41),
(34, '2020-05-27', 7000, 44, 41),
(35, '2020-05-27', 32, 44, 41),
(36, '2020-05-27', 8000, 44, 41),
(37, '2020-05-27', 9000, 44, 41),
(38, '2020-05-27', 9000, 44, 41),
(39, '2020-05-27', 32, 44, 41),
(40, '2020-05-27', 9000, 44, 41),
(41, '2020-05-27', 32, 44, 41),
(42, '2020-05-27', 10000, 44, 41),
(43, '2020-05-27', 10000, 44, 41),
(44, '2020-05-27', 10000, 44, 41),
(45, '2020-05-27', 10000, 44, 41),
(46, '2020-05-27', 7000, 44, 43),
(47, '2020-05-27', 32, 44, 41),
(48, '2020-05-27', 7000, 44, 41),
(49, '2020-05-27', 2000, 44, 41),
(50, '2020-05-27', 1000, 44, 41),
(51, '2020-05-27', 4, 44, 41),
(52, '2020-05-27', 1000, 44, 41),
(53, '2020-05-27', 5000, 44, 41),
(54, '2020-05-27', 8036, 44, 41),
(55, '2020-05-27', 18040, 44, 41);

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `shelf`
--

INSERT DELAYED INTO `shelf` (`id`, `name`, `description`) VALUES
(9, 'Estante 1', 'Jeringas'),
(10, 'Estante 3', 'Acetaminofenasdasd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `state`
--

DROP TABLE IF EXISTS `state`;
CREATE TABLE IF NOT EXISTS `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `state`
--

INSERT DELAYED INTO `state` (`id`, `name`) VALUES
(3, 'diegoddddd');

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `typeproduct`
--

INSERT DELAYED INTO `typeproduct` (`id`, `name`, `description`) VALUES
(5, 'asdasdasdasd', 'asdasdasdad'),
(6, 'zxczx', 'czxczxc');

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
  `password` varchar(100) DEFAULT NULL,
  `rol_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `admissiondate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_city_fk` (`city_id`),
  KEY `user_rol_fk` (`rol_id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT DELAYED INTO `user` (`id`, `name`, `lastname`, `documenttype`, `documentnumber`, `gender`, `age`, `birthdate`, `points`, `password`, `rol_id`, `city_id`, `admissiondate`) VALUES
(44, 'Alvaro', 'Corrales', 'Cedula', '456', 'Masculino', 6, '2020-01-01', 100, '$2y$10$867gvpzqEJf7Bx/4hv1tcOwWDNNH0QGJ201hdhVw4RTu6S9L77Q4i', 3, 20, '2020-05-22'),
(45, 'asdasd', 'asdasdasd', 'Cedula', '123', 'Masculino', 3, '2020-01-01', 0, '$2y$10$mD2ycuqPH.4dZ2vM4C2t3.Q3r1itBN4R4E8Wo1CdsOO1lyjuIsati', 1, 20, '2020-05-22'),
(46, 'Diego', 'Alejandro', 'Cedula', '123789', 'Masculino', 24, '2020-01-01', 0, '$2y$10$bZQ5WpPkMR10JnDfudhDNekzV64VATFFlxBjlfD59N8Q2Jkc5Vsle', 3, 20, '2020-05-24'),
(43, 'Johan', 'Meneses', 'Cedula', '147', 'Masculino', 27, '2020-05-22', 0, '$2y$10$iKZrQcsjcReig2ODIw.Cyu/KOMX..Q9erPaqkkl7Yrx8D/OkboUTK', 1, 20, '2020-05-22'),
(42, 'Administrador', 'Admin', 'Cedula', '1094950977', 'Masculino', 24, '2020-02-01', 0, '$2y$10$WrmcO6z0WTxAQjd8XXZM.OJUMyaYcwIbvzHPnFhx.MWsKFvqP0O36', 2, 20, '2020-05-22'),
(41, 'Cristian2', 'Ospina', 'Cedula', '12345', 'Masculino', 3, '2020-01-01', 0, '$2y$10$ZHMvs3VjuwBz3CScIAeGcO7kEMdMJHzhnqgRb6Bb8RSePr1sHHMMC', 1, 20, '2020-05-22');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
