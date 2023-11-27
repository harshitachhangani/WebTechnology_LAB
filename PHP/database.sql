-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306:3306
-- Generation Time: Nov 27, 2023 at 07:47 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `price`) VALUES
(1, 'Half Girlfriend', 'Chetan Bhagat', '120.00'),
(2, 'C Programming', 'Srijit Singh', '400.00'),
(3, 'C Programming', 'Arijit Singh', '500.00'),
(4, 'Java', 'VAidehi', '200.00');

-- --------------------------------------------------------

--
-- Table structure for table `student_results`
--

CREATE TABLE `student_results` (
  `id` int(11) NOT NULL,
  `roll_number` varchar(20) NOT NULL,
  `subject1_mse` int(11) DEFAULT NULL,
  `subject1_ese` int(11) DEFAULT NULL,
  `subject2_mse` int(11) DEFAULT NULL,
  `subject2_ese` int(11) DEFAULT NULL,
  `subject3_mse` int(11) DEFAULT NULL,
  `subject3_ese` int(11) DEFAULT NULL,
  `subject4_mse` int(11) DEFAULT NULL,
  `subject4_ese` int(11) DEFAULT NULL,
  `total_marks` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_results`
--

INSERT INTO `student_results` (`id`, `roll_number`, `subject1_mse`, `subject1_ese`, `subject2_mse`, `subject2_ese`, `subject3_mse`, `subject3_ese`, `subject4_mse`, `subject4_ese`, `total_marks`) VALUES
(1, '55', 87, 78, 67, 89, 56, 67, 77, 88, '311.50'),
(2, '55', 55, 55, 55, 55, 55, 55, 55, 55, '220.00'),
(3, '77', 77, 77, 77, 77, 77, 77, 77, 77, '308.00'),
(4, '44', 44, 44, 44, 44, 44, 44, 44, 44, '176.00'),
(5, '44', 44, 44, 44, 44, 44, 44, 44, 44, '176.00'),
(6, '44', 44, 44, 44, 44, 44, 44, 44, 44, '176.00'),
(7, '44', 44, 44, 44, 44, 44, 44, 44, 44, '176.00'),
(8, '44', 44, 44, 44, 44, 44, 44, 44, 44, '176.00'),
(9, '44', 44, 44, 44, 44, 44, 44, 44, 44, '176.00'),
(10, '44', 44, 44, 44, 44, 44, 44, 44, 44, '176.00'),
(11, '44', 44, 44, 44, 44, 44, 44, 44, 44, '176.00'),
(12, '44', 44, 44, 44, 44, 44, 44, 44, 44, '176.00'),
(13, '44', 44, 44, 44, 44, 44, 44, 44, 44, '176.00'),
(14, '44', 44, 44, 44, 44, 44, 44, 44, 44, '176.00'),
(15, '44', 44, 44, 44, 44, 44, 44, 44, 44, '176.00'),
(16, '77', 77, 77, 77, 77, 77, 77, 77, 77, '308.00'),
(17, '22', 22, 22, 22, 33, 33, 44, 44, 66, '151.80'),
(18, '67', 44, 67, 33, 78, 89, 45, 24, 89, '252.30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'Harshita Chhangani', '$2y$10$h9hTEbyvcHHl7DSdy7ID8umaGVMYc4OsbQIU0J9XudDGuMLtuGNn2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_results`
--
ALTER TABLE `student_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `student_results`
--
ALTER TABLE `student_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
