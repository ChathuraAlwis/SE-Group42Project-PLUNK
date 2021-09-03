-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2021 at 07:13 PM
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
  `Staff_ID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accountant`
--

INSERT INTO `accountant` (`Staff_ID`) VALUES
('A0001');

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

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Admin_ID`, `Name`, `Address`, `NIC`, `Joined_Year`, `Contact_No`) VALUES
('D0001', 'Shan Dilranga', '1/Street1', '991234567v', '2018-05-08', 712345678);

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

--
-- Dumping data for table `beverage_item`
--

INSERT INTO `beverage_item` (`Item_ID`, `Name`, `Price`, `Discount`, `Availability`, `Quantity`, `Volume`, `Company_Name`, `Reorder_Quantity`, `Staff_ID`) VALUES
('BI001', 'RedBull', 800, 5, 1, 100, 180, 'Company1', 0, 'R0001');

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `Bill_ID` varchar(5) NOT NULL,
  `Payment_Type` enum('Cash','Card') NOT NULL,
  `Discount` double NOT NULL,
  `Steward_Name` text NOT NULL,
  `Staff_ID` varchar(5) NOT NULL,
  `Order_ID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`Bill_ID`, `Payment_Type`, `Discount`, `Steward_Name`, `Staff_ID`, `Order_ID`) VALUES
('L0001', 'Cash', 5, 'Steward1', 'C0001', 'O0001');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `Booking_ID` varchar(5) NOT NULL,
  `Customer_Name` text NOT NULL,
  `Reserved_Date` date NOT NULL,
  `Received_Time` time NOT NULL,
  `Create_Date` date NOT NULL,
  `Contact_No` int(10) NOT NULL,
  `Duration` time NOT NULL,
  `Position` enum('Club Member','General manager') NOT NULL,
  `G_ID` varchar(5) DEFAULT NULL,
  `Member_ID` varchar(5) DEFAULT NULL,
  `Booking_Type` enum('Club','Restaurant') NOT NULL,
  `Net_Type` varchar(20) DEFAULT NULL,
  `Place` varchar(10) DEFAULT NULL,
  `No_Of_People` int(11) DEFAULT NULL,
  `Last_Modified_Date` date NOT NULL,
  `Delete_Date` date DEFAULT NULL,
  `Reason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`Booking_ID`, `Customer_Name`, `Reserved_Date`, `Received_Time`, `Create_Date`, `Contact_No`, `Duration`, `Position`, `G_ID`, `Member_ID`, `Booking_Type`, `Net_Type`, `Place`, `No_Of_People`, `Last_Modified_Date`, `Delete_Date`, `Reason`) VALUES
('B0001', 'Customer1', '2021-09-08', '08:00:00', '2021-09-03', 723456234, '20:00:00', 'Club Member', NULL, 'LM001', 'Restaurant', NULL, 'Place1', 100, '2021-09-03', NULL, NULL),
('B0002', 'Customer2', '2021-09-10', '18:30:00', '2021-09-03', 763552312, '13:00:00', 'General manager', 'G0001', NULL, 'Club', 'Center Wic', NULL, NULL, '2021-09-03', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cashier`
--

CREATE TABLE `cashier` (
  `Staff_ID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cashier`
--

INSERT INTO `cashier` (`Staff_ID`) VALUES
('C0001');

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

--
-- Dumping data for table `cash_payment`
--

INSERT INTO `cash_payment` (`Payment_ID`, `Value`, `Date`, `Reciept_No`, `Signed_Person`, `Booking_ID`) VALUES
('CP001', 20000, '2021-09-03', 1, 'Mr.Perera', 'B0001');

-- --------------------------------------------------------

--
-- Table structure for table `club member`
--

CREATE TABLE `club member` (
  `Member_ID` varchar(5) NOT NULL,
  `Name` text NOT NULL,
  `Member_Type` enum('Life','Ordinary',' Honorary') NOT NULL,
  `NIC` varchar(12) NOT NULL,
  `Address` text NOT NULL,
  `Contact_No` int(10) NOT NULL,
  `Profession` text NOT NULL,
  `Signed_People` text NOT NULL,
  `Card_No` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `club member`
--

INSERT INTO `club member` (`Member_ID`, `Name`, `Member_Type`, `NIC`, `Address`, `Contact_No`, `Profession`, `Signed_People`, `Card_No`) VALUES
('HM001', 'Member1', ' Honorary', '941231232v', '8/street7', 765674532, 'Businessman ', 'Peris', 534645756),
('LM001', 'Member2', 'Life', '9234567834v', '4/temple road', 723456232, 'Cricketer', 'Mr A. Perera', 123455678),
('OM001', 'Member 3', 'Ordinary', '987654212v', '23/Nelum road', 708954323, 'Accountant', 'Mr. E. Palihavadana', 1234567894);

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
  `Position` enum('Admin','General Manager','Restaurant Manager') NOT NULL,
  `Reply_A_ID` varchar(5) DEFAULT NULL,
  `Reply_G_ID` varchar(5) DEFAULT NULL,
  `Reply_R_ID` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `forum`
--

INSERT INTO `forum` (`Complaint_ID`, `Complain`, `Date`, `Reply`, `Member_ID`, `Position`, `Reply_A_ID`, `Reply_G_ID`, `Reply_R_ID`) VALUES
('M0001', 'Test complain', '2021-09-03', 'Test Reply', 'HM001', 'Admin', 'D0001', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `general manager`
--

CREATE TABLE `general manager` (
  `Staff_ID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `general manager`
--

INSERT INTO `general manager` (`Staff_ID`) VALUES
('G0001');

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
  `Item_type` enum('Kitchen','Beverage') NOT NULL,
  `Beverage_Item_ID` varchar(5) DEFAULT NULL,
  `Kitchen_Item_ID` varchar(5) DEFAULT NULL,
  `Staff_ID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grn`
--

INSERT INTO `grn` (`GRN_ID`, `Quantity`, `Company_Name`, `Add_Date`, `Return_Date`, `Reason`, `Item_type`, `Beverage_Item_ID`, `Kitchen_Item_ID`, `Staff_ID`) VALUES
('X0001', 100, 'Company1', '2021-09-01', NULL, NULL, 'Kitchen', NULL, 'KI001', 'R0001'),
('X0002', 150, 'Company2', '2021-09-03', NULL, NULL, 'Beverage', 'BI001', NULL, 'R0001');

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

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`Invoice_ID`, `Company_Name`, `Content`, `Received_Date`, `Due_Date`, `Value`, `Staff_ID`) VALUES
('I0001', 'Company1', 'This is invoice 1', '2021-09-01', '2021-09-03', 300, 'A0001');

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

--
-- Dumping data for table `kichen_item`
--

INSERT INTO `kichen_item` (`Item_ID`, `Name`, `Price`, `Discount`, `Availability`, `Quantity`, `Category`, `Portion`, `Staff_ID`) VALUES
('KI001', 'Carrot', 80, 5, 1, 100, 'vegetables', 50, 'R0001');

-- --------------------------------------------------------

--
-- Table structure for table `leave`
--

CREATE TABLE `leave` (
  `Staff_ID` varchar(5) NOT NULL,
  `Date` date NOT NULL,
  `Reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leave`
--

INSERT INTO `leave` (`Staff_ID`, `Date`, `Reason`) VALUES
('C0001', '2021-09-03', 'Reason1');

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

--
-- Dumping data for table `nortification`
--

INSERT INTO `nortification` (`Nortification_ID`, `Date`, `Event_Type`, `Message`, `Staff_ID`) VALUES
('N0001', '2021-09-01', 'Nortification 1', 'Messages ', 'R0001');

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

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`Order_ID`, `Oder_Place`, `Quantity`, `Member_ID`, `Staff_ID`) VALUES
('O0001', 'Table1', 2, 'LM001', 'C0001');

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `Order_ID` varchar(5) NOT NULL,
  `Items_ID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`Order_ID`, `Items_ID`) VALUES
('O0001', 'KI001');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `Report_ID` varchar(5) NOT NULL,
  `Type` text NOT NULL,
  `Date` date NOT NULL,
  `Period` int(11) NOT NULL,
  `Position` enum('Accountant','General Manager','Restaurant Manager') NOT NULL,
  `A_ID` varchar(5) DEFAULT NULL,
  `G_ID` varchar(5) DEFAULT NULL,
  `R_ID` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`Report_ID`, `Type`, `Date`, `Period`, `Position`, `A_ID`, `G_ID`, `R_ID`) VALUES
('T0001', 'Report1', '2021-09-03', 30, 'Accountant', 'A0001', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant manager`
--

CREATE TABLE `restaurant manager` (
  `Staff_ID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `restaurant manager`
--

INSERT INTO `restaurant manager` (`Staff_ID`) VALUES
('R0001');

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

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`Salary_ID`, `Year_Month`, `Amount`, `No_Working_days`, `Staff_No`) VALUES
('S0001', '2021-09-01', 55000, 26, 'C0001');

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

--
-- Dumping data for table `service charge`
--

INSERT INTO `service charge` (`SC_Year_Month`, `Percentage`, `Value`, `Staff_ID`) VALUES
('2021-09-01', 10, 50000, 'C0001');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `Staff_ID` varchar(5) NOT NULL,
  `Name` text NOT NULL,
  `Position` text NOT NULL,
  `Address` text NOT NULL,
  `NIC` varchar(12) NOT NULL,
  `Joined_Year` date NOT NULL,
  `Contact_No` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`Staff_ID`, `Name`, `Position`, `Address`, `NIC`, `Joined_Year`, `Contact_No`) VALUES
('C0001', 'Cashier1', 'Cashier', '6/Street6', '963456789v', '2020-08-02', 755555553),
('A0001', 'Pavani Marasinghe', 'Accountant', '1/Stree13', '9712343214v', '2018-05-01', 763432312),
('G0001', 'Chathura Alwis', 'General manager', '3/Street3', '991265434v', '2018-03-04', 784334232),
('R0001', 'Gimhani Rubasinghe', 'Restaurant Manager', '2/Street2', '997791312v', '2018-05-08', 702776475);

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
-- Dumping data for table `visa_payement`
--

INSERT INTO `visa_payement` (`Payment_ID`, `Value`, `Date`, `Card_No`, `Booking_ID`) VALUES
('VP002', 8000, '2021-09-03', 534645755, 'B0002');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountant`
--
ALTER TABLE `accountant`
  ADD PRIMARY KEY (`Staff_ID`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`NIC`) USING BTREE,
  ADD UNIQUE KEY `Contact_No` (`Contact_No`),
  ADD UNIQUE KEY `Admin_ID` (`Admin_ID`) USING BTREE;

--
-- Indexes for table `beverage_item`
--
ALTER TABLE `beverage_item`
  ADD PRIMARY KEY (`Item_ID`),
  ADD KEY `Staff_ID` (`Staff_ID`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`Bill_ID`),
  ADD UNIQUE KEY `Order_ID` (`Order_ID`),
  ADD KEY `Staff_ID` (`Staff_ID`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`Booking_ID`),
  ADD KEY `G_ID` (`G_ID`),
  ADD KEY `Member_ID` (`Member_ID`);

--
-- Indexes for table `cashier`
--
ALTER TABLE `cashier`
  ADD PRIMARY KEY (`Staff_ID`);

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
  ADD PRIMARY KEY (`Member_ID`) USING BTREE,
  ADD UNIQUE KEY `Card_No` (`Card_No`),
  ADD UNIQUE KEY `Contact_No` (`Contact_No`),
  ADD UNIQUE KEY `NIC` (`NIC`) USING BTREE;

--
-- Indexes for table `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`Complaint_ID`),
  ADD KEY `Member_ID` (`Member_ID`),
  ADD KEY `Reply_Person_ID` (`Reply_R_ID`),
  ADD KEY `forum_ibfk_2` (`Reply_G_ID`),
  ADD KEY `forum_ibfk_4` (`Reply_A_ID`);

--
-- Indexes for table `general manager`
--
ALTER TABLE `general manager`
  ADD PRIMARY KEY (`Staff_ID`);

--
-- Indexes for table `grn`
--
ALTER TABLE `grn`
  ADD PRIMARY KEY (`GRN_ID`),
  ADD KEY `Staff_ID` (`Staff_ID`),
  ADD KEY `grn_ibfk_3` (`Kitchen_Item_ID`),
  ADD KEY `grn_ibfk_2` (`Beverage_Item_ID`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`Invoice_ID`),
  ADD KEY `Staff_ID` (`Staff_ID`);

--
-- Indexes for table `kichen_item`
--
ALTER TABLE `kichen_item`
  ADD PRIMARY KEY (`Item_ID`),
  ADD KEY `Staff_ID` (`Staff_ID`);

--
-- Indexes for table `leave`
--
ALTER TABLE `leave`
  ADD PRIMARY KEY (`Staff_ID`,`Date`);

--
-- Indexes for table `nortification`
--
ALTER TABLE `nortification`
  ADD PRIMARY KEY (`Nortification_ID`),
  ADD KEY `Staff_ID` (`Staff_ID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`Order_ID`),
  ADD KEY `Member_ID` (`Member_ID`),
  ADD KEY `Staff_ID` (`Staff_ID`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`Order_ID`,`Items_ID`),
  ADD KEY `Items_ID` (`Items_ID`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`Report_ID`),
  ADD KEY `Staff_ID` (`R_ID`),
  ADD KEY `report_ibfk_1` (`A_ID`),
  ADD KEY `report_ibfk_3` (`G_ID`);

--
-- Indexes for table `restaurant manager`
--
ALTER TABLE `restaurant manager`
  ADD PRIMARY KEY (`Staff_ID`);

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
  ADD PRIMARY KEY (`SC_Year_Month`),
  ADD KEY `Staff_ID` (`Staff_ID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`NIC`) USING BTREE,
  ADD UNIQUE KEY `Contact_No` (`Contact_No`),
  ADD UNIQUE KEY `Staff_ID` (`Staff_ID`) USING BTREE;

--
-- Indexes for table `visa_payement`
--
ALTER TABLE `visa_payement`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD UNIQUE KEY `Booking_ID` (`Booking_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accountant`
--
ALTER TABLE `accountant`
  ADD CONSTRAINT `accountant_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`Admin_ID`) REFERENCES `user_login` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `beverage_item`
--
ALTER TABLE `beverage_item`
  ADD CONSTRAINT `beverage_item_ibfk_2` FOREIGN KEY (`Staff_ID`) REFERENCES `restaurant manager` (`Staff_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `order` (`Order_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`Staff_ID`) REFERENCES `cashier` (`Staff_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`G_ID`) REFERENCES `general manager` (`Staff_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`Member_ID`) REFERENCES `club member` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cashier`
--
ALTER TABLE `cashier`
  ADD CONSTRAINT `cashier_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cash_payment`
--
ALTER TABLE `cash_payment`
  ADD CONSTRAINT `cash_payment_ibfk_1` FOREIGN KEY (`Booking_ID`) REFERENCES `booking` (`Booking_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `club member`
--
ALTER TABLE `club member`
  ADD CONSTRAINT `club member_ibfk_1` FOREIGN KEY (`Member_ID`) REFERENCES `user_login` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `forum`
--
ALTER TABLE `forum`
  ADD CONSTRAINT `forum_ibfk_1` FOREIGN KEY (`Member_ID`) REFERENCES `club member` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `forum_ibfk_2` FOREIGN KEY (`Reply_G_ID`) REFERENCES `general manager` (`Staff_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `forum_ibfk_3` FOREIGN KEY (`Reply_R_ID`) REFERENCES `restaurant manager` (`Staff_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `forum_ibfk_4` FOREIGN KEY (`Reply_A_ID`) REFERENCES `admin` (`Admin_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `general manager`
--
ALTER TABLE `general manager`
  ADD CONSTRAINT `general manager_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `grn`
--
ALTER TABLE `grn`
  ADD CONSTRAINT `grn_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `restaurant manager` (`Staff_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grn_ibfk_2` FOREIGN KEY (`Beverage_Item_ID`) REFERENCES `beverage_item` (`Item_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grn_ibfk_3` FOREIGN KEY (`Kitchen_Item_ID`) REFERENCES `kichen_item` (`Item_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `accountant` (`Staff_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kichen_item`
--
ALTER TABLE `kichen_item`
  ADD CONSTRAINT `kichen_item_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `restaurant manager` (`Staff_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `leave`
--
ALTER TABLE `leave`
  ADD CONSTRAINT `leave_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nortification`
--
ALTER TABLE `nortification`
  ADD CONSTRAINT `nortification_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `restaurant manager` (`Staff_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`Member_ID`) REFERENCES `club member` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`Staff_ID`) REFERENCES `cashier` (`Staff_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `order` (`Order_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`Items_ID`) REFERENCES `kichen_item` (`Item_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`A_ID`) REFERENCES `accountant` (`Staff_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `report_ibfk_2` FOREIGN KEY (`R_ID`) REFERENCES `restaurant manager` (`Staff_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `report_ibfk_3` FOREIGN KEY (`G_ID`) REFERENCES `general manager` (`Staff_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `restaurant manager`
--
ALTER TABLE `restaurant manager`
  ADD CONSTRAINT `restaurant manager_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`Staff_No`) REFERENCES `staff` (`Staff_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `service charge`
--
ALTER TABLE `service charge`
  ADD CONSTRAINT `service charge_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `user_login` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `visa_payement`
--
ALTER TABLE `visa_payement`
  ADD CONSTRAINT `visa_payement_ibfk_1` FOREIGN KEY (`Booking_ID`) REFERENCES `booking` (`Booking_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
