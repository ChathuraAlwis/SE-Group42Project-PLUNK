-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2021 at 05:12 PM
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
  `OrderID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `BookingID` int(11) NOT NULL,
  `CustomerName` varchar(50) NOT NULL,
  `BookingType` enum('Club','Restaurant') NOT NULL,
  `Reservation1` varchar(25) NOT NULL,
  `Reservation2` varchar(25) DEFAULT NULL,
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
-- Table structure for table `deleteuser`
--

CREATE TABLE `deleteuser` (
  `UserID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `ContactNo` int(11) NOT NULL,
  `JoinedYear` date NOT NULL,
  `DisplayID` varchar(10) NOT NULL,
  `UserType` enum('Admin','Manager','Restaurant Manager','Cashier','Accountant','Staff Member','Life Member','Ordinary Member',' Hon.Life Member') NOT NULL,
  `Reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Table structure for table `grn`
--

CREATE TABLE `grn` (
  `GRNID` int(11) NOT NULL,
  `CompanyName` varchar(50) NOT NULL,
  `AddDate` date NOT NULL,
  `ItemType` enum('Food Items','Beverage Items') NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `grnitem`
--

CREATE TABLE `grnitem` (
  `GRNID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `InvoiceID` int(11) NOT NULL,
  `Company` varchar(50) NOT NULL,
  `Type` enum('Beverage items','Food items') NOT NULL,
  `ReceivedDate` date NOT NULL,
  `DueDate` date NOT NULL,
  `Total` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `invoiceitem`
--

CREATE TABLE `invoiceitem` (
  `InvoiceID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `ItemID` int(11) NOT NULL,
  `ItemType` enum('Food','Beverage') NOT NULL,
  `ItemName` varchar(100) NOT NULL,
  `Price` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Discount` int(11) NOT NULL,
  `Availability` enum('Yes','No') NOT NULL,
  `ReorderQuantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `NotificationID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `EventType` text NOT NULL,
  `Message` text NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE `orderitem` (
  `OrderID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL,
  `PaymentDate` date NOT NULL,
  `UserID` int(11) NOT NULL,
  `BookingID` int(11) NOT NULL
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
  `Cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `returngrn`
--

CREATE TABLE `returngrn` (
  `GRNID` int(11) NOT NULL,
  `CompanyName` varchar(50) NOT NULL,
  `AddDate` date NOT NULL,
  `ItemID` int(11) NOT NULL,
  `ItemName` varchar(30) NOT NULL,
  `ItemType` enum('Food Items','Beverage Items') NOT NULL,
  `Quanity` int(11) NOT NULL,
  `ReturnDate` date NOT NULL,
  `Reason` text NOT NULL,
  `UserID` int(11) NOT NULL,
  `Accepted` enum('Yes','No') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `SalaryID` int(11) NOT NULL,
  `Year` year(4) NOT NULL,
  `Month` enum('January','February','March','April','May','June','July','August','September','October','November','December') NOT NULL,
  `WorkingDays` int(11) NOT NULL DEFAULT 30
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

-- --------------------------------------------------------

--
-- Table structure for table `servicecharge`
--

CREATE TABLE `servicecharge` (
  `ServiceChargeID` int(11) NOT NULL,
  `Year` year(4) NOT NULL,
  `Month` enum('January','February','March','April','May','June','July','August','September','October','November','December') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `UserType` enum('Admin','Manager','Restaurant Manager','Cashier','Accountant','Staff Member','Life Member','Ordinary Member',' Hon.Life Member') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  ADD KEY `UserID` (`UserID`),
  ADD KEY `Reservation1` (`Reservation1`),
  ADD KEY `Reservation2` (`Reservation2`);

--
-- Indexes for table `cashpayment`
--
ALTER TABLE `cashpayment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD UNIQUE KEY `ReceiptNo` (`ReceiptNo`);

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
-- Indexes for table `deleteuser`
--
ALTER TABLE `deleteuser`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `UserName` (`UserName`,`Email`,`DisplayID`) USING HASH;

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
  ADD KEY `UserID` (`UserID`);

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
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `invoiceitem`
--
ALTER TABLE `invoiceitem`
  ADD PRIMARY KEY (`InvoiceID`,`ItemID`),
  ADD KEY `ItemID` (`ItemID`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`ItemID`),
  ADD UNIQUE KEY `ItemName` (`ItemName`);

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
-- Indexes for table `returngrn`
--
ALTER TABLE `returngrn`
  ADD PRIMARY KEY (`GRNID`),
  ADD KEY `ItemID` (`ItemID`),
  ADD KEY `UserID` (`UserID`);

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
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `DisplayID` (`DisplayID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `UserName` (`UserName`) USING HASH;

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
  MODIFY `BillID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `BookingID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `FeedBackID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grn`
--
ALTER TABLE `grn`
  MODIFY `GRNID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `InvoiceID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `ItemID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `NotificationID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `ReportID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary`
--
ALTER TABLE `salary`
  MODIFY `SalaryID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `servicecharge`
--
ALTER TABLE `servicecharge`
  MODIFY `ServiceChargeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`Reservation1`) REFERENCES `reservationmenu` (`ReservationName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`Reservation2`) REFERENCES `reservationmenu` (`ReservationName`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`ReplyPersonID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `grn`
--
ALTER TABLE `grn`
  ADD CONSTRAINT `grn_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoiceitem`
--
ALTER TABLE `invoiceitem`
  ADD CONSTRAINT `invoiceitem_ibfk_1` FOREIGN KEY (`InvoiceID`) REFERENCES `invoice` (`InvoiceID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoiceitem_ibfk_2` FOREIGN KEY (`ItemID`) REFERENCES `item` (`ItemID`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `returngrn_ibfk_1` FOREIGN KEY (`ItemID`) REFERENCES `item` (`ItemID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `returngrn_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

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
COMMIT;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Name`, `UserName`, `Password`, `Email`, `ContactNo`, `JoinedYear`, `DisplayID`, `UserType`) VALUES
('Shan Dilranga', 'Shan', 'Shan1', 'Shan@gmail.com', 711234567, '2019-06-04', 'AD00001', 'Admin'),
('Gimhani Rubasinghe', 'Gimhani', 'Gimhani1', 'gimhani@gmail.com', 700234567, '2019-07-17', 'RM00001', 'Restaurant Manager'),
('Pavani Marasinghe', 'Pavani', 'Pavani1', 'pavani@gmail.com', 776712345, '2019-08-01', 'AC00001', 'Accountant'),
('Chathura Alwis', 'Chathura', 'Chathura1', 'chathura@gmail.com', 788854567, '2019-07-19', 'GM00001', 'Manager'),
('Cashier', 'Cashier', 'Cashier1', 'cashier@gmail.com', 711154567, '2019-08-31', 'CA00001', 'Cashier'),
('Member', 'Member', 'Member1', 'member@gmail.com', 722222567, '2020-08-30', 'LM00001', 'Life Member');

-- --------------------------------------------------------

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
