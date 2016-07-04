/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50141
Source Host           : 127.0.0.1:3306
Source Database       : bdveterinaria

Target Server Type    : MYSQL
Target Server Version : 50141
File Encoding         : 65001

Date: 2015-02-17 22:45:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for animal
-- ----------------------------
DROP TABLE IF EXISTS `animal`;
CREATE TABLE `animal` (
  `idanimal` int(11) NOT NULL AUTO_INCREMENT,
  `idservicio` int(6) DEFAULT NULL,
  `nombre` varchar(70) DEFAULT NULL,
  `pedigree` varchar(20) DEFAULT NULL,
  `sexo` varchar(10) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `npadre` int(11) DEFAULT NULL,
  `nmadre` int(11) DEFAULT NULL,
  `foto` text,
  `caracteristicas` text,
  `observaciones` text,
  `idcategoria` int(10) DEFAULT NULL,
  `idespecie` int(10) DEFAULT NULL,
  `idetapa` int(10) DEFAULT NULL,
  `idlote` int(10) DEFAULT NULL,
  `idestado` int(10) DEFAULT NULL,
  `idraza` int(10) DEFAULT NULL,
  `estado` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`idanimal`),
  KEY `idraza` (`idraza`),
  KEY `idestado` (`idestado`),
  KEY `idlote` (`idlote`),
  KEY `idetapa` (`idetapa`),
  KEY `idespecie` (`idespecie`),
  KEY `idcategoria` (`idcategoria`),
  KEY `idservicio` (`idservicio`),
  CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`idraza`) REFERENCES `razas` (`idraza`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `animal_ibfk_2` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`idcategoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `animal_ibfk_3` FOREIGN KEY (`idespecie`) REFERENCES `especies` (`idespecie`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `animal_ibfk_4` FOREIGN KEY (`idetapa`) REFERENCES `etapas` (`idetapa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `animal_ibfk_5` FOREIGN KEY (`idlote`) REFERENCES `lotes` (`idlote`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `animal_ibfk_6` FOREIGN KEY (`idestado`) REFERENCES `estados` (`idestado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `animal_ibfk_7` FOREIGN KEY (`idservicio`) REFERENCES `servicios` (`idservicio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of animal
-- ----------------------------
INSERT INTO `animal` VALUES ('1', '1', 'asd', 'asd', 'H', '2015-02-11', '0', '0', 'as', 'asdasd', 'asdas', '1', '3', '1', '2', '1', '1', '1');
INSERT INTO `animal` VALUES ('2', '2', 'asda', 'asd', 'M', '2015-02-17', '0', '0', 'asd', 'sadasd', 'asd', '1', '3', '1', '2', '1', '1', '1');
INSERT INTO `animal` VALUES ('3', '3', 'ASDBBBBBBBBASD', 'SAD', 'M', '2015-02-05', '1', '1', 'AS', 'ASDASD', 'ASDASDAD', '3', '1', '4', '4', '2', '3', '1');

-- ----------------------------
-- Table structure for bajas
-- ----------------------------
DROP TABLE IF EXISTS `bajas`;
CREATE TABLE `bajas` (
  `idbaja` int(6) NOT NULL AUTO_INCREMENT,
  `idanimal` int(6) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `estado` smallint(1) DEFAULT '1',
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`idbaja`),
  KEY `idanimal` (`idanimal`),
  CONSTRAINT `bajas_ibfk_1` FOREIGN KEY (`idanimal`) REFERENCES `animal` (`idanimal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bajas
-- ----------------------------
INSERT INTO `bajas` VALUES ('1', '3', 'ASD', '1', '2015-02-12');
INSERT INTO `bajas` VALUES ('2', '1', 'BBBB', '1', '2015-02-18');
INSERT INTO `bajas` VALUES ('3', '2', 'TTTTT', '1', '0000-00-00');

-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `idcategoria` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) DEFAULT NULL,
  `estado` smallint(1) DEFAULT '1',
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of categorias
-- ----------------------------
INSERT INTO `categorias` VALUES ('1', 'VAQUILLONA', '1');
INSERT INTO `categorias` VALUES ('2', 'TERNERO', '0');
INSERT INTO `categorias` VALUES ('3', 'TERNERO', '1');

-- ----------------------------
-- Table structure for enfermedades
-- ----------------------------
DROP TABLE IF EXISTS `enfermedades`;
CREATE TABLE `enfermedades` (
  `idenfermedad` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) DEFAULT NULL,
  `estado` smallint(1) DEFAULT '1',
  `idanimal` int(11) DEFAULT NULL,
  `idlote` int(11) DEFAULT NULL,
  PRIMARY KEY (`idenfermedad`),
  KEY `idanimal` (`idanimal`),
  KEY `idlote` (`idlote`),
  CONSTRAINT `enfermedades_ibfk_1` FOREIGN KEY (`idanimal`) REFERENCES `animal` (`idanimal`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `enfermedades_it idlote` FOREIGN KEY (`idlote`) REFERENCES `lotes` (`idlote`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of enfermedades
-- ----------------------------

-- ----------------------------
-- Table structure for especies
-- ----------------------------
DROP TABLE IF EXISTS `especies`;
CREATE TABLE `especies` (
  `idespecie` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) DEFAULT NULL,
  `estado` smallint(1) DEFAULT '1',
  PRIMARY KEY (`idespecie`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of especies
-- ----------------------------
INSERT INTO `especies` VALUES ('1', 'EQUINO', '1');
INSERT INTO `especies` VALUES ('2', 'VACUNO', '0');
INSERT INTO `especies` VALUES ('3', 'VACUNO', '1');
INSERT INTO `especies` VALUES ('4', 'PORCINO', '1');

-- ----------------------------
-- Table structure for estados
-- ----------------------------
DROP TABLE IF EXISTS `estados`;
CREATE TABLE `estados` (
  `idestado` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) DEFAULT NULL,
  `estado` smallint(1) DEFAULT '1',
  PRIMARY KEY (`idestado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of estados
-- ----------------------------
INSERT INTO `estados` VALUES ('1', 'EN CUIDADO', '0');
INSERT INTO `estados` VALUES ('2', 'ENFERMO', '1');
INSERT INTO `estados` VALUES ('3', 'EN CUIDADO', '1');
INSERT INTO `estados` VALUES ('4', 'RECIEN NACIDO', '1');
INSERT INTO `estados` VALUES ('5', 'SANO', '1');

-- ----------------------------
-- Table structure for etapas
-- ----------------------------
DROP TABLE IF EXISTS `etapas`;
CREATE TABLE `etapas` (
  `idetapa` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) DEFAULT NULL,
  `estado` smallint(1) DEFAULT '1',
  PRIMARY KEY (`idetapa`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of etapas
-- ----------------------------
INSERT INTO `etapas` VALUES ('1', 'MACHITO', '0');
INSERT INTO `etapas` VALUES ('2', 'CRIA', '0');
INSERT INTO `etapas` VALUES ('3', 'ASDASD', '0');
INSERT INTO `etapas` VALUES ('4', 'TERNERO', '1');
INSERT INTO `etapas` VALUES ('5', 'BORREGO', '1');
INSERT INTO `etapas` VALUES ('6', 'CHANCHITO', '1');
INSERT INTO `etapas` VALUES ('7', 'ASD', '1');

-- ----------------------------
-- Table structure for lactancias
-- ----------------------------
DROP TABLE IF EXISTS `lactancias`;
CREATE TABLE `lactancias` (
  `idlactancia` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text,
  `estado` smallint(1) DEFAULT NULL,
  `idanimal` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`idlactancia`),
  KEY `idanimal` (`idanimal`),
  CONSTRAINT `lactancias_ibfk_1` FOREIGN KEY (`idanimal`) REFERENCES `animal` (`idanimal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lactancias
-- ----------------------------

-- ----------------------------
-- Table structure for lotes
-- ----------------------------
DROP TABLE IF EXISTS `lotes`;
CREATE TABLE `lotes` (
  `idlote` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) DEFAULT NULL,
  `idparcela` int(10) DEFAULT NULL,
  `estado` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`idlote`),
  KEY `idparcela` (`idparcela`),
  CONSTRAINT `lotes_ibfk_1` FOREIGN KEY (`idparcela`) REFERENCES `parcelas` (`idparcela`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lotes
-- ----------------------------
INSERT INTO `lotes` VALUES ('2', 'NBB', '4', '1');
INSERT INTO `lotes` VALUES ('3', 'ASDA', '5', '0');
INSERT INTO `lotes` VALUES ('4', 'CCCC', '1', '1');

-- ----------------------------
-- Table structure for modulos
-- ----------------------------
DROP TABLE IF EXISTS `modulos`;
CREATE TABLE `modulos` (
  `idmodulo` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `estado` smallint(6) DEFAULT NULL,
  `idmodulo_padre` int(11) NOT NULL,
  `icono` varchar(100) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`idmodulo`),
  KEY `idmodulo_padre` (`idmodulo_padre`),
  CONSTRAINT `modulos_ibfk_1` FOREIGN KEY (`idmodulo_padre`) REFERENCES `modulos` (`idmodulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of modulos
-- ----------------------------
INSERT INTO `modulos` VALUES ('0', 'MODULO PADRE', '#', '0', '0', null, null);
INSERT INTO `modulos` VALUES ('1', 'SEGURIDAD', '#', '1', '0', 'FA  FA-WRENCH FA-LG', '7');
INSERT INTO `modulos` VALUES ('9', 'CONFIGURAR  BD', 'CONFIGURARBD', '1', '1', null, null);
INSERT INTO `modulos` VALUES ('10', 'MODULOS', 'MODULOS', '1', '1', null, null);
INSERT INTO `modulos` VALUES ('11', 'PARAMETROS', 'PARAM', '1', '1', null, null);
INSERT INTO `modulos` VALUES ('12', 'PERMISOS', 'PERMISOS', '1', '1', null, null);
INSERT INTO `modulos` VALUES ('13', 'PERFIL', 'PERFILES', '1', '1', null, null);
INSERT INTO `modulos` VALUES ('14', 'USUARIO', 'USUARIO', '1', '1', null, null);
INSERT INTO `modulos` VALUES ('18', 'MANTENIMIENTO', '#', '0', '0', 'FA FA-DESKTOP FA-LG', '3');
INSERT INTO `modulos` VALUES ('19', 'CURSOS', 'CURSO', '0', '18', '', null);
INSERT INTO `modulos` VALUES ('20', 'TIPODOCENTES', 'TIPODOCENTE', '0', '18', '', null);
INSERT INTO `modulos` VALUES ('21', 'CATEGORIAS', 'CATEGORIAD', '0', '18', '', null);
INSERT INTO `modulos` VALUES ('22', 'REG. DOCENTE', 'DOCENTE', '0', '18', '', null);
INSERT INTO `modulos` VALUES ('23', 'REG.SEMANA', 'CONSOLIDADO', '0', '31', '', null);
INSERT INTO `modulos` VALUES ('24', ' MENSUAL', 'REPORTEC', '0', '26', '', null);
INSERT INTO `modulos` VALUES ('25', 'ASIGNACION HORAS', 'ASIGNACION', '0', '31', '', null);
INSERT INTO `modulos` VALUES ('26', 'DOCUMENTO', '#', '0', '0', 'FA  FA-DOWNLOAD FA-LG', '4');
INSERT INTO `modulos` VALUES ('27', 'SEMANAL', 'REPORTE_SEMANAL', '0', '26', '', null);
INSERT INTO `modulos` VALUES ('28', 'ANIO', 'ANIO', '0', '18', '', null);
INSERT INTO `modulos` VALUES ('29', 'NOTIFICACIONES', '#', '0', '0', 'FA   FA-BELL FA-LG', '2');
INSERT INTO `modulos` VALUES ('30', 'AVISOS', 'NOTIFICACION', '0', '29', '', null);
INSERT INTO `modulos` VALUES ('31', 'CONTRATOS', '#', '0', '0', 'FA FA-USER FA-LG', '1');
INSERT INTO `modulos` VALUES ('32', 'CONTR.DOCENTES', 'CONTRATOS', '0', '31', '', null);
INSERT INTO `modulos` VALUES ('33', 'CICLO APERTURADO', 'CICLO', '0', '31', '', null);
INSERT INTO `modulos` VALUES ('34', 'ASIGNAR CARGOS', 'ASIGNAR_CARGO', '0', '31', '', null);
INSERT INTO `modulos` VALUES ('35', 'ASIGNAR CURSO', 'ASIGNAR_CURSO', '0', '31', '', null);
INSERT INTO `modulos` VALUES ('36', 'SEMINARIO Y COORDINADORES', 'REPORTEC2', '0', '26', '', null);
INSERT INTO `modulos` VALUES ('37', 'CONSOLIDADO', 'REPORTEC3', '0', '26', '', null);
INSERT INTO `modulos` VALUES ('38', 'RAZAS', 'RAZA', '1', '39', '', null);
INSERT INTO `modulos` VALUES ('39', 'MANTENIMIENTO', '#', '1', '0', '', null);
INSERT INTO `modulos` VALUES ('40', 'ESPECIES', 'ESPECIE', '1', '39', '', null);
INSERT INTO `modulos` VALUES ('41', 'ETAPAS', 'ETAPA', '1', '39', '', null);
INSERT INTO `modulos` VALUES ('42', 'CATEGORIAS', 'CATEGORIA', '1', '39', '', null);
INSERT INTO `modulos` VALUES ('43', 'ESTADOS', 'ESTADO', '1', '39', '', null);
INSERT INTO `modulos` VALUES ('44', 'TIPOSERVICIOS', 'TIPOSERVICIO', '1', '39', '', null);
INSERT INTO `modulos` VALUES ('45', 'PARCELAS', 'PARCELA', '1', '39', '', null);
INSERT INTO `modulos` VALUES ('46', 'CONTROL', '#', '1', '0', '', '6');
INSERT INTO `modulos` VALUES ('47', 'PRODUCCION', '#', '1', '0', '', '5');
INSERT INTO `modulos` VALUES ('48', 'SERVICIO', 'SERVICIO', '1', '39', '', null);
INSERT INTO `modulos` VALUES ('49', 'LOTE', 'LOTE', '1', '39', '', null);
INSERT INTO `modulos` VALUES ('50', 'ANIMAL', 'ANIMAL', '1', '46', '', null);
INSERT INTO `modulos` VALUES ('51', 'PRODUCCIONES', 'PRODUCCION', '1', '47', '', null);
INSERT INTO `modulos` VALUES ('52', 'BAJAS', 'BAJAS', '1', '46', '', null);
INSERT INTO `modulos` VALUES ('53', 'ENFERMEDADES', 'ENFERMEDAD', '1', '46', '', null);
INSERT INTO `modulos` VALUES ('54', 'CONTROL MATERNO', 'CONTROL_MATERNO', '1', '46', '', null);

-- ----------------------------
-- Table structure for parcelas
-- ----------------------------
DROP TABLE IF EXISTS `parcelas`;
CREATE TABLE `parcelas` (
  `idparcela` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`idparcela`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of parcelas
-- ----------------------------
INSERT INTO `parcelas` VALUES ('1', 'PARCELA A', '1');
INSERT INTO `parcelas` VALUES ('2', 'PARCELA B', '0');
INSERT INTO `parcelas` VALUES ('3', 'PARCELA B', '1');
INSERT INTO `parcelas` VALUES ('4', 'PARCELA C', '1');
INSERT INTO `parcelas` VALUES ('5', 'AAA', '1');

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
INSERT INTO `permisos` VALUES ('1', '9', '1');
INSERT INTO `permisos` VALUES ('1', '10', '1');
INSERT INTO `permisos` VALUES ('1', '11', '0');
INSERT INTO `permisos` VALUES ('1', '12', '1');
INSERT INTO `permisos` VALUES ('1', '13', '1');
INSERT INTO `permisos` VALUES ('1', '14', '1');
INSERT INTO `permisos` VALUES ('2', '14', '0');
INSERT INTO `permisos` VALUES ('1', '19', '1');
INSERT INTO `permisos` VALUES ('1', '20', '1');
INSERT INTO `permisos` VALUES ('1', '21', '0');
INSERT INTO `permisos` VALUES ('1', '22', '1');
INSERT INTO `permisos` VALUES ('1', '23', '1');
INSERT INTO `permisos` VALUES ('1', '24', '1');
INSERT INTO `permisos` VALUES ('1', '25', '1');
INSERT INTO `permisos` VALUES ('2', '23', '1');
INSERT INTO `permisos` VALUES ('2', '24', '0');
INSERT INTO `permisos` VALUES ('2', '25', '0');
INSERT INTO `permisos` VALUES ('2', '27', '1');
INSERT INTO `permisos` VALUES ('1', '27', '1');
INSERT INTO `permisos` VALUES ('1', '28', '1');
INSERT INTO `permisos` VALUES ('1', '30', '1');
INSERT INTO `permisos` VALUES ('1', '32', '1');
INSERT INTO `permisos` VALUES ('2', '30', '0');
INSERT INTO `permisos` VALUES ('1', '33', '1');
INSERT INTO `permisos` VALUES ('1', '34', '1');
INSERT INTO `permisos` VALUES ('1', '35', '1');
INSERT INTO `permisos` VALUES ('1', '36', '1');
INSERT INTO `permisos` VALUES ('1', '37', '1');
INSERT INTO `permisos` VALUES ('1', '38', '1');
INSERT INTO `permisos` VALUES ('1', '40', '1');
INSERT INTO `permisos` VALUES ('1', '41', '1');
INSERT INTO `permisos` VALUES ('1', '45', '1');
INSERT INTO `permisos` VALUES ('1', '43', '1');
INSERT INTO `permisos` VALUES ('1', '44', '1');
INSERT INTO `permisos` VALUES ('1', '42', '1');
INSERT INTO `permisos` VALUES ('1', '49', '1');
INSERT INTO `permisos` VALUES ('1', '48', '1');
INSERT INTO `permisos` VALUES ('1', '50', '1');
INSERT INTO `permisos` VALUES ('1', '54', '0');
INSERT INTO `permisos` VALUES ('1', '52', '1');
INSERT INTO `permisos` VALUES ('1', '53', '0');
INSERT INTO `permisos` VALUES ('1', '51', '1');

-- ----------------------------
-- Table structure for producciones
-- ----------------------------
DROP TABLE IF EXISTS `producciones`;
CREATE TABLE `producciones` (
  `idproduccion` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) DEFAULT NULL,
  `cantidad` int(10) DEFAULT NULL,
  `estado` smallint(1) DEFAULT NULL,
  `idanimal` int(11) DEFAULT NULL,
  PRIMARY KEY (`idproduccion`),
  KEY `idanimal` (`idanimal`),
  CONSTRAINT `producciones_ibfk_1` FOREIGN KEY (`idanimal`) REFERENCES `animal` (`idanimal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of producciones
-- ----------------------------

-- ----------------------------
-- Table structure for razas
-- ----------------------------
DROP TABLE IF EXISTS `razas`;
CREATE TABLE `razas` (
  `idraza` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) DEFAULT NULL,
  `estado` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`idraza`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of razas
-- ----------------------------
INSERT INTO `razas` VALUES ('1', 'TROLII', '0');
INSERT INTO `razas` VALUES ('2', 'OLIIIX', '0');
INSERT INTO `razas` VALUES ('3', 'SALERS', '1');
INSERT INTO `razas` VALUES ('4', 'BEEFALO', '1');
INSERT INTO `razas` VALUES ('5', 'GUIR', '0');
INSERT INTO `razas` VALUES ('6', 'GIR', '1');

-- ----------------------------
-- Table structure for servicios
-- ----------------------------
DROP TABLE IF EXISTS `servicios`;
CREATE TABLE `servicios` (
  `idservicio` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) DEFAULT NULL,
  `idtiposervicio` int(6) DEFAULT NULL,
  `estado` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`idservicio`),
  KEY `idtiposervicio` (`idtiposervicio`),
  CONSTRAINT `servicios_ibfk_1` FOREIGN KEY (`idtiposervicio`) REFERENCES `tiposervicios` (`idtiposervicio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of servicios
-- ----------------------------
INSERT INTO `servicios` VALUES ('1', 'ASDDDAAAA', '4', '1');
INSERT INTO `servicios` VALUES ('2', 'AAAAAA', '2', '0');
INSERT INTO `servicios` VALUES ('3', 'BBBB', '3', '1');

-- ----------------------------
-- Table structure for tiposervicios
-- ----------------------------
DROP TABLE IF EXISTS `tiposervicios`;
CREATE TABLE `tiposervicios` (
  `idtiposervicio` int(6) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`idtiposervicio`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tiposervicios
-- ----------------------------
INSERT INTO `tiposervicios` VALUES ('1', 'VENTA DE LECHESITA', '0');
INSERT INTO `tiposervicios` VALUES ('2', 'VENTA', '1');
INSERT INTO `tiposervicios` VALUES ('3', 'COMPRA', '1');
INSERT INTO `tiposervicios` VALUES ('4', 'PRODUCTOS DERIVADOS', '1');

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
INSERT INTO `usuario` VALUES ('2', 'JOEL', 'GUERRERO GUERRA', 'MARGINAL SUR', '74023929', '8777', 'USER', '123', '2', '1');

-- ----------------------------
-- Procedure structure for act_animal
-- ----------------------------
DROP PROCEDURE IF EXISTS `act_animal`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `act_animal`(IN `p_idanimal` int,
IN `p_idservicio` int,
IN `p_nombre` varchar(70),
IN `p_pedigree` varchar(20),
IN `p_sexo` varchar(10),
IN `p_fecha_nac` date,
IN `p_npadre` int,
IN `p_nmadre` int,
IN `p_foto` text,
IN `p_caracteristicas` text,
IN `p_observaciones` text,
IN `p_idcategoria` int,
IN `p_idespecie` int,
IN `p_idetapa` int,
IN `p_idlote` int,
IN `p_idestado` int,
IN `p_idraza` int)
BEGIN
UPDATE animal	SET
idservicio = p_idservicio,
nombre = p_nombre,
pedigree = p_pedigree,
sexo = p_sexo,
fecha_nac = p_fecha_nac,
npadre = p_npadre,
nmadre = p_nmadre,
foto = p_foto,
caracteristicas = p_caracteristicas,
observaciones = p_observaciones,
idcategoria = p_idcategoria,
idespecie = p_idespecie,
idetapa = p_idetapa,
idlote = p_idlote,
idestado = p_idestado,
idraza = p_idraza
WHERE idanimal = p_idanimal;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for act_baja
-- ----------------------------
DROP PROCEDURE IF EXISTS `act_baja`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `act_baja`(IN `p_idbaja` int,IN `p_idanimal` int,IN `p_descripcion` varchar(200),IN `p_fecha` date)
BEGIN
UPDATE bajas SET 
idanimal = p_idanimal,
descripcion = p_descripcion,
fecha = p_fecha
WHERE idbaja = p_idbaja;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for act_categoria
-- ----------------------------
DROP PROCEDURE IF EXISTS `act_categoria`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `act_categoria`(IN `p_idcategoria` int,IN `p_descripcion` varchar(200))
BEGIN
UPDATE categorias SET
descripcion = p_descripcion
WHERE idcategoria = p_idcategoria;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for act_enfermedad
-- ----------------------------
DROP PROCEDURE IF EXISTS `act_enfermedad`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `act_enfermedad`(IN `p_idenfermedad` int,IN `p_descripcion` varchar(200),IN `p_estado` int,IN `p_idanimal` int,IN `p_idlote` int)
BEGIN
UPDATE enfermedads SET 
descripcion = p_descripcion,
estado = p_estado,
idanimal = p_idanimal,
idlote = p_idlote
WHERE idenfermedad = p_idenfermedad;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for act_especie
-- ----------------------------
DROP PROCEDURE IF EXISTS `act_especie`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `act_especie`(IN `p_idespecie` int,IN `p_descripcion` varchar(200))
BEGIN
UPDATE especies SET
descripcion = p_descripcion
WHERE idespecie = p_idespecie;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for act_estado
-- ----------------------------
DROP PROCEDURE IF EXISTS `act_estado`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `act_estado`(IN `p_idestado` int,IN `p_descripcion` varchar(200))
BEGIN
UPDATE estados SET
descripcion = p_descripcion
WHERE idestado = p_idestado;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for act_etapa
-- ----------------------------
DROP PROCEDURE IF EXISTS `act_etapa`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `act_etapa`(IN `p_idetapa` int,IN `p_descripcion` varchar(200))
BEGIN
UPDATE etapas SET
descripcion = p_descripcion
WHERE idetapa = p_idetapa;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for act_lactancia
-- ----------------------------
DROP PROCEDURE IF EXISTS `act_lactancia`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `act_lactancia`(IN `p_idlactancia` int,IN `p_descripcion` text,IN `p_estado` int,IN `p_idanimal` int,IN `p_fecha` date)
BEGIN
UPDATE lactancias SET
descripcion = p_descripcion,
estado = p_estado,
idanimal = p_idanimal,
fecha = p_fecha
WHERE idlactancia = p_idlactancia;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for act_lote
-- ----------------------------
DROP PROCEDURE IF EXISTS `act_lote`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `act_lote`(IN `p_idlote` int,IN `p_descripcion` varchar(200),IN `p_idparcela` int)
BEGIN
UPDATE lotes SET
descripcion = p_descripcion,
idparcela = p_idparcela
WHERE 
idlote = p_idlote;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for act_parcela
-- ----------------------------
DROP PROCEDURE IF EXISTS `act_parcela`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `act_parcela`(IN `p_idparcela` int,IN `p_descripcion` varchar(200))
BEGIN
UPDATE parcelas SET
descripcion = p_descripcion
WHERE idparcela = p_idparcela;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for act_producciones
-- ----------------------------
DROP PROCEDURE IF EXISTS `act_producciones`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `act_producciones`(IN `p_idproduccion` int,IN `p_descripcion` varchar(200),IN `p_cantidad` int,IN `p_estado` int,IN `p_idanimal` int)
BEGIN
UPDATE producciones SET
descripcion = p_descripcion,
cantidad = p_cantidad,
estado = p_estado,
idanimal = p_idanimal
WHERE idproduccion = p_idproduccion;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for act_raza
-- ----------------------------
DROP PROCEDURE IF EXISTS `act_raza`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `act_raza`(IN `p_idraza` int,IN `p_descripcion` varchar(200))
BEGIN
UPDATE razas SET
descripcion = p_descripcion
WHERE idraza = p_idraza;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for act_servicio
-- ----------------------------
DROP PROCEDURE IF EXISTS `act_servicio`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `act_servicio`(IN `p_idservicio` int(11),IN `p_descripcion` varchar(200),IN `p_idtiposervicio` int(11))
BEGIN
UPDATE servicios SET
descripcion = p_descripcion,
idtiposervicio = p_idtiposervicio
WHERE
idservicio = p_idservicio;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for act_tiposervicio
-- ----------------------------
DROP PROCEDURE IF EXISTS `act_tiposervicio`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `act_tiposervicio`(IN `p_idtiposervicio` int,IN `p_descripcion` varchar(200))
BEGIN
UPDATE tiposervicios SET
descripcion = p_descripcion
WHERE idtiposervicio = p_idtiposervicio;
END
;;
DELIMITER ;

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
-- Procedure structure for elim_animal
-- ----------------------------
DROP PROCEDURE IF EXISTS `elim_animal`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `elim_animal`(p_id_animal int)
BEGIN
update animal set estado = 0
where idanimal=p_id_animal;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for elim_baja
-- ----------------------------
DROP PROCEDURE IF EXISTS `elim_baja`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `elim_baja`(p_id_baja int)
BEGIN
update bajas set estado = 0
where idbaja=p_id_baja;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for elim_categoria
-- ----------------------------
DROP PROCEDURE IF EXISTS `elim_categoria`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `elim_categoria`(p_id_categoria int)
BEGIN
update categorias set estado = 0
where idcategoria=p_id_categoria;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for elim_enfermedades
-- ----------------------------
DROP PROCEDURE IF EXISTS `elim_enfermedades`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `elim_enfermedades`(p_id_enfermedad int)
BEGIN
update enfermedades set estado = 0
where idenfermedad =p_id_enfermedad;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for elim_especie
-- ----------------------------
DROP PROCEDURE IF EXISTS `elim_especie`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `elim_especie`(p_id_especie int)
BEGIN
update especies set estado = 0
where idespecie=p_id_especie;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for elim_estado
-- ----------------------------
DROP PROCEDURE IF EXISTS `elim_estado`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `elim_estado`(p_id_estado int)
BEGIN
update estados set estado = 0
where idestado=p_id_estado;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for elim_etapa
-- ----------------------------
DROP PROCEDURE IF EXISTS `elim_etapa`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `elim_etapa`(p_id_etapa int)
BEGIN
update etapas set estado = 0
where idetapa=p_id_etapa;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for elim_lactancia
-- ----------------------------
DROP PROCEDURE IF EXISTS `elim_lactancia`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `elim_lactancia`(p_id_lactancia int)
BEGIN
update lactancias set estado = 0
where idlactancia=p_id_lactancia;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for elim_lote
-- ----------------------------
DROP PROCEDURE IF EXISTS `elim_lote`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `elim_lote`(p_id_lote int)
BEGIN
update lotes set estado = 0
where idlote=p_id_lote;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for elim_parcela
-- ----------------------------
DROP PROCEDURE IF EXISTS `elim_parcela`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `elim_parcela`(p_id_parcela int)
BEGIN
update parcelas set estado = 0
where idparcela=p_id_parcela;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for elim_producciones
-- ----------------------------
DROP PROCEDURE IF EXISTS `elim_producciones`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `elim_producciones`(p_id_produccion int)
BEGIN
update producciones set estado = 0
where idproduccion=p_id_produccion;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for elim_raza
-- ----------------------------
DROP PROCEDURE IF EXISTS `elim_raza`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `elim_raza`(p_id_raza int)
BEGIN
update razas set estado = 0
where idraza=p_id_raza;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for elim_servicio
-- ----------------------------
DROP PROCEDURE IF EXISTS `elim_servicio`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `elim_servicio`(p_id_servicio int)
BEGIN
update servicios set estado = 0
where idservicio=p_id_servicio;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for elim_tiposervicio
-- ----------------------------
DROP PROCEDURE IF EXISTS `elim_tiposervicio`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `elim_tiposervicio`(p_id_tiposervicio int)
BEGIN
update tiposervicios set estado = 0
where idtiposervicio=p_id_tiposervicio;
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
-- Procedure structure for ins_animal
-- ----------------------------
DROP PROCEDURE IF EXISTS `ins_animal`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_animal`(IN `p_idservicio` int,
IN `p_nombre` varchar(70),
IN `p_pedigree` VARCHAR(20),
IN `p_sexo` VARCHAR(10),
IN `p_fecha_nac` date,
IN `p_npadre` int,
IN `p_nmadre` int,
IN `p_foto` text,
IN `p_caracteristicas` text,
IN `p_observaciones` text,
IN `p_idcategoria` int,
IN `p_idespecie` int,
IN `p_idetapa` int,
IN `p_idlote` int,
IN `p_idestado` int,
IN `p_idraza` int)
BEGIN
INSERT INTO animal values(
NULL,
p_idservicio,
p_nombre,
p_pedigree,
p_sexo,
p_fecha_nac,
p_npadre,
p_nmadre,
p_foto,
p_caracteristicas,
p_observaciones,
p_idcategoria,
p_idespecie,
p_idetapa,
p_idlote,
p_idestado,
p_idraza,
1
);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for ins_baja
-- ----------------------------
DROP PROCEDURE IF EXISTS `ins_baja`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_baja`(IN `p_idanimal` int,IN `p_descripcion` varchar(200),IN `p_fecha` date)
BEGIN
INSERT INTO bajas values(
NULL,
p_idanimal,
p_descripcion,
1,
p_fecha);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for ins_categoria
-- ----------------------------
DROP PROCEDURE IF EXISTS `ins_categoria`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_categoria`(IN `p_descripcion` varchar(200))
BEGIN
INSERT INTO categorias VALUES(
NULL,
p_descripcion,
1);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for ins_enfermedad
-- ----------------------------
DROP PROCEDURE IF EXISTS `ins_enfermedad`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_enfermedad`(IN `p_descripcion` varchar(200),IN `p_estado` int,IN `idanimal` int,IN `idlote` int)
BEGIN
INSERT INTO enfermedads VALUES(
NULL,
p_descripcion,
1,
p_idanimal,
p_idlote);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for ins_especie
-- ----------------------------
DROP PROCEDURE IF EXISTS `ins_especie`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_especie`(IN `p_descripcion` varchar(200))
BEGIN
INSERT INTO especies VALUES(
NULL,
p_descripcion,
1);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for ins_estado
-- ----------------------------
DROP PROCEDURE IF EXISTS `ins_estado`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_estado`(IN `p_descripcion` varchar(200))
BEGIN
INSERT INTO estados VALUES(
NULL,
p_descripcion,
1);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for ins_etapa
-- ----------------------------
DROP PROCEDURE IF EXISTS `ins_etapa`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_etapa`(IN `p_descripcion` varchar(200))
BEGIN
INSERT INTO etapas VALUES(
NULL,
p_descripcion,
1);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for ins_lactancia
-- ----------------------------
DROP PROCEDURE IF EXISTS `ins_lactancia`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_lactancia`(IN `p_descripcion` text,IN `p_estado` int,IN `p_idanimal` int,IN `p_fecha` date)
BEGIN
INSERT INTO lactancias VALUES(
NULL,
p_descripcion,
1,
p_idanimal,
p_fecha);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for ins_lote
-- ----------------------------
DROP PROCEDURE IF EXISTS `ins_lote`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_lote`(IN `p_descripcion` varchar(200),IN `p_idparcela` int)
BEGIN
INSERT INTO lotes VALUES(
NULL,
p_descripcion,
p_idparcela,
1);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for ins_parcela
-- ----------------------------
DROP PROCEDURE IF EXISTS `ins_parcela`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_parcela`(IN `p_descripcion` varchar(200))
BEGIN
INSERT INTO parcelas VALUES(
NULL,
p_descripcion,
1);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for ins_producciones
-- ----------------------------
DROP PROCEDURE IF EXISTS `ins_producciones`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_producciones`(IN `p_descripcion` varchar(200),IN `p_cantidad` int,IN `p_estado` int,IN `p_idanimal` int)
BEGIN
INSERT INTO producciones VALUES(
NULL,
p_descripcion,
p_cantidad,
1,
p_idanimal);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for ins_raza
-- ----------------------------
DROP PROCEDURE IF EXISTS `ins_raza`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_raza`(IN `p_descripcion` varchar(200))
BEGIN
INSERT INTO razas VALUES(
NULL,
p_descripcion,
1);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for ins_servicio
-- ----------------------------
DROP PROCEDURE IF EXISTS `ins_servicio`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_servicio`(IN `p_descripcion` varchar(200),IN `p_idtiposervicio` int(11))
BEGIN
INSERT INTO servicios VALUES(
NULL,
p_descripcion,
p_idtiposervicio,
1);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for ins_tiposervicio
-- ----------------------------
DROP PROCEDURE IF EXISTS `ins_tiposervicio`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_tiposervicio`(IN `p_descripcion` varchar(200))
BEGIN
INSERT INTO tiposervicios VALUES(
NULL,
p_descripcion,
1);

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
-- Procedure structure for pa_act_informacion
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_act_informacion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_act_informacion`(xconocenos text, xmision text, xvision text, xhistoria text)
begin
UPDATE informacion SET 
	mision=xmision,
	vision=xvision,
	conocenos=xconocenos,
	historia=xhistoria
WHERE id=1;
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
-- Procedure structure for sel_animal
-- ----------------------------
DROP PROCEDURE IF EXISTS `sel_animal`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_animal`(p_idanimal int , 
p_nombre VARCHAR(70))
BEGIN

if( p_idanimal =0 and p_nombre ='')
THEN
SELECT S.descripcion as servicio,C.descripcion as categoria,Es.descripcion as especie,Et.descripcion as etapa,L.descripcion as lote,Eo.descripcion as estado,R.descripcion as raza,A.*
FROM animal as A
INNER JOIN servicios  as S  ON S.idservicio=A.idservicio
INNER JOIN categorias as C  ON C.idcategoria=A.idcategoria
INNER JOIN especies   as Es ON Es.idespecie=A.idespecie
INNER JOIN etapas     as Et ON Et.idetapa=A.idetapa
INNER JOIN lotes      as L  ON L.idlote=A.idlote
INNER JOIN estados    as Eo ON Eo.idestado=A.idestado
INNER JOIN razas      as R  ON R.idraza=A.idraza
WHERE A.estado=1;
end IF;

if( p_idanimal <> 0 and p_nombre ='')
THEN
SELECT S.descripcion as servicio,C.descripcion as categoria,Es.descripcion as especie,Et.descripcion as etapa,L.descripcion as lote,Eo.descripcion as estado,R.descripcion as raza,A.*
FROM animal as A
INNER JOIN servicios  as S  ON S.idservicio=A.idservicio
INNER JOIN categorias as C  ON C.idcategoria=A.idcategoria
INNER JOIN especies   as Es ON Es.idespecie=A.idespecie
INNER JOIN etapas     as Et ON Et.idetapa=A.idetapa
INNER JOIN lotes      as L  ON L.idlote=A.idlote
INNER JOIN estados    as Eo ON Eo.idestado=A.idestado
INNER JOIN razas      as R  ON R.idraza=A.idraza
WHERE A.idanimal=p_idanimal and A.estado=1;

end IF;

if( p_idanimal =0 and p_nombre <> '')
THEN
SELECT S.descripcion as servicio,C.descripcion as categoria,Es.descripcion as especie,Et.descripcion as etapa,L.descripcion as lote,Eo.descripcion as estado,R.descripcion as raza,A.*
FROM animal as A
INNER JOIN servicios  as S  ON S.idservicio=A.idservicio
INNER JOIN categorias as C  ON C.idcategoria=A.idcategoria
INNER JOIN especies   as Es ON Es.idespecie=A.idespecie
INNER JOIN etapas     as Et ON Et.idetapa=A.idetapa
INNER JOIN lotes      as L  ON L.idlote=A.idlote
INNER JOIN estados    as Eo ON Eo.idestado=A.idestado
INNER JOIN razas      as R  ON R.idraza=A.idraza
where A.nombre like CONCAT('%',p_nombre,'%') and (A.estado=1);
end IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sel_baja
-- ----------------------------
DROP PROCEDURE IF EXISTS `sel_baja`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_baja`(IN `p_idbaja` int,IN `p_descripcion` varchar(200))
BEGIN

IF(p_idbaja =0 AND p_descripcion ='')
THEN
SELECT B.*, A.nombre FROM bajas AS B
INNER JOIN animal AS A ON A.idanimal=B.idanimal
WHERE B.estado=1;
END IF;

IF(p_idbaja <>0 AND p_descripcion ='')
THEN
SELECT B.*, A.nombre FROM bajas AS B
INNER JOIN animal AS A ON A.idanimal=B.idanimal
WHERE B.idbaja=p_idbaja AND B.estado=1;
END IF;

IF(p_idbaja = 0 AND p_descripcion <>'')
THEN
SELECT B.*, A.nombre	 FROM bajas AS B
INNER JOIN animal AS A ON A.idanimal=B.idanimal
WHERE B.descripcion LIKE CONCAT('%',p_descripcion,'%') and (B.estado=1);
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sel_categoria
-- ----------------------------
DROP PROCEDURE IF EXISTS `sel_categoria`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_categoria`(IN `p_idcategoria` int,IN `p_descripcion` varchar(200))
BEGIN

IF(p_idcategoria =0 AND p_descripcion ='')
THEN
SELECT * FROM categorias
WHERE estado=1;
END IF;

IF(p_idcategoria <>0 AND p_descripcion ='')
THEN
SELECT * FROM categorias
WHERE idcategoria=p_idcategoria AND estado=1;
END IF;

IF(p_idcategoria = 0 AND p_descripcion <>'')
THEN
SELECT * FROM categorias
WHERE descripcion LIKE CONCAT('%',p_descripcion,'%') and (estado=1);
END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sel_enfermedad
-- ----------------------------
DROP PROCEDURE IF EXISTS `sel_enfermedad`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_enfermedad`(IN `p_idenfermedad` int,IN `p_descripcion` varchar(200))
BEGIN

IF(p_idenfermedad =0 AND p_descripcion ='')
THEN
SELECT A.*, L.descripcion, E.descripcion FROM enfermedades AS E
INNER JOIN animal AS A ON A.idanimal=E.idanimal
INNER JOIN lotes AS L ON L.idlote=E.idlote
WHERE E.estado=1;
END IF;

IF(p_idenfermedad <>0 AND p_descripcion ='')
THEN
SELECT A.*, L.descripcion, E.descripcion FROM enfermedades AS E
INNER JOIN animal AS A ON A.idanimal=E.idanimal
INNER JOIN lotes AS L ON L.idlote=E.idlote
WHERE E.idenfermedad=p_idenfermedad AND E.estado=1;
END IF;

IF(p_idenfermedad = 0 AND p_descripcion <>'')
THEN
SELECT A.*, L.descripcion, E.descripcion FROM enfermedades AS E
INNER JOIN animal AS A ON A.idanimal=E.idanimal
INNER JOIN lotes AS L ON L.idlote=E.idlote
WHERE E.descripcion LIKE CONCAT('%',p_descripcion,'%') and (E.estado=1);
END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sel_especie
-- ----------------------------
DROP PROCEDURE IF EXISTS `sel_especie`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_especie`(IN `p_idespecie` int,IN `p_descripcion` varchar(200))
BEGIN

IF(p_idespecie =0 AND p_descripcion ='')
THEN
SELECT * FROM especies
WHERE estado=1;
END IF;

IF(p_idespecie <>0 AND p_descripcion ='')
THEN
SELECT * FROM especies
WHERE idespecie=p_idespecie AND estado=1;
END IF;

IF(p_idespecie = 0 AND p_descripcion <>'')
THEN
SELECT * FROM especies
WHERE descripcion LIKE CONCAT('%',p_descripcion,'%') and (estado=1);
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sel_estado
-- ----------------------------
DROP PROCEDURE IF EXISTS `sel_estado`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_estado`(IN `p_idestado` int,IN `p_descripcion` varchar(200))
BEGIN

IF(p_idestado =0 AND p_descripcion ='')
THEN
SELECT * FROM estados 
WHERE estado=1;
END IF;

IF(p_idestado <>0 AND p_descripcion ='')
THEN
SELECT * FROM estados
WHERE idestado=p_idestado AND estado=1;
END IF;

IF(p_idestado = 0 AND p_descripcion <>'')
THEN
SELECT * FROM estados 
WHERE descripcion LIKE CONCAT('%',p_descripcion,'%') and (estado=1);
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sel_etapa
-- ----------------------------
DROP PROCEDURE IF EXISTS `sel_etapa`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_etapa`(IN `p_idetapa` int,IN `p_descripcion` varchar(200))
BEGIN

IF(p_idetapa =0 AND p_descripcion ='')
THEN
SELECT * FROM etapas
WHERE estado=1;
END IF;
#quien iso esto el mitchel iso los demas slect como va poner solo esto y como va saber que id es 
IF(p_idetapa <>0 AND p_descripcion ='')
THEN
SELECT * FROM etapas
WHERE idetapa=p_idetapa AND estado=1;
END IF;

IF(p_idetapa = 0 AND p_descripcion <>'')
THEN
SELECT * FROM etapas
WHERE descripcion LIKE CONCAT('%',p_descripcion,'%') and (estado=1);
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sel_lactancia
-- ----------------------------
DROP PROCEDURE IF EXISTS `sel_lactancia`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_lactancia`(IN `p_idlactancia` int,IN `p_descripcion` varchar(200))
BEGIN

IF(p_idlactancia =0 AND p_descripcion ='')
THEN
SELECT La.*, A.nombre FROM lactancias AS La
INNER JOIN animal AS A ON A.idanimal=La.idanimal
WHERE S.estado=1;
END IF;

IF(p_idlactancia <>0 AND p_descripcion ='')
THEN
SELECT La.*, A.nombre FROM lactancias AS La
INNER JOIN animal AS A ON A.idanimal=La.idanimal
WHERE La.idlactancia=p_idlactancia AND La.estado=1;
END IF;

IF(p_idlactancia = 0 AND p_descripcion <>'')
THEN
SELECT La.*, A.nombre FROM lactancias AS La
INNER JOIN animal AS A ON A.idanimal=La.idanimal
WHERE La.descripcion LIKE CONCAT('%',p_descripcion,'%') and (La.estado=1);
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sel_lote
-- ----------------------------
DROP PROCEDURE IF EXISTS `sel_lote`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_lote`(IN `p_idlote` int,IN `p_descripcion` varchar(200))
BEGIN

IF(p_idlote =0 AND p_descripcion ='')
THEN
SELECT L.*, Pa.descripcion as parcela FROM lotes AS L
INNER JOIN parcelas AS Pa ON Pa.idparcela=L.idparcela
WHERE L.estado=1;
END IF;

IF(p_idlote <>0 AND p_descripcion ='')
THEN
SELECT L.*, Pa.descripcion as parcela FROM lotes AS L
INNER JOIN parcelas AS Pa ON Pa.idparcela=L.idparcela
WHERE L.idlote=p_idlote AND L.estado=1;
END IF;

IF(p_idlote = 0 AND p_descripcion <>'')
THEN
SELECT L.*, Pa.descripcion as parcela FROM lotes AS L
INNER JOIN parcelas AS Pa ON Pa.idparcela=L.idparcela
WHERE L.descripcion LIKE CONCAT('%',p_descripcion,'%') and (L.estado=1);
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sel_lote_animal
-- ----------------------------
DROP PROCEDURE IF EXISTS `sel_lote_animal`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_lote_animal`(IN p_lote int)
BEGIN

SELECT animal.idanimal as id , animal.nombre as nombre FROM animal
WHERE animal.estado=1 and animal.idlote=p_lote ;


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sel_padres
-- ----------------------------
DROP PROCEDURE IF EXISTS `sel_padres`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_padres`(p_sexo varchar(10),p_idespecie int (11))
BEGIN

SELECT animal.idanimal as id ,animal.nombre
FROM animal

WHERE animal.estado=1 and  animal.sexo=p_sexo and animal.idespecie=p_idespecie;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sel_parcela
-- ----------------------------
DROP PROCEDURE IF EXISTS `sel_parcela`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_parcela`(IN `p_idparcela` int,IN `p_descripcion` varchar(200))
BEGIN

IF(p_idparcela =0 AND p_descripcion ='')
THEN
SELECT * FROM parcelas
WHERE estado=1;
END IF;

IF(p_idparcela <>0 AND p_descripcion ='')
THEN
SELECT * FROM parcelas
WHERE idparcela=p_idparcela AND estado=1;
END IF;

IF(p_idparcela = 0 AND p_descripcion <>'')
THEN
SELECT * FROM parcelas
WHERE descripcion LIKE CONCAT('%',p_descripcion,'%') and (estado=1);
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sel_parcela_lote
-- ----------------------------
DROP PROCEDURE IF EXISTS `sel_parcela_lote`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_parcela_lote`(IN p_parcela  int)
BEGIN

SELECT  lotes.idlote as id ,lotes.descripcion as lote FROM lotes 

WHERE lotes.estado=1 and lotes.idparcela=p_parcela ;


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sel_produccion
-- ----------------------------
DROP PROCEDURE IF EXISTS `sel_produccion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_produccion`(IN `p_idproduccion` int,IN `p_descripcion` varchar(200))
BEGIN

IF(p_idproduccion =0 AND p_descripcion ='')
THEN
SELECT P.descripcion, A.nombre FROM producciones AS P
INNER JOIN animal AS A ON A.idanimal=P.idanimal
WHERE P.estado=1;
END IF;

IF(p_idproduccion <>0 AND p_descripcion ='')
THEN
SELECT P.descripcion, A.nombre FROM producciones AS P
INNER JOIN animal AS A ON A.idanimal=P.idanimal
WHERE P.idproduccion=p_idproduccion AND P.estado=1;
END IF;

IF(p_idproduccion = 0 AND p_descripcion <>'')
THEN
SELECT P.descripcion, A.nombre FROM producciones AS P
INNER JOIN animal AS A ON A.idanimal=P.idanimal
WHERE P.descripcion LIKE CONCAT('%',p_descripcion,'%') and (P.estado=1);
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sel_raza
-- ----------------------------
DROP PROCEDURE IF EXISTS `sel_raza`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_raza`(IN `p_idraza` int,IN `p_descripcion` varchar(200))
BEGIN

IF(p_idraza =0 AND p_descripcion ='')
THEN
SELECT * FROM razas
WHERE estado=1;
END IF;

IF(p_idraza <>0 AND p_descripcion ='')
THEN
SELECT * FROM razas
WHERE idraza=p_idraza AND estado=1;
END IF;

IF(p_idraza = 0 AND p_descripcion <>'')
THEN
SELECT * FROM razas
WHERE descripcion LIKE CONCAT('%',p_descripcion,'%') and (estado=1);
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sel_servicio
-- ----------------------------
DROP PROCEDURE IF EXISTS `sel_servicio`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_servicio`(IN `p_idservicio` int,IN `p_descripcion` varchar(200))
BEGIN

IF(p_idservicio =0 AND p_descripcion ='')
THEN
SELECT S.*, Ts.descripcion as tiposervicio FROM servicios AS S
INNER JOIN tiposervicios AS Ts ON Ts.idtiposervicio=S.idtiposervicio
WHERE S.estado=1;
END IF;

IF(p_idservicio <>0 AND p_descripcion ='')
THEN
SELECT S.*, Ts.descripcion as tiposervicio FROM servicios AS S
INNER JOIN tiposervicios AS Ts ON Ts.idtiposervicio=S.idtiposervicio
WHERE S.idservicio=p_idservicio AND S.estado=1;
END IF;

IF(p_idservicio = 0 AND p_descripcion <>'')
THEN
SELECT S.*, Ts.descripcion as tiposervicio FROM servicios AS S
INNER JOIN tiposervicios AS Ts ON Ts.idtiposervicio=S.idtiposervicio
WHERE S.descripcion LIKE CONCAT('%',p_descripcion,'%') and (S.estado=1);
END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sel_tiposervicio
-- ----------------------------
DROP PROCEDURE IF EXISTS `sel_tiposervicio`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_tiposervicio`(IN `p_idtiposervicio` int,IN `p_descripcion` varchar(200))
BEGIN

IF(p_idtiposervicio =0 AND p_descripcion ='')
THEN
SELECT * FROM tiposervicios
WHERE estado=1;
END IF;

IF(p_idtiposervicio <>0 AND p_descripcion ='')
THEN
SELECT * FROM tiposervicios
WHERE idtiposervicio=p_idtiposervicio AND estado=1;
END IF;

IF(p_idtiposervicio = 0 AND p_descripcion <>'')
THEN
SELECT * FROM tiposervicios
WHERE descripcion LIKE CONCAT('%',p_descripcion,'%') and (estado=1);
END IF;

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
