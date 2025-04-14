-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2025 at 09:26 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diskon`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `IdBarang` int(11) NOT NULL,
  `NamaBarang` varchar(50) DEFAULT NULL,
  `Harga` varchar(50) DEFAULT NULL,
  `Besarandiskon` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`IdBarang`, `NamaBarang`, `Harga`, `Besarandiskon`) VALUES
(6, 'baju', '200000', 20.00),
(7, 'spageti ', '3000', 3.00),
(9, 'indomie', '2000000', 80.00),
(11, 'sarung', '35000', 10.00),
(12, 'printer', '2000', 10.00),
(13, 'ram', '200000', 50.00),
(14, 'mie', '3000', 2.00),
(15, 'kursi', '3000', 10.00);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `IdTransaksi` int(11) NOT NULL,
  `Jumlah` varchar(50) DEFAULT NULL,
  `TotalHarga` varchar(255) DEFAULT NULL,
  `IdBarang` int(11) DEFAULT NULL,
  `IdUser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`IdTransaksi`, `Jumlah`, `TotalHarga`, `IdBarang`, `IdUser`) VALUES
(2, '1', '160000', 6, 7),
(3, '2', '5820', 7, 7),
(4, '1', '2910', 7, 7),
(5, '1', '2910', 7, 7),
(6, '1', '2910', 7, 7),
(7, '1', '2910', 7, 7),
(8, '1', '2910', 7, 9),
(9, '1', '2910', 7, 2),
(10, '7', '20370', 7, 2),
(11, '2', '5820', 7, 9),
(12, '1', '400000', 9, 7),
(13, '1', '2910', 7, 9),
(15, '1', '1600000', 9, 10),
(16, '1', '2700', 15, 7);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `IdUser` int(11) NOT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `NamaLengkap` varchar(50) DEFAULT NULL,
  `Role` enum('Admin','Pengguna') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`IdUser`, `Username`, `Password`, `NamaLengkap`, `Role`) VALUES
(2, 'rere', '$2y$10$BfqtmnE1OtxQbWrH16DDAOooEijExBBakd2roxLdc2RLsHMTD8g3m', 'rerere', 'Admin'),
(3, NULL, NULL, NULL, 'Pengguna'),
(5, 'rere', '$2y$10$J3nA0MocAGKjSp1y95wSq.8JSSPUz8YJYG8TClgEASb5jxlc3c7La', '', ''),
(6, 'rere', '$2y$10$aRQTcD7np.GOxgQuC1C6a.ei./RJdilYWQvh4qWDVpHL98UaEdQuS', '', ''),
(7, 'dep', '$2y$10$A2xZwv5.Ov2ZgtmtKyiXqOceXrmeoMLZ350KcmXtdH4c6D1XM6A26', 'depzr', 'Pengguna'),
(8, 'dep', '$2y$10$nF80SWkjeOMR3kYUjG9sjeeb.fUWj8zsC1ZN/K9fsIx1/L5naiLuy', 'depzr', 'Pengguna'),
(9, 'dika', '$2y$10$mzyQTq2uGdTU8fhp/58dUue0dd28msiM241.iPrREp2qH749F5k8S', 'dika permana', 'Pengguna'),
(10, 'agus', '$2y$10$kU9kqKxHVboUuUS89UxIBOirbOI8FTu1egWuU0nWRJxwgM2waIIZy', 'aguss', 'Pengguna'),
(11, 'agus', '$2y$10$FOailnCMcpsXSG5ec5PBS.H2yyAG4jRbk/.WgOKJrM5M4MXwQIGj2', 'agus ', 'Pengguna');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`IdBarang`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`IdTransaksi`),
  ADD KEY `FK_transaksi_barang` (`IdBarang`),
  ADD KEY `FK_transaksi_user` (`IdUser`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`IdUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `IdBarang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `IdTransaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `IdUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`IdUser`) REFERENCES `user` (`IdUser`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`IdBarang`) REFERENCES `barang` (`IdBarang`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
