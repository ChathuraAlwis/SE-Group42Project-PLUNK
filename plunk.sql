-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2021 at 03:24 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `plunk`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountant`
--

CREATE TABLE `accountant` (
  `Staff_ID` varchar(5) NOT NULL,
  `Name` text NOT NULL,
  `Address` text NOT NULL,
  `Joined_Year` date NOT NULL,
  `Contact_No` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_ID` varchar(5) NOT NULL,
  `Name` text NOT NULL,
  `Address` text NOT NULL,
  `NIC` varchar(12) NOT NULL,
  `Joined_Year` date NOT NULL,
  `Contact_No` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `beverage_item`
--

CREATE TABLE `beverage_item` (
  `Item_ID` varchar(5) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Price` double NOT NULL,
  `Discount` double NOT NULL,
  `Availability` tinyint(1) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Volume` int(11) NOT NULL,
  `Company_Name` text NOT NULL,
  `Reorder_Quantity` int(11) NOT NULL,
  `Staff_ID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `Bill_ID` varchar(5) NOT NULL,
  `Payment_Type` varchar(4) NOT NULL,
  `Discount` double NOT NULL,
  `Steward_Name` text NOT NULL,
  `Staff_ID` varchar(5) NOT NULL,
  `Order_ID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `Booking_ID` varchar(5) NOT NULL,
  `Customer_Name` text NOT NULL,
  `Received_Date` date NOT NULL,
  `Received_Time` time NOT NULL,
  `Contact_No` varchar(10) NOT NULL,
  `Duration` time NOT NULL,
  `User_ID` varchar(5) NOT NULL COMMENT 'Member_ID or Staff_ID',
  `Club_Flag` tinyint(1) NOT NULL,
  `Resaurant_Flag` tinyint(1) NOT NULL,
  `Net_Type` varchar(20) DEFAULT NULL,
  `Place` text DEFAULT NULL,
  `No_People` int(11) DEFAULT NULL,
  `Last_Modified_Date` date NOT NULL,
  `Delete_Date` date DEFAULT NULL,
  `Reason` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cashier`
--

CREATE TABLE `cashier` (
  `Staff_ID` varchar(5) NOT NULL,
  `Name` text NOT NULL,
  `Address` text NOT NULL,
  `Joined_Year` date NOT NULL,
  `Contact_No` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cash_payment`
--

CREATE TABLE `cash_payment` (
  `Payment_ID` varchar(5) NOT NULL,
  `Value` double NOT NULL,
  `Date` date NOT NULL,
  `Reciept_No` int(11) NOT NULL,
  `Signed_Person` text NOT NULL,
  `Booking_ID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `club member`
--

CREATE TABLE `club member` (
  `Member_ID` varchar(5) NOT NULL,
  `Name` text NOT NULL,
  `Member_Type` varchar(10) NOT NULL,
  `NIC` varchar(12) NOT NULL,
  `Address` text NOT NULL,
  `Contact_No` int(10) NOT NULL,
  `Profession` text NOT NULL,
  `Signed_People` text NOT NULL,
  `Card_No` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `forum`
--

CREATE TABLE `forum` (
  `Complaint_ID` varchar(5) NOT NULL,
  `Complain` longtext NOT NULL,
  `Date` date NOT NULL,
  `Reply` longtext NOT NULL,
  `Member_ID` varchar(5) NOT NULL,
  `Reply_Person_ID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `general manager`
--

CREATE TABLE `general manager` (
  `Staff_ID` varchar(5) NOT NULL,
  `Name` text NOT NULL,
  `Address` text NOT NULL,
  `Joined_Year` date NOT NULL,
  `Contact_No` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `grn`
--

CREATE TABLE `grn` (
  `GRN_ID` varchar(5) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Company_Name` text NOT NULL,
  `Add_Date` date NOT NULL,
  `Return_Date` date DEFAULT NULL,
  `Reason` longtext DEFAULT NULL,
  `Item_ID` varchar(5) NOT NULL,
  `Staff_ID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `Invoice_ID` varchar(5) NOT NULL,
  `Company_Name` text NOT NULL,
  `Content` text NOT NULL,
  `Received_Date` date NOT NULL,
  `Due_Date` date NOT NULL,
  `Value` int(11) NOT NULL,
  `Staff_ID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kichen_item`
--

CREATE TABLE `kichen_item` (
  `Item_ID` varchar(5) NOT NULL,
  `Name` text NOT NULL,
  `Price` double NOT NULL,
  `Discount` double NOT NULL,
  `Availability` tinyint(1) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Category` text NOT NULL,
  `Portion` int(11) NOT NULL,
  `Staff_ID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `leave`
--

CREATE TABLE `leave` (
  `Staff_ID` varchar(5) NOT NULL,
  `Date` date NOT NULL,
  `Reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `make_payement`
--

CREATE TABLE `make_payement` (
  `Member_ID` varchar(5) NOT NULL,
  `Payment_ID` int(11) NOT NULL,
  `Staff_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `nortification`
--

CREATE TABLE `nortification` (
  `Nortification_ID` varchar(5) NOT NULL,
  `Date` date NOT NULL,
  `Event_Type` text NOT NULL,
  `Message` longtext NOT NULL,
  `Staff_ID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `Order_ID` varchar(5) NOT NULL,
  `Oder_Place` text NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Member_ID` varchar(5) NOT NULL,
  `Staff_ID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `Order_ID` varchar(5) NOT NULL,
  `Items_ID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `Report_ID` varchar(5) NOT NULL,
  `Type` text NOT NULL,
  `Date` date NOT NULL,
  `Period` int(11) NOT NULL,
  `Staff_ID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant manager`
--

CREATE TABLE `restaurant manager` (
  `Staff_ID` varchar(5) NOT NULL,
  `Name` text NOT NULL,
  `Address` text NOT NULL,
  `Joined_Year` date NOT NULL,
  `Contact_No` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `Salary_ID` varchar(5) NOT NULL,
  `Year_Month` date NOT NULL,
  `Amount` double NOT NULL,
  `No_Working_days` int(31) NOT NULL,
  `Staff_No` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `service charge`
--

CREATE TABLE `service charge` (
  `SC_Year_Month` date NOT NULL,
  `Percentage` double NOT NULL,
  `Value` double NOT NULL,
  `Staff_ID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `Staff_ID` varchar(5) NOT NULL,
  `Name` text NOT NULL,
  `Position` text NOT NULL,
  `Address` text NOT NULL,
  `Joined_Year` date NOT NULL,
  `Contact_No` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `visa_payement`
--

CREATE TABLE `visa_payement` (
  `Payment_ID` varchar(5) NOT NULL,
  `Value` double NOT NULL,
  `Date` date NOT NULL,
  `Card_No` int(11) NOT NULL,
  `Booking_ID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountant`
--
ALTER TABLE `accountant`
  ADD PRIMARY KEY (`Staff_ID`),
  ADD UNIQUE KEY `Contact_No` (`Contact_No`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_ID`),
  ADD UNIQUE KEY `Contact_No` (`Contact_No`),
  ADD UNIQUE KEY `NIC` (`NIC`);

--
-- Indexes for table `beverage_item`
--
ALTER TABLE `beverage_item`
  ADD PRIMARY KEY (`Item_ID`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`Bill_ID`),
  ADD UNIQUE KEY `Order_ID` (`Order_ID`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`Booking_ID`),
  ADD UNIQUE KEY `Contact_No` (`Contact_No`);

--
-- Indexes for table `cashier`
--
ALTER TABLE `cashier`
  ADD PRIMARY KEY (`Staff_ID`),
  ADD UNIQUE KEY `Contact_No` (`Contact_No`);

--
-- Indexes for table `cash_payment`
--
ALTER TABLE `cash_payment`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD UNIQUE KEY `Booking_ID` (`Booking_ID`);

--
-- Indexes for table `club member`
--
ALTER TABLE `club member`
  ADD PRIMARY KEY (`Member_ID`),
  ADD UNIQUE KEY `Card_No` (`Card_No`),
  ADD UNIQUE KEY `Contact_No` (`Contact_No`),
  ADD UNIQUE KEY `NIC` (`NIC`);

--
-- Indexes for table `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`Complaint_ID`);

--
-- Indexes for table `general manager`
--
ALTER TABLE `general manager`
  ADD PRIMARY KEY (`Staff_ID`),
  ADD UNIQUE KEY `Contact_No` (`Contact_No`);

--
-- Indexes for table `grn`
--
ALTER TABLE `grn`
  ADD PRIMARY KEY (`GRN_ID`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`Invoice_ID`);

--
-- Indexes for table `kichen_item`
--
ALTER TABLE `kichen_item`
  ADD PRIMARY KEY (`Item_ID`);

--
-- Indexes for table `leave`
--
ALTER TABLE `leave`
  ADD PRIMARY KEY (`Staff_ID`,`Date`);

--
-- Indexes for table `make_payement`
--
ALTER TABLE `make_payement`
  ADD PRIMARY KEY (`Member_ID`,`Payment_ID`);

--
-- Indexes for table `nortification`
--
ALTER TABLE `nortification`
  ADD PRIMARY KEY (`Nortification_ID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`Order_ID`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`Order_ID`,`Items_ID`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`Report_ID`);

--
-- Indexes for table `restaurant manager`
--
ALTER TABLE `restaurant manager`
  ADD PRIMARY KEY (`Staff_ID`),
  ADD UNIQUE KEY `Contact_No` (`Contact_No`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`Salary_ID`),
  ADD UNIQUE KEY `Staff_No` (`Staff_No`);

--
-- Indexes for table `service charge`
--
ALTER TABLE `service charge`
  ADD PRIMARY KEY (`SC_Year_Month`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`Staff_ID`),
  ADD UNIQUE KEY `Contact_No` (`Contact_No`);

--
-- Indexes for table `visa_payement`
--
ALTER TABLE `visa_payement`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD UNIQUE KEY `Booking_ID` (`Booking_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
