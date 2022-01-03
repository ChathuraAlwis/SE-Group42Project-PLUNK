-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 31, 2021 at 05:40 PM
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
(16, 'nurad', 1078, 10, 0, '2021-10-21', 17, 21, 'Yes'),
(17, 'abiru', 660, 10, 0, '2021-10-21', 17, 22, 'No'),
(18, 'adithya', 294, 10, 12, '2021-10-21', 18, 23, 'No'),
(19, 'ruvin', 660, 10, 0, '2021-10-21', 17, 24, 'Yes'),
(20, 'Bandara', 990, 10, 0, '2021-10-22', 17, 25, 'Yes'),
(21, 'Bandara', 264, 10, 0, '2021-10-22', 17, 26, 'Yes'),
(22, 'Bandara', 660, 10, 0, '2021-10-22', 17, 27, 'Yes'),
(23, 'Shaveen', 95, 10, 10, '2021-10-22', 18, 28, 'Yes'),
(24, 'Jayani', 781, 10, 0, '2021-12-10', 15, 31, 'Yes'),
(25, 'Bandara', 1089, 10, 0, '2021-12-11', 17, 32, 'Yes');

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
(12, 'Bandara', 'Club', 40, '2021-10-25', '08:00:00', '09:00:00', '2021-10-22', NULL, 722222567, 10000, 'No', 17),
(13, 'Jayani', 'Restaurant', 20, '2021-12-21', '17:00:00', '19:00:00', '2021-12-12', NULL, 711154554, 1000, 'No', 15);

-- --------------------------------------------------------

--
-- Table structure for table `bookingreservation`
--

CREATE TABLE `bookingreservation` (
  `BookingID` int(11) NOT NULL,
  `ReservationName` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookingreservation`
--

INSERT INTO `bookingreservation` (`BookingID`, `ReservationName`) VALUES
(1, 'lounge'),
(1, 'table2'),
(2, 'table1'),
(2, 'table3'),
(3, 'table2'),
(13, 'table4'),
(13, 'table5');

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
  `PhoneNo` varchar(10) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Remove` enum('No','Yes') NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`Company`, `DistributorName`, `PhoneNo`, `Email`, `Remove`) VALUES
('BloomfieldKitchen', 'D.S.Thennakon', '0700234567', 'DSThennakon@gmail.com', 'No'),
('Cocacola', 'L.S.Dabare', '0711234576', 'LSDabare@gmail.com', 'No'),
('Elephanthouse', 'T.L.Fernando', '0711234567', 'TLFernando@gmail.com', 'No'),
('Kothmale', 'M.W.Dabare', '0711678567', 'MWDabare@gmail.com', 'No'),
('Mr.POP', 'R.I.Sirisena', '0701234321', 'RISirisena@gmail.com', 'No'),
('Munchee', 'R.W.Ranaweera', '0721234987', 'RWRanaweera@gmail.com', 'No'),
('Nestle', 'G.P.Abethunga', '0781234321', 'GPAbethunga@gmail.com', 'No');

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
  `DisplayID` varchar(10) NOT NULL,
  `Reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deleteuser`
--

INSERT INTO `deleteuser` (`UserID`, `DisplayID`, `Reason`) VALUES
(6, 'LM00001', 'Found a new job'),
(7, 'OM0001', 'End the agreement period resigned');

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
(4, 'Cocacola', '2021-10-20', 'Beverage', 2),
(12, 'Nestle', '2021-12-19', 'Beverage', 2),
(14, 'Mr.POP', '2021-12-19', 'Food', 2),
(15, 'Munchee', '2021-12-20', 'Food', 2),
(18, 'Elephanthouse', '2021-12-21', 'Beverage', 2),
(22, 'Cocacola', '2021-12-21', 'Beverage', 2);

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
(3, 2, 'EGB-Elephant-House-50ml', 100),
(3, 8, 'Elephant-house-cream-soda-500ml', 200),
(4, 3, 'Coca-Cola-1L', 30),
(12, 21, 'Nestle-Milo-180ml', 10),
(14, 18, 'Tip-Tip', 16),
(15, 6, 'Tiffin-180g', 10),
(15, 20, 'ChocolateChipCookies-180g\r\n', 10),
(18, 8, 'cream-soda-500ml', 30),
(18, 22, 'Necto-1L', 10),
(18, 23, 'freshmilk500ml', 11),
(18, 25, 'AppleSoda-500ml', 17),
(22, 7, 'Sprite-500ml', 30);

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
  `UserID` int(11) NOT NULL,
  `AddToGRN` enum('No','Yes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`InvoiceID`, `Company`, `Type`, `ReceivedDate`, `DueDate`, `Total`, `UserID`, `AddToGRN`) VALUES
(1, 'Kothmale', 'Food', '2021-09-26', '2021-11-26', 7000, 3, 'Yes'),
(2, 'Elephanthouse', 'Beverage', '2021-10-19', '2021-12-16', 423, 3, 'Yes'),
(3, 'Cocacola', 'Beverage', '2021-10-20', '2021-12-16', 9000, 3, 'Yes'),
(4, 'Mr.POP', 'Food', '2021-10-22', '2021-12-23', 800, 3, 'Yes'),
(9, 'Nestle', 'Beverage', '2021-10-20', '2021-12-26', 2000, 3, 'Yes'),
(11, 'Munchee', 'Food', '2021-10-22', '2021-12-24', 1760, 3, 'Yes'),
(12, 'Elephanthouse', 'Beverage', '2021-10-21', '2021-12-21', 4030, 3, 'Yes'),
(13, 'Cocacola', 'Beverage', '2021-11-16', '2022-01-04', 2400, 2, 'Yes'),
(14, 'Mr.POP', 'Food', '2021-11-22', '2022-01-07', 825, 2, 'No');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `ItemID` int(11) NOT NULL,
  `ItemType` enum('Food','Beverage') NOT NULL,
  `Company` varchar(50) NOT NULL,
  `ItemName` varchar(100) NOT NULL,
  `PurchasePrice` int(11) NOT NULL,
  `SellingPrice` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Discount` int(11) NOT NULL,
  `Availability` enum('Yes','No') NOT NULL DEFAULT 'No',
  `ReorderQuantity` int(11) NOT NULL,
  `IsDeleted` enum('No','Yes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`ItemID`, `ItemType`, `Company`, `ItemName`, `PurchasePrice`, `SellingPrice`, `Quantity`, `Discount`, `Availability`, `ReorderQuantity`, `IsDeleted`) VALUES
(1, 'Food', 'BloomfieldKitchen', 'FriedRice', 250, 300, 30, 0, 'Yes', 0, 'No'),
(2, 'Beverage', 'Elephanthouse', 'EGB-500ml', 80, 100, 100, 5, 'Yes', 50, 'No'),
(3, 'Beverage', 'Cocacola', 'CocaCola-1L', 275, 350, 20, 2, 'No', 25, 'No'),
(4, 'Food', 'Mr.POP', 'Chocolate-Popcorn', 55, 60, 0, 0, 'No', 20, 'No'),
(5, 'Food', 'Kothmale', 'Ice-Cream-4L', 700, 800, 5, 1, 'Yes', 10, 'No'),
(6, 'Food', 'Munchee', 'Tiffin-180g', 90, 100, 61, 2, 'Yes', 20, 'No'),
(7, 'Beverage', 'Cocacola', 'Sprite-500ml', 80, 100, 30, 0, 'Yes', 15, 'No'),
(8, 'Beverage', 'Elephanthouse', 'cream-soda-500ml', 55, 65, 150, 5, 'Yes', 25, 'No'),
(9, 'Food', 'BloomfieldKitchen', 'Buriyani-180g', 375, 400, 20, 0, 'No', 0, 'No'),
(18, 'Food', 'Mr.POP', 'Tip-Tip', 50, 50, 25, 0, 'No', 20, 'No'),
(19, 'Food', 'Mr.POP', 'Butter-Popcorn', 50, 50, 25, 0, 'Yes', 23, 'No'),
(20, 'Food', 'Munchee', 'ChocolateChipCookies-180g', 86, 100, 20, 3, 'Yes', 10, 'No'),
(21, 'Beverage', 'Nestle', 'Nestle-Milo-180ml', 50, 55, 46, 0, 'Yes', 20, 'No'),
(22, 'Beverage', 'Elephanthouse', 'Necto-1L', 130, 150, 10, 2, 'No', 5, 'No'),
(23, 'Beverage', 'Elephanthouse', 'freshmilk500ml', 180, 200, 21, 0, 'Yes', 12, 'No'),
(24, 'Beverage', 'Elephanthouse', 'Soda-1l', 200, 220, 20, 0, 'Yes', 5, 'No'),
(25, 'Beverage', 'Elephanthouse', 'AppleSoda-500ml', 50, 60, 22, 0, 'Yes', 15, 'No'),
(31, 'Food', 'Elephanthouse', 'WonderBar-Chocolate', 50, 60, 40, 0, 'Yes', 20, 'No');

-- --------------------------------------------------------

--
-- Table structure for table `leave`
--

CREATE TABLE `leave` (
  `UserID` int(11) NOT NULL,
  `RequestedDate` date NOT NULL,
  `LeaveDate` date NOT NULL,
  `LeaveType` enum('Annual','Casual','Medical') NOT NULL,
  `NoOfdays` int(11) NOT NULL,
  `Reason` text NOT NULL,
  `Accepted` enum('Yes','No') NOT NULL DEFAULT 'No',
  `ManagerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leave`
--

INSERT INTO `leave` (`UserID`, `RequestedDate`, `LeaveDate`, `LeaveType`, `NoOfdays`, `Reason`, `Accepted`, `ManagerID`) VALUES
(2, '2021-10-21', '2021-10-24', 'Annual', 1, 'I have to go to my village because my grandmother is not well.', 'No', 4),
(3, '2021-10-14', '2021-10-18', 'Annual', 1, 'I have to get the second dose of the covid vaccine. ', 'Yes', 4),
(3, '2021-12-31', '2022-01-02', '', 2, 'Pruvgfg', 'No', 4),
(3, '2021-12-31', '2022-01-05', 'Medical', 1, 'gsrgsgd', 'Yes', NULL),
(3, '2021-12-31', '2022-01-06', 'Annual', 1, 'dfvda', 'No', NULL),
(3, '2021-12-31', '2022-01-07', 'Medical', 1, 'wrgqrv', 'Yes', NULL),
(3, '2021-12-31', '2022-01-11', 'Casual', 1, 'wefweg', 'No', NULL),
(3, '2021-12-31', '2022-01-19', 'Medical', 1, 'efegre', 'No', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `NotificationID` int(11) NOT NULL,
  `FromDate` date NOT NULL,
  `ToDate` date DEFAULT NULL,
  `EventType` enum('Club','Restaurant') NOT NULL,
  `Message` text NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`NotificationID`, `FromDate`, `ToDate`, `EventType`, `Message`, `UserID`) VALUES
(1, '2021-09-28', '2021-09-28', 'Restaurant', 'The restaurant will be closed tomorrow (2021/09/29)', 2),
(2, '2021-10-21', '2021-10-23', 'Restaurant', 'There will be a special offer at ElephantHouse products on 2021/10/23 ', 2),
(3, '2021-11-22', '2021-11-26', 'Club', 'You have a special offer to book club properties on this Friday(2021/11/26)', 2),
(4, '2021-12-01', '2022-01-03', 'Restaurant', 'There is a special Christmas offer restaurant bookings and selected items from 2021/12/24 to 2022/01/03.', 2);

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
(31, '2021-12-10', '20:05:00', 'Lounge', 710, 15),
(32, '2021-12-11', '21:56:00', 'Lounge', 990, 17);

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
(31, 21, 2),
(32, 2, 2),
(32, 9, 2);

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
  `Availability` enum('Yes','No') NOT NULL,
  `IsDeleted` enum('No','Yes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservationmenu`
--

INSERT INTO `reservationmenu` (`ReservationName`, `Type`, `Cost`, `Availability`, `IsDeleted`) VALUES
('Center-Wicket1', 'Club', 5000, 'Yes', 'No'),
('Center-Wicket2', 'Club', 5000, 'Yes', 'No'),
('lounge', 'Club', 5000, 'Yes', 'No'),
('Practice-Net1', 'Club', 2500, 'Yes', 'No'),
('Practice-Net2', 'Club', 2500, 'Yes', 'No'),
('Practice-Net3', 'Club', 2500, 'Yes', 'No'),
('Practice-Net4', 'Club', 2500, 'Yes', 'No'),
('Practice-Net5', 'Club', 2500, 'Yes', 'No'),
('Practice-Net6', 'Club', 2500, 'Yes', 'No'),
('Practice-Wicket1', 'Club', 5000, 'Yes', 'No'),
('Practice-Wicket2', 'Club', 5000, 'Yes', 'No'),
('Practice-Wicket3', 'Club', 5000, 'Yes', 'No'),
('Practice-Wicket4', 'Club', 5000, 'Yes', 'No'),
('table1', 'Restaurant', 500, 'Yes', 'No'),
('table2', 'Restaurant', 500, 'Yes', 'No'),
('table3', 'Restaurant', 500, 'Yes', 'No'),
('table4', 'Restaurant', 500, 'No', 'No'),
('table5', 'Restaurant', 500, 'Yes', 'No'),
('table6', 'Restaurant', 500, 'Yes', 'No'),
('table7', 'Restaurant', 500, 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `restaurantmessage`
--

CREATE TABLE `restaurantmessage` (
  `No` int(11) NOT NULL,
  `Message` text NOT NULL,
  `Display` enum('Yes','No') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `restaurantmessage`
--

INSERT INTO `restaurantmessage` (`No`, `Message`, `Display`) VALUES
(1, 'The restaurant is opened now.', 'No'),
(2, 'The restaurant is closed now.', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `returngrn`
--

CREATE TABLE `returngrn` (
  `GRNID` int(11) NOT NULL,
  `CompanyName` varchar(50) NOT NULL,
  `AddDate` date NOT NULL,
  `ItemType` enum('Food','Beverage') NOT NULL,
  `ReturnDate` date NOT NULL,
  `Reason` text NOT NULL,
  `UserID` int(11) NOT NULL,
  `Accepted` enum('Yes','No') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `returngrn`
--

INSERT INTO `returngrn` (`GRNID`, `CompanyName`, `AddDate`, `ItemType`, `ReturnDate`, `Reason`, `UserID`, `Accepted`) VALUES
(2, 'Company2', '2021-10-03', 'Beverage', '2021-10-10', 'Expired items', 2, 'Yes'),
(5, 'Munchee', '2021-10-18', 'Food', '2021-10-21', 'Items are Expired', 2, 'No'),
(12, 'Nestle', '2021-12-19', 'Beverage', '2021-12-24', 'Expired items', 2, 'No');

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
(5, 6, 'Tiffin-180g', 20),
(12, 21, 'Nestle-Milo-180ml', 10);

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `SalaryID` int(11) NOT NULL,
  `Date` varchar(15) NOT NULL,
  `WorkingDays` int(11) NOT NULL DEFAULT 30
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`SalaryID`, `Date`, `WorkingDays`) VALUES
(1, '2021-09-30', 30),
(2, '2021-10-31', 30);

-- --------------------------------------------------------

--
-- Table structure for table `salarydetails`
--

CREATE TABLE `salarydetails` (
  `StaffID` int(11) NOT NULL,
  `BasicSalary` int(11) NOT NULL,
  `Bonus` int(11) NOT NULL,
  `ETF` int(11) NOT NULL,
  `EPF` int(11) NOT NULL,
  `Percentage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `Date` varchar(15) NOT NULL
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
  `ProfilePic` longblob DEFAULT NULL,
  `IsDeleted` enum('No','Yes') NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Name`, `UserName`, `Password`, `Email`, `ContactNo`, `JoinedYear`, `DisplayID`, `UserType`, `ProfilePic`, `IsDeleted`) VALUES
(1, 'Shan Dilranga', 'Shan', '$2y$10$HFG.V/09PPziKI9kDwydHOP256LVXZ8Ax6pgn2CvnXZPTmVdpZp46', 'Shan@gmail.com', 711234567, '2019-06-04', 'AD00001', 'Admin', NULL, 'No'),
(2, 'Gimhani Rubasinghe', 'Gimhani', '$2y$10$t5HGheC1t8YV/QvQylEn4eoVfTTqputMd1WeOYTVlIl/2H8vm6WGe', 'gimhani@gmail.com', 700234567, '2019-07-17', 'RM00001', 'Restaurant Manager', NULL, 'No'),
(3, 'Pavani Marasinghe', 'Pavani', '$2y$10$FszLxmPf9wZ2HbcmNjUlLuIL4L0p2xOcPhodqVP6rq/dD52t274Xa', 'pavani@gmail.com', 776712345, '2019-08-01', 'AC00001', 'Accountant', NULL, 'No'),
(4, 'Chathura Alwis', 'Chathura', '$2y$10$32qhL..6B.Q4aVGPxAuRyOEo6jVIf9H6TcMX1uBnW4MQ5bSvH8luC', 'chathura@gmail.com', 788854567, '2019-07-19', 'GM00001', 'Manager', NULL, 'No'),
(6, 'Member', 'Member', '$2y$10$9RaH99CEpIK1ivO.KwhRUOdsalIUeP3vYuzT/2xd8PU4vfgmfF7sG', 'member@gmail.com', 789012346, '2020-08-30', 'LM00001', 'Life Member', NULL, 'Yes'),
(7, 'Piyal Perera', 'piyal(member)', '$2y$10$9RaH99CEpIK1ivO.KwhRUOdsalIUeP3vYuzT/2xd8PU4vfgmfF7sG', 'piyal@gmail.com', 781154576, '2018-10-17', 'OM0001', 'Ordinary Member', NULL, 'Yes'),
(13, 'U.P.Perera', 'Priyani', '$2y$10$tUb0K.wyPaVrM7UV2wTdy.yTCBF/K3FJGMnm46XW1apxjVEwtkYOa', 'priyani@gmail.com', 789012346, '2021-10-05', 'S0002', 'Staff Member', NULL, 'No'),
(14, 'S.Rubasinghe', 'Sumith', '$2y$10$hw0xzIbaG57V11zsEmXsZueeYXOQx71VriiLYStCu6ehnJV8/Qjem', 'sumith@gmail.com', 789012342, '2021-10-03', 'S0003', 'Staff Member', NULL, 'No'),
(15, 'J.S.Peris', 'Jayani', '$2y$10$9A/2JIgWKjr0m3fH2oNmrOglFJNsd.XJ0zylSYEH/M4itx8iVmARG', 'Jayani@gmail.com', 719012346, '2021-10-17', 'HL00002', 'HL Member', NULL, 'No'),
(17, 'P.N.S.Bandara', 'Bandara', '$2y$10$/2djmpADeEImOFxZaiG.SeRwcB0Q/WUpG8ljv525YrI9/hSDPJu.G', 'Bandara@gmail.com', 789012346, '2021-10-17', 'OM00001', 'Ordinary Member', NULL, 'No'),
(18, 'Venushi Alwis', 'Shaveen', '$2y$10$p0oYbkvpvMsx1F4UKTmof.03KzAUMp6dG9eB0ZkBMWZHRJvOyk5QW', 'venushi@gmail.com', 719012342, '2021-10-19', 'CA0005', 'Cashier', NULL, 'No');

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
-- Indexes for table `salarydetails`
--
ALTER TABLE `salarydetails`
  ADD PRIMARY KEY (`StaffID`);

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
  MODIFY `BillID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `BookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `FeedBackID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `grn`
--
ALTER TABLE `grn`
  MODIFY `GRNID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `InvoiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `ItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `NotificationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

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
-- Constraints for table `deleteuser`
--
ALTER TABLE `deleteuser`
  ADD CONSTRAINT `deleteuser_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `salarydetails`
--
ALTER TABLE `salarydetails`
  ADD CONSTRAINT `salarydetails_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

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
