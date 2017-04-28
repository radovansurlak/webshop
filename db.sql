-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 28, 2017 at 07:00 PM
-- Server version: 5.6.35
-- PHP Version: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `webshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `Name` varchar(20) NOT NULL,
  `ID` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`Name`, `ID`) VALUES
('Fishy Fish', 1),
('Unique Unicorns', 2),
('Birdy Birds', 3),
('Slimy Slides', 4),
('Precious Predators', 5),
('Others', 6);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Address` varchar(40) NOT NULL,
  `Telephone` varchar(20) NOT NULL,
  `ID` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ID` smallint(6) NOT NULL,
  `CustomerID` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `Name` varchar(20) NOT NULL,
  `Price` decimal(19,2) NOT NULL,
  `ID` smallint(6) NOT NULL,
  `ImageURL` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`Name`, `Price`, `ID`, `ImageURL`) VALUES
('Awesome Alien', '6.99', 1, 'aliens.jpg'),
('Tropical Pool', '282.99', 2, 'big_pool.jpg'),
('Giant Slide', '302.99', 3, 'big_slide.jpg'),
('Chill Unicorn', '138.99', 4, 'big_white_unicorn.jpg'),
('Boeing 9000', '949.99', 5, 'blue_airplane.jpeg'),
('Horny Slide', '69.99', 6, 'blue_slide.jpeg'),
('Skinny Unicorn', '389.99', 7, 'chinese_unicorn.jpg'),
('Hi-Tech Rabitcorn', '698.99', 8, 'cosmic_unicorn.jpg'),
('Friendly Dolphin', '874.99', 9, 'dolphins.jpg'),
('Sporty Elephant', '42.99', 10, 'elephant.jpg'),
('Flat Flamingo', '38.99', 11, 'flamingo.jpg'),
('Buddha Lion', '66.99', 12, 'lion.jpg'),
('Foxy Shark', '33.99', 13, 'shark.jpg'),
('Red Raging Rex', '90.99', 14, 'tiranosaurus.jpg'),
('Uglycorn', '541.14', 15, 'ugly_purple_unicorn.jpeg'),
('Majestic Unicorn', '99.99', 16, 'weird_unicorn.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `products_categories`
--

CREATE TABLE `products_categories` (
  `ProductID` smallint(6) NOT NULL,
  `CategoryID` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `products_categories`
--

INSERT INTO `products_categories` (`ProductID`, `CategoryID`) VALUES
(1, 6),
(2, 4),
(3, 4),
(4, 2),
(5, 6),
(6, 4),
(7, 2),
(8, 2),
(9, 1),
(10, 6),
(11, 3),
(12, 5),
(13, 5),
(14, 5),
(15, 2),
(16, 2);

-- --------------------------------------------------------

--
-- Table structure for table `products_orders`
--

CREATE TABLE `products_orders` (
  `OrderID` smallint(6) NOT NULL,
  `ProductID` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products_orders`
--

INSERT INTO `products_orders` (`OrderID`, `ProductID`) VALUES
(1, 1),
(1, 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `products_categories`
--
ALTER TABLE `products_categories`
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Indexes for table `products_orders`
--
ALTER TABLE `products_orders`
  ADD KEY `ProductID` (`ProductID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `ID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `ID` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ID` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`ID`);

--
-- Constraints for table `products_categories`
--
ALTER TABLE `products_categories`
  ADD CONSTRAINT `products_categories_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`ID`),
  ADD CONSTRAINT `products_categories_ibfk_3` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ID`);

--
-- Constraints for table `products_orders`
--
ALTER TABLE `products_orders`
  ADD CONSTRAINT `products_orders_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ID`);
