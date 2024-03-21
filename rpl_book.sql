-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Mar 2024 pada 07.47
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rpl_book`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `author`
--

CREATE TABLE `author` (
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `URL` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `book`
--

CREATE TABLE `book` (
  `ISBN` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `PublisherName` varchar(100) NOT NULL,
  `AuthorName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `email` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `publisher`
--

CREATE TABLE `publisher` (
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `URL` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `shopping_basket`
--

CREATE TABLE `shopping_basket` (
  `basketID` int(11) NOT NULL,
  `CustomerEmail` varchar(100) NOT NULL,
  `Order_BookISBN` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `warehouse`
--

CREATE TABLE `warehouse` (
  `code` int(11) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `warehouse_stock`
--

CREATE TABLE `warehouse_stock` (
  `ID_Warehouse` int(11) NOT NULL,
  `Count` int(11) NOT NULL,
  `BookISBN` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`name`);

--
-- Indeks untuk tabel `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `fk_Book_Publisher` (`PublisherName`),
  ADD KEY `fk_Book_Author` (`AuthorName`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`name`);

--
-- Indeks untuk tabel `shopping_basket`
--
ALTER TABLE `shopping_basket`
  ADD PRIMARY KEY (`basketID`),
  ADD KEY `fk_Shopping_basket_Customer` (`CustomerEmail`),
  ADD KEY `fk_OrderBookISBN_ISBN` (`Order_BookISBN`);

--
-- Indeks untuk tabel `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`code`);

--
-- Indeks untuk tabel `warehouse_stock`
--
ALTER TABLE `warehouse_stock`
  ADD KEY `fk_IDWarehouse_Code` (`ID_Warehouse`),
  ADD KEY `fk_BookISBN_ISBN` (`BookISBN`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `fk_Book_Author` FOREIGN KEY (`AuthorName`) REFERENCES `author` (`name`),
  ADD CONSTRAINT `fk_Book_Publisher` FOREIGN KEY (`PublisherName`) REFERENCES `publisher` (`name`);

--
-- Ketidakleluasaan untuk tabel `shopping_basket`
--
ALTER TABLE `shopping_basket`
  ADD CONSTRAINT `fk_OrderBookISBN_ISBN` FOREIGN KEY (`Order_BookISBN`) REFERENCES `book` (`ISBN`),
  ADD CONSTRAINT `fk_Shopping_basket_Customer` FOREIGN KEY (`CustomerEmail`) REFERENCES `customer` (`email`);

--
-- Ketidakleluasaan untuk tabel `warehouse_stock`
--
ALTER TABLE `warehouse_stock`
  ADD CONSTRAINT `fk_BookISBN_ISBN` FOREIGN KEY (`BookISBN`) REFERENCES `book` (`ISBN`),
  ADD CONSTRAINT `fk_IDWarehouse_Code` FOREIGN KEY (`ID_Warehouse`) REFERENCES `warehouse` (`code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
