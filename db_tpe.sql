-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-10-2022 a las 01:18:08
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_tpe`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `idCiudad` int(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `provincia` varchar(45) NOT NULL,
  `cantidadHabitantes` int(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`idCiudad`, `nombre`, `provincia`, `cantidadHabitantes`) VALUES
(4, 'Azul', 'Buenos Aires', 110000),
(7, 'Tandil', 'Buenos Aires', 140000),
(10, 'Benito Juarez', 'Buenos Aires', 65000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propiedades`
--

CREATE TABLE `propiedades` (
  `idPropiedad` int(45) NOT NULL,
  `operacion` varchar(45) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(8,2) NOT NULL,
  `idCiudad` int(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `propiedades`
--

INSERT INTO `propiedades` (`idPropiedad`, `operacion`, `descripcion`, `precio`, `idCiudad`) VALUES
(2, 'Alquiler', 'Local', '25000.00', 4),
(21, 'Alquiler', 'Casa', '25000.00', 4),
(28, 'Alquiler', 'Local', '65000.00', 7),
(30, 'Alquiler', 'Casa', '21000.00', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `email` varchar(99) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `email`, `password`) VALUES
(1, 'admin@gmail.com', '$2y$10$YlHfdrSG9cQZBcWikgM69OkfD2hDkwpEuIgdtqu10Va1.LFI/wVzG');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`idCiudad`);

--
-- Indices de la tabla `propiedades`
--
ALTER TABLE `propiedades`
  ADD PRIMARY KEY (`idPropiedad`),
  ADD KEY `fk_idCiudad` (`idCiudad`,`operacion`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  MODIFY `idCiudad` int(45) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `propiedades`
--
ALTER TABLE `propiedades`
  MODIFY `idPropiedad` int(45) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `propiedades`
--
ALTER TABLE `propiedades`
  ADD CONSTRAINT `propiedades_ibfk_1` FOREIGN KEY (`idCiudad`) REFERENCES `ciudades` (`idCiudad`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
