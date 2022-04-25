-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2022 at 07:04 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tuition portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_name` varchar(50) NOT NULL,
  `admin_pass` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_name`, `admin_pass`) VALUES
('admin', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `course_info`
--

CREATE TABLE `course_info` (
  `class` int(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `course_matched`
--

CREATE TABLE `course_matched` (
  `t_email` varchar(100) NOT NULL,
  `s_email` varchar(100) NOT NULL,
  `course_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `info_matched`
--

CREATE TABLE `info_matched` (
  `t_email` varchar(100) NOT NULL,
  `s_email` varchar(100) NOT NULL,
  `course_name` varchar(50) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `location_matched`
--

CREATE TABLE `location_matched` (
  `t_email` varchar(100) NOT NULL,
  `s_email` varchar(100) NOT NULL,
  `area` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `s_email` varchar(100) NOT NULL,
  `pass` varchar(25) DEFAULT NULL,
  `f_name` varchar(20) DEFAULT NULL,
  `l_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`s_email`, `pass`, `f_name`, `l_name`) VALUES
('tom@gmail.com', 'tom123', 'Tom', 'T');

-- --------------------------------------------------------

--
-- Table structure for table `s_course`
--

CREATE TABLE `s_course` (
  `s_email` varchar(100) NOT NULL,
  `course_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `s_location`
--

CREATE TABLE `s_location` (
  `s_email` varchar(100) NOT NULL,
  `area` varchar(50) DEFAULT NULL,
  `street_address` varchar(80) DEFAULT NULL,
  `apt_num` varchar(15) DEFAULT NULL,
  `zip` decimal(5,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `t_email` varchar(100) NOT NULL,
  `pass` varchar(25) DEFAULT NULL,
  `f_name` varchar(20) DEFAULT NULL,
  `l_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`t_email`, `pass`, `f_name`, `l_name`) VALUES
('john@gmail.com', 'john123', 'John', 'Doe'),
('kal@gmail.com', 'kalvin123', 'Kalvin', 'Jones'),
('peter@gmail.com', 'peter123', 'Peter', 'Parker'),
('portia@gmail.com', 'portia123', 'Portia', 'Smith'),
('smith@gmail.com', 'smith123', 'Smith', 'Jonas'),
('tracy@gmail.com', 'tracy123', 'Tracy', 'S');

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE `timetable` (
  `t_email` varchar(100) NOT NULL,
  `days` varchar(8) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `t_course`
--

CREATE TABLE `t_course` (
  `t_email` varchar(100) NOT NULL,
  `course_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `t_locations`
--

CREATE TABLE `t_locations` (
  `t_email` varchar(100) NOT NULL,
  `area` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_locations`
--

INSERT INTO `t_locations` (`t_email`, `area`) VALUES
('john@gmail.com', 'Bashundhara'),
('kal@gmail.com', 'Baridhara'),
('kal@gmail.com', 'Dhanmondi'),
('peter@gmail.com', 'Uttara'),
('portia@gmail.com', 'Bashundhara'),
('smith@gmail.com', 'Baridhara'),
('smith@gmail.com', 'Dhanmondi'),
('tracy@gmail.com', 'Dhanmondi');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `s_email` varchar(100) NOT NULL,
  `course_name` varchar(50) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `budget` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_name`);

--
-- Indexes for table `course_info`
--
ALTER TABLE `course_info`
  ADD PRIMARY KEY (`course_name`,`class`);

--
-- Indexes for table `course_matched`
--
ALTER TABLE `course_matched`
  ADD PRIMARY KEY (`course_name`,`t_email`,`s_email`),
  ADD KEY `course_matchFK` (`t_email`),
  ADD KEY `course_matchFK2` (`s_email`);

--
-- Indexes for table `info_matched`
--
ALTER TABLE `info_matched`
  ADD PRIMARY KEY (`t_email`,`s_email`),
  ADD KEY `info_matchFK2` (`s_email`),
  ADD KEY `info_matchFK3` (`course_name`),
  ADD KEY `info_matchFK4` (`area`);

--
-- Indexes for table `location_matched`
--
ALTER TABLE `location_matched`
  ADD PRIMARY KEY (`area`,`t_email`,`s_email`),
  ADD KEY `loc_matchFK` (`t_email`),
  ADD KEY `loc_matchFK2` (`s_email`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`s_email`);

--
-- Indexes for table `s_course`
--
ALTER TABLE `s_course`
  ADD PRIMARY KEY (`s_email`,`course_name`),
  ADD KEY `s_courseFK2` (`course_name`);

--
-- Indexes for table `s_location`
--
ALTER TABLE `s_location`
  ADD PRIMARY KEY (`s_email`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`t_email`);

--
-- Indexes for table `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`t_email`);

--
-- Indexes for table `t_course`
--
ALTER TABLE `t_course`
  ADD PRIMARY KEY (`t_email`,`course_name`),
  ADD KEY `t_courseFk2` (`course_name`);

--
-- Indexes for table `t_locations`
--
ALTER TABLE `t_locations`
  ADD PRIMARY KEY (`t_email`,`area`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`s_email`),
  ADD KEY `wishlistFK` (`s_email`,`course_name`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course_matched`
--
ALTER TABLE `course_matched`
  ADD CONSTRAINT `course_matchFK` FOREIGN KEY (`t_email`) REFERENCES `t_course` (`t_email`),
  ADD CONSTRAINT `course_matchFK2` FOREIGN KEY (`s_email`) REFERENCES `wishlist` (`s_email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `info_matched`
--
ALTER TABLE `info_matched`
  ADD CONSTRAINT `info_matchFK` FOREIGN KEY (`t_email`) REFERENCES `teacher` (`t_email`),
  ADD CONSTRAINT `info_matchFK2` FOREIGN KEY (`s_email`) REFERENCES `wishlist` (`s_email`),
  ADD CONSTRAINT `info_matchFK3` FOREIGN KEY (`course_name`) REFERENCES `course_matched` (`course_name`),
  ADD CONSTRAINT `info_matchFK4` FOREIGN KEY (`area`) REFERENCES `location_matched` (`area`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `location_matched`
--
ALTER TABLE `location_matched`
  ADD CONSTRAINT `loc_matchFK` FOREIGN KEY (`t_email`) REFERENCES `t_locations` (`t_email`),
  ADD CONSTRAINT `loc_matchFK2` FOREIGN KEY (`s_email`) REFERENCES `wishlist` (`s_email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `s_course`
--
ALTER TABLE `s_course`
  ADD CONSTRAINT `s_courseFK` FOREIGN KEY (`s_email`) REFERENCES `student` (`s_email`),
  ADD CONSTRAINT `s_courseFK2` FOREIGN KEY (`course_name`) REFERENCES `course_info` (`course_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `s_location`
--
ALTER TABLE `s_location`
  ADD CONSTRAINT `s_locationFK` FOREIGN KEY (`s_email`) REFERENCES `student` (`s_email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `timetable`
--
ALTER TABLE `timetable`
  ADD CONSTRAINT `timetableFK` FOREIGN KEY (`t_email`) REFERENCES `teacher` (`t_email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `t_course`
--
ALTER TABLE `t_course`
  ADD CONSTRAINT `t_courseFk` FOREIGN KEY (`t_email`) REFERENCES `teacher` (`t_email`),
  ADD CONSTRAINT `t_courseFk2` FOREIGN KEY (`course_name`) REFERENCES `course_info` (`course_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `t_locations`
--
ALTER TABLE `t_locations`
  ADD CONSTRAINT `t_locFK` FOREIGN KEY (`t_email`) REFERENCES `teacher` (`t_email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlistFK` FOREIGN KEY (`s_email`,`course_name`) REFERENCES `s_course` (`s_email`, `course_name`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
