-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Veebr 19, 2026 kell 02:14 PL
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
-- Andmebaas: `stechkin`
--

DELIMITER $$
--
-- Toimingud
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `kustutaStore` (IN `id` INT)   BEGIN
select * from stores;
DELETE FROM stores WHERE store_id=id;
select * from stores;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `kutsutaBrand` (IN `id` INT)   BEGIN
SELECT * FROM brands;
DELETE FROM brands WHERE brand_id=id;
sELECT * FROM brands;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lisaBrand` (IN `brandNimi` VARCHAR(30))   BEGIN
INSERT INTO brands(brand_name) VALUES (brandNimi);
SELECT * FROM brands;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lisaStore` (IN `storeNimi` VARCHAR(30), IN `linn` VARCHAR(30), IN `tel` VARCHAR(13))   BEGIN
INSERT INTO stores(store_name, city, phone)
VALUES(storeNimi, linn, tel);
SELECT * FROM stores;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `otsiong1taht` (IN `taht` CHAR(1))   BEGIN
SELECT * FROM brands WHERE brand_name LIKE CONCAT(taht,'%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `uuendaBrand` (IN `id` INT, IN `uus_brandNimi` VARCHAR(30))   BEGIN 
SELECT * FROM brands;
UPDATE brands SET brand_name=uus_brandNimi WHERE brand_id=id;
SELECT * FROM brands;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`) VALUES
(1, 'adidas'),
(2, 'abibas'),
(3, 'Nike'),
(4, 'test');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'h409');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `phone` char(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state_` varchar(50) DEFAULT NULL,
  `zip_code` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `customers`
--

INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`, `phone`, `email`, `street`, `city`, `state_`, `zip_code`) VALUES
(1, 'Maikl', 'Johnes', '+3725000001', 'maikl@gmail.com', 'Pärnu mnt 5', 'Tallinn', 'Harjumaa', '10141'),
(2, 'Jummy', 'Williams', '+3725000002', 'jummyw@gmail.com', 'Narva mnt 20', 'Tallinn', 'Harjumaa', '10141');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(20) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `model_year` int(11) DEFAULT NULL,
  `list_price` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `brand_id`, `category_id`, `model_year`, `list_price`) VALUES
(0, 'Jordan 1', 1, 1, 2017, 69.00);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `stores`
--

CREATE TABLE `stores` (
  `store_id` int(11) NOT NULL,
  `store_name` varchar(30) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state_` varchar(50) DEFAULT NULL,
  `zip_code` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indeksid tabelile `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeksid tabelile `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeksid tabelile `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indeksid tabelile `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`store_id`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT tabelile `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT tabelile `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT tabelile `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT tabelile `stores`
--
ALTER TABLE `stores`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
