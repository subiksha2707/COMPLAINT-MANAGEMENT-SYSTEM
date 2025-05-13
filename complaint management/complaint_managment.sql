-- phpMyAdmin SQL Dump
-- Database: `complaint_management`
-- User: `complaint_user`
-- Password: `password`

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DROP DATABASE IF EXISTS complaint_management;
CREATE DATABASE IF NOT EXISTS complaint_management;
USE complaint_management;

DROP USER IF EXISTS 'complaint_user'@'%';
CREATE USER IF NOT EXISTS 'complaint_user'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON complaint_management.* TO 'complaint_user'@'%';

-- --------------------------------------------------------
-- Table structure for table `user`
-- --------------------------------------------------------
CREATE TABLE `user` (
  `UserID` int(100) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `user` (`UserID`, `Username`, `Email`, `Password`) VALUES
(1, 'Subiksha', 'subi@example.com', '1234');

-- --------------------------------------------------------
-- Table structure for table `complaint`
-- --------------------------------------------------------
CREATE TABLE `complaint` (
  `ComplaintID` int(100) NOT NULL,
  `UserID` int(100) NOT NULL,
  `Category` varchar(100) NOT NULL,
  `Subject` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'Pending',
  `CreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `complaint` (`ComplaintID`, `UserID`, `Category`, `Subject`, `Description`, `Status`) VALUES
(1, 1, 'Plumbing', 'Leaking pipe', 'There is a leakage in room 102 bathroom.', 'Pending');

-- --------------------------------------------------------
-- Table structure for table `staff`
-- --------------------------------------------------------
CREATE TABLE `staff` (
  `StaffID` int(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `staff` (`StaffID`, `Name`, `Role`) VALUES
(1, 'Ravi Kumar', 'Technician'),
(2, 'Meena Sharma', 'Support');

-- --------------------------------------------------------
-- Table structure for table `assignment`
-- --------------------------------------------------------
CREATE TABLE `assignment` (
  `AssignID` int(100) NOT NULL,
  `ComplaintID` int(100) NOT NULL,
  `StaffID` int(100) NOT NULL,
  `AssignedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- Indexes for tables
-- --------------------------------------------------------
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

ALTER TABLE `complaint`
  ADD PRIMARY KEY (`ComplaintID`);

ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffID`);

ALTER TABLE `assignment`
  ADD PRIMARY KEY (`AssignID`);

-- --------------------------------------------------------
-- AUTO_INCREMENT
-- --------------------------------------------------------
ALTER TABLE `user`
  MODIFY `UserID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `complaint`
  MODIFY `ComplaintID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `staff`
  MODIFY `StaffID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `assignment`
  MODIFY `AssignID` int(100) NOT NULL AUTO_INCREMENT;

COMMIT;
