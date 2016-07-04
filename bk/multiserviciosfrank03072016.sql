/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : multiserviciosfrank

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-07-03 16:06:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cajas
-- ----------------------------
DROP TABLE IF EXISTS `cajas`;
CREATE TABLE `cajas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idempleado` int(10) unsigned NOT NULL,
  `fechaapertura` datetime NOT NULL,
  `saldoapertura` decimal(18,2) NOT NULL,
  `fechacierre` datetime NOT NULL,
  `saldocierre` decimal(18,2) NOT NULL,
  `estado` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cajas
-- ----------------------------

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idtipocliente` int(10) unsigned NOT NULL,
  `nombres` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `documento` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sexo` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientes_idtipocliente_foreign` (`idtipocliente`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`idtipocliente`) REFERENCES `tipoclientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES ('1', '1', 'DENYS', 'GUERRERO', '74023929', 'M', '985388845', 'dj2g117141@gmail.com', '1');

-- ----------------------------
-- Table structure for compras
-- ----------------------------
DROP TABLE IF EXISTS `compras`;
CREATE TABLE `compras` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idproveedor` int(10) unsigned NOT NULL,
  `idtipodoc` int(10) unsigned NOT NULL,
  `fechacompra` date NOT NULL,
  `nrodoc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `igv` decimal(5,2) NOT NULL,
  `fechaemision` datetime NOT NULL,
  `total` decimal(18,3) NOT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `compras_idproveedor_foreign` (`idproveedor`),
  KEY `compras_idtipodoc_foreign` (`idtipodoc`),
  CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`idtipodoc`) REFERENCES `tipocomprobantes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of compras
-- ----------------------------

-- ----------------------------
-- Table structure for conceptos
-- ----------------------------
DROP TABLE IF EXISTS `conceptos`;
CREATE TABLE `conceptos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idtipoconcepto` int(10) unsigned NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `conceptos_idtipoconcepto_foreign` (`idtipoconcepto`),
  CONSTRAINT `conceptos_ibfk_1` FOREIGN KEY (`idtipoconcepto`) REFERENCES `tipoconceptos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of conceptos
-- ----------------------------
INSERT INTO `conceptos` VALUES ('1', '1', 'Venta de Productos', '1');
INSERT INTO `conceptos` VALUES ('2', '2', 'Compra de Productos', '1');
INSERT INTO `conceptos` VALUES ('3', '2', 'Gastos', '1');
INSERT INTO `conceptos` VALUES ('4', '1', 'Devolución Proveedores', '0');
INSERT INTO `conceptos` VALUES ('5', '2', 'Devolucion Clientes', '0');
INSERT INTO `conceptos` VALUES ('6', '1', 'denys', '0');

-- ----------------------------
-- Table structure for configs
-- ----------------------------
DROP TABLE IF EXISTS `configs`;
CREATE TABLE `configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `valor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estado` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of configs
-- ----------------------------
INSERT INTO `configs` VALUES ('1', 'IGV', '0.18', '1');
INSERT INTO `configs` VALUES ('2', 'COMPRA', '1.00', '1');
INSERT INTO `configs` VALUES ('3', 'VENTA', '2.00', '1');
INSERT INTO `configs` VALUES ('5', 'CODIGOBARRA', '0', '1');
INSERT INTO `configs` VALUES ('6', 'NOMBRE_EMPRESA', 'Multiservicios Frank', '1');
INSERT INTO `configs` VALUES ('7', 'DIRECCION_EMPRESA', 'marginal sur #484', '1');
INSERT INTO `configs` VALUES ('8', 'TELEFONO_EMPRESA', '55555', '1');
INSERT INTO `configs` VALUES ('9', 'LOGO_EMPRESA', 'assets/img/logo.png', '1');
INSERT INTO `configs` VALUES ('10', 'EMAIL_EMPRESA', 'soloparaellas@gmail.com', '1');
INSERT INTO `configs` VALUES ('11', 'WEB_EMPRESA', 'http://', '1');
INSERT INTO `configs` VALUES ('12', 'FACEBOOK_EMPRESA', 'http://facebook.com', '1');

-- ----------------------------
-- Table structure for detcompras
-- ----------------------------
DROP TABLE IF EXISTS `detcompras`;
CREATE TABLE `detcompras` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idproducto` int(10) unsigned NOT NULL,
  `idcompra` int(10) unsigned NOT NULL,
  `cantidad` decimal(18,3) NOT NULL,
  `precio` decimal(18,3) NOT NULL,
  `confirmar` datetime DEFAULT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `detcompras_idcompra_foreign` (`idcompra`),
  KEY `detcompras_idproducto_foreign` (`idproducto`),
  CONSTRAINT `detcompras_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detcompras_ibfk_2` FOREIGN KEY (`idcompra`) REFERENCES `compras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of detcompras
-- ----------------------------

-- ----------------------------
-- Table structure for detventas
-- ----------------------------
DROP TABLE IF EXISTS `detventas`;
CREATE TABLE `detventas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `idventa` int(10) unsigned NOT NULL,
  `idproducto` int(10) unsigned NOT NULL,
  `cantidad` decimal(18,3) NOT NULL,
  `precio` decimal(18,3) NOT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `detventas_idproducto_foreign` (`idproducto`),
  KEY `detventas_idventa_foreign` (`idventa`),
  CONSTRAINT `detventas_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detventas_ibfk_3` FOREIGN KEY (`idventa`) REFERENCES `ventas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of detventas
-- ----------------------------

-- ----------------------------
-- Table structure for kardexproductos
-- ----------------------------
DROP TABLE IF EXISTS `kardexproductos`;
CREATE TABLE `kardexproductos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idproducto` int(10) unsigned DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `detalle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cantidadEntrada` decimal(18,2) NOT NULL,
  `precioEntrada` decimal(18,2) NOT NULL,
  `totalEntrada` decimal(18,2) NOT NULL,
  `cantidadSalida` decimal(18,2) NOT NULL,
  `precioSalida` decimal(18,2) NOT NULL,
  `totalSalida` decimal(18,2) NOT NULL,
  `cantidadExist` decimal(18,2) NOT NULL,
  `precioExist` decimal(18,2) NOT NULL,
  `totalExist` decimal(18,2) NOT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kardexproductos_idproducto_foreign` (`idproducto`),
  CONSTRAINT `kardexproductos_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of kardexproductos
-- ----------------------------

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
  CONSTRAINT `lineas_ibfk_1` FOREIGN KEY (`idtipo`) REFERENCES `tipoproductos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of lineas
-- ----------------------------
INSERT INTO `lineas` VALUES ('41', 'tuerquita 8', '8', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of modulos
-- ----------------------------
INSERT INTO `modulos` VALUES ('0', 'MODULO PADRE', '#', '0', '0', null, null);
INSERT INTO `modulos` VALUES ('1', 'ALMACEN', '#', '1', '0', 'fa fa-list-alt fa-lg', '1');
INSERT INTO `modulos` VALUES ('5', 'PRODUCTO', 'productos', '1', '1', null, '1');
INSERT INTO `modulos` VALUES ('6', 'LINEA', 'lineas', '1', '1', null, '2');
INSERT INTO `modulos` VALUES ('7', 'Tipo de Producto', 'tipo_productos', '1', '1', null, '3');
INSERT INTO `modulos` VALUES ('8', 'SEGURIDAD', '#', '1', '0', 'fa fa-lock fa-lg', '6');
INSERT INTO `modulos` VALUES ('9', 'PERMISOS', 'PERMISOS', '1', '8', null, '1');
INSERT INTO `modulos` VALUES ('10', 'USUARIO', 'USUARIO', '1', '8', null, '4');
INSERT INTO `modulos` VALUES ('11', 'PERFIL', 'PERFILES', '1', '8', null, '5');
INSERT INTO `modulos` VALUES ('12', 'MODULOS', 'MODULOS', '1', '8', null, '3');
INSERT INTO `modulos` VALUES ('13', 'ARCHIVOS', '#', '1', '0', 'FA FA-TH FA-LG', '2');
INSERT INTO `modulos` VALUES ('14', 'CONCEPTO', 'CONCEPTOS', '1', '13', '', '1');
INSERT INTO `modulos` VALUES ('15', 'SERIES', 'SERIES', '1', '13', '', '2');
INSERT INTO `modulos` VALUES ('16', 'TIPO DE CLIENTES', 'TIPO_CLIENTES', '1', '13', '', '3');
INSERT INTO `modulos` VALUES ('17', 'TIPO DE COMPROBANTES', 'TIPO_COMPROBANTES', '1', '13', '', '4');
INSERT INTO `modulos` VALUES ('18', 'TIPO DE CONCEPTOS', 'TIPO_CONCEPTOS', '1', '13', '', '5');
INSERT INTO `modulos` VALUES ('19', 'TIPO DE MOVIMIENTOS', 'TIPO_MOVIMIENTOS', '1', '13', '', '6');
INSERT INTO `modulos` VALUES ('20', 'CAJA', '#', '1', '0', 'FA FA-MONEY FA-LG', '3');
INSERT INTO `modulos` VALUES ('21', 'ADMINISTRACION DE CAJA', 'CAJAS', '1', '20', '', '1');
INSERT INTO `modulos` VALUES ('22', 'COMPRAS', '#', '1', '0', 'FA FA-BRIEFCASE FA-LG', '4');
INSERT INTO `modulos` VALUES ('23', 'COMPRAS', 'COMPRAS', '1', '22', '', '1');
INSERT INTO `modulos` VALUES ('24', 'PROVEEDORES', 'PROVEEDORES', '1', '22', '', '2');
INSERT INTO `modulos` VALUES ('25', 'VENTAS', '#', '1', '0', 'FA FA-SHOPPING-CART FA-LG', '5');
INSERT INTO `modulos` VALUES ('26', 'CLIENTES', 'CLIENTES', '1', '25', '', '1');
INSERT INTO `modulos` VALUES ('27', 'LISTA DE VENTAS', 'LISTA_VENTAS', '1', '25', '', '2');
INSERT INTO `modulos` VALUES ('28', 'VENTAS', 'VENTAS', '1', '25', '', '3');
INSERT INTO `modulos` VALUES ('29', 'LISTA DE COMPRAS', 'LISTA_COMPRAS', '1', '22', '', null);

-- ----------------------------
-- Table structure for movimientodineros
-- ----------------------------
DROP TABLE IF EXISTS `movimientodineros`;
CREATE TABLE `movimientodineros` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `idcaja` int(10) unsigned NOT NULL,
  `idconcepto` int(10) unsigned NOT NULL,
  `monto` decimal(18,2) NOT NULL,
  `fecha` datetime NOT NULL,
  `glosa` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movimientodineros_idcaja_foreign` (`idcaja`),
  KEY `movimientodineros_idconcepto_foreign` (`idconcepto`),
  CONSTRAINT `movimientodineros_ibfk_1` FOREIGN KEY (`idcaja`) REFERENCES `cajas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movimientodineros_ibfk_2` FOREIGN KEY (`idconcepto`) REFERENCES `conceptos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of movimientodineros
-- ----------------------------

-- ----------------------------
-- Table structure for movimientos_pagocompras
-- ----------------------------
DROP TABLE IF EXISTS `movimientos_pagocompras`;
CREATE TABLE `movimientos_pagocompras` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `idmovimiento` int(10) DEFAULT NULL,
  `idpagocompra` int(10) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `monto` decimal(18,4) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idmovimiento` (`idmovimiento`),
  KEY `idpagocompra` (`idpagocompra`),
  CONSTRAINT `movimientos_pagocompras_ibfk_1` FOREIGN KEY (`idmovimiento`) REFERENCES `movimientodineros` (`id`),
  CONSTRAINT `movimientos_pagocompras_ibfk_2` FOREIGN KEY (`idpagocompra`) REFERENCES `pagocompras` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of movimientos_pagocompras
-- ----------------------------

-- ----------------------------
-- Table structure for movimientos_pagosventas
-- ----------------------------
DROP TABLE IF EXISTS `movimientos_pagosventas`;
CREATE TABLE `movimientos_pagosventas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `idmovimiento` int(10) DEFAULT NULL,
  `idpagoventa` int(10) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `monto` decimal(18,4) DEFAULT NULL,
  `estado` char(1) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpagoventa` (`idpagoventa`),
  KEY `idmovimiento` (`idmovimiento`),
  CONSTRAINT `movimientos_pagosventas_ibfk_1` FOREIGN KEY (`idpagoventa`) REFERENCES `pagoventas` (`id`),
  CONSTRAINT `movimientos_pagosventas_ibfk_2` FOREIGN KEY (`idmovimiento`) REFERENCES `movimientodineros` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of movimientos_pagosventas
-- ----------------------------

-- ----------------------------
-- Table structure for pagocompras
-- ----------------------------
DROP TABLE IF EXISTS `pagocompras`;
CREATE TABLE `pagocompras` (
  `id` int(10) NOT NULL,
  `idcompra` int(10) unsigned DEFAULT NULL,
  `montopagado` decimal(18,4) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idcompra` (`idcompra`),
  CONSTRAINT `pagocompras_ibfk_1` FOREIGN KEY (`idcompra`) REFERENCES `compras` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pagocompras
-- ----------------------------

-- ----------------------------
-- Table structure for pagoventas
-- ----------------------------
DROP TABLE IF EXISTS `pagoventas`;
CREATE TABLE `pagoventas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `idventa` int(10) unsigned DEFAULT NULL,
  `montopagado` decimal(18,4) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idventa` (`idventa`),
  CONSTRAINT `pagoventas_ibfk_1` FOREIGN KEY (`idventa`) REFERENCES `ventas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pagoventas
-- ----------------------------

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
INSERT INTO `permisos` VALUES ('1', '15', '1');
INSERT INTO `permisos` VALUES ('1', '14', '1');
INSERT INTO `permisos` VALUES ('1', '19', '0');
INSERT INTO `permisos` VALUES ('1', '18', '1');
INSERT INTO `permisos` VALUES ('1', '17', '1');
INSERT INTO `permisos` VALUES ('1', '16', '1');
INSERT INTO `permisos` VALUES ('1', '21', '1');
INSERT INTO `permisos` VALUES ('1', '24', '1');
INSERT INTO `permisos` VALUES ('1', '23', '1');
INSERT INTO `permisos` VALUES ('1', '28', '1');
INSERT INTO `permisos` VALUES ('1', '27', '1');
INSERT INTO `permisos` VALUES ('1', '26', '1');
INSERT INTO `permisos` VALUES ('1', '29', '1');

-- ----------------------------
-- Table structure for productos
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stockactual` decimal(18,3) NOT NULL DEFAULT '0.000',
  `idlinea` int(10) unsigned NOT NULL,
  `precio` int(10) DEFAULT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productos_idlinea_foreign` (`idlinea`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`idlinea`) REFERENCES `lineas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES ('2', 'asdasd', '0.000', '41', null, '0');
INSERT INTO `productos` VALUES ('3', 'tornillo', '0.000', '41', '10', '1');

-- ----------------------------
-- Table structure for proveedores
-- ----------------------------
DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `razonsocial` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ciudad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ruc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of proveedores
-- ----------------------------
INSERT INTO `proveedores` VALUES ('1', 'INVENTARIO INICIAL', 'TARAPOTO', 'pasarela@hotmail.com', '10445382375', 'Jr. Alonso de alvarado', '1');

-- ----------------------------
-- Table structure for series
-- ----------------------------
DROP TABLE IF EXISTS `series`;
CREATE TABLE `series` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `serie` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `correlativo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `idtipocomprobante` int(10) unsigned NOT NULL,
  `maxcorrelativo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `series_idtipocomprobante_foreign` (`idtipocomprobante`),
  CONSTRAINT `series_ibfk_1` FOREIGN KEY (`idtipocomprobante`) REFERENCES `tipocomprobantes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of series
-- ----------------------------
INSERT INTO `series` VALUES ('1', '001', '0', '1', '10000', '1');
INSERT INTO `series` VALUES ('5', '002', '0', '2', '10000', '1');

-- ----------------------------
-- Table structure for tipoclientes
-- ----------------------------
DROP TABLE IF EXISTS `tipoclientes`;
CREATE TABLE `tipoclientes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tipoclientes
-- ----------------------------
INSERT INTO `tipoclientes` VALUES ('1', 'Naturales', '1');
INSERT INTO `tipoclientes` VALUES ('2', 'Juridico', '1');

-- ----------------------------
-- Table structure for tipocomprobantes
-- ----------------------------
DROP TABLE IF EXISTS `tipocomprobantes`;
CREATE TABLE `tipocomprobantes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tipocomprobantes
-- ----------------------------
INSERT INTO `tipocomprobantes` VALUES ('1', 'Boletas', '1');
INSERT INTO `tipocomprobantes` VALUES ('2', 'Factura', '1');
INSERT INTO `tipocomprobantes` VALUES ('3', 'Guía de Remisión', '0');
INSERT INTO `tipocomprobantes` VALUES ('4', 'Factura', '0');
INSERT INTO `tipocomprobantes` VALUES ('5', 'Entrada', '0');
INSERT INTO `tipocomprobantes` VALUES ('6', 'Ticket', '0');

-- ----------------------------
-- Table structure for tipoconceptos
-- ----------------------------
DROP TABLE IF EXISTS `tipoconceptos`;
CREATE TABLE `tipoconceptos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tipoconceptos
-- ----------------------------
INSERT INTO `tipoconceptos` VALUES ('1', 'Ingresos', '1');
INSERT INTO `tipoconceptos` VALUES ('2', 'Egreso', '1');
INSERT INTO `tipoconceptos` VALUES ('3', 'Nuevos', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tipoproductos
-- ----------------------------
INSERT INTO `tipoproductos` VALUES ('8', 'tuercas', 'Tr.', '0');

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
INSERT INTO `usuario` VALUES ('1', 'PRECI', 'ZUBIAUR', 'DIRECCION', '12345678', '123456', 'ADMIN', '123', '1', '1');
INSERT INTO `usuario` VALUES ('2', 'JOEL', 'GUERRERO GUERRA', 'MARGINAL SUR', '74023929', '8777', 'USER', '123', '2', '1');

-- ----------------------------
-- Table structure for ventas
-- ----------------------------
DROP TABLE IF EXISTS `ventas`;
CREATE TABLE `ventas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idcliente` int(10) unsigned NOT NULL,
  `idtipocomprobante` int(10) unsigned NOT NULL,
  `fecha` date NOT NULL DEFAULT '0000-00-00',
  `subtotal` decimal(18,3) NOT NULL,
  `igv` decimal(5,2) NOT NULL DEFAULT '0.00',
  `nrodoc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estado` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ventas_idcliente_foreign` (`idcliente`),
  KEY `ventas_idtipocomprobante_foreign` (`idtipocomprobante`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`id`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`idtipocomprobante`) REFERENCES `tipocomprobantes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ventas
-- ----------------------------

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
