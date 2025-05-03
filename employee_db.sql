-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2025 at 08:11 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employee_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `employee_id`, `date`, `time`, `status`) VALUES
(2, 4, '2025-04-05', '09:33:00', 'Present'),
(3, 4, '2025-04-05', '09:33:00', 'Present'),
(4, 4, '2025-04-05', '17:59:00', 'Absent'),
(5, 4, '2025-04-10', '18:57:00', 'Half Day'),
(6, 6, '2025-04-05', '10:26:00', 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `email`, `password`, `created_at`, `role`) VALUES
(1, 'alam', 'amz@gmail.com', '$2y$10$pUR6.kUzhDLmOF7sQjsJveozMvmJ/hyG2hRTg2ocYXgZfTnx/w0D.', '2025-04-05 08:28:06', ''),
(2, 'test', 'abc@gmail.com', '$2y$10$5ya2vlJSZlHOH9bHbN7dEuCIMq0z1kOG4fL2SfLQ6.2QxB2csaxTW', '2025-04-05 08:45:30', 'employee'),
(3, 'test', 'xyz@gmail.com', '$2y$10$vIlhllzy7Em1Dnw7AQwZ3u21gF8zTfgmJ0F4NT3jiOZwJb8CxbjUO', '2025-04-05 08:45:46', 'employee'),
(4, 'admin', 'admin@gmail.com', '$2y$10$ale93ec2kq9SSghb2HQQL.HWz5X1RgpIiXEdeEXR.4rnYcWsPRUxS', '2025-04-05 09:30:46', 'admin'),
(5, 'alam', 'alam@gmail.com', '$2y$10$6BxcEADSvpJZXD9GcKu7jOFXy1ng0nyh/euZdURSdESHs9Tk6oYHC', '2025-04-05 10:47:22', 'employee'),
(6, 'alam', 'munawar@gmail.com', '$2y$10$3d.C27VaOuf4yCXSOgdMAu43gOn3S2yUAoLvjdhAO1PysCQGeLYOi', '2025-04-05 12:33:14', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `employee_list`
--

CREATE TABLE `employee_list` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_list`
--

INSERT INTO `employee_list` (`id`, `name`, `email`, `phone`, `designation`) VALUES
(4, 'vishal chauhan', 'vishal@gmail.com', '7894567894', 'web'),
(6, 'sunny', 'sunny@gmail.com', '123456789', 'filed'),
(7, 'raj', 'raj@gmail.com', '7894561231', 'web developer'),
(8, 'govinda', 'govinda@gmail.com', '123456789', 'field'),
(10, 'munawar', 'webdesigner.amztech@gmail.com', '08754875487', 'web design'),
(11, 'amar', 'webdesigner.amztech@gmail.com', '08754875487', 'filed');

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `basic_salary` decimal(10,2) DEFAULT NULL,
  `bonus` decimal(10,2) DEFAULT NULL,
  `advance` decimal(10,2) DEFAULT NULL,
  `pending` decimal(10,2) DEFAULT NULL,
  `late` decimal(10,2) DEFAULT NULL,
  `overtime` decimal(10,2) DEFAULT NULL,
  `deductions` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`id`, `emp_id`, `basic_salary`, `bonus`, `advance`, `pending`, `late`, `overtime`, `deductions`, `total`, `status`, `created_at`) VALUES
(2, 1, 45454.00, 45.00, 45.00, 45.00, 54.00, 545.00, 44.00, 45946.00, 'paid', '2025-04-07 16:23:56'),
(4, 2, 45454.00, 454.00, 45.00, 45.00, 554.00, 45.00, 454.00, 44945.00, 'paid', '2025-04-07 16:33:52'),
(5, 1, 54654.00, 546.00, 5.00, 5.00, 5.00, 5.00, 5.00, 55195.00, 'paid', '2025-04-07 16:41:16'),
(6, 2, 544545.00, 4.00, 4.00, 4.00, 4.00, 4.00, 45.00, 544504.00, 'paid', '2025-04-07 16:43:00'),
(7, 1, 67676.00, 767.00, 76.00, 6.00, 6.00, 6.00, 6.00, 68367.00, 'unpaid', '2025-04-07 16:44:19'),
(10, 10, 455435.00, 454.00, 45.00, 45.00, 45.00, 454.00, 454.00, 455844.00, 'paid', '2025-04-07 18:33:15'),
(11, 7, 45435.00, 56.00, 56.00, 565.00, 65.00, 65.00, 565.00, 45435.00, 'paid', '2025-04-07 18:33:40'),
(12, 4, 56565.00, 65.00, 56.00, 5.00, 656.00, 65.00, 56.00, 55932.00, 'unpaid', '2025-04-07 18:33:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `employee_list`
--
ALTER TABLE `employee_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employee_list`
--
ALTER TABLE `employee_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `salary`
--
ALTER TABLE `salary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee_list` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
