-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2021 at 07:55 PM
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
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `BillID` int(11) NOT NULL,
  `CustomerName` varchar(50) NOT NULL,
  `Price` int(11) NOT NULL,
  `ServiceCharge` int(11) NOT NULL DEFAULT 10,
  `Discount` int(11) NOT NULL,
  `BillDate` date NOT NULL,
  `UserID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `Paid` enum('No','Yes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`BillID`, `CustomerName`, `Price`, `ServiceCharge`, `Discount`, `BillDate`, `UserID`, `OrderID`, `Paid`) VALUES
(9, 'abiru', 2173, 10, 0, '2021-10-20', 18, 14, 'Yes'),
(10, 'adithya', 3201, 10, 0, '2021-10-20', 18, 15, 'Yes'),
(11, 'buvin', 3901, 10, 0, '2021-10-20', 18, 16, 'Yes'),
(12, 'Shaveen', 871, 10, 0, '2021-10-20', 18, 17, 'Yes'),
(13, 'Shaveen', 660, 10, 0, '2021-10-20', 18, 18, 'Yes'),
(14, 'Shaveen', 275, 10, 0, '2021-10-20', 18, 19, 'Yes'),
(15, 'Bandara', 974, 10, 0, '2021-10-20', 17, 20, 'Yes'),
(16, 'nurad', 1078, 10, 0, '2021-10-21', 17, 21, 'No'),
(17, 'abiru', 660, 10, 0, '2021-10-21', 17, 22, 'No'),
(18, 'adithya', 294, 10, 12, '2021-10-21', 18, 23, 'No'),
(19, 'ruvin', 660, 10, 0, '2021-10-21', 17, 24, 'Yes'),
(20, 'Bandara', 990, 10, 0, '2021-10-22', 17, 25, 'Yes'),
(21, 'Bandara', 264, 10, 0, '2021-10-22', 17, 26, 'Yes'),
(22, 'Bandara', 660, 10, 0, '2021-10-22', 17, 27, 'Yes'),
(23, 'Shaveen', 95, 10, 10, '2021-10-22', 18, 28, 'Yes'),
(24, 'Jayani', 781, 10, 0, '2021-12-10', 15, 31, 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `BookingID` int(11) NOT NULL,
  `CustomerName` varchar(50) NOT NULL,
  `BookingType` enum('Club','Restaurant') NOT NULL,
  `NoOfPeople` int(11) NOT NULL,
  `ReservedDate` date NOT NULL,
  `ReservedTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `CreatedDate` date NOT NULL,
  `LastModifiedDate` date DEFAULT NULL,
  `ContactNo` int(11) NOT NULL,
  `Total` int(11) NOT NULL,
  `Payment` enum('Yes','No') NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`BookingID`, `CustomerName`, `BookingType`, `NoOfPeople`, `ReservedDate`, `ReservedTime`, `EndTime`, `CreatedDate`, `LastModifiedDate`, `ContactNo`, `Total`, `Payment`, `UserID`) VALUES
(1, 'Nanduni', 'Restaurant', 100, '2021-09-30', '16:00:00', '18:00:00', '2021-09-28', NULL, 788854567, 5000, 'Yes', 6),
(2, 'Supun', 'Restaurant', 20, '2021-10-11', '15:30:00', '17:30:00', '2021-10-11', NULL, 788854561, 1000, 'No', 6),
(3, 'Thisara', 'Restaurant', 10, '2021-10-12', '17:00:00', '20:00:00', '2021-10-11', NULL, 711154561, 800, 'No', 4),
(4, 'Bimal', 'Club', 100, '2021-10-12', '15:30:00', '17:30:00', '2021-10-11', NULL, 700234576, 900, 'Yes', 4),
(5, 'Thisaru', 'Club', 100, '2021-10-22', '18:00:00', '20:00:00', '2021-10-18', '2021-10-19', 711234545, 5000, 'No', 4),
(6, 'Abiru', 'Restaurant', 20, '2021-10-22', '17:30:00', '19:00:00', '2021-10-19', '2021-10-19', 755554567, 1500, 'Yes', 15),
(7, 'Nimali', 'Restaurant', 8, '2021-10-22', '18:30:00', '20:30:00', '2021-10-20', NULL, 788833367, 1000, 'No', 4),
(8, 'Bandara', 'Restaurant', 20, '2021-10-23', '15:30:00', '17:30:00', '2021-10-20', NULL, 722222567, 1000, 'No', 17),
(9, 'Bandara', 'Restaurant', 20, '2021-10-23', '15:30:00', '17:30:00', '2021-10-20', NULL, 722222567, 1000, 'No', 17),
(10, 'samith', 'Club', 20, '2021-10-23', '09:00:00', '11:00:00', '2021-10-20', '2021-10-20', 711234566, 10000, 'No', 1),
(11, 'Supun', 'Club', 30, '2021-10-23', '08:00:00', '10:00:00', '2021-10-20', NULL, 701234567, 10000, 'Yes', 15),
(12, 'Bandara', 'Club', 40, '2021-10-25', '08:00:00', '09:00:00', '2021-10-22', NULL, 722222567, 10000, 'No', 17);

-- --------------------------------------------------------

--
-- Table structure for table `bookingreservation`
--

CREATE TABLE `bookingreservation` (
  `BookingID` int(11) NOT NULL,
  `ReservationName` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cashpayment`
--

CREATE TABLE `cashpayment` (
  `PaymentID` int(11) NOT NULL,
  `ReceiptNo` int(11) NOT NULL,
  `SignedPerson` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cashpayment`
--

INSERT INTO `cashpayment` (`PaymentID`, `ReceiptNo`, `SignedPerson`) VALUES
(2, 1, 'K.P.M.Marasinghe');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `Company` varchar(50) NOT NULL,
  `DistributorName` varchar(50) NOT NULL,
  `PhoneNo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`Company`, `DistributorName`, `PhoneNo`) VALUES
('Cocacola', 'L.S.Dabare', '0711234576'),
('Elephanthouse', 'T.L.Fernando', '0711234567'),
('Kothmale', 'M.W.Dabare', '0711678567'),
('Mr.POP', 'R.I.Sirisena', '0701234321'),
('Munchee', 'R.W.Ranaweera', '0721234987'),
('Nestle', 'G.P.Abethunga', '0781234321');

-- --------------------------------------------------------

--
-- Table structure for table `deletebooking`
--

CREATE TABLE `deletebooking` (
  `BookingID` int(11) NOT NULL,
  `CustomerName` varchar(50) NOT NULL,
  `BookingType` enum('Club','Restaurant') NOT NULL,
  `Reservation1` text NOT NULL,
  `Reservation2` text NOT NULL,
  `NoOfPeople` int(11) NOT NULL,
  `ReservedDate` date NOT NULL,
  `ReservedTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `CreatedDate` date NOT NULL,
  `LastModifiedDate` date NOT NULL,
  `ContactNo` int(11) NOT NULL,
  `Total` int(11) NOT NULL,
  `Payment` enum('Yes','No') NOT NULL,
  `UserID` int(11) NOT NULL,
  `DeleteDate` date NOT NULL,
  `Reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `deleteinvioce`
--

CREATE TABLE `deleteinvioce` (
  `InvoiceID` int(11) NOT NULL,
  `Company` varchar(50) NOT NULL,
  `Type` enum('Beverage Items','Food Items') NOT NULL,
  `ReceivedDate` date NOT NULL,
  `DueDate` date NOT NULL,
  `Total` int(11) NOT NULL,
  `DeleteDate` date NOT NULL,
  `Reason` text NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `deleteinvoiceitem`
--

CREATE TABLE `deleteinvoiceitem` (
  `InvoiceID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `ItemName` varchar(100) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `deleteitem`
--

CREATE TABLE `deleteitem` (
  `ItemID` int(11) NOT NULL,
  `ItemType` enum('Food','Beverage') NOT NULL,
  `CompanyID` int(11) NOT NULL,
  `ItemName` varchar(100) NOT NULL,
  `Volume/Weight` int(11) NOT NULL,
  `PurchasePrice` int(11) NOT NULL,
  `SellingPrice` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Discount` int(11) NOT NULL,
  `Availability` enum('Yes','No') NOT NULL,
  `ReorderQuantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `deletereservationmenu`
--

CREATE TABLE `deletereservationmenu` (
  `ReservationName` varchar(25) NOT NULL,
  `Type` enum('Club','Restaurant') NOT NULL,
  `Cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `deleteuser`
--

CREATE TABLE `deleteuser` (
  `UserID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Email` varchar(50) NOT NULL,
  `ContactNo` int(11) NOT NULL,
  `JoinedYear` date NOT NULL,
  `DisplayID` varchar(10) NOT NULL,
  `UserType` enum('Admin','Manager','Restaurant Manager','Cashier','Accountant','Staff Member','Life Member','Ordinary Member','HL Member') NOT NULL,
  `Reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deleteuser`
--

INSERT INTO `deleteuser` (`UserID`, `Name`, `Email`, `ContactNo`, `JoinedYear`, `DisplayID`, `UserType`, `Reason`) VALUES
(5, 'Cashier', 'cashier@gmail.com', 711154567, '2019-08-31', 'CA00001', 'Cashier', ''),
(7, 'Piyal perera', 'piyal@gmail.com', 723332567, '2018-10-17', 'OM001', 'Ordinary Member', 'Found a new job'),
(8, 'Staff Member', 'staff@gmail.com', 789012345, '2021-10-04', 'S0001', 'Staff Member', 'End the agreement period resigned '),
(9, 'Pushpan ranaveera', 'pushpan@gmail.com', 711234123, '2020-10-07', 'OM002', 'Ordinary Member', 'Went to the aboard '),
(11, 'R.Ranasinghe', 'ranasinghe@gmail.com', 789012343, '2021-10-06', 'CA0002', 'Cashier', 'Went for the higher studies'),
(19, 'Ridma Palihavadana', 'Ridma@gmail.com', 789012341, '2021-10-20', 'LM0006', 'Life Member', 'Left from club'),
(20, 'Dilshan Ruvapura', 'dilshan@gmail.com', 789012342, '2021-10-21', 'M0001', 'Life Member', 'Reason'),
(21, 'Neshvi fernando', 'neshvi@gmail.com', 716634123, '2021-10-21', 'HL001', 'HL Member', 'reason'),
(24, 'A.Perera', 'bima@gmail.com', 789012345, '2021-10-22', 'HL00007', 'HL Member', 'Left from club'),
(25, 'D.Perera', 'Dilru@gmail.com', 719012342, '2021-10-21', 'LM00005', 'Life Member', 'Left from club');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `FeedBackID` int(11) NOT NULL,
  `FeedBack` text NOT NULL,
  `FeedBackDate` date NOT NULL,
  `UserID` int(11) NOT NULL,
  `Reply` text DEFAULT NULL,
  `ReplyDate` date DEFAULT NULL,
  `ReplyPersonID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`FeedBackID`, `FeedBack`, `FeedBackDate`, `UserID`, `Reply`, `ReplyDate`, `ReplyPersonID`) VALUES
(1, 'The practice pitch was not set properly for practices ', '2021-10-03', 17, 'I\'m really sorry sir. We will inform the ground staff about that.', '2021-10-04', 4),
(2, 'The food is tasty and the service is also satisfactory. Thank you!', '2021-10-17', 15, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `grn`
--

CREATE TABLE `grn` (
  `GRNID` int(11) NOT NULL,
  `CompanyName` varchar(50) NOT NULL,
  `AddDate` date NOT NULL,
  `ItemType` enum('Food','Beverage') NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grn`
--

INSERT INTO `grn` (`GRNID`, `CompanyName`, `AddDate`, `ItemType`, `UserID`) VALUES
(1, 'Kothmale', '2021-09-28', 'Food', 2),
(3, 'Elephanthouse', '2021-10-20', 'Beverage', 2),
(4, 'Cocacola', '2021-10-20', 'Beverage', 2);

-- --------------------------------------------------------

--
-- Table structure for table `grnitem`
--

CREATE TABLE `grnitem` (
  `GRNID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `ItemName` varchar(100) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grnitem`
--

INSERT INTO `grnitem` (`GRNID`, `ItemID`, `ItemName`, `Quantity`) VALUES
(1, 5, 'Ice-Cream-Kothmale-4L', 20),
(3, 2, 'EGB-Elephant-House-50ml', 1000),
(3, 8, 'Elephant-house-cream-soda-500ml', 200),
(4, 3, 'Coca-Cola-1L', 30);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `InvoiceID` int(11) NOT NULL,
  `Company` varchar(50) DEFAULT NULL,
  `Type` enum('Beverage','Food') NOT NULL,
  `ReceivedDate` date NOT NULL,
  `DueDate` date NOT NULL,
  `Total` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`InvoiceID`, `Company`, `Type`, `ReceivedDate`, `DueDate`, `Total`, `UserID`) VALUES
(1, 'Kothmale', 'Food', '2021-09-26', '2021-11-26', 12000, 3),
(2, 'Elephanthouse', 'Beverage', '2021-10-19', '2021-12-16', 423, 3),
(3, 'Cocacola', 'Beverage', '2021-10-20', '2021-12-16', 9000, 3),
(4, 'Mr.POP', 'Food', '2021-10-22', '2021-12-23', 800, 3),
(9, 'Nestle', 'Beverage', '2021-10-20', '2021-12-26', 2000, 3),
(11, 'Munchee', 'Food', '2021-10-22', '2021-12-24', 1820, 3),
(12, 'Elephanthouse', 'Beverage', '2021-10-21', '2021-12-21', 4030, 3);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `ItemID` int(11) NOT NULL,
  `ItemType` enum('Food','Beverage') NOT NULL,
  `Company` varchar(50) DEFAULT NULL,
  `ItemName` varchar(100) NOT NULL,
  `PurchasePrice` int(11) NOT NULL,
  `SellingPrice` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Discount` int(11) NOT NULL,
  `Availability` enum('Yes','No') NOT NULL,
  `ReorderQuantity` int(11) NOT NULL,
  `IsDeleted` enum('No','Yes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`ItemID`, `ItemType`, `Company`, `ItemName`, `PurchasePrice`, `SellingPrice`, `Quantity`, `Discount`, `Availability`, `ReorderQuantity`, `IsDeleted`) VALUES
(1, 'Food', NULL, 'FriedRice', 250, 300, 196, 0, 'Yes', 0, 'No'),
(2, 'Beverage', 'Elephanthouse', 'EGB-500ml', 80, 100, 985, 5, 'Yes', 100, 'No'),
(3, 'Beverage', 'Cocacola', 'Coca-Cola-1L', 250, 300, 20, 2, 'No', 25, 'No'),
(4, 'Food', 'Mr.POP', 'Chocolate-Popcorn', 55, 60, 196, 0, 'Yes', 20, 'No'),
(5, 'Food', 'Kothmale', 'Ice-Cream-4L', 700, 800, 5, 1, 'No', 10, 'No'),
(6, 'Food', 'Munchee', 'Tiffin-180g', 90, 100, 61, 2, 'Yes', 20, 'No'),
(7, 'Beverage', 'Cocacola', 'Sprite-500ml', 80, 100, 12, 0, 'Yes', 15, 'No'),
(8, 'Beverage', 'Elephanthouse', 'cream-soda-500ml', 55, 65, 150, 5, 'Yes', 25, 'No'),
(9, 'Food', NULL, 'Buriyani-180g', 375, 400, 4, 0, 'Yes', 0, 'No'),
(18, 'Food', 'Mr.POP', 'Tip-Tip', 50, 50, 30, 0, 'Yes', 20, 'No'),
(19, 'Food', 'Mr.POP', 'Butter-Popcorn', 45, 50, 25, 0, 'Yes', 20, 'No'),
(20, 'Food', 'Munchee', 'ChocolateChipCookies-180g', 80, 100, 20, 3, 'Yes', 10, 'No'),
(21, 'Beverage', 'Nestle', 'Nestle-Milo-180ml', 50, 55, 46, 0, 'Yes', 20, 'No'),
(22, 'Beverage', 'Elephanthouse', 'Necto-1L', 130, 150, 10, 2, 'Yes', 5, 'No'),
(23, 'Beverage', 'Elephanthouse', 'freshmilk500ml', 180, 200, 35, 0, 'Yes', 12, 'No'),
(24, 'Beverage', 'Elephanthouse', 'Soda-1l', 200, 220, 20, 0, 'Yes', 5, 'No'),
(25, 'Beverage', 'Elephanthouse', 'AppleSoda-500ml', 50, 60, 30, 0, 'Yes', 15, 'No');

-- --------------------------------------------------------

--
-- Table structure for table `leave`
--

CREATE TABLE `leave` (
  `UserID` int(11) NOT NULL,
  `RequestedDate` date NOT NULL,
  `LeaveDate` date NOT NULL,
  `Reason` text NOT NULL,
  `Accepted` enum('Yes','No') NOT NULL,
  `ManagerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leave`
--

INSERT INTO `leave` (`UserID`, `RequestedDate`, `LeaveDate`, `Reason`, `Accepted`, `ManagerID`) VALUES
(2, '2021-10-21', '2021-10-24', 'I have to go to my village because my grandmother is not well.', 'No', 4),
(3, '2021-10-14', '2021-10-18', 'I have to get the second dose of the covid vaccine. ', 'Yes', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `NotificationID` int(11) NOT NULL,
  `FromDate` date NOT NULL,
  `ToDate` date DEFAULT NULL,
  `EventType` enum('Club Event','Restaurant Event') NOT NULL,
  `Message` text NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`NotificationID`, `FromDate`, `ToDate`, `EventType`, `Message`, `UserID`) VALUES
(1, '2021-09-28', '2021-09-28', 'Restaurant Event', 'The restaurant will be closed tomorrow (2021/09/29)', 2),
(2, '2021-10-21', '2021-10-23', 'Restaurant Event', 'There will be a special offer at ElephantHouse products on 2021/10/23 ', 2),
(3, '2021-11-22', '2021-11-26', 'Club Event', 'You have a special offer to book club properties on this Friday(2021/11/26)', 2),
(4, '2021-12-01', '2022-01-03', 'Restaurant Event', 'There is a special Christmas offer restaurant bookings and selected items from 2021/12/24 to 2022/01/03.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `OrderID` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  `OrderTime` time NOT NULL,
  `OrderPlace` enum('Lounge','Table1','Table2','Table3','Table4','Table5','Table6','Table7','Table8','Table9','Table10') NOT NULL,
  `Total` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`OrderID`, `OrderDate`, `OrderTime`, `OrderPlace`, `Total`, `UserID`) VALUES
(14, '2021-10-20', '00:43:00', 'Lounge', 1975, 18),
(15, '2021-10-20', '00:44:00', 'Table1', 2910, 18),
(16, '2021-10-20', '00:45:00', 'Lounge', 3546, 18),
(17, '2021-10-20', '00:46:00', 'Lounge', 792, 18),
(18, '2021-10-20', '01:00:00', 'Lounge', 600, 18),
(19, '2021-10-20', '01:02:00', 'Lounge', 250, 18),
(20, '2021-10-20', '22:19:00', 'Lounge', 885, 17),
(21, '2021-10-21', '15:59:00', 'Table1', 980, 17),
(22, '2021-10-21', '18:49:00', 'Table2', 600, 17),
(23, '2021-10-21', '22:38:00', 'Table1', 300, 18),
(24, '2021-10-21', '23:40:00', 'Table2', 600, 17),
(25, '2021-10-22', '10:34:00', 'Table3', 900, 17),
(26, '2021-10-22', '12:41:00', 'Table1', 240, 17),
(27, '2021-10-22', '13:19:00', 'Table7', 600, 17),
(28, '2021-10-22', '13:21:00', 'Table3', 95, 18),
(31, '2021-12-10', '20:05:00', 'Lounge', 710, 15);

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE `orderitem` (
  `OrderID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderitem`
--

INSERT INTO `orderitem` (`OrderID`, `ItemID`, `Quantity`) VALUES
(14, 2, 5),
(15, 3, 10),
(16, 3, 6),
(17, 6, 4),
(17, 19, 8),
(18, 7, 6),
(19, 19, 5),
(20, 2, 3),
(21, 2, 4),
(26, 4, 4),
(28, 2, 1),
(31, 1, 2),
(31, 21, 2);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL,
  `PaymentDate` date NOT NULL,
  `PaymentType` enum('Cash','Visa') NOT NULL,
  `UserID` int(11) NOT NULL,
  `BookingID` int(11) NOT NULL,
  `CustomerName` varchar(100) NOT NULL,
  `Paid` enum('Yes','No') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `PaymentDate`, `PaymentType`, `UserID`, `BookingID`, `CustomerName`, `Paid`) VALUES
(1, '2021-09-28', 'Visa', 6, 1, 'S.Perera', 'Yes'),
(2, '2021-10-14', 'Cash', 15, 4, 'J.Marapana', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `ReportID` int(11) NOT NULL,
  `ReportType` enum('Booking Report','GRN Report','Daily Sales Report','Daily Item Sales Report','Invioce Report','Stock Report','Member details Report','Salary Report','Bill Report','Leave Report','Delete Booking Report','Delete Invoice Report','Return GRN Report') NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reservationmenu`
--

CREATE TABLE `reservationmenu` (
  `ReservationName` varchar(25) NOT NULL,
  `Type` enum('Club','Restaurant') NOT NULL,
  `Cost` int(11) NOT NULL,
  `IsDeleted` enum('No','Yes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservationmenu`
--

INSERT INTO `reservationmenu` (`ReservationName`, `Type`, `Cost`, `IsDeleted`) VALUES
('Center-Wicket', 'Club', 5000, 'No'),
('lounge', 'Club', 5000, 'No'),
('Practice-Net1', 'Club', 2500, 'No'),
('Practice-Net2', 'Club', 2500, 'No'),
('Practice-Net3', 'Club', 2500, 'No'),
('Practice-Net4', 'Club', 2500, 'No'),
('Practice-Net5', 'Club', 2500, 'No'),
('Practice-Net6', 'Club', 2500, 'No'),
('Practice-Wicket1', 'Club', 5000, 'No'),
('table1', 'Restaurant', 500, 'No'),
('table2', 'Restaurant', 500, 'No'),
('table3', 'Restaurant', 500, 'No'),
('table4', 'Restaurant', 500, 'No'),
('table5', 'Restaurant', 500, 'No'),
('table6', 'Restaurant', 500, 'No');

-- --------------------------------------------------------

--
-- Table structure for table `restaurantmessage`
--

CREATE TABLE `restaurantmessage` (
  `No` int(11) NOT NULL,
  `Message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `restaurantmessage`
--

INSERT INTO `restaurantmessage` (`No`, `Message`) VALUES
(1, 'The restaurant is opened now.'),
(2, 'The restaurant is closed now.');

-- --------------------------------------------------------

--
-- Table structure for table `returngrn`
--

CREATE TABLE `returngrn` (
  `GRNID` int(11) NOT NULL,
  `CompanyName` varchar(50) NOT NULL,
  `AddDate` date NOT NULL,
  `ItemType` enum('Food Items','Beverage Items') NOT NULL,
  `ReturnDate` date NOT NULL,
  `Reason` text NOT NULL,
  `UserID` int(11) NOT NULL,
  `Accepted` enum('Yes','No') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `returngrn`
--

INSERT INTO `returngrn` (`GRNID`, `CompanyName`, `AddDate`, `ItemType`, `ReturnDate`, `Reason`, `UserID`, `Accepted`) VALUES
(2, 'Company2', '2021-10-03', 'Beverage Items', '2021-10-10', 'Expired items', 2, 'Yes'),
(5, 'Munchee', '2021-10-18', 'Food Items', '2021-10-21', 'Items are Expired', 2, 'No');

-- --------------------------------------------------------

--
-- Table structure for table `returngrnitem`
--

CREATE TABLE `returngrnitem` (
  `GRNID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `ItemName` varchar(100) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `returngrnitem`
--

INSERT INTO `returngrnitem` (`GRNID`, `ItemID`, `ItemName`, `Quantity`) VALUES
(2, 2, 'EGB-Elephant House-50ml\r\n', 10),
(2, 8, 'Elephant-house cream soda 500ml', 10),
(5, 6, 'Tiffin-180g', 20);

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `SalaryID` int(11) NOT NULL,
  `WorkingDays` int(11) NOT NULL DEFAULT 30,
  `Date` VARCHAR (45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`SalaryID`, `WorkingDays`, `Date`) VALUES
(1, 30, '2021-09-30'),
(2, 30, '2021-10-31'),
(3, 30, '2022-01-31')

-- --------------------------------------------------------

--
-- Table structure for table `salarystaff`
--

CREATE TABLE `salarystaff` (
  `SalaryID` int(11) NOT NULL,
  `StaffID` int(11) NOT NULL,
  `Basic` int(11) NOT NULL,
  `Bonus` int(11) DEFAULT NULL,
  `EPF` int(11) DEFAULT NULL,
  `ETF` int(11) DEFAULT NULL,
  `Total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salarystaff`
--

INSERT INTO `salarystaff` (`SalaryID`, `StaffID`, `Basic`, `Bonus`, `EPF`, `ETF`, `Total`) VALUES
(1, 1, 50000, 500, NULL, NULL, 50500),
(1, 2, 75000, 7500, NULL, NULL, 82500),
(1, 3, 75000, 8000, NULL, NULL, 83000),
(2, 3, 75000, 7500, NULL, NULL, 82500),
(2, 4, 80000, 9000, NULL, NULL, 89000);

-- --------------------------------------------------------

--
-- Table structure for table `servicecharge`
--

CREATE TABLE `servicecharge` (
  `ServiceChargeID` int(11) NOT NULL,
  `Date` VARCHAR(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `servicecharge`
--

INSERT INTO `servicecharge` (`ServiceChargeID`, `Date`) VALUES
(1, '2021-09-30'),
(2, '2021-10-31');

-- --------------------------------------------------------

--
-- Table structure for table `servicechargestaff`
--

CREATE TABLE `servicechargestaff` (
  `ServiceChargeID` int(11) NOT NULL,
  `StaffID` int(11) NOT NULL,
  `Percentage` int(11) NOT NULL,
  `Amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `servicechargestaff`
--

INSERT INTO `servicechargestaff` (`ServiceChargeID`, `StaffID`, `Percentage`, `Amount`) VALUES
(1, 3, 30, 5000),
(2, 13, 10, 3000);

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `SignupID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `ContactNo` int(11) NOT NULL,
  `JoinedYear` date NOT NULL,
  `DisplayID` varchar(10) NOT NULL,
  `UserType` enum('Admin','Manager','Restaurant Manager','Cashier','Accountant','Staff Member','Life Member','Ordinary Member','HL Member') NOT NULL,
  `ProfilePic` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `ContactNo` int(11) NOT NULL,
  `JoinedYear` date NOT NULL,
  `DisplayID` varchar(10) NOT NULL,
  `UserType` enum('Admin','Manager','Restaurant Manager','Cashier','Accountant','Staff Member','Life Member','Ordinary Member','HL Member') NOT NULL,
  `ProfilePic` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Name`, `UserName`, `Password`, `Email`, `ContactNo`, `JoinedYear`, `DisplayID`, `UserType`, `ProfilePic`) VALUES
(1, 'Shan Dilranga', 'Shan', '$2y$10$HFG.V/09PPziKI9kDwydHOP256LVXZ8Ax6pgn2CvnXZPTmVdpZp46', 'Shan@gmail.com', 711234567, '2019-06-04', 'AD00001', 'Admin', NULL);
INSERT INTO `user` (`UserID`, `Name`, `UserName`, `Password`, `Email`, `ContactNo`, `JoinedYear`, `DisplayID`, `UserType`, `ProfilePic`) VALUES
(2, 'Gimhani Rubasinghe', 'Gimhani', '$2y$10$t5HGheC1t8YV/QvQylEn4eoVfTTqputMd1WeOYTVlIl/2H8vm6WGe', 'gimhani@gmail.com', 700234567, '2019-07-17', 'RM00001', 'Restaurant Manager', 0xffd8ffe000104a46494600010100000100010000ffdb008400060606060706070808070a0b0a0b0a0f0e0c0c0e0f1610111011101622151915151915221e241e1c1e241e362a26262a363e3432343e4c44444c5f5a5f7c7ca701060606060706070808070a0b0a0b0a0f0e0c0c0e0f1610111011101622151915151915221e241e1c1e241e362a26262a363e3432343e4c44444c5f5a5f7c7ca7ffc2001108033402cb03012200021101031101ffc400310000020301010100000000000000000000010200030405060701010101010100000000000000000000000001020304ffda000c03010002100310000002e9329e5d2214de764560c8d00c848412185696211eab6a022aa6574706121095b46a5756272babc997a96d762121aab5b698b30eee6574cc64019480c555748c3b716b9ab55d6e4c825aadaec961040aca0208648147418300060032548241808b21b0a35328e075f98bdeb159155948e96d8be5bd2f9f6bb696ae6a461bcea21a4660c290608209241448a921a60615b83a8e1822c204b2bb446560f27adcb5ea3ab48d24a14e8a07e6f4b01b6c4b6c8aeb0b08942baae0db8b6cb62b2dc94b2b952c565864002b008219205481810412124950484324080d92bb01cdc7bb24d7658166232a9b6bb6ccbc3ecf3d7a500c6ca57379d6f5db7363298064820859011018086bab0196298d4caf5a18614df4dc2c604e6f4b98bd37aec90b29b1aabab061dfcf5df6259600c202912c4b10c1b326acead475d65a9ba895c82a602283214c8349081811482492a104124243042258c0c8e667b926baf20b90ac253625b6736a7b1a760fcf54875de6fb11ee58c622b2c19228208908a8092035d8e432356e8ac196c4baab410c1799d1e79d374b090c465602f37a3cdb7a4e8f2302a2c9258aca61d59754d5a8cb72f45d4cae182c9240821248349022485845484549206084920014b2d5225e5c0f2f4d196e4192536d56a726ca3a76d2e8fcf68ae9bcdec1ae5d9588acb0602a0a9048694356329963143562b5716820aaea6eb2410af06ee79d6b2abd00206818ab97d4e7dbd0747908f3dca5f653c5a57b94f1fd597769c3af36f529736d36d72b8325924a432402180600c2204328022a48068080128b5b8a7474978faf0f425dab258415836556271fb5c2ef5b8dd1f9ed559759d308d65debb2257656232c69d91d1434a42b2a06548cad560610191ea8be9b901052ae6f5792bd6bf3dc8406a665257cfddcf5e9703a5e3a2b6ad9ad143d68f667b574f77cedd73ec1797d487aecab36c044a611404104824100e03024800450920640420820363556572f0fa5cfe9cb7c26e402b2b3d76a70bbfc1ef6a62746e7d223259b011721cbd0aedaa5911a596576ea0564415daab24142c525ab0a2904aafa2fb206544e5f4f94bd4d39f4a2c0e02cb62707b7e31aae98d9d2db7758e5afa45cdf26bd9c82133ae2eee706c4f57511cf4f01532112110181042163028a08a0400c90208211057aedb2537552f13adc8ed4b6186c447589656f672fa7c9dbacb32372ea1197536c8b72f65764447529864d17adec35599aae8b060cb44103b064adc42bd145f614644af97d1e6b5d5d19b42475648a6bb399e57a3cd9d26aa3af9b7f56ad38b0bbd99327573af959a7375e71d4eb3d6e9f9cef635a4199d120c2865232b0b082306155d696480209010182097d17d82ab2b9785def3fdf96c856e551b3adc33e243970aa7aa2ad8e82bb2bd4df5d8b726eaad80082b0c6691c1a19b4d016561a56da8e8f596905195912bd145f46b7aeca79fbb9735dabe8b91a4ad2daa73753ccd52ec75d9dfc56f3d741f0b5cf4596dd6528d2879ce6f77854d643d79d7d7e4eac6fd1456c69a09001006042aca1209158528650104808202a0d145e95d76552f0bbdc2eeadaa57591935e2973e2d9cec6b2b0173ea595a6a55655a9d020b22c47249010aca0c80aadad51996849351d6cce698192232a2db5594f5599eca79bb30cd77dd4a3a144af89dbe2dbc1eb73fb1cfa6c7b39b8d751f89d2e98bb7f37a194c4f414713bfc4d4b52cabb728d5d38dfaeb68bb9e9cc00860a64082a3020824a0202152104054825d5ba574db4cd723bbc3ee0c21d66bc3b70cb463db8b1ac84ef67aacacd2d7626a74242cad88c192103055924047aed65654009a7cba68abdd59223d68b6d36d364d59f531e4d98f3aef991995b560e66ec2d62dcf39f4e8a68b939afbaab32e9aeecdc983a95d70b0fa1e6d677a1fb71943ccebd16fe2f671ab2060092203080c1615a3012b8c294c90c08224165ac92066d1926b1f6791d8011359ab0edc39d260e872f36af43e73bd71a591a6e56f5ea74088cc7aad21042a60b2155aae4155d5482b63d4e966804054a1192cb2557259cecfab235de646995a6cad72f23a7c75eda71bb5cfa74eec512cab4e5345dc9b0d3ab1d85b83a9ce4f30697eb90ca89d4f41e77bb8d687462084124822416b75a061a12115a1835ba092b7d47515468c36e695ba9cee94ab08b9a31edcd355713d372d33f7a9972ccad8e82ab535374859a2f8561910c80922a9aeca061210094d55b556888e8519696da6e415d95d9473fa1826bb70c440fc84b395d6e12e5f57e4bd1e37d5cfada39da86dd3357d1098eaa5b3ad7cbd9c4978b6e67e98d8a1b59d9e87cc7a2c6b6b2b02030ac2060808454570298406408822a85351aabd25a327439eba7a18774006595a5c2abc9bf98ceeb05ba98995f8f55474b37153616523020220240495d9586bb515194d8ac253bd5622ab28b767bec8af5d95f3ba1cf9aed9574ae9bab4e7707bdc29aab5e7bb3bf51a387d1cdd919f78aebd2a52d29cd5f1fbf8969d14ecde1238b17d079cea677e95f2e8c98029048b208112584104220648153229474b6e5611395d6e32f4f4557a2c32c55616371fb3c797a7753a358e73a371ed1197536356f72c4118111032d020911d412002d95d4845318a8c1d0cdab269b1918d94737a9c99aeeb23a21609cbe1fa4f3eb56bc7d8c6da9eb66c6cefe2d55e928e104dbcabb986304f4c1d19decd4aa6caf4e6b33bf57ab97d1cac8a4224248030c4808a92424903248a161b6d0cb078bd9e22f62faed64132cac3a53727a9ce9ae85f9f46b1cd7a0f2eb6228d4d96536b2e412c124323a52b290a9522b28cacb40494d2306bb6b673e9cda6d8b16c5e5f4f999bde305928b0599b95d4cd9d727bd56be7bbc9b359c8d734b92add5461f31eb3c755461e9258b7591838975912fee707a18df51f3688208249032408912022d2201a086764b0b55844e276f892f6edaacb9220b2020a73daad5fa3368d73e332b67a05b25976aaae862ad0c64880a8aca682ba823000828c65a2cae91196ccda735e1ae5d665c3e87115e7e1f6759a9b6f225ee9be72e999ec302c46b1a18574db8e5e7799dd835632cd4bb4536dc92885ed8f4ae8d198cbdbd5cddd8d6880a4840d24160620902a4511015594dc3aaa8dc6e9f325ee3d76b3015a3014c1765d8a74d17eb3ca68fcba29316eb28bae59d0a390488c0590d447ac2a2aad54ba1645345ebb11014b33db9ba14764e1b3ab99b793a9aba7e63b09d3e21e62facb781e879f4104cd781d086954f17b5e6f3ae367b2bda112cb6ecf6d8d5df4897d364baafcda8b7ad834e35d09221808418004124808401596a8b73eb2b5d00c58fa1825ed302c9520041ae474799d51ec56d679ce8fc7a80c83e8cda7592c852c8a43241648a51c595d17d15a1492482a59558829ba9acddac5b6e3064aceb28daf2571f76c538e3b8e703bb6d676673b6f3db9233a3158a7cefa6e2af95af565d0484962317aa9b05a0975f9af3a96e1e8f3dec2ae909049142242480924023a14eacda072ac64e774314d76083710300406b8dd2e5f45763a36b1cd6139752a546d39afb9664b0692211000a32b2900ad969d4ad8c24a8eac0437b37e6d1cfd6311bb93b99fabcaef2c37edcb963a54984ebb4e5b6acd61bb315d97729e36f2f4b2f96cbd4e64da9925362ba432517add2eb72d8747a7c9ebf3e97d88c8f012020124248080c16bb6aa4baab076468c545e935d220dc40548c8d5c2eb71bb12eb58378c241e5d62b28da33e9b9aedad8ba024120864248a35362d14694228b2d3590eccfaee2de3767ced8d92f4de72fb1c3af15d6ab269a5360d028cd530d003cfdbda962cb925e5f8dfa278cae4c926d9ab72e454b345896d955ab0bfb9e77d173e9b1d1f309128a950c049042410345d4d0b2bb0790460b28d39d6e126b1148a0eb0e075f93d996f826f18594f2ea4104d39b4590ad884824044232b5446514a1a300a2b0d40c136e9c5bee28e2de9aca65ddc6d4ecf47ce7a093459cf5ceba8bcc0bd53cb736d986c974d6604f96e959d70f25c9c8f419ae7e786fa2749205252c2cd792cd648592dbe87cff005e3aeeadcf50150820844a00894c0d4b4dd4592daec1c15cde4f439fd297489358104a88f45737adcce9e35782378e7b2be36032c557535ee6c7c313a139f0e81e719779e743a439e2b78c15d9d24e713a0dce15d2af0a9b3a3c8ec65ce9d2cbbc272ace5ef1d1d116cd456e8ae6892d24a0c114605486bdaab4b20d9eea0e0d1af3e7a206129617d92bb12c4b2bd92f72ab74de66fa6de5d8c202200c9000a8f00267ba8a7b2bb46565cde375b8fd996d906b300361c7af9f536e6d78d5864de39cc9673e8032c54ce7448cd72a5da5acd90a8bc16bb504aefaaab575a11901568a2aded717b395ce8d714f23bb4d796be62e98d793b3c1b2f0f555dd1c7d08c96e0aecebdfc5d6746bd3c893b49e68afa5a7ceca7c5b32e37525d5cd5b757a359a6abeb85dbcfe84d7772df572dd8d1da11d51630248458d050e942caacb2db16c90a356717b5c3eee7562c1acc9258795d5e3aeed545f9b62b26b3848aa5b0d225d22805ed98d9a5b1bc6a199d6d9542d40a5a81682c8a2bb169a9bea1fafc8eb49a191ae4e5d186391ab91b7ae3afc8ee712e1259a17b0932c55e77d7f0eb1ef6b3537733b9562f92d1d5c3b64b17d3472f93e8b949872f5f9536da29b28d6d133dca98d75f572aec74eb3ab66b09122b0541605584015940c4c5ba715c97d6c973c4ee70fb8d342b7224961e37638d2f56fa2f95d592e7963609ac93649723690665d6c609bceb3ce9d28bcd9d229cc5eac3943ac2b923ac2b953ac0e657d7530f639fd1cdbc86b95e774794709755fd70bcbd992e6fad5edf41a7cbeecc7e697d1ba5ccda7779b82a8da9cbd14fe97c7ee8e9635e6268c2e9377092c81eb9425b5cb68af4637dabb0dd173d10d03384d1338340a4adc29965ed9da5bce732e914430f6b8fd818154920b0f17b5c59aebdf9ef86594d8a08c6a0308630ac40488112248253410316040952481adc1474706fabd95ae1387dcf36b8ba3ceeff4e78759ab580f50abd2b314e7e8db5c1dbd543cf0f4457ce3fa063cd4f4a871f0f6b31cb4df873bd06bb51aa74a884e34bd9e3f5f3be8588e3c120825149200d0ae584a65b0a85f17335e0ada0422094c92c3c6ec71b3aea5f9ad1e87a352e8273d1800ef4d90e140f10d8ca0924952481900c0018572ad5502efe7f46ad653735f96f51e496cf57e3bd9eb9e3cbdd3acf9d9e86b4e4b6a6ac33654b9a3569228a204428ea52a52b9b45ab8e962db5d342a9590b9dddd5e5f4b1be9b536239583156249025604ac1e2c1a2c8300a2a541011a021e375f8f9d6fbf269d65ca9d650c9c7a19202ca9c610060812b060258d040820824a58602bb2aa7e8e2de8c1abb13c8fadf20a7d8f88f77ac2dc2ab8b4a1958d70ba2d6b7448380c004103429c7d0e66b1e3c15747ba8534d6ae04712ebd95dd9deabaab51cc6955a44844868b2980106484842c925815a08cc201129393d2e7e75a7563d9acb932c49272db4112404824a82020614a64530c0480304232c256e86bdd8f65c9a9e9b91e3bd678e69fb9c6f5dacd7a72d1ae5dbab9ae75a9c5ae57757973dcc5516c854d6282312bc9a65cf8ac3d5e65d320934f656f6298b2f6afab4e3a358b623303124849210104220642006024961124a4110241666cd75534db31edd65c028a339c6f41a0a5d2985c291578a6174a8ad812162a81ca41cd70b256434bd6bd1d7935dc4a6eaae79be63b7c46fadeb78fdad72ae8d62e71d1d343927b55af10f7ab39b4f710e45dd40621b8c526d8b567da2e785e77daf95d39a5ccda3300d76c97d20bf3f3dbd95da024c09210814608180862c1a48092004810082409cf536676365176b2cc8d73cd9a5eb0cdd2cc47731cc9d49672c75d65e5b749ce5ceac9ae4a7650e3ceab271e76057227604bc6b77572f4f566d3332bb6aaf2fc8eaf3edee6fa2ce9c35e8e756762708cbde9e7dcee8e1a9dc9c363b0bcd074873c9b12aaacbea6a8c9ccece05c703acaeda965d45f9d7a9c7b79fcf6d6e17aded8065d03cd2bd19ce89d01cf15d11cf0bd01cf8749b9ed1be73d63a0b06a19142204e75f9efc6ecb6a7de51d2d4c1ab2bdba4d4fbe6e50d9644858c8d0e54cd19244adaba0f5bd1520224b2b47af3ae9e8cfa32355b49e5735f86bd764e2e8ebc7a55d1625ad1caddc941d10cc3454066252cb597b66a4e859c8ace8634e734d764d5352ab101a2abf1af4f55f46356356fbc92a50882c300180556b28b65582b2d5ae6749c8ebf233aecb2ba0520900d39da3368c6af8c2ca6bb39e6974758f54d6759cda3a7278a0b8d322f6cd1750cc62faea5abecc8f572d2a69141864499d757467d1069ba83c869c3e9779e155d5e76f364f415ccf99b026b56a7a3e5c9ce61668bb727a2cbcd1eb7228d95ef35733d462ccf3e26ed5d1caf5dcdccf337d564db55620da716e9af4f9f565e7a6746d4904b9900b1a02a55d650e8494322b4839e9793d3e735d67aec40aca08259cebf3dd9d6a2ac51cce8e22fba8be9439cd4b16ce9cef633164840642091467d19a8bab5812c55a58308d266f574e5d3ae6d9f465af15e83cfe8de7bb5715b78f4772be73cad1c5eadd742d0f33e6eccf66af59f174e2ee276fcb9afa3c2d35d7bcd3973cf1e69e92ab3871cf7cf64e9645728e873bad9d7a4c5bb1e2d0f1ea4688a1d6838230803161158e74b1a66e7e7edc2bd5652914ad09059cebf35f9d6ab29729cd7e695efa2ede59ab7c6868a345cdb14431461948a57522e6d198b99180085a889425625ed69c9af5cdf26bc76794a9fadd71cc4ec62d66ca6ec0210ebdbc356591afa2693abcabf2d585256ace459bf39b63353b7a472b07761e7268cbcfadef5ba55dbe17a8cebaf87762c5a995e6d8ab2410a092519002150c115e03960cda685e8c900ac961565d4e6df4d99d6990599eab72e75a6c4b3a6232cce9afcd7a68593161068c06c904519b4e6ab195a0060540ad257654bdbd78775e7662db8ecf37b9d7b72373466ca8225b66236e819c9a451135a5159adb218d87313436524ab5a995345472b9dbb163b33d66687aff002bebf375f3fa1cfcdaeda6dce98ab5844841021105aca548ca61a411cf570d6d9248aa5746aeca1331856e96549463d9966b4dd468e985904ad7d37596c079e8b23824964124a33df4558cac404152b05aebb2b5ea74397d2bceecbab36b14dd9fa5d78f268f4465f355fa95af35a7af49ce9d22bca1d864e20ef29c59d96380de85a3cdb7a22bc3e96a050d6ac727c9fb1f296d35eacf3777acf2feaf16fe77439f9d55654f9dbb2358c008304d42208652a12a56c106673aca3435a810811d68e6d38e91949a6a6acab2e8cb2ebd145bd710110f6d56dcd855b9742c8c182592492a557534ee8e2820ad4aaad6e8bbfa5cce95e77d3757ac61d9569ebc6e35366d8c8b34ed44b3445134e28b0b00a8b8d4a5ea00d29b50a120596987cd7abf3fbcf228d1973d7a1eafc97a78d1cde9e593058c9cfb3bd76114ac1106a34102ac92920962b265cad9877db7c064504070eee7d1656d2da1e945c9a68ceb5dd4ddd79c56ae5bacaacd66d2a796d991c9042412515d88a5eb740ad5aa02b4a8f59bfa3cedf71a62bdcf94f5dc0b3af3ee5945d2556b4973d8c6cac5a6696bba15b9865d24895dd095d9012ae55cf6879d3675bcc0cd6e6accc75edfa3e774b05e7efe70d5517e7a3ba3c452144135924419192562a62caeca6391d4e4f5f4b6499a043139bd2e56a5a03e812cad298b6e74f7537f6e411d33ab5abb358b483cfa474689245064152caf35995ac5add2951954556d66be9737a77375b55b719b93dfe174c2d575dbe7558c46d3889d09824bb2ba2162a82d0848861525f2c16542c2b62cbc6cd6519e9476307b4e7d199964a797d2e3cd9d39b467763232152a8241a8d010a324acc8d16556571c6ec72fa5a5d04c50cac0e3f5f8fa9759559a3536d2945d9edceadb68bfae1abb2bcd7b11f78b591b9ecb234180292a6023a05958552b4a0aaad7621aba5cedf71a2daacb97c1babd6798fe68f5c7a64e6d373ba62dc4364442b99774e6a1d3b3050761f82a7a24f39a4e9f3f0e9a6c9ea3cb66d156ad18ebd9eba3e02ab2acda791d4e337a2fcda73bb1d5a488e94aa46b2cca488f5e74e5587a6dcf273ba7cbe8749a0d7316c35dd15f1bb5c4d2fba9b494dd4599f4e7df9d51a336ae987a6eab34db4ddd30ec0f3dc6531245a6824b11d60300446aea452a12c45d5bb99d2b8d36d575c2ca6db3ca59a7b3d31cae3faef3dace2892dda3bcd2798649a31a7d4461e6fa8c19701f3ead93bf97b3979bafbb9ecdfcbd7e6b376f678beab1d10f1fb58d2536552e1c1d1e75b7df4db8e963d6f21aecac5046e13005197358830f9b4569cbdf8b7748e566696ae23f27a1ceabeea2e9a19efcf62f4b9bd4cde7e9cda3a62eaac4965b5bef16329e7b2418120a3040d6e92b2c044b2a01065096576ceaf1f45cf72ec1aef3c76d6954eca726f9eaa7670b78d6dccd2bdfaf457999706be3eaededf8df4a57d1cf54982de15fabdddbe53d0655f0b4d1a599badb0a7ab50e3d73f4e8329ab18b36713d179e5beda6ee5d5ca98b10a824b2ca89af5082934e44cacaaca1317439dd1d48aeb34089655874e7b2cba9b73a5a6da44ecf1fae9cbd19efeb9bc418a1eb7de6d713149073a5865821804b1252ae2952cad504310345a73ebc7bcf6ba1e5bb4c7539bd3a359bbc7f631f4c59cbd79759b2992deaedf3bb64cac928db5d874b91be99331d365627dfae389d6d35dc916ac63ebd5ab1b5356dce9b3db8b58dbe5f765cf597d36f1f416ade464645175566a3d4d358a95933a72a65b335f9d32f430eda70466aab4d4c4962d82daecce92ab69275f93d54e5db5bf5c68006351eb7d4d051b158a34b04146090c8c8340415d95ad524a680cab935e6e985314f58ef4f4f2e2c3d2c3b975d5046415963532b45990c6c199c65732d1341321d6a88d5ef1b6418dd35df2ccd6b38987a7cc29e7db99d2eb15bcfe9844420894b2b6a4825ca2bae744c8364d7cf43b32e9a78266a487530d896d576498d57468cb65fd1c3d04e5bd7674c5a1933b2c966b3712bcf4595a0032d1240a95b1a430a8e8b5483424185a2fcfbcc4653d93f9fb3af97bb8afb64e2af7e579eb3b759ca7dc2dc23a16471e7799784ddc91c67eb45e75bb24242a056745c7a39763d2c352737abccac9d3c9d5c74c36d56f9fd461542aca42a6c901b14419d3410b39dbf9a9a74517d308250f59b9cd11ee5c389aa336bcb35ab5e6d89ccb2ab7a4b4418b2ea5acd421c5574652a56a406a2b042ca415c05708a8c08955d46b2a194e9b51b3b79ba6eeb98ef4996d3515b4e5ba6ac83397800b145635b590d52eb0217063af36b08cde7b53d1d787996f6f915745746ce069c6afb69bbcdea224800cb0153a8240241269a083f37a1cf4d77d174101652a29d652ca2dde2e4519d8cda334bbec578c5767bf72c10669563a8ac80b5b3bc5e2b839acab80b639ac8444940514e6b08e826b3652eb59d3662df3f5bd4f3eb797a39ccdd9b7517342a5d1aad9a4b45e4016255e32d69b8f2f3d9d8cbcd972cf526a59caa7bebab9bac479eeef33a35e7f64e9cd62bb33f9bd5a250b1a0665d34cc92e751ca4b1a9b269e482e0db88d96d5666cadab8aaa65dccbab168bcf702b355d17d135d3ba9d09c9bf3e8dc6565ce8192c201b2324cdb4d6d344150882c8ca2c650ab00961590224002a7428c74f5e1dfb78fd7d73658c997542b7db9a4ba6aae15d7a55296694c6a68b257608adcdb3adc04db75474f1e28f53e66ece26abf4a96cf4f2db329e5dd8444214ea02b2c900958a99a735186c5b709bd95e514df9e2baaea3531f439fd1d73bd1d26eaadd73ae9557d3735d97bf4c73e6c0b44bca5034433b5f2299745a52f8676b96aaaf5033ae99594e854a4db25a8d90a92f532e6ebddd78f3b376f8469eaf277dce9d3e62d3babcfd09adf9998efb79907a3ab89a4db57342ebcf4f4ce7cf49e6d67aef3bda679b77358ecd7c76cef650b39f5735b676e565cba8208e2c40c055b84d562d9150b60b8fa39234b2599d8cf7d0251ab3dce2dd877dc5ea4379cab4bd3b2a3ae6a64e7da091219022404906125492590c9a8c2402c960592c632533497212435f2e4e9c7b3c790e97424ccf18f26b7a35489cbdd2156792bb9be4ccf236c9ab5fa99237f2e4ce52c92ce56b933dacb24ceda4843204c84120c64cd92424900b2246907c724b8ec931d16a906cd26b3877c979da924e99de45dd92463fffc40002ffda000c03010002000300000021c5363a09ccb72003ce8ea816a408e45fd407c71372a96e6d570d813ce05e8a6f5e001043e6b6df3b14bde6029a51f93c43ac7ea998719101bf64da9eb1cd9e34add609170a74dcd2392a012250a61acf8dd4e8af7b91e9f58f1284d07ee28530e39e0519083a3e3447fa293c7ff7adae25480cfb331ee36124901e3ddc4e9a0e8cc26e017730d98a54616fa9941b370e5a32ab2567a47fed34f8761202f6e5dd252e2b36b8a7c0f3182ad5391d067204e1ab08fbcedb24333e3982b92fdb41c7659090caee8863037fadfd4ffe4c1663fcae993fc74e59f64d51ed87f2068b8e02ce4d7c903806514958ec1dd5c69ca161fc35a5de6288bd3c4bf31d9ba80198421e883a71449af830871dd441577d576337ab303ad734ff00a22cc07756e1a4797f2730282fd1a50d6d6542bf5951479f356bccb3bb98e91661f5b21709f513880e7ea994da6b8f153436fc56b5e0e7198f74e94e77f03ec1da6a41eac293f7e0de91e88c6578d60e6b9230f3744ddde60dfa3a4b2474eb67ce76d53c567b630f7ae03283863f62d96c21375ee00341b2f2401ff14e341bc2dc559bcdf79d2138ced2d5efe68ab2b0f5f720aad9f12e3d3c14d9f1243567dfcc1147260467c034feb5288bc25f41717780c6b3a4d0abdc2481763a6142b94afda80301a8509bdd239caa45d30365f30c9ab6e34f6ccc2348e9e7dcda9b5debd74d0e636c165270df048a3ba90fc0e22888eaf1d5c42afb559a5c2f0f087ba4fa7471053b5d1c9a297bcc902d67706d34ac7efd3ee41432de342a7403a3803182356e02d1813c029fa7ad2795e847df2e83f6be0b77471bd7101933e12305aacb81a0d57adec50ab58a765b5991739014319704a22457bede1e723a23cfc2411ebaa5fbd3c7e1018a34b3fa8507e6a4740c1fcc9a22a8ac6c95cd319eeaefcd57209ae4c5551829dc68c26b44720285a262c15c452f23cb987d80c7a436e006f06ee115f0cf17d17b6f149bb66ca064c0e1afd710c516c08eafb9eb60455ff60aa2ebe35d3b7663084ec53bfcf6a85795b76aba8c73459152fd4a78627dc8f2e01272932b3711d3dc7b9978380bb4981e7e26ee4b23db4a782e15957a38ec60543b7b445acc2dcb71745d00e79ececc253e3de0cbedd8530563947443ecd5271fb73f3ef8232d4f089b910c3df6e8e0bbf2ccddedbefa9e0b2fb53c45971562d00e4505400a6091781a77c671d2368154a069fa52458d9a69bbfeb3c975b94b569bd81f19e29b61f5ed1efd8026f105de4082dc97bfef0e64558b6e9dc34df4dca29eb5fc9f0f31ff00f15e93e5e9f8e90699413ed0784140a7e9873430e559ce50c91c4b550325bcc5955d0c1242e304b806f347ff006255ccc38e89e2eb257d6cd240ae9d21d5ad27118de99e83177a575b3ca9cb92182ebd6161f945d683cc555a7df8e7fea78baa307eca63ac6c6a64aaa69a8f37a0b082a4b98c278862e7e8e06a2cec93f725838bd2451b2bbaea6b4eabb606b9cbe4fed03c3962205e9f77b6ed4d9c4dea01a6653468cb5fd251d4d073bf265daeb5c2d4515e7fa1dbeec0168027b619f81b488c2bff005eb991392ea04d341e895fdc149a4d78be3517d8602a88b258b69bd6eb798b605d39d6e646eeec7e1d94707850ae7c4ffc2c64962a1a30b774c97b8b344b061fd7ca7698580460d2ad1a1256065145f96d2ab3765bdc2d3f9f46d579455fdaf99020cb035d652a32ce0d117775f99a79c2e96bed203528d7d42bb0774bed29a0e08d5b59e851b0e9f1ebd18404194be8056c57722880e83ebdc3e2d55525e2a939a9a38f0f5039540575aaf99cd3488ed0378a626b3d9a8fd4866422809feba219e6b7cfd1bee0079a50e1a9ea32b6875d61ca2b0e5d4b2d54dab6548f9f920a15eaf78c27d0b72d32699751c0373ba65c4b28eba952aef2420e94be154525b942b3f1a73c829122bb8b06a3c58418d17b04a120283839dbfe47bbd6c80f459987c0c4130f4e945bb622c9b1ddc726050294637741dd56dc595ad502632aaf9cd02aff00388b5d3794253359bf885e199c3d1a5fbe586a6a04a70abe681f1c58fcc09ef9375cbe3ebefaafa22a23dab45f7546e208f44abd0b2104717eb5916aa93d1ff30a73d8d9b61b7cebb55ff0611c2af9fdf7aadadb4831e13e5ca21c35edd32222baa431ce2dea3b293639a7e44158d8c14cf9137e06c9f7c7e0e90351b20faaa8f1b05436f36debb5cecf062c0c06ea825342b8fe3e6f0fecff00b6a0dbba2e4cbc7d10441fab169b8ec6b3bfd168622af72c677da0102f362d8fa13a707e8880e98ea5e80c7ae3d27da2c28813a2efe560596d75f936b639b96a8a2b0f313cc16612cb73324143dd9e986723f198987f001b2e78f1ccf36f48940e7dcdb472faeaedcfdbb4013fa7bd17af15c13e43e24bf2a3dbe2fe005f73d85e01d73d74173f0418fc71d0027df83c01cf3e820fe373c71c85c823ffc40002ffda000c03010002000300000010ed1f0a9b6d226e819aff00d0d774cbb3ea7a57f77a4b991b5e43f6e42996e2e017ad62a35ff4fb796c4cbc00779c0468202fc5e3021173520ce4e804cf74d1db16facb855c9f3ccbf04bf74195de5ee3cae3fef62d7f71d27d42215c223316bb729991e9ecbda6ed107b9192114339a1a91fd6880b420738d570e43e9975b3fd5f0eb80f845c4eae611ad58c0eeacbcb7bdb5a962c3efaa3b05c2781faa1ae21c916a6f3962d1bce1d184e21cff6bbe28ad9818d4190f6547a1a55380474aa0f98bc8e83979d1f3731d80ffd637fd40ac752d0c0858077be5b16682c1b2a1c2bc003b68015fc82f49db78cfb97cbe4dfd13d897c802aeac1e3cabe69a6b3c43437ff000e0c4ba2418a073ded548d1b795799428c860c5e5aff0010efd3bbc146ef338dc291b46a582798969a9174e3fd803608e64a190dd2bb1590edd29e38a2b87f229941b92f1c0c7c9c03ef71ca46192255ba604fd8caa8cb455b413fde523f7540d239b2700dc70333c5214fa56f7f5650f48c656b3aabbc4d97d0e997eae83bfbf7bf2cce789312edb442c284d19ca0b182f93f41d9cd8e7c8770045d316b43880b6f777145b65538b84697bc23544ae43ad624deaa212375c220caa66968629fec5a078b1f6aaf493a86cdea8658d14f5de4ac2390e33ba5d5939984bdfee37f6cb07ff9ed722954dc4784579be91e741c5c0313a00dcea55c25aadaafde7280259f6d1720c1e4457b65b39170d688ca884c376d4528157c878ee23ba74705c3a28494eaa793d5f055dbfbb6e54b3320c6f85ab739b7dd7732a1e95285abf29e3adafa38d82c2b1594ebf94877754e2208fba8478ad42dfbdf153e914330446fd2ff00bfe55b3f4683752a7dc3b6376b35d15768a3952a7d0099fd389e0669575dc5a523c6016de89ea9381bd8c8c881e079688eec880bdb727c4f2e3038c40c6fd514a190a163f2cf63d5854dedab8b51e1a29ca51bd0a9e4fc4cec31cb08514754e511e6cb4b044b9af92b43475e63af73b31258d71a0ad7d1fa9423a7f95d22b9802cda3129d475ea0caa5d63beceb4e855e54afec89ea903b4df0884da2030f86f0cf3c2f65304fe2d09ea87171cbcff00c03d8365944bfe3ceb17d5e7d16f88632ba62dbc86a147012a3a7209a50ff935ee5b35c335ba3ae6660ececf0831f8edc32e02748e779886deed9a1235e871af2d84cf6fa60420fa8378e117b7bb4d5205b22b79e663fb2c42dd4618fa67044123341cd9fd9f25c5299148652eb38679fce9eb6d554b3ebceda0bbe13879edd7a6a54fbf752f07893a4aec284e8acb5b5dd50cde9f3329744a042d032531eee99065909aa543068a47a46954ddbeb5f8a48ab389181e79c4373103df2a68325fab10484965377eeae7176b606b732efbb4023469e55180d53b16f4069b8b8938adbedce1ab0c57e503bc6d6f9ab95787554164436f454a07034120e269d9e23630c5b604f151dd287613884bc66e77b167c469c7f18a74ed5b30edb4184e19d66771a9a2fe3f63a83c3ca52cb978c62463c1ca5e3a9d8d36ec5d4a046ea71f4e2524f2ea523dc67c242b51f479735708460c41a82b3288e265c296225e5a8d57aee000eb01ea8a81f542867bd9390d76fd50a322ee99ddfecc1585b588f1f4121f6339f143c1db1da456aa9c310deb3c51ded1a8529606488d572d22a7027dbb6c6f0d93e3f6ad1132d4260431761c9b0fdbde703ebbe04100931f912d567867dc78bbef8b78257b353e5c1a04f1e683997244a260da163a5a7a52bf0a7c6ce81632897f9376b750ab1b4f8e5fc80e77b8f33b05cf5d725ce8af2af78c1aef14752c6d99a7868891a5a79923a89197af6d2afa111aeb4b203e0e9bb7696e48d390a3beeff3d4cfe46571727c0611c53227124d4e9c427763fd8b761f7fdbe0e6b9e41dd8ff00bbea246c9ee45f0c673e5a3d58a975501770af351993229539a47fd30df37c47cb09c7b45b7926bf179547e359aa51ca1f750f24eee78bc4591bd95507797c52b2487003d08003e1bbb759f795f96c87027ce5f1c2f6f5cab3e7046fd42c009a9099acb0a988679fe93f548df97bf949267c77943019e440fd47d8e7f087cae171febc3f3c0331dafb2f1b96b5158a708117cdb4b53a5b6a3b5a03bcc15fbbb9006c470456d3b429a4be2ea56edfed98368800d1327f498f028fc4f6775a40da5638a60b1ee1736fc211ada915a4cb833f604dad2c7e6fd08cbfe3a858bc61c40c0e21a619a28df2c62e2e425b246d457e6b638aba646c38181c432a45b4377c41341239fea3a2411a833193179e0f4f4c634de1a033228df4b587e8316e130be334429ad50a161e65f19590013cf87d3bf6c62feb7ae0d8a856eb7ac23f8920c999df1ff8f072764496ab3ab869383b0e10c539e15d4ae8d542ff00230feb65885f47e7def9f87cfc375cf7e800f22082822f4309c703f5cfbf02105ef418c18fc821f63722ffc40030110002020103030303040203000300000000010211031021311241511322320420521442617133622330814391b1ffda0008010201013f008dd98a37176495087a5697b89eab76b468c9fe36457b568c43431e91ee2f8bfb1ffd15b9425b93545091032f2636af72124c971a3fb10b95aa5b8c64fe0c8f0b55c8e87a4b820fdac8fc5fd8e8ad173f756991db5ac49f24793141512684316a8471a2e47a64ff001b23c2d191e4743d25c18fe2ff00b17c5fd8f55aafb24a8972b588fe43d9a30c992d1e88ad223109efacff00c6c8ad91477223e47a4b8663f811f88f463d50bec5ce8c97c968c83399324f730b1e92e04218b8172342172b5cbf123c2fb18959d15dc94767445349a62e1fdeb910b5476192f9ad25c1022b764b9316b2e08ea85a262e75c9bc45c2fb24c4da2537b116742638b8dfd9df55a2d1913b69ccc6320882d8918968dec4b8131691173aad66fda2e10b493a4376c7923125f50473275b90dd264e3d517e4a69bd58f45a21e887f1d17c9e9424429224b7316b21117ac5eb1e75caaa288f085c88c8649a8a3a9c98b1a64f1b89f4aef1a28cb0a97dc96b7ac9ecb48fc9e8dd11921e4248c4f5969c16c4c42d173a2465e10b85a2e0c924936cea7393238d51149226ad1f46dad994a8cfabd191d16ab926f48add94645b11bbd26621887f62222d169132ecd6b39540cf27d04236d5b3d2a85a9109eed33d49391f4f3f7f037ed5466e1887f6242121ad23c93e4ee40465e0ee75327c98f818863d51164748f3a40cf7d512b49ab83276e2471da1b945724572cc6fa6dd11cc9496c639dc5190e1fda96c5087a4224d6e2441f22329dc50b6c97c88f03d1e95a2158b8d23ce9066549d17a55c5a32a94191c9b226a4c52a8d344367b99231da8c12f6a27c92da5f6c78d2c646ac4e90d264952662e188c96d9186e2c2dbd893dc87c50cb1fd896fa2d1088f0647c166c291f52ae991488a8b43c68cbb0a5294a28c768e51957bb56f44c521bd54b61489cb6662e0474ab1d26887732f243e3adeac5a2e348e91326948919bfc6639f66449592691871efd4c846caa4642f55f6bd66ea263f88844f98ff647b9321c7de842d23ce89993446554d333b5d038b5b91cd288f3b662f7cf71220da1bb44f72ab5b13fb5f1a64e082f6ad1137ef810ee4a1272e050692450f45aa421691e74465ec2e1118b5b99f34144ea94dab145347a689634608fb8424533d3daccb1a7f62fb65c08cbc2fec8f0b444b7cb123c0e511ce290e498f45a5885c886439188e95368f4f1c0c8d4a0d44942ec50a1692314690885174d8a7665498d0f44597ab4e848ccb81708422bfe4b23c1396e7537b0b85f65e91425ac39d231737fc11a4e92544a2eed34471b6ddd19f1384cdce7471b911549691649322645b68f45f67724e90a6657ba1899113f7b17089f224ed17b2d1ea88b16b0e47e051a5d3b7f245168b271535ba3261947b0e2d6915722ab456594496cc9521ea87a7744f497c90c4231eee656c89f2213fb6c4c5ac0c7bcd10a9751371e9f950e78d79675e3f2d1ea63fc997d5c4c78d3ee87871d727a29711271a7a2dcaa112e09adcedaa1ad1724b4bf7a43108c7fb85c232722e04c6d50c5aad16914d230ab6dbec8871c195b6c6b62b747929ec6fe4ebf6d1d73f2ce62ef9d131b228919953b2f4b2c6f45c8cb23be4d16989ecffb3b195093a453d19c09bd5085c8d908f4e3fe591e4c90df643c5367a1911e8e4f0c78f2774c4a438348b22d31aa7a2232a4376ccd8dbc7f6ee223c93d15fa9a2435ed7fd189ff00fa233ecd5107628c2b73d38793d18fe487863e51e8a5dd0b1a67a22c4741d1439353219d49aba4269c5551bf4da1a979653f2cdd7765cbf21753f034d2b74251fc10abf027c9dd118a6c9a4415c8cb38c6d31d7531228a28a20b73268be62e4449d41ff461ec5a33f240522cea764a4d314db429b4ec865959ea3dc8cdf229b6c7f310b2ca3c1872b94158a56c695129ae290a3075489c2315626a4eab91624f867451962518a09ab2698db49b5c939ce4ddb2e437242948f5247a8c59059093b1220ae4c48464758e461e22593c56c7825d858a4858e43c53be192c73f0c509570c5090b14acf4e446324b829f867ee112316d0447e5b1272e86249c5bea30cda4efb13939c5aadc8c9abb219174d9927b2688c7aa2accd051a31aa44b7251465c55b963d2f4486d9199643962119dd62918f88964f3ff07adfd9d77dd91935fb99eaafc99eaafc8595793d45e4535f90a5fec75ffb21ce5e51cc9e9dd18a37045576254d0f12bfecc708f0648a8c6910c5517e5a218d38a3242f8ec88b6a3bb324fa9a13e077d464393d28793d38f93d18793d1c7e4f4b1f9162c7e4960c7e478a31ee8488c1a4c423ea3fc6cc6486484d17a212d8ad1365b2d90e4a1f28c137d0a852f299d4bc89bfc84d8dda768725c5314ab6485bf61c6d23247a6488b564ab9326e75531cd1d4758e4cb3a9968f6f836f049b7a23ea9fb11822e564e0337a63b23a2148b2f44864043e4c4da88b3ce22ce9ed28a1cf0ff00229e2ed3685fc653dff9a2b27e48ac9f923df5ca26ee456c9a3b1918a3d474b2bfe9ad3ea37491f4eaa3a310e3a5093299453285a4347c989ec49268adf4e97c94cb7e5972f2cea97966193e192f933a9ad8bb44f830bde44e8b686ffe872df49d368c4ea2756945091d28a5a57d8ee880d698693765637dce8fe50f1b88d486f8d8ec5e90b52544d3bd113e052e990e765965fdcd9dc44fe688df469d038316367448e96533713188b1b23c2d63b4452a62c87ad23d67dd21655de28f557e2a87915f1b1d5b919d4912a68513a5a664e19ccb46d1b148a3712d5e88cb2ac8883b8a28518b1638f83a21e0f4e02c701e3c6384058a2c78227a113f4f132e0518d90e348ab688c6354e0c70c4df73d2c75f33d1c7f91e8e2fccf4b17e42c587f23a3058a383f16258ff00064b8e0813e4c8fdaca6e43c73ae078b37847466fc450c9f89593c15917665cff1649cff001629b6ea98b8108cdbe6463b4859288ce9906a4951d2748c6b480c5a677ec21c0cc37d4991674f948e9bad90e3b2d8e9e3da8e9db8428ffaa3a5bec85191d3227249518e5ca2465e05b4917a288e274ee4d50b832ceb825d99d426226af2c991976396c96ccc395a684d3499d70f2872c6fb8fa1f72a3f910af289212fe46676ba0c648fa75dc8b5567a8ac7c2a1644dd14ba79252a31c949df626d2b6472abf164a4946c7272ec43691232bb43da48b1098e629db24cbd89bb63f88c44497f926274c72a6656472353465cb58934cf524ceb67531c9f966294af963cb2f2c59657cb32649766c94e4f9663e112305d093e83b255dc95f41eda5567bb61d75bea315dba26a5d07292e9dec707d07bd2fe8527637b3323d86e9a63fa85f8a17d47f02fa95e079e2fb0b22f03c8ab81e464a7b17b2bd10992de4c71d868c914e98e29326dbc6ac5a22462ee3e4544871463e067d3c1382127438895f63d35e08f0ed0e37d8847a49ee742b384b71c1491254da2f6323d8ca597af5343937a3636d89916290a9c9ff0063e06645b8d5c8c91a8216890cc5dc9165eda633c185563db93d4ae62c5922752ec752f2752f229c5771cd793ae37c9d7113938fb625643272593e4cdc17ba18988ecf46c9f61772c8b2d98f8b3a9704dd199548c6bdc7d4c6e1b0d5084f483e4631ba2d98c5ca1f5461168fd44c5f52bbc10f2e26b78b47ab83c33d6c3f89ebe2fc079b17e07ea61da08fd4f882259a72429cdf76357044a3b991548ca2f9121096af8242dd0c83d16c84bb9915b4657726c82f719e3ed269a64515b0c8ba18f4a2045ab5fd92778d1484868a3a78122b7457252b17078214e0c9f24a1196f687f4fd4f9544e1d1968969119d86f61f2550c83a132ae2850696e4f91c6d3647e48cbf0465e45a495117b97aae08f222173c6a89291b8d97b0a458e5745b485663c539b3f4f15ffc8892518d22723a9b6472b8c919a7d596c6c4438631bf6e8be68c9b0d89ec47813d90e43e591a7017cccdf14641693e0872c5c95b8eec45113e9b235ed2e5de29a2d77c638e17d9a3d3c1e59d181766cac5f832b17e0c5d1db189f8c685d4f96abc23a178334a3549991dec874911dd9917bb586c865eda47fc88c9ba25a63da246892e287cb1cba62297b9136dc11935910e4fdc5a25c8991764484aa49906a49092ecc6aca7f8a3a6474bf28a6df2741d2ab91456f429295ab33d4772eec998f86cc9c96262e06ac96cb4c4bab2a278d13c474d3443e2365ec893dd9908723f813d12268e19cbd262e0891d314ffe3544276e98e8f555d9068c935123956c8525544e6faba62639caa9908bb6f83ea6772ad24420d41d938bb2b713dd09eda642fda62759132725437b149d1551189aa248c9c11e51fb09ad1121a2311f248445107b8cc0df489b94eea895b8b3d9d0f6776634dc0cb19521dc9c7da28374c9465d568c51a8f924b9a32c64a526ca31fd3c9cadf067daa8c921b13dc4df521a32ad91fb482b919ad24465643924a90defae45ed23c97ec2626291293136d9658c5c98bdc712145c8c189c51d24b81e357c114d31f228d58b65ca297ff0067089757369232c233e0862e97b904dec8fab854512de44e3488722e5139a744f7456c2d999771726374cc921e92bb27f162e46ea04e7a21b21be97b8f8d3070257220922125d36b767a8bb9ea43c9d4af93a97790e705dcf5178675bfc589e47c4192974ef27bf644a7293b6c8b4924c6eda6624dc8fab82589b3f7137688adc5c8d6c49b3b10de44e98f9440cb7c9ee3b1b191ec274c957a637b8f61486ac82a18936cad91289f4ebda7ee4470c9a4c4dc5da17d43ef14cf5f13e607a9f4fe18f2e05c459faa8ae208fd5cfc21fd5641e6c8fbb136d8cc508b5724c4a3db1905fc248fac93e8921f25d91425a4d5b3846157224f73b98eacc94e2848bec25d52665747713b831a6895ba231d8688724a3b918522f639547d32d9a1a6a6638a94134df077650d72388a3c8915b336a470d89d331e28d754bff11056b7a45477364bfb3eae3ff1c9925b893122b4915b1856ecc8fdda6232c138223051ee4b9663e6466e08a1458e1b7074af02497629314527b124b4e942c68c6e30b24d36624d410f1a970e992c735b53374b82f71b1b6e90a33ec98b0e47c458be9b2bec2c38e35d4ed89374c9cba63b50ad4a3bd92526e3467578e44d7b98a3b9188a16544955aa198bf7193e5a4383add6e5ee4b7302572b32ad844254c94ec72675b14d91931bb4242d2cb6619dc16c251921a9ae1edfc8dfe504ce9c3f8b1470f68b6275c6247564fe1173fcca6f993655313a2494b6646093ba32e5508dd997ebe3d0d16db6c4b7229086d0c932064f911dc8f23e3467d3a6fa8593149728bc6fba3a61e51d30f28e84382f0858a3e10b0f847457612ff53a5fe23837d99e9bf0c58ddf0cc38bd8a85dc52d8ea4cafe4a7e4aa1f48926c6d223352764f944a718f2c97d425c197d4c9dc7f4cdbe511fa64bb8b0c7c8a105dca8128a7dd0f159e8b3d371dccb7663e082b912b5b14347d238c62ef4436ef93aa5e58a52f2cea97964652f2c529796754bcb14a5e58a4fcb1377c96fc9130f61f2c9732fe85c1fb3ff004fc498c8763218bb9fb91f51f21fdaf4421f725f13318f830fcd13e5e8cc3c33ffc4002f110002010303020601040301010100000000010203112110314112510413202232715230334261142381056224ffda0008010301013f00654621e9ce8b6d78d19ce947f71137ef968845f442dd13d97d0fe42dd0f7fd27ad27f239d26cf0f6e9649327116b7f431eda31e947f7097c9fde898b9d1691dd1538fa25f2421e8b57eabe444125196b328fc06546ff00418de34631149ffb097c9fde885ce89e8b75f654dd12f9216e3e745b7e83d17047e0f599076a6b49edaaf421efad86b1a52fdc24f2f55cfd1c0842dd1537ff0083f90b7f47286b5beaf44455a9b1089a1e29c349eb1dcb3b8f565b1ac8651f912ddeb0d9e9d0eda455a489d9bdf83916eb55fa0c5b88fe02113d89bf6416932da43718f5e0e3468969471225b8f486cca71e59258231561c58db4ee5eed0b742d16afd2cfe4225f0108995336fad27a5b2437192f5326c4525ee25f263d292b89166d91a63832786d117916ebd52f4b3f9089fc23ac9927d52d27a72477d1a122c73a3b12631147727f21e94a3681188d5873b14ea64f12ad36f4a6ee26310f47c7a5896588aafdb1fad1659284854f49ad18b462486b032e318f4a3cb25f267024dc92211d90e368926ee49bb90959a3c559e517c9473aad5fa59117055d9694de495ac4c44ce7442d5b25abd1ee52f8cbe86b3a5185e68846d230d3639fbecd58ab1d991a71e9c95a0fa057bd8a23f42f53222e0abc0f629122af02263dc7a2d10c7a318c7b942ce121bcb2c51769a316b9e638b3a949ec4b74892bb4ae3a578bc9569f4c9fd94b0d12fd29b222e3ecabba1a292195dec2d8931efa71a702d1eb2dc63dca184cb65888e1a65369c470c9071dac3a7795d491357ca7945294af92b47dcc82561edfa2f6242c11cb455f91729b2a55b22a49cac2d87b9c8ce355a71a723dc6328ed2391cb244a37499d6ee4e552395668559f312096e28c526c9ab9b3c0b31f55bd0e37674905ee456f9e9d438b95c970446b23dfd2b463d243dc914b690f4a651f9156934ee86da135d8576c93c58a93b314b28824c68b68d7a9694fe655f9bd194fe353e89f0243dc7beab45abd18c651d98f77a526527c90ad17864a8c27b0bc345724d4611c172693146cd1125fa2b4a5f22a3bcdfd97d29fed5464f813561b43ddeab5e347a7231943690f7639c4a34a4ddf6434a31c0e4d33cc78cb23525dc949b5a36362ab920ee8685e8b162d8d68ac92f93fbd1ec2c50915372d212932cd37aad17a65865f049a235dc532736d6e50b2926ed73ada439b63d20ae4b49b77146e870b22931ad79f55f0517890f77a31bb51ff00a4fe42582c4be4c7a2f5cb744f04a424dbc934415b2539a922c8b694ed61bce9289063d8a7b92dbf46c53568cb56497fae0896e2d25f2f45bd2f7195257917e4bcaf71ce4f83cc9f6235a4b82159496e295f484f565ac5db4437381faeda4314e5ab2ae1410f711c9259f45b5b3d1951d913bf49d3b22cf648509b7c23a2a7647454ec85d51c38b3cc90aacc55df2529f54463c22f747243123f88f45ea6256a4c5a728adbc3e87b91d9e92dff0042c32abbc922aec90eea68a73c8a5765f72fb175931d854fdd7b9d10294ad3e9e346851b12766472d107ed1e8bd5c92fdad794575692fad2037925aa4878f4c96071ce493ea9fd095e65dc656235628f3a0cf36029c06e3867526cb22ee32b9195d27fd68c946f222ac88555e65af8d71ab25b11d91627fb512c317ce257f97fc2c4160687d4c6e69eccea7d98a4fb33a9f61bb2b9d6758a45db2714e392a51696050924decc6df5677134752ec7547b09c47d2269eccbbfc8df929fc57d6939348836d9524941b28c2729dd7712b25e8be9264444ff006e3a320af52257f94b4a63256d2e84591d29a1c11e5abac0e11438135818a0995a85352b9049f084936f089451d111c22d3b118df1c8e0f962a6fb94658b5c4d32acddec418d2961ecca34a108d924350b702513a6079703cb89e5a2548d8455f847eb4651cd5895f3290910a963cd88e711ce229c1add09c7ba2f1ee8ea490a7115480e716292b956c320788527d453ea1395b2393ba561bc1ed48b24c95ac36922151c5b2854726c9b4d8b045b6914a77561a10b7d118305482e04b256da3f5a33c3aff6a2a6f2fb2c4699d2fb23fe21dbf1474fff0028b2fc4b67e25bff00931f8985fc4f67662e8ecc9dba50c8956769ca2f042cb668571dfa893b230d2243b2dc925862a7d5fd64a50504c7c8add252dc43a935c1e64bb1e74fb1e754ec79d53b0ebd4ec46bcff11546f74c6f28a93526acf8d1ec787f993121087e87a60b16459150653dcf1692a8ee3b70cb4b890fcc475ccf31f63cdb0eb27c1e7f16233b2d8a72ea8b249a4479452c31c6e8e96749d3f67496658b3eec4e5dd97977146da33c32f748ab656212127a31fa2dad98932a0ca478c4bcc47910921d29444aa3d8e9a8bf8977cc0bc7f16370fc5978f62ed32188a13cb4ce594d2c17b257fd4650da4567942d6ffa28aac4523c74329909b8b14aeb259c5e0534cba2d12d0ec8e98764568e535b115ec89d09e4e9b329ee55d911dd0d195e8b7a1446524d459555e425fa36458b08abb88a5b33c6b8a8a5c976758aac64acf02e9c65097765b3865b1867f65469c73828caf112c9221c18944b59fe9b21fb6fec9dae58b7a122c24388a2ce93a4512aeef4a7889e265d553e8f2d34794792ae8745df0d8e93e24cf2df123cbc6f93cb56dd95292713c3c9a6d1d45ee8a6c80ff4b232947d8545ee661129cd3791d5a9dcf367f91e754ee79d51722af5455ea0fc44d0bc4cd9fe4cd1fe54bb14fc439bb153710df4c1b2726e4d9d7342a93b9e74efb1e6d4ec3ab3ec79b57b23cca875d4ee5e7f994fe5b1221b14d651176dceba5dc53a5f90dd2fccbd3fc91ecfc909537fcd0e14f89a3a61f921d3c5eeb5653c5344f73a2e4e0a51269c5e51d45f45a4b088ecc969457b8a9b912a2bd3689519f0cb5445e7f88a53bec294fb1d53ec37367bec5a6cf2e6ca34e57dca91b599128b374c695b494c533ab041b666e8853beec8259458b0c8bf622484b0415d1568f5138b8cac8509f6628cfb0bafb0a53ec4dcadb116cbbeda514fa8a9b913c5d4718c52e45256bdc53f797c0a596ac5df5ff44dec3bf4e05b648a699b72539da5926ef0c1029a698b91a24b238dc8d33a111490965115644777f43df4647e286848a7b128fb4843fd8ee38a3a51d2bb0a2bb22708f642a71ec8f2e3f8a2308fe28e88db08abb91dcf1505243a78145dce99a88baba8f75d1352b9693428bb2c8a2eef2746e538754c70c095a488ee415db47f8ef9931f87fed8fc3ff62a0d72794c549df7144488f273a322b0be8be511b14dee5cc2932c58b6934245b24791bc15081e26a38d4cec2ab4c8b8b95ee86d77236bb2576d3ba2566b738dd11718def23aa2a5b8eb4110af18cb0883ea8a63594256451f90d607e84b45b90581ac8ce4b5909e57d9145365d242779635622622c45162aac91dcaf352aac7089e5f6933a656dce89f71c2a773a25f91d13ee794cf2bfb2d18c84e17c2283bc051571e2250f912db4b6b62c2dc5f1d1a12ca27c1677219452778137ec294f3a3d64b3a216959659b5c767565f67969f2c745ae45195f079750f2aaf71d1a9dcf26af747f8d37bc8ff19dace446842335c928416c91424d36884ae87989e1fe44960486862dcb0842d84485b92cb637c14be251f813f894dda445dec3b0f46b1a445a56cb64961967e6b22ddf037864656772e756e4a594852b44eaca3a9f3dc7773434e5722dc6a14961939b8f0c878ae8cf494ea799494857d25b8847221eda3117cb1c95c83c0a4d3487b14be4c80f443db442d2a6ec91595a5948838dcb2c9049cb274e531c4b2230b0d2ba64ba5a2a55846d63cf6ff8b28c139a6c84704d23c85515b928d2f2e92896d2586217c90ce04ef1121886b2c51c8b644aeaa447f17f452dd90631a10cb8991d2a3c932bc6e8b2ee59fe4c529ad8552a9d755f286ea7e45ea7e47bff00224bbcd92e956b0a53c5a25084af1ba495872b222eeca4b28e0e7496e212c8ce191c23818b7257e08b38474de487176238910b68d887a22232a7c89128dca9432da62a737b32d562754cb54146a0a3368f2e77dc749add8e9c62ae5278e11465788eeca6886e7033839d22324ed06c8cdb4290df6161895cb64e114c7b0fe6434645e96111d2aab3267173c4492764527c5ccdb733d7b13bb8e0ca442eb035ee4ee4ecd129e2c914e2da2947a6086ac910b1192934d773843d85b6b05a4fe25342561dd1077622d924f629b24c97c88f1a31210de04474acae8a88493a678ba77b4914e0dbc0e3249e4bcba90d4ac38ff7c1187f6c945292c938a4858488d68a6914dc65156ec49a2a57828349e4ff00cf93945dce0b1625b32324c83c8f727b3290d12d8a7b9c69329fc89224bde406316a888cab8270c5ceb508bb956bc1ab10947ba13df286bde3b356ba14a0959c910a904d929d36ee4abc1a255652c09a4f09b651af28b2ad7ea5688d9ff992f7491c222f71a24bdaca71716c8dd48fe43e486064d60a685a4f729fc86495e646258e92c3c310911d2bbca25f07f4569cdcde792d8cec747691d13e2428d4ee744fb9e53eecf2e3dce882e46a9ae449c9a4960842318925793b0912b248ff00ce7255927c8d608ab31b437862223f913c216c2d89949abd84d6c5d5d93dca6b2868fe6258d2c22644d8be44cf11bc49660fe8aaff00d925fd964cf26fb33c9a8b662a758546bbdd8bc24b99b3fc48fe4cff001290bc3d25c13514b085b1524d3c345df721996727847ffe980f6d18d9c90d87b953616c84556d2284df53b8e6ee47744dd8a4b4946d34c8b16b322f03bb16e26ee7897b314938ff00c2bde356774f73b3149919919dd0e76687276793af31b9795e466490d5d649d47b448d3727b91a69b79d8e950583c1c65e7c245f08b9265f48eda557b11ca2c555828ca4a721c9b21b15364511926af9149313fecb37c99449dc8def615d1d4d0e722aa94d22174b254e9949e10db4da22e3712bbdc51c604b19128c5b77252a774db43af4d2b3687e260b6255a72d8576ec8c4236e4849df099272bde57b146b5aac12ee297b57d171b1ccf7320ddb25f28abc14f6113c95128c5b45257a71b90563c475e3a4a52c8d9249a230b3792295c50438128a12c8d8cb161c5156974d46d32a42a424db4da138b23fd3629d45c8e753f233cc99edeecf6763aa2b6428ce5b2230f2f71a528c9f629a495db4534aacfa12b947ff326aaa7b21ab24b46c688a6258122a7041e06c96ccf11f0297c2084576934385452ca6352e548f77f65e4bb89df96293fc99e64bf363a8f96c5517e4752fccea4bf99e647f2479abf3479abf22bf89b5469a213538dca90a6e76dae3f0ed7c64385488a95462a127c9e525249b1d38455ce9828dec4258e1151a6d242a3524ed1d887806daea932842951da22f1114875db7b0eacfb0e751f02732351add31574b867f9097046b29bcab10d89151da255ca8fd90c25f42678b5272567a4b612564597645976434bb1d31ec8715d91d31ec8718f6438aec87156d9092ec8b2ec57f9c8a3b7fd27fb9ff45b22afc487c514ff00912f992f8153f6d1c3fa23bc4f0e2169ce8b463dc447e45327b95be04bf810d91c32aee8ffc40045100001030105050506030702060300030001000203110410122131132232415105142061712330334252815362721524344391a1c140b14482a2d1e1f06392f17393a3ffda0008010100013f02b8a6718f08f13b428530a651139ae6b9a76a823752e1a0f446e08e8a5f88cf52a0e13eabadef156ae974e7da9fd0b978ce89ff00c431311435b8e87d143f099e9fea494fe077a2b1fc651e87d7c214b9432fe82983745d544e499c63ddbb42b46a69cd15cd73475411bce88683d11b823a293e233d4a846e2379d172174dfc5d3ff8fdc3b44ff8c101a5cdd6e7f03fd145f099e9fea5e9eec8fa2b00ac899c3e2b565649cfe5517c36dd5b99f1023a2085c3c02e37008ebe06de13b4fb28cee353ae08a9b8e3f52a3e046e3e097f8d3fa02cd37c4744ef8c9bcae6dd2fc37fe951fc367e9ff52f19296adafa2ecde3299c217546e082b7e5629bd146ddc6dc42a6499c61142f1e13751532b8228a6dc744114ce108ae77ce3dac7f751f05c2fe657252e56b753e90986a80f11d11f8a9b70d6e9be13fd13785be9eef9a3ef4ab6e51bcf92ecd1994de1171b85dda67f7177990a26fb36df500207785e3c43c0eb8276a8a6dce42ee9e8b97826f8d1fdd45f0feeba780eb73bf8b77fca8648789dc2bf9a82e486b74ff0009fe88708f015cbc67dd0bcaed0f82e5d9dc2ef44dd05c6e082ed63fbb307e75137d9b6e28a6f18435410f73c914355cd3b9229b71bfa7a780a97f88628b83c011e254d17fc53ffe5410f13b857f38fa20b926a3a2b49a42ef45cbde1f73caee7715da3f095807b377a21a78020bb63e1c23f3a8a9b36dd4c9510e20b9dd5ce8b9f84780aa5cee570b8eb739534f4f0152ff0010cf4517c35c9054411d564bfe2dfea1043c3cd1d10f8eefb26ae49975a47b177bc1ef05c5769fc26faab10f627c2105dac77acc3cca634e1082e577cc10f0735cee3e137b9d9d10bf9dc421a37d3c0e52fc78d33802ea85c1119a3a2ff8c77a8b82e57f2b9da26fc793ec82e486b75a7e11fb78797fa128de5769f047eaacbf07fa789abb4ff88b38f251b771a85ff30f7a6a8dcee481c90bb9de346fa5e744549fc433d147c0d54d50b823c9143f8e77eab85e5ec1ab821233ea173f41eaa3f8b37d9022ab921add681ecfee174f01ff0042795c2e72ed339c615947b1fb85cbc2d56f35b7c43f2268dd1e01c43c47c3cee28955a009c8689a6ef9af6e82f373ff00891e8a3f86dbb9a2823a2e4853bd1fd7769556ced9de2c83ff00b236ab449c52b96ba955515ae688eec8545dad5a0959f70a07b5ef7b81e6b9ae486b74fc2dfd43c27fd18b9cbb47e2b3d159be10f555caf37056acfb4c7a0f08e31e1e88a255725cee3aa1a669eb927f023c9720a3bb9dc147c23c053bf89fb267c26fa2e4baae682e48e8995ef67f51bbb6ad6e14b3b3d5cb44d722ea05890598d1452b9a6ad342acb6f6bc86bf2370d6e9f48c7e71e13773ff00422e7ab79f6cdf4507c365c07802767dacef0fcedf5f13f45aae481f03f54e396a8f0a76a8e8132f28151f0ae57bf44ffe2545f0d9e977543c119fdebfe62add6d65959f98e814b2be591cf79ccdc354e088b9ae447309a6aac56cfe5c9f642e9bf95fabc27c7cbde0453d5b3e2ff4508dc6f8828863ed498fe6551e0f9dbeb7bcd132bccdcf4151731785aa76a9c72a2723a04df0051e885ef4eced5f650fc36ddc972c950855453ad2d8667c8ee4f729e77cf2991fa9b80aa1194227744f81dd1614324dcc51375bac368da0c27885d2eb0fa9f09f7e50bda8a72b57f11ff328f46fa789a5588fb7b43babca3af83e76faf89f75574bea10371a277123a0f0f5f44cd3c1223fc5fd945c22f6dc7552b835a4ab5cbb495fea6e0145154a8acc10b3b3a27c0d228a4b2669f0168510475414723a378702a2787b5aeea149c70fdfdc9f7bcd734d46e9ff0089ff00993070fa5c7c0356ab03be33bff90a71793a780718bc208a7697f44173545f755b9faae48a1a5fc8fa21fe3c0f47f8afb28b85a89e6ba2673f5554576acc1b061ae64a3746caab3c498c5856145814d1d414e181c7d5390bbb365d6329df162f42a992087ba3ee7995cdc8275ceced3f7299a2e68de14af6c62a4f22bb34b3bab8b8e84929fda53179c2d14f07cc2eae770451d2fe977358d62385b44104fd572450d2fe4ef4b85eee247f8afb286b85a8f0fd97fd90e1451aaed4931da9ff00972b982a559a0ae6a36510415116a7b55ad94795e499cc2d146fc1235c162c52c5fa4f84ff00a42baa1fc4a8ef28ba954c7e6bb466ce21d354c91cd63a3f359f8398f55c951350451bf9df4154ff00950e4814504e4dd2fe4ef45cd0bdfc417fc59509dd1e88e8894de1b9efa34a95d8a471f3bac96624622a160685440202f7ab7b6a0ae61019ddc8ab14989edf265c2f3fe89b79d0a8ff008951687d6f768a54d342ad9f2f8be617510411ba8a8b9df535c9a9d9009a6a134ef2ad0d2e37045723e029d9d130d6d12faab3f037d13b308a6115736ba15b4a9a2b6da03223d4dd678b69200890c6e41345b1ff0033581086d4dcdb38285b1f11c33c7f70a3918f1569bdcd56d8f76abe9fe89c286e2bb349dabfc9a9ba7885c7def54cbdfc2541fc4151687d6f768a54d56baed07a5d5f0731eb78d7c46f1aa913721a5165882771788e8ef01e681a95167349ea5479347e908a2886f44eeabb51c70345d60650172039a3301aa64954f2d70a15137064d4d7274a1a9d6f3ca2254f6c90b4d6cce40d4ffcc9d9a0e4ed558df82d6df3c930f242e3fe8423a14cbe5f84ff004564f8cef551f00b827a95355b3e20f4544d6d45c2e3c90bb9fb91adc4553b8823c68a1aa1a5eef9bd10be43914ce2567f8f27a94ce01e88ebf74555541c95ba22e270fca345855907b308b7753e17ba4cf87a29dad65a3108de63c3c947148606c99fdf50aa7104c392908aac46b9296573066a4359094082d09c334736aad1ed779a6e742821fe8f926a28a9be0bfd15878dc533805f2295355b7e37d85d67b31742c38bc050bb98f7235479dc732be74744354dd2f7e8ef44dbaa9e9aa0fe225f529bc2111983e771e6b9a8f7ed53798568836668ac8375a9ad4f841cc6450128e8802b0a1c2a9aab6c60085ccc6ededfa2699a4db3da4868f95cb154a6944ae7ea9e158df8a088f9510f72e55f76d46eb57c072ecf1c450e117725229933882b5e7687dd6403bb45e9e0287bb1aa2851735f3a2b9a6e97c9c2ef4434b8a70439faa66eda1fea9b9b5a8eab34e4e75159c8ef4ad94d9c9d559384262c2b02750219a770a0a48dff00294f63ddf2a9ecb84129aaa89cd3f30bb29f584b7a1f745545e55110a979beb75acfb15d9e3d9bd72bdea54cc9c15a5d49643e681ab6aac9666bacf1924e9e07689ba23e3e77f35c8a6ae6be728a082adcfe13e88697724ed0aea88fde9de899c0c5cd1454c7716d4c72b5ff004956b20d98bb50559f20130e4b1d02748e76898e0788e6a3a278c934e1d50a14630ad2cdd28e4f37395725d9aec064410b8f89ca9e1285c5cab77246eb66512b00f607c0f52041875569de90f994fb1bdb67c634a66ac807768bd10be4d0a6f0845042ee5e2fb22168aabe729e50434bde771de89ba5e75538a15ada4fa28fe1b3d1734f375ab20df5520dd1f7515a9cc88c2e269c94437026958b13a84e4b768a5b3c7272cd304903b43853e69dff000d9fd53448f0310a289d425aaaad4774a91e36c4206a8a05587e2b9be4a0755b9ea87b8778a97e15538a8b9a7688e6b30ad6fac54561f81e07a70cd3451ab63fbd81f4b3fdd4acfdd70f542c8e68004cea217c9c2537847a2768857240dc2fe77d575cd05d17ce9f7311ba4e077a26e82f7712b4e8df543f883e899c2d5cd3d50eb42ad7ac6a6c805272567cd8135aa785c5a70ba8415059677804ce7d16c2d0cad1d8b3d1629064634670df94a65a23773cd4c70b83c7a141f92b74b92756a4f9a6beb9aad511d158dded9a53281e7cd0f07cde022ea7b8371e14ebadbc0158fe0b47808585722a018a795de815a06518fcc2e17bf429bc2df447c03c00d6e25b5cc2af2a276413137893ae61bdfc2ef44cd11413b5568e16faa02b683fa5346e0b8e8f752b84550b6bf6b0e19b162347355ac60988f9436aa47f33d53d767cb8a2626a28558e4d97a841cd28ba3f256c8192398e8f23cca644e030b9d544502ed17e06faa2495a219e6aaa17524098776277b9afb928ddc93c20d5da3f2ab30a471f8a951450170b748cae55536b1fadc2f7e89bc0df447c03c14a5dcd109c9a9bc4538e6801e0770bbd133447926eae4ea554dc09b5ef0efd29bc03d2ecf1211591926d043beada6a6bf51a2938ca2325d9f216e21e6a29325cd61aa156e8b19fa5104f2a20d5452100555ba7db4c69a0b88c9313934ab2cd58687ec81b8fb928784a7217141768ead5671bacf1056438bb4253e6549f1635442f7e853381be978f71cee726a1c653c67784e4785de8a1356a2744d4f4ed10fe29ff00a503bad5cfec8a733e6ae6ad7f27aaf9ca9451585b51228a42dc9473550ba97129f28017685babb8d3734669a2a1511cda82b03b32ceaa176ed0ea1047c35f01f1bd0f05bfe28fb28346fa7899aab0676a98faa3f19be970bdfa28fe1b7d2f1ee39a28e970a54a7841510b8e8ef42a1479209daa721fc54bfa50e162e68a72b634d03ba14fdd9bc8a9c6e5576633d9b8f9a921e6102464a1b5e1c9e9b698cfcc16352da2360cca7da8956bb53a86f6a8dd42aabadd6776191a7cd308c9c10f10f772265dceeb67f12143fe3c06ed2a7c97658a990afe7fdae1714e519f66df4bc5c3c66faa7e885dcee768ef42a04792173ce5a2ff008997f4aa64cf4b82729c02d213998860f98689cec519eb4cd767330d9d8b0292046270541cc2c6efadcb3e88b5c55af502f1736ee69870b8156792835c9027fd0c9aa6782d19dafeea3ff0878643ecdffa4aec91b8e4cf8f25cdbca8be1b6e087bb3aaa235a785fa3bf49515e51d17fc54be8b937d10ba4251693995688c7cbaa103a43bc29fe540da3404022d5816c9bd11859d118c744e60a2b67c737b6e6dd85358acb29824a1e1428cfd27fb2ad421efdfaa67824ced7f75173f15a4d2cf37e95d963d828b8e5f5b83957cd7dd12a03ec8209b7043c7d556a8eabaa011d50be5e07fe951e9773453b44cfe29eba7a2053a563066b74b43abcd4cfe4dcd6c9ced508d4610bb0aa22110a6c9a54eec52bca1735019142e8da0d6ab16f1e8800ed559a5a7b3720700a72ff40fe24cbf9aff008a51f3f0856ecac92fa2ecefe182b3ff0030fe6b8d165459dd09dc02e6f84aa788e680c97245045052f03ff4a8f4bca7027cd3209e37c924ada0ea9b6db3904890506a8f6945f2664e4ad16b96331b9c1be4ac6e92d189d20d4e5d10880458b0a03c2512bb42d01acc23528eb704c1bcb95c3445fc85c0908e785c142ec6da730987e5fe9773f7a78937546eae6a2ced2a3d0fade6e0bb4c9eeb97322aac59595aacdf0fee6ec0b668841aa068d9fdee6ae7e1ebe1aa23355de373b44db829781ffa53345555cd32224e6b64da8cb45da6f636c6ff0055035f2ce3061c5e7a2b258763b4333463d5ae4fb135ec7121bb42dc944d7d8ad7135ef06b910395f454b85ee0a77e16953b8b9e4f8234dcc84e35c5ea9a55734d439a692a3388e21cd039b7c02f3cbc6513bc82aaaa275567fe213387ef7146e0bb58feeedfd6a0cacadfd2acff0009b70ba9741c3f7b87b9248416315a5df35c5334be5f86ff00d25378512a389c0f9d16833569b6d31359e69f88d9fbc9a3867ba5765607c72521deeaad1017c25a5ff751b2511610fde015be7844d0fb2a967128a5649187b0d42adcdb85ee56e9374a94dc10d534d014de5e8be53eb7b103bc1300c60722856093c8a666e61f2bb9dc3dd15f35c6b73f477a2b27c729bc22feb705daa77611f991ddb37fc8a114899e970bce8a1397dd0f1f55cae7141d559e3555f3dedbe5f8527e92a3d143154e228e42aad76d2e7068e1ad3d6a9900b33a6936a0d23e156f9e7922871c381bad468552d30061c4e607e89b3b27c4ec4fc2dc8741e6a7b7be46422177b5ad0d148267cc44b5c7e6bb3276b1e633903feeb0ac2a881f03f42ada734fccf858550613e6b5cee621a2670d7a1053c09013d42b338e1683773f78e5f3a6b510b0a985227ab17c47a6e83c3c9768e73d9c29b280fa26708f09d141a1f5f00f0f2b9c8055dfb8711bc5f2fc293f495037128c9234a2b7caeca36d6a7a26e2b3d98196ce0bcc94010845ae4b43e48dec39515b9bb4b3606678751e49b1cf336bbc435363b643640ef969c1ea9f669e16b1e5b4ae8a58a769697835729239b68d6b9b471d1766db6438a19b56fcd7516142f785da0de69e3c0324103b83d504450a684144740b4650287534e450f7ae4d19a17dab281eac3ab8a1cbc56dcedb08f25693ecc0f34153c074567d1debeecf3435406fa15aacfc53fc293f4ab03291d69aa751919f20a28dd6897681ed1848256ca6925c6eb46eb65c9aad5683044251bd9e8a1b4626da2d18681c577889900703881d1a3546d71611871bda35fcaa4b5c556d5f8bf30d027cec32b186405fca9a27bc19dbc1b46fcaa39585f36cc0269bca3b438346840e7c9472b64195c557adce5da0dab14da8f4f085caed426e4828d35c412d3aab3b683543deb9350bed9f04faab0e8e43c53e7da63ca8ad5a463f35d5f01d159f477aa1e0e7e0e5773aaa858862ba885c2fc38f77aa6868d3a2b73cb61cb52a3742db2dadf53539156592cf6682326b85e3fba738c933d98f7092acb648636099d2e36fd3f990ee70bb6d1b6a5ff2f442d4c6e51c40339b799425829b3d90111d7aa0db160d88651a747f9aeef6178c15230e78faa2eb1c9ac6e046429cc2ee0d7134970d9ce787cd774b59754c94c1947f9bd501da380cc5d4757e1f9289d6f2d8f161defec8bcba43136d03181a514330739d1190191a8db435e18627623a515aed9b68646b217547179298d4034f0f242ee86e6a61de4e39b54750d09b5e778f74e4d42fb69f643d558780f8c9af6938fe6536663f5baa85e74567f9ef3a21e11a5c57d91342b9955d7c50b3e63cd3181a74f45da85f80014cd4f21164606d9b394508d3356cdab6cf04720150b6262920ae78c654f350f67c8295cbcd47d9c31564cd77687e8e7546c90f20bf67b3ea3e68f67b7eafff0050b0c23a952d80807067e4539968a6fe23839f447bc1763756a39f20ab687c9ceaecbc93ac8f89ed7822bcc7928207626b9986a09af542d1858053da0c8b9dc91b58f96303ebf356ec1b43859841f97c2d4423d6ee49a735a669871d0a621ef5c85c2eb77c1fbab10f65e3877adef3f98a94ef463cd054f342f3a2b3eafb8955dd43c3cae3adcee25ccaf98ad156e2b5c9066f0cb202eb7bddb56804eed0d15a05aa5b536332868003e8bb42929635a37c6be8a0b14a2dcc61d1bbd5f2bda6aaa2a022682a81a8aa0e06be4b16f017502c82b6b64dbbcd2a392ecf63f6f880a313a089cea96a104405308d15b3b36191848c8a95858e20f801554d3a8b9bc2ba2e4a07115f2506f0050bc788f81c9a85f6f3ec805641ec9be3b10c53bff5278f6d17a5d543c106af5c93820878c9cd028d6a8dc754156eb38ab89e89af269bb74d1b2d36b2cc74ded7d15aa585b6d830d5ce6eebd5b6d18668fd91c5423faa8dc0b63fa8b68998b08c5aa04e271e5c930d5a110ee2a675c93dd85a554e1cb54d6906ab1efd39513c9a65cd33454ae2074470d40a2650b721731d885513883c5176ac5826d395f5411cae62c3429c113928c96baaacc0860aa1ee4f81e9a85c57681c9a3c959be1b2f37b8d18ef42bb2f8ca3fc40fd37510f045c4ff00d1677555572b8eb7940d6a8eb715894356eed33e68345495699047138ff00456610c8f7bdd5ac59d028257c9697cd1c2446f1993d576a329b3958ead0ab34e659a07d281c0a63bdbc8daa11014a7241b4af9dd8456a8000505db36d00e86ed1305093d548091975468023bcdc8a68c35e8849be6a775dc2bb52c85ee7bebf2643c152ab733fd91cd4850d0a8a99fa2b1bf1c2cea35f7d22085c57681df6fa0507c3678a7348253f94aeca1aa19ceef4f1c5c6ef00bcdc34b9cb092b2f3b81d5677e32ccc37111c959ad90ce74c2fe86eed198e8df34e9bbbd8e29238055f91aab3b1f678a931073ad072aaed07d9a497142ef50bb2a58637b46238ddfd919628eaf34aaefd1695cd7ed0e8dd392fda07e9fb2fda2740daf9afda1f97efca8bf68374c3ff6a754db7c4486f3aa6db207537b33c93658dc010e19a7c8c637138e4a4b75a1f29dfa66bb3ed6e9f1c72677e11d14ccc6d5688f6729171bc142828b1648baa9b5702131928d9968a93a2b04926de66c9c5a9f7d272410bedff15aa2e16fa78ad869659bf4aec91914cf8b29bc7803c324cf4216da3fac2dac67e60b68cfac21233ea08c8dfa9621d556e1a5c4e6b7a88eba22735546f3545a1cf6f5ea992cad6d0e7e6a365a5f686bc0d1fbd5c95a9af9ed6e81f35198710015a6d0eb2c552cc4345b08df6695ce0c697671e79a8acb0c4e18eb8b0e369ff09b1da2d58a4a06d5bba859218cb1cf9773470fccb6761dfb3b9f9eb896d3b3e4687114d91c8754f7d81d86d275fa13bb8022d45fbaef95777b231db47cbecddc2de4858a363ced26dc764c09960943e4c72003e53cd4364b5564ae16f4f350c33cd883cb9801a005773978766da72c47342cf2401b20a348d1a9dda2e60151aa93b42719685dcb9aeff307e0e7ad39fa27769cd4c3965cd4f2ba47d4dc50a2c2835066e11704c6920807ecac9b20e2e1c9b403cd3dc6cecf84ec5f365fdeaa2903d8d70e63debf882085f6cced0cf5518e1f4f17689fdcdff65d94370a66b27ea4d370d5551b9e80541d1601d1606f45b36f45b26f45b20b65e656cbf33bfaad99faddfd510f1fcc72f6bf88e4edafe239629bf11639febfecb6d3fd43fa2db5a3ea0b6f38fa51b54ff4b559a47c8f38a89a9d1e204548af451d8a288e2c3577d4735da32cec3b324163826b5d1ece421c1bc8845d6796cb218da5cee6e72632d4f6fc4c3a53d42ee91e1971125bfec7aa36783d8c6e68fca84713ad24d1bb468514509964918d6e3e6a1b359c17bdacad797451d8ace03eb578e5f9421616169da48e7fd27e95dd277b7db5a336f0516cedd20c6f968f670b7aa936f68a3a476c88e01ff74f8ad121c724d491bc34d159b685ef92775486f08d0236d67fc459e8758fcd1b68a8dbc1ed9bc03d577d65716c3f7ae1c29f6cb3d0be383dbbb56f456874464263191e5d1380e573551459b4d5688eb554cd58a232ca00a75a9565b3087da9270bb9ab460968d0f716f3f34c000a014087bb251e2410bb9a9f3b584ce5e9e2ed43fbb01f99766e51280711fcc8f5b85e6ea2a201515151515100a89c884e1e48dd4540a89c15978ca6a174d668666d1ecaab4f664a620c8a6dc1a34a63a4b3e186565062ad7aa7768d010c6f4523ed2fb34929928c7e63fec8cb6825b36f65902a2368aba46bb33fdd433cd1e2c04d5ca1b64d036400eaa036e8d8e6531626e20e50f693d9677308abb928bb4e96621c37d47da51f7538b8d436f85f055dc54cd413d6ca4ecc9fb2b2db31370d28471291f16da36388c5cbc9638cdab0120be997926ba33697372c606bcd3364e9a5c340f1ab94d85ee7e1fba2376ee6826b7985f3276450a114562748c7bb036ae2da7a27ba4d861cb2013649bf2adacdf9509a7e8d5b59ba356d65fa42dacbf485b597e90b6d27d216d9ff0040feab6b27d1fdd6d9ff0047f75b677d1fdd6dddf42da9fa103541379ddcd3b3b57dd335371f076b7c3887e6561ca050f07dd15543c1454ba88054f11b8ae88f24745adce565e329be090e4bb40e2706a0c619305337d003d1476166c70b81a378abe4b6afd9ecebb95ad155b46bf150744c9dcc9b6aca02a0b2bed8db44b5cea8b3f762d64c7011badf9abd13ecfb09e364fa6aea231b5f339b11dde44f45b38dcda3388663cd7668b313bcc264c49d51cbfc51768b70ecde0d1cea83e6a9311b7ce80f128c48f931e2a7e6559192935389112c4ecc16921085a61c6d7e638c221614466a34324f1cd3968e56670c4a4787310f052eceea2a2a2a0440b9885c51d4267f1099c4ef176a6b00565ca00a2f862fe6555735ceeaaaac4b12c4b12aaade6e3445649da5e559f8d310be52a56ed36fd6ad6856582ced2e79df70753d1436a8e473c1340d3fd5769c72be78b0b3270dd00296c31b60381d8a5671aecd8aae7bdd18318d6a991c706718a30eaa36c2c9257e115aab7767995e6774a1997355c26a0e9cd3e5a70b6848cfff000bb3bbc189ec8c0cce4ee8a5648da00c2f34ce868831f34d68dbb29b38f26f458dfb3d9d4e1ad68a338da1ba16ff00752bc1a01f2f35139d3da61121c5c94f666420b0c648f90ff829f19191423cd3b88a6aad5b7109e159dd85e13dc63cb97229843803e2273456775538f818e4114467f65067684cf9bd6e3e0ed2f8d0851e500f4517c36fa5eead4dd9aab96372ab950f546a154ac456258d6341e16208b962592353a5f4b8a838d350b8a9ce453de714c06b882ecd99b0cef6bab8dfc2847134bea0115de5da1689a29e20d76eb331e69f6c819197c3f124e5f4aecb9e59237c3ff527c3414123aa792b243332bbe33d13b3326df937ecac90598ba57e2da0668d56a1de6ca26a06b9a7fa856326c8d6b5fa935cbcd19a8da346bcca8a0863b44bbc3780242ed40f742d731a3057a66acf64661da5a0d1a72685359a48e6d9d2bf49f2510601b39437153895a2d01985ae39877f55843def738e94a04f6d0b8a3aa6262392d734fe63c934e55e8b6a0b7c8ab2cb4761afb9a2a221515152e6b95538ee9fd2ac9f19334b8f82dd9dae3fd2bf91f64ce117ec1df885776765ed0aeeeffc42bbbcb5f88577793f117777fe22eef27e2a304df88b653fd68b2d1d42c169f254b4f40bf78fa021de3e80b14ff84b1cd9fb35b59fe95de25fa177978fe5aef27f09779ffe23fd57791f86efeabbcc7f43d77867d2f566787bcd2a9885c55a742807e195ede6fa20f68931d736d08f34cb546202fcf7aa1fe64ad9481b192281fa1458c76e814214524f1e231b9c3ad1416ec16585c46395f928a4cf6128c2fd5aad7da4278df1ba2cf9150492472b5ccd55aed32ccfa38616b746aece6b5ec8b1386a7d429e68e16e19cee9d15936335ae7ac98c6114aaed39a78f0401dbb4e2eaa2b5c0f85bb7e28f4fccbbe4f25a58e1d681be4b030ef49bc4fcaa7b230b9e682a1b55031ae89f23681c0d7ff0009d29735c57551ff0085cd3d33362ce882b3d09c2744e6398ea850c98e26ba9c955175102aaaab1058c2c61620b105882a8beaaaa53463cfe5561ce4253381047c16acedc3d027fc242fa78b2e8a8b0ac2b02c21610b08540b0e7a9587cd162c3922c15aad98fcbfd108453e5fe8b64dfa588c71fd0d41a1b2e400cb926217156c34695d99233da35c47169d54b60639b8a339f44e65a1903a2c00b38916cbc06b402a02323b67fe54734b135ed6e8f19ab3576f16fe0cf556b970885f0cb56871a575aa66c0c5297b8893e5509181d4e3ff000a7a606e2e3ff1e6ac7146c67b40439d987f456bb5f796c2cf983a84a999dde3923c60b8bc689cc93106b81af9a6b19f0e9ea7cd36291ee21a3153a2b0da762c7d0efbdc1a2bcbcd4f2ba32d73262e2775f5e68b1e61da53743b555dd4ce69bc2aba152e699a154a2d289b50538c9210c60f551ed18c0dc08492fd056d4fe115b577d056d9dd0ff45b63d3fb2db7fed16d87fe85b40b6acc91919d42dac7f52da33ea0b68cea16d1bf50589bf5055fcc139c30105eac83097a6708f14d9db8fd949c2cfd42f273f1d10f79541caaaa8d537e2a621739769bb0c4e5d9c2cc448243478cd8556d5ba763c43747a7342d6ca6b9568075aa63e3ab4900d061253a180c18307cd56a9ecb6693627a2b4d8a07c916740a7ece88da22a64398527667ef5469dd39a1619c5a700e5f32eef3199cca1c5cd59ad32c7096b99898dc9c39ad93b67b4a6ed53985b84fdd4b24b37b479af2aa7492606e54a8e2ea83a687425b887f54c01933368c3e8a690ccf05ccc2e68354dc4e6d0688568537229d931307b2afe644553724e5f2ae4cf3563c2d14a207c90be8161541d151bd1616f4581bd02d9b3e95b26f40b64cfa42d8c7f485b18fe85b18be85b08fe90bbbc74e14c606e5443c433b749eaa4fe5feabddc47c23c14ba9ee68a8a8a88843e2262173976c3b740f35d9567dbccf6d72c28cf359dcd63f3a73fcab6b66277a2a0666cf35dd2ccf2cd9c85bf3d1775b561924da82f71cbd17ef85db264747b337bbaa168964de8a0385bf12bfe177a04e26b1db1f99e536d7199b2270f290e9550da5af99d85d577f62a299ae7c8e6d1c7e650ec06d1d841c5d335143656b24ddd5362b3080c783ecb6567eefb2c1f65236173236eceb87929042f7c6ec1c2a4d9199b260d39a9dccef05d4dd2d5637323dae26a7e16c74c39d6ab9a7f084c3ec3fbaaee828e977c8d4346f928751e8821eef3f18f1439dae4fd4a5f891044dce6d5c7dc555557dfb7e294c42e72ed676f05d86ea5b3d58a58192d2bfd53bb3995384d0147b3a4035f5a7346cf691b3c8e5c23a2ef5698db43ad788f45dfb4d9300cf7abccf45de63a61646367cc7545d65919b1c1ec7eaf34e86c9680226eee0d1dd51b159a5a6c1f830e4fa730bb9039d9a6c319c9e85864070c737b03993cd773b45765b5f61ae2e6bb9dadfec649291b7477328596d936ec8f0c0ce13d4aeeb6d97da3df85ede06f55ddadae06d24d24e4ce545ddad74db13ed4fc9e48d8ad51b31b0d647718f55307467666a9a5166ea8ceed10f827d50d112abba079afe58f550f243dc57fd0d8f3b43fd548efde183cafc1e7e0aaadf5be9ee4aaaa959aaa8b37b936f7aed3f8cbb2ce1b644566e8b542f7c6c7f1351b0c06abb8c5435febd11b0479f54eecfcb8bec9d629bfb72ff006460b436a29aea1ba158260367434af079ff00d97b6c0199e1e4c45d3398d69c45a341cfee9ef9de1b889200ca9fee9d24cfa39c4eef4e5e69d3cdb5123b8bfb0f24e9ad02632fcda797a265a27189ed2711d7cd492bdce18b3a273320e6fdc281dcb9270c2f23cd3385c104ed6ef9028381a83b24dff4eed0ab01de715ada0fa78a8a8b9ffa32a0e69b7b9768ff0010e5d9f95aa2fd4a4148f00e68482acfcc9950dcca0fabdcde89c68464890157c540b0b7a2c2de8b037a2d9b2846119a922618dc30a184467219297391eef358a99d563c2ec4a435a155cd1ad53b31760f67450f084dd0a669753dc5557c474b9a3c12fc37fa15604cf8f25d4f7b55555bab71202af84a80649b7bf456efe21ea134703d0a8dcd918d7750b0851e8e65734d610467c90713279514952694cb54698039cab92889a51c735418c1af24f7506489cb2b8381af922ea103aa2682a81a8aa0e0ec43a2b5ee63c3d2a9e0e2b8ad0513744e4344066b07b175752547a26e8537c14ff47693ec64f4561d145f124f543ddd557c15555555555555bca728340823749a2b51acd27aa89597b40c2d6308ab543da2d79189b4ae885a6032503c56ed98187cae941751bc8ea9bbcca382c02b54e70c58be8540ec2564c6951bb200ea835e0d7a9cd3cd299734fcda99965d134d4bb2e6a763c9a86f3a1f45686fb478e60dd8ae6a0b4281a3bee99bf81bf75443443fd00f1dacfeeeff0045641ecc150f13cf9a6a07df52ea0f72fd0a8384208aaa9dd4614e3524a8856806a543646b216c65a0e5994eb0c249c3507447b3be8701d3d1363b734eebc501e7d3aac56e0e2774f46f55b7b507570370faa168673c8f442561e6aa0aa0b891a2a0b8b4121014b835c30e7eaa49636025ce56bd9995ce6d75ff0074f082e69a822b9ab08263c54f20b0e687fa8b6fc072b39f66ace7277ea4dd3c35f775555555f1ca77541c21046eed1761b3beeecc88bed4cfcb9ae6a9bc07dd3d8054ea689d67ab461d70d0fa2eec7690525755ada2fd96e3886ddd809d136c53ed71f78ab9b905fb3ad81ae8c4dbaf3bdd56c6dd8a301e0601ff00d961ed10f2fa820fcbd107769478c3a8fa8cbf2a31dbb62d60031d737a95f6c124268307cc3aa8c5a1d23dd9613c23a22cb43600ddaefe2e240125aec7c93c3b0ebcd61a9cd4e30d772a0b7356bb3b4c3b8dd02211e4a991432413b54558a3c30357cc50f057fd057c1da07d88fd4a0a88d59c6e26dfb60b6ec5b762dbb56d9ab6ad5b50b6ad5b56ada858c2c63aaaac41542a8eaaa15557c2ed4287442e72ed67eeb5be69baaec68fd93dfd4de5a0aa502118cbcae8e3118cae11b453caec0dcfcee201d50002a780ac35c4ad516cad0e1c8854dd4de129cdc9b9a684ee49b9bda14229184e3ed1c9b75151515153dc5556f3761cebe0b7e6231f9901484a847b26781b628cb012e72ee2cfacaee2cfadcbb933eb72ee23f15cbb99e5295dc4fe295dc5df8c577193f1d77297f1d774b47e385dd2d3f8c1774b57e305dd6d95f8ad46cf6ee523518adff9561b7740a96ffa02fdff00f0d63b77e12dadb3f056ded9f8051b4da07f29cacf24923b79b4512173976b9df8d07282d1359d8c8f36e5fd537b508ae26e5c933b4a377ca50b6d9ce8f4eb4c205718d2a85a61278f9d16de2fa826cf13b472dbc5f585de61a038f5154eb540df9c7ffa85aa13f372aaefb00f9ba7f74eb7d9da2a5df35177f83ae55a557ed08a95cfc97ed06e7bb9a3da433a30d3923da2ed29cf54fed37d326e7ffb9a77695a01ca9cd4cf7bc92e24e5915a81e613742a5197a26734542dac8d4dd148e0d91095be68481636ac4d589bd5626f5556f5592a8eaaaaa1542cae1e03757c16ce38427650151e4c6dd3708421cb5298fdc68e8172f0d2ea0585605454ba97154ba97511438d4685cf5dabf15be8a2617c8d6b4668769441addb45ed1a684744fb2d8e4a86be98733f75dd20df6364f6bc4cf24cecf708abb4f6ade5c932c569d962a004fca8d8ed0db283f3736292c9691b1cb8bfe953596d0c11e58ea797246c768ef0d6f971f451592d2e9656d30539f54cb1cef64b5182872f34fb1da44519c9c72ab7a292c53e28a843ba9fa53ec12ed86070c1878ba26585fb1a3e4025a6e85dc5c58c1b5f6df37a2eeb652fc4d7d5acae26a366b3451bcbe6a890ee1e8b0581f25716706be69d2767c8c2e3a4a687c8a926b1e276e6710a37f3056cb4c0fc2c8c6e31bba7cd30d5a3cb24066b93ff004a6144eaacdaa1a056981d2c830ba8bb8cff008cbba5a87f35777b5fe22d85b7f102d95bbeb0b676dfa82d9db7ab56ceddf9561b7740a96efa42c36ffa42a5bbf082fdfbf0556dbf8283ad7f80b69681fc82bbdbdbac2e4db763e10b107007c56af8d1297e02d1a172521e0f544a07209aef08bc788f8ca1f11310b9ebb57e3b7d1589c1b6a8aab035cd98d01ca857718b706790ff00ecbb916b23742e3b5fa8f34e8ad36795b240e2faf1d7aa777f8de5d8c38bdbfd28bf7e84f78ae373b899d113da23d993f133c5f4a0fb7599bf8864fec562ed01fbb1352fcf69d02c76f9bf76e12ce27f545d6eb41a1dcd97fd45324b747fbcf163d63e9d152df08dd76232f17e5253619e33b0121746fd5dcc2167b44c4c92cd4737e1fd9777b49066327b7e5d28bb8e10dc0f20fcff009936c3189c5492c1a465496284b5b961a1ccf546cd16debb319b29446cf1b591f40fc95aa28da246e591a9f3aa61a2721cfd104f19ab31de51f00f44e347aaaaaadd5baaaaaa8ba883caaaad16258939c892983f7a39f34cd2e3e0b47f12cf4568f86079a173b39189f251c421a37d2e0ef10f19f11554df889885cf5da9fc40f451b6ae6674aba955de256325883f22eccafda136ef9368bf694863858d6e63893fb481b4c7b9b9453dbace1d261e4cfee9fda1036189c352a4b5d984b18c5c4dcd3edd666470b81d54b6ab3b278db8b276abbdc0db518abffeaefb67db4915721a265ba0eec5f5de054b6f85b046f69cca7f68c024869a119a87b4a3dbcf886ef24ced31b09411bdf2a7f684a6cd8367be35f452769ca658ded1a0cc2b4768cb2070190c4bf684fb563eba0a2c33bec8e797ee710f5e89ee7bb138f3d50d130e2604dd1735268df456215947aa6e413f8c5dcbdc3af75d5b8f1050fc73ea99a5c7c12e76afb2b468d1e68688eabf9e3d14e7dab90e16de0a1e00b25975551e2a2a22a97510f8bf64c42e7aed23fbd3bd141d9cf736ccea8a3c689fb3b35a276866314c39a1846cf69c20ab1c53ed239583235a79f92b789ccb573281ad190f9508ead279a640f7c0f96a28c56611173f6a0d30ebd1430be77e066baa630bdd4e9aa91984d41a8eaa481f1c51c848a3f4508b3f75c4633b4c340debe6a088cd236304027aa6c7491c1df29a2958010e6f09feca68182511c2fda5426f78758b0d066ccdfd29c93238e294b2d20f0f251508734e9fecb1b361b3c1bd8eb8d3ac4c6c5b2c64b8e8df33cd4e5f673359abbb891e150702722755d1767ff108293885dcbdc1bc955bceaacdf14faa6e971f06b6b729f58fd50450f8ff00653672bfd50e065dcee6141cb179155fcae55fcae588fd0e58ff0023963fc8e5b4f277f45b4f23fd16d879ff0045b7685de02ef2deab6c3aaef03a842d2ceabbc47f523696750a3943e4c8f251a173d5bb3b54beaacb100db3fb4df0342bb561b335b8a38c9717717242cef3688e195d86a3251d976764d893bcccc395aecae7590c51ef48ea17145d82a0e4f1ba9b14af69c0c711e49965f610bd8ddec21ae0bb4607b2d4364d3c0344c7e1ab5da1d548fa0c0d35ea54514c5d1bb66e2dc5f64f8656b8323030bf43f4f55da76421f036261346f24d2e8dc4387a852baa68320392b158672e8a66e1c35aa7c0d2f6b9a681c7787556cecfef329943f08a53fa2d9bf0cb8336b4e6bb3acd67b4170931791e49d863733152a2a02b7c31ec5fecda662dc47c961698f334772507c3fba39a764ab45d9e7db15f2a93885d5f0ea6f37b8dfcd3be6fd255938ca66971f0373b4c9eaa6f88c434b99f15c8ea7d53381b773ba946d5468043dc3b5f01080541d02a37e9098063192621748a73ede43f9d766e0b4995efa6271a0fb29ad2c6490d9dcd18b1667a1e4540e87bdb8486b2363d55a64b4b600707a14d965d98dc21cea6f156bb345ed62671b77eabb3619acf1194f33c2a7b5c51105aee23a2da3708644eab9da9e8bb8c9dedcc92b87325de4ad5678e466da06d29c4dff2bb3d9359ecc0bf42787a292db13246006b9adab43775d89ee5dc0b2dc4bf79bc5e655a98db443b7c98e69a1e8559036cf04263783539f9ab4cb334b0b6322aecd3cc985b89b4657923dde2b6cee69c836afe8bb35ec9237c6c8e871554f652f958768e3855adbb185f3475230105636ecbf3e899f0dbeb749a0bbb3f395d4e8870ab454529d5639abc283e4fa5627745572a9552813d1633d16d3c96258bc9625454be5d1ffa5593e6299c22e3e08b39dfea9df19b704ce293d536944cd1b7735444d028821e3373b8bc07c0389aa3d10ba558809f1115188e4a073e16be41bb89bba7ee9f2cb3c8d2f754f5504a20b4637b31d177a8df03667e58b8429e78618f7dfb8fe129f6b7ba37b2b52e76f3fa85d9471c382478c01dd735346d970d46e876488610346c8d4fb54ecb5ba43ad736f2a2b55ae33108a01469cdcbb2df8a3c32c8dc0d765552451cce63e9962a353b65870c9469eaad734cdb697ed012dd0856bb53e7d9ee616eb4f35d9d6cb3d9c1da976b90e413a58f67b57ba95e1568b632cd1b5d4c6c7e89e44924bb3a8073a282d73d9ebb3752a9d3c83e1d0e0157f9d5769cee7ccec0e380b41a2e481c9abe652671841766f13d0d14fc9043c43c07c014dc327e9565f86e4de1171f041f11fea8fc6fb20814d393ca6f084cd021704e0a3d0789d902534d5a0dd5478cf80df54d76f051a6dd36855921135a70bbccace390573c2ed13e612cee7d03011a20627ba432546eeed3aab04ce73833658f03324e71b496d9d9a0738b6bd135b93ea730b65208c4984e12754e9c5a5c7db61632819e6e56d9fbcf77fac5410136176d766edd3cea9c1af61f9702d848e85f206ee8d4a8e66cf8019b0b58c007ea2adb6adac02279f68c929ea8c263918d9461ae69d9b5fb4e108421d67924da01434c2a0b5e39a1c4d270328c6fe656b9c92e870e1687d7d13f631cbec9f8861feeb6bec765847156bcd40e66c26c7290e3c2839ed040f985172555cd7c850d5765b33374fa8b9ba7ba76887827f852fa2b3fc229ba784ab2ea7d57f38fa5d55a424fadcce10aab9a08a6688f84de57cc6e17f3b9c81de0a34dba6e17281d86479d99765a04f8e29e23961340a5ecc66584e91947b3a5c10757eaa282d504f2b23f5afa27b2521d361a6fa31bdae0da6656298810d4d01e15649208f69b46d49cbd07542ad76267caec8a91f248e32bce7d53dee735b51ff944cac6e0a901d9d1591cd8267e38f11a6413c35d23f6752dd51daca0bc92ec2139931818e35c1c93ecd2b03096f168991cf66b4b28dde232fba366b45a2d3207ead6ebd543d9f23e32e7659d14562b3b66a9fa10b0c1b39f3d744e8ecec30b83781b9a9db81ce14b81cd3b86eecd65180f508a9f50b921c29b7733e375d4adc55a3f879beca0f85e27f0bbd15950f8ce5547429dfc2a79de29ba04173b8a6682f1e228f178cae6145c936e9f85de8ac5693038e4da13bdd689c27b392ea6367fb046d767de21c694febe4b6ccac236999e009b29da49421ce1c43a239c387222bc5c97b274cc796699264567169749875e6a386ca1d3d47128ecf666d9dec2d5b0b3f75d9533ff0028c3018638f0e6d3a295b14863382b851101b4ed30fcb42559e2b3c6e90e1a0768a26451b1edc1c4b2d8ecf08a75e4a477b36d6800e7c939e4b98e70008d2bccada1daf20f2384f45de21c2ea499039faa33ca37f6158ce54fccab6ca889f17b47703ba2732dce18c3002c3423ea3d55b6cb259cf1e2c42a7d6e0abba86aac6dc2d6a2a7e26a2b90b87b837847456baec7c89507c31eb79be6ca27fa2b370a671bee3c253f2b381e89dc4504173b8e8a3d07b928f178ca2a1d026dd68e077a2b258a396c4d7537aa4d559ad659b9269cd6dac4da011eeb383cd774b16fc4d3bf26f34f447b3e2761d8cb4a6529ea8f673c92c64bec389bea9d15b220d9ddbf5e36792c76b8c6ddf156377c9d16d2d70e72c38b69c03e92b1db21f64f8b148ee07226dac77772cac87493c961b639ddd48a3bf17c96c6dd68380ee6cf9fd4552dceacee60a47960fa962b6c6def0f8f131df274e8b67da310c5c5b5ff00a57ecfb40221dafb139b90ecf762c124b5b33730bf66d5cedbcd560ca343b3ead3b797dabb80fa211585aec4358850f9aefaeaeeb4529a7f95df650c20e67ebe89f6ab4e26b86a07d95ab698f30e18857d51041a2d0dd0b7da33d55933655153f136ee970f706f09da2b5b86c1adf32a2e067adc51bed1f05ea0e151e65deaa8da68a41ba53f8583cd1d4faa6a08a08a8f4bc78f9f8cdd673ba136eb4703bd15928cb1b2b964a4b2472e74cea9fd98fd5afcd1b04e07dfeeb613b0530d2ba81cd7ef0dddcc061ad3a216b9d9239ee15af10e5f64db6c989c5c310fa3a26db6505d89b8f3c87d2536db286d0d1e793ba26db6511d353ca4e8bbe4bb2c3fff00a79292d333dad04d29cdbcfcd1b6cc5ed71e5cbea4db6cbb47388aff00f1a6db2d01ef3a93cb904259b0b995761399ff00c7aa027c3b3a655e0f3ffb2c13bb0b4b49a70b7a2d95a24ea6832f20858647d2b974f24cb2421b4c2bbb438f1e1cd6c63029842ed2883847967434528dfaf552373fb20141f158acbc28a9f885c50287bb09da2b601b38cf3aa8f465e6fb51f62e517028387eeb252f094efe5fadccb8a6a7266978f09bbe6f19bacbc2136e9f81de889636cf1b1c3888098e072f0616e79274113850b42ee3051b41a57fbaee30f2cb2a236283e9ff00d08d8e02ec587a7f65dd61c58b0f3aa6c113746aeed0d08c0177487e9f9aabbb43403068b66cfa5611d153c05c053cd3880bb43186b1cd1520e8ad0da48e1d1482b144eaa66aa01edd8142375153f1055b8208f8cf81da2b61c9813348fc56df85f74cf86a1e055473527133ef7310b9a8a65e3c6388f88a375978536e9b84a745239af35e9b3f251f013f365546bbb458a8e68ea9cea11e68e41547849035baa0a042269735c1c2a16318b0a2ea168ea9c6945f304e23132aa504d07dd5a4bc435f9e997aab732afc75d722b3d8fa14de2564159c2664115682313735cd1410f707c0ed15ace71a67c9e9e2b6f0b7d50f86a2e108a7bb4f552f17fcb70d4a1705c933dd7cc7c451bac9c3f74db9fa14d7b701ded354d6e7ea8eee0682b09ad7fa27bb0e1f32a5d29d72556e015eaa43c2075fecb27353281a28b17b5c5cb4fba930e1ded139c1adaa8b7777ee9b831ba9af352ef519f74c7626d54641190e6857162a675a273a987d53812e1d1379a731c49fed74b187bd87e9cd76831b132839bea9e691bbd57ccaccd25c29d540da6a164859da6790915d28ad0d2d90654adc2e3e33af81da2b47c6099f2fa78ad7ac68fc3fb28a9842253b50a4e277e940266aef5f07caa3d05e3c7f315cfc46eb2707dd350455a629bbf39ad068e35f24dd022c0504f638971f2c90d14ba0f2cd60077bc93a8c67f6516eee74581bd39a90622194c932ae66f05442b5c74cc9a2a0d51c9a70a6b5c08e9cfd6e73093af25caea85887552da61652af19ab6da0498548eaddd96cae68275119b612e1c67788a2b413b46826b4b85c7c7cfc0fd13fe3267f8f15abe2c6a4f869ba0bbe609e7393ec9837547abbd573bb9ae4a3e1178f09bb99435bcde6eb21dc23cd040dddabb5686607501399562ed1a06b25afaa65a227d68e0811d7c34aaa7bb33c63e656db63a9eceb41cc27f7966cf27efe429fe518ed466d9d0d695fcaa6866d8c8e22985d4a1e6ad1160646fc75a8d3a14e2983110158e2c118b8ab4ba98530e7af80a3eea4d17f37ee99e2b49fde1be8a5f8698115f3a77cfea99c213389deab9ddcd151e810b87802378bcde6eb1eafb9b75a601344e62646cb431e78650694f45dd6d2d7c4d0dccb6be410967607c8310c079f25df276b5aec5ae8e3a1aaeff2b682bcb9a676a7d4dc90ed28f98cf242df11a0e7d177f88d29ad3447b4a3a6e8aafda5cc37edce8bf68bc1e1f50bf69483e5a9ff002bf693b30057cfcd7ed17f219755dfe4ad075af9fa2efb29386b5a74d4a16a99f518b1505283fdd77899ec91e0b9d4d688592632b317096e6e4767636e23be7e70bbddb23e38ebb4f87e4b6d6e20d98e4ffc4f256a9679e4607e4e1953fcab4c6d8e5c22bf74576659711da1fb26b688a255added5a3a04cf0147c5cd0be4d10f8a7d533c254dfc52974081a22be64743fa90228147c4e4ed6ee6aaa3e1178f1f342e28de6eb1f13d04dbedb060b63256e55ff0070b6f6e67b31bce3bf5f2e88768b5e4562a407279f342db66989648ca45ab0fa2ef362986ddeda18b408d96cf2fc27d1ef38c7a2ee2d3231cc93d8d3790b07b6712ff6144db0bb6926d9e367c8f54cb135b884d266e3ecd776b3b582cd249ed5dcd16d85ff00b9d731cfcd52c1683ddc1a6cf9ad9d86d243d8ea08b8bcc21dc273de6b4d9ea109ac26b6ca6f0cb0f9aef56400da18cf6aecb0f3aa36f85bbd045595fc43d177f60ce18aacd65fba777d90ecdc68c7ef62e9e4b03616995e6b96f1eaa4b5d9db344cc59146db65dbc8c3a009d6aab9c699e2143e8a590cb2179e6a081d34cd605142d8d81a05c512a7359de99e028fb8173f92d6d0ef54ce7e129e6b697293e554bb995f2ff5b99ab973b8ea86899a78078c228a379bac7ac9f64d42fed1693672e1ab730a2b4c323b5a7b3aaf626cc0e581dc94f046e646c7014aeea92cb1be78cb9a2ad1a754eb2536863243b165e43a2eeb2b4886390ec5dc4bbbce48b3997d86b5ff000b616990ec6593d937477542cb2485db790ee8a4647fba162c51bccae264278fa2ee51f76c275fc4f352d922eeec670d3477352d8633b30ddcca87f305358a174accb0fe5fa93ecb09b4b5f877ba723e6b61177ac78463a7fe94c8d82d125281fcd6286364e72184ef04eed08196868d5b853edbb631b306ee3351d42b73616b6211332cce24e81c218e5c40e33a734f6817765d97651e37713af715cc227139e7f314d4dbca3e1378ba534519f6a4a61d557c04517fc43fd53b89a822baaf95ab0a6713af2870a669e01e36dc51bcdd63d1fea9baa085d20c4c70f24e63992616eba26b9e43212ec2dc4ad51dae38585efc9868df35fb466ef0d93ca9443b41fb37d4665f55fb4a3ef11e5ba466bbfc5def0fcbd7cd36df177a733e5e4547da51896514cb926769110c8d233f957ed097bb6cf9f546d93c91321ae75d55a26b76004b69b2d4a9fb46691f1b9b961535ba692663c1a513ed73f78da548705de26daed711aab3c6c9219a47c879e26f5e89b1830be4c6377e55035d8e16b727035aa92073a071a0da399468e8a7b3c967706be9553364c6c0594247f55d9d65db4d89dc2d4db8a29cea623d021f3ff54d4dd10b8a28f80de2e9f450eaa3d2fc4b24ed133e33fd51e26dc51e172fa3d026b724de3726aa272e4a3e1f76db8f80dd65d1dea9baa082273bad8e31daea350ec4acb66ef2d9267665afa91d54f65db6063652e2787f2b51d9363958e1ed03b74ad98c387e6d5361ad99d363193a9855870d656c91d5840a9e8adc417b30474661ddf35b1fddc4d8c71530a606b5b473789336515a06d77983551d9dd3995d1e8d3a792b54533ece06d6adcb07577aa6b63b3da1ccb4331507250d2ae3f30e10a4a18eaed6b923339f1c309028d3aa6589903a81b5c7c2ee8adf639192caf0cf67d559f6c361260ab6a68a3964d8879652a3553b2c87b45957e74d3cd5ae77ed58d2017b6bfdf92b159b630b473e69ce6b055c5373154512a73ec9cb97aa6372cd0b85c7c43c168d0a8428b845e6855539dba543cca3c6827277c3721c4dfb28f8026f1942e72e4a3e1f762e3e12a0347d3aa8d04d56a706478aba21985da30fef31b80af97550c71402b1b68d3c4a2d9c78cb5b99715da161167dfdae6e3c283e8c3feea3865901c0c2e4c84f778a460df6b68e1d7c9361c6c7cd20ccb0868e89f669e36e274640eaa390e942682a14603e46873a953aab1d8fb9d5d8f10726c30b277bfcaa15abb3db339d687498325438a8dd6b92b5d9e788b4c9cc2ecb82cef8eb2c5cf27296510818ce55c8ab66ce7b3c8dc746b456a9cfd96cf4319c2d62b55b9b656b708c41eb8e473b415aab0d9b6b6b2f39b59fee829ed3b4b7b2219b07fba6f0a7272b4b3f77c7f9902814db9b71f0943c0e6e2c5e4d50f34c1bbe19380a8345f3a09da27fc343e2268dd1921f10a6dc57251f0ae7ee6b9f80f80a068e0540751d1029abb52bdd1eac5263b3b0f92ed17168120f94a6b5e622fc787168d5638ad0cc5bcdad72aaed00c7599e65751f8d08581adb206e4f6571f9aecb825884b257edd5493c4d697e2e598567b4c7231b5340de4add13ad50b883c2777cd59c775b3b65c389d21fedd1777b332dec05d4ae781336b8a411f0d79a0db4f7bd460fec9db4da4664e1f2d144fb1b2defa65ad1c74c4a5ac165905a378b8ee8ff002bb3e76cf06c9b18690735359627e5d085da92c3b031e2a49d17b4c30e64d1d90467f6fed23ab45773d535c4076ed576734c71e7ad7352480316c9bb704374d50d13dd4551bb5e668ad987bbc8c1ca8504dd132e1e02d42e3a21e02ea093f4a8744dd078673ecdca0d17ce6e7689fc03d537e226d308cd7f3136e3747c3f75cfdc735cef28f80a3a2b2cd534f9865ea107d45544eaaed315b2bffb2b0fc3c2392b6c58a1757a2eceb61d9ca677d445a28671207020b5dc62bd17685b63b50651843814db6cadb36ce9e41fd02eca271c8c2f018467545b1c9ecda061e6a063628c10dcb9aed32d1677ec9edde3bc158ed724070e1c6d3f2f9a73cbe42f79cc9cd596df1cee1031a5b96a8db201368700dd2792b6db8598888b31b5cdaa3bcec86a720a56c84025f8b0e5e8a1b5cf002237d2a9b3196085b8f0d5989ee568fde1f2c98c558d15f35b42c734b14562c5492639e34f8e38d92e160188ea9a600cde736ba29a2c4c06be8a18b0d6ba9d54b206a98da316ec64956265a1ef76db43a7aa9e1c4c7fa5d1e885c1045039dce177243c121a472fa28b44dd3c1556a77b27283850d4dcfd149a37d5338ee3f1132e3745a1f55cfdc7347c0ef010a89b5198d6aacb686bce7cd446868a66e38c85677b8cb98a0a27b1a599e6a47b9b68c2070b865d68adb3cf13e1c40573cfd79231010365da0a97530a143bbf2d13227c98b00c58454ab2da8f758a08dd47b9c6a7a2138b2b984498a271a1f22b66f936af6b6ad0732a3c985c35ff0064f0d2f6f2af1279166b43b61262dda57d559dd31b16518c21a6a3eaf35b5da3a1129dc6e5f645d1b2676cf3672550d0686b551ce190cb1ecc1c7cfa2b1be38e42e93301bc3d536cee91fb83275485058591ef3f33409f2beaed9b71967185dd26750caff66ede7b7a29acf1ba5b3d9187ab8b96031e0638d7a14e78684c611bce19dc1b9b7f515239ad692e395d0e9f7bb9de5042e70f14ff000dea1d10bcaa2b5fc3508dd439dcfd149ab143c771f8a988228a8b9fbd28f84a1f37aa048cc2b2cf8fd513bab7694a555a26b4c38b13f73400755259b68c32b0ef8a29ecf6ac51444e2ae60faa759a5123d987850126c89a6ea63e48f3692310a28c0da478f21556c92cf2b5a63184834a79754d7c8c6b980901da84d0f120038932096491cd0331aa86c534ac7903854105b0c388388c1c2137b3e5759cc9cfa2fd9d2f76da73e89fd9ae1031d5dee6a6ecc681151feabb9d9a3b446ee41a85181a0654ad131c663468dcfaba7546764546c23439f9a0db44ce3a8c5ad744db232cf2878e99ab4e70d467d144008c48737e89d5c269aa04e0f3a29ed4216f9d2abdbda1c31d5ac2dad7929006bdc01a81cd43e30aa8a370bed1f09deaa1e143c36de01ea9828c4db9c9fc4d567e3171f889a823a22a2e7ee39dc75bca3e12bafadcc7b987134a8181cc6e2cca8dae0d38baa99f1b277b64e74c3f74e7b212e1fcb0323d5097385d8867c01077b4712de54a2a31b13a2c3af452430ba06458730a7b3d9e4115069fecad166b3bdd11034d7d14d67b3ba68df4d3545917786ca1ba0cca690d91cf6b78bfaa639dbed6915e7e4a2958e6c9825dd1aa8a78df138b64a306b5d50b4c4602ec7b80f07346d31ec439a71748f9d5778c41bb0697bfe93f2a6cae7e70c468dcde0f5e89b6495cf6995db9a8f52a6941f6508d75567b23236e79dd38ab72d538e06340423a4ce3c9c13f2661073406256a6c2d25d28ab681a02c724b9328603979d14cd632a19a28b4f746e17da4fb323a950f08bcaaaaab59c983cd0e04c190b9fc93f8fecacbf13ef71f881041391d028b9de15557c275bca3e2a65f7be268c20fe5098ef684f279c95aec3b7ab815048d68d94edf879fdd1b259de5d28750bf80742bb94f1b714737b73c49d63b4c203217d76993fc8a315b1a7ba8ff00fb7c963b5b8ec591d246f1bbaadacf36ec116173737ffd96d2d33670c5870710ea50ef53fb68db81acf93aa166b6387790ea4a7e4f25fb341030cb493f99e7546c563948c0ea60c9fe613acd629c8906419c43aad9d85eeef14a61e48774c46d2d6efe987cd6de16d5f1b0095daf9275ac7f2db84d77bcca2e9e52e0399e1567b208e8e3aaad0235c97ce8c6d26a8b7ff0850e774cd69b535f8bca9c93ad41d8590d3698a8a48f6723da4e791299ee8dc2fb569f75170b6f37514e31490b53851ab401553f92771bbd15938ae7fc408209cb928b9fbf3e02b97dee2a135899e8a83a20ad1646ca710e346c7330e431539aa5a5aec79e2fa93259a3c5849cf99ff742d520870ffd67905df5f8061a63e6fe49d6ccbd9b435df3929d6c71a6cc60cf7abcca92d6f25a5bb94e5d4a32cee9049a3b4f2f4423989c5bdbdf3755dd66a0ab7972ff00646c5373cf2ffd0bb84b5d41f35dc1d8b8befce88581bccd426d8e21e7951358d6e81147853ab807544802aa4b744d19667a27768e7a26dbde090057fdd77bb448d187ad2a15b64918dd87ccd35254367da4b080f1bc317fe15a99c3ba5bcb34cd10f727c36ad428f46dc11b82981dac6e1d1135175149a8478dcac9c4aa53fe204104eb9997fa32be5fbdf0da2681ad6fcaecc2fda726996484958a377d5443537502744c76ad4eb342e352dffd0bb9438ab4e7a21618b2ae6136c510d73ca89b658802295a842360e5ee2baa3cd375374cf686e1ae656c2cace27e26bf856de379a777f6d1e8d5df19f163837bf9be484ef3411b2913c6e9e8ad23da8a66ea6f15d991325b454c984b4e415bf8a3ad2a821e03e13e1b471051f2b85e4e4a7756483c98a992a65a23923c4b9bbd55939fa218699a7f1a1e06dd440e7ee8a28f81e98374fadf0ccf8616b9ccc63f95eabbd5919ed045595fc6de9d531ad7c5196694c938d03d54e11444d055020805020e9e1c42a027bb0b4940e4998a9bca4796967994744cc9a334d3be4d78b440e650691535e774d6c63726e656ce5b47b47bb74123cd470c118af2c7957926da21334a318ab79a65a6130cb207014d7cd4f6f8a36b30736aa4ae2d2fcab2e7d73504567b3daa98abb46eeab6b1a1b1d10bcf8cf83929b8c28f97a5c11b9e6813d876f17ffc7545d92c596a8955cd733eaacbcfd11612755271a171ba3e77f3f073bcdd54e3a5c6e173b44c395f66b5b0011bf50e0021b3dbcb8698fe62a3e06fa2c1bc7cd3b723a0fb27d4b3251e5bbd130b7780e4562f6b8ab969f74f0081534cd724c751e6ba38e49ce01cdf34fa9205323aa6543735138d5d5eb92d9d4bf3d42c98ccd4396e141a072401c44dd6db4ecdb85bc49b031836921cf562dabe7a386e06d7133a958ed32b1eecf087d7eeac6c6ec713e0abaa687afaa6c4f74a18edcc79e7a26b695ae63309b1bcd8448e1bcd7e26fa2b45a2b2c72c756e5fdd416891cdd9495a8cf3f34104797b837947452fc551dee5894cedd4e96bdd9dcf0e129da0bca1ff007567e144e6a4f8885c6ecc2dabd6d9eb6a7a2daf92da792c7e4b1f92c7e4b1a322da792da045c16308bd635b40b68117a668d446b74a1b8da071734e3231c4e2d79ab2dbd9b36364c9c8107444029adc2288a607348cb8b55b36f4e7552ef7b3ea987134ff004585b965a270739c72d344344e6e2690b662a0f417115bdcf6b752a5b6c4cf350b4bdce9e4d3921598ed1dc3c9bd0856ab4e0ab1b42fd7ecac114ef91ae0d3b2c7577d9185bb4c9db8ecc85da963c7edb186b5adc8282cb34b13dcde1a856a89edb1d2b9307f546a211e7a282399f8ad0fe5ba9a5072aaaaaaaa2562589551d6f289c93fe2a65d54e28b9487258b729d0d4281fb4780e3445b85d4ad6eea868a1e15dd9c73c94bc61042e08aa5c3c35f11f1e2ba7637bb452346f03bc5487740fba8ecf0cec66092981b477aa8a6b459b748e55a287b498ee2d536788d3782c42baf8eab68c1f305de22fab9d177c872a1d577f8be5cf247b41bf28febd53fb41fc4324d1689c93e551d0a6583131b8a4c2fd5e3c94926dc88d82918fef4e4ad56c6c40b3e6ff054504f3ef83d7fb2ece89d0c0dc2751572636d1de1d52307256e99b1452ed456a375496c8fbac623c891423a5177c13595f8472e6acb6474af91cf14a1068a67038e26d6a730153242ab7baade5bcaafeaaafeaaaf552aa555037147447e3265c514ed51d0dd65617c88ea6e3c0e4340a2e15df9839052f1a6ddcd5554dc502aaabe3adc7dc556d9a3b35e2809e615a3f7883100006d301f5e4859818a101d87a91cd0b5c8c036b1627bb4fd28436495cd113e819c49b62b463934a0d3f321de991990e268ad09e6bf684ccc88a7aeb44ded2cb87ffd5fb45bc9bffeafda2dcf0b7ff29fda5cc0cb955496f98006b40743d54b25a016543f7f4f309f05a76ed616f17cdc97749fbc603c34e342c4fdb3f1b86ce9c5d50b1b585ee9e4ab2bba859acd0576d2576868daa2eb1434b2b855a75779a73a69c522dc6b7361ea8d9e4930bdd26190f1fa291f1c2ce80d72f34f6c924ae7bb2d0d145b502d3234641943f75d9b6c6984b70e4ca7dcadb90ea4ada63197d95a6d5699c371f0d775481ad680755639628e593523e509af7ca0e188ef1a64a43b06ba3071fe6e63cae07c05648d3c20a28afe714db8a29ca4e03758080f251d4dcfe0ba31ba16cd9d149c480a040a2564b2be9eeaa89f72e89efc45bc9b52b7b634c5956b4505b1d118dbab5a5456989c20a1cdd54eb3c6e8f7776aecc84596b73846d928c666d3d577ab4e22e962f64dc9e3fca169b24805a256d1ccd0211585959dcedd93409b638222edac95c677136c5146d2c9a4df7f0f921dc5bfba3f3e65de6bbed95e703d948c701eb45fb44e78e1d7e12ef36e67b1732af770b97efb4eece397e279210da1dec1f27b11f3733e4996571dc99f8e21c0996366f6d1c6414a37c821042cb3169de67328daacecdab6bc2dc8297b48ba08c346f87669ef9ad4f7ff00f6a29ecd23acac97578c8fa2d9ba0b1cce39e22dafa26bd86d2d2df66c242b6bdb2bd8212ee750bf789e28d94ab5a6810ecd79da991d98a515a63823c583573428ad33c41a1a720b32493a9bca2b3f0d7c155ad137e294db9c8dd3705d626d41b8e8a4e14354de11e973e2e69cf847545d1754d74439ada40b159cf35fbbfd6bd8fd4a917d41618fea0b0b3aad98fa96cfcd602b079a029cc7a278cf2a2c2ed16cdde5fd56072c056cdcb66f5b32b64ee8b62ffa4ad9bbe92b01e8549149803db5d70955c389ae1a29a1644c0e78ce48eadf2584b5ad70398cd476a9db1ecbabea9b6e1de1a246168a50faa6db217edb3e1d3cc22d8dcf85e5a09a6ea6d8e032b8baa4726744db135d8b6b213f87e4bba6263b6ce2e77270e4bbb43ddb01151cdfcd4ad8760cc6d1b31a29e46c62273e94ae5e4a6b5451cec61764e525b628ed4d8ebbbcfd57ed1885ac8f93af9a676a345a24cb70e8a2ed3919b6a8e2d132d7298f62e76eb9daab4330ccec886820553e28c4e5ac7626815471ed1b806ff92a34c4e6e956e686ca69e68abba583fb26d96cd820186b8754dd889a47b5834cfc96d63642da5309764427da647134cbc05044220aa1584ac05515153c2c39a8fe21f542e72374f759384dce5268866546340b649868aace6d0ab17e185ec7f082c30fe10582cff86b6566fa16c6cdf4ff0075ddecbd0a365b2f9aee965ea5773b37d4577383f10aee517e315dc63fc75dca3fc65fb3dbf8c11ece3f8c10ecf27f9817ecc97f11abf664ff005047b3a71f38feabf675a7a85fb3ad7ca9fd5770b67fe95dc6dbe6bba5bbf32ee96de8547b487e36409cbd53e385ef9cb9b4ab55ae06496264ae750b1b46a0e180f551324b5bb2d6360fecbb4193b990e408e54e68c2ed86daa295c34e69b689e3309af0e8a1ed178b43deed1cacf6f906373a3ab5c777d50ed09a212c4f6e7c932dd3360922eba14e9a73676b09382abdbccce6e118fe8acae699c6d1a5e08a2b73230d8990b091f5f5299035d66925da0ab4f0a89a1a31b86ba27b5ad734f239d1431c569b5b9f0b2818065e6ad9637c966d9b337975494609196911020bebc94366b4476f03a6789480376f24dc25bfd15959579c3a96d2bd13a53a179c6c39382c62a4ef6f7179a6900533a2a8e85631d0ac7e456d3f2ada37a15b50b6a3aadaadb348e15b40b18f35882c4ce8564b73cd00d5bab73aa023153ce8991b83ab7bae6856a14cd0d14194773949f2a66a82c4ef7340a8805f7552b1155553756ecfaac4eeab68eea83ddd56377541ee1cd6d64fa8adb4bf595b697153195656899ef6c9bc00caaa42e89af7026a4d33f251c4c2d8ea35694fb3c4db03cd33c5aaec96304314b4de3914c859de5fe432fba93295e39634fe17792b4c31b20b2bda3373335d9933c35edc88198f553b8996424e6add045136cb8053137340fb4c3cb44257c5b40c340ec8ab231a3b3d9301bed3aa880926cc70b721ea9dc4ef5501dec2744e35715059e3b342c747aba9545c4438b995259e364f3c8d19ecd63736d9648c1cb66adaf2fef111e1c0acae3ed07568581bf4ac2dfa42686f4541d1616f4585bd1616f4585bf485859f4845adcb74201bf48546fd21616fd21616f40a83a0541d02cba04437e90a833dd0a8dfa4201b5e10886fd213f3afa208275c15b380ae4a0f8686a9ea4d4266a9fc0bee57ffc40028100002020202020202020301010000000000011121314110516171819120a1b1c1d1e1f0f130ffda0008010100013f2143c181fcefc229882e5606a8fd22d531171250e2f3e05c190d48a03c31b4e83e05ae398b09a61ab0b268635191d7b345ff0059022170b1c766df16474844a395367ec04e33e188935ce866b96bf3cc887a321093cc59f90f356e3c8f8d896348ebf838f91d381224f9d3161710316078103a388f6890cd8289640accde88fc6170230320c5294bcbe0b74346417ca4b85dc8edbf8ff913b8fc363e44fa5978d1210347ba7eaf8d2e18879fc60d7ff343b633523e29a9c976bb317b32d8e7859140fee243e01c8d8971c07894174251061f89e0c19a21ba16713635686ac4434689193d893d48c0d98183284f8f627f225420f024eef669408e95aff646434a188468bfd705d38b464cd12f9c242bc08e3431638ef8d71b35ff00c171b3b16788f27a7a25371f61a8ec41287f845fb3eb8842b89018aa171b72f223063c1d90ad913530ba321a391f04cdfd31124f8424a4748131e38b7f2b2703650a46a86a062833d99ec2201891a3435fc0a6df0335e858330f6347b227d015917c3160d9d9ab17241fff001596763493ad8b4219b8f64d7ac5be59888bc28fa010c6c09e013b158a2172f833b1284a09f42c228fe0c43d2e115c25045df4c54d7c0d08be20523f4d8584812c0ba3425cd089b270bf616c58d091a3447f1c1bf844e4c4f99e0f5f4a1738086c6f3cb42c8c3ffe4cb81e4c10f1f0097791fa1c96f920ee29f5bc3b198ac502f2ef97942df1d8bb6444a5c589bb21dbc1984a12170d62c0ff00a6257ea27034459813f8993fbb2297a16a11365d3337a1835479e4eb8d0b1c8bf40d38e5c185e60254f5c6b878621e788a7ca4a4cf8ec7f93c842e1a8f876d16271f0c816c43e48428f021832a690445276271366d887a36e1a16344a5b34ec7424f090b8960c5fa36f81a1e4592a897ca21064385eb84a78c52fa18ccde3fae5649a83469eb857eb098e361dc927a57f2697a26572f0540b277f864377c218b97c374687c8b8c13fb2c97c2fe44d47c7e2d49bcd0f819a0b824cf21090b830b87624684a564f5210e1c3f033128ef9e881038bfa82c0f22247eabfe4fbc2be19be357e450b43c2a3e38db845b65c7c70dfc187d97f40cd18e068c2f3fc85fd72f030b06cec8e50d591f82363e291c53ae6f57932beec274cbe560ccbf9c67d0705c2bf68b3c48b43c8f2218b3cc3812432ab1394a08cf61ce532349a130c6e9fa67ea0daf46c70d23cafafee5bd4504af94e4603349ed7f8140993b308c20adb1954ff93ae0195dd880b1bd0b05b3fe9f63fe1c3e4b06c8e7a14df0b97f8acc3c8ccb863e3454e0a62698c4c6867a89fc9f4023a1eca7b88129302981ab5e8c891e0d889b0a20ab1caa0934cc914f9f168ebc453f4cfd31718f0d29ff00b67e98e1fd0a9d330461c4d099516dff0048a44a476e121ca25c5371b4b1f304e4c7f238e1bfb131a31a6e510b70593da47d1a570af3cc0b866031678d08e8d097e285cbd1a669f8693fe7d0d0a69afc1a8d17a358423a1ecfdb1a8108486af85c988e6d5c2057a0d28c8518fa8f81164664e4b2f866e75cbc0b062ffb91f8497a194f0603cf83ab828fe47ac44a97fa2b8080726327b17f8823be08c56b7a63c0bc1bdae4eb8843160d046b8d1a173be11ae5b35cb024f0a181e58d50ce1a96f8d8786f51fc0b0859346df0189c9221900d0790c95c31646a3205c7d10acf249cf187235b2af863a7e8841e1084193d21d121db43c5de44a5ec4c9c8dc22ef9fd629bc973767d8cc431a435126b640d047f26075ec3cb132c6f0b8d21f0e8df0ff24f289a4310c65f8605d3da0afbc7a12249b26d116ca8b0c25a13b16067f1b9809a563ba9f886f84394879252e4556f16236996221b50d69713011b1987c33acc10d5210f83007e8a1daf91d7c896d564d97a1c962abe4e873aee47c9e0e9712a04daa20041486e49accc14b0a1a5de9f92770a7f83fe974697195c4e046ff0668648f3f86b861c312b858bc3c3f816142a8ae3b153112af623c40874823433f8dcad090d53109a42a1b28792099625af1a4434c7e96d918162e84eb87122c7b0a404a971b1251417f44230be4b692f225fa262c5561c9d1e04b8a6d0c551525080698103c39270d12262c2955e080f35fb4268d40627bfe87834274b86b8d9650d9b3432385cb188797a26de8c171b65fe4110cfa90848e5e455379b171a9c43cb41645824fdbfc5c58a1e0c23138d8c49ce92ce58a62a5193c64cfb211343127c6e44fef958f41617152c64dae2dfd08abe46d7c187906887acc8d7429fa1ac4a5958428810908391d61348778016526352668678968b70261c18f0216788e74b96ff0009188408b0e0f63c76094f4b860c79f82464db162163f702344fb50f94754f22c88d0bf7229a340b8b71450f1c25c21b812ba2181943bda27261229c718c8b67f30512fd230346f24e2651047d599c46c45240cae84a646ad354728c842846bccb84b826ddb162427f2a2d89ade19768a68812a633034859e18a645c343fc17284ed8ae7d8b038e2045fdff9317f1c3b46ec8827cb6780b31231c3fb21a9d216572da5eb70c7c8d2b8e260450cd3d143cb24696c4497a93881e012628c06e3996323ee0bf823fa0f04e4a0d64c2268bc884fe0f168750f7c7ae291cdb2d9f1ad3a1360531bc503c0b4cf22c96fd1c46a46a8e8bf5b2a8a3016c92c88ae2703c122148ff15c3e27266bd8b032ae193663233c7190a26318d16f797c3946d08b23277c36ca625be476b832d57d708be5634bbe3f10703a0e20c8d50b97c1bfad8b274686763cbc0993eebe840fd1687afa12809fd041a89919cc0d21bb24fc659d38a490a5391f165a03a684c6d7d420a0d328810d0f9a2c6455f36192f1fcd1189c1fc8d29d08d0c78669705a30e16789e1f287c45f04542c0f651eba2dee467790dd0b81a8c91eab0363be05a11d8ff505c7f08878e23668c91ae1df515555124a7140d2478328e6519675c3c9fa8c59133455333ec875e4947a48212ef687b1c73023b474254dec8b825259a1529963043cb3a17826332a574c4bc90ba1cd5ae3926ebc8d8a68456a12471ec5489ae881dea8a22d499252b1006fe05684344102d0f8449342c0f859e1fe06897c23433f605dc3fbc3c088c06a3313e98842bf62d7078665ecb8ec58887866570f06cd91622580d0a6b1206ec2646b58d293c2c9fca37342c708cf6d9a2505e81f1d20c8690d6e0d008579b5fb10a68aced98084d6ce0ed1c364774c5da699349d3d60095fb382fbc213a0a32b47027bae23e96513f222b3a563c33ca95c701d8f0688b3afc1f2df2bf07fc8dcc18c878345f98c8fc6684a8c07a334695a244295a7af22160d1afb463c88d1ae344df1b2012425d10f40c661ac3c8d08ccf3fe0c27d12604adf928fe4a159be098876d95f809afa15332a042a11f4c543c902555a44adfe84687363a110926d08903a864fb22d7104489054eb42245ff00a3091cbc311be348d8f105b8636c924935c766522a35318cd1cdf31fadcb0e0929f23fd042c8a602b2846b86233684699a3431e44646f1307a120e2452361e10b2e75913376fe0571e4b73ec8482d9db136e34a8fb07648772fca23b7a812f93467144d7d4880982e3442ee2e2b1165885c425b491b1b63352603bfa096a249df02c885818b1f86c64b230a767c889f2130d32d687ae1440e03742e7ecb08d322beb87c5ecbbf229a76296a25125cbec2cf1a33183d0c26264d316387818d8b229539591b4d8aec6c8b27020c44b121704cfdb734d84075f31582bfc4eee90fbf63dfc8f9226f2d243d396ff00627ca8b4fa1f9204e7ee2f71d9d13b84204c411347585351153c9277154fe06a5a94fec9be1a3062e168645f1682c0f1ce2b8c1d4406f83a495ecd315a1f9227f66521d10644cc7a134c669a4e5e2a2ebf708d87235cafd54623c980f06106c66c42ecce849381290d53dd8b80668bf247c8e6507f11f36c5b1ff511c9a933e858c6a4786fcc766ccfed92e0547cfb2e7c0f48d29fc84920b05e3f61910d8d91d837849187e23d86517445c09772d17444da6598d964381b4fe06343e1e7862c967c24344103c04ad90cc891196c6848584ef3cc05afb43d0d7084a84842d322e0dcafdb155b64859722aa321e0624fa4fd5134f05ecd32833c9f0d8b2cd2052e620937343734ec7656638c38a3f6c3bf9ac91e496c2cf78922b63c4130209b9c51026d146609d369b722ab552d40d0dfa688faeb899f627c192e1488ec9d0d9825a7e5f566895318d93692c34f221b3609b163c123a3019da125f66dfa110aa6fbaf8e3a3098ac731cc470f891b12441216042fc18b7268fdc244164d79a455ee21eb88e2c869a52e98df0937c14c26dbd70d0c5fa8fd6181024470d70f284dfcf19f08d251ec8a7460fda329a0c8121cc1234fbe25bda2903272a702e5c4588a933c0d5905647a2f220d6bad958922ec8fb124ec6a2e85353a8e0992eba743da5f60d0572f2fd99986812d878cf05ed5a86b629b231254a14f2ac433e7ec63f22f8d0f0237c37813b189e1fe67a42b922860e29441e991226b9641364b2a05bfc6f48c610b8b1997d1faae1a171870f0c953024a213f079a5e04342a8b6c824fda1d79e46264f0404da2545215a1f912999b8f9f4d0e723c8b95931a9868acca165fa43688d7caecf394437b88619b4745c4c78dc0534b2434d05af0e8ee38d511e6d90c8e6ccf4868453f24e122b92d53f65cbbb0b693f048d4c4cdbe1e4591b13fc478e7031e1a178420f0bf91ff001cf1f06b879164687593ef8ea6867e91fa519a305c218f04dae1221de4ec9e9166fe076a51337d8a92a13f046382fd92613f0290aa63cb2522f6e0d9f637751a599649959d3d177dbfc04a7dc5e3e5e87d2d0a826c74d0ad0fc062131da5c0f57ef3e24416af92942585095b785137b47a1a98d5c218dd8ac36570e2e77cea3d9a1e51a1e522abe3b207cebedd8b789bf0b1afe86fa7ce0b84319d08eca187c978222dd0cd13d989a64e11181c7327fdae8c132305c494289fb47fcde07899e89527b7911bd58c28b760aabec47f6c4ddbe3178a7d943ec20202e8900da6114e7e10e5b6df0d042fc8d5a47416480b45c77e543371c24742c8d8cc98f97c3c70f96b424b1e04268c1f2846a2426e18b2644e1348ed30a73dff006537f1c5c91b06049c65cac319d71a225e44acbc8e16c8b134bf620d495020cffb5d12857ae29d8e996063fe1813786276d74ccfe3835de4ea4dbf6889b509fa0b42b6a45242dba44d54a1a32a6434a0ea496dbdb33c53e589f190a535c16f875b27622a94efc4ecc8a669c9d70dd2e167f07c3fc1e06e4591e0c6118f8084293433640dff00a82c4697f85c61c37686c92f889304370b87ca3725b99ec8bc414f8149f64d465a8158d40f8e4207144a91b24f622c8ff8849fc2251f624d2775c35535459989ec86a6f6db43c04a38a74424915a1d68a89c63d1d2168d1921a3012a6499dc8485cb381f1b923a3fb301d48f44df17c77f8c9343c0f63518b2cda2b3f3fe487e9c77c316c9979907b32eef0e2351286ecf9e5860602cbfc066b8ef890bb0c50b43b437154e5d10f94388c706657e0777474410962a08a3de96d8ded8843d7b207326f06747d2e1879bb0b8c921e81ee420685b2f8512993c610256fda8a7c90d46f9855e889cf5f02783b3687942fcde495c3c0812d0f8d057f27fc987bf184c6cd1931a5f68bf6240b4f91cb2014e11f238094b67cd1884362164ef860fd89716c886fa37091952a8431418d40ba428834a13ed70746f8c2249e145817fa10e0361d4936012c8fbf70e49a6dfb30b327740bb051cf422387424786164e33318c43523a5e90f2b05b26c50394f2d7ecb2bb45e1d982072ea42c95f5e12239df09a66c5c322df81ac91aa6378fdb70ff017658243e818b0cfbe29376c459819918495b18836e085c365a137c686dd90130762a0d8d267512843c70c3f2e54e457ae072b4f01e8da9842f32415ced20740cd4308624b6a2a129d8b725c36e20826211c9a2411ea0d5bf43c9027032763447b264314234fc0a234b1655ad294256b2b42d0da45f0c6927e0df19b922389e3ddf0e4591fe0e88c30f12ff562cb95f9b8d3f0214f610bfbd7ca0874606baf21328c4f8ec7be2322d1b109071e469818fd8b3e31e078136349cf418da852f425cc4a58c12a66c658955537093e9650d9f4d39d08a7abd46e5a8f9743524e03956fe4473aabcfd13285716d31b434272d0312bb1eab8c88369e06ca5c7f2c4d2a7bbe19a149cf04c0b47c89b157c33c119c2fc47c2df3df0f23c09cb48974c8886493fc8b3c49043c9b12607bdb3307c08078f0b8e6a83a7edc16784276c7cb4e10bb27441fc82b40b21be878b19608e18e75164521c450c98d84a48074db67a28755b7758d90b562ec0d9e283ca3340ceabc923f2cfdf81956965cde1a90cc892b1adc4084342fd0569743cac7cab45486ebada48f828d994765fe426c40446ff40f67950b83170ff2df1889b810b925e330f024ba3674746c6eff0007d85fecc078090bf1c28835ced244ec59368626cef87b10b93a11b4cb516cdf1286e9147c48f03395286e2da5e0b0c5a448af7749bf0377b9047f3905c3c1093b3af022e86d587853af4552b1792ee364336194ccedfa6edb62cd101a7f63141bff009490880fedf81903926eaa686a86f63e5a43c6367dfd0d0df4f3c6dffb2293112ec492bb232f406fd95240b86c91733ce24ca31b35c04be61fc021e79d14bd27f243dc54608416385c8085918b06c9249c8b03e0771a26de24499e84e56d0872291f1fb71aa7b2cbf033596964c9354bec5b24fdda2a18343309ed08fd604afda71be52351f294a83296a5516f926a53151f97e4d1836d7b1eee10488f95e08d5d3397f224948ca794489228d7db84942e3749b3ea407c6f8a0a682ebb1440f28793459d193852ea89495a2d4314d76b1a8450863fc3475ce0663924d0d4780b71fd446c837c345f0937e045c160910fc098791a942c7e0d3e0f4356664c42e9496db3bcf06cc397e8518df0987e8654b6539881d66b1bf3e88c4da6c4b54925aa1fbb2aefe8235abff6102e4b62a3626eaad1eedc0dca7d6638332d6e639b11a8060a1a4495e4fa89baeeb4f41012992d5a0f074736ebe25bff001e032c0c8a35cecb4a251d2dfa884548cf91f0b2868486489951e6488f2153fc1b3d9de893596a8644be989690b93c0f4317e2c7a33e2b24d1179bfaf3973be13e1abe84f831bae2d5c233187b2e1e848381b46c63fef819f722136ac351594272128f06269e86e1af93090f03151f010f2955653d903a1854b95a10b1f4a203a469e9781373a49fe810c65a34ebb5e59602f35531865110fee212a5a9bee7b1f69512b4fafa1ec3e166fd8ae691330d920525ff0089114d148a12bdfcb1d192e492e4d28f3b1b397996b08ebd11109e487e523ca9582a738558fae521db0213658b593341efb763e665230e0c120a9f864518c561b6e2740b4d0f87c17086cdfe0c59e1a1e8cc58e587d8813cb5cad924d8b4323ea16c4b67b8c0e8597c183e5114cd2247d8c10f46c63c0a86d7054324e08886781611b622daa1b503510dd26e88d76a1e1f17d4645126dedb102397a644bfc374cf61574b54982b88531b1a9876f029bd1111d8708b686345072883c042b092117a5394d0eb3705c8d4bb71039ac4e0fd15afad7e0009b4881895a2c92a449da2cc7f681b0a912bd350caa28f0682891980f03fccf06dc890c7aed4907b385c3e1689ef9155d33344382363d95f8f848d154352e58f6540dd90dc43464cd0efeca97d919d94168c781909432eab69ceb88849c22e5bc924325b162fe45ab23a1e52c0e25fb24d1eacb2f797fe03de791b69a987a31cd252e304938d2865a4352fd926a91dde4420974434aa996b2379896d0b233afe0799129e131bb2d0551049c269c34d7074e9b8147943cb523f4a648a60b22eafc91138a4313a1fff0004fe419a7fe994f70d89fe09875fc449bfcb127c6c353c88d8f657d4893a3e09c090df8246c2742bb216791b8f24e64794ac9cbd114f6276233d089ed7c843718d63730d414d9a855aa2acf4307a6d1053c3953623292a49ccb5b23b34ed2e98a959c3371ec53bce53c3777440b5838ea4a4e1a83690c609cddae84b4d0e034b6e123dab632dda86a64ac836211eb343238f01612f03d2ec75183e844eec2366e609792e1d1ee858171ae2ec5cbfc30313013e1560b01ae1be26cf0015cfe0f8a54470b22844a91ecfd013e147178e5b6603656e363565f64a506a5aa1bd49776257c408d80c3ed974f3f0d6d848dce7c40e415cb1a1beca9c5f392040d582c97150f1e9ec5cef6bd8a652367faec6bb2726cb6b303d1377e4a71239204be09acc9f3a6e57f3453d9336ff00904086b32e976445586bb281b0cb0f81e9150cb23a8f1ac22acb2c3124942e1d34ac0b44aed3fa3a8f42e12f8a20d0509945bc54917c9002c5b1eb5b71bb2974ac58913a17e2bf04b8666a61cd907f18b160b826bf09f0b13ef9232b8c88af922f894bc640b49299ddd894ff00b4ff007318d3ec4e7fe5c2f44909b43976f04e88b1d458f950293c686c67e052a3d0db65850387b13231ad913c34c6eb0ea8ae7e84b8d080cb559b13d74aa5e8482469fa69ad918500d5e1bf2292345e730949cbcecff49927ad0617d44e8b828865b5e0c0515acfa1b39f0cef61a774b04703d38465d12b56cb97fdc31833158a7e11920b3f41d0b4bdd2fb219eb4dd5f7e87338890ca9ebd9ee0937f10c3ca4ae514b7f1e0a97310e30f8c4b9494bca24cfd8c95ab1da6b63172afd8775b94eda15962fa1bc831fa984e862e31c3fc597f12fc1d8d02762242d9e79d91795a702f7f6288e3f93835af5c74123ea12ea78a2e9f0a3efec69fed64b5f70b6bed186fb39c10b997d094084373fe8177df1c55d4a9094409485d205ca04f565ef631fb4a1dcacff48f6b75d32fb3c322d5424c84ca6f26420dc9abb5bf651d929f1e8b4891d67c16d3dcb63b243c25d3527f47a1471ca3526877745e25d3640a589e1977ec45bec07bec2dd711c7efd89e8e287f926a5015c4f8223cd4ec79d0761ea3f6213a5c45a64822c2df66d08bb49af624b686d8b1522136efc104883878082a96d103b9276d6845eb666bc042410a125c1b5c4f0b8d937c370567f1f2bc1a7b3e31b3f5210375c2248fb4a2a6088ee616f87f6e3781fac8d5891231e5e7ccea5030ae50c8a2e08aa849f447a1f411147f18c46987c45b277b2488d9ff002c40de73a6da13f20fc6453a792165b90e5523a3e86df921dcfe834aa6f6c65f7e7a623fea92912cec4dec44fe929799260b4a8edf6513be2c849eba590a7a4fd1f4c49d6d6ef2c35aa8b1e7b224d37c69e8793623cb1592ac5d6dad9d4d90271245be46c74650db4c9ffc846c44c04f2ec8f1e42c8fd076c5bfd0ff00923ff41c335f0eaddf61ff00afc72e980a30e18dcb2fb13dff0090c796a3c084a64ab4313a11a7b1fa886ff137ca0809fb0c387aef86d212b2242385c084903468431ed0e07ed0f2242922602542df0b110864612d1e14c88cecbc949b23ae67a93ebec72a7c229d54c5329ad210d093a4f06323285bdb46a292ff00e484395d2d8498c81760386dc166a69122ea1ff82353c469c2d108c140dad16c72c4e8af166549396fd8df48c5bee4765ba9b4cab0adbd768eac0a4c882caf2b026461f8b126193885d1cc492285844650a051c3b0d328f1422034120f8050c84b17062937f7fd8ffa06c7a1f2ff00705b1d731ab31ec2b2484c37c7dc4919204088cba09d0d8f689c0bb90a2721ca742c0a6630e08652c756d4be40c8e96ae0b42f3b194e8419eb444f65879945d3ebd116d8975fa15a5f4dfc898c98a8dfa37292b05026ceda840ba799ea435e1e9b9ec3986c9e4791c8897bd484ba27935916bdad67847b1fdd844f2c66bb2b7434c36daf320e60879fb189fc09f6094da148f02b4e7688253d89b65c7e7d33bed5a342c1b12170f86522847a22964be38209912b23c9ad8c8413f619be4dc1a34fc2fe13e5b0f84a836d121cd81f41e21335296c538e231c0bd869040ce8995313434686fa0a8c849ad0d36b02891428b0c63c10c400c34699e4d3990da91d6c917e9bd95f713539f998e6e1b7dc874dba88284bc94fea8498fa18e7364a6632513535f9aefd89eb598e27c93a466b49da4261b6b29aa0a9926d8e10cfc88bbf62d396e97d9e85d5ef34b9d96ea4e859ec2c2e55a289f4597c94d6b1440b3a104c59c0b7169f832687913563f943da08a924e79374685345fe1040d890d244c90911d31d19f7215fd8dfe58999afc1e0743074f58d924d13b362f41eccf038b5497bbe09d29fe235613f42b84fa1f43027fe2226e9c559c4c18495a4a24c9245afd10655fc14a56fd8ff00f41f5fa1264daa17ec61c3048ecd7f05811bfb7dd0b8ae93e4a7023516b2f1d0f4770cbc091c6729f7ecfd2a37c8b633f05b704fd8d274fd0ce906d25f46c7711dae99a9609c214eec252d074f0b76330a01e8d081859476be4b7bd6d3a31be89d2f02e75294a5e8d6ead613d21b4322a98948351b731d094b30c770136be4663a63f0394bb2924c6613a375026a8ddbd88c6b650406a3e25f00d0487984d764ae0ab0519b7104a70c97e15051afa4512193c605cca886848920f0a3d081070a4973b646c90562f93c86252be86d29f478c118437b0df7316bfbc58431a7e0cbfc0f644ce7e1a1e555fc83d90091eede4af37a5127d0da28a75e71a1af25955a2352f23a4c7db1660ff012554986191458dbcf8190d30b61278f53c2e87eed6839a4cd8b2fac09a91e23dfd92f3b75b61bf43c7b2cbf04531730b00d6a6d1fb3d10158272db1328ea06b3193d8a4bc922266e04ac9069a37b1906b2604990ebcce36205841f43f1c4bbdcbf18f9127fe89b2ff004ca11c56ef872da874b7e4affb85fed0507f616ff31090e540e69aa58637d5c377f860f4c637612497bf156b043244911c4f124f123648e86b1c13243cb24b2ebf11f1a3f73841419869aeef26f640ba24b2f67d0dcdcbfa439551ec48a10bca3af23f61b3d0866957d03da4557c087b94af02d991d98b4af3e91ff81d25955d2376ca4cd5c3f23c4d6985513e7f7444482751d68c4b389397bbe84a14c862344acd496b4209ff00878499b6ff008110a156ec9b8f6349afd8b553a488fe6894c45065d1424ba1bf4884e11e20bac78df437e49f50ff00c63b7802151026d0656d041082e869fb24df0b8b42d6a2491c23f122190c911f8244ff00087f86ee582dfd7e220ee093112498b6923cf76dd0f2c86bdbbc968096d2ff00b0576164d3eebc8dc26948c7afb16748ff0080bf64696527e3d0a4a41f69d04cc42cba4f8f43c95e916bfd13ad073fc42d6bd5dcfa37bf9d9fc8d899ff00e644e91197a7816c9232fa34914fd8ea58a6ff00b19237c5653d118b093d9119ac3634b2744d9526d85e31a13f61bc786462f22e7da045284a5ca49251f3c2e27cf0d0b22486478192351323cf0863cef21bef12509b1cc7104108942689e11e13f9411e4a2571b10cb0e1c9e8997e4935d8775ad323572a7caab8f63e47f206f9603af313845e6d5a68b5070d26d06e540f332872cc2f0613e0827fd1aaa86e0c4b08ce50b53e047a5eca784c53bfaefa913af53bf096c868d586c5356aeac43bf6438a7de5d410b28ed7d3d47d56874a1a709cf911bf92468f8367504df8dc857b441a13f88cc51e59fec799ce14101124f17c4f092789289e246c6e98b04d8993c32c7ccf5a7139e150cf0d8f813a436fa242e1b38f0ff18e1be1a09f04866c3c988b8c18d3e88f9913fa34efd98f102484345a93b4e3c7944969b694783a1994b93af0ba19389df828f02a9399dd57ff0024eee943e82bfc93b01ae987ec1ce0bcdf6caca6fa4469236ae9bf414d3cb0c2ee3a9d2a878a76f64c0692abee7b2f0dedab2ca3239bc7a7a1e58110fa14d9d7c88994ff00d08d027db35f42c6742d116c5276cccde78ad2b842e208239864323f17863c0af85c347a19ed0d89fa46c4ff00042024128e304fe31f83e1a1e78630b32f22d738b3f4074cbf0fb158178fc58b74257c0b0246470b4b1a8a94b14cb7b20a25fe30ba2e985224394825613024a692c3c9a019511e50efe487fab181da4797a1342881329293caf6257777e04b020642243275e4a3a772c48474b81fc82cf04ff369df09e6190543981ab2cdf2d0c25cb165dd24b8542389e1c90e4becaeca289f048f9d3cad1b12b52877b208648b0db2a89431b1ac3c8b95e50fe851ed21af91cc9aa4944134e6cfd8e6c2afcb214b1cbb6269556f289d44443f434539a14ffcc8f74d2072b69c0c4ed25f427486089db58818863610b52618c11b43162b26ec5ec41aa076d4a1665a529509c17f0644609f68b35fc1279a24a36b8b0bc0a25ec59e28811e487d97df30bafca870312fc207798905dcfe05d8b1c409228a2388fc06d9237c1727d08747a12c4d92250c525ae1366424c5079054a9e85ebd673ee05470f5fd9226a2dc3b7f7c430bba2e21a8f424d771038d7bb4fc8e6bab43926dc2b1d2784fc0d490dfd22ded87a11b125334fd311a38c2a2f42d3a47d86294dafeec8b49e5af68da20d38c4c9133623fa193a65c323a4cc083f50519160ea227f19e27f1b9238358e170f88be111a99d88dfab361107c92513c4965f0d10411c21089a4513e082c865ae28ef1f847216ef48f3636c6b6410be4c9107731d3d8baed8a4a1e27f17cbf6214d871b158699a34ed16686dcbfe1ec84aee532cd0ae528b11a664a57c649abd164c70c07a16903c331b7f716c12591e9739aa12394497d130cfc094fd10517a15e454c4e7a49e856cf6598958bf1823ff840970dd8bf07abb688be27d807b50e2b8925709e246c927897f888b09a25099248d8c70edfe01744a3b51f62b68a86ac2718d0e523c878fbdd25e18e7d9a69521d646a5a1bef4c8f6ec6b1adeaa20d88c67b18d75118ef22bf90bf89c8ee7aa92d98eb196cbca44199214d6cc60dc6f7110a72a4342f0f0a0d76c4121e616259a52aa3431995713b19a255b5e0cb58425b698e5e828f68d058f642a69b484acb486bef14c12264092513f8c93c411c366482a9fc2a3b4119f4312bedb651122c0d7b5f62ec3ca21649fb1f79e43c8794f3f0a3d8bb0f3881e421d9d396868c530f07c21ef7f119042f175f1c2891a37b6a244884b427bd9be1f54adcb20fd65c5cf1e62463d3722084868f28492c2e5251b7b6d1ad652f91ef58742fdc2533b3286fa6477d58b03a659ba2811012e48708746c8e24943684c49c27c709021b3b87c33dd87c688bd068913a12f4da9c8a3e70a4044bf828a2beb3ff00388b0df434e9f4757ee17fef9ff2b3fb8886488f6fa22705ff004227a4482d3b8d190c8287b4f8f660b83e3fb62166159286b6b9430bbb56e70484509feba14ca1d4bf10a46f6c0f83238930979763923fea6040da6937f47fc1dd9802189e9194c09fc05f296249e90d2b8541761cf0255b132d7d37d8d0b0839f62bb12e177e8b6d2766c9d0afd296644d92a90bdbc07f535426a6764984b1b8da1580c4ed089b5741abd46fd0af39afe4585523dccdad1d4fa0d77f42ec6799f287884f73c021da3ca79513d89eb84a279ae12218f3e431be0124fc22689381b57a171993d887e002bb0884d94281848a072202f3202486903a20c85107b0d0cc90b53130e58fe44f09dca5e8ea0b8fb0c2c6713d5c59ed964f88cd0354b4dba647b65998b0a4e14d42efd8ee2adb6b73ab61ca3d3d12445ce3fa40e7afd3f05e18b34ca8667fe051536fa3ea42e71ddb3e84a5eed6b62dc065aa3d139c28c53941349b0fb1bd96a976209120f89229cfd52d89ada3f7e687f4a579194453b0aeb5237289ffc3206fc9637c0ff00c57ec792bd1a562ed78a12ce27f0287fc47fe8b81ffbdf18d2a9b1ff00803e06e2e0213dcfd9bc0c3a55f594c4a67342c8dd122c717478665f44b47c2130a946133a1df1096921884c9189b26b8217103c08a595225cc8c51253d18ae2cc381642d4c7d93abce4ee10e820ad8780d3295e4a4ff4328f87613bcc0d69ef0894b51f3b0396abcffb509d2f5cdb2ffce004d5db785826ad733a4889e6f84d8539a58916a53b11e215887ecca6b7a87d065eb4fa4d8d241788d8939ab6cc3a66dcf898efd8a584ef9e536ff814083f76e84271da63526bd9fb9c48cf67c570c543c082b1f102a64546262461b7c10860d0260d864a7be10aac8b34dbd8e6d943289347621b85c62168f1024a9314507b2fcc1fa411a5f124924cbe084c92491ba32e35ce8c062ff0315c1980f516af0a46d0df1fcb04a6fa6a7d40a546ff0080e492645d4f917f67546c39e9d4b2bb9109a31ff43303c7a5b1084830fd0980b0f0f414928396bc929e063724f31b6b71b1defb5e9320d6136feb42cdaadec2123a5274d3629e42d76765edcad3437c34d6ec8ea48dba7b0b52e9216cc576950d4f94399705edf01215f02702e0b23249e16441234212663c880d2efc818bf0a1f4d302300b074e7df9fa6690c8f241aa6220a19129b27a05d85765243881ab643e8c4d847d09a08a1f88b08315c59813781467640fc363a20964e8fb16a1d06965a148c64fa7f6235635a8f4cb12ea52f02c49a9a6efe09bc44d26cb1f645054706e2892dc6c7a48725c7e075c62764136941c93c21e041994e68c37d1967e05021c477d126d3b16c4dbe44f3abaf2781720e5b7e1b2ea7f00e84ff8307fd31015688dcab94353cb1724b0d91a4bbe035296728c09e99fd44349c2e48d886c91606112290e46cd8d1f17fc17787fc87f0606a83d0e34bd14903f406b0390db1c9e6856646ddde86fa24e5003ff00c861fd0242626785a07b1fa137628301f5786858f2a48ce48b182e0cc58cfe20932d2cd620ad0b34791332a65139c1e0e9bf92c94b4d8e81b6cbd0e9d8a14312c7b497fa294304ff00a9523fbc98a8c49cf7316a468e62721e3b2f7abc114633a0d4f130fcff00e90ea74d367e49ae24d0ec6fd4bd6cac6ac5734a1235aa9d6d762d5926a07f41dda43ec35a27e9d4c7945b179c0f2435bd8b92165ee05025381123cd0b01fef1330fc245c085140d921be4f7e0c16df2612462491be2187e4611287cfe8597f97f2348c113f01926a093051f82083b19162dfd8a4581ab2ac211385f4557f40ffd489408bd18ae0cc07bf34fe9905d14427886511cf5a884032e4e9759ff0022eb68892e1f685b1d0f159bb2ebefb44c4c5f9a8ec4016973d1f6274835376d92c011b7daeca5b57f8c48b3b2daf6407926bc4f651298b8d4efe06d0469adcb50caea5968ff0044d039477f02819903a9a64ca67df81598515dd3d213ff00cf63b1fb9ab5fe0bf290bb6a7762ce4e9e903c2d76926c7ccb2858163d2264a034bcc54876a0ed04d81e0327024f216498bca39e9915b0eae532c6640b2cabfccc3da7e80ff048f2cbcf813131e8c80f9fb7fcf392fd084096a1b13d895f94987197d890865d315134409170d4e2c6a6492aa736d97fcaaf1621fec74848c962ea77d93ba314dd5d919830770cb4c5fd022510cf49d8c97a521eefb2f27b5a97fe18db655d4d3e01b8f3fcb7d096a6988d6d8f6a7dc28c8932d686b098da1036a5af02e474e1d9b2c94d35853e8144592307d13dcd61a19eb975e6048aa92e8529c85cf9d9060eb662fb21265e0897e6479213d011b48ad3d5987d1fcdc316222c8c904572820c458e5287f80259e19fa8330fc2eff33096a2e11e448ff472db2c2a194f5099248b86f08a4f2c21e0701a7d82cf0f84db468611f2982e0cfd3633e2285090993633232d889e0789ff0008c74b009d2d8ceed8fd42224260d87545e64090b09e45963da16aed898c225c94c8ad5414fc74c53cb584f745e71e6f81c9a7291a76415d0f81588960f0f504c1511b2c8b78463120b4679ec859d974bfd0935daff5871b38ab6d2dfb3b87de51864684dd781ef7a2b0259bcb2284fb3950b96e205c337c18123c0f04a55d278d8491f383f4cc9f2191384217e084a50bc2e0ae0a8f931f04c42636590a91264324c6a1b34443b246b3efc7a5c1e0fd46394373ff00612a250b27a7f3862cd56cf8140f093765681cf746c9c69b1816a1a5ec52775ba3104c891fb43b4e71fe047e06cfee5702efb137fa52c6c3e1a875b6653869dc0e9d484dbd21153230fba49c961f8f6f817246a34c1b54917a3269258ea762b94dbfd4aecb17b3ec441d5caf4f8ccf05a49d0b277025fd981fba3631183f6225f80442e5f180b0345866d23063c7b0257cb42c2e1f34779885bd288146781bf435dd1fafc923d31e498b94f1d8f5c946b863278cc7b10f5c0cfde0944ecf6581e2a7ff008e896c6a897f57a145572f57b264a04958ea328e9d92d963708d2246fb3c00536246b42a70ded78212cfce6f1046cd9a236140aef2a17c4caeb5d08114784965cc1727d1d965a51991c27426742425df557fa415584ee3a1a73a5ec4d925fc34dfa8992bbd1dfc8894b2ab0be7d0cfe7ca94cc0689de9328487b7e8cab522cc7c9f1a3127f21809706c3e678dfe1465c4eb35d930fc386372df262e465f9287fa05f601766c852e9724d0ce47e80df0b87c6d8df0c9c2c70c6c8e66fab8e8fdd0f841bcd781dc3374ad6b6c4d5c32ddde46c687fc4242b5b1e19b239aea19fa917b87a130436378fd46c763fd40da48faca9ff000222ff001718c8dbecb81376aeb8d6b5a8fc98a0007412c6d5dd9651dff95946088cfd89a6284b389c321b3b225c20a08428e4cfd8d3fe84cb57c22f98cbe882a33f2fd888b3191db634b2b92281da82553d8787e11e87a3f786f04d05b306366bf19185f86b9adba0c0fc421e3d050dc790b40450745fc6916ff23df86458c4c03fc9891e07866fc6b863c8f83d937af8e8fdb8d3e4893f62a5028aff00a117a4de9f8256942e987991de488ba3784c6d34a8987ff03c8e3e92fe82cbed8ae7a91852a5f48de97663c3ee7d0d2ed393f0372276d71eff00ec365adf73afe0864b11a5c766fd8ba92357d16a3c8803ecff0047ad906332b9698330bd52ddb0a44e47b34de9973fc1213ef0e9f8bc89b1bededec437463755c3f428544291251fa1f4463d236a264863623f9c6bca873831e1ed0d8281e86e891bafc5e79c0cc433b04fbf87c9117c457e2647db0942db19c48cd7fe519df0464ccb86218b1f8decc38597115c31e47c18c4e685fbc30db804bb2a8ed3b5cc21bacb79f22ec12c15703cc1c6923ca8d8dbd134935d8656596d9a1a6cfef1a4a77fb12d081a4be850a51ab7c8911d128f9c98294a116cc27b213821743135290c11ed4254dedc1737b1f025a597f363193da692f424c0f4292047e0c05b4564363b8363035f9941a160c8369d68fe672f968f752bf0318e83c192f81891af83cb3231315c2fc4c6377c3935c31e7919fc9c509f5899a3693276d8d1e44275e5bf43aaedfa203190c98dba1a14cd0bf05b2d1c2c07234da4ed64425be35104c7d9291d09b1f2ae0797e3ec5605b6e08117fb2359a3b08e597ec243943d5f23c707aa429d18910693d11093c31301e38926c9e731708ca48b30f77e3a30fb34f81fae22498c4e3b1fa5879c95f670ef86c63c4d0b963431c588f63c70f04d9972c9ec3898b2af063ad6d865df15fa2b714efd0daeb995f034ba07ac7cdd099e93e50e962d2361c9ba6b222269496470b312f9421adf090b66cff6224f4b17232e3e82d4886ca9265f45acefa09be501a1345fb3f9060cafea2c21867bc3d8bb6cc217a686045c6eb8f0392611cd6512e524f3b8184e8cc0f43508aa1fe623ae1ac4e0d5409f5e4c432eaf255c413f43c7fb4796780c68b19538e13b363f4b8d7e164bb5233647d9c1f0d8d8df06267e5cd8959939fedc79d9da81228939e1e988e13913465fa12fb388ebad61f255dd55fb288f27c8e716296fd1fc424330477ed1784594b15c05c51132b29e0637853e44a111867906952d20710dab2792e14c7f930b09dc0dcb4364f8916846581e98be655e476424fe479e0b08c478fc170c236b87b0d2fecd79310cc3f6343fa17ea1f04df00951fe2859fd111afc13c370f516e2c6e1e78b26e9078261e09f223bae08253d3ecb268703710978fc10d325242662ff00f94a15b94a7032b1cc7fa8752ba1d869ebc84588d74fc19db745305d7a16c52847e8310d4aadb23a2a439359252e54f81d933f66c5366970d389fc1e78595c399971fd7863121922ba0e2810d3d0d3f095f5f10e98d1a187ff000464cdf84d4b3218cc3879e0c7a3d097373166d7b43129334f5425f2448669655a646450bd3c1781d1b52f92be87df0938385b5ec74a75d7cfb22a4e4ee0bdff0081da736e7a411ad7237d234c619ba094af3d16d1995b3b910da3897b61e0970d22885a6fe8a50bba49849991b6529b395d52cc8de903543592f1ec51fcc85b5a6bc0f56eeec171dbc91c23a4d588c1172197b52ebd8fe1864f437dc2f6f2bd31c41cbd4bb2833fe4241c524df93332afa0b430e2f9dbf6761588ebf01708d9b70595c24c0eb6e7f5e58b1c2ff02caf2880879523cfd1f798515e10ff00670a26bec725c043e0865887be36203fc2d980cfd15c282209eed97efb884d2be1f930cecc6adc5075db54ccc4c0d332d3c0ba2388b5d48f283fc964640542d3dbf1274558a9b6ac5b3eca6c479153092a768be57afdd63b85751dd2cd8a716424c4037703cdd08d34fc9d053ec588d4e92b56965237147702c3d06655be4d4b766f5679518a46df5d08309a2ff94790f0e83fdbfe02d1cbb7e0ab525c39986784d23011a3ae664f2cd88d3878f915106ae85c2e1cfa18d69e4542684cdb94f2c3aaf08fdf1b6db93398c9e170791b343632723fe019d98719030e0b8c80ff0050a494d1f996ced2e2c67f2a534fa35154e134dfa172576cfb84002373ca7b5f2372d170de0247bfab3d4661a02a8262f5c14179cdafc86945d0f6efd96220a95f47b18bd528e916080d498ea7f4162cfa83b95b575b3c4e06d8965b36d7631d33a0f60e6db9cbf1f05c842482f965646ee915255f4843183c5c26343f66423665c1f2b92e4b80a7e413cbc890a304ce084c560fdd1b860a7ff1e46cdb67ec8a78cf8317330b836a49a83a1e78d3f7c18dc279347e8bf08916f76c384d979fa1ebb26752212a4ecfb8a46e949e02f688afa368813e9b12fbca3c44f14ff031b3dadcdf6d2f6493ef1ea6bb75fd042f12f3b19154be592c6c6121d57d43c103ac99b1f10d087b94d92965c930140bc9a918a7388e1190628cd398279d734bc8a82dfb62258448dc7d9c11aca8608fbf86ff0004b85830108d063dfd197d9fcc21cc8a2ef0270a32176791fca12e2d67812a409d5fb21c2b704ca287b362c084324d0f879664c7c1be1f06325f8598206466ae218f9b29474d8a9d32f1f21252e0a710b2612d958a43f702bb8396eeac9be545f6ab635599f905f93497da4f102a05b9042d485df693d7a224f1ab27f811fa7da65254a2d1fc2c7db5e45ba63b2e4a477c8356991054812a80b6ee11220c89ce3e057c99b47acb1756e9be9e28236453ecc6b5121a3ec39531ca1dc21a734b29041d86627c1f17c4f0f1c96b86fa0ba79523681752e0bbee6cc1e8c0c18ff5184110b9e28982cb8e037c210f1c278e366d8b1237c19231882c0b5f23c3b29a72556b68972d29f70af3fd3a624751ca36279aba30ec6a50e663c131bf1d982b8156745961e905a06ad11875e488ae56a7447d773e8ea6f2d2c101692f429e87ea47288e84c595fcb62fdaa9ac2f023ddab5d3621305fe264c0897d8404523f56d918f3e14e2326a7a8d7a266b6265ed855050e42d721814fc2be077d31cda1ff06435c2fc046d70869ed6622245c4f163b5c64fe8606633983dff00445e31fa860684a633839ae1c70862c992b62792465797c14eb4c9a6cb7e8471564a694c7037228b7f0485ade0ef03b5761b3d9190a8dafd2f0492a47be726b0dc2575016b5ff9fd9a9f12db445f954985e4c8a9225bca5fe4143ca0aca61bd330141fc7d21476e97d7ff48205da3b3c9099b385c40ecd4ed3fb08348a89497622516e64b6dd93cc2851da2b54f46459ee3d185ca8331d1dfe97c8cb334a3c8a28425976ca0546f237b4ff00682be410b63714e1ec4e8791a1d1435c31f03085c29d65a1fe44fa86bf081fe38d2b043dcc4ed0b7d85f444c37a31205a1e0fe6152e170e3a36243243e1be08cd8cd70830f5cf2a78091418888c6e8342d1d3a2d289618a3028c2e53b319b2d74d0fa96f73a47133575fc081345575d7429939b87f63d612adbf81817209b49b437a59867e05b7aedba43243135722903cbd10657f0038fc529116ad9d17aaf64d7ec7c3ae9dd550d8ebcfd9271437ea049e027c5e095a4b6bdad11c3a7d082cd391e4404aaa7c7c8ea684b8f484c76aafba12a7cf9b321a86e12698d6fc8df654b82e56cfa1fc4613447102884a0ff688ca27d23fb8585465f43509883d0c07c16863e1711286440d591c363ca1150e2876b7c23b4698792f248f46259ed1289685efc8b7fb0872692eb3548dc722f1c47f4935861b646a7fa7c8d95f807426b88dd03353e9e3d8de7cedf4226e7943ed041369994b4a48505ff3448dd54dcb848fa826d6431a486d3bcc0dfa72c2f5e4709fc1f2252297b3a16d355f7a44532de3c8d32713a23c0bf7265f04c552edac54851f4118d887e33a451033a409a4a1645b8c4993d84374e1606321ec7c49d0989f1a1abee04998f42189a2465f2d7033f6e76fb0b2147f11818180d830f61e4914d71b18b970dfcf0d5fe0ef87c7f96314cb42d5b6e91284efa221491620dd5d25f80acb2ff648b23bf2322d51acbf430935ad88daeb25da1798da8dbf03ee7b5741f2eb185f6fc07a9b98897f96d945cdafe731de72bc0a5eff00413d59443d945985fe67b002d4f62a81241e53626369b7e981009304b5444f0dd746a07bcdbc8f48491525fc8573765a722bf5945abc3f618e9364497050ca5d244a9157630f9e189923641899962bc30c583256520b3f22ab9791187e24018fcf18a3f59893ee43991678f11ec608c3d8d8b8d70d9a204714fe0be26b84a62cfbb8a787fc8ce7704b427619c7a1374a9bc610d9125b522dde8bc55f23ee46431b722e5752289ad4ebb3ff000351730bc659248b7485253120a557575a2205d48f220efa74d931df4f7620956df2bcaf6244375c1ffa2b71c86fd0fb434c7f3835498539d45945b827b7e826a68bd5a8491bf89bd109b9c674249606332458ed319444daf82f6d35a9258814fc2109371324f7fdcfc95a41af47f91f61aa3a7d09086784ed13c2136891fe5256f07ed88cbe0e0f84e0a42901419fb8ff00bc4a079657d466352307c26fd891606301f2791197891b83cf0b86c829f91a1a108d6e412a5ba8be564735ea4e17f441ba4df4611fd943d9333119ed322a3b0fe4620ae5bb42e1dfa422ff00252846ded048d2dddf509e265b7d9d0dcd1751ce3f270c8ad6d44f00cefd4122c1f273ddea88f11f94ad7a1be9d88441615af80500e26976fc99a2b87d0d18d92374eb63b974a18c0cb3fd0f49f49cf81054342c134b4a0db0851497a2a2691c9cf2f2602c7e0c5c4fe36f8654d8464ab9352623d26db10c5e0e86852330e49c969b9284b0c8c118334321b42e3431c89f126f863c0df05c2c719fddc6c29b5b51d34ac187c8dca491532f665b7f1e44ed14ae27b6f51d096022e77f88ec8dfecf27928912932c163ecad2073813d7c95a763e89958725f67816c9c4dabee5708e5299ec9ff4758b9254aee538ac8a2afb7843b8dc4947fde8f3b84bee22745cfcb5a4c530d791d0812c034212cb32ff0093d29cfd0c2f84a59ed03d0812b0e69fe8ed888d3ba1c12ee9aa4426789c9f9b9ded05ad12a64df639c063e19364f1238989f135c05fa46603714475f199325a486cd4c40ccaccf488a76fa6399f03230e0b42c9918261f0b031bae51b648c631be5188a6de5c3a14ad5b5bf08684e1295edfc781f00a707b1aae843665089243820366531249493eb2c5e12426927e4c31e24983109cf4841096267e484b5f9a46d3a1e84d20843032a4c2f92f2a0a5dcac8d05b228f5d96b71d30b443a4ee176bb18b51fc43edca465936a6813b5d723e119173cd0f62e246e8793d3e39375cf623d8769f008222df01feb8b907f20c7e8cc4e8762a1e61744d21a3ce8449086a99a272b9d8b0b865f8c8594bd9f66e189c7a4b28361bf461c50a884fde79442fb6396bba10c6d2168c316b96e3895cb46eb425cac12231deab962897432cd1d08d07285917985fc048b8c12d59c84297978ad09056292a117812a1784f9f823e88bde09f207ecf3ec7bbcb7bf087488a41b768c48d61c90330e24c843c9970f3cbe68d8f237c3660c6b1adf122fc0e858afb42c1c06ca7e04e59e4517a071670f158e1a932f613a5c42b9264bb164f9d04c61e9c76e0665c6c3187dd9fe47be1dc4367c31ecaaf6a7ff0058b0bac094ced34fd0b235cb61eae6613f4f254e35544d4632095c54a98704048c6d294d1316164d56d085bda6129e6fe86d6fbfc46cd759781b4e5494196e694cfb1324b0c1388f0642f4ca2329cba358f634a7d959458efc4f7861f9a4bc8630959e80b9e127d238e439365eb505275b1b30e60f631290f864923b3b1ae042e0c6304ad19fc0f86b21246e96c624f93e2193f6930647b660e064216b1a8fc0e2c7044b1b460c0ba90a61209e204c4c4e47a9e0103e81989d0e6c089a920b5c3dae05b4c6fee28086a524e5bc09734a7c90d6204a0bf64d11b2b0e50a81d92870389de4fdca63fd83d46b33e85a8d60257d03ac5bf92709cc0a63b424efc0b84243442998e17ca92287ca23b1e752e6791b2dcee13e488f9159f1d6807da8447c3631a718c2398881eeed8c34d6ed11109a6425261f2fc19e5c184a210458d389638c38372f636382291924ec76ac0a5c2d9390af6319b2fa6514792b14e2350e244dc892316b46c22492445b254ba14490871c607042210d16b9bf7d4bdd817013b567b92e3bec5ad0e93da7a2ed88d2587785653ae49af913592495cc2998124b968b6359b74387ec70a71bfb8a6eb95751d92ad926d74fa1af452a4f42dc09949e3d37d92e1d3b1edd11b80767ea5971a7a5c828ca5617c026d0492dda80914bf412c9da5488aa9b1269914e316d72fb12e52a3e71fe4818d46a5694506a36c4db14e461ee4cb2303e04a6e26cde7813fc30b63c98733f58d0a0914474e07928c26bd48847d18988c461c3a932783c8219c8b912490288431b24592448ecb1c8e497c4f28c51b8f1ce444989ec0a367a1e4216f4cd7fb13529c14cee42d6e3b4ec6ef474bfe835f43916cb1773240c698b4adbc36c412372d2c3af41be6c69444d3ed1e88eb29744a1b79c882523ebd081528917eef220d0dda0fecd768d472b5ebfc8bbab74a7ec2bdb51699d8b57251b098be2178a5db1f18be2be890cae8b0fa1a742ae888823656b30f1064727b434915a24b2e147d56364f0f412dbb2889301d795d6c60574a5fe58ea6d4978233fca9b069703636a464382430575c413c2c3509cfb78bc8b087b124a71312874dfe463c14b1f1c739dd07951887da10a6c432e88ec4793791798d39c90c58e19279d13637c892f94c791f0c7d9dd1dc4e0d46edcf7ec7a2f53a637acef7bb442afc9cb69313e3a9f31f430954d594f03641527e136571a19bc49351639b7fa19049291fd84e25997aaf0915a4ed5ccd0ff004e35279fa1472ccff1fb1329ae98e01625170597efd0c43fe95fb1472ccecbff00c27fc383a8c2215121bd0ab4a72dd46ce6141d16fd13370cedac6f6f12d40fcf4933f4fb1441bd3ed8b6f1408523a9e9092f757b1ec8258f42e19190df826c964be099249e62534ecfdd3043c9819903443cf135aa1ef818e122890cd32893c3a2dda47d3989b96b818a4071c20bfdd8bfda9e3fd8f4a7d932fb890dc8bb0b6b3bea44e6e4a7d8fbc1cdafb2d86d09988fb3c4bec9f429a25c235ff807feb852013036e4a761f8637c5496d23ba1a4ba1e12da9246da0dcea2d57be0c2de7dd23fd0b12df4bec49074a3c3d8b05bf12b105fb54ee3ec42470c3f81b43b22f66d146f2df45f8b2b2c219ae75e1d872bfee50fa03527e2c62abe7a2791e9ff00b8191af047d8ecb74924fb12e741e5a22b7c968299067bb198c63e8ec9aa5a7689416cb5b14bcb962445a33423e8612b07889b4319a523960f4311cb4292b7a125e3546f9d182194166263f6854327a08f82427098f621ef25207fed0ffab3d1f9177c5dfdc5bc04c39b50f4287ce0935a2854df93fcb834e3ec3ff4c6c2502fe63b4c14941aff00d88bfd869ff38ee5181bed09a5951dcc152793b210ee1088632582cb4c4488ddb278c8864aeda090d85a782f6d58f5826819cd7e82fdabfa36348e7ea4e476a2518daea2ebe04dc9596d2ec40a2dcfe80c1aa277620a0ec90536dcbb63a27d9b4f86291a0784860aa7037ea7d4d0d69218d84a48fd665b655631f1610b722437f61023d68ffcde41414585e68f3c7c0f47e86181a5524d781f9fe8f37d053ee3d0a006e7865b52205c8d2ec805b9b00c4cb226791c658428612b2519333c937c75794399d35d1e211267881710ba1f410111b14a9b162b7c09bb13b64b2436c6fb0830e3fb4363c8300df6c917f71ffa23854ca93b7d1343d39b95a134282fc12ed68416b77da9c0922a99dda157474b4b68161707af92f379222613bccadc4d4d6106646cdb6d8d0cafcc9137a70f43a8530f68875371ecf0ca3d13a3139b31fcc9b39d370c7befb1153ccb73231af919178bd786fa13d5fe79ec558847e49faa4a126282ac12d45d73c71f505d7e317faa3fc34607e8e22c0b38990cbff17007283007f800413044eaf08608c384198cd20d44e231fb7c4cd397fec3ffc400271001000300020202030101010101010100010011213141516171811091a1b1c1f0d1f1e120ffda0008010100013f10bc2819cd13cdd40010aa9d1082a2003ee371e279659f2200cec14b90a2b76db89352f77c400542de20703880bbd44aa6d34a424640e04059e2562704b889e52e91abb389af8a305dff00c89b3e16a8bc1d9515d5ea3689c4242c65d391c4f0a833c43be3842e3e096875380b95ee243e0d08455e632d4bb2739025b606e1e206d5f7283d5d7d192a8780180c89611a4791d116d40b204354cb03316551f80e6a07e4d630297f3f8300420b47e7edfe4a266e2d2ffd67888319dcac47d302ee112d5d429dc245f50bb46be26197072e0e152b8a570f10ff00b0a13b1f10fe033d4d244aeb6df8b96552019195cc164320a4fa86d9b12e81115999f912ccb9a58753b0f246e2a5aaf4c253c7f10886d4ff00b4b2d9e615b729c1d10b57a6702b8173c30a9058a729d49a012b270cac864076387d416e5c7795414fd12b6fafc07921dc15d556df5155ecaf3620e9c4709da36a56991e185551d10ba88d33913884019d117605b195bf83a6129ba8606c8f03863598afc2a1a871242ae14fed8d0bc10c296cb23f16c1b57ee14a92c192fd5b2c51a7c2ccbdd3a963ca9c288a9a32a547bfc182a967b2149aecd80db23d442a55637703ee33eea55382c9b471cc58cdf8835cc951cbc4ba0d7302a9fb4427bdfb3210a3db110acab4adf96ae58c174610cb14c5bcae6e2694fcc2007ac4222dbc304ed2963ea3ca5d9f117e30d901c60073d10abe732d246ff3104f1fe12e689883446d8e2c05e3a918e20f28b991ba92b1148dd129080eb186459c210a4c14b545e592c50572eddb8720f68ab2b756752cb06514634b1b1060dbe7f6a096aa9328a843f6b056880831d9cdc347ca55dc389850bb928c28e0788d34daba99d8b790a99e61ca5be6970a9f30883f868b89212b526a95c87f3f12a3b1e673670996b34fe2356190c396e11bdce2eae3e8edd42b6640f771055cb1a10f72a15d9af3b11a39fe32ab5c2ce2cba01aaea56a615dc50fe2504311a7ee2d536973963af023162eb88adf57f239e1ff009440200516a717dc7623688f314bf07e452722116847a8fe1194ec4842144f71aa810f4712dacb29c29fb8be28400bb828263721cb36e726a557b8fd0936b76128b48c176dc108ad8d25a4a08a5b603b0669fa896d5966e3c1f04b2a60dd04c8578863405d8b524a825de096c77513404a67b05e91a238412e99ab2686c02501f889f77fb2025d3c3f7360a0aa7826c32d5b61b3a40f18a1fa19b4f3612d10a69e4825293b135f1147eec800d7c47931344737c4df60ff00b39be4c9b134fa467dcf051f1fe5112d88711ea0a33a4d13e4fc07446188fcd72be8230aa97908c081cc4db7320389fb9004a82c53e0392bc5808d6fcc20953929ff0050b53ce928ec33b2a10e3ee5e7db347b984c106d94d825d4ba09bf898967caf8976549c18a4eca08806f65a6c5565081a6546476659b443cc80bb200a1346186cb0e645babf564a0835210aad117de00cd24389c87630d21d883497bb857338fdb4426fcc4527713170efd4d5ef534c5e22057b205e19014f8ff00561b651646a2d2c04e80fd9950df5850173411da58793cce04e1a956b7e60a1c12ed8c79deca5ab895387dbf009953b8c3f0055b36fd4e7f5334f51cf52255e22fec547da115ae3f1b040e50aae5a976c5a268cba4260136525ee331918916a2e0ad4e8945e27ec9a2671e58b5fb8e9281a3a8533681a02e8d8e1e6a051f1364abb8ed9e2014dfd4a2c407e26605d4b629b018809af31556ba9cb114c6ae2c76fb83cf6dc2e1b540b771a32298f39197c7a6059ddc639ba2176ede238a278a7bb98bf99c1f9946ea5990993077cc347da74d77532fc4acbf9b957cba62b5d54c04217fe690accf78537dc6f2e3c436b6583386396f7044654a9872ecc7c4143f3f878452ea56d7e032ae1b12ad2ebbe656a3b48fb04044ec5fb109736a097cd4b289d323d33dcb03500a80949454a1b9f7385fc422b5b07191ab1e4321eb394a67cf10e4f772bc5bb2598876b0510b6fb9586cb3d94c994a949da152d6d800cbd35357f5303285fa88f72052383e298685e59627ccd27898a086065003a2aa12f1880576acd3736edd20506f73a4eb2f7260d3d6c567c885fed0219c5942d7b0968ed85d5f2a777bacb6fe2c7f71811e20d96751a465a2a13c8feccb81501cd3dc4c2622f6f32ad60148db47cc70b062d3f8068610692cec8a5339545a84f300b8d0bbb2706a702fb9d3b14c7f325ea3a738b21a80ca2a3afc07eb9d0420eb1527dcc09e7888db34eb8730e5d07b48087ca0fbd4d78b3dd852aeb99a4c3c7a954a54386d46141738b84b88e6227821b10d9f6a803e442835ce0fe00e77495f04ca903a21ddc02d117d5c3e911fdc86b35fff0051000570ac21b7038c04b6c7720d8439b10edc598fab967893e7e7fd992f647a4e4b9f46e122fcc3a30ee222726cc9f913440cbf90e000a834b751eb18b849683c84adfd9088022e4b530540d09d62e4f52a1d154d60da846ae50e2770d655ce18793a2c22b0583dc48d1571838afa6e8d098ff80a858c09fa4944bc7f48ac7c09ff0071ff00132c0a3c9b2764814259050658a72c2416710e7dcd0bf32f60d39712bcc49f3443944f31c454f94636720b4f24569e62e50800a0579363c232cd3dff009476a701262be23562c2f18b56be27a424b4be1b302de897e0b592a07dcbd5be088df8a9cdeee5c9991f5130b94a7a15c00250ed7895037a622d29bca986da7f088369ff00f409a6156626ddb5ee4009f1d94fe951b10bcee6cfb487ee376fc13390079837ea044be2068a82cb17167ac1457b858c5a34e6e59b2b9659516960e12d70e5c265f12aaa76cdaabb97c4055b361bdc948793fc812f10c9c402b98ea037716fc235e71a3e2cc2657dcea068f882bd866885b20e0bcb98f32aa9c97b1bdbd85d19725744836ab60dc2adcdb63db61452cbd11521b64e0a279ce316ddd65cb98b708a6d5528e1a68cbc69aec3f905d6a43703057a8af358992cf5e25c7e1943d702b0d5a7ee022eea825af51336234b950170dfc2caaabd31ecb1afe6a5141e21fed717f2148023584e2447ba73525557cbefe21d69c9e62da393dd54af4cb55caa3e212869a1f42c6b3e2709f31c21349fa8622972ae14a8c5841b0dc6d6f70bdcae6245d4e61d65a5a2c2b366012ad41c7a8c29f7806fff00a961a476dfc860ee52bf6c04e7885e842b0835fa85bc19fd7e5a3845349757f60981851cc23b06e723e6216f302d67c40d01b034715a4e672baf13aee3a02ece6135450e1ac20af0d60a056010a31ee036ea1bfa61423c4410f30721ff00e52b5c21114fc04a543a7dc41ff8b6383c96205c3498ee0d3096b68d5c2b438b8e0af593013d404575a7cd88860732d56eae83c115ab1d4198808c190108226df53d28dc96992e5973346f8a845fa7f4c7435dc4b4f989f44d54ac07a43892a11125364be27c20a9c4eaa36b25dacbd688ed73f02a04a3b2975ea2a1970b16b166649c9101eb43f49447029a8e03cc68c616f8a64bda4a7dbccf82081ab226baa886dc475707ecfc540c47357150edcb301533f86237c5ad4e06b9220148e01d90157e59601ea6d80f7106a811e986c6547a25c25dade619dda972eed6a1af098f880eee56d941b2a8bd08b2f4c6e482a6302de1925f7782fdb02a17c6d20b38d97a5547c12cfcd9dc5d29da982eae9051ba83cae32cd699d3a83f0b423542cdd8633482554a4460283b84f19c315e61f316aa0d0e847c9d57dc6943cc1b2f61f50a2ac1c183ac4a0604eb5a9a3dd42c3b0a41b8da64bdb8a82a12f09c6efb8b94cae61c418f09a2616f32e9af51db51832b6c1608d35d07ea2e6aa7fee350733067889a3136051700e8e118b31e7bb8b06b83fc8dbfa829f49da109b8c7aa15144396150625f52d55e25ef77d54ad03ac764f52952ae1986a3401118e58c0bf284a12250d7375168e013ab7b2aa5987a954ff00f5515470427eae56107514690f11aeada465ae0e6d1df48813bb5cda329bd2e60bb2567d03f7d4655ed07dcbb88008dc233b64f70eaa0c78653123fc8a38cbdb201b2e233dd30e976b2bc32c48febd91092f8fbec947c660e3af30a20193e1970c3df30e12b12833b60948d223a6a71058588cb64b2a5459164e93f4447178815f1cd4f36ca1a5dbfc8086032a9b510058750b95cdcd50e8229954347c11611bdfbb14c03544e23c8c429f51e7155be292f98d2cc1159ee58eed80a60917e88b4f51293aa634e5d10a97b4b2ea23c5a6c1cc072121c30de15df38f517b1399e44742cea0d9f0c61ebffce1b2c8bdfc13c33fb6190442c7b1fd585a374ff0620b8623ea2b43bbce73ca7f325f55db30ae0c24e4e7690ca579630427aee69300c2184388f6e4c02641e4ac1f630fa06254e1e608daae5258de3cdbacd87410637e61d23fda52ae37b8101a2e2b478b88dd0cae3624069052e3ca364d97691d557e1a09ab1f102ba780991346448fa99191dbf832e1bb26d5a24d88abd22be61d5c1305f98a843f3fab1464d9c96095a7c4588f88ec6ceea56848915a36c9daa32230da9c1e2553c611a6b7b6c345ea022d6845d094b6ae2800b2f257132c805fc905c4fda99a957294a81b3d4348e9bf92a2adc7f5340f04bab788e2c4a132a5df60fd5cf1b0b5399cf2859b95409457dac403b105c28cd43a8220c002e5ed71c0c14004e043705815c473c8ad713e4dab880f817e07b94927954b0f0c09d5a74f16928c98b2001361b379eae08d1cc141a86d418dc622ca7b8cee8363cc6db8fccd27e17629f62c76af2d608d99a0f863fb2bf709d2b01fc8a6b2ff006408cae4ca60a2c1a6d4d7b48560471c2371c90aeb650f8a17b28a65c4f357ee082af106e9b870beb189d3c110d095bfc731d184acdc80a23549d9aa2f082ecd2e15c00b81369409299e24d82dc3b093b39cc5c6bb96313cb819b41c202b8e487fe1f5135d215b3398a42ac751d3bc5aaf392cd36ad4f111616e46ab7d201a52c456af22216d417f2a7e8469ed63e6d8b01155bed088752fe415458521619abc45455029f44b50e50fec885fb21f2944ada1485fb97e845adee353d2228b8ed950542ecc82a5380949c8a9c9bdc2c463d6441b8f3087e290698477a736868cadb16d74c6d1c0440070896510722b19415c7022b59b53402e24ab82143d4d844a24a7633fec41288f4d43c792015deb7f8deaa0b8f241da4cb221697e52a968c9c95317888177217dc360a03e5b13c087311b2eb867411d220689c57c5c00da20a4166318ff00dd90955ae0863f08dc11af44b1f76a8bc7ac7c454cd8808d136d4d42415ca1fa8b004a5bca80dc4e17bf894bc75f54bd36adf31b845fa60270af24bd043616c35595c25e38cbd12e6ee77dd6fc511142d806a3d44a7ffe0e20207427d90e14f129d710aeb407d902a1e12e59ea0b6196a205d2690b0cb263b9c9025751a185bf008c79c828948c2f158fd3367d4e126e13d19cae35201b8f3fe92a876cca610df9887dcc4d1734805111599cbe13acba14e51d27f66d6552a4c73e61d0cb727088d2c3509494ea68c38225f0f37048165f6a8a2cbc03558ea01c1e59426975032e2f8a8552798894f045a6a2b8355aff00fce110df0112c3d4548b630671dd3e6550f6a31bd87b816e1692056dd11975a23b1051b94a591e5b4b174502ba456b3cad191aac1ac742004cc5272e23a603bb7997e2dbd842725559dc13d08a4d4238b10e900fc4328fc96f860b8e541f98dc22bf963ab18963efc46e3c4dec3e18552b92f538d750d4c41c3db0ab0663634e61a4c523120cb5a15f8939c03af93f714ae80238fe2607e6245f12a7215069f36ff6655fbc20ca14d857fb8730434a2efdcd6c98872ffa8b7e1384584e57feae0518c0f0f0ce7ea0e28763d4ca32157fe4cafc4b6c47498117b0d16b44e603e61c5390aaf4153f6440a5e08e53ab8cce4471bf5392cee36acfff008cd1f48f06fa9c3b1791cc499866d2e169299d14afb32680aa90ab5d518e442a3a671e988319abc6b1839baf9f5129f630d27b5cc43a33503d40a3257b416349828e2fe153921bf750095f12822fb67eeb388daa39ad826aa4367a8443c89710358e4f64566e2dab4c8d8407578489a7d939a69b02f1995a9a501115134f10bb1aea2e45e60819168c659066d3b3a449972cb8b772757b8bf44a52e17988531262152b9086c4935560af8a57670a28550195f24e47c4e38ea673ff00d36522b963b244e16cef91d282344203ec8d5a84e1b00b5236c3005ea52204afec4343554ff7258f82270f6c61163a8f241cc456e5fe3087d90fa704a51aace25c5d9721d4e49619b098c0089259dd5ebea57477327e2427a7bc0ac863f464abb74b744acfd203a25c8f43d7dcabaac3ee1d65295569aabcb2cef8259586c3ce96aa044d7db47a0b0bc16ea0986831edb9d4566587f658115d1fe4642497c710e52066f9fc756108eed658cbb66444481c333206ac0963638614218288c092e850507bb943acb729c2180d2d435e992021c18f11b045749a0a7b808770347a7f4105c915ff00fd97f0150df89d884c5e926c444e503865fc448097b65794e1327e2698968a82fb46af6d3b39844d3b56355b5250bfa22c80a56dc088a9715c973a93c8deb944c73c13858f108375ca3263c28a2a5265cb4182a544a5e7cc50000768fd32e66856fdb2e4552261a4f4a2f0ae93f4644af0a853c139e0275096ac257043e0c63afc4751c9e7d995bcb2183ba829b10792d4fea4464dcc8a9a8eef3921a17ccba4e0997b2852a26d7539c31a0102941706ab554ba2f844afd46c64a82a3aaa7023e645c93465857a953984c1bd84fc758012f446aea2cfc52b991d977003f126466826cc7daf6954cca639f49613895dfc25242a9a31f914dc025f50c158af5ea200736640643c6161015790d9c9c6380776500762a3b43c44a613780a4759dcc458f5ff00dd4aa378a83bea9870a1ea75735b15b6005a20fdb00767379ca942885b3c4ad95690fcf546984450f6eb76023529f2391412e5965b6e278552d08831e4261150da398a25105352f1097a35551fa4565f6372527a4117812215b08b032d19976231f8fd3cb1d167dc6ce6105d0647ba8743dc3842a9be6733d104b9a96c7549c115025e731b45ccc43dcaacb4c12a5c90c36f307123e52ac3d4106dce51cea3768ea18695ec86326544d263440c1e8603c415bd2082a66703ea3778dd455f07e0456e1c10d23dc124141c53a25134cc8b44aba2a56d94c80c5433e836656306a0ded2150f46646969cd43008c09ea302f948e0430c97a7931fa9c9e2ca8627315a98065681910dbb5efd6a6496482568e45cd83c8cdc1e2c81c30b1f826b2d5483a25aeec2dc43008b4c5879dd7305e9046927a1a8cef9d0b2317d81ec10b158606f62f34b4911ac07a86447556afdca08c085fd24f70201d571b288fefb51ab21c98ac689e27f8c3ab8b88b831dbe8896fd4c6341530b90d96288a93903978b8d644627d4b3934428dfd45e96fa8f70a0bfe4aefee032412fb8fbe896a01dcdf11996a4ad2ba6501cab9fb421a1902984b52061d54ac3003ff007645dcd10807bf2b63b17ab670aea724a231096abe6e1add48b1a00e95086c363aff00f2128d87bde11c01e4823ce5d20c578ea0407dc2b050d1ff00f298b4681184c963264b938d2a25b1a6aa3cfd3708aab8fc45d36e012c2aa8062683bb88189208f07ea4465a95aa58fcb41ba961680f9f087997e8cec951e942d2856a073931a54aeed7a4a002539472de01e9e18a169688f0562c8d537129c29662a988f70adb6ce5733cb5c43c5983ca2a5adb798a15a8dc0d51d50d4af50bb9d60ecbbd75297114126ca897e60ab18235509d4a89506f4e58f681f92a95e8405913ee5004110e6a65c6846fb2317a11b853b874ec97c582fb3568d4d8c92514db1b4ece32c63ca2ff00cdd4a30503e2100451738132d2e8586bee6218444530792009f5206ab57c2fc328e3a78f314836d1d93ce322e5d8dd810df3c40578ff001957b56156f962172d6caaa5e624c142d718abccf808852b30554f20d47bc2df719b799854654d24f0cb546b0f018ee8bc1615f246624b03e49496ad175e36594be9146d27981573ed41f2edc5631752d22b863d0acef4c8204b46fe3654e969e161a0a8f0cc1c387c410f9fd5707720368ee732f53846e113f4e216437c4790f231c346051cc0c2506c388a7d831ab5362911f4b80bc772a342ca1285363fc9ab5cb6a77f5070c689102a596f98f7713e7c90891ddc08084fe4e04a27d41fbd2cb3ff00a259a25bf42711f5357d4bd4f11cb88e4da970f48d5197365b7705b15ed3e13d1872a28512112ece4e3b803c63441acad8c62fdc0c957a8953d4a5a2ad8c54f053e227a837f30911ec94017e53729e2a1753a969351fb2a25465120bacd327db0fbda44e0764b352943c0b1a2e71e28f0432b62483e92e3a1e2fb81eda88179624b01b409d7c91464c2910d8e039625734ea0399635a33db2bcb8421fd9512071d292bb3a301d2a90f3b832a803dc2cbc4a833a85736916d084a4e16a58b34d977c4a52fe0d54ccda21f80aa5811eb3a44c840e225c8ff00bc551307088b6771130847f06a52257e62088d7b815fc8275657f4803f82c87b45631e45c42c1e27f0404b85cd8988b59d43ec1334aee15575b2c14584b2acc145b50c6102f6c57039f1080a1d246d08b39edb3f819a4fec10bceff53c83203a5f295e2114bab1070ea5c16ba1f572c2b70d7d454360400f1128f95154dac1d88be43c3d2247556a1e635a768170f48c7add44c3b788be81042301a12822be2502e2e088abede2e899dc2c10aa9b012a8e17610ae55f0fc90a8194ec164a7a8fd970c03d0fe0dd07b25163442e052e28339650842891ab8279d671e621514422c2eacb2a5ee301ee5cec256a7d3d257c0383d931a468b1512963023f302f39fee88add8944e66f5068ab9c2e27b63a2863bdc389a4972a72b9070cb6c5dcfdcd2c04b30549ab8842d8fb9628a257dc59455ddcd355348913501bf77350951baa65ceeffe8893c8089a56ecb2c67ca6ad85c7770b21616917a830e89480a0a07f495e04547d4604ce8a86fd96bd0459cb53e6693c9821ac74456c298b5a8710bc71c5786003571a40d989e62305f41ab2c01e21e65a9ed8360556d654d011c83950d8736c1a3a159b865ad871d8c741030e09802d773814149f5389ab87082caa12054a48a0c4c2c5b032703028f9942b0142a69468d8addd7f9c08700b0961f11e1637462383dc1a26492f3e880e36a47e60413ffd9fc35fd4b4d04dc5e0e6901d6e28da3d4b23b7ddc1dfb97194540ef10057c304116b2c64903da2165f8803bb1df9969771973538a6c4828e5fc157affd92a0e15c9b7ed30a1b1244b0adb1433bd3ee0b5974aa5214ed0de066ec94964809abe74f492e9aacc916e5c1ee18dc8ff703531972a1986f5230fb45540299e08350afb1603618f68bb5442c18170e8f5f825b3bb9adb0b3ef094e0abd104dea6fc9d7f0654000fbe462bc4361c6a1dd40a3225c74c632a5eb3693a8b2239182d451fc11e0c6bc43b65fa5ec78b80950e2745318486de70862602781251e7a4f05032e3b8b9ce4b20fb117afe3f89ad7b9739e1db12c4bd2661bdcdbb18d147a5d8342db7327c341db389b8f6dca7b511015dc8481798c16b4289ca8387a48e9fc27f20453c1055b3454d97445918886e9b207cc5301681de32534a21d44c19a323708963d43a6471042caac553d90cf28107a219d641b6ae0b448d32a72cfd514c10dc42a1a238c948e217f94557d116df791844e628b0855e636146b2df896de308edfaf897a7c14a5007823d0e66af11486b386cb85d794be25c62f995b6304589947820c8e51d40d2f64ce776fd45a7894fe42998d8ea5b40cd422fa4319a43fdc377b19f372fd1f810121aaa1ea0b626a4e40725efe48163503f74580ccad798e8f986c2356dee0b90775cace68abdd88aa1c12f6a82c45f2ec8a91d240acdbc42e97671a58992d015952867afea4cb4664714f11c49360ca2ee47b3c1f49072ef6fd100f9ad9cd2cc03681edbe089b27862eb8b4f6d99c3ed98297745116c59401388788530db91288b514eec6ae14a2f908c117d931808b171e8f98c69d99352a18f9b80329287c6428bc5a4f2798e28b59e5eac4b06e05cb17be1539d44003c47d1c12eab1e255c5e689eea6cec03565a8c117228129167eb298738772c4a631ebfb416d0cc7e884d4771ac2bafc054038bfea45f3a55946cffe0fc15546c6842ef2d32dc421c91c77007f66d09c8fd4a22f932a56c02d807c11804ad7e59489485fee1c552235447b6b226d9435efd47e25acc8f70deec60544a80751eee9ff0039407c90d3e12b752f690a48bc76313b6dd28e011bba92654bddeff5a90380fa2907040521f440100902e040bc4a8e21afcd4420db016cbafe242e8dbe653cd9168659778594249476a07c8387ee08b072fa9701d4b476f7b0465c0d4034fb3e25ed6d8b378a8d7b7fc1d9f51ef722d26d915b70ae34aa638613425f095cca848ed20a08ed4a53110f552800e2a6a86e689a1739aaf48abc0c9c49c525c7ea1a4e6dc2d0ba1e880f9743a6e57f7f0014a7a88b7d2e6ccec0aee3abca09029afdc2a1cc7b6550f883fc84b4679b62dc54d6592887d4ee2e336e58b27195046a04bb4a61e82a014c09db971a8764adc75debcfd475fa4687d453dcc0492b691431d7c1888606fe4c1c1500415cbba5775421eb07bcf352cbd8b523444c681ef89e28b3f12027e16d3a5a3bfa041e23b5049669114d09825c5c21c7e2e71b960fa22bad3a7cc4b1ed8b8684c48276971f29d4180bd052e2ca59cd11f69696dfce371af93790e33b9742056d8f10ba703f54a2df30063d4efbd438261154759e5cc21f751c95348ad9d37f2088f5072f925da1174ed8ad4f0c1a9a5620ef17f09c6ea830a3bd1fd9fc0c9b28979a2e570acea0fa9207f728fee58c1a83021e6364f04c1694d8e25428a5e66d300d4aa0a704020b1a343214952a13d3134b622c4224b9767f842b47c2c396430771af7965238d6b01a612e28dd9c7903c5c4621e769efed8294cbd58f9e925fc2017f2c8e16dae60efda0f72bb427fd421384f67a61e4432960bac4fc74b023751ecfa9727794e414b0963107e812fc723a4a8bac4c13c490d2ad4f4479de1949d84d546d7d31c4ad4b7c757ee2c0a3d8e9a2c2a477775049f4b8a612a5bdc467063e2585771720eb32a688a185dc3be8cbccc0014cb12780cff38ca9e2789dab1ed3062356577159154d903631781fc9e6f21640acc4a209cb1589ea2407fb1f17a65a3cc5833a08b98d592cb52ed42f63cda45db537c401e1a75e6688be0744b438ce1e9d8ce0bf3135f660184545207fe6e2090b544a1c02cafb4a4fa3637ceac0ba85a100a050b6ba7b8177bd2518b62a32cec6897dd343689cbdec7109ce4724d8285ad20d3a9e540c4d9781c919dc5030ca3902a1b43c289ba2d6ce88ef5f305308bacda8f26c0e2b438f895d680f51a80d6d46ad91278e004a9888ed0d405694d64522aa4f5e51857b51df1e62ac0db0ea1e62a352d52bcc3b944036183f32ff0049cb14110ed856987795290e09e7459fb9605056ca55daf079d447d6205d4ab197534e8e90f98cb1c1113c5194ca85d6244145ce922173ec418d62a22c12c3e58b493922a0bb527981fde1b04b46e215aab3b676274b7bc0a6640adb55a31c6110a98778ac75c4cd7fe086b279656aa11780f8aa5a74acb42c55c3fafc4fa231f319ab49563f25baa72ae0c6d1953d03344ecebbdff2667fa49cf5a05d442412014abfea631e6dd1e24406c4f31958d990aca4a4ea5442a3104a6c08164d370fe023a786535e022ef4ada8424e91ec9a2710528f1881b393fecaa7a43eae279942179cc9f66c32a87103923d20a1277b189496a6073301860789dcee72c35bd312c2309704457446445b1bfaff0004d21dcb8970fb27f5c038ff00f6a2cfaa25a0dca78f528d88df88cbc1bde477897eb168fb89855ab304695e58e3e71d18a9bb885d361348b18d6d0b5ba97e2106aacdc0d8c4e1af1551d0aa09b7d8c792c7b8aa823c9ab3d8e897f2daa58895cf5476b7e0657fae5f87dc960dc1758df89c53f2f74146b16ae944fb04e88da102a06f9f292ceba9ae70b94ac85ddcca6ee01953698b1f2c13003e932ae798a642c011c15e51cba9566485a00e51f245667d1d19738ce608e165f0c161ff00e49681b3583790855578cdc341b980f37e0855dfa97d1cf24b0552af840852dc80a346b29f32e21b7c4e590dad304e44ba8370aa62ec3960d6a2f31e58c1ac7f8bb527043d1cc7f7f96b4f008af23e9280cba44b8e3f0a20172ff06580f8820855fc47517336903e907f9f8950950be9956d1283e98bcdcbf71a36d58030298a5852555e47f6f925ff00b0d4d2173c91272f3114f3f6c0b39bda946e36cab1d9752dada1fa3b95d76050f588bad2144d7b566f179f46b737c97acbf242899d341a10993103e2000cfac4c710786386134057208ba688803abe844fb9d71741181f7d621f4c14a1ecbc454ea25a29e69c29085a8950b763bb8d708a647a3a4976790c3f1024b032ef2691ab751009ab18179711a0b94e444f6839f8570a16135ad18d8161f161e98364dd77d32d8da46d757388801a4f1375040250a70b0f3197e8f244a87d01c45471c4cee53638da278404e99d4cba844ecb9f9a812cc53958ad4b2ffe0533c9a84e2d9a8c5d8d57e6511d5b5fa996ce890168276a33c3a9d0fa8c162af9264fff0055052e0c77d92c3ea61114fa997e333c45570ac8c5c3cc565203c32a2441254a2d880d70a63a0704cc695b169f6467b8919dbb8e8b8f4a2586f12b538ad94d24dff4a94fb50267abb469da11c44a8d7bd405feb369d6c135157e4185d482d977a1ab5f7043c1d7bf78b11665cd3a7911d48a5f2cf2aba82c1658d4c3acac0177956f27c450062b5fa83dda1c53aa75f708bb3ac470762050dcf68d5a3f337fcf10531a7e6cddaf12445fb8f703f6ad4b769645ad70f3259d7b82fd5c9ce84329121388ac915a3d460ba9b39f70791e89b17094ca43a78bf3049129b63d89caf3ba436a4d2da8128b7cc4ad416e5a27110ed1ee0664f32b44d295391605c3f399162b5f52d686883f51595e440f52c288b9c75183df993a21631d781b7f4455e1116c196f88694f1054b4aba627d085864970efc32a17c2699f13943fe221b8eb59acc82f716f6d0c9aa2d18d4300435ebaabf507dc2215b51cb060fceacd14e12043ca047ed2f8422ee80cfc1c7c96a4d08952b8bdef1091346ff57b65fb7774e953811a9776008fd43c05b4f3154288c13840583391efb09722acdf454422245844a3d546ee8158d44542c8588ad62d7a23d7e9599b29b6d7176329580828b7dbb8553630fc3121c016f3441bbb63e618434e204366ca46dd592cba7a96ae41b6a48806b55f8273064551a58294e08856789792d670270ac19a52f49f3928dfe3a46db08f7495cfa923a4a5c536706177150bc0b005a557fb15ae54a1353d93b7c33a475c391f6d036b661784d81a4257250e2763dd4a5cae60a1b08393021cb646d825f83961a9048ab1558d3b85762e6905b829d041a0f6c6a846c5b48a02b2fc766bc68071fd66e3818c1822660f9a4dd3b7a63048a9fbcaca9cb0d9634843d22d3c41eaa82f2ee60941c79c5425c2eae3a11493beec050b4fbb897dc92874d77150aaaf99280b003a22cd59529c10bb6438ae19d4a3d458fd350cf0dd9efd911c512ba481b390209298d52f05235c1be13c338ae27984d5894c1b07807b8168f092901b71f882fdd081ec61b05f988ae3e22adb140b4a511bbc836ec6ab996d4621071fc5a2fd111b11d416e5188f1e59207d7489300a962d938510805cf65cfd29ee7895d3991555a4a13bfdce0443f584ad4c8f31e1f715787707186b094059b7154ad531ec205ef70a8636f8693845f0c94a81f470961d7838e09692c44a42abb2c367d24be799cc6945b703cb08059a3b9478414894dc3995702b99902246125cda2ac1da25e048d5563dca68c64db9746163a8b5930c77b880a1eea608096d5cb9628be575090a1c110a48d606820f7f801bbd68ed8758be054aa810ee2efa1d23506e5e021a5a7083c43050160744a433d4761b729b48d92847671c60739a408407bb25969136d054a4b8adf9252a8ab042057a36220aeed8ae6ebe74e272e17170902568a2718dab1a8b9fe92cd45c8b15306ce65647b8a857986a5f28991713db51feaca0f3dc6e2f4947e05482c3ff00f1427c087c1ffb12d1a8ae9ed8e8b7b97147a954f944515d56020104baf0dc687252aa329e6c987ee2d57c40b0aea59bd959221d9360a254040b55c4a570efb824295d4b870d632c99305edc78498d65595700d34095f802180b36d2923b194d87fab0dcbd0400bb2978abc14220d8d8b8b6a05d2e8e81c1729765ce0097f5891441d4431e5909b708d1e56086d60035130d85a9cf0ecfb128dd3bf18eb06a228f1dddf0c56befde6e7643500bae481e793664baa1c0b1079552f90848000a0235120c158ae1f50eae17d01446a568b67b065ec25858c836201bc3c3c4ba97c8fa7920fb8b47a7502f5c7fc808dd8e3894bd911c0d9283a534477326095a8b4bbd45e2764563899195b309567e1740f6acc896427134c0daea93ea18fd951a18083884cb81e529fb63cd7b8e02fa2588fe2cfc962a9066df51a6c8dadc83e2c63914fdc691d6e12a8f078c4507378c600c5e845941e7986fd9fb9a55751943ccbdd182146a1bf90eab65005e3b80df6da2e5cef9aef10f6b44e6002150edd5cb6a942ebdcb8aa1a0cfd88adc1a216becee31621cd0b562317064f74075ea0ddd56cbda1e2bfbcc063eafdda6c65ea0bfc45b1c1511f095c3aa0312f121a22e95cb703e17c7f266140d50db7dd66fe04e2a2cbd7a049585c32f32c2b393287090efc03a854d8afafe496b74c1a13d11d447a5d8f485f13808a5ff008c3ca84585b79ecf38722028d9eab14524770997d3ca171aee6d3c9f8d5e9eae041c59748f43c42d961c40880dedbe22b6ff00c25f92852e8f3bb404674aa969340f5035234140159130c504d9b3fe26c8a5acba42a068a65692e0944cca8626930e90711e0b63bf6972fa13ea49d505a7a54bcb830c139e447bbd840ec34fe89aa91e632de2d015f7039a1e58c1e2f72c683f52fea7d415ff001255e5f8258dfd114708cd0807d29430b7ea98e0200d80d4abbb3ef1a1ff00518037b79b23c93f299bb4538510489f1406713a32fccbcb6cf2a7ff00a88a702093601b1d0917ec8c829bc24df37490f7b92afef38186db311a8382b0be92240f9d76a1f6b2d8baee839f7b8c06704287c3ec4510699d3de9d5c15352dd5e1c36840c93af78cc9937da47ed3c76e3f6d857b2adaed24ef3ef5d1e67c50bbad3db20afba5165d4f6a5ebd00dfd20b4314af5854b938e4f3170ecdff2d95eab5f4404183ccdb5f02681b0a083f765cb62f09e198c3d9f88f82137c302c12da418b43a01ed19d4d228f6d3ec618eba14f0260be10140138eb9734150ba60a93f1c98d799662fa958f1f845c7961cbe0cac197049bf0a601c025ec115ae5488dd4c939137d9d099d8ac3401f64c8ad59a41cee5d8a8e880a2f5b95d223b40b80b944105919b541e9b28e095909575225c3ecc1028dc11b7b7a9472214c81cba81788687d4202fa840386118f5a701f0c719e2fdf516aa2ff168b8753543ecb841d1a61a4b476f5aa8410cb97af283dcc0968c7206fcfbd844d585ccedb04537d1cd13657e07765d5ef5ebd10b107622cb7da1b0ee1b357c76a546014cc97ca3e65f2a559bb8184422bcf6b7ea3a9e255f08fd770b052c72954fa0c26e0034f71a00f446f710b5b304124a7ed1d334b3fead868e1e23edf88f631fba6f502c36a7303022883edb81d3bfbc39abf42097da7b8755bf6c44bfeeca3febc2bafe989e3f20a6f14540aae4af9cf887b93f18215bf26232b430dd4a9263802be5295502bf712af858fdc0855c0ff2613812e5c2584796840f98024edff6cbb980a97b57841979cb130ed8cbb8bddc4a03214084552a0442d29517100ca044e67e0b847cfb02a0f73722e0703f02e4dc1fa48f1f99c44a8820bfb8254dceb86a24eee588a8cbcd3ef2a0d76de2e6615fd02bdc55b4417a984072743622095ba7d167a0ca38f2e448d205b900ee564528aebe61806b3457dec723800190d1478222e05bb74a51ced02e1c08dcab79e1705cb38a44ec12d6ef8b3d9c686ab4e45ad2d2805772ece2981558709efd46a16ae847b19681c8a3fd256f6d32e2aa8c1bc63d0ddec220168a86e5400321a19008cde0de23cc9512da096efe104a6a56b60af200e88441612228ea2944fbf5fdc32af91fc8d72f51cbf37fbae0af82d842979162e4d5905c1095e51b056d9473802df15014ec05b70181785c728a54c2230f49a909d6561cac056f0cf2386030d70f333276c15f191158b228f2550e0796781571a1bead2e0e49cc952275e18a21a9624bbc1143b8e4360d5cb5b7da578e09e22f137073516e0b2077c8056323496eae1aff008c130700d23a5b8194fd24f5419ba1f010f9098941cd82a47be1805e72c2d0d9446fc8968429f3242e9adf5ce23abb9b6c8199429fe259c731a80a3e53d608c4b60dc7e9ee2d1372fd9c42ec20011c04a5d4a6ac5dc12452a9146f5f1289cec78495b770557e13ccb9a9762ee331211c56a234f30a1b3b28aed15e4cb9491582fdc6532e5970de0915c1bb7b2ed9da3f511868a47584b99cf34da3a6cfb1494a8d5b1c80dd9659cb1770d83bf48a274da135581ce817a85e0c50c6fb60e830346458d5c12b5174589b4403ce06229d4c20014ddc5b5d4542a073be61bcbd67d4a1b1f9a8196897a2a47a87f1be5b472c6482482839b066b44d445b6ceb019a6b7abd5e39bc501d15763099b4cde5655f4b32327307b807913b166ccf90f445b385f3ac461bd69c2b4172070fc517bcb6f7367e9036ed5f98cd2a54bafe2308deb1b378a4d7db019c84d97d321ed7921605d10e817a62c59ca0d3b591c5852c57a805715f1e1829bec6151c46ca184380653f68a045d2fba2063854979713aab6b91f105446981b46e24462b65e20c23e8952120a1411c78fc0752e12b7ff00f522be32776e5a27e12ab3b8ca0f6a8bf3e65c75d661012e2bae9b5c78a8b4a5b98d6ba9dca3c4b6b0aa5a92392e4bbe58629851d28b531b0312fd70a7839194809695705e907a8e7caac180d5eff31088da95b1471e176e24a50f771e4b64deaceee91361c1e82fe9934b61ec139d4aea14175b80363fff00a0c6132b9ce2c8108b1944ea69561a0d890771fd5d7a4c42b7ba8ab7eca0832a996a5e7e17d4e6320eab6c7861a8787caa385346e96eebd41a8ed9ea5eba4785b9f44a05e83c9f2e5f99106061bc0eda74fb2325523abe082a4535f8117e6bd0e5d716eee220369e3eab45ad7025384f5a88aa7d10c2fc8ae7a8ee56ce4f4a8cde624ab84fb1c4baf6d21aba6f0cac1a6bd230b39a1cf8d843739258b2cb3c91608e6b812e78007a6308386e6c516d12c16c603f329f2cf633db82ee82c782e0eee1e144c01d9008a31cb9cb80b5ac20173b621ade4b230b27f0c0f8a08056d5c8a2be0222a2250fddca8078602dc34a8a15101bae6342cc40202234202adcb358853750e843b0633826f4cad8d4f302d10ac62793aec10933f825de05d267288739ee59eced313ad1641e1d02b84628a5ef98b40a144b0d103081938c6b2a0509bd8a3b6a0ced69dbf22ea55795ce5a0f64301448b741612545b77300b8c05ebc3207dae1c04d4b882b9893f3f2a14135c5dfc8c606b0577de48bc03346f87e53becf4bb9c543e3cde25b61eb76d78c2c1f4b4ce0fa40bb92b0c05d3c0893ecfb0ecb8690296aee538d75674389d429c20a9a7151a9481a3b683392a032013b451087416e7af254105f8b19e29d360e2d9293c38c416f5cbdf10e7469b6acb0b4fd4569af4d0cb594b9cb2968f8994dda7ca2397fb5086eb15211a05b8769633e06e5f4c64105f94a4a28d95d048929b3e11c9aebd604e1fbac3d9ec66171e9f5234c3a0ea38fc55b6e1f8b575d18d47d098232a14fb885c5062be25521f143683b636b2ff1808b709bddcb52e5b25894cb44c5cc44eff18c75148298c0afe1830870953830d37cb254363ece289a1af747f6510960bd49e3fa4119856b7c08b8b288e6cb8610c039a605f5144e13c2cf891d300bbe7d17f81468b39a1f0bcc58f5c6d27f91735d0036f55c3bd264bb05e657480c20702015666b58952a82481bd2829345f0d882c420520c9446355a5769142691ecf22a5d10d5dfb95fb50bf425781c111ed4c51a21d3dc7c6f6c4ba2f485d1c5c3490687246588f3840f12e01e1fa885a0f9a8ae90f889f1faa0fdbda4e82d8d657d45b9bf7529e265b7f4e2a37faa522bfcc4971e792b5017e985046df69497da35c62f9c787f05a20f831fa862bb1fc23cdb862ae57a118a2511a60a608d2645e7b20f62a9d941dcc21a489c465b1b8a1714b0a0ce14c00a02d253ca1501c0870fc9e3180ea8428bf373d4b68ff5bcca1e4ee1e4d860e205408a93d80f7ed4a92a33d4c3c6230f0970f04118063a15efe297e0909bfc3e9044680e82e7e32dedf6fe7aef51c0c554b9e1798382e90a5f7095492ad60f045680dd7d4784f087e284f0a7cb0b8245634ff508ae972b3c077537c1ce47d4f04a265026af198d62227336abed0de0f3689c7ea2509d0f4f88e75b17f50af2f824ee86a60292d003f64146ed11b98684ff006259e0594e3b5607075292a5c80a824b3420fa6615a965b01dcdf8488baa942aebf728396504577f82853b2e1710aa6ee434628b88de4a47bbb7fc87839099ccf2259ac0ca5c0a55d4cd13285c50959b267110a960952ff0c67980236c462fc54b3172a8df5cc20d4bfa350659c6328517c6b67a4fc3694c4c00f501109f2e158f0c3f7186b57e3b18029d5359adbcd1501f98314dca0855b601c9312db62f9f0c9479a8e3d791ebdc093a751715196f7dd549bbb3177f33db092dc42793052f4a52e6b2211e17f0563cd63636657582e4373605d4ebf282878368857ae091e70578acba95f997a824ae2d0f1ee27af15d2764d6d878f94972f8dea26a9a3fb211ae8b701d203ee0a8dd58af1064f430106b44c9f92e58ee5c11dc147c61e4416f2529d8da1e12df31596c16788e22a0c51688aec2062c977fb9dc72c6c0a5c41eea64ff006136541a9ed9a404b92a0a1478819518769e080dca226c063c1b964d28217dfe26541c4bee65aca827c9330e08322e452573c91fa85f8cc01021873ec62c97684c8c91b9ae92536908df35bf920011e77792076705baed278626cac878fd4af0c7a9b53af385e60c18b8fb3f4570a231548daa75d172cd372a2c9d2db041c6734fd481694c55d3ef3c45246af0ee3cec8e8362aa4f1ed9ab8de4b7a129c02994b87e7349a47b80e2fdcb27715e588037610ed421142947c3116a188810499860dda6d3f0cb884cba858945106b8ac42b4ec8aec5b224fc0a95979ec471e19af4cecd840a3cfe3ee3f33a88bbf0aeb09c21155e1bf440bfd92737f1fdb0844a60b03f00f5190c008c6a38c1f70b95294bc27ca15ee212a0b65152f6e0ae1096a63dd5474a72e3521c45a8ea494bc08f2e21fd1206650dbc5ed2aabe7938443daa6d9c081b7b3d4699685f010956107db841800568f7f952e2137ba5ca7ec95b1706a228409077440ebc415b1a158cb74059ecfb9b171a87cae10e63407006c249b82700e42c5783cdf4c75ec3ea23a73e9da8d530c19b738e12d17a61abeb420fa428719350135e808eb9f30214f1106982300842e14cb83a1101e6e37e996cd6765cf66684b5962232e8c422f6a0cf5c7f9434da2743185b8486a5e297292f258543bf2e9b00c97507b12bc119eff003b651799e9352ef961ee084839db671542179d9544d4d83980512b30e7e2fd040f490889d09f957084195f0941044025a8d563e934cafaa7b3e465a73ea11e98d93d23e4b08dc438bca8a1d11cfcc11705bbcb6c611b44879c6fa289ec7752aa819e51944a53897fea03c31f6369a7e23eb40afc112db0b21e0eb2a1367d2a29fd659e92dd7cc55892c8bab16fb8ce3857e0f51afda251a506d20af3ec77398290fd9038415a39493ca1a2750a3232c77f914a692fd453095d8af7f8bdd0c0ae09b386171e6965c3a19294406d8d5b1a864f24123b42e88961887e88482d6f135ea2272a0c309f512708e4404d4b1cc57989e61195455c66a8dc780c19b0dae119cf31279210cbc105f8e0023298dd455f14af5bb47ea6b07fc2fae19d5db629ab148a795310b10e0010f2c08c4f9c3c804474856cf0a0518efea1b8001aede22d705fec272589773505a3eed395333c98f58dc7b07b95447f906351a2df2219ce65ff51de05ba46a0e2cc7ade4851b18c48ba417d431e94b1650b5a82e9ec949ec612e819cda2b871551d80aa6a66a6ac156fa269b84592e67997f85b310725afe7a96888a59446f21d03cc4026c9e67297b09fe7fa3058521a4ebc5d7d442e389616c7552290629d3196b814c634ee6a6c4f10f4978c22f98773108da4b31af53d2150e11e4b65842de4ee31aaa206a9d4e12e0b7057b969795fd45439fde3066b09fbc10f19541aa8b1c740ae896ff00444cbdfbf2ff00304c372eb5f2a2e22bb54de690754a8b006168c1d802d1c92647ce6daaf9975f48cc785a739851913f68770300d850d704b0ee165b7a8882a5aec2a434a63164dc5afe3904e3aaf11d92c6681ca1a156e92da5710ad08bd9ee2f26dd22d3bf702a5e59b257e513b12a74e286a2b275a0a8032a2408a8cd54ab859025446229f8693849470848b51fc7380a72c6b9215678623840a5a6fa889534ca9c104ec5c8222cb92fe62b3296a4594b810a80bdc1b95b98fba1d713e24a5684a7a220f0098f83f0d10599463a07e630a2a1726767a459618eb97dbd04cfd59e54e33a200fb0f7886151787edee3d5bbbeb3edfb9c9f042005dde2b1655ca93cbc92bc5caf9e346f80dc0f321e8151d3ecaf98130b497c1c5fe268d82ad99d4468d3751705810af232adda2b12354b59b7b8441af4d1af6686bd47d92cf3d8929e06a415d799050d604a83e6c72545414b6a4afce4187fc708b850e6060f89d12be617f328f72e32a11a42f1d97f11a316a0d9154415617165c718a74c9101c18a4dff0071969b748d430fd53c8226ac7ec81e51fb2278ea5b35a8ae6a0f22eed0b317ea0f277d678446b333829b8d9a625684bdd1fb94f300aa31f9840ad239d32af42ee71670861ab8f6bffcc4618ad36e3d7e234ad892e4f9826410289741f25e57ccaea3ccaf47956211260edaa7dbf17f394fd6000104000017e494241e0957434d90fa03d11a7f008300c9e68f35903fd51a0ed45b72e06759c16fd32e60b2a7decb6f4ae4a0c2a500ad15e39bb8a414a22503453712d8702f52bf8ab288af048eec96caf643c9f881f84fab17053d309115b0070f8fc08a5bca0fea121c49e1536825006679c2f9c84afeec1b80f771c337e67462e27f4a4a711f84f0fd929840ce11fb307291f5144a5fa8383f9450783afc44799fa184eb3fa8d3bfbe13dbbf52c2ef391982c19f99ee100ab544bb8682703f038cac9f0e15a5dad11c5623be890a7d9f240180deded9568b08c4e5d1b4b12ace194dd703153bf01550b805aaeaaf961538a16d62a5978a26855ed8a446f3456f9d972667a360942c3a1279c17a597014a2627854d6e504bb79af1175afff0065f099c678758d07dcca7906d06f2d37678e945371e86018d560703c0f316cd5e5a38a007008b4a6be8470f2d0ce3560390a13dc65a0cff9068b6a7ee2d05222fea32827ca28f41bf4896e34e058527d65ccc1acd56fef8ca3f833c7fa19e683a44b24e799e0823cfec9765634d494e0452d4639615040421d89f32b5431c451642f604c84aa049746002d896ab99bdf4d49ef500f72b62e6621042d06720ba429649a803cc30e4c3b25b0965189392500596db788656e52eeda416a9a828970aa54b1f860a3f899c19a77520d3ef53b8e941c97a70fc4866933a6cea4e47613747421f9a2aceca8f312c3936b08a2c32fcdba2383bab01a9902408edee06b6d731b77f2e5b5dc7001dbc8e0812a5ee9d0bc7331ff00fad41f4df8cbf2e767418ea1c14e6f45ac8e12218ff171fc72b0afaf2b81f4cd74f4a0f510a97ec57a6347925d0ef2013302f210580e3548e3d4fa25461e525734107b1256034a0942eed5621766adfd108a9e106d70472851b0bf41b8f9b90626b378ee1168bba4e21abd1948d4cf180bafb540ddfe9135053e04d4317e65a7e0d6e51cdfed4b54c5ab9a6e54fb2270ff0044390fe920c17e66025b9f4ce3b7d2c54773db3d4abb92be97a62208587e0a1623b6259e8507ee5ddc92b033d00b5f139478108e5882311a624622bc2cb0e7899252eb104f5457909706fe004a09b942b890c0d89446f259062a57cc053322f87460a80cfc3922fde96c46f9d68a25ddcdc0a0b4be925466c68343cc75ef5b8bc4f88a06baba3cf2d5e2774a92b8eb90b87a63bdcf8a8d8d6c64ef7c3e8ba071b4c5993d5a66607ba5ad63e922a5109d9c011c832373da8bdcd03632d0f4b2f98cf8ff00c4c1dc61cb3c7f689be3df77372c534b6ced9ea27c6c3a56df30c32a4eec7c3e1016b9bd762f7680abf3c0e045411c97dca2cb4146525e2c4a3da8403850fec211d48aac6d044103aac4506b888edd42d972eb1065a8b80c512cecef208db63380bcf1196aca06a5c796220e1c8a81866beb443cf241cca8a9d45445d62bb9c060154d8ff619a56e56a2df369b3387f9304f7055490b13ee08f705704710954059bf8b0c1dd4e50ce92f44a8f995bdcba0db2f23ac0ddf50594619cb397780fc0e27e0e94b7c490c94b8277cc7a34366d32352be545a188c8e385d93b6fe9bb56124aab70b2347a6ba0a42e75d9671769c08b55abf262949d5a080af21e5c385f1366dae5b7227402d4d06306340fdd97f8723f1061a89e431ce2aa612e832e37e4a8d49305401c9806bb4700711f5677d0b1e58cd45d6537355a529c0c611c4bccc95f592b56b84f9b8683c0e4e19a877e1821428a75dc021cf7dcb2820ae5d4a2f98c87bccab7110d212cc15201dcbb32ed988e0476096761710ee4856afcbf9ddcb8a254f279a11cc6a08e0811a25f85e5275c0ff00089d8a9216c9f0d2b906016a03c4a1c4a9b0e6415dc11b596b811790420364bb0b3a9b11cad32842c6b84e6ce49ce54b4d8607002625c2769cd045e2c741b7b9448c5a0fba25e548c7a379079bcbd879bf70b95270579ed8e827d8e22cf1298efc21a0cb0d5161f5089f06aca44e8a3c69774234e89d31ae49751f998d1fc63ebeb0200a6540767290da032ec82f92ae91f888e4a172b9b0ef80c81d53159a2ef87701f0defc9e315875d4b9ea414ea2f0f094f48dd3b82d2b7ad45fa86906618e9c426ae568c263b27dc34728bd77d30d14d8b6a63283f883ce29447b1561f308aafcaf5d9196351a810c776a5b81863a668df0ff00a8b77b0ddbb84e32d97172306eb5c63b946a646580f86e5bce047ee2686b8c58214c44012b478e7b4762ac753ab96916a33ea04ff84cb7fa274a4cf2280116fd7e51287faa1a8153b50ab51f2a0987f4c62085fbe7f72be58f9980bfdc2bb46c1b92290aaa457f82f23af82563aa4c3e40f2c8504080ae194f946224bf3802c30db389fd8d8203caa4a644557e18ed387ec68dbdcb1a4cc0bbb7db992b80dc43458b77883a93b89738fe138086fa70401a9b33a21140aa9daca37dc1795d10f92fa40313e13d9f6655abb44846c670f12853a614fb25967685566e33d35f10c171aa0a08a35c2c13e5b4c628bcbd1b19e18f914a27d46ad88437ba482296a6427584436be861f0ada94051d44a82e5cb83ac164a25b28b252a096cdccb6536c46ec384cf30571e2217bffc480ae3950042fc29f810aeea4636a041349e488a5ac0516f9dff0074a83c030187a8fd080d4419d1710a98b658bfc57e346504583163c97d4475b230abc8ea840781fa843a03e097883f020ced5fa4e1bfab1b7a9c07e371271987058e807dc1eddcece1140268d4103cdc72b56c2f921705ed2392f21107b2a11bfc3f91215bdb6a79d999b002433b1859511644ab6a35c5965d557762fb8a3b1ae025f17b352f4839d7a538eadd5c2b676e87c9aea18f8791a8aa85423dacf5ee062bb6a7f9d2043d011bd60710ad0f2e8e8f0f299bfb13c0c4ab87bd55d65c42ca21d5d523b06cab9c6fe11494141f2f7f2431dc2af2b2e55e638b860c6d058bac1c5fe14255051c0855731366446ff4209c2c5d0a12b6c312259aefc1088e3f50c967f52e008fc42c9444e60a5c3a44779493e92d29f42622c97151e62b088f74a6cce44e3496aa881eea3f8455af6bb9e54c15f507fc88ea2e8645a23844107912990ab83b06d8c588d94d4b9c5e2e0a0c8a98417927f842485d964155b91a0f27194c9e26d02d32e9681ddd148d04e06091ce40e8e5945801bf3e880304791cde5c46b5f452706c671c074fa8b8a164e0924b05ba103bf30a279e5d4e988932cc237ea4fd9fc3797d4a8d8500e43fb31cb070cae09053108d9306515ba9e265a9a89203dc5a32bec073db2c44407b0437c171e4a61384db958670cdc8163d823899abb5ada826c868668f4164b97fab6200daabebf105b9e6c1040b82842283c658215483210527e1e220a23b15e65b9b8a9ac622128a72516f3ccbd4edfeb18f3a0287d2758abf256c9eeb27f549114400b6ebfa827b43fb996bea2bbb9607e25067987c61a04566b134c0316cd8fe4bfd08aa155b51a37d4b15ea591c83c3d42a21b9c251ee11c869497597251d91a7a1bf91f4aaa469d5ed2e1fc180de1e10135c86a3918107cbd70eedf691eb8fad07484901d76298842ba2f4d0c13ba055a87a0879b57db20411d6039fdb2b8605f97fea8d19fa4c60b7a2b24285e484f777dd6512bc8943dbe22a052ebcf5a6bc0fc16f6423e4791c2b605eb7eea9447897b22495249bc354d75645f538db037f0e11e7408eaea6f2e5aa1db389259b9d521dbc38a8101850da62af8957b6742584fb8d46e2d855300b8083db445f9f58885422407cb05d3cca8fe236f981f0599acc68fdb2c7c310c792e771231d24bbe6c9defc1886a4e546a865d975827b8cff00322bf80975d117bbd45af172e3e1116f90990891eacd26950da2640501405045217e23c675153d773b276a05c5874fc84a54a9231954e0cba6bf054f57f9476de944aa6d51d45b42dee68482394adebd185dda9de569ad3bb8114aef0d1e040261a0e62fe90f5c1f1f5098d9f310eb6e55c53a6040f8828a19377d552507972bcf8d6ad834db0c09bfa8948ccea34f79bc252bc0468cd3ff00a654fd4f82f4c616d32621bf283b22d8a58528e99f6c09858487c14a2dacf0d687348c4562f019f28e34b4c6eb5a5f241c2635d4839000fb8eb5d30523f824b501c22e1e7f18aac396774e54e4c10b681f8288bd4cb97716fe3548820ef1ddc349c07e3027b4a1903fcd19c7f28f0dfe32e6e3bde02140467b4c2b37bff4ca400802fe8992ac8a13a429536bd470df44624c0ce10762ae5e32f846d5180b8b6f572890d8ad87216e208459a9e241978fc78475ff00a320280df4cd045d8b4694f9bf51639fb4ddf9f5c59746ab9e8fcbc45f5ea28f2f0771913e4ce423eef21fa395c1f3e886c001338b99b2542e44d111541b7960ab5e479aec97fb68650795c61c6268838f9cd6d6f0a10d2740f1ee103cc1f0ceb25297c7936aee02068364f1f74f12cc3cc4f59856abc0e0b3013a8b35d1f56339f3f0ff00c1615a5f827f253b8b61b296482f51e7b2e06bac1f5622851a1f50828e832556bc12ee0a52ef429d7ec94141abc8575d4190688391d54b8433a4f13153498e945e1a4fa107a8c4e3f0c197096a953f0463c86a45ad5db2a3edac6b5eafece5441cfd1f82d7d23c8447c51d4149044b95a869f85d372f49c4fe14245d116a5119096a22aee1c61efc233dce3f0607febea05e54ec74bc4bafd7079f010998c096e7a9098ad23bd80c09dbddcf2184b9522d6f88629015334a2357c2bcc3bcc75203a2e0e28a1be58f9c8bf2bcb110b827b70b83ead53c2c129d57a009935be76eaa6e895397d7497b6fb3a41784303f402fa8e0327d55a83a476bfd3206a370c0e5fba6534466a036f702341e5a1e15fe43e6e1eadfebc8833908d4bf8fcf72a6c2891779b1895b7791cf5837f501aa1150e98b21d51c2ae6c2ce6220f1464309645e45d970759a269517106768914c1f708200ecff0008707e1c65ce31a87ac0fd30be703f5024fb3b9634d7067c97f9c3e59fe92eb7a72e0a62dc56af7335aea3fd27e2711e423f8ec60233a75106590a2086e52f3171f33609f4845612e4f4ff00f8c46bca7db82cb22a72052bd30d5eb5c60f43a21259a01ec175fe236437f905791e58b5d1a0b1b5af778849d8cf16ddc52f8dcfff004fb8a0bf79f12f5ee2396faecf58bdc7315e30f2750ded320c78d4b16a06db850e8e60650806cbf4fc20726a7d7fb0f6412ed473f0afb906b5605bce57852a124adb5a791da098bb682e57a711ceb0b8d5aa8bd335f1adfda08ae2bbefa8c15bd6628a1a9c822355e087c89faef44add283f6bcca5c8bda442108da3606520296a106997e4f32efe498d2597b883944163f02e5e4ba65e45503a452b99c3515c8255335f50bff5ea75f852771cc9f688e962ef6d3fd8cb5a3c4b0162475c6b4dfc45897b2b1daa60b64cd4bc2c9f98682500eea289fc171951f06621d9a882c1124b7e1e2fe55a21a12ee2df67f6200ef1f63634f0978230d229a8426c6b5986424515dadc091b287969b71b496f2a45ddbee2f420ff000165cf089305e0c0900e0759ab8fcf5071743b480f4a0ae9d9026b1876bc2f7e95ad4001e1b03027f861b29b52fcc0ee810150684b782379b443e3400f962b76de6bb87ab1343d184047d38a5c8d56a10c11b93eea08dca228aaa1ab010f71f89d070c7f803516cee2e4bdfc72d894638ff1adb006d79b6668f0a5e4766e5425217c098761a59dac03da50de25477c03e899af8258b38635a48583351db67f04ee68fafc4e65c6376c9ac9a2707dc2983fff008350eae289b8ac7a5f8f197fb9458de6788a504b52bf758dc5897ea9cff4abf101767020c6016b0cb16aa7e63c22816c112c72597570280585beff00160901a53c903eab43c40890616c52ae0abad02f7557c30c97b59f15190a98a16da581e5a73f0d445d404275c64021cb06f0c210f62a78b116ab9fc36c4507b96aad029b9509c3bf12d0710bb49d4608c111d19c4627716a71c5421822a3441979343d47ccbc37b8b08e2aa8b90844bc9d3186b2fb459d980f389de9c422ada9043a024407caff007369b4c952eff5b1e11721d2be273711d97d421c32f47e2a2b08c0ac54b34821d169303f996a622ccad497515faa1c1328f5dca9c01b6df41843ed0be295019a357af6c2ac402f0f9973169df56444ab6fc8398697009f691d47221e9cacaa9b653c24ac6c040787bf6462fc5fbaf25d3d6721865b5fab967db20f9946d4c2f54e2500d29f5907f0a7da9c86059eaf31a983b3d58b07e2c643be1dc9bfe03e7ed810176b62062c1e4e2030d12fa5e628f4247eb88533e423edd16eb39466a49972aebf66c4509ae4453bc93749c44e354e371212d53a8bac1c9d4b8f1b1c6bf685512a86ab47f49d0ed87e0d6ce73847abdd9bfcea2015625a4ac6595ddd63f8c2fdb2d1edfe310c3cc3f70ba22d0cdb04a9391d8edbcc169084cb976c4d6458e4312305591f0f041284e119930166cce6bf850bca0f894a2191a7e7e8c1e7e10d03c846ddaedbeaee0007010485287f4600f602df7370c5d0edeb28d09fa166a1b57cd82736ddf74603c09c3fb5c42199f4ac22a046a5bc0e405a0baab9d6c5d53b25850a1430a802abd5cacc17e5b7e3361b0785dc7b8ba02e15d041ae8e47a5879b947c834e9e2004884bdeec691a60eff410b03550024dd0868c49454a82b139b577d2a6e2e4b49e08684ba956c3f058f1f805c025574230d8194fa884789c65e3c63bb3d2841f2e327e07e2b72b9789604b77fec347e1ff00b1c51d16ba968125807a82f48707516952da9646a31abce6509306c94b3c896b22e4411298f2c7c3f050fbd7fd3b1d12a136889398ed2d043eb64bb7803009378ab51468adeb99645887e050101bdf2405016e5fc67e3251ff00f8b08dd564695a2c1b6d2e23506aed2da83522c15e93e285a5f936c67c81939a94ae312dba82039ba602ebc12e3460990ea4313a637363c0d28fabfe55b1e30d2890cd27589a11845ec1dc97148c50ba2e5cbe21c06dc8553d184c11db2e21a945b00074a84c9e2a6ac701e930025e4afe09415fed2d970a6fee5b54ad5328fb0837fa8ddcdad9da250ce906e5d32ac6580e360a6906ad88f9e3907e2ec546ae72c3ee3a589f21ce08b08190a338f90b8c4116f17a0f102cca06aebceea18f67caadf01cc2252f484c50ebc2759988d3aa7dcdb20910d6f54831861ed9c9f8ed2fb12fc1eefa6002ff00852f87b1659b5dc0f99f6112af2d3f065248b40a0da1d75ecee687a9f1ab3e47730d90fe67eb23c6cf8671e3ccbd6bf5a3dbb878aacf2b874197ed72c1e6fa702177a597541edee121dd353b87d523066c094bcba845c3de9265b3cadbdd07a561c31a85c4c6fc2d4966143c3c80a2661aea320e2c7ca97b2fdc763660a6750cc8b4f88bcb1b2db9ca390a7245ee3616d453156cb6da20cdf8418b0ec30f262f408a188019c2238517797fa236aac9683e510b48a347ae911b666f851af7f898361bc988b78bd8c5850b206fd5f136e6e3e3f0b510ab8ba9dd36cb7c53e24a623946258a5038e210d968b3c7138c8c4e0a67754a50c83b9c2ae5210909b0b51d8c376faf45f70ccc0b683a727615b29829be901fe3eaec1f72eccdf8e80657563bdaf211bb2416ba920dc2a540329e03630a72481ac43e09e621fda2890e2ae54992adcd52f0e1478d9ef3d2580434cc0412ae13a5a2ef2e72cf55f432b71bf904b4e09f422af4f8c2eac200082380420962e3a6d107a0977ed369d4db46399154543081e2131b2cbca5334dbf171de825a65a5a46df72a9c3f0b61410f602f9a63e486037ee62b343d471f6afed4bb2dc7f8441cf8239556c04ea3a92ddee3e0f306b1723ae22b4883ed39e58d2fb81285ac754f336672228482a01ca6d11e598f5044223d23c864013027b83a65e0d23608ca6e21a75ec656f280aa341e98a378302f0205a6f061726b7a0be1b8243014177d21c682b3ff891c392e9434701e5547a66fe7db18befe995eb7234bb9f1ce5264f0bb41c55035d921f64c23441f529e62a49e968d9cd0f308f9d198e908dc2f6d4a6c54f0cb031baa664ac3f398b6089fb7a66d39f8454e8e6b1ed86daf93dc2f898441cc9fc66caccbe8c5b48286a97e9840de42b1019f312c43f8164120c497134b2ed632a7225c153c1b3ce481571ae5ca59707665b22222d9abf0fd4d756949b6c1cc503e3259f1afee011e59606e0a6166246f4e21b3518fccc08796103959136110af96ca91771d5c8ed717e0444b19cdfc02bff002e4548f51711dc6359024651b6b393748825ed7896e9bf895164fd76276dbc76c0997caab6914a90ce8e131e6fe01e585e4078fb670abf26675376b47a257aa320935517577b5096d1db877125c468438ec8e94038cb2a8c81d602d4fe847a83acf6ee344279ff0083810072ce5c87d330fde4f381380f586a189a446f9253d49734280288d32502c770b472206cd53d8be65af980731d6173ca7296a84b9551042d4b4e116c749f50e6eaef11377da24620116201f37a85daefb8d28a725aafba6fd4421538b355d39678bfd1b8de71ff0051d226c1602cd41bce4fe5846eed5298640cbfc136b28b02e2fb0bb21ad7b8976973b8b1fc57e62aaf89a8b609f6ff00c476fe2286c956fb2c962478942a5a8eeaa399c148fa61cf345dedc9e20f42f50622cea0757ba26f401be7ee130311dd8c0acdc690d90b258fae01715daa542f9a3b573236ff000cbcef611a36479cfa83bdad05c159081483f239f6935557c3ae7e903cc00289d6c6ad75b6b550d8fb930100eb11f778bdd8415be041d4fa8c85cdff009cc55012bad07ddb30683ed98cd02c199c61080eb76fcb282d82298e09520848eedfc79546c30824870c5b9761a3329f71ea01ef73f68d916cf64bcc856a6dac3b061d062ba8c58ea3376e2c7adc563f1005f79cc754fe4d9070ff00b3238c639280cd0d77029cd7ad61d7c13299c6e5b60f309c5cb31e629729a6e4747ccbcee58cb547447744569f13ac0bb8553d93e422ece61bfc3184a3da12a8ac06390606e006c8273096fdf31b3cf3a3fe11ea1eaebb30a3569ebd08328cb374b063cb0d0684547d69a601ed8debf7016c33db13493cfa2083a23589ed834e90f103b95641d5dbb6d3d5c37565ba137cba942b4c84d1277cefd196b1be0b0a0c5ee708373aabf5653b284a6ee37d3e4341620366edaaf6d827b9ab89e8c822fa9be67ee80000ea5ae0a7154b940e95dc33615244f519efb670c7431db82369d1045462a18d8aa0dfc917624ae28f2d437e859f17458c0f8941c8e97d32fdbb63fa84643d3d409eda3f6c651d7fcc562dc62007b84d25e254de120e847fb197498a54d90dd8d0d4ea312af86729d12e5f483b24e72d510a151e7ea5a8661638940dbe23ff00f5ead1839c25ff00849bcdb41fa98efedeb6983fb480bea47b65ff009c96d594604c14b5a43f7a1e1cb96f00fa20d6cd534dd3704f6defcfc43611ced7698ee8c5488e654a12378fd1dc57cfce2e21266630bcd3d11d638f94068cf501e2e04e823ce07b72d167923cd45ad6dc58312542ed3e6c65294e69c361558ea7bf87d41e686ddba8c27aca3712b7c173e1de4481a5f9a0c17d9dcb8a7bd3c4c1062caa22f41103c0fb42a955cf4353258e26ea3aa8014919aa58bf122804a222b89d3b28a66915cc27ccb9db1a216034d41297a43d884084253ce1cdcbba404704855b15ff004c4abee7974ce4da3cae2b3f11b06cd27b9c25f44575bc20343d411e096a2186c564816d368958007c408abb63908a5352a40a519972e39ab1a2bc447a1aef1d4625e28e6ba88ef883de1f99b95e1585e303563417b4d23c4092fb88b7b936825f4186b25dbb7da1c988588342f5225e0084f4c538408b446a438d9e73dcfede6e8106812baa1ba40aaa93d600141fd8b6170b91ad36aa016b3a2db670b8cab0256d603a4f01d9624105a4b57ed02ed8a7b16813ed5025d26aaa5ea8effb951e1da8a550855aa64f13ed2a282273bd2cb93a8af71a3d7a268a816c28d9f44d090a37264bd0aa7da0e0c62ed7b9ed5d62e4854914699ac0a4a9b8212887e3a418954504e20c4a0364fdce50762b5df044b8794ba2006c13b092a6f52c9aa171dd333640d7bfe99937a92ccf54dc0c2a95fd08485f0a0bbfa9404d103197a81dcdcee255e2e0afb41bdcaf0c60664bd4d87e372225af713ebe0e919c046ffa678ca05a72a7c9b0cd6074a5f845002be74031394283489477f169152be7140263c7e60c66f86f01b7975504e87b8b75ead26ddcb1ce6f3c8f830224a9c46517aec1fc5ee09f74b956b35f0aef587ff3c9ea7e22160b84dd63dfda43f64f9b3aa7647981d8089bcc89734cc59618f97c31b0299e3c99ab983cba9040fab3292c21fda8bded20540817b7cbdc281b5c06aac4976c5adb20206a08b4ac7dcb74bd9f0c468b4d1f52e9de92e6c0bafb8731d4f24c3580da1bbca9df381dcb26d16a0e2294ae09f288a8a8ec82237149025fc8a5459553de164e00f32d1f9d7c108d786b3e58143522a59acaa63386a7bf669f1228694f88586651a91da30667983265c4067d07087e0527048a5c2a90f24acad4e7e0a11610e230de94a4e4a0bff529a5fc8edf71563796abf94f821b4a051c529647a22a6d4b688abf548d5a6b5f1ea30d4270ee214834f1f348ed24fa990312801d616d268af317648cfa883360308417eedf0cb68a12fb1ccb8d566def8068e9b809d9a2afcf689c0eb0e4e81470ce5793b03e8824177244a69bbd0e2e17ee06a0802d774046d565fc30280034f382508028e381a2645b488e8b43f0220f1571bcb2985039a1d9f307bd01702b994ba76997ae9394bea52a15fdc61e7d461431105fe24ec57092e08883e58240e639cc56a71627de28da3a835ed31954dcda8b27417f441d134171183d92c35710415bea33f5c52b5de56a0b2d85399d506d4316db4e3a80b60ace4744bd2e57f074d4b7185a2ec9743f7e158cb5e137c0f0ca8a0a5c2f486158c75f1ba81ed824c52c99e67277122ac34762f0f06146986baf87ca0c560343b85e98c707ae6bd59e187f98a3a1e6e77d083c9e2e023697af7ca7ab06b1ec4519a187470a785850cb6e0ee2c77fa4dd797d1097a1c52f5ea123513c8e87d3340af8cf63d0956daa6728868c7f29c07c105af85aeec85156bee7511d05549a11b906000118c9a9f109394c1ae87c302d25dea77652a53a7bec9726a0fbcee1f7180beca0966b49711dc7a86e5a9bdb49a6d0001c012f94486416dcbd8ad82d41f72d5cc393ea18a30a020a56a3f44a9ec17195040462e7f05588d1cda0ebea329c58f6820e37885d8603fc8de2ed840396aa2a708da2fd6c4d9e89710e444da60dfe041a62badce09c7cc6c459772f4fc33268586d7cc1c08bf0464aaa6b6bf7035134f642fd085f0454b191c8351408f79b07ea0cf6f192888699a4f544182b22ec97c8397afa30976a4693c87ab7a9092ef389c5eb4f9194bde606f081beeca0b178b8a5217e16e6f45a55da0a91e7c0b39fdd3244da91dcaa39b0696ad0559ea5838867f2326b4f931d93427d7c07050e89c4dda736348815042022df621b474ffa12e65404ebb4d12ed5dfa4754db484304d8cbe87bfe420de779c8b7f1974b936e7609852da892a05ce5f82e462ee2fc222907128acc3e650229608054592d5c2d6273d5375048b2959a433ec86fd2c2f2010fb63ab05a8f82259da802bc57e7d9be588fe1d241b0a8748952ce25432e362ec046992748c8e68362971dc09baf8ff005834711e28c909fe382f3378e17c414fe50d4207e23daa155aae6ccecb4c380e7e0204de4e28ee57de53455df07f116538554bfd90b9ce22aac3da1eb9972510d9edcea2f278f41844e612fa2f6b06839d58693a18bad04b2a07ed18d52290552df6f21107a4c497c89df84095816876f27b81f3ec4f6d7752ff00b73cd2d700804033e202fb153e88641e153c9191bf443659ed58382f2b239ca5062ef23c915eec4072c106d50cdeb5e58a091f7371ea775748f6a62e4b9b5bb1747b22a7cf0ce1c9c8a21daa854cb086ac97051f0f7f8b48bb0d3d13aaeac4abd25bf0e1f8a2af150b8b47e53b49cf2c605202a06c3c6cb802f5729d35c3526291d50c6917278ce2c164f02c7863c9ea202d056883432fa835d2120a871f719ceae6481430970846712abbfc09f8ba808873feb3a9b5c4e0416d9fbf6b1748211a8e97d01cca032725f9b0ded65fc01a0481aa1415c12c209fe17844d4a6db9c7bd2b99eefb0c20c845c3743dfcc67108f6b0767ab339f28100004afff00cd8d97b0cbcb2e025d8a40938a3e98a229c46f7b35a7a2fd41010ad2f9607db12290960eb0982e8f4a32bd6c1a79564bb7715976f2b82390ce85d42d1395052a4eb70371b56729681fc03b2e90ba771c1d8d1230d83f2233e29b2229a9b20e46283d45ab4b637fa62f922992a46512bb1c4502f3fc0942d53536abb7fb8d66e0f98849a371d8b2c252e84a1f32e156c5446ab22add23f802971d80283a72479855dce1fbb942162421511d41acf102e2a8943a8543c2ff00679f50dcc538016e2a9f4cc9ca3bb8124429b4bf8e10c26101394322286cb7c77385445fa8cdd889162c04be4965d5c4396bf1637b1d97693ea5cf0369009ec18e10321eaf20fb67c2952c754a8196b4e9e5285c229ebb087034df364b5a451423a06c0b532c50434ee7d983849f41eb22b387d2bc2fd4a60dc9455d8ee029d5a6af53d122ca55fd246678c5e382c702b77e596fe23127d08a941d86e3b89c4c430d8f6382c3a82b2f88acea2bf5429541510766cdc261a53bfa1616e468198ac4213b18f6255aeff846bbce10c74b788b885a3f064706015119abbe506036c6a772008f8331a604f2aa5fe017061c4b886c38d4e6c55c23b1d0a2ee096620edc67f501a9348665f13838caa12542f020040064710c22d3e9e10b294f2b5ba810b2ff4480dd4a95eca8abd943ed88bfd124de093143a02d7d134f6cf7ba2105ec5f1970c67f593880441547ae91035a81ecf6468aa00f52ae122a2b77e224a1b674a6b0b505be170ccd2d94765e4d297aa9a5f5198aee75652d73b4cb8bca0a06491b8c717810d7530ecea434a96f4469e603d57248f5edfcc9a207cb3ebd494dafbf2229645f5738a5aec9b61cc1dc2e71b72c90e3d46d07e68b626ee6e88bb81b39df58a99e25651886986bb4241830b87b4547545951a216883f1930dd9490d27c1f31c14c6658c7f0372baa8f08f6e23d335286cdf64450c1fb81c3c7999e9fdc5db3fb962ff00b9739db1d009b50b713202ba84ab5ab2042a8f748798a0426db06a2840c1b800d37b4f16c2d3f02446c39d87e4979fe28f34258348de0849e781b9cb6fdc11f228a77dca3b54d44a17a7a0710140d367b8a902d03c05152d355f7590520ff395c705f74809bba2e228854a4d6dfa53f8aa24b1a606801971d0d0b6bd1194aa40f424b0956b7a3abd23d906e0bc8acd965e30605a6d00a348e6c08aff003403efb89c4c669a8589aa3cde81f12a7867be5cbd82ce869e7e988be6cb29004111b80392a92bb15be7f18d0e641543b063b12b6683033f3dc35d336233496172e93423bd334da0ab003f666cb99b4684ab180d2569c6abcff6612055f31020aea23ae2a35a31ce682c40bec7c0a6226c59b7b88be20ea1396e8967243ad0869748d1669c420ba80c6a02bee0a5c64c44325808c16d97642a30b477e161951710855bc3d47ba677e388fdca65dc852fd49c7463119711178c5f5c62656083c7e097042cee70007e4254005b08e03db85c10425ca0ecacd6435e57384b6c1c012c1fb61f7ba4d9ec9e296f8987c6505a46a31783d319a87270e90a8d71c6a8409f33e58cc0d1ba21213dbb2d9f042d5f0514dd20b51b8a2c3bfecc42e9ee133b4fe1ff00b5147f7f456ea0b5d91ad272c2d8d7101c43eaa2f165345e115144d5b817289036b85eb72ccb97153288a8a8cdb25ea61cb7ef3c2654a58965e76229d0aa72dfa44d09b1c5b800e4ff00762b691f46b98b6b83f92028d438114298750e261df2c11eca8858ce8d8533cebf02e76604b5fd44d288d9175f89748b311e6552d4962c8b90d42dd5df91dc979dd91c13ee509b2350d45f9a8c5802a900e7bd2aabd254067d9ce3d54adbcdaee549ea115152bc5f0f7075142cae1101ccade87b9f610ac46743a87b8aed3a75f2a2747acd653f384397371c81e23b83f19bc334100ae7bbf52879f53b02d789f029c6aaf6c801277347774921b6d33468412438acae4f8328c2d51f3cfb20d77bdb25fdcaea04c7c125a6155341518413cecae1a1b71740ebf644cde5152339831863e457262291eef0b6c97ad1a4b5abf71ec514991ee38f93f00dfe3117715a0538940968a688cea1021c8ed0bb38e125f72ecc1a83f1949b11291f53a61f372a034c5cee9114ee960e4be2f08f124425bacfd96e24a906016106158bc8825c5070d4a1589b2820207925b93142ad88b7652b9c88e031970ad23c531ae88b25d08ad4200c5a876a3f13586f1c658bcbd7e68c587614fd181eb585d669f700bad8d485fd7e214f312a918c42b90f2a1356f769c984482749d2a844055f9b3bb3dcaf0ff73563268095d89d48197cf0a80bedddc384029e93f3b68002bb9bf782d2a92df5e1b0da77839f693428ad7656761e7fdc3e6080d55c41621b5b8de25c1f1c68a14a43a056652c57b45f3d51b8021b8b5aca65a0309b0c7ef2b2029550d942554af25058ac2685dcc48ba4285f2bb2e4de5af8890c583e3025591a5ab8f8e7b912ae3596830a52a5ad771edd8c626861b25c183f1ea337908ac0b2b69b660f9c41782af880a6f8afe12a57c29ec8a8dd8974704283000dae60cc0bd3003fb8525a235f51b8349783f710a53f798eaafaa292dcf88d7fce19b5fe130ba7ee76c4752908032d6a50b2a600005113cca098f2420bff008a5382dbe844341f24e6d4f84aa968f420a4bdc4d0ef82246fea865b4c5d4118bbd28b60711835cb483c989f10610fc38cd4b440f2d1978bf2dedd6f4c72a7638734c07ec7220ad3a3103b85ed0366ae444c6fd0b7d2a71af056739088c3dcf64b16d11f1a790c6e636868644cca3daf4e23d5c5050b9cbc1839f4838ec8577b3e4411957daa313286e5b1780fd16551a7d9b3c8d30f22909b46f9b7aaf8e609130b6256df70265477c2668ffd811dcc78e81c9e8600769988f3d22cd8b9ca3d4b169472fe0200d12fc69c8cb46f0cc35e71012b91f432288702a5592a354450bb27ea35572a0ca2562500f89656779c3f2c31b8f67009511ea2a2f21fd9693399472eb1b187701e1d2255b65c49792d74d541abfb226afe8854aafd42a5bf14b072b79a41d5fd46231228a968afaccbc017c4bb81fb8f5a264a96bb634fe0d9a8d870c18a0bddfe093bb4fbccf687c109a2b59497e821cae5fa833fe65bc57c209bd2285a97d788c39a1ae707fa58f80a3ed4e98702dd5c53dc6bacc1003886abbacb2140d6ca93d91db996717c8c324d1f17507d78b391927a4a7cfab0cb9b790c9108ae9bb0e43679194febad11c7e2674772d72d81c2b0bb23205a7a51cafb9beb93e16b60c09deae33701165f842be85ec3dfea3616ea45cec985012947fb0f74a1357f6445f3994fb93b5949b9eaeb7762110836260bdd406eae809431f5f88195e8ce4217c6a3d297b5291a7ab10df9b7c84ed91116c18d713ca2f769df289163f1b4b50b9f4c58aafe18aa8874c8722b5f31a413eea0fcafd307e372bb431dc025d257490ac8e227786c08dd618b12014f975288a945a7b987c922228a1a627997e02465f694311f8009a453910ce41cf4dc165d7b8b27ed8805c11bdd81b4519061cf782216dc53cc00d0fdc73f4fb8139b5858836a5761fb996c8d802e7474a148faa1fa33e60f348b56ba8bedb2e4fd06a01a254f62943cccfbedef0e43b7a7f5305ed0156dd361d5cba8d88b8c86b39285a6e92f1139f62d82724e484b42cb480b55b46482c1d68645488f52c86f1c99a94b0175c87d12e0f3335701fd312a868ea4ec8ddee7ea0a7f94cb1ece353db51075f6eb02c1781b3db45c21650eb2c6c45acc9340fd31ae2fa8a35c2f528ffc6383d7e20d2a57b7f5c70ff09422bbe6c5ee18c28a72fa8abf01d4a53dde22361faa68ff00297b4cd60ff19ff0c4cba2f88fd6f14df8f886152d03202998136b29b322081c6ae5040150ca59342f8ce18a628d135ffd13ffd9);
INSERT INTO `user` (`UserID`, `Name`, `UserName`, `Password`, `Email`, `ContactNo`, `JoinedYear`, `DisplayID`, `UserType`, `ProfilePic`) VALUES
(3, 'Pavani Marasinghe', 'Pavani', '$2y$10$FszLxmPf9wZ2HbcmNjUlLuIL4L0p2xOcPhodqVP6rq/dD52t274Xa', 'pavani@gmail.com', 776712345, '2019-08-01', 'AC00001', 'Accountant', NULL),
(4, 'Chathura Alwis', 'Chathura', '$2y$10$32qhL..6B.Q4aVGPxAuRyOEo6jVIf9H6TcMX1uBnW4MQ5bSvH8luC', 'chathura@gmail.com', 788854567, '2019-07-19', 'GM00001', 'Manager', NULL),
(6, 'Member', 'Member', '$2y$10$9RaH99CEpIK1ivO.KwhRUOdsalIUeP3vYuzT/2xd8PU4vfgmfF7sG', 'member@gmail.com', 789012346, '2020-08-30', 'LM00001', 'Life Member', NULL),
(13, 'U.P.Perera', 'Priyani', '$2y$10$tUb0K.wyPaVrM7UV2wTdy.yTCBF/K3FJGMnm46XW1apxjVEwtkYOa', 'priyani@gmail.com', 789012346, '2021-10-05', 'S0002', 'Staff Member', NULL),
(14, 'S.Rupasinghe', 'Sumith', '$2y$10$hw0xzIbaG57V11zsEmXsZueeYXOQx71VriiLYStCu6ehnJV8/Qjem', 'sumith@gmail.com', 789012342, '2021-10-03', 'S0003', 'Staff Member', NULL),
(15, 'J.S.Peris', 'Jayani', '$2y$10$9A/2JIgWKjr0m3fH2oNmrOglFJNsd.XJ0zylSYEH/M4itx8iVmARG', 'Jayani@gmail.com', 719012346, '2021-10-17', 'HL00002', 'HL Member', NULL),
(17, 'P.N.S.Bandara', 'Bandara', '$2y$10$/2djmpADeEImOFxZaiG.SeRwcB0Q/WUpG8ljv525YrI9/hSDPJu.G', 'Bandara@gmail.com', 789012346, '2021-10-17', 'OM00001', 'Ordinary Member', NULL),
(18, 'Venushi Alwis', 'Shaveen', '$2y$10$p0oYbkvpvMsx1F4UKTmof.03KzAUMp6dG9eB0ZkBMWZHRJvOyk5QW', 'venushi@gmail.com', 719012342, '2021-10-19', 'CA0005', 'Cashier', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `visapayment`
--

CREATE TABLE `visapayment` (
  `PaymentID` int(11) NOT NULL,
  `CardName` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `visapayment`
--

INSERT INTO `visapayment` (`PaymentID`, `CardName`) VALUES
(1, 'Master');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`BillID`),
  ADD UNIQUE KEY `OrderID` (`OrderID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `bookingreservation`
--
ALTER TABLE `bookingreservation`
  ADD PRIMARY KEY (`BookingID`,`ReservationName`),
  ADD KEY `ReservationName` (`ReservationName`);

--
-- Indexes for table `cashpayment`
--
ALTER TABLE `cashpayment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD UNIQUE KEY `ReceiptNo` (`ReceiptNo`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`Company`);

--
-- Indexes for table `deletebooking`
--
ALTER TABLE `deletebooking`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `deleteinvioce`
--
ALTER TABLE `deleteinvioce`
  ADD PRIMARY KEY (`InvoiceID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `deleteinvoiceitem`
--
ALTER TABLE `deleteinvoiceitem`
  ADD KEY `InvoiceID` (`InvoiceID`),
  ADD KEY `ItemID` (`ItemID`);

--
-- Indexes for table `deleteitem`
--
ALTER TABLE `deleteitem`
  ADD KEY `CompanyID` (`CompanyID`);

--
-- Indexes for table `deleteuser`
--
ALTER TABLE `deleteuser`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `DisplayID` (`DisplayID`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`FeedBackID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `ReplyPersonID` (`ReplyPersonID`);

--
-- Indexes for table `grn`
--
ALTER TABLE `grn`
  ADD PRIMARY KEY (`GRNID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `CompanyName` (`CompanyName`);

--
-- Indexes for table `grnitem`
--
ALTER TABLE `grnitem`
  ADD PRIMARY KEY (`GRNID`,`ItemID`),
  ADD KEY `ItemID` (`ItemID`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`InvoiceID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `Company` (`Company`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`ItemID`),
  ADD UNIQUE KEY `ItemName` (`ItemName`),
  ADD KEY `Company` (`Company`);

--
-- Indexes for table `leave`
--
ALTER TABLE `leave`
  ADD PRIMARY KEY (`UserID`,`LeaveDate`),
  ADD KEY `ManagerID` (`ManagerID`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`NotificationID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`OrderID`,`ItemID`),
  ADD KEY `ItemID` (`ItemID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD UNIQUE KEY `BookingID` (`BookingID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`ReportID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `reservationmenu`
--
ALTER TABLE `reservationmenu`
  ADD PRIMARY KEY (`ReservationName`);

--
-- Indexes for table `restaurantmessage`
--
ALTER TABLE `restaurantmessage`
  ADD PRIMARY KEY (`No`);

--
-- Indexes for table `returngrn`
--
ALTER TABLE `returngrn`
  ADD PRIMARY KEY (`GRNID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `returngrnitem`
--
ALTER TABLE `returngrnitem`
  ADD PRIMARY KEY (`GRNID`,`ItemID`),
  ADD KEY `ItemID` (`ItemID`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`SalaryID`);

--
-- Indexes for table `salarystaff`
--
ALTER TABLE `salarystaff`
  ADD PRIMARY KEY (`SalaryID`,`StaffID`),
  ADD KEY `StaffID` (`StaffID`);

--
-- Indexes for table `servicecharge`
--
ALTER TABLE `servicecharge`
  ADD PRIMARY KEY (`ServiceChargeID`);

--
-- Indexes for table `servicechargestaff`
--
ALTER TABLE `servicechargestaff`
  ADD PRIMARY KEY (`ServiceChargeID`,`StaffID`),
  ADD KEY `StaffID` (`StaffID`);

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`SignupID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `DisplayID` (`DisplayID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `UserName` (`UserName`);

--
-- Indexes for table `visapayment`
--
ALTER TABLE `visapayment`
  ADD PRIMARY KEY (`PaymentID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `BillID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `BookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `FeedBackID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `grn`
--
ALTER TABLE `grn`
  MODIFY `GRNID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `InvoiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `ItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `NotificationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `ReportID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurantmessage`
--
ALTER TABLE `restaurantmessage`
  MODIFY `No` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `salary`
--
ALTER TABLE `salary`
  MODIFY `SalaryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `servicecharge`
--
ALTER TABLE `servicecharge`
  MODIFY `ServiceChargeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `signup`
--
ALTER TABLE `signup`
  MODIFY `SignupID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON UPDATE CASCADE;

--
-- Constraints for table `bookingreservation`
--
ALTER TABLE `bookingreservation`
  ADD CONSTRAINT `bookingreservation_ibfk_1` FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bookingreservation_ibfk_2` FOREIGN KEY (`ReservationName`) REFERENCES `reservationmenu` (`ReservationName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cashpayment`
--
ALTER TABLE `cashpayment`
  ADD CONSTRAINT `cashpayment_ibfk_1` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`PaymentID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `deletebooking`
--
ALTER TABLE `deletebooking`
  ADD CONSTRAINT `deletebooking_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `deleteinvioce`
--
ALTER TABLE `deleteinvioce`
  ADD CONSTRAINT `deleteinvioce_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `deleteinvoiceitem`
--
ALTER TABLE `deleteinvoiceitem`
  ADD CONSTRAINT `deleteinvoiceitem_ibfk_1` FOREIGN KEY (`InvoiceID`) REFERENCES `deleteinvioce` (`InvoiceID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deleteinvoiceitem_ibfk_2` FOREIGN KEY (`ItemID`) REFERENCES `item` (`ItemID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `deleteitem`
--
ALTER TABLE `deleteitem`
  ADD CONSTRAINT `deleteitem_ibfk_1` FOREIGN KEY (`CompanyID`) REFERENCES `item` (`ItemID`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`ReplyPersonID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `grn`
--
ALTER TABLE `grn`
  ADD CONSTRAINT `grn_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grn_ibfk_2` FOREIGN KEY (`CompanyName`) REFERENCES `company` (`Company`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `grnitem`
--
ALTER TABLE `grnitem`
  ADD CONSTRAINT `grnitem_ibfk_2` FOREIGN KEY (`ItemID`) REFERENCES `item` (`ItemID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grnitem_ibfk_3` FOREIGN KEY (`GRNID`) REFERENCES `grn` (`GRNID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`Company`) REFERENCES `company` (`Company`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`Company`) REFERENCES `company` (`Company`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `leave`
--
ALTER TABLE `leave`
  ADD CONSTRAINT `leave_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `leave_ibfk_2` FOREIGN KEY (`ManagerID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`ItemID`) REFERENCES `item` (`ItemID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `returngrn`
--
ALTER TABLE `returngrn`
  ADD CONSTRAINT `returngrn_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `returngrnitem`
--
ALTER TABLE `returngrnitem`
  ADD CONSTRAINT `returngrnitem_ibfk_1` FOREIGN KEY (`GRNID`) REFERENCES `returngrn` (`GRNID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `returngrnitem_ibfk_2` FOREIGN KEY (`ItemID`) REFERENCES `item` (`ItemID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salarystaff`
--
ALTER TABLE `salarystaff`
  ADD CONSTRAINT `salarystaff_ibfk_1` FOREIGN KEY (`SalaryID`) REFERENCES `salary` (`SalaryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `salarystaff_ibfk_2` FOREIGN KEY (`StaffID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `servicechargestaff`
--
ALTER TABLE `servicechargestaff`
  ADD CONSTRAINT `servicechargestaff_ibfk_1` FOREIGN KEY (`ServiceChargeID`) REFERENCES `servicecharge` (`ServiceChargeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `servicechargestaff_ibfk_2` FOREIGN KEY (`StaffID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `visapayment`
--
ALTER TABLE `visapayment`
  ADD CONSTRAINT `visapayment_ibfk_1` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`PaymentID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
