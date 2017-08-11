-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2017 at 08:16 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vehicle_automation`
--
CREATE DATABASE IF NOT EXISTS `vehicle_automation` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `vehicle_automation`;

-- --------------------------------------------------------

--
-- Table structure for table `bookingtable`
--

DROP TABLE IF EXISTS `bookingtable`;
CREATE TABLE IF NOT EXISTS `bookingtable` (
  `BookingID` int(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `fromdate` date NOT NULL,
  `todate` date NOT NULL,
  `vid` int(100) NOT NULL,
  `payment` int(100) NOT NULL,
  `currentdate` date NOT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `vid` (`vid`),
  KEY `vid_2` (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookingtable`
--

INSERT INTO `bookingtable` (`BookingID`, `type`, `model`, `fromdate`, `todate`, `vid`, `payment`, `currentdate`) VALUES
(102, 'Bike', 'bullet', '2017-07-20', '2017-07-22', 101, 2500, '2017-07-18'),
(1003, 'Bike', 'bullet', '2017-07-29', '2017-07-30', 101, 2500, '2017-07-19'),
(1232, 'Car', 'maruti', '2017-07-20', '2017-07-21', 102, 2500, '2017-07-18');

-- --------------------------------------------------------

--
-- Table structure for table `customer_table`
--

DROP TABLE IF EXISTS `customer_table`;
CREATE TABLE IF NOT EXISTS `customer_table` (
  `UidNumber` int(11) NOT NULL,
  `custname` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `dob` varchar(100) NOT NULL,
  `BookingID` int(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`UidNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_table`
--

INSERT INTO `customer_table` (`UidNumber`, `custname`, `phone`, `Address`, `gender`, `dob`, `BookingID`, `image`) VALUES
(515, 'mnxmnm', '2626161262', ' x,. ,.,mmd', 'Male', '2017-07-05', 102, '1499566620047149956598806520170402_085929.jpg'),
(545415, 'dfds', '3152151651', ', c,mcx,m ,m', 'male', '2017-07-04', 101, '1499566495922IMG_7127.JPG'),
(564154, 'dsfds', '5615615456', 'ndscnds', 'male', '2017-07-07', 100, '');

-- --------------------------------------------------------

--
-- Table structure for table `employeetable`
--

DROP TABLE IF EXISTS `employeetable`;
CREATE TABLE IF NOT EXISTS `employeetable` (
  `UidNumber` int(100) NOT NULL,
  `empname` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `salary` int(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  PRIMARY KEY (`UidNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employeetable`
--

INSERT INTO `employeetable` (`UidNumber`, `empname`, `contact`, `address`, `salary`, `image`) VALUES
(101, 'Amrit', '9915951911', 'dkjnjkfnj', 25000, ''),
(102, 'abc', '5356456464', 'jyfjhjfvhj	', 6567, '1499973675977IMG_1622.JPG'),
(103, 'abcd', '4535643564', 'bgfgfg', 2454, '1499973874999IMG_2561.JPG');

-- --------------------------------------------------------

--
-- Table structure for table `modeltable`
--

DROP TABLE IF EXISTS `modeltable`;
CREATE TABLE IF NOT EXISTS `modeltable` (
  `type` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `vid` int(100) NOT NULL,
  `vstatus` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  PRIMARY KEY (`vid`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modeltable`
--

INSERT INTO `modeltable` (`type`, `model`, `vid`, `vstatus`, `price`) VALUES
('Bike', 'bullet', 101, 'Engaged', 500),
('Car', 'maruti', 102, 'Available', 100);

-- --------------------------------------------------------

--
-- Table structure for table `usertable`
--

DROP TABLE IF EXISTS `usertable`;
CREATE TABLE IF NOT EXISTS `usertable` (
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` varchar(200) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usertable`
--

INSERT INTO `usertable` (`username`, `password`, `type`) VALUES
('aarish', '1234', 'Employee'),
('Amrit', '123', 'Admin'),
('dikshit', '123', 'Employee');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_table`
--

DROP TABLE IF EXISTS `vehicle_table`;
CREATE TABLE IF NOT EXISTS `vehicle_table` (
  `type` varchar(200) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle_table`
--

INSERT INTO `vehicle_table` (`type`) VALUES
('Bike'),
('Car'),
('Cycle'),
('Luna'),
('Plane'),
('Scooter'),
('Truck');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookingtable`
--
ALTER TABLE `bookingtable`
  ADD CONSTRAINT `bookingtable_ibfk_1` FOREIGN KEY (`vid`) REFERENCES `modeltable` (`vid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `modeltable`
--
ALTER TABLE `modeltable`
  ADD CONSTRAINT `modeltable_ibfk_1` FOREIGN KEY (`type`) REFERENCES `vehicle_table` (`type`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
