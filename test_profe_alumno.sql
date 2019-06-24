-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2019 at 10:07 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_profe_alumno`
--

-- --------------------------------------------------------

--
-- Table structure for table `alumnos`
--

CREATE TABLE `alumnos` (
  `idAlumnos` int(11) NOT NULL,
  `idAsignatura` int(11) DEFAULT NULL,
  `nombre` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `nota` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `alumnos`
--

INSERT INTO `alumnos` (`idAlumnos`, `idAsignatura`, `nombre`, `nota`) VALUES
(1, 1, 'Juan', 65),
(2, 1, 'Ana', 70),
(3, 1, 'Isabel', 68),
(4, 1, 'Karla', 60),
(5, 2, 'Victor', 68),
(6, 2, 'JuanCarlos', 60),
(7, 2, 'María José', 65),
(8, 2, 'José', 68),
(9, 2, 'Rosa', 70),
(10, 3, 'Luisa', 56),
(11, 3, 'Maira', 38),
(12, 3, 'Juan', 46),
(13, 3, 'Rosa', 37),
(14, 1, 'Giovani', 30),
(15, 1, 'Mauro', 31),
(16, 2, 'John', 12),
(17, 2, 'Mark', 18);

-- --------------------------------------------------------

--
-- Table structure for table `asignatura`
--

CREATE TABLE `asignatura` (
  `idAsignatura` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `asignatura`
--

INSERT INTO `asignatura` (`idAsignatura`, `nombre`) VALUES
(1, 'Java'),
(2, 'Php'),
(3, 'Redacción');

-- --------------------------------------------------------

--
-- Table structure for table `profesores`
--

CREATE TABLE `profesores` (
  `idProfesores` int(11) NOT NULL,
  `idAsignatura` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `profesores`
--

INSERT INTO `profesores` (`idProfesores`, `idAsignatura`, `nombre`) VALUES
(1, 1, 'Boris'),
(2, 1, 'Miguel'),
(3, 1, 'Carlos'),
(4, 2, 'María'),
(5, 2, 'Alejandra'),
(6, 2, 'Alejandro'),
(7, 3, 'Pepa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`idAlumnos`),
  ADD KEY `idAsignatura` (`idAsignatura`);

--
-- Indexes for table `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`idAsignatura`);

--
-- Indexes for table `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`idProfesores`),
  ADD KEY `idAsignatura` (`idAsignatura`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `idAlumnos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `asignatura`
--
ALTER TABLE `asignatura`
  MODIFY `idAsignatura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `profesores`
--
ALTER TABLE `profesores`
  MODIFY `idProfesores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `asignatura`
--
ALTER TABLE `asignatura`
  ADD CONSTRAINT `fk_alumno` FOREIGN KEY (`idAsignatura`) REFERENCES `alumnos` (`idAsignatura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_profesor` FOREIGN KEY (`idAsignatura`) REFERENCES `profesores` (`idAsignatura`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
