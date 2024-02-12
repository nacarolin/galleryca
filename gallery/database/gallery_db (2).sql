-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Feb 2024 pada 17.13
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gallery_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `album_list`
--

CREATE TABLE `album_list` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `user_id` int(30) NOT NULL,
  `delete_f` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `album_list`
--

INSERT INTO `album_list` (`id`, `name`, `user_id`, `delete_f`, `date_created`, `date_updated`) VALUES
(1, 'Avatars', 1, 0, '2021-08-09 10:23:50', '2021-08-09 13:09:06'),
(2, 'Sample Images', 1, 0, '2021-08-09 11:13:16', '2021-08-09 14:12:19'),
(4, 'Album 104', 1, 0, '2021-08-09 11:16:33', NULL),
(5, 'Album 105', 1, 0, '2021-08-09 11:16:41', '2021-08-09 16:15:17'),
(8, 'Ca', 0, 1, '2024-02-01 21:32:06', '2024-02-04 17:13:32'),
(9, 'Girl', 10, 1, '2024-02-02 00:37:50', '2024-02-11 20:54:34'),
(10, 'Jeno', 10, 1, '2024-02-02 00:38:09', '2024-02-11 20:54:41'),
(11, 'Renjun', 10, 1, '2024-02-02 00:38:47', '2024-02-04 12:02:44'),
(12, 'Editing', 10, 0, '2024-02-02 00:38:54', NULL),
(13, 'Jeno.2', 10, 1, '2024-02-04 12:36:52', '2024-02-11 20:54:44'),
(14, 'siapa aja dah', 10, 1, '2024-02-04 12:43:02', '2024-02-04 21:26:30'),
(16, 'Portofolio', 10, 0, '2024-02-12 09:45:28', NULL),
(17, 'Clips', 10, 0, '2024-02-12 09:51:16', '2024-02-12 21:36:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `images`
--

CREATE TABLE `images` (
  `id` int(30) NOT NULL,
  `album_id` int(30) NOT NULL,
  `original_name` text NOT NULL,
  `path_name` text NOT NULL,
  `delete_f` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `likes` int(11) DEFAULT 0,
  `unlikes` int(11) DEFAULT 0,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `images`
--

INSERT INTO `images` (`id`, `album_id`, `original_name`, `path_name`, `delete_f`, `user_id`, `date_created`, `date_updated`, `likes`, `unlikes`, `description`) VALUES
(1, 1, 'avatar101.jpg', 'uploads/user_1/album_1/1628486640.jpg', 0, 1, '2021-08-09 13:24:44', '2021-08-09 13:45:39', 0, 0, NULL),
(2, 1, 'avatar.jpg', 'uploads/user_1/album_1/1628486640_1.jpg', 0, 1, '2021-08-09 13:24:44', NULL, 0, 0, NULL),
(3, 1, 'avatar102.png', 'uploads/user_1/album_1/1628486640.png', 0, 1, '2021-08-09 13:24:44', '2021-08-09 13:45:50', 0, 0, NULL),
(4, 2, '1.jpg', 'uploads/user_1/album_2/1628489520.jpg', 0, 1, '2021-08-09 14:12:31', NULL, 0, 0, NULL),
(5, 2, 'test.jpg', 'uploads/user_1/album_2/1628489520_1.jpg', 0, 1, '2021-08-09 14:12:31', '2021-08-09 14:13:46', 0, 0, NULL),
(6, 2, '1850646 - Copy.jpg', 'uploads/user_1/album_2/1628489520_2.jpg', 0, 1, '2021-08-09 14:12:31', NULL, 0, 0, NULL),
(16, 8, 'DESAIN.png', 'uploads/user_/album_8/1706797920.png', 1, 0, '2024-02-01 21:32:22', '2024-02-04 17:13:32', 0, 0, NULL),
(17, 12, 'Jeno.jpeg', 'uploads/user_10/album_12/1706810640.jpeg', 0, 10, '2024-02-02 01:04:02', '2024-02-04 12:10:59', 0, 0, NULL),
(18, 12, 'Jeno1.jpeg', 'uploads/user_10/album_12/1706810640_1.jpeg', 0, 10, '2024-02-02 01:04:02', '2024-02-04 12:11:51', 0, 0, NULL),
(19, 12, 'Lovedit.jpeg', 'uploads/user_10/album_12/1706810640_2.jpeg', 0, 10, '2024-02-02 01:04:02', '2024-02-04 12:11:37', 0, 0, NULL),
(20, 12, 'Chaewon1.jpeg', 'uploads/user_10/album_12/1706810640_3.jpeg', 0, 10, '2024-02-02 01:04:02', '2024-02-04 12:12:03', 0, 0, NULL),
(21, 12, 'Chaewon.jpeg', 'uploads/user_10/album_12/1706810640_4.jpeg', 0, 10, '2024-02-02 01:04:33', '2024-02-04 12:10:16', 0, 0, NULL),
(22, 12, 'Edit.jpeg', 'uploads/user_10/album_12/1706810640_5.jpeg', 0, 10, '2024-02-02 01:04:33', '2024-02-04 12:11:20', 0, 0, NULL),
(23, 9, 'Hanni.jpeg', 'uploads/user_10/album_9/1706810700.jpeg', 1, 10, '2024-02-02 01:05:37', '2024-02-11 20:54:35', 0, 0, NULL),
(24, 9, 'Hanni new jeans.jpeg', 'uploads/user_10/album_9/1706810700_1.jpeg', 1, 10, '2024-02-02 01:05:37', '2024-02-11 20:54:35', 0, 0, NULL),
(25, 9, 'New Jeans.jpeg', 'uploads/user_10/album_9/1706810700_2.jpeg', 1, 10, '2024-02-02 01:05:37', '2024-02-11 20:54:35', 0, 0, NULL),
(26, 9, 'WhatsApp Image 2024-02-02 at 1.01.51 AM.jpeg', 'uploads/user_10/album_9/1706810700_3.jpeg', 1, 10, '2024-02-02 01:05:37', '2024-02-11 20:54:35', 0, 0, NULL),
(27, 9, 'WhatsApp Image 2024-02-02 at 1.02.23 AM (1).jpeg', 'uploads/user_10/album_9/1706810700_4.jpeg', 1, 10, '2024-02-02 01:05:37', '2024-02-11 20:54:35', 0, 0, NULL),
(28, 9, 'WhatsApp Image 2024-02-02 at 1.02.23 AM.jpeg', 'uploads/user_10/album_9/1706810700_5.jpeg', 1, 10, '2024-02-02 01:05:37', '2024-02-11 20:54:35', 0, 0, NULL),
(29, 9, 'Eunsoo.jpeg', 'uploads/user_10/album_9/1706810700_6.jpeg', 1, 10, '2024-02-02 01:05:49', '2024-02-11 20:54:35', 0, 0, NULL),
(30, 10, 'WhatsApp Image 2024-02-02 at 1.02.24 AM (2).jpeg', 'uploads/user_10/album_10/1706810760.jpeg', 1, 10, '2024-02-02 01:06:56', '2024-02-11 20:54:41', 0, 0, NULL),
(31, 10, 'WhatsApp Image 2024-02-02 at 1.02.24 AM (1).jpeg', 'uploads/user_10/album_10/1706810760_1.jpeg', 1, 10, '2024-02-02 01:06:56', '2024-02-11 20:54:41', 0, 0, NULL),
(32, 10, 'WhatsApp Image 2024-02-02 at 1.01.52 AM (1).jpeg', 'uploads/user_10/album_10/1706810760_2.jpeg', 1, 10, '2024-02-02 01:06:56', '2024-02-11 20:54:41', 0, 0, NULL),
(33, 10, 'WhatsApp Image 2024-02-02 at 1.01.52 AM.jpeg', 'uploads/user_10/album_10/1706810760_3.jpeg', 1, 10, '2024-02-02 01:06:56', '2024-02-11 20:54:41', 0, 0, NULL),
(34, 10, 'WhatsApp Image 2024-02-02 at 1.01.51 AM (2).jpeg', 'uploads/user_10/album_10/1706810760_4.jpeg', 1, 10, '2024-02-02 01:06:56', '2024-02-11 20:54:41', 0, 0, NULL),
(35, 10, 'WhatsApp Image 2024-02-02 at 1.01.50 AM (1).jpeg', 'uploads/user_10/album_10/1706810760_5.jpeg', 1, 10, '2024-02-02 01:06:56', '2024-02-11 20:54:41', 0, 0, NULL),
(36, 10, 'WhatsApp Image 2024-02-02 at 1.01.50 AM.jpeg', 'uploads/user_10/album_10/1706810760_6.jpeg', 1, 10, '2024-02-02 01:06:56', '2024-02-11 20:54:41', 0, 0, NULL),
(37, 10, 'WhatsApp Image 2024-02-02 at 1.01.49 AM (1).jpeg', 'uploads/user_10/album_10/1706810760_7.jpeg', 1, 10, '2024-02-02 01:06:56', '2024-02-11 20:54:41', 0, 0, NULL),
(38, 10, 'WhatsApp Image 2024-02-02 at 1.01.49 AM.jpeg', 'uploads/user_10/album_10/1706810760_8.jpeg', 1, 10, '2024-02-02 01:06:56', '2024-02-11 20:54:41', 0, 0, NULL),
(39, 11, 'Jeno.jpeg', 'uploads/user_10/album_11/1707022860.jpeg', 1, 10, '2024-02-04 12:01:39', '2024-02-04 12:02:44', 0, 0, NULL),
(40, 13, 'WhatsApp Image 2024-02-02 at 1.02.24 AM (2).jpeg', 'uploads/user_10/album_13/1707025020.jpeg', 1, 10, '2024-02-04 12:37:08', '2024-02-04 12:40:43', 0, 0, NULL),
(41, 13, 'WhatsApp Image 2024-02-02 at 1.01.49 AM (1).jpeg', 'uploads/user_10/album_13/1707025020_1.jpeg', 1, 10, '2024-02-04 12:37:34', '2024-02-11 20:54:44', 0, 0, NULL),
(42, 13, 'WhatsApp Image 2024-02-02 at 1.01.49 AM.jpeg', 'uploads/user_10/album_13/1707025080.jpeg', 1, 10, '2024-02-04 12:38:34', '2024-02-11 20:54:44', 0, 0, NULL),
(43, 13, 'WhatsApp Image 2024-02-02 at 12.46.45 AM.jpeg', 'uploads/user_10/album_13/1707025080_1.jpeg', 1, 10, '2024-02-04 12:38:57', '2024-02-04 12:39:05', 0, 0, NULL),
(44, 13, 'WhatsApp Image 2024-02-02 at 1.01.51 AM (2).jpeg', 'uploads/user_10/album_13/1707025140.jpeg', 1, 10, '2024-02-04 12:39:13', '2024-02-11 20:54:44', 0, 0, NULL),
(45, 13, 'WhatsApp Image 2024-02-02 at 1.02.24 AM (2).jpeg', 'uploads/user_10/album_13/1707025200.jpeg', 1, 10, '2024-02-04 12:40:26', '2024-02-04 12:40:50', 0, 0, NULL),
(46, 13, 'WhatsApp Image 2024-02-02 at 1.02.24 AM (1).jpeg', 'uploads/user_10/album_13/1707025200_1.jpeg', 1, 10, '2024-02-04 12:40:26', '2024-02-11 20:54:44', 0, 0, NULL),
(47, 13, 'WhatsApp Image 2024-02-02 at 1.01.52 AM (1).jpeg', 'uploads/user_10/album_13/1707025200_2.jpeg', 1, 10, '2024-02-04 12:40:26', '2024-02-11 20:54:44', 0, 0, NULL),
(48, 13, 'WhatsApp Image 2024-02-02 at 1.01.52 AM.jpeg', 'uploads/user_10/album_13/1707025200_3.jpeg', 1, 10, '2024-02-04 12:40:26', '2024-02-04 12:40:54', 0, 0, NULL),
(49, 13, 'WhatsApp Image 2024-02-02 at 1.01.51 AM (2).jpeg', 'uploads/user_10/album_13/1707025200_4.jpeg', 1, 10, '2024-02-04 12:40:26', '2024-02-04 12:41:03', 0, 0, NULL),
(50, 13, 'WhatsApp Image 2024-02-02 at 1.01.50 AM (1).jpeg', 'uploads/user_10/album_13/1707025200_5.jpeg', 1, 10, '2024-02-04 12:40:26', '2024-02-11 20:54:44', 0, 0, NULL),
(51, 13, 'WhatsApp Image 2024-02-02 at 1.01.50 AM.jpeg', 'uploads/user_10/album_13/1707025200_6.jpeg', 1, 10, '2024-02-04 12:40:26', '2024-02-11 20:54:44', 0, 0, NULL),
(52, 13, 'WhatsApp Image 2024-02-02 at 1.01.49 AM (1).jpeg', 'uploads/user_10/album_13/1707025260.jpeg', 1, 10, '2024-02-04 12:41:14', '2024-02-04 12:41:19', 0, 0, NULL),
(53, 13, 'WhatsApp Image 2024-02-02 at 1.01.49 AM.jpeg', 'uploads/user_10/album_13/1707025260_1.jpeg', 1, 10, '2024-02-04 12:41:27', '2024-02-04 12:41:33', 0, 0, NULL),
(54, 14, 'WhatsApp Image 2024-02-02 at 1.02.23 AM (1).jpeg', 'uploads/user_10/album_14/1707025380.jpeg', 1, 10, '2024-02-04 12:43:16', '2024-02-04 21:26:30', 0, 0, NULL),
(55, 14, 'WhatsApp Image 2024-02-02 at 1.01.52 AM (1).jpeg', 'uploads/user_10/album_14/1707025380_1.jpeg', 1, 10, '2024-02-04 12:43:28', '2024-02-04 21:26:30', 0, 0, NULL),
(56, 14, 'WhatsApp Image 2024-02-02 at 1.01.48 AM (1).jpeg', 'uploads/user_10/album_14/1707025380_2.jpeg', 1, 10, '2024-02-04 12:43:36', '2024-02-04 12:45:32', 0, 0, NULL),
(57, 14, 'WhatsApp Image 2024-02-02 at 1.02.24 AM (2).jpeg', 'uploads/user_10/album_14/1707025380_3.jpeg', 1, 10, '2024-02-04 12:43:46', '2024-02-04 21:26:30', 0, 0, NULL),
(58, 14, 'WhatsApp Image 2024-02-02 at 1.03.11 AM (1).jpeg', 'uploads/user_10/album_14/1707025380_4.jpeg', 1, 10, '2024-02-04 12:43:55', '2024-02-04 21:26:30', 0, 0, NULL),
(59, 14, 'WhatsApp Image 2024-02-02 at 1.03.12 AM (1).jpeg', 'uploads/user_10/album_14/1707025500.jpeg', 1, 10, '2024-02-04 12:45:56', '2024-02-04 21:26:30', 0, 0, NULL),
(60, 15, 'Screenshot (39).png', 'uploads/user_10/album_15/1707664800.png', 1, 10, '2024-02-11 22:20:03', '2024-02-11 22:41:14', 0, 0, NULL),
(61, 15, 'Data-kelas-spp.png', 'uploads/user_10/album_15/1707664800_1.png', 1, 10, '2024-02-11 22:20:03', '2024-02-12 09:44:07', 0, 0, NULL),
(62, 15, 'Database.png', 'uploads/user_10/album_15/1707664800_2.png', 1, 10, '2024-02-11 22:20:03', '2024-02-12 09:44:07', 0, 0, NULL),
(63, 15, 'Screenshot (42).png', 'uploads/user_10/album_15/1707664800_3.png', 1, 10, '2024-02-11 22:20:03', '2024-02-11 22:42:32', 0, 0, NULL),
(64, 15, 'Screenshot (43).png', 'uploads/user_10/album_15/1707664800_4.png', 1, 10, '2024-02-11 22:20:03', '2024-02-11 22:43:00', 0, 0, NULL),
(65, 15, 'Screenshot (44).png', 'uploads/user_10/album_15/1707664800_5.png', 1, 10, '2024-02-11 22:20:03', '2024-02-11 22:43:35', 0, 0, NULL),
(66, 15, 'Screenshot (45).png', 'uploads/user_10/album_15/1707664800_6.png', 1, 10, '2024-02-11 22:20:03', '2024-02-11 22:43:20', 0, 0, NULL),
(67, 15, 'Screenshot (46).png', 'uploads/user_10/album_15/1707664800_7.png', 1, 10, '2024-02-11 22:20:03', '2024-02-11 22:44:15', 0, 0, NULL),
(68, 15, 'Aplikasi-spp.png', 'uploads/user_10/album_15/1707664800_8.png', 1, 10, '2024-02-11 22:20:03', '2024-02-12 09:43:08', 0, 0, NULL),
(69, 15, 'Screenshot (48).png', 'uploads/user_10/album_15/1707664800_9.png', 1, 10, '2024-02-11 22:20:03', '2024-02-11 22:45:10', 0, 0, NULL),
(70, 15, 'App-Dekstop.png', 'uploads/user_10/album_15/1707664800_10.png', 1, 10, '2024-02-11 22:20:03', '2024-02-12 09:43:13', 0, 0, NULL),
(71, 15, 'Screenshot (50).png', 'uploads/user_10/album_15/1707664800_11.png', 1, 10, '2024-02-11 22:20:03', '2024-02-11 22:48:12', 0, 0, NULL),
(72, 15, 'Screenshot (51).png', 'uploads/user_10/album_15/1707664800_12.png', 1, 10, '2024-02-11 22:20:03', '2024-02-12 09:44:07', 0, 0, NULL),
(73, 15, 'Screenshot (52).png', 'uploads/user_10/album_15/1707664800_13.png', 1, 10, '2024-02-11 22:20:03', '2024-02-11 22:36:53', 0, 0, NULL),
(74, 15, 'Screenshot (53).png', 'uploads/user_10/album_15/1707664800_14.png', 1, 10, '2024-02-11 22:20:03', '2024-02-12 09:44:07', 0, 0, NULL),
(75, 15, 'Screenshot (54).png', 'uploads/user_10/album_15/1707664800_15.png', 1, 10, '2024-02-11 22:20:03', '2024-02-12 09:44:07', 0, 0, NULL),
(76, 15, 'Screenshot (55).png', 'uploads/user_10/album_15/1707664800_16.png', 1, 10, '2024-02-11 22:20:03', '2024-02-12 09:44:07', 0, 0, NULL),
(77, 15, 'Screenshot (56).png', 'uploads/user_10/album_15/1707664800_17.png', 1, 10, '2024-02-11 22:20:03', '2024-02-12 07:37:26', 0, 0, NULL),
(78, 15, 'ss.png', 'uploads/user_10/album_15/1707664800_18.png', 1, 10, '2024-02-11 22:20:03', '2024-02-12 09:44:07', 0, 0, NULL),
(79, 15, 'Screenshot (58).png', 'uploads/user_10/album_15/1707664800_19.png', 1, 10, '2024-02-11 22:20:03', '2024-02-12 09:44:07', 0, 0, NULL),
(80, 15, 'Screenshot (55).png', 'uploads/user_10/album_15/1707664800_20.png', 1, 10, '2024-02-11 22:20:20', '2024-02-12 09:44:07', 0, 0, NULL),
(81, 15, 'Web-spp.png', 'uploads/user_10/album_15/1707665340.png', 1, 10, '2024-02-11 22:29:11', '2024-02-12 09:44:07', 0, 0, NULL),
(82, 15, 'Screenshot (56).png', 'uploads/user_10/album_15/1707698220.png', 1, 10, '2024-02-12 07:37:40', '2024-02-12 08:17:54', 0, 0, NULL),
(83, 15, 'Screenshot (56).png', 'uploads/user_10/album_15/1707699960.png', 1, 10, '2024-02-12 08:06:59', '2024-02-12 08:17:59', 0, 0, NULL),
(84, 15, 'Screenshot (56).png', 'uploads/user_10/album_15/1707700680.png', 1, 10, '2024-02-12 08:18:08', '2024-02-12 09:30:47', 0, 0, 'aaaaaa'),
(85, 15, 'Screenshot (56).png', 'uploads/user_10/album_15/1707705060.png', 1, 10, '2024-02-12 09:31:08', '2024-02-12 09:44:07', 0, 0, 'Ini Projek'),
(86, 16, 'Login.png', 'uploads/user_10/album_16/1707705960.png', 0, 10, '2024-02-12 09:46:39', '2024-02-12 09:46:50', 0, 0, 'Ini merupakan halaman login aplikasi SPP'),
(87, 16, 'Data-Kelas.png', 'uploads/user_10/album_16/1707706020.png', 0, 10, '2024-02-12 09:47:53', '2024-02-12 09:50:00', 0, 0, 'Halaman data kelas website SPP ( CI ) '),
(88, 16, 'Database.png', 'uploads/user_10/album_16/1707706080.png', 0, 10, '2024-02-12 09:48:37', NULL, 0, 0, 'Database website'),
(89, 16, 'Source-Code.png', 'uploads/user_10/album_16/1707706140.png', 0, 10, '2024-02-12 09:49:26', '2024-02-12 09:49:45', 0, 0, 'Source code aplikasi dekstop java'),
(90, 16, 'Web-spp.png', 'uploads/user_10/album_16/1707706200.png', 0, 10, '2024-02-12 09:50:37', NULL, 0, 0, 'Website SPP Laravel'),
(91, 17, 'Rumah.jpg', 'uploads/user_10/album_17/1707748620.jpg', 1, 10, '2024-02-12 21:37:29', '2024-02-12 22:08:33', 0, 0, 'Ini merupakan pemandangan dari sudut perumahan '),
(92, 17, 'Rumah.jpg', 'uploads/user_10/album_17/1707750480.jpg', 1, 10, '2024-02-12 22:08:11', '2024-02-12 22:08:37', 0, 0, 'Foto ini menawarkan gambaran idylia dari rumah yang dihiasi dengan bunga yang mekar dan kolam kecil yang indah di depannya. Warna-warna alam yang cerah dan tekstur yang halus menciptakan suasana yang menenangkan dan menarik. Rumah itu tampak nyaman dan memiliki daya tarik visual yang kuat, dengan elemen-elemen arsitektural yang menambah keindahannya. Kolam kecil di depan rumah tidak hanya menambah keindahan visual, tetapi juga memberikan suasana yang segar dan menenangkan, seperti suatu sanctuary di tengah perkotaan. Bunga-bunga yang mekar di sekeliling rumah menambahkan nuansa keindahan alami yang membuat foto ini tampak sangat cantik dan menarik.'),
(93, 17, 'Rumah.jpg', 'uploads/user_10/album_17/1707750540.jpg', 0, 10, '2024-02-12 22:09:06', NULL, 0, 0, 'Foto ini menawarkan gambaran idylia dari rumah yang dihiasi dengan bunga yang mekar dan kolam kecil yang indah di depannya. Warna-warna alam yang cerah dan tekstur yang halus menciptakan suasana yang menenangkan dan menarik. '),
(94, 17, 'Gunung.jpg', 'uploads/user_10/album_17/1707750600.jpg', 0, 10, '2024-02-12 22:10:40', NULL, 0, 0, 'Foto ini menampilkan keindahan alam yang tak terlupakan, dengan gunung yang tinggi dan pohon-pohon yang menyerap mata. Gunung yang tampak majestik menjadi latar belakang yang indah untuk serangkaian pohon yang tumbuh kokoh dan menawan.'),
(95, 17, 'Danau.jpg', 'uploads/user_10/album_17/1707751080.jpg', 1, 10, '2024-02-12 22:18:28', '2024-02-12 22:20:57', 0, 0, 'Foto ini mengejutkan dengan keindahan danau yang tenang dan sejuk. Air yang jernih dan gelap mencerminkan langit yang biru dan bulan yang cerah, membuat pemandangan tampak seolah-olah kita berada di dunia bawah laut. '),
(96, 17, 'Danau.jpg', 'uploads/user_10/album_17/1707751260.jpg', 0, 10, '2024-02-12 22:21:05', NULL, 0, 0, 'Foto ini menangkap keajaiban alam di waktu sore, dengan danau yang tenang dan air yang mencerminkan sinar sisa matahari. Siluet pohon-pohon yang besar dan tegak di tepi danau menciptakan gambar yang romantis dan damai, seolah-olah mereka bersembunyi di balik tangan malam.'),
(97, 17, 'Awan.jpg', 'uploads/user_10/album_17/1707751261.jpg', 1, 10, '2024-02-12 22:21:57', '2024-02-12 22:24:02', 0, 0, ''),
(98, 17, 'Ladang.jpg', 'uploads/user_10/album_17/1707751440.jpg', 0, 10, '2024-02-12 22:24:18', '2024-02-12 22:24:59', 0, 0, 'Foto ini menampilkan ladang yang tampak seperti kubah cerah dengan langit yang murni dan awan-awan putih yang seputih. Bunga-bunga yang bergerak tertiup angin menambahkan kehidupan pada pemandangan yang statis, menciptakan harmoni antara alam dan keindahan yang tampak seolah-olah terus berubah namun tetap indah.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `image_comments`
--

CREATE TABLE `image_comments` (
  `id` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `photo_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Simple Image Gallery System'),
(6, 'short_name', 'Gallery'),
(11, 'logo', 'uploads/gallery.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2021-06-21 09:55:07'),
(2, 'Carolina', 'Gisela', 'Carol', '12345', NULL, NULL, 0, '2024-02-01 21:29:40', NULL),
(10, 'Carolina', 'Gisela', 'Carol', '827ccb0eea8a706c4c34a16891f84e7b', 'uploads/1706797860_nct-dream-jaemin-hot-sauce-4k-wallpaper-3840x2160-uhdpaper.com-137.0_a.jpg', NULL, 0, '2024-02-01 21:31:02', '2024-02-04 21:17:38'),
(11, 'Carolina', 'Gisela', 'Carol', '827ccb0eea8a706c4c34a16891f84e7b', 'uploads/1706797860_nct-dream-jaemin-hot-sauce-4k-wallpaper-3840x2160-uhdpaper.com-137.0_a.jpg', NULL, 0, '2024-02-01 21:31:42', NULL),
(12, '', '', '', '', NULL, NULL, 0, '2024-02-01 23:17:03', NULL),
(13, 'Michiella', 'Kanaica', 'Michie', '827ccb0eea8a706c4c34a16891f84e7b', 'uploads/1707041580_WhatsApp Image 2024-02-02 at 1.01.48 AM (1).jpeg', NULL, 0, '2024-02-04 17:13:18', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `album_list`
--
ALTER TABLE `album_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `image_comments`
--
ALTER TABLE `image_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `image_id` (`image_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `album_list`
--
ALTER TABLE `album_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `images`
--
ALTER TABLE `images`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT untuk tabel `image_comments`
--
ALTER TABLE `image_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `image_comments`
--
ALTER TABLE `image_comments`
  ADD CONSTRAINT `image_comments_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  ADD CONSTRAINT `image_comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
