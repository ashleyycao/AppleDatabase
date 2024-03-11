-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 26, 2023 at 06:24 AM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apple`
--

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE `application` (
  `aProductID` int(11) NOT NULL,
  `subscriptionTime` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `computer`
--

CREATE TABLE `computer` (
  `cProductID` int(11) NOT NULL,
  `portNumber` varchar(20) DEFAULT NULL,
  `keyboardLanguage` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contains`
--

CREATE TABLE `contains` (
  `hProductID` int(11) NOT NULL,
  `sProductID` int(11) NOT NULL,
  `included` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `developed_for`
--

CREATE TABLE `developed_for` (
  `oProductID` int(11) NOT NULL,
  `aProductID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employeeID` int(11) NOT NULL,
  `SSN` varchar(9) DEFAULT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `dateHired` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `storeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hardware`
--

CREATE TABLE `hardware` (
  `hProductID` int(11) NOT NULL,
  `dimensions` varchar(20) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `storageCapacity` varchar(20) DEFAULT NULL,
  `hardwareType` char(1) DEFAULT NULL,
  `appleCareID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `operating_system`
--

CREATE TABLE `operating_system` (
  `oProductID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL,
  `trackingNumber` varchar(15) DEFAULT NULL,
  `datePlaced` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(20) DEFAULT NULL,
  `customerID` int(11) NOT NULL,
  `storeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `orderID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `unitPrice` decimal(10,2) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phone`
--

CREATE TABLE `phone` (
  `pProductID` int(11) NOT NULL,
  `cameraQuality` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `policy`
--

CREATE TABLE `policy` (
  `appleCareID` int(11) NOT NULL,
  `insurancePlan` varchar(50) DEFAULT NULL,
  `length` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productID` int(11) NOT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `productDescription` varchar(100) DEFAULT NULL,
  `productPrice` decimal(10,2) DEFAULT NULL,
  `productType` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `software`
--

CREATE TABLE `software` (
  `sProductID` int(11) NOT NULL,
  `size` varchar(20) DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL,
  `device` varchar(50) DEFAULT NULL,
  `softwareType` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `storeID` int(11) NOT NULL,
  `street` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zipCode` varchar(50) DEFAULT NULL,
  `country` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `watch`
--

CREATE TABLE `watch` (
  `wProductID` int(11) NOT NULL,
  `wristband` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`aProductID`);

--
-- Indexes for table `computer`
--
ALTER TABLE `computer`
  ADD PRIMARY KEY (`cProductID`);

--
-- Indexes for table `contains`
--
ALTER TABLE `contains`
  ADD PRIMARY KEY (`hProductID`,`sProductID`),
  ADD KEY `contains_fk2` (`sProductID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `developed_for`
--
ALTER TABLE `developed_for`
  ADD PRIMARY KEY (`oProductID`,`aProductID`),
  ADD KEY `developed_for_fk2` (`aProductID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeID`),
  ADD KEY `employee_fk` (`storeID`);

--
-- Indexes for table `hardware`
--
ALTER TABLE `hardware`
  ADD PRIMARY KEY (`hProductID`),
  ADD KEY `hardware_fk2` (`appleCareID`);

--
-- Indexes for table `operating_system`
--
ALTER TABLE `operating_system`
  ADD PRIMARY KEY (`oProductID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `order_fk1` (`customerID`),
  ADD KEY `order_fk2` (`storeID`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`orderID`,`productID`),
  ADD KEY `order_detail_fk2` (`productID`);

--
-- Indexes for table `phone`
--
ALTER TABLE `phone`
  ADD PRIMARY KEY (`pProductID`);

--
-- Indexes for table `policy`
--
ALTER TABLE `policy`
  ADD PRIMARY KEY (`appleCareID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`);

--
-- Indexes for table `software`
--
ALTER TABLE `software`
  ADD PRIMARY KEY (`sProductID`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`storeID`);

--
-- Indexes for table `watch`
--
ALTER TABLE `watch`
  ADD PRIMARY KEY (`wProductID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `application_fk` FOREIGN KEY (`aProductID`) REFERENCES `software` (`sProductID`) ON UPDATE CASCADE;

--
-- Constraints for table `computer`
--
ALTER TABLE `computer`
  ADD CONSTRAINT `computer_fk` FOREIGN KEY (`cProductID`) REFERENCES `hardware` (`hProductID`) ON UPDATE CASCADE;

--
-- Constraints for table `contains`
--
ALTER TABLE `contains`
  ADD CONSTRAINT `contains_fk1` FOREIGN KEY (`hProductID`) REFERENCES `hardware` (`hProductID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `contains_fk2` FOREIGN KEY (`sProductID`) REFERENCES `software` (`sProductID`) ON UPDATE CASCADE;

--
-- Constraints for table `developed_for`
--
ALTER TABLE `developed_for`
  ADD CONSTRAINT `developed_for_fk1` FOREIGN KEY (`oProductID`) REFERENCES `operating_system` (`oProductID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `developed_for_fk2` FOREIGN KEY (`aProductID`) REFERENCES `application` (`aProductID`) ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_fk` FOREIGN KEY (`storeID`) REFERENCES `store` (`storeID`) ON UPDATE CASCADE;

--
-- Constraints for table `hardware`
--
ALTER TABLE `hardware`
  ADD CONSTRAINT `hardware_fk1` FOREIGN KEY (`hProductID`) REFERENCES `product` (`productID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `hardware_fk2` FOREIGN KEY (`appleCareID`) REFERENCES `policy` (`appleCareID`) ON UPDATE CASCADE;

--
-- Constraints for table `operating_system`
--
ALTER TABLE `operating_system`
  ADD CONSTRAINT `operating_system_fk` FOREIGN KEY (`oProductID`) REFERENCES `software` (`sProductID`) ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `order_fk1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_fk2` FOREIGN KEY (`storeID`) REFERENCES `store` (`storeID`) ON UPDATE CASCADE;

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_fk1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_detail_fk2` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON UPDATE CASCADE;

--
-- Constraints for table `phone`
--
ALTER TABLE `phone`
  ADD CONSTRAINT `phone_fk` FOREIGN KEY (`pProductID`) REFERENCES `hardware` (`hProductID`) ON UPDATE CASCADE;

--
-- Constraints for table `policy`
--
ALTER TABLE `policy`
  ADD CONSTRAINT `policy_fk` FOREIGN KEY (`appleCareID`) REFERENCES `product` (`productID`) ON UPDATE CASCADE;

--
-- Constraints for table `software`
--
ALTER TABLE `software`
  ADD CONSTRAINT `software_fk` FOREIGN KEY (`sProductID`) REFERENCES `product` (`productID`) ON UPDATE CASCADE;

--
-- Constraints for table `watch`
--
ALTER TABLE `watch`
  ADD CONSTRAINT `watch_fk` FOREIGN KEY (`wProductID`) REFERENCES `hardware` (`hProductID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
