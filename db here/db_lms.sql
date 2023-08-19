-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2023 at 09:55 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `borrower`
--

CREATE TABLE `borrower` (
  `borrower_id` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(30) NOT NULL,
  `tax_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `borrower`
--

INSERT INTO `borrower` (`borrower_id`, `firstname`, `middlename`, `lastname`, `contact_no`, `address`, `email`, `tax_id`) VALUES
(1, 'Amit', 'kumar', 'sinha', '06202433124', 'patna', 'amit@gmail.com', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `loan_id` int(11) NOT NULL,
  `ref_no` varchar(50) NOT NULL,
  `ltype_id` int(30) NOT NULL,
  `borrower_id` int(30) NOT NULL,
  `purpose` text NOT NULL,
  `amount` double NOT NULL,
  `lplan_id` int(30) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0=request, 1=confirmed, 2=released, 3=completed, 4=denied',
  `date_released` datetime NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`loan_id`, `ref_no`, `ltype_id`, `borrower_id`, `purpose`, `amount`, `lplan_id`, `status`, `date_released`, `date_created`) VALUES
(1, '46270002', 1, 1, 'For Study', 10000, 1, 2, '2023-08-16 10:20:15', '2023-08-16 10:20:05');

-- --------------------------------------------------------

--
-- Table structure for table `loan_plan`
--

CREATE TABLE `loan_plan` (
  `lplan_id` int(11) NOT NULL,
  `lplan_month` int(11) NOT NULL,
  `lplan_interest` float NOT NULL,
  `lplan_penalty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `loan_plan`
--

INSERT INTO `loan_plan` (`lplan_id`, `lplan_month`, `lplan_interest`, `lplan_penalty`) VALUES
(1, 6, 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `loan_schedule`
--

CREATE TABLE `loan_schedule` (
  `loan_sched_id` int(50) NOT NULL,
  `loan_id` int(11) NOT NULL,
  `due_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `loan_schedule`
--

INSERT INTO `loan_schedule` (`loan_sched_id`, `loan_id`, `due_date`) VALUES
(1, 1, '2023-09-16'),
(2, 1, '2023-10-16'),
(3, 1, '2023-11-16'),
(4, 1, '2023-12-16'),
(5, 1, '2024-01-16'),
(6, 1, '2024-02-16');

-- --------------------------------------------------------

--
-- Table structure for table `loan_type`
--

CREATE TABLE `loan_type` (
  `ltype_id` int(11) NOT NULL,
  `ltype_name` text NOT NULL,
  `ltype_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `loan_type`
--

INSERT INTO `loan_type` (`ltype_id`, `ltype_name`, `ltype_desc`) VALUES
(1, 'Student Loan', 'Study Lon');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `loan_id` int(11) NOT NULL,
  `payee` text NOT NULL,
  `pay_amount` float NOT NULL,
  `penalty` float NOT NULL,
  `overdue` tinyint(1) NOT NULL COMMENT '0=no, 1=yes',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `loan_id`, `payee`, `pay_amount`, `penalty`, `overdue`, `date_created`) VALUES
(1, 1, 'sinha, Amit k.', 1750, 0, 0, '2023-08-17 00:20:00'),
(2, 1, 'sinha, Amit k.', 1750, 0, 0, '2023-08-17 00:37:52');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `firstname`, `lastname`) VALUES
(2, 'admin', 'admin', 'Administrator', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `borrower`
--
ALTER TABLE `borrower`
  ADD PRIMARY KEY (`borrower_id`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`loan_id`);

--
-- Indexes for table `loan_plan`
--
ALTER TABLE `loan_plan`
  ADD PRIMARY KEY (`lplan_id`);

--
-- Indexes for table `loan_schedule`
--
ALTER TABLE `loan_schedule`
  ADD PRIMARY KEY (`loan_sched_id`);

--
-- Indexes for table `loan_type`
--
ALTER TABLE `loan_type`
  ADD PRIMARY KEY (`ltype_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `borrower`
--
ALTER TABLE `borrower`
  MODIFY `borrower_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `loan_plan`
--
ALTER TABLE `loan_plan`
  MODIFY `lplan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `loan_schedule`
--
ALTER TABLE `loan_schedule`
  MODIFY `loan_sched_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `loan_type`
--
ALTER TABLE `loan_type`
  MODIFY `ltype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
