-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-06-2015 a las 20:47:25
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `poli-leasing`
--
CREATE DATABASE IF NOT EXISTS `poli-leasing` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `poli-leasing`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arrendatario`
--

CREATE TABLE IF NOT EXISTS `arrendatario` (
  `idarrendatario` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `direccion` varchar(20) NOT NULL,
  `telfijo` varchar(20) NOT NULL,
  `telcel` varchar(20) NOT NULL,
  `e-mail` varchar(20) NOT NULL,
  `profesion` varchar(20) NOT NULL,
  `hijos` varchar(2) NOT NULL,
  PRIMARY KEY (`idarrendatario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `arrendatario`
--

INSERT INTO `arrendatario` (`idarrendatario`, `nombre`, `apellido`, `direccion`, `telfijo`, `telcel`, `e-mail`, `profesion`, `hijos`) VALUES
('01', 'esteban alfonzo', 'florez zapata', 'calle 2 # 8-6', '225964', '3125698863', 'popo@hot', 'abogado', '2'),
('2013', 'jorge', 'perez', 'calle', '2233322', '3144343423423', 'hoya@mail.com', 'arquitecto', '25'),
('asd', '1', 'sd', '1', '1', '1', '1', '1', '1'),
('dfg', '4', 'fdg', '4', '4', '4', '4', '4', '4'),
('dfgfdh', '1', 'sd', '1', '1', '1', '1', '1', '1'),
('xxx', 'xxx', 'xxx', 'xxx', 'xxx', 'xxx', 'xxx', 'xxx', 'x');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codeudor`
--

CREATE TABLE IF NOT EXISTS `codeudor` (
  `idcodeudor` varchar(20) NOT NULL,
  `nombre` varchar(21) NOT NULL,
  `apellido` varchar(21) NOT NULL,
  `direccion` varchar(21) NOT NULL,
  `telfijo` varchar(21) NOT NULL,
  `telcelular` varchar(21) NOT NULL,
  `email` varchar(21) NOT NULL,
  `ciudad` varchar(21) NOT NULL,
  `observaciones` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `codeudor`
--

INSERT INTO `codeudor` (`idcodeudor`, `nombre`, `apellido`, `direccion`, `telfijo`, `telcelular`, `email`, `ciudad`, `observaciones`) VALUES
('839400263', 'Manuel', 'Vargas Restrepo', 'carrera 43 #90-21', '3149097', '324097486687', 'vargasman@mail.com', 'Barranquilla', 'Posee 3 casas y una finca'),
('0002', 'Daniel Andres', 'Gaviria Correa', 'Calle 78 # 09-23', '2382946', '31365628635', 'andrescorre@mail.com', 'Santa Marta', 'Sus datos no actualizados'),
('015432112280', 'mateo', 'arango', 'calle 52 #766', '982176', '3029847384', 'arango@mail.com', 'Bogota', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contraarrenda`
--

CREATE TABLE IF NOT EXISTS `contraarrenda` (
  `codigo` varchar(8) NOT NULL,
  `inmueble` varchar(20) NOT NULL,
  `arrendat` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `valor` int(10) NOT NULL,
  `fechaMax` date NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `contraarrenda`
--

INSERT INTO `contraarrenda` (`codigo`, `inmueble`, `arrendat`, `fecha`, `descripcion`, `valor`, `fechaMax`) VALUES
('00000001', '5', '4', '2013-10-24', '4545', 54545, '2013-10-24'),
('00000002', '1 ', 'xxx', '2014-04-04', '7855222', 200000, '2014-04-04'),
('00000003', 'a ', 'asd', '2014-04-04', '15244', 30000, '2014-04-04'),
('00000004', 'hola ', 'dfg', '2014-04-04', '152241', 1522, '2014-04-04'),
('00000005', '2 ', '01', '2014-04-04', '1121', 100, '2014-04-04'),
('00000006', '3 ', 'asd', '2014-04-04', '45212', 100, '2014-04-04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratopropie`
--

CREATE TABLE IF NOT EXISTS `contratopropie` (
  `idcontrato` varchar(20) NOT NULL,
  `precio` int(20) NOT NULL,
  `comicion` varchar(20) NOT NULL,
  `archivo` blob NOT NULL,
  PRIMARY KEY (`idcontrato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepagotmp`
--

CREATE TABLE IF NOT EXISTS `detallepagotmp` (
  `fecha` datetime NOT NULL,
  `idInmueble` varchar(3000) NOT NULL,
  `idActor` varchar(10) NOT NULL,
  `precio` int(10) NOT NULL,
  `descripcion` text NOT NULL,
  `total` int(20) DEFAULT NULL,
  `nombrebanco` varchar(30) NOT NULL,
  `referen` varchar(30) NOT NULL,
  PRIMARY KEY (`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detallepagotmp`
--

INSERT INTO `detallepagotmp` (`fecha`, `idInmueble`, `idActor`, `precio`, `descripcion`, `total`, `nombrebanco`, `referen`) VALUES
('2005-12-14 00:00:00', '00006 ', '2013', 20000000, '12313', 123, 'BBVA', '123'),
('2005-12-14 23:34:36', '00006 ', '2013', 20000000, 'qadad', 123, 'BBVA', '213'),
('2014-12-05 00:00:00', 'weqwe', 'wqeqw', 12213, 'wqew', 123, 'ewqe', 'wqe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

CREATE TABLE IF NOT EXISTS `imagenes` (
  `inmueble` varchar(50) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  PRIMARY KEY (`inmueble`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmueble`
--

CREATE TABLE IF NOT EXISTS `inmueble` (
  `idinmueble` varchar(20) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `imagen` varchar(60) DEFAULT NULL,
  `barrio` varchar(20) NOT NULL,
  `nhabitaciones` varchar(20) NOT NULL,
  `piso` varchar(20) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estrato` varchar(20) NOT NULL,
  `ciudad` varchar(20) NOT NULL,
  `precio` int(20) NOT NULL,
  `bano` varchar(50) NOT NULL,
  `enchape` varchar(50) NOT NULL,
  `cocina` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `area` varchar(50) NOT NULL,
  `garaje` varchar(50) NOT NULL,
  PRIMARY KEY (`idinmueble`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inmueble`
--

INSERT INTO `inmueble` (`idinmueble`, `direccion`, `imagen`, `barrio`, `nhabitaciones`, `piso`, `estado`, `descripcion`, `estrato`, `ciudad`, `precio`, `bano`, `enchape`, `cocina`, `tipo`, `area`, `garaje`) VALUES
('00006', 'calle 34 # 9-34', '5_menu.jpg', 'la paz', '12', '12', 'Libre', 'es una bonita casa', '1', 'Medellin', 20000000, '1', 'Si', '1', 'Casa', '1000', '1'),
('00007', 'calle 34 # 9-34', '5_menu.jpg', 'caicedo', '3', '4', 'Libre', 'Esta casa es muy bonita', '1', 'Medellin', 20000000, '1', 'Si', '2', 'Casa', '789', '1'),
('00008', 'coli', '', '11 de octubre', '1', '12', 'Libre', 'oaifsz', '2', 'Cali', 20000000, '1', 'Si', '', 'Finca', '', '1'),
('0001', 'cra 9 este # 54 b 58', '', 'Manrique', '5', '2', 'Libre', 'Es una excelente casa', '1', 'Medellin', 200, '1', 'Si', '3', 'Casa', '10000', '1'),
('0002', 'cra 41 transversal 5', 'casa1.JPG', 'La paz', '4', '1', 'Libre', 'La casa es antigua ', '1', 'Medellin', 263322, '1', 'Si', '1', 'Casa', '545', '1'),
('0003', 'cra 45 Este #65 F 78', 'casa3.jpg', 'Aranjuez', '5', '2', 'Ocupado', 'La casa sera desocupada', '2', '', 15244, '2', '', '2', 'Apartamento', '900', '1'),
('0004', 'Calle 78 sur # 78 9', '', 'La Floresta', '1', '1', 'Libre', 'Apartamento iluminado  ', '3', 'Medellin', 300000, '3', 'No', '3', 'Apartamento', '80000', '1'),
('0005', 'Cra 78 suroeste # 89-90 Int 89', '', 'Castilla', '1', '1', 'Libre', 'casa primer piso revocado', '2', 'Medellin', 560000, '1', 'Si', '1', 'Casa', '907', 'Ninguno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multas`
--

CREATE TABLE IF NOT EXISTS `multas` (
  `codigo` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `valor` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `multas`
--

INSERT INTO `multas` (`codigo`, `fecha`, `valor`, `descripcion`) VALUES
('00003', '2014-10-31', '2300000', 'DaÃ±os en la puerta de entrada'),
('00004', '2014-12-02', '9000', 'hola'),
('00005', '2024-03-15', '23333', 'sdfwfsdfsdf'),
('01', '2013-09-21', '1000', '                                                                                                                                                                                                                                                                                                                                                                            \r\nlol                             \r\n                                \r\n                                \r\n                                \r\n                                \r\n                                \r\n                                \r\n                        \r\n                        \r\n                        \r\n                        '),
('02', '2013-09-21', '20000', '                                    \r\nprimera prueba\r\n                  \r\n                                ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE IF NOT EXISTS `pagos` (
  `idFactura` varchar(10) NOT NULL,
  `idLinea` varchar(10) NOT NULL,
  `idInmueble` varchar(10) NOT NULL,
  `idActor` varchar(10) NOT NULL,
  `precio` int(10) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`idFactura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`idFactura`, `idLinea`, `idInmueble`, `idActor`, `precio`, `descripcion`) VALUES
('1', '1', '1', '1', 1, ''),
('111', '1', '1', '1', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario`
--

CREATE TABLE IF NOT EXISTS `propietario` (
  `idpropietario` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `telfijo` varchar(20) NOT NULL,
  `telcel` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`idpropietario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `propietario`
--

INSERT INTO `propietario` (`idpropietario`, `nombre`, `apellido`, `telfijo`, `telcel`, `email`) VALUES
('152448253', 'Marta', 'Marin', '695584', '321548745', 'mmarin@mail.com'),
('CE48454', 'Karla', 'Perez', '265895', '13268854', 'Karla@mail.com'),
('CE9999999999999', 'karla', 'soliban', '209173', '2938324', 'iwjsgliajsfc');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `clave` varchar(20) NOT NULL,
  `tipodeusuario` varchar(20) NOT NULL,
  `foto` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `apellido`, `clave`, `tipodeusuario`, `foto`) VALUES
('1342', 'Andres ', 'Isasa valencia', '123', 'Vendedor', ''),
('2013', 'jorge', 'perez', '123', 'Arrendatario', 'chansung adrian.jpg'),
('21', '21', '21', '21', 'Vendedor', ''),
('2143', 'Esteban Andres', 'Puertas Castro', '123', 'Administrador', ''),
('adrian', 'Adrian', 'Giraldo', '123', 'Vendedor', '178930_519763241368292_418209914_n.jpg'),
('carlos', 'Carlos Andres', 'Zapata Lopera', '123', 'Administrador', 'brad mateo.jpg'),
('cris', 'Cristian Dagnover', 'Machado Mira', '123', 'Arrendatario', '485022_519758368035446_906156902_n.jpg'),
('daniel', 'daniel andres', 'mosquera cordova', '123', 'Administrador', 'brad mateo.jpg'),
('elpro', 'jorge ivan', 'bobadilla misse', '123456789', 'Invitado', ''),
('hawris', 'Hawrisson Delvis A', 'Avendano Misse ', '123', 'Administrador', '178930_519763241368292_418209914_n.jpg'),
('hawrisson', 'hawrisson delvis', 'avendano misse', '123', 'Administrador', 'onew hawris.jpg'),
('hola', 'Hawris', 'Prueba', '123', 'Invitado', ''),
('maria', 'Maria Patricia', 'Garcia Perez', '123', 'Vendedor', '178930_519763241368292_418209914_n.jpg'),
('mateo', 'Mateo', 'Pulgarin Garcia', '123', 'Arrendatario', '485022_519758368035446_906156902_n.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitas`
--

CREATE TABLE IF NOT EXISTS `visitas` (
  `codigo` varchar(10) NOT NULL,
  `idinmueble` varchar(23) NOT NULL,
  `documento` varchar(23) NOT NULL,
  `nombre` varchar(23) NOT NULL,
  `apellido` varchar(23) NOT NULL,
  `direccion` varchar(23) NOT NULL,
  `correo` varchar(23) NOT NULL,
  `telfijo` varchar(23) NOT NULL,
  `telcel` varchar(23) NOT NULL,
  `fecha` varchar(23) NOT NULL,
  `horaini` varchar(23) NOT NULL,
  `horafin` varchar(23) NOT NULL,
  `observa` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `visitas`
--

INSERT INTO `visitas` (`codigo`, `idinmueble`, `documento`, `nombre`, `apellido`, `direccion`, `correo`, `telfijo`, `telcel`, `fecha`, `horaini`, `horafin`, `observa`) VALUES
('0001', '0006', '29873', 'Esteban', 'Zapata', 'Calle 23', 'hi@jola', '2123124', '312990483894', 'hoy', '03:00', '03:30', 'no quedo satisfeho'),
('0002', '00007 ', 'aaaaaaaaaaaaa', 'a', 'aa', 'a', 'a', 'a', 'a', '12/03/2014', 'a', 'aaaaaaa', 'loao:::::::::::::::');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
