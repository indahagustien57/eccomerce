-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Agu 2020 pada 14.50
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_barang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id` int(11) NOT NULL,
  `kategori` text NOT NULL,
  `produk` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_barang`
--

INSERT INTO `tb_barang` (`id`, `kategori`, `produk`) VALUES
(1, 'Sepeda', 'Sepeda Bronton = Rp 22.500.000,-\r\nSepeda Gunung = Rp 2.500.000,-'),
(2, 'Tas', 'Tas Hermes = Rp 45.000.000,-'),
(3, 'Makanan Pokok', 'Beras 1 sak ( netto 50 kg ) : Rp 510.000,-\r\nMie Instan Goreng ( 40 Pcs ) : Rp 90.000,-\r\nBeras Merah cap \"Tilik\" ( 5 kg ) : Rp 100.000,-'),
(4, 'Smartphone', 'Iphone 15 : Rp 35.000.000,-\r\nSamsung S13 : Rp 13.0000.000,-\r\nNexian A168 : Rp 500.000,-'),
(5, 'Bahan Bangunan', 'Pasir 1 truck : Rp 2.600.000,-\r\nSemen 1 sak : Rp 70.000,-\r\n100 biji batubata kualitas super : Rp 1.000.000,-'),
(6, 'Peralatan Memancing', 'kail kualitas A1 : Rp 200.000,-\r\nalat pancingan kualitas yahud : Rp 1.000.000,-'),
(8, 'Mobil', 'Tesla seri C (bekas) : Rp 1.500.000.000,-');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang1`
--

CREATE TABLE `tb_barang1` (
  `id` int(11) NOT NULL,
  `kategori` text NOT NULL,
  `produk` text NOT NULL,
  `gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_barang1`
--

INSERT INTO `tb_barang1` (`id`, `kategori`, `produk`, `gambar`) VALUES
(1, 'Sepeda', 'Sepeda Bronton = Rp 25.000.000,-', 'sepeda.jpg'),
(2, 'Tas', 'Tas Hermes = Rp 3.000.000,-', 'tas.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barangoke`
--

CREATE TABLE `tb_barangoke` (
  `id` int(11) NOT NULL,
  `kategori` text NOT NULL,
  `produk` int(11) NOT NULL,
  `gambar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_barang1`
--
ALTER TABLE `tb_barang1`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_barangoke`
--
ALTER TABLE `tb_barangoke`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tb_barang1`
--
ALTER TABLE `tb_barang1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_barangoke`
--
ALTER TABLE `tb_barangoke`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
