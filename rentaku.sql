-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2023 at 05:21 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rentaku`
--

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id_partner` int(255) NOT NULL,
  `id_user` int(255) NOT NULL,
  `id_vehicles` int(255) NOT NULL,
  `garage_name` varchar(150) NOT NULL,
  `owner_name` varchar(150) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(300) NOT NULL,
  `description` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rentals`
--

CREATE TABLE `rentals` (
  `id_rental` int(255) NOT NULL,
  `id_customer` int(255) NOT NULL,
  `id_partner` int(255) NOT NULL,
  `id_vehicle` int(255) NOT NULL,
  `rental_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `return_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_cost` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(255) NOT NULL,
  `name_user` varchar(150) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `address` varchar(300) DEFAULT NULL,
  `emergency_number` varchar(15) DEFAULT NULL,
  `id_ktp` varchar(50) DEFAULT NULL,
  `id_sim` varchar(50) DEFAULT NULL,
  `id_paspor` varchar(100) DEFAULT NULL,
  `ktp` varchar(300) DEFAULT NULL,
  `ktp_face` varchar(300) DEFAULT NULL,
  `sim_a` varchar(300) DEFAULT NULL,
  `sim_c` varchar(300) DEFAULT NULL,
  `passpor` varchar(300) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateed_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `name_user`, `gender`, `phone`, `email`, `password`, `address`, `emergency_number`, `id_ktp`, `id_sim`, `id_paspor`, `ktp`, `ktp_face`, `sim_a`, `sim_c`, `passpor`, `created_at`, `updateed_at`) VALUES
(1, 'Naufal Rozan', 'Pria', '083811112222', 'naufal@gmail.com', '12345678', NULL, '082211112222', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-29 14:54:49', '2023-05-29 14:56:41');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id_vehicles` int(255) NOT NULL,
  `vehicle_name` varchar(100) NOT NULL,
  `vehicle_brand` varchar(100) NOT NULL,
  `year_vehicle` varchar(100) NOT NULL,
  `vehicle_price` int(100) NOT NULL,
  `status_vehicle` varchar(100) NOT NULL,
  `vehicle_location` int(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id_partner`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_vehicles` (`id_vehicles`);

--
-- Indexes for table `rentals`
--
ALTER TABLE `rentals`
  ADD PRIMARY KEY (`id_rental`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_partner` (`id_partner`),
  ADD KEY `id_vehicle` (`id_vehicle`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id_vehicles`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id_partner` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rentals`
--
ALTER TABLE `rentals`
  MODIFY `id_rental` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id_vehicles` int(255) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `partners`
--
ALTER TABLE `partners`
  ADD CONSTRAINT `id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `id_vehicles` FOREIGN KEY (`id_vehicles`) REFERENCES `vehicles` (`id_vehicles`);

--
-- Constraints for table `rentals`
--
ALTER TABLE `rentals`
  ADD CONSTRAINT `id_customer` FOREIGN KEY (`id_customer`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `id_partner` FOREIGN KEY (`id_partner`) REFERENCES `partners` (`id_partner`),
  ADD CONSTRAINT `id_vehicle` FOREIGN KEY (`id_vehicle`) REFERENCES `vehicles` (`id_vehicles`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
