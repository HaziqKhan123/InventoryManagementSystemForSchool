-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql304.byetcluster.com
-- Generation Time: Feb 17, 2023 at 06:04 AM
-- Server version: 10.3.27-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `epiz_33342088_shop_inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL,
  `fullName` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` int(11) NOT NULL,
  `phone2` int(11) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `district` varchar(30) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerID`, `fullName`, `email`, `mobile`, `phone2`, `address`, `address2`, `city`, `district`, `status`, `createdOn`) VALUES
(43, 'MUHAMMAD HAZIQ KHAN', 'haziqk819@gmail.com', 185705646, 0, '2313, Jalan Emas, 32188, Kampar, Perak', '', 'Kampar', 'Sekolah Menengah Kebangsaan Se', 'Active', '2023-01-30 11:36:09'),
(44, 'Aiman Bin Ahmad', 'aiman19@gmail.com', 187367749, 0, '19, Jalan Timun, 31900, Kampar, Perak', '', 'Kampar', 'Sekolah Menengah Methodist (AC', 'Active', '2023-02-01 22:20:43');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `productID` int(11) NOT NULL,
  `itemNumber` varchar(255) NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `discount` float NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL DEFAULT 0,
  `unitPrice` float NOT NULL DEFAULT 0,
  `imageURL` varchar(255) NOT NULL DEFAULT 'imageNotAvailable.jpg',
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`productID`, `itemNumber`, `itemName`, `discount`, `stock`, `unitPrice`, `imageURL`, `status`, `description`) VALUES
(50, '1', 'LUMOS AURO Home Cinema Short Throw Projector', 10, 50, 1999, '1675290331_lumos projector.png', 'Active', '1080p native resolution, 300&amp;rdquo; Display with 6000 lumens, the AURO is a real game-changing short throw projector for its trail-blazing price-performance value. '),
(51, '2', 'Buku Sejarah Form 4', 2, 1700, 30, '1675290309_sejarah form 4.png', 'Active', 'Buku Sejarah Form 4'),
(52, '3', 'iMac 24-inch (M1, Two ports, 2021)', 20, 75, 6000, '1675289627_imac.png', 'Active', ' With a strikingly thin design made possible by the Apple M1 chip. An immersive 24-inch 4.5K Retina display with over a billion colours that gives you the big picture in stunning detail.'),
(53, '4', 'Kerusi Pelajar', 20, 3000, 20, '1675289699_school chair.png', 'Active', 'Kerusi untuk pelajar'),
(54, '5', 'Kerusi Guru', 30, 300, 45, '1675289756_teacher chair.png', 'Active', 'Kerusi untuk guru'),
(55, '6', 'Buku Kimia Form 4', 40, 400, 50, '1675289884_chemistry form 4.png', 'Active', 'Buku untuk subjek kimia form 4 '),
(57, '34', 'Bola takraw', 7, 44, 30, 'imageNotAvailable.jpg', 'Active', 'Bola Takraw'),
(58, '9', 'Kipas', 2, 1000, 50, '1676098792_kipas.JPG', 'Active', 'Kipas 10 bilah');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `purchaseID` int(11) NOT NULL,
  `itemNumber` varchar(255) NOT NULL,
  `purchaseDate` date NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `unitPrice` float NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `vendorName` varchar(255) NOT NULL DEFAULT 'Test Vendor',
  `vendorID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`purchaseID`, `itemNumber`, `purchaseDate`, `itemName`, `unitPrice`, `quantity`, `vendorName`, `vendorID`) VALUES
(53, '3', '2018-05-24', 'iMac 24-inch (M1, Two ports, 2021)', 6000, 25, 'Iskandar Bin Ali', 11),
(54, '34', '2018-05-24', 'Bola takraw', 30, 24, 'Iskandar Bin Ali', 11),
(55, '9', '2018-05-24', 'Kipas', 50, 30, 'Arip', 12);

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `saleID` int(11) NOT NULL,
  `itemNumber` varchar(255) NOT NULL,
  `customerID` int(11) NOT NULL,
  `customerName` varchar(255) NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `saleDate` date NOT NULL,
  `discount` float NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `unitPrice` float(10,0) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`saleID`, `itemNumber`, `customerID`, `customerName`, `itemName`, `saleDate`, `discount`, `quantity`, `unitPrice`) VALUES
(18, '2', 44, 'Aiman Bin Ahmad', 'Buku Sejarah Form 4', '2023-01-10', 10, 300, 30),
(19, '34', 43, 'MUHAMMAD HAZIQ KHAN', 'Bola takraw', '2018-05-24', 7, 30, 30),
(20, '9', 43, 'MUHAMMAD HAZIQ KHAN', 'Kipas', '2018-05-24', 2, 30, 50);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `fullName`, `username`, `password`, `status`) VALUES
(7, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Active'),
(8, 'haziq khan', 'haziq00', '3a3eb161a74f61024087605f5e798c4b', 'Active'),
(9, 'iskandar', 'iskandarkacak', '202cb962ac59075b964b07152d234b70', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `vendorID` int(11) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` int(11) NOT NULL,
  `phone2` int(11) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `district` varchar(30) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`vendorID`, `fullName`, `email`, `mobile`, `phone2`, `address`, `address2`, `city`, `district`, `status`, `createdOn`) VALUES
(10, 'MUHAMMAD HAZIQ KHAN', 'haziqk819@gmail.com', 185705646, 0, '2311, Jalan Berlian, 31900, Kampar, Perak', '', 'Kampar', 'Sekolah Menengah Kebangsaan Se', 'Active', '2023-01-30 11:53:50'),
(11, 'Iskandar Bin Ali', 'iskandar21@gmail.com', 123456432, 0, '34, Jalan Perak, 31900, Kampar, Perak', '', 'Kampar', 'SMK Seri Kampar', 'Active', '2023-02-01 22:31:16'),
(12, 'Arip', 'ariphensem123@gmail.com', 321391331, 0, '1321, Jalan uittm, 31239, Kampar, Perak', '', 'Kampar', 'SJK(C) Chung Huah', 'Active', '2023-02-11 07:00:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`productID`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchaseID`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`saleID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`vendorID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `purchaseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `saleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `vendorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
