-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2025 at 07:21 AM
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
-- Database: `pakar`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `nama_lengkap` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`, `nama_lengkap`) VALUES
('admin', 'e00cf25ad42683b3df678c61f42c6bda', 'Administrator'),
('puput', 'f95c24c42b0f2ea683727cc47cde3ad2', 'Puput Putri');

-- --------------------------------------------------------

--
-- Table structure for table `basis_pengetahuan`
--

CREATE TABLE `basis_pengetahuan` (
  `kode_pengetahuan` int(11) NOT NULL,
  `kode_penyakit` int(11) NOT NULL,
  `kode_gejala` int(11) NOT NULL,
  `mb` double(11,1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `basis_pengetahuan`
--

INSERT INTO `basis_pengetahuan` (`kode_pengetahuan`, `kode_penyakit`, `kode_gejala`, `mb`) VALUES
(163, 52, 108, 1.0),
(162, 52, 110, 1.0),
(161, 52, 109, 1.0),
(160, 51, 108, 1.0),
(159, 51, 104, 0.6),
(158, 50, 107, 0.6),
(157, 51, 106, 1.0),
(156, 50, 105, 0.2),
(155, 50, 104, 0.8),
(154, 50, 103, 0.6),
(153, 50, 102, 0.6),
(152, 50, 101, 1.0);

-- --------------------------------------------------------

--
-- Table structure for table `gejala`
--

CREATE TABLE `gejala` (
  `kode_gejala` int(11) NOT NULL,
  `nama_gejala` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `gejala`
--

INSERT INTO `gejala` (`kode_gejala`, `nama_gejala`) VALUES
(110, 'terdapat bercak bersudut warna kemerah'),
(109, 'Muncul bintik-bintik jingga pada daun'),
(108, 'Daun rontok'),
(107, 'Daun pucat'),
(106, 'Daun dan tunas tertutup lapisan putih'),
(105, 'Daun jadi berlubang'),
(104, 'Daun mengering '),
(101, 'Muncul bercak hitam berbentuk bulat di daun'),
(102, 'Bercak di jumpai pada daun yang tua'),
(103, 'Jika bercak membesar daun akan rontok');

-- --------------------------------------------------------

--
-- Table structure for table `hasil`
--

CREATE TABLE `hasil` (
  `id_hasil` int(11) NOT NULL,
  `tanggal` varchar(50) NOT NULL DEFAULT '0',
  `penyakit` text NOT NULL,
  `gejala` text NOT NULL,
  `hasil_id` int(11) NOT NULL,
  `hasil_nilai` varchar(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `hasil`
--

INSERT INTO `hasil` (`id_hasil`, `tanggal`, `penyakit`, `gejala`, `hasil_id`, `hasil_nilai`) VALUES
(321, '2025-05-01 13:10:00', 'a:1:{i:44;s:6:\"0.9680\";}', 'a:3:{i:87;s:1:\"4\";i:88;s:1:\"5\";i:89;s:1:\"4\";}', 44, '0.9680'),
(320, '2025-05-01 13:09:52', 'a:1:{i:44;s:6:\"1.0000\";}', 'a:1:{i:0;s:2:\"87\";}', 44, '1.0000'),
(319, '2025-05-01 13:09:28', 'a:1:{i:44;s:6:\"0.9680\";}', 'a:3:{i:87;s:1:\"4\";i:88;s:1:\"5\";i:89;s:1:\"4\";}', 44, '0.9680'),
(318, '2025-05-01 13:09:18', 'a:1:{i:44;s:6:\"1.0000\";}', 'a:3:{i:87;s:1:\"4\";i:88;s:1:\"5\";i:89;s:1:\"4\";}', 44, '1.0000'),
(317, '2025-05-01 13:08:06', 'a:1:{i:44;s:6:\"0.9680\";}', 'a:3:{i:87;s:1:\"4\";i:88;s:1:\"5\";i:89;s:1:\"4\";}', 44, '0.9680'),
(316, '2025-05-01 13:04:16', 'a:1:{i:43;s:6:\"0.4560\";}', 'a:2:{i:85;s:1:\"2\";i:86;s:1:\"3\";}', 43, '0.4560'),
(315, '2025-05-01 12:55:47', 'a:1:{i:43;s:6:\"0.6880\";}', 'a:2:{i:85;s:1:\"2\";i:86;s:1:\"3\";}', 43, '0.6880'),
(314, '2025-05-01 12:55:17', 'a:1:{i:43;s:6:\"1.0000\";}', 'a:2:{i:85;s:1:\"5\";i:86;s:1:\"4\";}', 43, '1.0000'),
(322, '2025-05-01 13:56:27', 'a:1:{i:45;s:6:\"0.1200\";}', 'a:2:{i:90;s:1:\"2\";i:91;s:1:\"1\";}', 45, '0.1200'),
(323, '2025-05-01 13:58:23', 'a:1:{i:45;s:6:\"0.1200\";}', 'a:2:{i:90;s:1:\"2\";i:91;s:1:\"1\";}', 45, '0.1200'),
(324, '2025-05-01 14:00:21', 'a:1:{i:45;s:6:\"0.3312\";}', 'a:2:{i:90;s:1:\"2\";i:91;s:1:\"1\";}', 45, '0.3312'),
(325, '2025-05-01 14:00:31', 'a:1:{i:45;s:6:\"0.3312\";}', 'a:2:{i:90;s:1:\"2\";i:91;s:1:\"1\";}', 45, '0.3312'),
(326, '2025-05-01 14:00:52', 'a:1:{i:43;s:6:\"0.9600\";}', 'a:2:{i:85;s:1:\"4\";i:86;s:1:\"5\";}', 43, '0.9600'),
(327, '2025-05-01 14:01:31', 'a:1:{i:43;s:6:\"0.8560\";}', 'a:2:{i:85;s:1:\"4\";i:86;s:1:\"5\";}', 43, '0.8560'),
(328, '2025-05-01 14:04:34', 'a:1:{i:43;s:6:\"0.9600\";}', 'a:2:{i:85;s:1:\"4\";i:86;s:1:\"5\";}', 43, '0.9600'),
(329, '2025-05-01 14:06:52', 'a:1:{i:43;s:6:\"1.0000\";}', 'a:2:{i:85;s:1:\"5\";i:86;s:1:\"4\";}', 43, '1.0000'),
(330, '2025-05-01 14:07:04', 'a:1:{i:43;s:6:\"0.8960\";}', 'a:2:{i:85;s:1:\"5\";i:86;s:1:\"4\";}', 43, '0.8960'),
(331, '2025-05-01 14:07:18', 'a:1:{i:43;s:6:\"0.8960\";}', 'a:2:{i:85;s:1:\"5\";i:86;s:1:\"4\";}', 43, '0.8960'),
(332, '2025-05-01 14:07:41', 'a:1:{i:43;s:6:\"0.8960\";}', 'a:2:{i:85;s:1:\"5\";i:86;s:1:\"4\";}', 43, '0.8960'),
(333, '2025-05-01 14:09:54', 'a:1:{i:43;s:6:\"0.8960\";}', 'a:2:{i:85;s:1:\"5\";i:86;s:1:\"4\";}', 43, '0.8960'),
(334, '2025-05-01 14:14:10', 'a:1:{i:46;s:6:\"0.9878\";}', 'a:5:{i:92;s:1:\"5\";i:93;s:1:\"5\";i:94;s:1:\"4\";i:95;s:1:\"6\";i:96;s:1:\"3\";}', 46, '0.9878'),
(335, '2025-05-01 14:26:29', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(336, '2025-05-01 14:27:45', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(337, '2025-05-01 14:28:02', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(338, '2025-05-01 14:28:11', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(339, '2025-05-01 14:28:52', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(340, '2025-05-01 14:29:16', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(341, '2025-05-01 14:29:22', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(342, '2025-05-01 14:29:31', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(343, '2025-05-01 14:29:40', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(344, '2025-05-01 14:29:43', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(345, '2025-05-01 14:29:48', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(346, '2025-05-01 14:29:58', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(347, '2025-05-01 14:30:18', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(348, '2025-05-01 14:30:30', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(349, '2025-05-01 14:30:36', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(350, '2025-05-01 14:30:48', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(351, '2025-05-01 14:30:58', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(352, '2025-05-01 14:31:03', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(353, '2025-05-01 14:31:09', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(354, '2025-05-01 14:31:19', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(355, '2025-05-01 14:31:37', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(356, '2025-05-01 14:32:11', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(357, '2025-05-01 14:32:20', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(358, '2025-05-01 14:32:34', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(359, '2025-05-01 14:33:31', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(360, '2025-05-01 14:33:43', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(361, '2025-05-01 14:34:36', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(362, '2025-05-01 14:34:52', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(363, '2025-05-01 14:35:21', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(364, '2025-05-01 14:36:07', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(365, '2025-05-01 14:38:50', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(366, '2025-05-01 14:38:54', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(367, '2025-05-01 14:39:10', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(368, '2025-05-01 14:40:55', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(369, '2025-05-01 14:41:27', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(370, '2025-05-01 14:41:33', 'a:2:{i:47;s:6:\"0.9684\";i:46;s:6:\"0.4800\";}', 'a:5:{i:95;s:1:\"4\";i:97;s:1:\"4\";i:98;s:1:\"3\";i:99;s:1:\"4\";i:100;s:1:\"5\";}', 47, '0.9684'),
(371, '2025-05-01 14:41:44', 'a:2:{i:44;s:6:\"1.0000\";i:43;s:6:\"0.3280\";}', 'a:3:{i:85;s:1:\"2\";i:86;s:1:\"2\";i:87;s:1:\"6\";}', 44, '1.0000'),
(372, '2025-05-01 14:42:44', 'a:2:{i:44;s:6:\"1.0000\";i:43;s:6:\"0.3280\";}', 'a:3:{i:85;s:1:\"2\";i:86;s:1:\"2\";i:87;s:1:\"6\";}', 44, '1.0000'),
(373, '2025-05-01 14:42:46', 'a:2:{i:44;s:6:\"1.0000\";i:43;s:6:\"0.3280\";}', 'a:3:{i:85;s:1:\"2\";i:86;s:1:\"2\";i:87;s:1:\"6\";}', 44, '1.0000'),
(374, '2025-05-01 14:43:30', 'a:2:{i:44;s:6:\"1.0000\";i:43;s:6:\"0.3280\";}', 'a:3:{i:85;s:1:\"2\";i:86;s:1:\"2\";i:87;s:1:\"6\";}', 44, '1.0000'),
(375, '2025-05-01 14:43:37', 'a:2:{i:44;s:6:\"1.0000\";i:43;s:6:\"0.3280\";}', 'a:3:{i:85;s:1:\"2\";i:86;s:1:\"2\";i:87;s:1:\"6\";}', 44, '1.0000'),
(376, '2025-05-01 14:43:46', 'a:2:{i:44;s:6:\"1.0000\";i:43;s:6:\"0.3280\";}', 'a:3:{i:85;s:1:\"2\";i:86;s:1:\"2\";i:87;s:1:\"6\";}', 44, '1.0000'),
(377, '2025-05-01 14:45:35', 'a:2:{i:44;s:6:\"1.0000\";i:43;s:6:\"0.3280\";}', 'a:3:{i:85;s:1:\"2\";i:86;s:1:\"2\";i:87;s:1:\"6\";}', 44, '1.0000'),
(378, '2025-05-01 14:46:00', 'a:2:{i:44;s:6:\"0.5200\";i:45;s:6:\"0.2400\";}', 'a:3:{i:88;s:1:\"3\";i:89;s:1:\"2\";i:90;s:1:\"3\";}', 44, '0.5200'),
(379, '2025-05-01 14:46:18', 'a:3:{i:44;s:6:\"0.9520\";i:45;s:6:\"0.6000\";i:43;s:6:\"0.1600\";}', 'a:6:{i:85;s:1:\"1\";i:86;s:1:\"2\";i:87;s:1:\"3\";i:88;s:1:\"4\";i:89;s:1:\"5\";i:90;s:1:\"6\";}', 44, '0.9520'),
(380, '2025-05-01 14:47:32', 'a:3:{i:44;s:6:\"0.9520\";i:45;s:6:\"0.6000\";i:43;s:6:\"0.1600\";}', 'a:6:{i:85;s:1:\"1\";i:86;s:1:\"2\";i:87;s:1:\"3\";i:88;s:1:\"4\";i:89;s:1:\"5\";i:90;s:1:\"6\";}', 44, '0.9520'),
(381, '2025-05-01 14:48:24', 'a:3:{i:44;s:6:\"0.9520\";i:45;s:6:\"0.6000\";i:43;s:6:\"0.1600\";}', 'a:6:{i:85;s:1:\"1\";i:86;s:1:\"2\";i:87;s:1:\"3\";i:88;s:1:\"4\";i:89;s:1:\"5\";i:90;s:1:\"6\";}', 44, '0.9520'),
(382, '2025-05-01 15:22:23', 'a:0:{}', 'a:0:{}', 0, ''),
(383, '2025-05-01 15:24:52', 'a:0:{}', 'a:0:{}', 0, ''),
(384, '2025-05-01 15:25:46', 'a:0:{}', 'a:0:{}', 0, ''),
(385, '2025-05-01 15:27:24', 'a:0:{}', 'a:0:{}', 0, ''),
(386, '2025-05-01 15:27:44', 'a:0:{}', 'a:0:{}', 0, ''),
(387, '2025-05-01 15:28:01', 'a:0:{}', 'a:0:{}', 0, ''),
(388, '2025-05-01 15:28:36', 'a:0:{}', 'a:0:{}', 0, ''),
(389, '2025-05-02 10:00:28', 'a:1:{i:45;s:6:\"0.3312\";}', 'a:2:{i:90;s:1:\"3\";i:91;s:1:\"2\";}', 45, '0.3312'),
(390, '2025-05-02 10:04:07', 'a:0:{}', 'a:5:{i:92;s:1:\"4\";i:93;s:1:\"4\";i:94;s:1:\"5\";i:95;s:1:\"6\";i:96;s:1:\"4\";}', 0, ''),
(391, '2025-05-02 10:04:56', 'a:0:{}', 'a:5:{i:92;s:1:\"5\";i:93;s:1:\"3\";i:94;s:1:\"4\";i:95;s:1:\"3\";i:96;s:1:\"3\";}', 0, ''),
(392, '2025-05-02 10:54:57', 'a:1:{i:53;s:6:\"0.3312\";}', 'a:2:{i:111;s:1:\"2\";i:112;s:1:\"3\";}', 53, '0.3312'),
(393, '2025-05-02 14:57:50', 'a:2:{i:50;s:6:\"0.9855\";i:51;s:6:\"0.6000\";}', 'a:5:{i:101;s:1:\"5\";i:102;s:1:\"3\";i:103;s:1:\"5\";i:104;s:1:\"6\";i:105;s:1:\"3\";}', 50, '0.9855'),
(394, '2025-05-03 10:23:57', 'a:2:{i:50;s:6:\"0.9855\";i:51;s:6:\"0.6000\";}', 'a:5:{i:101;s:1:\"5\";i:102;s:1:\"3\";i:103;s:1:\"5\";i:104;s:1:\"6\";i:105;s:1:\"3\";}', 50, '0.9855');

-- --------------------------------------------------------

--
-- Table structure for table `kondisi`
--

CREATE TABLE `kondisi` (
  `id` int(11) NOT NULL,
  `kondisi` varchar(64) NOT NULL,
  `ket` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kondisi`
--

INSERT INTO `kondisi` (`id`, `kondisi`, `ket`) VALUES
(1, 'Tidak', ''),
(2, 'Tidak Yakin', ''),
(3, 'Sedikit Yakin', ''),
(4, 'Cukup Yakin', ''),
(5, 'Yakin', ''),
(6, 'Sangat Yakin', '');

-- --------------------------------------------------------

--
-- Table structure for table `penyakit`
--

CREATE TABLE `penyakit` (
  `kode_penyakit` int(11) NOT NULL,
  `nama_penyakit` varchar(50) NOT NULL,
  `det_penyakit` varchar(500) NOT NULL,
  `srn_penyakit` varchar(500) NOT NULL,
  `gambar` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `penyakit`
--

INSERT INTO `penyakit` (`kode_penyakit`, `nama_penyakit`, `det_penyakit`, `srn_penyakit`, `gambar`) VALUES
(50, 'Bercak Hitam', '', '1. Pangkas dan buang daun yang terinfeksi.\r\n2. Gunakan fungisida berbahan aktif probineb mankozeb.\r\n3. melakukan sanitasi lahan.\r\n', '1. bercak hitam.png'),
(51, 'Embun Tepung', '', '1. Pangkas dan buang daun yang terinfeksi.\r\n2. melakukan sanitasi kebun\r\n3. Semprot dengan fungisida pirazofos.\r\n', '2. embun tepung.png'),
(52, 'Karat Daun', '', '1. Pangkas daun yang terinfeksi dan bersihkan area sekitar tanaman.\r\n2. Gunakan fungisida aktif seperti sulfur atau myclobutanil.\r\n', '3. karat daun.png');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `kode_post` int(11) NOT NULL,
  `nama_post` varchar(50) NOT NULL,
  `det_post` varchar(15000) NOT NULL,
  `srn_post` varchar(15000) NOT NULL,
  `gambar` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`kode_post`, `nama_post`, `det_post`, `srn_post`, `gambar`) VALUES
(27, 'Bercak hitam ', '<p><strong>Deskripsi</strong></p>\r\n\r\n<p>adalah salah satu penyakit paling umum dan merusak pada tanaman mawar, yang disebabkan oleh jamur Diplocarpon rosae. Penyakit ini ditandai dengan munculnya bercak-bercak berwarna hitam atau ungu gelap pada permukaan daun, terutama daun bagian bawah. Bercak ini berbentuk tidak beraturan dan biasanya dikelilingi oleh area kuning. Seiring perkembangan penyakit, daun yang terinfeksi akan menguning, rontok, dan mengakibatkan tanaman menjadi gundul serta melemahkan pertumbuhannya.<br />\r\nPenyakit ini menyebar melalui spora yang terbawa air, terutama cipratan air hujan atau penyiraman, dan lebih aktif pada kondisi lembap dengan suhu antara 21&deg;C hingga 26&deg;C. Daun yang basah selama lebih dari 6 jam sangat rentan terhadap infeksi.</p>\r\n\r\n<p><strong>Gejala</strong></p>\r\n\r\n<p>1. Muncul bercak hitam berbentuk bulat di daun<br />\r\n2. Bercak di jumpai pada daun yang tua<br />\r\n3. Jika bercak membesar daun akan rontok<br />\r\n4. Daun mengering<br />\r\n5. Daun jadi berlubang</p>\r\n', '<p><strong>Penanganan</strong></p>\r\n\r\n<p>1.&nbsp;&nbsp; &nbsp;Pangkas dan buang daun yang terinfeksi.<br />\r\n2.&nbsp;&nbsp; &nbsp;Gunakan fungisida berbahan aktif probineb mankozeb.<br />\r\n3.&nbsp;&nbsp; &nbsp;melakukan sanitasi lahan.<br />\r\n&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '1. bercak hitam.png'),
(28, 'Embun tepung', '<p><strong>Deskripsi</strong></p>\r\n\r\n<p>adalah penyakit jamur yang sering menyerang tanaman mawar, terutama pada kondisi lingkungan yang lembap namun tidak terlalu basah, serta suhu udara yang hangat. Penyebab utama penyakit ini pada mawar adalah jamur Podosphaera pannosa. Penyakit ini ditandai dengan munculnya lapisan putih seperti bedak atau tepung di permukaan daun, batang muda, dan kuncup bunga.<br />\r\nInfeksi embun tepung dapat menghambat fotosintesis, memperlambat pertumbuhan tanaman, serta mengganggu pembentukan dan pembukaan bunga. Jika tidak ditangani, penyakit ini dapat menyebar dengan cepat dan merusak estetika serta kesehatan tanaman secara keseluruhan.<br />\r\n&nbsp;</p>\r\n\r\n<p><strong>Gejala</strong></p>\r\n\r\n<p>1. Daun dan tunas tertutup lapisan putih<br />\r\n2. Daun pucat<br />\r\n3. Daun mengering<br />\r\n4. Daun rontok</p>\r\n', '<p><strong>penanganan</strong></p>\r\n\r\n<p>1.&nbsp;&nbsp; &nbsp;Pangkas dan buang daun yang terinfeksi.<br />\r\n2.&nbsp;&nbsp; &nbsp;melakukan sanitasi kebun<br />\r\n3.&nbsp;&nbsp; &nbsp;Semprot dengan fungisida pirazofos.<br />\r\n&nbsp;</p>\r\n', '2. embun tepung.png'),
(29, 'Karat daun', '<p><strong>Deskripsi</strong></p>\r\n\r\n<p>adalah penyakit jamur yang menyerang tanaman mawar dan disebabkan oleh jamur dari genus Phragmidium, seperti Phragmidium mucronatum. Penyakit ini dinamakan &quot;karat&quot; karena gejalanya berupa pustula (bintik kecil) berwarna oranye, kuning, atau cokelat yang muncul di bagian bawah daun, menyerupai karat besi. Karat daun sangat merugikan karena dapat mengurangi kemampuan fotosintesis tanaman dan menyebabkan kerontokan daun secara prematur.<br />\r\nKondisi lingkungan yang lembap dan suhu sedang (sekitar 16&ndash;22&deg;C) sangat mendukung perkembangan karat daun. Penyebaran jamur terjadi melalui spora yang terbawa angin atau percikan air, terutama saat musim hujan atau saat tanaman terlalu rapat dan lembap.</p>\r\n\r\n<p><strong>Gejala</strong></p>\r\n\r\n<p>1. Muncul bintik-bintik jingga pada daun<br />\r\n2. terdapat bercak bersudut warna kemerah<br />\r\n3. Daun rontok<br />\r\n&nbsp;</p>\r\n', '<p><strong>Penanganan</strong></p>\r\n\r\n<p>1.&nbsp;&nbsp; &nbsp;Pangkas daun yang terinfeksi dan bersihkan area sekitar tanaman.<br />\r\n2.&nbsp;&nbsp; &nbsp;Gunakan fungisida aktif seperti sulfur atau myclobutanil.<br />\r\n&nbsp;</p>\r\n', '3. karat daun.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `basis_pengetahuan`
--
ALTER TABLE `basis_pengetahuan`
  ADD PRIMARY KEY (`kode_pengetahuan`);

--
-- Indexes for table `gejala`
--
ALTER TABLE `gejala`
  ADD PRIMARY KEY (`kode_gejala`);

--
-- Indexes for table `hasil`
--
ALTER TABLE `hasil`
  ADD PRIMARY KEY (`id_hasil`);

--
-- Indexes for table `kondisi`
--
ALTER TABLE `kondisi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`kode_penyakit`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`kode_post`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `basis_pengetahuan`
--
ALTER TABLE `basis_pengetahuan`
  MODIFY `kode_pengetahuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `gejala`
--
ALTER TABLE `gejala`
  MODIFY `kode_gejala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `hasil`
--
ALTER TABLE `hasil`
  MODIFY `id_hasil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=395;

--
-- AUTO_INCREMENT for table `kondisi`
--
ALTER TABLE `kondisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `penyakit`
--
ALTER TABLE `penyakit`
  MODIFY `kode_penyakit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `kode_post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
