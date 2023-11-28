-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306:3306
-- Generation Time: Nov 28, 2023 at 03:03 PM
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
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `status` enum('Present','Absent') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `student_id`, `attendance_date`, `status`) VALUES
(1, 1, '2023-11-28', 'Present'),
(2, 2, '2023-11-28', 'Absent');

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
-- Table structure for table `class_students`
--

CREATE TABLE `class_students` (
  `id` int(11) NOT NULL,
  `roll_number` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `class_students`
--

INSERT INTO `class_students` (`id`, `roll_number`, `name`) VALUES
(1, 44, 'Harshita'),
(2, 11, 'Riya');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) NOT NULL,
  `student_id` varchar(20) DEFAULT NULL,
  `complaint_text` text DEFAULT NULL,
  `status` enum('Pending','Resolved') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `student_id`, `complaint_text`, `status`, `created_at`) VALUES
(1, '55', 'its is twnjdbsavd', 'Pending', '2023-11-27 20:50:02');

-- --------------------------------------------------------

--
-- Table structure for table `complaint_students`
--

CREATE TABLE `complaint_students` (
  `id` int(11) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complaint_students`
--

INSERT INTO `complaint_students` (`id`, `student_id`, `password`, `full_name`, `email`, `created_at`) VALUES
(1, '122', '122', '', NULL, '2023-11-27 20:43:11'),
(3, '33', '33', '', NULL, '2023-11-27 20:43:25'),
(4, 'rr', '11', '', NULL, '2023-11-27 20:44:11'),
(5, '66', '33', '', NULL, '2023-11-27 20:44:57'),
(6, '11', '11', '', NULL, '2023-11-27 20:45:22'),
(7, '55', '$2y$10$aMPq1eMkZqgohfM1CzQx3utAuTNpSxTgtNcLsELSTZtTE4Bo88//u', '', NULL, '2023-11-27 20:49:49'),
(8, '22', '$2y$10$ubvqw/E/Kswx9/2hZ4uIueBeqpabjFxt7WjcB/FhaUs5/24aoGfmq', '', NULL, '2023-11-27 20:53:53');

-- --------------------------------------------------------

--
-- Table structure for table `cookie_users`
--

CREATE TABLE `cookie_users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cookie_users`
--

INSERT INTO `cookie_users` (`id`, `username`, `password`) VALUES
(1, 'Harshita Chhangani', 'harshu'),
(2, 'Harshita Chhangani', 'harshu'),
(3, 'admin', 'admin'),
(4, 'harshita', 'har');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `position`, `salary`) VALUES
(2, 'vaidehi ', 'manager', 600000);

-- --------------------------------------------------------

--
-- Table structure for table `farmers`
--

CREATE TABLE `farmers` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` enum('farmer','buyer') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `farmers`
--

INSERT INTO `farmers` (`id`, `username`, `password`, `type`) VALUES
(1, 'Harshita Chhangani', '$2y$10$bMI.beDWTzmAzMOeLtdTGe20YvcRQ0GffUAxxLti/4DereFcweDlG', 'farmer'),
(2, 'Ritika', '$2y$10$ZBtm8Dgq2QodSM69vTWQXevN/TZ2esal888t2AzwS5qYny8BiHTl2', 'buyer');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `status` enum('Pending','Completed') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `quantity`, `seller_id`) VALUES
(1, 'tractor', 'truck', '30000.00', 0, 1),
(2, 'jamin', '3 acre', '100000.00', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `session_users`
--

CREATE TABLE `session_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `logins` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `session_users`
--

INSERT INTO `session_users` (`id`, `username`, `password`, `logins`) VALUES
(1, 'Harshita Chhangani', '$2y$10$7GbLpPVE3DZw4yQR/HGn8usVm1nTDF5jv0UQqDLnrZSdi9Gm69D/6', 0),
(2, 'Ayush Bulbule', '$2y$10$sV8/8ef6.ghAhG/IaHK5.u0u2xUS7hYmJbAD5xVzYVbR6m/ojdFQW', 0),
(3, 'Vaidehi Ligde', '$2y$10$P7uZcL/tqKAmr9aVUDeIzOup1cWcig5Eb30dNFXWs3K.CqEEtH.k2', 0),
(4, 'Vedika Sontakke', '$2y$10$ce39.9RqXaaaxAjJYPO1ye5vury5ExMB59.J7sIw4b31Sys9HnmNW', 0);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `course` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `email`, `course`) VALUES
(2, 'Vaidehi Ligde', 'vaidehi.ligde22@vit.ed', 'AI/DS'),
(3, 'Ayush Bulbule', 'ayush@gmail.com', 'CSE');

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
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `purchase_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `product_id`, `buyer_id`, `quantity`, `total_amount`, `purchase_date`) VALUES
(1, 1, 1, 1, '30000.00', '2023-11-27 17:34:23'),
(2, 1, 1, 1, '30000.00', '2023-11-27 17:34:30'),
(3, 2, 1, 1, '100000.00', '2023-11-27 17:35:46'),
(4, 2, 1, 1, '100000.00', '2023-11-27 17:35:51'),
(5, 2, 1, 1, '100000.00', '2023-11-27 18:58:57');

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
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_students`
--
ALTER TABLE `class_students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaint_students`
--
ALTER TABLE `complaint_students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_id` (`student_id`);

--
-- Indexes for table `cookie_users`
--
ALTER TABLE `cookie_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farmers`
--
ALTER TABLE `farmers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indexes for table `session_users`
--
ALTER TABLE `session_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_results`
--
ALTER TABLE `student_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `buyer_id` (`buyer_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `class_students`
--
ALTER TABLE `class_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `complaint_students`
--
ALTER TABLE `complaint_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cookie_users`
--
ALTER TABLE `cookie_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `farmers`
--
ALTER TABLE `farmers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `session_users`
--
ALTER TABLE `session_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `student_results`
--
ALTER TABLE `student_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `menu_items` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `farmers` (`id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`buyer_id`) REFERENCES `farmers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
