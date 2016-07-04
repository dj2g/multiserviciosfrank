/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : sisventas

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-05-16 17:02:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for lineas
-- ----------------------------
DROP TABLE IF EXISTS `lineas`;
CREATE TABLE `lineas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `idtipo` int(10) unsigned DEFAULT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categorias_idtipo_foreign` (`idtipo`),
  CONSTRAINT `lineas_ibfk_1` FOREIGN KEY (`idtipo`) REFERENCES `tipoproductos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of lineas
-- ----------------------------
INSERT INTO `lineas` VALUES ('1', 'BRACIER', '2', '1');
INSERT INTO `lineas` VALUES ('2', 'INTERIORES', '1', '1');
INSERT INTO `lineas` VALUES ('3', 'ANILLO', '2', '1');
INSERT INTO `lineas` VALUES ('4', 'GANCHOS', '2', '1');
INSERT INTO `lineas` VALUES ('5', 'PANTALON', '1', '1');
INSERT INTO `lineas` VALUES ('6', 'POLOS', '1', '1');
INSERT INTO `lineas` VALUES ('7', 'BLUSA', '1', '1');
INSERT INTO `lineas` VALUES ('8', 'LLAVEROS', '2', '1');
INSERT INTO `lineas` VALUES ('9', 'MONEDEROS', '2', '1');
INSERT INTO `lineas` VALUES ('10', 'VINCHAS', '2', '1');
INSERT INTO `lineas` VALUES ('11', 'CARTERAS', '5', '1');
INSERT INTO `lineas` VALUES ('12', 'MORRALES', '5', '1');
INSERT INTO `lineas` VALUES ('13', 'UÑAS DE PIE', '2', '1');
INSERT INTO `lineas` VALUES ('14', 'PULSERAS', '2', '1');
INSERT INTO `lineas` VALUES ('15', 'ARETES', '2', '1');
INSERT INTO `lineas` VALUES ('16', 'aaaa', '2', '0');
INSERT INTO `lineas` VALUES ('17', 'SHORT', '1', '1');
INSERT INTO `lineas` VALUES ('18', 'FALDA', '1', '1');
INSERT INTO `lineas` VALUES ('19', 'TORERO', '1', '1');
INSERT INTO `lineas` VALUES ('20', 'ESNIQUER', '1', '1');
INSERT INTO `lineas` VALUES ('21', 'UÑAS DE MANO', '2', '1');
INSERT INTO `lineas` VALUES ('22', 'ENTERISOS', '1', '1');
INSERT INTO `lineas` VALUES ('23', 'OBEROL', '2', '1');
INSERT INTO `lineas` VALUES ('24', 'VESTIDO', '1', '1');
INSERT INTO `lineas` VALUES ('25', 'FAJA', '1', '1');
INSERT INTO `lineas` VALUES ('26', 'CORREA', '2', '1');
INSERT INTO `lineas` VALUES ('27', 'LENTES', '2', '1');
INSERT INTO `lineas` VALUES ('28', 'NIÑOS', '1', '1');
INSERT INTO `lineas` VALUES ('29', 'NIÑAS', '1', '1');
INSERT INTO `lineas` VALUES ('30', 'VIVIRY', '1', '1');
INSERT INTO `lineas` VALUES ('31', 'CAMISA', '1', '1');
INSERT INTO `lineas` VALUES ('32', 'ROPA DE BAÑO', '1', '1');
INSERT INTO `lineas` VALUES ('33', 'PILLAMAS-BEIBIDORES', '1', '1');
INSERT INTO `lineas` VALUES ('34', 'aaaa', '1', '0');
INSERT INTO `lineas` VALUES ('35', '111111', '1', '0');
INSERT INTO `lineas` VALUES ('39', 'denys', '1', '0');
INSERT INTO `lineas` VALUES ('40', 'asd', '1', '0');

-- ----------------------------
-- Table structure for modulos
-- ----------------------------
DROP TABLE IF EXISTS `modulos`;
CREATE TABLE `modulos` (
  `idmodulo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `estado` smallint(6) DEFAULT NULL,
  `idmodulo_padre` int(11) DEFAULT NULL,
  `icono` varchar(100) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`idmodulo`),
  KEY `idmodulo_padre` (`idmodulo_padre`),
  CONSTRAINT `modulos_ibfk_1` FOREIGN KEY (`idmodulo_padre`) REFERENCES `modulos` (`idmodulo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of modulos
-- ----------------------------
INSERT INTO `modulos` VALUES ('1', 'ALMACEN', '#', '1', '0', 'fa fa-list-alt fa-lg', '1');
INSERT INTO `modulos` VALUES ('5', 'PRODUCTO', 'productos', '1', '1', null, '1');
INSERT INTO `modulos` VALUES ('6', 'LINEA', 'lineas', '1', '1', null, '2');
INSERT INTO `modulos` VALUES ('7', 'Tipo de Producto', 'tipo_productos', '1', '1', null, '3');
INSERT INTO `modulos` VALUES ('8', 'SEGURIDAD', '#', '1', '0', 'fa fa-lock fa-lg', '2');
INSERT INTO `modulos` VALUES ('9', 'PERMISOS', 'PERMISOS', '1', '8', null, '1');
INSERT INTO `modulos` VALUES ('10', 'USUARIO', 'USUARIO', '1', '8', null, '4');
INSERT INTO `modulos` VALUES ('11', 'PERFIL', 'PERFILES', '1', '8', null, '5');
INSERT INTO `modulos` VALUES ('12', 'MODULOS', 'MODULOS', '1', '8', null, '3');
INSERT INTO `modulos` VALUES ('13', 'MODULO PADRE', '#', '0', '0', null, null);

-- ----------------------------
-- Table structure for perfil
-- ----------------------------
DROP TABLE IF EXISTS `perfil`;
CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `estado` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of perfil
-- ----------------------------
INSERT INTO `perfil` VALUES ('1', 'GERENTE ADMINISTRADOR', '1');
INSERT INTO `perfil` VALUES ('2', 'EMPLEADO', '1');

-- ----------------------------
-- Table structure for permisos
-- ----------------------------
DROP TABLE IF EXISTS `permisos`;
CREATE TABLE `permisos` (
  `id_perfil` int(11) NOT NULL,
  `idmodulo` int(11) NOT NULL,
  `estado` smallint(11) DEFAULT NULL,
  KEY `id_perfil` (`id_perfil`),
  KEY `idmodulo` (`idmodulo`),
  CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`),
  CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`idmodulo`) REFERENCES `modulos` (`idmodulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of permisos
-- ----------------------------
INSERT INTO `permisos` VALUES ('1', '1', '1');
INSERT INTO `permisos` VALUES ('1', '5', '1');
INSERT INTO `permisos` VALUES ('1', '6', '1');
INSERT INTO `permisos` VALUES ('1', '7', '1');
INSERT INTO `permisos` VALUES ('1', '8', '1');
INSERT INTO `permisos` VALUES ('1', '9', '1');
INSERT INTO `permisos` VALUES ('1', '10', '1');
INSERT INTO `permisos` VALUES ('1', '11', '1');
INSERT INTO `permisos` VALUES ('1', '12', '1');

-- ----------------------------
-- Table structure for productos
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stockactual` decimal(18,3) NOT NULL DEFAULT '0.000',
  `codigobarra` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `codigoempresa` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idlinea` int(10) unsigned NOT NULL,
  `preciopromedio` decimal(14,4) NOT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productos_idlinea_foreign` (`idlinea`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idlinea`) REFERENCES `lineas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of productos
-- ----------------------------

-- ----------------------------
-- Table structure for tipoproductos
-- ----------------------------
DROP TABLE IF EXISTS `tipoproductos`;
CREATE TABLE `tipoproductos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `abreviacion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tipoproductos
-- ----------------------------
INSERT INTO `tipoproductos` VALUES ('1', 'Ropa', 'rop', '1');
INSERT INTO `tipoproductos` VALUES ('2', 'Vizuteria', 'viz.', '1');
INSERT INTO `tipoproductos` VALUES ('3', 'Juguetes', 'jug.', '1');
INSERT INTO `tipoproductos` VALUES ('4', 'Relojes', 're.', '1');
INSERT INTO `tipoproductos` VALUES ('5', 'Carteras', 'car.', '1');
INSERT INTO `tipoproductos` VALUES ('6', 'denys', 'dns', '0');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `dni` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `clave` varchar(100) DEFAULT NULL,
  `id_perfil` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_perfil` (`id_perfil`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('1', 'DENYS', 'GUERRERO', 'DIRECCION', '12345678', '123456', 'ADMIN', '123', '1', '1');
INSERT INTO `usuario` VALUES ('2', 'JOEL', 'GUERRERO GUERRA', 'MARGINAL SUR', '74023929', '8777', 'USER', '123', '2', '0');

-- ----------------------------
-- Procedure structure for act_usuario
-- ----------------------------
DROP PROCEDURE IF EXISTS `act_usuario`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `act_usuario`(p_id_usuario int , p_nombres varchar(100), p_apellidos varchar(100), p_direccion varchar(100), p_dni varchar(100), p_telefono varchar(100), p_usuario varchar(100), p_clave varchar(100), p_id_perfil int )
BEGIN

UPDATE usuario SET nombres = p_nombres,apellidos=p_apellidos, direccion = p_direccion, dni = p_dni, telefono = p_telefono, usuario = p_usuario,
	clave = p_clave, id_perfil = p_id_perfil
WHERE id_usuario = p_id_usuario;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for elim_usuario
-- ----------------------------
DROP PROCEDURE IF EXISTS `elim_usuario`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `elim_usuario`(p_id_usuario int )
BEGIN

UPDATE usuario SET estado = 0
WHERE id_usuario = p_id_usuario;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for ins_usuario
-- ----------------------------
DROP PROCEDURE IF EXISTS `ins_usuario`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_usuario`(p_nombres varchar(100), p_apellidos varchar(100), p_direccion varchar(100), p_dni varchar(100), p_telefono varchar(100), p_usuario varchar(100), p_clave varchar(100), p_id_perfil int )
begin
INSERT INTO usuario (nombres,apellidos,direccion,dni,telefono,usuario,clave,id_perfil,estado)
VALUES (p_nombres,p_apellidos,p_direccion,p_dni,p_telefono,p_usuario,p_clave,p_id_perfil,1);
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_elimina_modulos
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_elimina_modulos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_elimina_modulos`(xid int)
begin
UPDATE modulos SET estado = 0
WHERE idmodulo = xid;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_elimina_perfil
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_elimina_perfil`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_elimina_perfil`(xid int)
begin
UPDATE perfil SET estado = 0
WHERE id_perfil = xid;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_elimina_permisos
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_elimina_permisos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_elimina_permisos`(xid_perfil int , xidmodulo int )
begin
declare xmensaje varchar(50);
	UPDATE permisos set estado=0
	WHERE id_perfil=xid_perfil AND idmodulo=xidmodulo;


end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_inserta_actualiza_modulos
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_inserta_actualiza_modulos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_inserta_actualiza_modulos`(xidmodulo int, xdescripcion varchar(100), xurl varchar(200), xestado smallint(6), xidmodulo_padre int, xicono varchar(100))
begin
declare xid int;
IF (xidmodulo=0)
	THEN
		IF NOT EXISTS (SELECT idmodulo FROM modulos)
			THEN
				INSERT into modulos VALUES (
				1,
				xdescripcion,
				xurl,
				xestado,
				xidmodulo_padre,
				xicono);
		ELSE
				set xid =(SELECT MAX(idmodulo) FROM modulos)+1;
				INSERT into modulos(
				idmodulo,
				descripcion,
				url,
				estado,
				idmodulo_padre,
				icono)
				VALUES (
				xid,
				xdescripcion,
				xurl,
				xestado,
				xidmodulo_padre,
				xicono);
			END if;
ELSE
		UPDATE modulos SET 
			descripcion=xdescripcion,
			url=xurl,
			estado=xestado,
			idmodulo_padre= xidmodulo_padre,
			icono=xicono
		WHERE idmodulo=xidmodulo;
	END if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_inserta_actualiza_perfil
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_inserta_actualiza_perfil`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_inserta_actualiza_perfil`(xid_perfil int, xdescripcion varchar(100))
begin
declare 
	xid int;
IF (xid_perfil=0)
	THEN
		IF NOT EXISTS (SELECT id_perfil FROM perfil)
			THEN
				INSERT into perfil VALUES (
				1,
				xdescripcion, 1);
		ELSE
				 set xid = (SELECT MAX(id_perfil) FROM perfil)+1;
				INSERT into perfil(
				id_perfil,
				descripcion, estado)
				VALUES (
				xid,
				xdescripcion, 1);
			END if;
ELSE
		UPDATE perfil SET 
			descripcion=xdescripcion
		WHERE id_perfil=xid_perfil;
end if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_inserta_actualiza_permisos
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_inserta_actualiza_permisos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_inserta_actualiza_permisos`(xid_perfil int, xidmodulo int, xestado smallint(6))
begin
declare 
	xid int;
	IF NOT EXISTS (select * from permisos where id_perfil=xid_perfil and idmodulo=xidmodulo)
		THEN
		INSERT into permisos(id_perfil, idmodulo, estado) VALUES(xid_perfil,xidmodulo, xestado);	
	ELSE
		UPDATE permisos SET 
				estado=xestado
		WHERE id_perfil=xid_perfil and idmodulo=xidmodulo;
		END if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_selecciona_login
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_selecciona_login`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_selecciona_login`(xusuario VARCHAR(100), xclave varchar(100))
BEGIN
IF (xclave='')
	THEN 
	 
		SELECT *, '' FROM usuario WHERE usuario=xusuario;
	
		ELSE
		
		SELECT u.*, p.descripcion as perfil FROM usuario as u inner join perfil as p on u.id_perfil=p.id_perfil
		WHERE u.usuario=xusuario AND u.clave = xclave;
	
	END if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_selecciona_modulos
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_selecciona_modulos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_selecciona_modulos`(xid int,  xdescripcion varchar(100),  xmodulo_padre varchar(100),  xid_perfil int)
begin
IF (xid = 0 and xdescripcion='' and xmodulo_padre='')
		THEN

					SELECT	M.idmodulo,M.descripcion,M.url as m_url,M.estado,M.idmodulo_padre ,M.icono ,M.orden, M.descripcion as xmodulos , M.descripcion as modulos_hijos , M.url,
					P.descripcion as modulo_padre
					FROM modulos as M INNER JOIN modulos as P on M.idmodulo_padre = P.idmodulo
					WHERE M.idmodulo<>0 and M.estado<>0
order by M.orden;
					
END IF;
		IF (xid = 0 and xdescripcion<>'' and xmodulo_padre='')
		THEN
	
					SELECT	M.idmodulo,M.descripcion,M.url as m_url,M.estado,M.idmodulo_padre ,M.icono ,M.orden, M.descripcion as xmodulos , M.descripcion as modulos_hijos , M.url,
					P.descripcion as modulo_padre
					FROM modulos as M INNER JOIN modulos as P on M.idmodulo_padre = P.idmodulo
					WHERE M.idmodulo<>0 and M.descripcion LIKE concat('%',xdescripcion,'%') and M.estado<>0
					order by M.orden;
	END IF;

		IF (xid = 0 and xdescripcion='' and xmodulo_padre<>'')
			THEN
			
			SELECT	M.idmodulo,M.descripcion,M.url as m_url,M.estado,M.idmodulo_padre ,M.icono,M.orden , M.descripcion as xmodulos , M.descripcion as modulos_hijos , M.url,
			P.descripcion as modulo_padre
			FROM modulos as M INNER JOIN modulos as P on M.idmodulo_padre = P.idmodulo
			WHERE M.idmodulo<>0 and P.descripcion LIKE concat('%',xmodulo_padre,'%') and M.estado<>0
			 order by M.orden;
			END IF;
	
IF(xid=9999 and xdescripcion='' and xmodulo_padre='')
	THEN
	 
					SELECT	M.idmodulo,M.descripcion,M.url as m_url,M.estado,M.idmodulo_padre ,M.icono ,M.orden, M.descripcion as xmodulos , P.descripcion as modulos_hijos , P.url,
				P.descripcion as modulo_padre
					from modulos as M inner join modulos as P on(M.idmodulo=P.idmodulo_padre)
					inner join permisos as per on  (per.idmodulo=P.idmodulo)
					where M.idmodulo<>0 and per.id_perfil=xid_perfil and per.estado=1 and M.estado=1 and P.estado = 1
					order by M.orden;
		 
ELSE
					IF EXISTS(SELECT modulos.* FROM modulos WHERE modulos.idmodulo=xid)
						THEN
						 
							SELECT	M.idmodulo,M.descripcion,M.url as m_url,M.estado,M.idmodulo_padre ,M.icono ,M.orden , M.descripcion as xmodulos , M.descripcion as modulos_hijos , M.url,
							P.descripcion as modulo_padre
							FROM modulos as M INNER JOIN modulos as P on M.idmodulo_padre = P.idmodulo
							WHERE M.idmodulo=xid AND M.idmodulo<>0 and M.estado<>0
							order by M.orden;
					ELSE
						SELECT('Este código de módulo no existe en la base de datos.');
						 
						END if;
	END if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_selecciona_modulos_p
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_selecciona_modulos_p`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_selecciona_modulos_p`(xid int)
begin
IF (xid = 0)
THEN
 
SELECT * FROM modulos WHERE idmodulo_padre = 0  ;
 
ELSE
IF EXISTS(SELECT * FROM modulos WHERE idmodulo=xid)
then
 
SELECT * FROM modulos WHERE idmodulo_padre = 0 AND idmodulo=xid  ;
 
		ELSE
			SELECT('NO EXISTE ID EN LA BASE DE DATOS');
			 
			END if;
	END if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_selecciona_perfil
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_selecciona_perfil`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_selecciona_perfil`(xid int , xdescripcion VARCHAR(100))
BEGIN
IF (xid = 0 and xdescripcion='')
		THEN 
	  
		SELECT  * from perfil
		where  id_perfil<>0 and  estado<>0;
		 
	END if;
IF (xid = 0 and xdescripcion<>'')
		THEN 
	  
		SELECT  * from perfil 
		where  id_perfil<>0 and   descripcion LIKE concat('%',xdescripcion,'%') and  estado<>0;
		 
	END if;
IF (xid <> 0 and xdescripcion='')
		THEN 
		IF EXISTS(  SELECT  * from perfil  WHERE  id_perfil=xid)
				THEN 
	  
				SELECT  * from perfil  WHERE  id_perfil=xid and  estado<>0;
				  
		ELSE
			SELECT('NO EXISTE EL ID EN LA BASE DE DATOS');
			 
			END if;
	END if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_selecciona_permisos
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_selecciona_permisos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_selecciona_permisos`(xid_perfil  int,  xidmodulo int)
BEGIN
IF (xid_perfil = 0 AND xidmodulo=0)
		THEN 
	  
		SELECT p.*, per.descripcion as pperfil , m.descripcion as mmodulo
		FROM permisos as p inner join perfil as per on(p.id_perfil=per.id_perfil)
						inner join modulos as m on(p.idmodulo=m.idmodulo);
	END if;
IF (xid_perfil <> 0 AND xidmodulo=0)
		THEN 
	  
				SELECT p.*, per.descripcion as pperfil , m.descripcion as mmodulo
				FROM permisos as p inner join perfil as per on(p.id_perfil=per.id_perfil)
						inner join modulos as m on(p.idmodulo=m.idmodulo)
						WHERE p.id_perfil=xid_perfil AND p.estado=1;	
		  
		ELSE
		IF EXISTS(SELECT permisos.* FROM permisos WHERE permisos.id_perfil=xid_perfil AND permisos.idmodulo=xidmodulo)
				THEN 
	  
				SELECT p.*,  per.descripcion as pperfil , m.descripcion as mmodulo
		FROM permisos as p inner join perfil as per on(p.id_perfil=per.id_perfil)
						inner join modulos as m on(p.idmodulo=m.idmodulo)
						WHERE p.id_perfil=xid_perfil AND p.idmodulo=xidmodulo;
			  
		ELSE
			SELECT('NO EXISTE EL ID EN LA BASE DE DATOS');
			 
			END if;
	END if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_sel_informacion
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_sel_informacion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_sel_informacion`()
BEGIN
IF EXISTS(SELECT * FROM informacion WHERE id=1)
	THEN
	 
	SELECT * FROM informacion WHERE id=1;
		 
ELSE
	select('Nonexistent ID --> %');
 
	
END if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for selmoduoloxurl
-- ----------------------------
DROP PROCEDURE IF EXISTS `selmoduoloxurl`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `selmoduoloxurl`(p_url varchar(200))
BEGIN

		SELECT * FROM modulos where url=p_url and estado = 1;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sel_usuario
-- ----------------------------
DROP PROCEDURE IF EXISTS `sel_usuario`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_usuario`(  p_id_usuario int,   p_nombres varchar(100),
   p_apellidos varchar(100),   p_usuario varchar(100),   p_perfil varchar(100))
BEGIN

IF (p_id_usuario = 0 AND p_nombres = '' AND p_apellidos = '' AND p_usuario = '' AND p_perfil = '')
	THEN
	 
		SELECT u.*,p.descripcion as pperfil
		FROM usuario u inner join perfil p on u.id_perfil = p.id_perfil
		WHERE u.estado = 1;
	 
END if;
IF (p_id_usuario <> 0 AND p_nombres = '' AND p_apellidos = '' AND p_usuario = '' AND p_perfil = '')
	THEN
	 
		SELECT u.*,p.descripcion as pperfil
		FROM usuario u inner join perfil p on u.id_perfil = p.id_perfil
		WHERE u.estado = 1 and u.id_usuario = p_id_usuario;
	 
END if;
IF (p_id_usuario = 0 AND p_nombres <> '' AND p_apellidos = '' AND p_usuario = '' AND p_perfil = '')
	THEN
	 
		SELECT u.*,p.descripcion as pperfil
		FROM usuario u inner join perfil p on u.id_perfil = p.id_perfil
		WHERE u.estado = 1 and u.nombres LIKE concat('%',p_nombres,'%');
	 
END if;
IF (p_id_usuario = 0 AND p_nombres = '' AND p_apellidos <> '' AND p_usuario = '' AND p_perfil = '')
	THEN
	 
		SELECT u.*,p.descripcion as pperfil
		FROM usuario u inner join perfil p on u.id_perfil = p.id_perfil
		WHERE u.estado = 1 and u.apellidos LIKE  concat('%',p_apellidos,'%');
	 
END if;
IF (p_id_usuario = 0 AND p_nombres = '' AND p_apellidos = '' AND p_usuario <> '' AND p_perfil = '')
	THEN
	 
		SELECT u.*,p.descripcion as pperfil
		FROM usuario u inner join perfil p on u.id_perfil = p.id_perfil
		WHERE u.estado = 1 and u.usuario LIKE concat('%',p_usuario,'%');
	 
END if;
IF (p_id_usuario = 0 AND p_nombres = '' AND p_apellidos = '' AND p_usuario = '' AND p_perfil <> '')
	THEN
	 
		SELECT u.*,p.descripcion as pperfil
		FROM usuario u inner join perfil p on u.id_perfil = p.id_perfil
		WHERE u.estado = 1 and p.descripcion LIKE concat('%',p_perfil,'%');
	 
END if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for valida_acceso
-- ----------------------------
DROP PROCEDURE IF EXISTS `valida_acceso`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `valida_acceso`(xid_perfil int ,  xmodulo varchar(100))
BEGIN
 
SELECT p.*, per.descripcion as pperfil , m.descripcion as mmodulo
FROM permisos as p inner join perfil as per on(p.id_perfil=per.id_perfil)
	inner join modulos as m on(p.idmodulo=m.idmodulo)
	WHERE p.id_perfil=xid_perfil AND m.url=xmodulo AND m.estado = 1 and p.estado=1;
 

END
;;
DELIMITER ;
