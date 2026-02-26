-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Veebr 26, 2026 kell 04:31 PL
-- Serveri versioon: 10.4.32-MariaDB
-- PHP versioon: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `stechkin1`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `kaup`
--

CREATE TABLE `kaup` (
  `kauba_kood` int(11) NOT NULL,
  `nimetus` varchar(255) NOT NULL,
  `liigi_kood` int(11) NOT NULL,
  `hind` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `kaup`
--

INSERT INTO `kaup` (`kauba_kood`, `nimetus`, `liigi_kood`, `hind`) VALUES
(101, 'Leib', 1, 1.20),
(102, 'Piim 0.5L', 1, 0.90),
(103, 'Coca-Cola', 2, 1.50),
(104, 'Telefon', 3, 600.00),
(105, 'nõud', 4, 4.50);

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `kaup`
--
ALTER TABLE `kaup`
  ADD PRIMARY KEY (`kauba_kood`),
  ADD UNIQUE KEY `uq_kaup_nimetus` (`nimetus`),
  ADD KEY `fk_kaup_liik` (`liigi_kood`);

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `kaup`
--
ALTER TABLE `kaup`
  ADD CONSTRAINT `fk_kaup_liik` FOREIGN KEY (`liigi_kood`) REFERENCES `liik` (`liigi_kood`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
