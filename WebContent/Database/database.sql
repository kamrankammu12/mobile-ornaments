

qqqqqq- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2021 at 10:46 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;[]

--
-- Database: `database`
--

-- --------------------------------------------------------

--
-- Table structure for table `aproval`
--

CREATE TABLE `aproval` (
  `id` int(200) NOT NULL,
  `name` varchar(110) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(25) NOT NULjn
  `phone` varchar(25) NOT NULL,
  `address` varchar(110) NOT NULL,
  `department` varchar(110) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `aproval`
--

INSERT INTO `aproval` (`id`, `name`, `user_name`, `password`, `phone`, `address`, `department`, `status`) VALUES
(5, 'Abishek', 'abishek', '1234', '70323270', 'hyderabad', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `department` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `user_name`, `password`, `phone`, `address`, `department`) VALUES
(5, 'Abishek', 'abishek', '1234', '70323270', 'hyderabad', 'Devlopment');

-- --------------------------------------------------------

--
-- Table structure for table `table2`
--

CREATE TABLE `table2` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `table2`
--

INSERT INTO `table2` (`id`, `name`, `user_name`, `password`, `address`, `phone`, `status`) VALUES
(56, 'Abishek', 'abishek', '1234', '4', '4', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aproval`
--
ALTER TABLE `aproval`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table2`
--
ALTER TABLE `table2`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `table2`
--
ALTER TABLE `table2`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
