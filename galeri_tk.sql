-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Bulan Mei 2025 pada 07.45
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `galeri_tk`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `nama`) VALUES
(2, 'buah'),
(1, 'hewan'),
(3, 'kendaraan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `objek`
--

CREATE TABLE `objek` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `audio` varchar(255) DEFAULT NULL,
  `kategori_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `objek`
--

INSERT INTO `objek` (`id`, `nama`, `deskripsi`, `image`, `audio`, `kategori_id`) VALUES
(1, 'Kucing', 'Hewan peliharaan yang lucu', 'kucing.jpg', 'kucing.mp3', 1),
(2, 'Anjing', 'Hewan penjaga rumah', 'anjing.jpg', 'anjing.mp3', 1),
(3, 'Gajah', 'Hewan terbesar di darat', 'gajah.jpg', 'gajah.mp3', 1),
(4, 'Singa', 'Raja hutan', 'singa.jpg', 'singa.mp3', 1),
(5, 'Harimau', 'Hewan buas bercorak belang', 'harimau.jpg', 'harimau.mp3', 1),
(6, 'Kelinci', 'Hewan kecil dengan telinga panjang', 'kelinci.jpg', 'kelinci.mp3', 1),
(7, 'Burung', 'Hewan bersayap yang bisa terbang', 'burung.jpg', 'burung.mp3', 1),
(8, 'Bebek', 'Hewan yang hidup di air dan darat', 'bebek.jpg', 'bebek.mp3', 1),
(9, 'Ayam', 'Hewan ternak penghasil telur', 'ayam.jpg', 'ayam.mp3', 1),
(10, 'Kuda', 'Hewan cepat dan kuat', 'kuda.jpg', 'kuda.mp3', 1),
(11, 'Kambing', 'Hewan penghasil susu', 'kambing.jpg', 'kambing.mp3', 1),
(12, 'Sapi', 'Hewan besar penghasil susu dan daging', 'sapi.jpg', 'sapi.mp3', 1),
(13, 'Babi', 'Hewan ternak', 'babi.jpg', 'babi.mp3', 1),
(14, 'Ular', 'Hewan melata', 'ular.jpg', 'ular.mp3', 1),
(15, 'Kura-kura', 'Hewan lambat yang memiliki tempurung', 'kura.jpg', 'kura.mp3', 1),
(16, 'Apel', 'Buah berwarna merah dan manis.', 'apel.jpg', 'apel.mp3', 2),
(17, 'Jeruk', 'Buah berwarna oranye yang kaya vitamin C.', 'jeruk.jpg', 'jeruk.mp3', 2),
(18, 'Mangga', 'Buah tropis yang manis dan harum.', 'mangga.jpg', 'mangga.mp3', 2),
(19, 'Pisang', 'Buah kuning yang lembut dan bergizi.', 'pisang.jpg', 'pisang.mp3', 2),
(20, 'Semangka', 'Buah besar berair dengan daging merah.', 'semangka.jpg', 'semangka.mp3', 2),
(21, 'Melon', 'Buah hijau dengan rasa manis menyegarkan.', 'melon.jpg', 'melon.mp3', 2),
(22, 'Nanas', 'Buah bersisik dengan rasa asam manis.', 'nanas.jpg', 'nanas.mp3', 2),
(23, 'Anggur', 'Buah kecil bulat, biasa dibuat jus.', 'anggur.jpg', 'anggur.mp3', 2),
(24, 'Pepaya', 'Buah lembut yang baik untuk pencernaan.', 'pepaya.jpg', 'pepaya.mp3', 2),
(25, 'Durian', 'Raja buah dengan aroma tajam.', 'durian.jpg', 'durian.mp3', 2),
(26, 'Salak', 'Buah dengan kulit seperti sisik ular.', 'salak.jpg', 'salak.mp3', 2),
(27, 'Rambutan', 'Buah merah dengan rambut-rambut halus.', 'rambutan.jpg', 'rambutan.mp3', 2),
(28, 'Belimbing', 'Buah berbentuk bintang saat dipotong.', 'belimbing.jpg', 'belimbing.mp3', 2),
(29, 'Strawberry', 'Buah mungil merah dan asam manis.', 'strawberry.jpg', 'strawberry.mp3', 2),
(30, 'Sirsak', 'Buah berserat dengan rasa manis dan asam.', 'sirsak.jpg', 'sirsak.mp3', 2),
(31, 'Mobil', 'Kendaraan roda empat untuk keluarga.', 'mobil.jpg', 'mobil.mp3', 3),
(32, 'Motor', 'Kendaraan roda dua yang lincah.', 'motor.jpg', 'motor.mp3', 3),
(33, 'Bus', 'Kendaraan besar untuk banyak penumpang.', 'bus.jpg', 'bus.mp3', 3),
(34, 'Sepeda', 'Kendaraan ramah lingkungan tanpa mesin.', 'sepeda.jpg', 'sepeda.mp3', 3),
(35, 'Kereta Api', 'Kendaraan panjang yang berjalan di rel.', 'kereta.jpg', 'kereta.mp3', 3),
(36, 'Truk', 'Kendaraan besar untuk mengangkut barang.', 'truk.jpg', 'truk.mp3', 3),
(37, 'Perahu', 'Kendaraan air yang ringan.', 'perahu.jpg', 'perahu.mp3', 3),
(38, 'Kapal', 'Kendaraan besar untuk laut.', 'kapal.jpg', 'kapal.mp3', 3),
(39, 'Pesawat', 'Kendaraan terbang untuk jarak jauh.', 'pesawat.jpg', 'pesawat.mp3', 3),
(40, 'Helikopter', 'Kendaraan udara dengan baling-baling.', 'helikopter.jpg', 'helikopter.mp3', 3),
(41, 'Bajaj', 'Kendaraan kecil roda tiga.', 'bajaj.jpg', 'bajaj.mp3', 3),
(42, 'Delman', 'Kendaraan tradisional yang ditarik kuda.', 'delman.jpg', 'delman.mp3', 3),
(43, 'Skuter', 'Motor kecil untuk anak-anak.', 'skuter.jpg', 'skuter.mp3', 3),
(44, 'Tank', 'Kendaraan tempur berlapis baja.', 'tank.jpg', 'tank.mp3', 3),
(45, 'Jet', 'Pesawat terbang cepat.', 'jet.jpg', 'jet.mp3', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `created_at`) VALUES
(4, 'admin', '$2b$10$B0D0lcXGpu4ZKF7lW42T4Oynjxk/PUOXhLm7UH4OWts7EDXvgKzOC', 'admin', '2025-05-18 14:04:58'),
(5, 'lucy', '$2b$10$E0jrpXt9BQ15fh8H2umdG.R7MdbPnQdUfJJyIlN2IZBxXYU.njzYm', 'user', '2025-05-18 14:05:15');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama` (`nama`);

--
-- Indeks untuk tabel `objek`
--
ALTER TABLE `objek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `objek`
--
ALTER TABLE `objek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `objek`
--
ALTER TABLE `objek`
  ADD CONSTRAINT `objek_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
