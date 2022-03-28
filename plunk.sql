
CREATE DATABASE IF NOT EXISTS `plunk` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `plunk`;

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
(30, 'Piyumi', 1738, 10, 0, '2022-03-27', 18, 1, 'Yes'),
(31, 'Jagath', 242, 10, 0, '2022-03-27', 18, 2, 'Yes'),
(32, 'Bandara', 1367, 10, 0, '2022-03-27', 17, 3, 'Yes'),
(33, 'Bandara', 594, 10, 0, '2022-03-27', 17, 4, 'No'),
(34, 'Bandara', 11550, 10, 0, '2022-03-28', 17, 5, 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `BookingID` int(11) NOT NULL,
  `CustomerName` varchar(50) NOT NULL,
  `BookingType` enum('Club','Restaurant') NOT NULL,
  `Reservation` varchar(25) NOT NULL,
  `NoOfPeople` int(11) NOT NULL,
  `ReservedDate` date NOT NULL,
  `ReservedTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `CreatedDate` date NOT NULL,
  `LastModifiedDate` date DEFAULT NULL,
  `ContactNo` int(11) NOT NULL,
  `Total` int(11) NOT NULL,
  `Payment` enum('Yes','No') NOT NULL,
  `UserID` int(11) NOT NULL,
  `permission` enum('No Decision','Confirmed','Denied') NOT NULL DEFAULT 'No Decision'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`BookingID`, `CustomerName`, `BookingType`, `Reservation`, `NoOfPeople`, `ReservedDate`, `ReservedTime`, `EndTime`, `CreatedDate`, `LastModifiedDate`, `ContactNo`, `Total`, `Payment`, `UserID`, `permission`) VALUES
(21, 'Nurad', 'Restaurant', 'table-02', 1, '2022-03-30', '18:00:00', '21:00:00', '2022-03-27', '2022-03-27', 788854567, 500, 'Yes', 4, 'Confirmed'),
(22, 'Jithru', 'Club', 'PracticeWicket-02', 1, '2022-04-01', '09:00:00', '17:01:00', '2022-03-27', '2022-03-27', 788854511, 5000, 'Yes', 4, 'No Decision'),
(24, 'P.N.S.Bandara', 'Club', 'PracticeWicket-02', 1, '2022-04-02', '09:00:00', '17:11:00', '2022-03-27', '2022-03-27', 789012346, 5000, 'Yes', 17, 'Confirmed'),
(25, 'Nimali', 'Restaurant', 'table-06', 1, '2022-03-28', '17:33:00', '22:34:00', '2022-03-28', '2022-03-28', 788854567, 500, 'Yes', 4, 'No Decision'),
(26, 'Chathura Alwis', 'Club', 'PracticeWicket-02', 1, '2022-04-05', '09:15:00', '16:30:00', '2022-03-28', '2022-03-28', 788854567, 5000, 'Yes', 4, 'No Decision');

-- --------------------------------------------------------

--
-- Table structure for table `cashpayment`
--

CREATE TABLE `cashpayment` (
  `PaymentID` int(11) NOT NULL,
  `ReceiptNo` int(11) NOT NULL,
  `SignedPerson` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 'The practice pitch was not set properly for practices ', '2021-10-03', 17, 'I am really sorry sir. We will inform the ground staff about that.', '2021-10-04', 4),
(2, 'The food is tasty and the service is also satisfactory. Thank you!', '2021-10-17', 15, 'Thank you', '2022-03-26', 1),
(3, ' It is a great experience. The ambiance is very welcoming and charming. Amazing food and service. Staff are extremely knowledgeable and make great recommendations.', '2022-03-26', 17, NULL, NULL, NULL);

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
(1, 'BloomfieldKitchen', '2022-03-26', 'Food', 2),
(2, 'Cocacola', '2022-03-26', 'Beverage', 2),
(3, 'Elephanthouse', '2022-03-26', 'Beverage', 2),
(4, 'Nestle', '2022-03-26', 'Beverage', 2),
(7, 'Elephanthouse', '2022-03-26', 'Beverage', 2),
(8, 'Nestle', '2022-03-27', 'Beverage', 2);

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
(1, 1, 'FriedRice', 20),
(2, 3, 'Cocacola', 20),
(2, 7, 'Sprite-500ml', 100),
(3, 2, 'EGB-500ml', 70),
(3, 8, 'cream-soda-500ml', 100),
(4, 21, 'Milo-180ml', 100),
(7, 22, 'Necto-1L', 20),
(7, 24, 'Soda-1l', 20),
(7, 25, 'AppleSoda-500ml', 100),
(8, 21, 'Milo-180ml', 200);

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `HolidayID` int(11) NOT NULL,
  `Holiday` date NOT NULL,
  `Type` enum('Restaurant','Club','Restaurant and Club') NOT NULL,
  `Reason` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`HolidayID`, `Holiday`, `Type`, `Reason`) VALUES
(1, '2022-03-31', 'Restaurant', 'Poya day'),
(2, '2022-04-02', 'Restaurant', 'holiday');

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
(1, 'BloomfieldKitchen', 'Food', '2022-02-26', '2022-03-28', 5000, 3, 'Yes'),
(2, 'Cocacola', 'Beverage', '2022-01-09', '2022-04-09', 13500, 3, 'Yes'),
(3, 'Elephanthouse', 'Beverage', '2021-12-26', '2022-04-03', 11100, 3, 'Yes'),
(4, 'Kothmale', 'Food', '2022-03-24', '2022-05-01', 7000, 3, 'Yes'),
(5, 'Nestle', 'Beverage', '2022-03-25', '2022-05-01', 6000, 3, 'Yes'),
(6, 'Mr.POP', 'Food', '2022-03-22', '2022-04-24', 4650, 3, 'Yes'),
(7, 'Munchee', 'Food', '2022-03-20', '2022-05-22', 13500, 3, 'No'),
(8, 'Elephanthouse', 'Beverage', '2022-03-21', '2022-05-29', 11600, 3, 'Yes'),
(9, 'Elephanthouse', 'Food', '2022-03-23', '2022-05-15', 5000, 3, 'No'),
(10, 'Nestle', 'Beverage', '2022-03-01', '2022-04-30', 12000, 3, 'Yes');

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
(1, 'Food', 'BloomfieldKitchen', 'FriedRice', 250, 300, 13, 0, 'Yes', 0, 'No'),
(2, 'Beverage', 'Elephanthouse', 'EGB-500ml', 80, 100, 66, 5, 'Yes', 50, 'No'),
(3, 'Beverage', 'Cocacola', 'CocaCola-1L', 275, 350, 19, 2, 'Yes', 10, 'No'),
(4, 'Food', 'Mr.POP', 'Chocolate-Popcorn', 55, 60, 0, 0, 'No', 20, 'No'),
(5, 'Food', 'Kothmale', 'Ice-Cream-4L', 700, 800, 0, 1, 'No', 5, 'No'),
(6, 'Food', 'Munchee', 'Tiffin-180g', 90, 100, 0, 2, 'No', 20, 'No'),
(7, 'Beverage', 'Cocacola', 'Sprite-500ml', 80, 100, 100, 0, 'Yes', 15, 'No'),
(8, 'Beverage', 'Elephanthouse', 'cream-soda-500ml', 55, 65, 100, 5, 'Yes', 25, 'No'),
(9, 'Food', 'BloomfieldKitchen', 'Buriyani-180g', 375, 400, 0, 0, 'No', 0, 'No'),
(18, 'Food', 'Mr.POP', 'Tip-Tip', 50, 50, 0, 0, 'No', 20, 'No'),
(19, 'Food', 'Mr.POP', 'Butter-Popcorn', 50, 50, 0, 0, 'No', 23, 'No'),
(20, 'Food', 'Munchee', 'ChocolateChipCookies-180g', 90, 100, 0, 3, 'No', 10, 'No'),
(21, 'Beverage', 'Nestle', 'Milo-180ml', 60, 70, 150, 0, 'Yes', 20, 'No'),
(22, 'Beverage', 'Elephanthouse', 'Necto-1L', 130, 150, 20, 2, 'No', 5, 'No'),
(23, 'Beverage', 'Elephanthouse', 'freshmilk500ml', 180, 200, 0, 0, 'No', 12, 'No'),
(24, 'Beverage', 'Elephanthouse', 'Soda-1l', 200, 220, 19, 0, 'Yes', 5, 'No'),
(25, 'Beverage', 'Elephanthouse', 'OrangeCrush-500ml', 50, 60, 91, 0, 'Yes', 15, 'No'),
(31, 'Food', 'Elephanthouse', 'WonderBar-Chocolate', 50, 60, 100, 0, 'Yes', 20, 'No'),
(39, 'Food', 'Munchee', 'Chocolate-Biscuit', 90, 100, 0, 0, 'No', 15, 'No');

-- --------------------------------------------------------

--
-- Table structure for table `lastdisplayid`
--

CREATE TABLE `lastdisplayid` (
  `MemberType` varchar(25) NOT NULL,
  `ID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lastdisplayid`
--

INSERT INTO `lastdisplayid` (`MemberType`, `ID`) VALUES
('Accountant', 'AC00001'),
('Admin', 'AD00001'),
('Cashier', 'CA00005'),
('Manager', 'GM00001'),
('HL Member', 'HL00003'),
('Life Member', 'LM00001'),
('Ordinary Member', 'OM00005'),
('Restaurant Manager', 'RM00001'),
('Staff Member', 'S00002');

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
(3, '2022-02-03', '2022-02-06', 'Annual', 1, 'I have to get the second dose of the covid vaccine. ', 'Yes', 4),
(14, '2022-03-27', '2022-03-27', 'Medical', 10, 'I have an operation.', 'Yes', 4),
(14, '2022-03-28', '2022-03-29', 'Casual', 3, 'test', 'Yes', 4),
(14, '2022-03-28', '2022-04-05', 'Casual', 3, 'test', 'Yes', 4),
(18, '2022-01-09', '2022-01-11', 'Casual', 3, 'I have to go to my village because my grandmother is not well.', 'No', 4),
(18, '2022-03-27', '2022-03-30', 'Casual', 1, 'I have to go to my grandmothers funeral', 'No', NULL);

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
(2, '2021-10-21', '2021-10-23', 'Restaurant', 'There will be a special offer at ElephantHouse products on 2021/10/23 ', 2),
(3, '2021-11-22', '2021-11-26', 'Club', 'You have a special offer to book club properties on this Friday(2021/11/26)', 2),
(4, '2021-12-01', '2022-01-03', 'Restaurant', 'There is a special Christmas offer restaurant bookings and selected items from 2021/12/24 to 2022/01/03.', 2),
(6, '2022-02-01', '2022-03-31', 'Club', 'Center wickets are unable to book in March due to the reform issue. Sorry for that and it will be available soon.', 2);

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
(1, '2022-01-17', '00:51:00', 'Lounge', 1580, 18),
(2, '2022-01-27', '00:55:00', 'Lounge', 220, 18),
(3, '2022-02-07', '01:00:00', 'Lounge', 1243, 17),
(4, '2022-02-22', '01:00:00', 'Table9', 540, 17),
(5, '2022-03-28', '00:07:00', 'Lounge', 10500, 17);

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
(1, 1, 4),
(1, 2, 4),
(2, 24, 1),
(3, 1, 3),
(3, 3, 1),
(4, 25, 9),
(5, 21, 150);

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
  `Paid` enum('Yes','No') NOT NULL,
  `ReceiptNo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
('CenterWicket-01', 'Club', 5000, 'No', 'No'),
('CenterWicket-02', 'Club', 5000, 'No', 'No'),
('lounge', 'Club', 5000, 'Yes', 'No'),
('PracticeNet-01', 'Club', 2500, 'Yes', 'No'),
('PracticeNet-02', 'Club', 2500, 'Yes', 'No'),
('PracticeNet-03', 'Club', 2500, 'Yes', 'No'),
('PracticeNet-04', 'Club', 2500, 'Yes', 'No'),
('PracticeNet-05', 'Club', 2500, 'Yes', 'No'),
('PracticeNet-06', 'Club', 2500, 'Yes', 'No'),
('PracticeWicket-01', 'Club', 5000, 'Yes', 'No'),
('PracticeWicket-02', 'Club', 5000, 'Yes', 'No'),
('PracticeWicket-03', 'Club', 5000, 'Yes', 'No'),
('PracticeWicket-04', 'Club', 5000, 'Yes', 'No'),
('table-01', 'Restaurant', 500, 'Yes', 'No'),
('table-02', 'Restaurant', 500, 'Yes', 'No'),
('table-03', 'Restaurant', 500, 'Yes', 'No'),
('table-04', 'Restaurant', 500, 'No', 'No'),
('table-05', 'Restaurant', 500, 'No', 'Yes'),
('table-06', 'Restaurant', 500, 'Yes', 'No'),
('table-07', 'Restaurant', 500, 'Yes', 'No'),
('table-08', 'Restaurant', 500, 'No', 'Yes'),
('table-10', 'Restaurant', 500, 'No', 'Yes');

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
(1, 'The restaurant is opened now.', 'Yes'),
(2, 'The restaurant is closed now.', 'No');

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
  `Accepted` enum('Pending','Yes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `returngrn`
--

INSERT INTO `returngrn` (`GRNID`, `CompanyName`, `AddDate`, `ItemType`, `ReturnDate`, `Reason`, `UserID`, `Accepted`) VALUES
(5, 'Kothmale', '2022-03-26', 'Food', '2022-03-26', 'Incorrect Stock details', 2, 'Yes'),
(6, 'Mr.POP', '2022-03-26', 'Food', '2022-03-26', 'Stock quality is not better to use.', 2, 'Yes');

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
(5, 5, 'Ice-Cream-4L', 10),
(6, 4, 'Chocolate-Popcorn', 30),
(6, 18, 'Tip-Tip', 30),
(6, 19, 'Butter-Popcorn', 30);

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `SalaryID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `WorkingDays` int(11) NOT NULL DEFAULT 30
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`SalaryID`, `Date`, `WorkingDays`) VALUES
(1, '2022-01-31', 28),
(2, '2022-02-28', 25),
(3, '2022-03-31', 28);

-- --------------------------------------------------------

--
-- Table structure for table `salarydetails`
--

CREATE TABLE `salarydetails` (
  `No` int(11) NOT NULL,
  `StaffID` varchar(25) NOT NULL,
  `StaffName` varchar(50) NOT NULL,
  `UserType` varchar(25) NOT NULL,
  `BasicSalary` float NOT NULL,
  `Bonus` float NOT NULL,
  `ETF` float NOT NULL,
  `EPF` float NOT NULL,
  `Percentage` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salarydetails`
--

INSERT INTO `salarydetails` (`No`, `StaffID`, `StaffName`, `UserType`, `BasicSalary`, `Bonus`, `ETF`, `EPF`, `Percentage`) VALUES
(1, 'AD00001', 'Shan Dilranga', 'Admin', 60000, 10, 15, 6, 3),
(4, 'RM00001', 'Gimhani Rubasinghe', 'Restaurant Manager', 90000, 12, 18, 8, 4),
(5, 'AC00001', 'Pavani Marasinghe', 'Accountant', 85000, 11, 17, 7, 4),
(6, 'CA00005', 'Venushi Alwis', 'Cashier', 75000, 8, 14, 5, 2),
(7, 'S00001', 'S.Rubasinghe', 'Staff Member', 35000, 5, 10, 4, 1),
(8, 'GM00001', 'Chathura Alwis', 'Manager', 125000, 15, 20, 10, 5),
(9, 'S00002', 'U.P.Perera', 'Staff Member', 35000, 5, 10, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `salarystaff`
--

CREATE TABLE `salarystaff` (
  `SalaryID` int(11) NOT NULL,
  `StaffID` varchar(25) NOT NULL,
  `StaffName` varchar(50) NOT NULL,
  `Basic` int(11) NOT NULL,
  `Bonus` int(11) DEFAULT NULL,
  `EPF` int(11) DEFAULT NULL,
  `ETF` int(11) DEFAULT NULL,
  `Total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salarystaff`
--

INSERT INTO `salarystaff` (`SalaryID`, `StaffID`, `StaffName`, `Basic`, `Bonus`, `EPF`, `ETF`, `Total`) VALUES
(1, 'AC00001', 'Pavani Marasinghe', 85000, 11, 7, 17, 114750),
(1, 'AD00001', 'Shan Dilranga', 60000, 10, 6, 15, 78600),
(1, 'CA00005', 'Venushi Alwis', 75000, 8, 5, 14, 95250),
(1, 'GM00001', 'Chathura Alwis', 125000, 15, 10, 20, 181250),
(1, 'RM00001', 'Gimhani Rubasinghe', 90000, 12, 8, 18, 124200),
(1, 'S00001', 'S.Rubasinghe', 35000, 5, 4, 10, 41650),
(2, 'AC00001', 'Pavani Marasinghe', 85000, 11, 7, 17, 114750),
(2, 'AD00001', 'Shan Dilranga', 60000, 10, 6, 15, 78600),
(2, 'CA00005', 'Venushi Alwis', 75000, 8, 5, 14, 95250),
(2, 'GM00001', 'Chathura Alwis', 125000, 15, 10, 20, 181250),
(2, 'RM00001', 'Gimhani Rubasinghe', 90000, 12, 8, 18, 124200),
(2, 'S00001', 'S.Rubasinghe', 35000, 5, 4, 10, 41650);

-- --------------------------------------------------------

--
-- Table structure for table `servicecharge`
--

CREATE TABLE `servicecharge` (
  `ServiceChargeID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `WorkingDays` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `servicecharge`
--

INSERT INTO `servicecharge` (`ServiceChargeID`, `Date`, `WorkingDays`) VALUES
(1, '2022-01-31', 28),
(2, '2022-02-28', 25),
(3, '2022-03-31', 28);

-- --------------------------------------------------------

--
-- Table structure for table `servicechargestaff`
--

CREATE TABLE `servicechargestaff` (
  `ServiceChargeID` int(11) NOT NULL,
  `StaffID` varchar(25) NOT NULL,
  `StaffName` varchar(50) NOT NULL,
  `Percentage` int(11) NOT NULL,
  `Amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `servicechargestaff`
--

INSERT INTO `servicechargestaff` (`ServiceChargeID`, `StaffID`, `StaffName`, `Percentage`, `Amount`) VALUES
(1, 'AC00001', 'Pavani Marasinghe', 4, 73),
(1, 'AD00001', 'Shan Dilranga', 3, 55),
(1, 'CA00005', 'Venushi Alwis', 2, 36),
(1, 'GM00001', 'Chathura Alwis', 5, 91),
(1, 'RM00001', 'Gimhani Rubasinghe', 4, 73),
(1, 'S00001', 'S.Rubasinghe', 1, 18),
(2, 'AD00001', 'Shan Dilranga', 3, 54),
(3, 'AD00001', 'Shan Dilranga', 3, 315);

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
  `ProfilePic` longblob DEFAULT NULL,
  `Approval` enum('NoDecision','Yes','No','Emailed') NOT NULL,
  `Reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`SignupID`, `Name`, `UserName`, `Password`, `Email`, `ContactNo`, `JoinedYear`, `DisplayID`, `UserType`, `ProfilePic`, `Approval`, `Reason`) VALUES
(27, 'Arun Dahanayaka', '', '', 'Arun@gmail.com', 719012341, '2022-03-27', '', 'Life Member', '', 'NoDecision', ''),
(28, 'Jagath Palihavadana ', 'Jagath', 'HL00003', 'gimhani.rubasinghe@gmail.cog', 722222561, '2022-03-27', 'HL00003', 'HL Member', '', 'Yes', ''),
(29, 'Aruni Dahanayaka', 'Aruni', 'OM00005', 'Aruni@gmail.com', 719012343, '2022-03-27', 'OM00005', 'Ordinary Member', '', 'Yes', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `ContactNo` int(11) NOT NULL,
  `JoinedYear` date NOT NULL,
  `DisplayID` varchar(25) NOT NULL,
  `UserType` enum('Admin','Manager','Restaurant Manager','Cashier','Accountant','Staff Member','Life Member','Ordinary Member','HL Member') NOT NULL,
  `ProfilePic` longblob DEFAULT NULL,
  `IsDeleted` enum('No','Yes') NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Name`, `UserName`, `Password`, `Email`, `ContactNo`, `JoinedYear`, `DisplayID`, `UserType`, `ProfilePic`, `IsDeleted`) VALUES
(1, 'Shan Dilranga', 'Shan', '$2y$10$HFG.V/09PPziKI9kDwydHOP256LVXZ8Ax6pgn2CvnXZPTmVdpZp46', 'Shan@gmail.com', 711234567, '2019-06-04', 'AD00001', 'Admin', NULL, 'No');
INSERT INTO `user` (`UserID`, `Name`, `UserName`, `Password`, `Email`, `ContactNo`, `JoinedYear`, `DisplayID`, `UserType`, `ProfilePic`, `IsDeleted`) VALUES
(2, 'Gimhani Rubasinghe', 'Gimhani', '$2y$10$t5HGheC1t8YV/QvQylEn4eoVfTTqputMd1WeOYTVlIl/2H8vm6WGe', 'gimhani@gmail.com', 700234567, '2019-07-17', 'RM00001', 'Restaurant Manager', NULL, 'No');
INSERT INTO `user` (`UserID`, `Name`, `UserName`, `Password`, `Email`, `ContactNo`, `JoinedYear`, `DisplayID`, `UserType`, `ProfilePic`, `IsDeleted`) VALUES
(3, 'Pavani Marasinghe', 'Pavani', '$2y$10$FszLxmPf9wZ2HbcmNjUlLuIL4L0p2xOcPhodqVP6rq/dD52t274Xa', 'pavani@gmail.com', 776712345, '2019-08-01', 'AC00001', 'Accountant',NULL , 'No');
INSERT INTO `user` (`UserID`, `Name`, `UserName`, `Password`, `Email`, `ContactNo`, `JoinedYear`, `DisplayID`, `UserType`, `ProfilePic`, `IsDeleted`) VALUES
(4, 'Chathura Alwis', 'Chathura', '$2y$10$32qhL..6B.Q4aVGPxAuRyOEo6jVIf9H6TcMX1uBnW4MQ5bSvH8luC', 'chathura@gmail.com', 788854567, '2019-07-19', 'GM00001', 'Manager', NULL, 'No'),
(6, 'Member', 'Member', '$2y$10$9RaH99CEpIK1ivO.KwhRUOdsalIUeP3vYuzT/2xd8PU4vfgmfF7sG', 'member@gmail.com', 789012346, '2020-08-30', 'LM00001', 'Life Member', NULL, 'Yes'),
(7, 'Piyal Perera', 'piyal(member)', '$2y$10$9RaH99CEpIK1ivO.KwhRUOdsalIUeP3vYuzT/2xd8PU4vfgmfF7sG', 'piyal@gmail.com', 781154576, '2018-10-17', 'OM00002', '', NULL, 'Yes'),
(13, 'U.P.Perera', 'Priyani', '$2y$10$tUb0K.wyPaVrM7UV2wTdy.yTCBF/K3FJGMnm46XW1apxjVEwtkYOa', 'priyani@gmail.com', 789012346, '2021-10-05', 'S00002', 'Staff Member', NULL, 'No'),
(14, 'S.Rubasinghe', 'Sumith', '$2y$10$hw0xzIbaG57V11zsEmXsZueeYXOQx71VriiLYStCu6ehnJV8/Qjem', 'sumith@gmail.com', 789012342, '2021-10-03', 'S00001', 'Staff Member', NULL, 'No'),
(15, 'J.S.Peris', 'Jayani', '$2y$10$9A/2JIgWKjr0m3fH2oNmrOglFJNsd.XJ0zylSYEH/M4itx8iVmARG', 'Jayani@gmail.com', 719012346, '2021-10-17', 'HL00002', 'HL Member', NULL, 'No'),
(17, 'P.N.S.Bandara', 'Bandara', '$2y$10$b3PSxZ45rNs/hW1T2m0hi.kMLApjlXTZakzhcs4BcB30pzjEm82.q', 'Bandara@gmail.com', 789012346, '2021-10-17', 'OM00001', 'Ordinary Member',NULL , 'No'),
(18, 'Venushi Alwis', 'Shaveen', '$2y$10$p0oYbkvpvMsx1F4UKTmof.03KzAUMp6dG9eB0ZkBMWZHRJvOyk5QW', 'venushi@gmail.com', 719012342, '2021-10-19', 'CA00005', 'Cashier', NULL, 'No'),
(29, 'Arun Dahanayaka', 'Arun', '$2y$10$0JlrZ7U.kFSIaVNPVHzZvuQ1WqYamnwk0KtyHzD7pO36EYTZgvS7y', 'Arun@gmail.com', 719012341, '2022-03-27', 'OM00004', 'Ordinary Member', NULL, 'No'),
(30, 'Jagath Palihavadana ', 'Jagath', '$2y$10$ehKunf8sltLHTxcBszl8reInFUXnlawUFpRRpecku02Gl3rAmXh9y', 'gimhani.rubasinghe@gmail.cog', 722222561, '2022-03-27', 'HL00003', 'HL Member', NULL, 'No'),
(31, 'Aruni Dahanayaka', 'Aruni', '$2y$10$eSJQ424aYpdP3UY1rtDEyuoV2DFaTS3OM.axxllCyxPP.52nwLqEO', 'Aruni@gmail.com', 719012343, '2022-03-27', 'OM00005', 'Ordinary Member', NULL, 'No');

-- --------------------------------------------------------

--
-- Table structure for table `usersalary`
--

CREATE TABLE `usersalary` (
  `detailID` int(11) NOT NULL,
  `UserType` varchar(25) NOT NULL,
  `basic` int(11) NOT NULL,
  `bonusValue` int(11) NOT NULL,
  `ETFvalue` int(11) NOT NULL,
  `EPFvalue` int(11) NOT NULL,
  `percentage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usersalary`
--

INSERT INTO `usersalary` (`detailID`, `UserType`, `basic`, `bonusValue`, `ETFvalue`, `EPFvalue`, `percentage`) VALUES
(1, 'Admin', 60000, 10, 15, 6, 3),
(2, 'Manager ', 125000, 15, 20, 10, 5),
(3, 'Restaurant Manager ', 90000, 12, 18, 8, 4),
(4, 'Accountant', 85000, 11, 17, 7, 4),
(5, 'Cashier ', 75000, 8, 14, 5, 2),
(6, 'Staff Member', 35000, 5, 10, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `visapayment`
--

CREATE TABLE `visapayment` (
  `PaymentID` int(11) NOT NULL,
  `CardName` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`HolidayID`);

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
-- Indexes for table `lastdisplayid`
--
ALTER TABLE `lastdisplayid`
  ADD PRIMARY KEY (`MemberType`),
  ADD UNIQUE KEY `ID` (`ID`);

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
  ADD PRIMARY KEY (`No`),
  ADD UNIQUE KEY `StaffID` (`StaffID`);

--
-- Indexes for table `salarystaff`
--
ALTER TABLE `salarystaff`
  ADD PRIMARY KEY (`SalaryID`,`StaffID`),
  ADD KEY `salarystaff_ibfk_2` (`StaffID`);

--
-- Indexes for table `servicecharge`
--
ALTER TABLE `servicecharge`
  ADD PRIMARY KEY (`ServiceChargeID`);

--
-- Indexes for table `servicechargestaff`
--
ALTER TABLE `servicechargestaff`
  ADD PRIMARY KEY (`ServiceChargeID`,`StaffID`) USING BTREE,
  ADD KEY `servicechargestaff_ibfk_2` (`StaffID`);

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
-- Indexes for table `usersalary`
--
ALTER TABLE `usersalary`
  ADD PRIMARY KEY (`detailID`);

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
  MODIFY `BillID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `BookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `FeedBackID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `grn`
--
ALTER TABLE `grn`
  MODIFY `GRNID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `HolidayID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `InvoiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `ItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `NotificationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `SalaryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `salarydetails`
--
ALTER TABLE `salarydetails`
  MODIFY `No` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `servicecharge`
--
ALTER TABLE `servicecharge`
  MODIFY `ServiceChargeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `signup`
--
ALTER TABLE `signup`
  MODIFY `SignupID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `usersalary`
--
ALTER TABLE `usersalary`
  MODIFY `detailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  ADD CONSTRAINT `salarydetails_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `user` (`DisplayID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salarystaff`
--
ALTER TABLE `salarystaff`
  ADD CONSTRAINT `salarystaff_ibfk_1` FOREIGN KEY (`SalaryID`) REFERENCES `salary` (`SalaryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `salarystaff_ibfk_2` FOREIGN KEY (`StaffID`) REFERENCES `user` (`DisplayID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `servicechargestaff`
--
ALTER TABLE `servicechargestaff`
  ADD CONSTRAINT `servicechargestaff_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `user` (`DisplayID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `servicechargestaff_ibfk_2` FOREIGN KEY (`ServiceChargeID`) REFERENCES `servicecharge` (`ServiceChargeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `visapayment`
--
ALTER TABLE `visapayment`
  ADD CONSTRAINT `visapayment_ibfk_1` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`PaymentID`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
