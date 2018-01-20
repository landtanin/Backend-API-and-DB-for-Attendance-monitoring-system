-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 20, 2018 at 03:52 AM
-- Server version: 5.7.17
-- PHP Version: 7.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendance_monitoring`
--

-- --------------------------------------------------------

--
-- Table structure for table `lecturerinfo`
--

CREATE TABLE `lecturerinfo` (
  `_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `lecturerId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lecturerinfo`
--

INSERT INTO `lecturerinfo` (`_id`, `name`, `lecturerId`) VALUES
(1, 'Kristof Cools', 1),
(2, 'Nothofer Angela', 2),
(3, 'Phil Sewell', 3),
(4, 'James Bonnyman', 4),
(5, 'Alessandro Costabeber', 5),
(6, 'John Crowe', 6),
(7, 'Steve Sharples', 7);

-- --------------------------------------------------------

--
-- Table structure for table `lecturermodule`
--

CREATE TABLE `lecturermodule` (
  `_id` int(11) NOT NULL,
  `Lecturer_id` int(11) NOT NULL,
  `Module_id` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lecturermodule`
--

INSERT INTO `lecturermodule` (`_id`, `Lecturer_id`, `Module_id`) VALUES
(1, 1, 'MA0001'),
(4, 1, 'H63JAV-1'),
(6, 3, 'H63ESD'),
(7, 4, 'TEL001'),
(8, 6, 'H63BPE-1'),
(9, 6, 'H63BPE-2'),
(10, 1, 'JAV001'),
(12, 4, 'TLC001'),
(13, 2, 'JAP001'),
(14, 1, 'H63JAV-2');

-- --------------------------------------------------------

--
-- Table structure for table `lecturer_users`
--

CREATE TABLE `lecturer_users` (
  `_id` int(11) NOT NULL,
  `unique_id` varchar(23) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lecturer_id` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `encrypted_password` varchar(256) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lecturer_users`
--

INSERT INTO `lecturer_users` (`_id`, `unique_id`, `name`, `lecturer_id`, `email`, `encrypted_password`, `salt`, `created_at`) VALUES
(1, '58f7a32aec0639.73079853', 'Kristof Cools', 1, 'kristof@cools.com', '$2y$10$hMNkFGUAc8wvzBav17OXJeAbS4QydB4sEbYb3tJEjcv12BJeDsmaG', '13e145006c', '2017-04-19 17:49:31'),
(2, '58f8b6c3e32bc1.60752956', 'Nothofer Angela', 2, 'nothofer@angela.com', '$2y$10$sop1vU6CnzaSLyQFpR09vuC6CfJ5UsRykkrMjrp2Z1x/HjdA5jsaW', '68fb45ba39', '2017-04-20 13:25:24'),
(3, '58f8b71b8dd114.54569734', 'Phil Sewell', 3, 'phil@sewell.com', '$2y$10$Phnp3M36lm2HfzjfPvEAN.Oiw9Jc7MFVlpyULf9WIvR9kXp2kPUAy', '888b6c6734', '2017-04-20 13:26:51'),
(4, '58f8b733ab1410.95755606', 'James Bonnyman', 4, 'james@bonnyman.com', '$2y$10$UStja5R4FfHHKDY9t4cPeeECRgx.XLMTXbafN2bDyO1vb5ffLj7Aq', '6c121e87b9', '2017-04-20 13:27:15'),
(5, '58f8b750d89df6.97184707', 'Allessandro Coastabeber', 5, 'allessandro@coastabeber.com', '$2y$10$3Ql5fLvqu.wjr4tUOHJlwunah6xR11AhppAWR.cwx3jgVqLXZJAoS', '90a67105b0', '2017-04-20 13:27:44'),
(6, '58f8b764aa7e50.31910209', 'John Crowe', 6, 'john@crowe.com', '$2y$10$ZN0SRsAMAuij7sg9tiPu.uUe0CSmYYMJVWivWVsVqbDOacDA3LsdK', 'db251c3515', '2017-04-20 13:28:04'),
(7, '58f8b777ed9b13.76815159', 'Steve Sharples', 7, 'steve@sharples.com', '$2y$10$MF4n8cAMdqIQ55vwYhCnNuE8PlL47PIG2O.cBHuiiXAdy9do6LvFG', '2549ed2779', '2017-04-20 13:28:24');

-- --------------------------------------------------------

--
-- Table structure for table `moduleinfo`
--

CREATE TABLE `moduleinfo` (
  `_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `moduleId` varchar(8) NOT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `checkInStart` datetime DEFAULT NULL,
  `checkInEnd` datetime DEFAULT NULL,
  `room` text NOT NULL,
  `LocLat` double DEFAULT NULL,
  `LocLng` double NOT NULL,
  `ModStatus` text NOT NULL,
  `Day` varchar(3) NOT NULL,
  `Lecturer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `moduleinfo`
--

INSERT INTO `moduleinfo` (`_id`, `name`, `moduleId`, `startDate`, `endDate`, `checkInStart`, `checkInEnd`, `room`, `LocLat`, `LocLng`, `ModStatus`, `Day`, `Lecturer`) VALUES
(1, 'Mathematic for super cool engineer ', 'MA0001', '2017-01-15 09:40:00', '2018-07-17 12:44:00', '2017-04-16 09:38:00', '2017-04-16 09:42:00', 'Coates', 52.94119, -1.189594, 'inactive', 'Sat', 'Kristof Cools'),
(2, 'Interview', 'JAV001', '2017-01-16 09:40:00', '2018-07-17 10:40:00', '2017-04-16 09:39:00', '2017-04-16 10:21:00', 'Charnwood Building', 52.758847, -1.246605, 'inactive', 'Wed', 'Kristof Cools'),
(3, 'JAPAN', 'JAP001', '2017-01-17 08:36:00', '2018-07-17 08:43:00', '2017-04-16 08:35:00', '2017-04-16 08:37:00', 'Portland', 51.513613, -0.136499, 'inactive', 'Mon', 'Nothofer Angela'),
(4, 'PHP', 'PHP001', '2017-01-18 00:00:00', '2018-07-17 00:00:00', '2017-04-16 08:45:00', '2017-04-16 09:15:00', 'Tower Building', 52.942368, -1.188579, 'inactive', 'Mon', 'Phil Sewell'),
(6, 'TeleElec', 'TLC001', '2017-01-01 20:47:00', '2018-07-17 22:58:00', '2017-04-16 20:20:00', '2017-04-16 22:57:00', 'Coates', 52.94119, -1.188579, 'inactive', 'Tue', 'James Bonnyman'),
(7, 'Telecom2', 'TEL001', '2017-01-01 20:25:00', '2018-07-17 21:42:00', '2017-04-16 20:20:00', '2017-04-09 21:40:00', 'Coates', 52.94119, -1.189594, 'inactive', 'Fri', 'Alessandro Costabeber'),
(27, 'Web Based Computing', 'H63JAV-2', '2017-02-01 23:13:00', '2018-07-17 23:15:00', '2017-04-17 23:12:00', '2017-04-17 23:14:00', 'ESLC-B14', 52.941475, -1.189167, 'inactive', 'Wed', 'Kristof Cools'),
(28, 'Web Based Computing', 'H63JAV-1', '2017-02-01 09:00:00', '2018-07-17 11:00:00', '2017-04-17 09:08:00', '2017-04-17 09:15:00', 'Tower Building 308', 52.942368, -1.188579, 'inactive', 'Mon', 'Kristof Cools'),
(29, 'Business Planning for engineers', 'H63BPE-1', '2017-02-01 12:00:00', '2018-07-17 13:00:00', '2017-04-17 11:45:00', '2017-04-17 12:15:00', 'Tower Building 203', 52.942368, -1.188579, 'inactive', 'Mon', 'John Crowe'),
(30, 'Business Planning for Engineers', 'H63BPE-2', '2017-02-01 12:00:00', '2018-07-17 17:30:00', '2017-04-17 11:45:00', '2017-04-17 12:15:00', 'POPE C17', 52.941032, -1.190089, 'inactive', 'Wed', 'John Crowe'),
(31, 'Telecommunication Electronics', 'H63TCE', '2017-02-01 09:00:00', '2018-07-17 11:00:00', '2017-04-17 08:45:00', '2017-04-17 09:15:00', 'Tower Building 203', 52.942368, -1.188579, 'inactive', 'Tue', 'Steve Sharples'),
(32, 'Engineering Software: Design and Implementation', 'H63ESD', '2017-02-01 00:25:00', '2018-07-17 17:30:00', '2017-04-17 01:23:00', '2017-04-17 17:27:00', 'PSYC-A16', 52.939483, -1.189159, 'inactive', 'Fri', 'Phil Sewell');

-- --------------------------------------------------------

--
-- Table structure for table `studentinfo`
--

CREATE TABLE `studentinfo` (
  `_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `student_id` int(11) NOT NULL,
  `course` text NOT NULL,
  `AVG` int(11) NOT NULL,
  `AttendanceStatus` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentinfo`
--

INSERT INTO `studentinfo` (`_id`, `name`, `student_id`, `course`, `AVG`, `AttendanceStatus`) VALUES
(1, 'JOHN DOE', 1, 'Electrical and Electronic Engineering', 70, 'end'),
(2, 'HARRY POTTER', 2, 'Electronic and Computer Engineering', 60, 'end'),
(3, 'ROWAN ATKINSON', 3, 'Electrical Engineering', 50, 'end'),
(4, 'TONY STARK', 4, 'Electrical Engineering', 90, 'end'),
(5, 'TANIN ROJANAPIANSATITH', 4256422, 'Electronic and computer Engineering', 100, 'end');

-- --------------------------------------------------------

--
-- Table structure for table `studentmodule`
--

CREATE TABLE `studentmodule` (
  `_id` int(11) NOT NULL,
  `Student_id` int(11) NOT NULL,
  `Module_id` varchar(8) NOT NULL,
  `status` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentmodule`
--

INSERT INTO `studentmodule` (`_id`, `Student_id`, `Module_id`, `status`) VALUES
(2, 1, 'JAV001', 'checked'),
(7, 3, 'JAP001', 'end'),
(8, 3, 'PHP001', 'end'),
(9, 4, 'PHP001', 'end'),
(10, 4, 'TLC001', 'end'),
(11, 1, 'TEL001', 'end'),
(12, 1, 'TLC001', 'end'),
(13, 1, 'JAP001', 'end'),
(15, 4256422, 'H63JAV-1', 'end'),
(16, 4256422, 'H63JAV-2', 'end'),
(17, 4256422, 'H63BPE-1', 'end'),
(18, 4256422, 'H63BPE-2', 'end'),
(19, 4256422, 'H63TCE', 'end'),
(20, 4256422, 'H63ESD', 'end'),
(23, 4, 'JAV001', 'checked'),
(28, 3, 'MA0001', 'end'),
(29, 2, 'MA0001', 'end'),
(30, 2, 'MA0001', 'end'),
(31, 3, 'MA0001', 'end'),
(32, 3, 'JAV001', 'end'),
(33, 2, 'JAV001', 'end'),
(34, 2, 'JAV001', 'end'),
(35, 3, 'JAV001', 'end'),
(37, 4256422, 'H63JAV-2', 'end'),
(43, 1, 'MA0001', 'end'),
(44, 4, 'TEL001', 'end'),
(45, 4, 'JAP001', 'end'),
(46, 1, 'H63JAV-2', 'end'),
(47, 4, 'H63JAV-2', 'end'),
(49, 4, 'JAV001', 'checked'),
(50, 4, 'JAV001', 'checked');

-- --------------------------------------------------------

--
-- Table structure for table `student_users`
--

CREATE TABLE `student_users` (
  `_id` int(11) NOT NULL,
  `unique_id` varchar(23) NOT NULL,
  `name` varchar(50) NOT NULL,
  `student_id` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `encrypted_password` varchar(256) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_users`
--

INSERT INTO `student_users` (`_id`, `unique_id`, `name`, `student_id`, `email`, `encrypted_password`, `salt`, `created_at`) VALUES
(1, '58efcae56c9470.34410783', 'JOHN DOE', 1, 'johndoe@johndoe.com', '$2y$10$MPrAg8l0yy5f0CVdasce5uKMGkyC5vXnngbNPOr.33uyNnzgOUBhS', '52b585a964', '2017-04-13 19:00:53'),
(2, '58efcb5a559fd2.30550164', 'HARRY POTTER', 2, 'harrypotter@harrypotter.com', '$2y$10$noxZuxEGvO0be0MdFdSv8OPSFJRm/EyVx/f4.ubLhSTlAkZpEcZrG', '308d4cab2a', '2017-04-13 19:02:50'),
(3, '58efcc919792f0.67099008', 'ROWAN ATKINSON', 3, 'rowanatkinson@rowanatkinson.com', '$2y$10$x.AxYRgQzzful.nmExU4wuy5AXR1DMaTTFOtbx1DYW2XqAzFTZYCu', '4ba1ae84f1', '2017-04-13 19:08:01'),
(4, '58efccdedc3144.58297441', 'TONY STARK', 4, 'tonystark@tonystark.com', '$2y$10$0zp7rakUtqWaInyLhJbayeuNy5NBHQTRdYN87V/vQcykeCIgjyHXe', '0debd212ae', '2017-04-13 19:09:18'),
(6, '58efcf0fdb88c6.75771560', 'TANIN ROJANAPIANSATITH', 4256422, 'eeytr1@nottingham.ac.uk', '$2y$10$Cb0JMNx5zM8WTWxR3TyLtuD3z7zy66ztSsag28WJ2YZcxARK4xkN6', '8bb7a88899', '2017-04-13 19:18:39'),
(7, '58fa1f030d0ba8.65547168', 'WILSON', 5, 'wilson@wilson.com', '$2y$10$sTmavAYoQCKNI34EWBvwbOxwH7l/Pt5K0UPF3pzunkNY1MCnJAwDi', 'fcd30a93b0', '2017-04-21 15:02:27'),
(8, '5900dda3a3bff6.78741164', 'no salt', 6, 'nosalt@nosalt.com', '$2y$10$TS5llQ9TH2bkzdv5q1693uRb/qfjzOFhRD8I0ehnyJi.YyCC9sooe', '9b4c5d4065', '2017-04-26 17:49:23'),
(9, '5900de9b95c616.64264107', 'only hash, no salt', 7, 'onlyhash@nosalt.com', '$2y$10$NMm9Jti82VaIOiXGuT.mDuAoTCu8A9hWVrsiUPqIkCgiOQAOwc8fW', '51186d95fd', '2017-04-26 17:53:31'),
(10, '5900df8d61ffe9.39094541', 'HASH WITH NO SALT', 8, 'hashwithnosalt@nosalt.com', '$2y$10$MRljBfiHeOAG2EmZzGCEB.fRjzhHEQo7toIR/E1cVo.x3m98FGedK', 'e69abe545d', '2017-04-26 17:57:33'),
(11, '5900e00edc29e3.23316944', 'HASH WITH NO SALT2', 9, 'hashwithnosalt2@nosalt.com', '$2y$10$nkTfji9c4KddNAxh8brrneSeYADAb3Uid2VTs1iYpuoavyjPVaI2y', 'f9eb2f030b', '2017-04-26 17:59:42'),
(12, '5900e046889487.52708045', 'HASH WITH SALT', 10, 'hashwithsalt@nosalt.com', '$2y$10$o08j4hI79pTDEOd6wFOtPutysCMSGNRdmrpNvRvglFapGUL5VXcZu', '08a48a2f86', '2017-04-26 18:00:38'),
(13, '5900e4096eb659.05031566', 'no salt', 11, 'cryptnosalt@nosalt.com', '$1$80Dlr6Zx$V54s6AgYjHA5QU3BXvDkx0', 'f71e89d375', '2017-04-26 18:16:41'),
(14, '5900e4d217e914.03976400', 'no salt', 12, 'md5nosalt@nosalt.com', '4f4e04a5f8ffded8609f0dd98c39ce3c', '607910b985', '2017-04-26 18:20:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lecturerinfo`
--
ALTER TABLE `lecturerinfo`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `lecturerId` (`lecturerId`);

--
-- Indexes for table `lecturermodule`
--
ALTER TABLE `lecturermodule`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `Lecturer_id` (`Lecturer_id`),
  ADD KEY `Module_id` (`Module_id`);

--
-- Indexes for table `lecturer_users`
--
ALTER TABLE `lecturer_users`
  ADD PRIMARY KEY (`_id`);

--
-- Indexes for table `moduleinfo`
--
ALTER TABLE `moduleinfo`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `_id` (`_id`),
  ADD KEY `moduleId` (`moduleId`),
  ADD KEY `moduleId_2` (`moduleId`);

--
-- Indexes for table `studentinfo`
--
ALTER TABLE `studentinfo`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `studentId` (`student_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `studentmodule`
--
ALTER TABLE `studentmodule`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `Student_id` (`Student_id`),
  ADD KEY `Module_id` (`Module_id`),
  ADD KEY `Module_id_2` (`Module_id`);

--
-- Indexes for table `student_users`
--
ALTER TABLE `student_users`
  ADD PRIMARY KEY (`_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lecturerinfo`
--
ALTER TABLE `lecturerinfo`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `lecturermodule`
--
ALTER TABLE `lecturermodule`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `lecturer_users`
--
ALTER TABLE `lecturer_users`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `moduleinfo`
--
ALTER TABLE `moduleinfo`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `studentinfo`
--
ALTER TABLE `studentinfo`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `studentmodule`
--
ALTER TABLE `studentmodule`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `student_users`
--
ALTER TABLE `student_users`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `lecturermodule`
--
ALTER TABLE `lecturermodule`
  ADD CONSTRAINT `LM_lecturer_fk` FOREIGN KEY (`Lecturer_id`) REFERENCES `lecturerinfo` (`lecturerId`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `LM_module_fk` FOREIGN KEY (`Module_id`) REFERENCES `moduleinfo` (`moduleId`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `studentmodule`
--
ALTER TABLE `studentmodule`
  ADD CONSTRAINT `SM_module_fk` FOREIGN KEY (`Module_id`) REFERENCES `moduleinfo` (`moduleId`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `SM_student_fk` FOREIGN KEY (`Student_id`) REFERENCES `studentinfo` (`student_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
