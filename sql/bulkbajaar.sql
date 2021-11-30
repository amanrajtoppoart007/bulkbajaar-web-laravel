-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2021 at 05:47 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bulkbajaar`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `approved` tinyint(1) DEFAULT 0,
  `verified` tinyint(1) DEFAULT 0,
  `verified_at` datetime DEFAULT NULL,
  `verification_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `mobile`, `password`, `email_verified_at`, `approved`, `verified`, `verified_at`, `verification_token`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'admin@bulkbajaar.com', '0123456789', '$2y$10$Nzm/fNn8d.H5vKd4D3VeCOvoDsZFNx6jTtGJT68twtuIoYxKooHFa', NULL, 1, 1, '2021-11-27 09:07:41', '', NULL, NULL, NULL, NULL),
(2, 'Demo', 'demo@bulkbajaar.com', '0123456788', '$2y$10$U9EmQVwhOuvdeQMX5kFWTOYFwm8yXzbd3IHDimczP7zvQ5/Z9.Yqe', NULL, 1, 1, '2021-11-27 09:07:41', '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_admin_alert`
--

CREATE TABLE `admin_admin_alert` (
  `admin_alert_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_alerts`
--

CREATE TABLE `admin_alerts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `alert_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alert_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `area` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `article_article_tag`
--

CREATE TABLE `article_article_tag` (
  `article_id` bigint(20) UNSIGNED NOT NULL,
  `article_tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `article_comments`
--

CREATE TABLE `article_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `article_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `article_likes`
--

CREATE TABLE `article_likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `article_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `article_tags`
--

CREATE TABLE `article_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `host` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `description`, `subject_id`, `subject_type`, `admin_id`, `properties`, `host`, `created_at`, `updated_at`) VALUES
(1, 'created', 1, 'App\\Models\\State', NULL, '{\"name\":\"Andaman and Nicobar Island (UT)\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":1}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(2, 'created', 1, 'App\\Models\\District', NULL, '{\"name\":\"Nicobar\",\"status\":1,\"state_id\":1,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":1}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(3, 'created', 2, 'App\\Models\\District', NULL, '{\"name\":\"North and Middle Andaman\",\"status\":1,\"state_id\":1,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":2}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(4, 'created', 3, 'App\\Models\\District', NULL, '{\"name\":\"South Andaman\",\"status\":1,\"state_id\":1,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":3}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(5, 'created', 2, 'App\\Models\\State', NULL, '{\"name\":\"Andhra Pradesh\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":2}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(6, 'created', 4, 'App\\Models\\District', NULL, '{\"name\":\"Anantapur\",\"status\":1,\"state_id\":2,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":4}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(7, 'created', 5, 'App\\Models\\District', NULL, '{\"name\":\"Chittoor\",\"status\":1,\"state_id\":2,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":5}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(8, 'created', 6, 'App\\Models\\District', NULL, '{\"name\":\"East Godavari\",\"status\":1,\"state_id\":2,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":6}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(9, 'created', 7, 'App\\Models\\District', NULL, '{\"name\":\"Guntur\",\"status\":1,\"state_id\":2,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":7}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(10, 'created', 8, 'App\\Models\\District', NULL, '{\"name\":\"Krishna\",\"status\":1,\"state_id\":2,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":8}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(11, 'created', 9, 'App\\Models\\District', NULL, '{\"name\":\"Kurnool\",\"status\":1,\"state_id\":2,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":9}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(12, 'created', 10, 'App\\Models\\District', NULL, '{\"name\":\"Prakasam\",\"status\":1,\"state_id\":2,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":10}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(13, 'created', 11, 'App\\Models\\District', NULL, '{\"name\":\"Srikakulam\",\"status\":1,\"state_id\":2,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":11}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(14, 'created', 12, 'App\\Models\\District', NULL, '{\"name\":\"Sri Potti Sriramulu Nellore\",\"status\":1,\"state_id\":2,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":12}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(15, 'created', 13, 'App\\Models\\District', NULL, '{\"name\":\"Visakhapatnam\",\"status\":1,\"state_id\":2,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":13}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(16, 'created', 14, 'App\\Models\\District', NULL, '{\"name\":\"Vizianagaram\",\"status\":1,\"state_id\":2,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":14}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(17, 'created', 15, 'App\\Models\\District', NULL, '{\"name\":\"West Godavari\",\"status\":1,\"state_id\":2,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":15}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(18, 'created', 16, 'App\\Models\\District', NULL, '{\"name\":\"YSR District, Kadapa (Cuddapah)\",\"status\":1,\"state_id\":2,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":16}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(19, 'created', 3, 'App\\Models\\State', NULL, '{\"name\":\"Arunachal Pradesh\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":3}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(20, 'created', 17, 'App\\Models\\District', NULL, '{\"name\":\"Anjaw\",\"status\":1,\"state_id\":3,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":17}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(21, 'created', 18, 'App\\Models\\District', NULL, '{\"name\":\"Changlang\",\"status\":1,\"state_id\":3,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":18}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(22, 'created', 19, 'App\\Models\\District', NULL, '{\"name\":\"Dibang Valley\",\"status\":1,\"state_id\":3,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":19}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(23, 'created', 20, 'App\\Models\\District', NULL, '{\"name\":\"East Kameng\",\"status\":1,\"state_id\":3,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":20}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(24, 'created', 21, 'App\\Models\\District', NULL, '{\"name\":\"East Siang\",\"status\":1,\"state_id\":3,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":21}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(25, 'created', 22, 'App\\Models\\District', NULL, '{\"name\":\"Kra Daadi\",\"status\":1,\"state_id\":3,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":22}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(26, 'created', 23, 'App\\Models\\District', NULL, '{\"name\":\"Kurung Kumey\",\"status\":1,\"state_id\":3,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":23}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(27, 'created', 24, 'App\\Models\\District', NULL, '{\"name\":\"Lohit\",\"status\":1,\"state_id\":3,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":24}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(28, 'created', 25, 'App\\Models\\District', NULL, '{\"name\":\"Longding\",\"status\":1,\"state_id\":3,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":25}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(29, 'created', 26, 'App\\Models\\District', NULL, '{\"name\":\"Lower Dibang Valley\",\"status\":1,\"state_id\":3,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":26}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(30, 'created', 27, 'App\\Models\\District', NULL, '{\"name\":\"Lower Siang\",\"status\":1,\"state_id\":3,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":27}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(31, 'created', 28, 'App\\Models\\District', NULL, '{\"name\":\"Lower Subansiri\",\"status\":1,\"state_id\":3,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":28}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(32, 'created', 29, 'App\\Models\\District', NULL, '{\"name\":\"Namsai\",\"status\":1,\"state_id\":3,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":29}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(33, 'created', 30, 'App\\Models\\District', NULL, '{\"name\":\"Papum Pare\",\"status\":1,\"state_id\":3,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":30}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(34, 'created', 31, 'App\\Models\\District', NULL, '{\"name\":\"Siang\",\"status\":1,\"state_id\":3,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":31}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(35, 'created', 32, 'App\\Models\\District', NULL, '{\"name\":\"Tawang\",\"status\":1,\"state_id\":3,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":32}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(36, 'created', 33, 'App\\Models\\District', NULL, '{\"name\":\"Tirap\",\"status\":1,\"state_id\":3,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":33}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(37, 'created', 34, 'App\\Models\\District', NULL, '{\"name\":\"Upper Siang\",\"status\":1,\"state_id\":3,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":34}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(38, 'created', 35, 'App\\Models\\District', NULL, '{\"name\":\"Upper Subansiri\",\"status\":1,\"state_id\":3,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":35}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(39, 'created', 36, 'App\\Models\\District', NULL, '{\"name\":\"West Kameng\",\"status\":1,\"state_id\":3,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":36}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(40, 'created', 37, 'App\\Models\\District', NULL, '{\"name\":\"West Siang\",\"status\":1,\"state_id\":3,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":37}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(41, 'created', 4, 'App\\Models\\State', NULL, '{\"name\":\"Assam\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":4}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(42, 'created', 38, 'App\\Models\\District', NULL, '{\"name\":\"Baksa\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":38}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(43, 'created', 39, 'App\\Models\\District', NULL, '{\"name\":\"Barpeta\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":39}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(44, 'created', 40, 'App\\Models\\District', NULL, '{\"name\":\"Biswanath\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":40}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(45, 'created', 41, 'App\\Models\\District', NULL, '{\"name\":\"Bongaigaon\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":41}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(46, 'created', 42, 'App\\Models\\District', NULL, '{\"name\":\"Cachar\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":42}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(47, 'created', 43, 'App\\Models\\District', NULL, '{\"name\":\"Charaideo\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":43}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(48, 'created', 44, 'App\\Models\\District', NULL, '{\"name\":\"Chirang\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":44}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(49, 'created', 45, 'App\\Models\\District', NULL, '{\"name\":\"Darrang\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":45}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(50, 'created', 46, 'App\\Models\\District', NULL, '{\"name\":\"Dhemaji\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":46}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(51, 'created', 47, 'App\\Models\\District', NULL, '{\"name\":\"Dhubri\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":47}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(52, 'created', 48, 'App\\Models\\District', NULL, '{\"name\":\"Dibrugarh\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":48}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(53, 'created', 49, 'App\\Models\\District', NULL, '{\"name\":\"Dima Hasao (North Cachar Hills)\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":49}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(54, 'created', 50, 'App\\Models\\District', NULL, '{\"name\":\"Goalpara\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":50}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(55, 'created', 51, 'App\\Models\\District', NULL, '{\"name\":\"Golaghat\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":51}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(56, 'created', 52, 'App\\Models\\District', NULL, '{\"name\":\"Hailakandi\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":52}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(57, 'created', 53, 'App\\Models\\District', NULL, '{\"name\":\"Hojai\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":53}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(58, 'created', 54, 'App\\Models\\District', NULL, '{\"name\":\"Jorhat\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":54}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(59, 'created', 55, 'App\\Models\\District', NULL, '{\"name\":\"Kamrup\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":55}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(60, 'created', 56, 'App\\Models\\District', NULL, '{\"name\":\"Kamrup Metropolitan\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":56}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(61, 'created', 57, 'App\\Models\\District', NULL, '{\"name\":\"Karbi Anglong\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":57}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(62, 'created', 58, 'App\\Models\\District', NULL, '{\"name\":\"Karimganj\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":58}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(63, 'created', 59, 'App\\Models\\District', NULL, '{\"name\":\"Kokrajhar\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":59}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(64, 'created', 60, 'App\\Models\\District', NULL, '{\"name\":\"Lakhimpur\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":60}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(65, 'created', 61, 'App\\Models\\District', NULL, '{\"name\":\"Majuli\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":61}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(66, 'created', 62, 'App\\Models\\District', NULL, '{\"name\":\"Morigaon\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":62}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(67, 'created', 63, 'App\\Models\\District', NULL, '{\"name\":\"Nagaon\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":63}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(68, 'created', 64, 'App\\Models\\District', NULL, '{\"name\":\"Nalbari\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":64}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(69, 'created', 65, 'App\\Models\\District', NULL, '{\"name\":\"Sivasagar\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":65}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(70, 'created', 66, 'App\\Models\\District', NULL, '{\"name\":\"Sonitpur\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":66}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(71, 'created', 67, 'App\\Models\\District', NULL, '{\"name\":\"South Salamara-Mankachar\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":67}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(72, 'created', 68, 'App\\Models\\District', NULL, '{\"name\":\"Tinsukia\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":68}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(73, 'created', 69, 'App\\Models\\District', NULL, '{\"name\":\"Udalguri\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":69}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(74, 'created', 70, 'App\\Models\\District', NULL, '{\"name\":\"West Karbi Anglong\",\"status\":1,\"state_id\":4,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":70}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(75, 'created', 5, 'App\\Models\\State', NULL, '{\"name\":\"Bihar\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":5}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(76, 'created', 71, 'App\\Models\\District', NULL, '{\"name\":\"Araria\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":71}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(77, 'created', 72, 'App\\Models\\District', NULL, '{\"name\":\"Arwal\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":72}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(78, 'created', 73, 'App\\Models\\District', NULL, '{\"name\":\"Aurangabad\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":73}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(79, 'created', 74, 'App\\Models\\District', NULL, '{\"name\":\"Banka\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":74}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(80, 'created', 75, 'App\\Models\\District', NULL, '{\"name\":\"Begusarai\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":75}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(81, 'created', 76, 'App\\Models\\District', NULL, '{\"name\":\"Bhagalpur\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":76}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(82, 'created', 77, 'App\\Models\\District', NULL, '{\"name\":\"Bhojpur\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":77}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(83, 'created', 78, 'App\\Models\\District', NULL, '{\"name\":\"Buxar\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":78}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(84, 'created', 79, 'App\\Models\\District', NULL, '{\"name\":\"Darbhanga\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":79}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(85, 'created', 80, 'App\\Models\\District', NULL, '{\"name\":\"East Champaran (Motihari)\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":80}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(86, 'created', 81, 'App\\Models\\District', NULL, '{\"name\":\"Gaya\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":81}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(87, 'created', 82, 'App\\Models\\District', NULL, '{\"name\":\"Gopalganj\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":82}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(88, 'created', 83, 'App\\Models\\District', NULL, '{\"name\":\"Jamui\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":83}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(89, 'created', 84, 'App\\Models\\District', NULL, '{\"name\":\"Jehanabad\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":84}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(90, 'created', 85, 'App\\Models\\District', NULL, '{\"name\":\"Kaimur (Bhabua)\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":85}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(91, 'created', 86, 'App\\Models\\District', NULL, '{\"name\":\"Katihar\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":86}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(92, 'created', 87, 'App\\Models\\District', NULL, '{\"name\":\"Khagaria\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":87}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(93, 'created', 88, 'App\\Models\\District', NULL, '{\"name\":\"Kishanganj\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":88}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(94, 'created', 89, 'App\\Models\\District', NULL, '{\"name\":\"Lakhisarai\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":89}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(95, 'created', 90, 'App\\Models\\District', NULL, '{\"name\":\"Madhepura\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":90}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(96, 'created', 91, 'App\\Models\\District', NULL, '{\"name\":\"Madhubani\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":91}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(97, 'created', 92, 'App\\Models\\District', NULL, '{\"name\":\"Munger (Monghyr)\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":92}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(98, 'created', 93, 'App\\Models\\District', NULL, '{\"name\":\"Muzaffarpur\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:53\",\"created_at\":\"2021-11-27 09:07:53\",\"id\":93}', '127.0.0.1', '2021-11-27 03:37:53', '2021-11-27 03:37:53'),
(99, 'created', 94, 'App\\Models\\District', NULL, '{\"name\":\"Nalanda\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":94}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(100, 'created', 95, 'App\\Models\\District', NULL, '{\"name\":\"Nawada\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":95}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(101, 'created', 96, 'App\\Models\\District', NULL, '{\"name\":\"Patna\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":96}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(102, 'created', 97, 'App\\Models\\District', NULL, '{\"name\":\"Purnia (Purnea)\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":97}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(103, 'created', 98, 'App\\Models\\District', NULL, '{\"name\":\"Rohtas\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":98}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(104, 'created', 99, 'App\\Models\\District', NULL, '{\"name\":\"Saharsa\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":99}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(105, 'created', 100, 'App\\Models\\District', NULL, '{\"name\":\"Samastipur\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":100}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(106, 'created', 101, 'App\\Models\\District', NULL, '{\"name\":\"Saran\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":101}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(107, 'created', 102, 'App\\Models\\District', NULL, '{\"name\":\"Sheikhpura\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":102}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(108, 'created', 103, 'App\\Models\\District', NULL, '{\"name\":\"Sheohar\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":103}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(109, 'created', 104, 'App\\Models\\District', NULL, '{\"name\":\"Sitamarhi\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":104}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(110, 'created', 105, 'App\\Models\\District', NULL, '{\"name\":\"Siwan\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":105}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(111, 'created', 106, 'App\\Models\\District', NULL, '{\"name\":\"Supaul\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":106}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(112, 'created', 107, 'App\\Models\\District', NULL, '{\"name\":\"Vaishali\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":107}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(113, 'created', 108, 'App\\Models\\District', NULL, '{\"name\":\"West Champaran\",\"status\":1,\"state_id\":5,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":108}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(114, 'created', 6, 'App\\Models\\State', NULL, '{\"name\":\"Chandigarh (UT)\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":6}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(115, 'created', 109, 'App\\Models\\District', NULL, '{\"name\":\"Chandigarh\",\"status\":1,\"state_id\":6,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":109}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(116, 'created', 7, 'App\\Models\\State', NULL, '{\"name\":\"Chhattisgarh\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":7}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(117, 'created', 110, 'App\\Models\\District', NULL, '{\"name\":\"Balod\",\"status\":1,\"state_id\":7,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":110}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(118, 'created', 111, 'App\\Models\\District', NULL, '{\"name\":\"Baloda Bazar\",\"status\":1,\"state_id\":7,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":111}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(119, 'created', 112, 'App\\Models\\District', NULL, '{\"name\":\"Balrampur\",\"status\":1,\"state_id\":7,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":112}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(120, 'created', 113, 'App\\Models\\District', NULL, '{\"name\":\"Bastar\",\"status\":1,\"state_id\":7,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":113}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(121, 'created', 114, 'App\\Models\\District', NULL, '{\"name\":\"Bemetara\",\"status\":1,\"state_id\":7,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":114}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(122, 'created', 115, 'App\\Models\\District', NULL, '{\"name\":\"Bijapur\",\"status\":1,\"state_id\":7,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":115}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(123, 'created', 116, 'App\\Models\\District', NULL, '{\"name\":\"Bilaspur\",\"status\":1,\"state_id\":7,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":116}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(124, 'created', 117, 'App\\Models\\District', NULL, '{\"name\":\"Dantewada (South Bastar)\",\"status\":1,\"state_id\":7,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":117}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(125, 'created', 118, 'App\\Models\\District', NULL, '{\"name\":\"Dhamtari\",\"status\":1,\"state_id\":7,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":118}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(126, 'created', 119, 'App\\Models\\District', NULL, '{\"name\":\"Durg\",\"status\":1,\"state_id\":7,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":119}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(127, 'created', 120, 'App\\Models\\District', NULL, '{\"name\":\"Gariyaband\",\"status\":1,\"state_id\":7,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":120}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(128, 'created', 121, 'App\\Models\\District', NULL, '{\"name\":\"Janjgir-Champa\",\"status\":1,\"state_id\":7,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":121}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(129, 'created', 122, 'App\\Models\\District', NULL, '{\"name\":\"Jashpur\",\"status\":1,\"state_id\":7,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":122}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(130, 'created', 123, 'App\\Models\\District', NULL, '{\"name\":\"Kabirdham (Kawardha)\",\"status\":1,\"state_id\":7,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":123}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(131, 'created', 124, 'App\\Models\\District', NULL, '{\"name\":\"Kanker (North Bastar)\",\"status\":1,\"state_id\":7,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":124}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(132, 'created', 125, 'App\\Models\\District', NULL, '{\"name\":\"Kondagaon\",\"status\":1,\"state_id\":7,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":125}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(133, 'created', 126, 'App\\Models\\District', NULL, '{\"name\":\"Korba\",\"status\":1,\"state_id\":7,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":126}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(134, 'created', 127, 'App\\Models\\District', NULL, '{\"name\":\"Korea (Koriya)\",\"status\":1,\"state_id\":7,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":127}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(135, 'created', 128, 'App\\Models\\District', NULL, '{\"name\":\"Mahasamund\",\"status\":1,\"state_id\":7,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":128}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(136, 'created', 129, 'App\\Models\\District', NULL, '{\"name\":\"Mungeli\",\"status\":1,\"state_id\":7,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":129}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(137, 'created', 130, 'App\\Models\\District', NULL, '{\"name\":\"Narayanpur\",\"status\":1,\"state_id\":7,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":130}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(138, 'created', 131, 'App\\Models\\District', NULL, '{\"name\":\"Raigarh\",\"status\":1,\"state_id\":7,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":131}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(139, 'created', 132, 'App\\Models\\District', NULL, '{\"name\":\"Raipur\",\"status\":1,\"state_id\":7,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":132}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(140, 'created', 133, 'App\\Models\\District', NULL, '{\"name\":\"Rajnandgaon\",\"status\":1,\"state_id\":7,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":133}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(141, 'created', 134, 'App\\Models\\District', NULL, '{\"name\":\"Sukma\",\"status\":1,\"state_id\":7,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":134}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(142, 'created', 135, 'App\\Models\\District', NULL, '{\"name\":\"Surajpur  \",\"status\":1,\"state_id\":7,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":135}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(143, 'created', 136, 'App\\Models\\District', NULL, '{\"name\":\"Surguja\",\"status\":1,\"state_id\":7,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":136}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(144, 'created', 8, 'App\\Models\\State', NULL, '{\"name\":\"Dadra and Nagar Haveli (UT)\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":8}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(145, 'created', 137, 'App\\Models\\District', NULL, '{\"name\":\"Dadra & Nagar Haveli\",\"status\":1,\"state_id\":8,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":137}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(146, 'created', 9, 'App\\Models\\State', NULL, '{\"name\":\"Daman and Diu (UT)\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":9}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(147, 'created', 138, 'App\\Models\\District', NULL, '{\"name\":\"Daman\",\"status\":1,\"state_id\":9,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":138}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(148, 'created', 139, 'App\\Models\\District', NULL, '{\"name\":\"Diu\",\"status\":1,\"state_id\":9,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":139}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(149, 'created', 10, 'App\\Models\\State', NULL, '{\"name\":\"Delhi (NCT)\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":10}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(150, 'created', 140, 'App\\Models\\District', NULL, '{\"name\":\"Central Delhi\",\"status\":1,\"state_id\":10,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":140}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(151, 'created', 141, 'App\\Models\\District', NULL, '{\"name\":\"East Delhi\",\"status\":1,\"state_id\":10,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":141}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(152, 'created', 142, 'App\\Models\\District', NULL, '{\"name\":\"New Delhi\",\"status\":1,\"state_id\":10,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":142}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(153, 'created', 143, 'App\\Models\\District', NULL, '{\"name\":\"North Delhi\",\"status\":1,\"state_id\":10,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":143}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(154, 'created', 144, 'App\\Models\\District', NULL, '{\"name\":\"North East  Delhi\",\"status\":1,\"state_id\":10,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":144}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(155, 'created', 145, 'App\\Models\\District', NULL, '{\"name\":\"North West  Delhi\",\"status\":1,\"state_id\":10,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":145}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(156, 'created', 146, 'App\\Models\\District', NULL, '{\"name\":\"Shahdara\",\"status\":1,\"state_id\":10,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":146}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(157, 'created', 147, 'App\\Models\\District', NULL, '{\"name\":\"South Delhi\",\"status\":1,\"state_id\":10,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":147}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(158, 'created', 148, 'App\\Models\\District', NULL, '{\"name\":\"South East Delhi\",\"status\":1,\"state_id\":10,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":148}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(159, 'created', 149, 'App\\Models\\District', NULL, '{\"name\":\"South West  Delhi\",\"status\":1,\"state_id\":10,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":149}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(160, 'created', 150, 'App\\Models\\District', NULL, '{\"name\":\"West Delhi\",\"status\":1,\"state_id\":10,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":150}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(161, 'created', 11, 'App\\Models\\State', NULL, '{\"name\":\"Goa\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":11}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(162, 'created', 151, 'App\\Models\\District', NULL, '{\"name\":\"North Goa\",\"status\":1,\"state_id\":11,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":151}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(163, 'created', 152, 'App\\Models\\District', NULL, '{\"name\":\"South Goa\",\"status\":1,\"state_id\":11,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":152}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(164, 'created', 12, 'App\\Models\\State', NULL, '{\"name\":\"Gujarat\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":12}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(165, 'created', 153, 'App\\Models\\District', NULL, '{\"name\":\"Ahmedabad\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":153}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(166, 'created', 154, 'App\\Models\\District', NULL, '{\"name\":\"Amreli\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":154}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(167, 'created', 155, 'App\\Models\\District', NULL, '{\"name\":\"Anand\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":155}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(168, 'created', 156, 'App\\Models\\District', NULL, '{\"name\":\"Aravalli\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":156}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(169, 'created', 157, 'App\\Models\\District', NULL, '{\"name\":\"Banaskantha (Palanpur)\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":157}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(170, 'created', 158, 'App\\Models\\District', NULL, '{\"name\":\"Bharuch\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":158}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(171, 'created', 159, 'App\\Models\\District', NULL, '{\"name\":\"Bhavnagar\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":159}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(172, 'created', 160, 'App\\Models\\District', NULL, '{\"name\":\"Botad\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":160}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(173, 'created', 161, 'App\\Models\\District', NULL, '{\"name\":\"Chhota Udepur\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":161}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(174, 'created', 162, 'App\\Models\\District', NULL, '{\"name\":\"Dahod\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":162}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(175, 'created', 163, 'App\\Models\\District', NULL, '{\"name\":\"Dangs (Ahwa)\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":163}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(176, 'created', 164, 'App\\Models\\District', NULL, '{\"name\":\"Devbhoomi Dwarka\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":164}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(177, 'created', 165, 'App\\Models\\District', NULL, '{\"name\":\"Gandhinagar\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":165}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(178, 'created', 166, 'App\\Models\\District', NULL, '{\"name\":\"Gir Somnath\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":166}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(179, 'created', 167, 'App\\Models\\District', NULL, '{\"name\":\"Jamnagar\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":167}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(180, 'created', 168, 'App\\Models\\District', NULL, '{\"name\":\"Junagadh\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":168}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(181, 'created', 169, 'App\\Models\\District', NULL, '{\"name\":\"Kachchh\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":169}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(182, 'created', 170, 'App\\Models\\District', NULL, '{\"name\":\"Kheda (Nadiad)\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":170}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(183, 'created', 171, 'App\\Models\\District', NULL, '{\"name\":\"Mahisagar\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":171}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(184, 'created', 172, 'App\\Models\\District', NULL, '{\"name\":\"Mehsana\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":172}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(185, 'created', 173, 'App\\Models\\District', NULL, '{\"name\":\"Morbi\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":173}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(186, 'created', 174, 'App\\Models\\District', NULL, '{\"name\":\"Narmada (Rajpipla)\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":174}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(187, 'created', 175, 'App\\Models\\District', NULL, '{\"name\":\"Navsari\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":175}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(188, 'created', 176, 'App\\Models\\District', NULL, '{\"name\":\"Panchmahal (Godhra)\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":176}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(189, 'created', 177, 'App\\Models\\District', NULL, '{\"name\":\"Patan\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":177}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(190, 'created', 178, 'App\\Models\\District', NULL, '{\"name\":\"Porbandar\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":178}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(191, 'created', 179, 'App\\Models\\District', NULL, '{\"name\":\"Rajkot\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":179}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(192, 'created', 180, 'App\\Models\\District', NULL, '{\"name\":\"Sabarkantha (Himmatnagar)\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":180}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(193, 'created', 181, 'App\\Models\\District', NULL, '{\"name\":\"Surat\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":181}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(194, 'created', 182, 'App\\Models\\District', NULL, '{\"name\":\"Surendranagar\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":182}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(195, 'created', 183, 'App\\Models\\District', NULL, '{\"name\":\"Tapi (Vyara)\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":183}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54');
INSERT INTO `audit_logs` (`id`, `description`, `subject_id`, `subject_type`, `admin_id`, `properties`, `host`, `created_at`, `updated_at`) VALUES
(196, 'created', 184, 'App\\Models\\District', NULL, '{\"name\":\"Vadodara\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":184}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(197, 'created', 185, 'App\\Models\\District', NULL, '{\"name\":\"Valsad\",\"status\":1,\"state_id\":12,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":185}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(198, 'created', 13, 'App\\Models\\State', NULL, '{\"name\":\"Haryana\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":13}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(199, 'created', 186, 'App\\Models\\District', NULL, '{\"name\":\"Ambala\",\"status\":1,\"state_id\":13,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":186}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(200, 'created', 187, 'App\\Models\\District', NULL, '{\"name\":\"Bhiwani\",\"status\":1,\"state_id\":13,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":187}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(201, 'created', 188, 'App\\Models\\District', NULL, '{\"name\":\"Charkhi Dadri\",\"status\":1,\"state_id\":13,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":188}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(202, 'created', 189, 'App\\Models\\District', NULL, '{\"name\":\"Faridabad\",\"status\":1,\"state_id\":13,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":189}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(203, 'created', 190, 'App\\Models\\District', NULL, '{\"name\":\"Fatehabad\",\"status\":1,\"state_id\":13,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":190}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(204, 'created', 191, 'App\\Models\\District', NULL, '{\"name\":\"Gurgaon\",\"status\":1,\"state_id\":13,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":191}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(205, 'created', 192, 'App\\Models\\District', NULL, '{\"name\":\"Hisar\",\"status\":1,\"state_id\":13,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":192}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(206, 'created', 193, 'App\\Models\\District', NULL, '{\"name\":\"Jhajjar\",\"status\":1,\"state_id\":13,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":193}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(207, 'created', 194, 'App\\Models\\District', NULL, '{\"name\":\"Jind\",\"status\":1,\"state_id\":13,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":194}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(208, 'created', 195, 'App\\Models\\District', NULL, '{\"name\":\"Kaithal\",\"status\":1,\"state_id\":13,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":195}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(209, 'created', 196, 'App\\Models\\District', NULL, '{\"name\":\"Karnal\",\"status\":1,\"state_id\":13,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":196}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(210, 'created', 197, 'App\\Models\\District', NULL, '{\"name\":\"Kurukshetra\",\"status\":1,\"state_id\":13,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":197}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(211, 'created', 198, 'App\\Models\\District', NULL, '{\"name\":\"Mahendragarh\",\"status\":1,\"state_id\":13,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":198}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(212, 'created', 199, 'App\\Models\\District', NULL, '{\"name\":\"Mewat\",\"status\":1,\"state_id\":13,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":199}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(213, 'created', 200, 'App\\Models\\District', NULL, '{\"name\":\"Palwal\",\"status\":1,\"state_id\":13,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":200}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(214, 'created', 201, 'App\\Models\\District', NULL, '{\"name\":\"Panchkula\",\"status\":1,\"state_id\":13,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":201}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(215, 'created', 202, 'App\\Models\\District', NULL, '{\"name\":\"Panipat\",\"status\":1,\"state_id\":13,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":202}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(216, 'created', 203, 'App\\Models\\District', NULL, '{\"name\":\"Rewari\",\"status\":1,\"state_id\":13,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":203}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(217, 'created', 204, 'App\\Models\\District', NULL, '{\"name\":\"Rohtak\",\"status\":1,\"state_id\":13,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":204}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(218, 'created', 205, 'App\\Models\\District', NULL, '{\"name\":\"Sirsa\",\"status\":1,\"state_id\":13,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":205}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(219, 'created', 206, 'App\\Models\\District', NULL, '{\"name\":\"Sonipat\",\"status\":1,\"state_id\":13,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":206}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(220, 'created', 207, 'App\\Models\\District', NULL, '{\"name\":\"Yamunanagar\",\"status\":1,\"state_id\":13,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":207}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(221, 'created', 14, 'App\\Models\\State', NULL, '{\"name\":\"Himachal Pradesh\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":14}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(222, 'created', 208, 'App\\Models\\District', NULL, '{\"name\":\"Bilaspur\",\"status\":1,\"state_id\":14,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":208}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(223, 'created', 209, 'App\\Models\\District', NULL, '{\"name\":\"Chamba\",\"status\":1,\"state_id\":14,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":209}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(224, 'created', 210, 'App\\Models\\District', NULL, '{\"name\":\"Hamirpur\",\"status\":1,\"state_id\":14,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":210}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(225, 'created', 211, 'App\\Models\\District', NULL, '{\"name\":\"Kangra\",\"status\":1,\"state_id\":14,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":211}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(226, 'created', 212, 'App\\Models\\District', NULL, '{\"name\":\"Kinnaur\",\"status\":1,\"state_id\":14,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":212}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(227, 'created', 213, 'App\\Models\\District', NULL, '{\"name\":\"Kullu\",\"status\":1,\"state_id\":14,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":213}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(228, 'created', 214, 'App\\Models\\District', NULL, '{\"name\":\"Lahaul & Spiti\",\"status\":1,\"state_id\":14,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":214}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(229, 'created', 215, 'App\\Models\\District', NULL, '{\"name\":\"Mandi\",\"status\":1,\"state_id\":14,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":215}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(230, 'created', 216, 'App\\Models\\District', NULL, '{\"name\":\"Shimla\",\"status\":1,\"state_id\":14,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":216}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(231, 'created', 217, 'App\\Models\\District', NULL, '{\"name\":\"Sirmaur (Sirmour)\",\"status\":1,\"state_id\":14,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":217}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(232, 'created', 218, 'App\\Models\\District', NULL, '{\"name\":\"Solan\",\"status\":1,\"state_id\":14,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":218}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(233, 'created', 219, 'App\\Models\\District', NULL, '{\"name\":\"Una\",\"status\":1,\"state_id\":14,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":219}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(234, 'created', 15, 'App\\Models\\State', NULL, '{\"name\":\"Jammu and Kashmir\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":15}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(235, 'created', 220, 'App\\Models\\District', NULL, '{\"name\":\"Anantnag\",\"status\":1,\"state_id\":15,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":220}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(236, 'created', 221, 'App\\Models\\District', NULL, '{\"name\":\"Bandipore\",\"status\":1,\"state_id\":15,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":221}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(237, 'created', 222, 'App\\Models\\District', NULL, '{\"name\":\"Baramulla\",\"status\":1,\"state_id\":15,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":222}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(238, 'created', 223, 'App\\Models\\District', NULL, '{\"name\":\"Budgam\",\"status\":1,\"state_id\":15,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":223}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(239, 'created', 224, 'App\\Models\\District', NULL, '{\"name\":\"Doda\",\"status\":1,\"state_id\":15,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":224}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(240, 'created', 225, 'App\\Models\\District', NULL, '{\"name\":\"Ganderbal\",\"status\":1,\"state_id\":15,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":225}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(241, 'created', 226, 'App\\Models\\District', NULL, '{\"name\":\"Jammu\",\"status\":1,\"state_id\":15,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":226}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(242, 'created', 227, 'App\\Models\\District', NULL, '{\"name\":\"Kargil\",\"status\":1,\"state_id\":15,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":227}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(243, 'created', 228, 'App\\Models\\District', NULL, '{\"name\":\"Kathua\",\"status\":1,\"state_id\":15,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":228}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(244, 'created', 229, 'App\\Models\\District', NULL, '{\"name\":\"Kishtwar\",\"status\":1,\"state_id\":15,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":229}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(245, 'created', 230, 'App\\Models\\District', NULL, '{\"name\":\"Kulgam\",\"status\":1,\"state_id\":15,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":230}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(246, 'created', 231, 'App\\Models\\District', NULL, '{\"name\":\"Kupwara\",\"status\":1,\"state_id\":15,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":231}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(247, 'created', 232, 'App\\Models\\District', NULL, '{\"name\":\"Leh\",\"status\":1,\"state_id\":15,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":232}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(248, 'created', 233, 'App\\Models\\District', NULL, '{\"name\":\"Poonch\",\"status\":1,\"state_id\":15,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":233}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(249, 'created', 234, 'App\\Models\\District', NULL, '{\"name\":\"Pulwama\",\"status\":1,\"state_id\":15,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":234}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(250, 'created', 235, 'App\\Models\\District', NULL, '{\"name\":\"Rajouri\",\"status\":1,\"state_id\":15,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":235}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(251, 'created', 236, 'App\\Models\\District', NULL, '{\"name\":\"Ramban\",\"status\":1,\"state_id\":15,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":236}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(252, 'created', 237, 'App\\Models\\District', NULL, '{\"name\":\"Reasi\",\"status\":1,\"state_id\":15,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":237}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(253, 'created', 238, 'App\\Models\\District', NULL, '{\"name\":\"Samba\",\"status\":1,\"state_id\":15,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":238}', '127.0.0.1', '2021-11-27 03:37:54', '2021-11-27 03:37:54'),
(254, 'created', 239, 'App\\Models\\District', NULL, '{\"name\":\"Shopian\",\"status\":1,\"state_id\":15,\"updated_at\":\"2021-11-27 09:07:54\",\"created_at\":\"2021-11-27 09:07:54\",\"id\":239}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(255, 'created', 240, 'App\\Models\\District', NULL, '{\"name\":\"Srinagar\",\"status\":1,\"state_id\":15,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":240}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(256, 'created', 241, 'App\\Models\\District', NULL, '{\"name\":\"Udhampur\",\"status\":1,\"state_id\":15,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":241}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(257, 'created', 16, 'App\\Models\\State', NULL, '{\"name\":\"Jharkhand\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":16}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(258, 'created', 242, 'App\\Models\\District', NULL, '{\"name\":\"Bokaro\",\"status\":1,\"state_id\":16,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":242}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(259, 'created', 243, 'App\\Models\\District', NULL, '{\"name\":\"Chatra\",\"status\":1,\"state_id\":16,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":243}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(260, 'created', 244, 'App\\Models\\District', NULL, '{\"name\":\"Deoghar\",\"status\":1,\"state_id\":16,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":244}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(261, 'created', 245, 'App\\Models\\District', NULL, '{\"name\":\"Dhanbad\",\"status\":1,\"state_id\":16,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":245}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(262, 'created', 246, 'App\\Models\\District', NULL, '{\"name\":\"Dumka\",\"status\":1,\"state_id\":16,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":246}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(263, 'created', 247, 'App\\Models\\District', NULL, '{\"name\":\"East Singhbhum\",\"status\":1,\"state_id\":16,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":247}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(264, 'created', 248, 'App\\Models\\District', NULL, '{\"name\":\"Garhwa\",\"status\":1,\"state_id\":16,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":248}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(265, 'created', 249, 'App\\Models\\District', NULL, '{\"name\":\"Giridih\",\"status\":1,\"state_id\":16,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":249}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(266, 'created', 250, 'App\\Models\\District', NULL, '{\"name\":\"Godda\",\"status\":1,\"state_id\":16,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":250}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(267, 'created', 251, 'App\\Models\\District', NULL, '{\"name\":\"Gumla\",\"status\":1,\"state_id\":16,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":251}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(268, 'created', 252, 'App\\Models\\District', NULL, '{\"name\":\"Hazaribag\",\"status\":1,\"state_id\":16,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":252}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(269, 'created', 253, 'App\\Models\\District', NULL, '{\"name\":\"Jamtara\",\"status\":1,\"state_id\":16,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":253}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(270, 'created', 254, 'App\\Models\\District', NULL, '{\"name\":\"Khunti\",\"status\":1,\"state_id\":16,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":254}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(271, 'created', 255, 'App\\Models\\District', NULL, '{\"name\":\"Koderma\",\"status\":1,\"state_id\":16,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":255}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(272, 'created', 256, 'App\\Models\\District', NULL, '{\"name\":\"Latehar\",\"status\":1,\"state_id\":16,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":256}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(273, 'created', 257, 'App\\Models\\District', NULL, '{\"name\":\"Lohardaga\",\"status\":1,\"state_id\":16,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":257}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(274, 'created', 258, 'App\\Models\\District', NULL, '{\"name\":\"Pakur\",\"status\":1,\"state_id\":16,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":258}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(275, 'created', 259, 'App\\Models\\District', NULL, '{\"name\":\"Palamu\",\"status\":1,\"state_id\":16,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":259}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(276, 'created', 260, 'App\\Models\\District', NULL, '{\"name\":\"Ramgarh\",\"status\":1,\"state_id\":16,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":260}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(277, 'created', 261, 'App\\Models\\District', NULL, '{\"name\":\"Ranchi\",\"status\":1,\"state_id\":16,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":261}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(278, 'created', 262, 'App\\Models\\District', NULL, '{\"name\":\"Sahibganj\",\"status\":1,\"state_id\":16,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":262}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(279, 'created', 263, 'App\\Models\\District', NULL, '{\"name\":\"Seraikela-Kharsawan\",\"status\":1,\"state_id\":16,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":263}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(280, 'created', 264, 'App\\Models\\District', NULL, '{\"name\":\"Simdega\",\"status\":1,\"state_id\":16,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":264}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(281, 'created', 265, 'App\\Models\\District', NULL, '{\"name\":\"West Singhbhum\",\"status\":1,\"state_id\":16,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":265}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(282, 'created', 17, 'App\\Models\\State', NULL, '{\"name\":\"Karnataka\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":17}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(283, 'created', 266, 'App\\Models\\District', NULL, '{\"name\":\"Bagalkot\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":266}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(284, 'created', 267, 'App\\Models\\District', NULL, '{\"name\":\"Ballari (Bellary)\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":267}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(285, 'created', 268, 'App\\Models\\District', NULL, '{\"name\":\"Belagavi (Belgaum)\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":268}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(286, 'created', 269, 'App\\Models\\District', NULL, '{\"name\":\"Bengaluru (Bangalore) Rural\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":269}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(287, 'created', 270, 'App\\Models\\District', NULL, '{\"name\":\"Bengaluru (Bangalore) Urban\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":270}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(288, 'created', 271, 'App\\Models\\District', NULL, '{\"name\":\"Bidar\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":271}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(289, 'created', 272, 'App\\Models\\District', NULL, '{\"name\":\"Chamarajanagar\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":272}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(290, 'created', 273, 'App\\Models\\District', NULL, '{\"name\":\"Chikballapur\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":273}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(291, 'created', 274, 'App\\Models\\District', NULL, '{\"name\":\"Chikkamagaluru (Chikmagalur)\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":274}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(292, 'created', 275, 'App\\Models\\District', NULL, '{\"name\":\"Chitradurga\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":275}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(293, 'created', 276, 'App\\Models\\District', NULL, '{\"name\":\"Dakshina Kannada\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":276}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(294, 'created', 277, 'App\\Models\\District', NULL, '{\"name\":\"Davangere\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":277}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(295, 'created', 278, 'App\\Models\\District', NULL, '{\"name\":\"Dharwad\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":278}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(296, 'created', 279, 'App\\Models\\District', NULL, '{\"name\":\"Gadag\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":279}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(297, 'created', 280, 'App\\Models\\District', NULL, '{\"name\":\"Hassan\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":280}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(298, 'created', 281, 'App\\Models\\District', NULL, '{\"name\":\"Haveri\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":281}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(299, 'created', 282, 'App\\Models\\District', NULL, '{\"name\":\"Kalaburagi (Gulbarga)\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":282}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(300, 'created', 283, 'App\\Models\\District', NULL, '{\"name\":\"Kodagu\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":283}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(301, 'created', 284, 'App\\Models\\District', NULL, '{\"name\":\"Kolar\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":284}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(302, 'created', 285, 'App\\Models\\District', NULL, '{\"name\":\"Koppal\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":285}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(303, 'created', 286, 'App\\Models\\District', NULL, '{\"name\":\"Mandya\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":286}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(304, 'created', 287, 'App\\Models\\District', NULL, '{\"name\":\"Mysuru (Mysore)\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":287}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(305, 'created', 288, 'App\\Models\\District', NULL, '{\"name\":\"Raichur\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":288}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(306, 'created', 289, 'App\\Models\\District', NULL, '{\"name\":\"Ramanagara\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":289}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(307, 'created', 290, 'App\\Models\\District', NULL, '{\"name\":\"Shivamogga (Shimoga)\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":290}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(308, 'created', 291, 'App\\Models\\District', NULL, '{\"name\":\"Tumakuru (Tumkur)\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":291}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(309, 'created', 292, 'App\\Models\\District', NULL, '{\"name\":\"Udupi\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":292}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(310, 'created', 293, 'App\\Models\\District', NULL, '{\"name\":\"Uttara Kannada (Karwar)\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":293}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(311, 'created', 294, 'App\\Models\\District', NULL, '{\"name\":\"Vijayapura (Bijapur)\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":294}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(312, 'created', 295, 'App\\Models\\District', NULL, '{\"name\":\"Yadgir\",\"status\":1,\"state_id\":17,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":295}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(313, 'created', 18, 'App\\Models\\State', NULL, '{\"name\":\"Kerala\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":18}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(314, 'created', 296, 'App\\Models\\District', NULL, '{\"name\":\"Alappuzha\",\"status\":1,\"state_id\":18,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":296}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(315, 'created', 297, 'App\\Models\\District', NULL, '{\"name\":\"Ernakulam\",\"status\":1,\"state_id\":18,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":297}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(316, 'created', 298, 'App\\Models\\District', NULL, '{\"name\":\"Idukki\",\"status\":1,\"state_id\":18,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":298}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(317, 'created', 299, 'App\\Models\\District', NULL, '{\"name\":\"Kannur\",\"status\":1,\"state_id\":18,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":299}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(318, 'created', 300, 'App\\Models\\District', NULL, '{\"name\":\"Kasaragod\",\"status\":1,\"state_id\":18,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":300}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(319, 'created', 301, 'App\\Models\\District', NULL, '{\"name\":\"Kollam\",\"status\":1,\"state_id\":18,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":301}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(320, 'created', 302, 'App\\Models\\District', NULL, '{\"name\":\"Kottayam\",\"status\":1,\"state_id\":18,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":302}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(321, 'created', 303, 'App\\Models\\District', NULL, '{\"name\":\"Kozhikode\",\"status\":1,\"state_id\":18,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":303}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(322, 'created', 304, 'App\\Models\\District', NULL, '{\"name\":\"Malappuram\",\"status\":1,\"state_id\":18,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":304}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(323, 'created', 305, 'App\\Models\\District', NULL, '{\"name\":\"Palakkad\",\"status\":1,\"state_id\":18,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":305}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(324, 'created', 306, 'App\\Models\\District', NULL, '{\"name\":\"Pathanamthitta\",\"status\":1,\"state_id\":18,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":306}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(325, 'created', 307, 'App\\Models\\District', NULL, '{\"name\":\"Thiruvananthapuram\",\"status\":1,\"state_id\":18,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":307}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(326, 'created', 308, 'App\\Models\\District', NULL, '{\"name\":\"Thrissur\",\"status\":1,\"state_id\":18,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":308}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(327, 'created', 309, 'App\\Models\\District', NULL, '{\"name\":\"Wayanad\",\"status\":1,\"state_id\":18,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":309}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(328, 'created', 19, 'App\\Models\\State', NULL, '{\"name\":\"Lakshadweep (UT)\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":19}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(329, 'created', 310, 'App\\Models\\District', NULL, '{\"name\":\"Lakshadweep\",\"status\":1,\"state_id\":19,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":310}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(330, 'created', 20, 'App\\Models\\State', NULL, '{\"name\":\"Madhya Pradesh\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":20}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(331, 'created', 311, 'App\\Models\\District', NULL, '{\"name\":\"Agar Malwa\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":311}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(332, 'created', 312, 'App\\Models\\District', NULL, '{\"name\":\"Alirajpur\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":312}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(333, 'created', 313, 'App\\Models\\District', NULL, '{\"name\":\"Anuppur\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":313}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(334, 'created', 314, 'App\\Models\\District', NULL, '{\"name\":\"Ashoknagar\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":314}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(335, 'created', 315, 'App\\Models\\District', NULL, '{\"name\":\"Balaghat\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":315}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(336, 'created', 316, 'App\\Models\\District', NULL, '{\"name\":\"Barwani\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":316}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(337, 'created', 317, 'App\\Models\\District', NULL, '{\"name\":\"Betul\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":317}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(338, 'created', 318, 'App\\Models\\District', NULL, '{\"name\":\"Bhind\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":318}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(339, 'created', 319, 'App\\Models\\District', NULL, '{\"name\":\"Bhopal\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":319}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(340, 'created', 320, 'App\\Models\\District', NULL, '{\"name\":\"Burhanpur\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":320}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(341, 'created', 321, 'App\\Models\\District', NULL, '{\"name\":\"Chhatarpur\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":321}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(342, 'created', 322, 'App\\Models\\District', NULL, '{\"name\":\"Chhindwara\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":322}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(343, 'created', 323, 'App\\Models\\District', NULL, '{\"name\":\"Damoh\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":323}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(344, 'created', 324, 'App\\Models\\District', NULL, '{\"name\":\"Datia\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":324}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(345, 'created', 325, 'App\\Models\\District', NULL, '{\"name\":\"Dewas\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":325}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(346, 'created', 326, 'App\\Models\\District', NULL, '{\"name\":\"Dhar\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":326}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(347, 'created', 327, 'App\\Models\\District', NULL, '{\"name\":\"Dindori\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":327}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(348, 'created', 328, 'App\\Models\\District', NULL, '{\"name\":\"Guna\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":328}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(349, 'created', 329, 'App\\Models\\District', NULL, '{\"name\":\"Gwalior\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":329}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(350, 'created', 330, 'App\\Models\\District', NULL, '{\"name\":\"Harda\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":330}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(351, 'created', 331, 'App\\Models\\District', NULL, '{\"name\":\"Hoshangabad\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":331}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(352, 'created', 332, 'App\\Models\\District', NULL, '{\"name\":\"Indore\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":332}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(353, 'created', 333, 'App\\Models\\District', NULL, '{\"name\":\"Jabalpur\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":333}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(354, 'created', 334, 'App\\Models\\District', NULL, '{\"name\":\"Jhabua\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":334}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(355, 'created', 335, 'App\\Models\\District', NULL, '{\"name\":\"Katni\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":335}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(356, 'created', 336, 'App\\Models\\District', NULL, '{\"name\":\"Khandwa\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":336}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(357, 'created', 337, 'App\\Models\\District', NULL, '{\"name\":\"Khargone\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":337}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(358, 'created', 338, 'App\\Models\\District', NULL, '{\"name\":\"Mandla\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":338}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(359, 'created', 339, 'App\\Models\\District', NULL, '{\"name\":\"Mandsaur\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":339}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(360, 'created', 340, 'App\\Models\\District', NULL, '{\"name\":\"Morena\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":340}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(361, 'created', 341, 'App\\Models\\District', NULL, '{\"name\":\"Narsinghpur\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":341}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(362, 'created', 342, 'App\\Models\\District', NULL, '{\"name\":\"Neemuch\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":342}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(363, 'created', 343, 'App\\Models\\District', NULL, '{\"name\":\"Panna\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":343}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(364, 'created', 344, 'App\\Models\\District', NULL, '{\"name\":\"Raisen\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":344}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(365, 'created', 345, 'App\\Models\\District', NULL, '{\"name\":\"Rajgarh\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":345}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(366, 'created', 346, 'App\\Models\\District', NULL, '{\"name\":\"Ratlam\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":346}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(367, 'created', 347, 'App\\Models\\District', NULL, '{\"name\":\"Rewa\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":347}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(368, 'created', 348, 'App\\Models\\District', NULL, '{\"name\":\"Sagar\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":348}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(369, 'created', 349, 'App\\Models\\District', NULL, '{\"name\":\"Satna\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":349}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(370, 'created', 350, 'App\\Models\\District', NULL, '{\"name\":\"Sehore\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":350}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(371, 'created', 351, 'App\\Models\\District', NULL, '{\"name\":\"Seoni\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":351}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(372, 'created', 352, 'App\\Models\\District', NULL, '{\"name\":\"Shahdol\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":352}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(373, 'created', 353, 'App\\Models\\District', NULL, '{\"name\":\"Shajapur\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":353}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(374, 'created', 354, 'App\\Models\\District', NULL, '{\"name\":\"Sheopur\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":354}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(375, 'created', 355, 'App\\Models\\District', NULL, '{\"name\":\"Shivpuri\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":355}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(376, 'created', 356, 'App\\Models\\District', NULL, '{\"name\":\"Sidhi\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":356}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(377, 'created', 357, 'App\\Models\\District', NULL, '{\"name\":\"Singrauli\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":357}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(378, 'created', 358, 'App\\Models\\District', NULL, '{\"name\":\"Tikamgarh\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":358}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(379, 'created', 359, 'App\\Models\\District', NULL, '{\"name\":\"Ujjain\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":359}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(380, 'created', 360, 'App\\Models\\District', NULL, '{\"name\":\"Umaria\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":360}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(381, 'created', 361, 'App\\Models\\District', NULL, '{\"name\":\"Vidisha\",\"status\":1,\"state_id\":20,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":361}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(382, 'created', 21, 'App\\Models\\State', NULL, '{\"name\":\"Maharashtra\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":21}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(383, 'created', 362, 'App\\Models\\District', NULL, '{\"name\":\"Ahmednagar\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":362}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(384, 'created', 363, 'App\\Models\\District', NULL, '{\"name\":\"Akola\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":363}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(385, 'created', 364, 'App\\Models\\District', NULL, '{\"name\":\"Amravati\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":364}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(386, 'created', 365, 'App\\Models\\District', NULL, '{\"name\":\"Aurangabad\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":365}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(387, 'created', 366, 'App\\Models\\District', NULL, '{\"name\":\"Beed\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":366}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(388, 'created', 367, 'App\\Models\\District', NULL, '{\"name\":\"Bhandara\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":367}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(389, 'created', 368, 'App\\Models\\District', NULL, '{\"name\":\"Buldhana\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":368}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(390, 'created', 369, 'App\\Models\\District', NULL, '{\"name\":\"Chandrapur\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":369}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55');
INSERT INTO `audit_logs` (`id`, `description`, `subject_id`, `subject_type`, `admin_id`, `properties`, `host`, `created_at`, `updated_at`) VALUES
(391, 'created', 370, 'App\\Models\\District', NULL, '{\"name\":\"Dhule\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":370}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(392, 'created', 371, 'App\\Models\\District', NULL, '{\"name\":\"Gadchiroli\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":371}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(393, 'created', 372, 'App\\Models\\District', NULL, '{\"name\":\"Gondia\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":372}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(394, 'created', 373, 'App\\Models\\District', NULL, '{\"name\":\"Hingoli\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":373}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(395, 'created', 374, 'App\\Models\\District', NULL, '{\"name\":\"Jalgaon\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":374}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(396, 'created', 375, 'App\\Models\\District', NULL, '{\"name\":\"Jalna\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":375}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(397, 'created', 376, 'App\\Models\\District', NULL, '{\"name\":\"Kolhapur\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":376}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(398, 'created', 377, 'App\\Models\\District', NULL, '{\"name\":\"Latur\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":377}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(399, 'created', 378, 'App\\Models\\District', NULL, '{\"name\":\"Mumbai City\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":378}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(400, 'created', 379, 'App\\Models\\District', NULL, '{\"name\":\"Mumbai Suburban\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":379}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(401, 'created', 380, 'App\\Models\\District', NULL, '{\"name\":\"Nagpur\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":380}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(402, 'created', 381, 'App\\Models\\District', NULL, '{\"name\":\"Nanded\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":381}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(403, 'created', 382, 'App\\Models\\District', NULL, '{\"name\":\"Nandurbar\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":382}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(404, 'created', 383, 'App\\Models\\District', NULL, '{\"name\":\"Nashik\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":383}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(405, 'created', 384, 'App\\Models\\District', NULL, '{\"name\":\"Osmanabad\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":384}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(406, 'created', 385, 'App\\Models\\District', NULL, '{\"name\":\"Palghar\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":385}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(407, 'created', 386, 'App\\Models\\District', NULL, '{\"name\":\"Parbhani\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":386}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(408, 'created', 387, 'App\\Models\\District', NULL, '{\"name\":\"Pune\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":387}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(409, 'created', 388, 'App\\Models\\District', NULL, '{\"name\":\"Raigad\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":388}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(410, 'created', 389, 'App\\Models\\District', NULL, '{\"name\":\"Ratnagiri\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":389}', '127.0.0.1', '2021-11-27 03:37:55', '2021-11-27 03:37:55'),
(411, 'created', 390, 'App\\Models\\District', NULL, '{\"name\":\"Sangli\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:55\",\"created_at\":\"2021-11-27 09:07:55\",\"id\":390}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(412, 'created', 391, 'App\\Models\\District', NULL, '{\"name\":\"Satara\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":391}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(413, 'created', 392, 'App\\Models\\District', NULL, '{\"name\":\"Sindhudurg\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":392}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(414, 'created', 393, 'App\\Models\\District', NULL, '{\"name\":\"Solapur\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":393}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(415, 'created', 394, 'App\\Models\\District', NULL, '{\"name\":\"Thane\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":394}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(416, 'created', 395, 'App\\Models\\District', NULL, '{\"name\":\"Wardha\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":395}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(417, 'created', 396, 'App\\Models\\District', NULL, '{\"name\":\"Washim\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":396}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(418, 'created', 397, 'App\\Models\\District', NULL, '{\"name\":\"Yavatmal\",\"status\":1,\"state_id\":21,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":397}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(419, 'created', 22, 'App\\Models\\State', NULL, '{\"name\":\"Manipur\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":22}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(420, 'created', 398, 'App\\Models\\District', NULL, '{\"name\":\"Bishnupur\",\"status\":1,\"state_id\":22,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":398}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(421, 'created', 399, 'App\\Models\\District', NULL, '{\"name\":\"Chandel\",\"status\":1,\"state_id\":22,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":399}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(422, 'created', 400, 'App\\Models\\District', NULL, '{\"name\":\"Churachandpur\",\"status\":1,\"state_id\":22,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":400}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(423, 'created', 401, 'App\\Models\\District', NULL, '{\"name\":\"Imphal East\",\"status\":1,\"state_id\":22,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":401}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(424, 'created', 402, 'App\\Models\\District', NULL, '{\"name\":\"Imphal West\",\"status\":1,\"state_id\":22,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":402}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(425, 'created', 403, 'App\\Models\\District', NULL, '{\"name\":\"Jiribam\",\"status\":1,\"state_id\":22,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":403}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(426, 'created', 404, 'App\\Models\\District', NULL, '{\"name\":\"Kakching\",\"status\":1,\"state_id\":22,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":404}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(427, 'created', 405, 'App\\Models\\District', NULL, '{\"name\":\"Kamjong\",\"status\":1,\"state_id\":22,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":405}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(428, 'created', 406, 'App\\Models\\District', NULL, '{\"name\":\"Kangpokpi\",\"status\":1,\"state_id\":22,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":406}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(429, 'created', 407, 'App\\Models\\District', NULL, '{\"name\":\"Noney\",\"status\":1,\"state_id\":22,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":407}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(430, 'created', 408, 'App\\Models\\District', NULL, '{\"name\":\"Pherzawl\",\"status\":1,\"state_id\":22,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":408}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(431, 'created', 409, 'App\\Models\\District', NULL, '{\"name\":\"Senapati\",\"status\":1,\"state_id\":22,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":409}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(432, 'created', 410, 'App\\Models\\District', NULL, '{\"name\":\"Tamenglong\",\"status\":1,\"state_id\":22,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":410}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(433, 'created', 411, 'App\\Models\\District', NULL, '{\"name\":\"Tengnoupal\",\"status\":1,\"state_id\":22,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":411}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(434, 'created', 412, 'App\\Models\\District', NULL, '{\"name\":\"Thoubal\",\"status\":1,\"state_id\":22,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":412}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(435, 'created', 413, 'App\\Models\\District', NULL, '{\"name\":\"Ukhrul\",\"status\":1,\"state_id\":22,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":413}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(436, 'created', 23, 'App\\Models\\State', NULL, '{\"name\":\"Meghalaya\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":23}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(437, 'created', 414, 'App\\Models\\District', NULL, '{\"name\":\"East Garo Hills\",\"status\":1,\"state_id\":23,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":414}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(438, 'created', 415, 'App\\Models\\District', NULL, '{\"name\":\"East Jaintia Hills\",\"status\":1,\"state_id\":23,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":415}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(439, 'created', 416, 'App\\Models\\District', NULL, '{\"name\":\"East Khasi Hills\",\"status\":1,\"state_id\":23,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":416}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(440, 'created', 417, 'App\\Models\\District', NULL, '{\"name\":\"North Garo Hills\",\"status\":1,\"state_id\":23,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":417}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(441, 'created', 418, 'App\\Models\\District', NULL, '{\"name\":\"Ri Bhoi\",\"status\":1,\"state_id\":23,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":418}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(442, 'created', 419, 'App\\Models\\District', NULL, '{\"name\":\"South Garo Hills\",\"status\":1,\"state_id\":23,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":419}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(443, 'created', 420, 'App\\Models\\District', NULL, '{\"name\":\"South West Garo Hills \",\"status\":1,\"state_id\":23,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":420}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(444, 'created', 421, 'App\\Models\\District', NULL, '{\"name\":\"South West Khasi Hills\",\"status\":1,\"state_id\":23,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":421}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(445, 'created', 422, 'App\\Models\\District', NULL, '{\"name\":\"West Garo Hills\",\"status\":1,\"state_id\":23,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":422}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(446, 'created', 423, 'App\\Models\\District', NULL, '{\"name\":\"West Jaintia Hills\",\"status\":1,\"state_id\":23,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":423}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(447, 'created', 424, 'App\\Models\\District', NULL, '{\"name\":\"West Khasi Hills\",\"status\":1,\"state_id\":23,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":424}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(448, 'created', 24, 'App\\Models\\State', NULL, '{\"name\":\"Mizoram\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":24}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(449, 'created', 425, 'App\\Models\\District', NULL, '{\"name\":\"Aizawl\",\"status\":1,\"state_id\":24,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":425}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(450, 'created', 426, 'App\\Models\\District', NULL, '{\"name\":\"Champhai\",\"status\":1,\"state_id\":24,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":426}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(451, 'created', 427, 'App\\Models\\District', NULL, '{\"name\":\"Kolasib\",\"status\":1,\"state_id\":24,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":427}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(452, 'created', 428, 'App\\Models\\District', NULL, '{\"name\":\"Lawngtlai\",\"status\":1,\"state_id\":24,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":428}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(453, 'created', 429, 'App\\Models\\District', NULL, '{\"name\":\"Lunglei\",\"status\":1,\"state_id\":24,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":429}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(454, 'created', 430, 'App\\Models\\District', NULL, '{\"name\":\"Mamit\",\"status\":1,\"state_id\":24,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":430}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(455, 'created', 431, 'App\\Models\\District', NULL, '{\"name\":\"Saiha\",\"status\":1,\"state_id\":24,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":431}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(456, 'created', 432, 'App\\Models\\District', NULL, '{\"name\":\"Serchhip\",\"status\":1,\"state_id\":24,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":432}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(457, 'created', 25, 'App\\Models\\State', NULL, '{\"name\":\"Nagaland\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":25}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(458, 'created', 433, 'App\\Models\\District', NULL, '{\"name\":\"Dimapur\",\"status\":1,\"state_id\":25,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":433}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(459, 'created', 434, 'App\\Models\\District', NULL, '{\"name\":\"Kiphire\",\"status\":1,\"state_id\":25,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":434}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(460, 'created', 435, 'App\\Models\\District', NULL, '{\"name\":\"Kohima\",\"status\":1,\"state_id\":25,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":435}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(461, 'created', 436, 'App\\Models\\District', NULL, '{\"name\":\"Longleng\",\"status\":1,\"state_id\":25,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":436}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(462, 'created', 437, 'App\\Models\\District', NULL, '{\"name\":\"Mokokchung\",\"status\":1,\"state_id\":25,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":437}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(463, 'created', 438, 'App\\Models\\District', NULL, '{\"name\":\"Mon\",\"status\":1,\"state_id\":25,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":438}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(464, 'created', 439, 'App\\Models\\District', NULL, '{\"name\":\"Peren\",\"status\":1,\"state_id\":25,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":439}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(465, 'created', 440, 'App\\Models\\District', NULL, '{\"name\":\"Phek\",\"status\":1,\"state_id\":25,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":440}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(466, 'created', 441, 'App\\Models\\District', NULL, '{\"name\":\"Tuensang\",\"status\":1,\"state_id\":25,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":441}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(467, 'created', 442, 'App\\Models\\District', NULL, '{\"name\":\"Wokha\",\"status\":1,\"state_id\":25,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":442}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(468, 'created', 443, 'App\\Models\\District', NULL, '{\"name\":\"Zunheboto\",\"status\":1,\"state_id\":25,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":443}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(469, 'created', 26, 'App\\Models\\State', NULL, '{\"name\":\"Odisha\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":26}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(470, 'created', 444, 'App\\Models\\District', NULL, '{\"name\":\"Angul\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":444}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(471, 'created', 445, 'App\\Models\\District', NULL, '{\"name\":\"Balangir\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":445}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(472, 'created', 446, 'App\\Models\\District', NULL, '{\"name\":\"Balasore\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":446}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(473, 'created', 447, 'App\\Models\\District', NULL, '{\"name\":\"Bargarh\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":447}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(474, 'created', 448, 'App\\Models\\District', NULL, '{\"name\":\"Bhadrak\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":448}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(475, 'created', 449, 'App\\Models\\District', NULL, '{\"name\":\"Boudh\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":449}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(476, 'created', 450, 'App\\Models\\District', NULL, '{\"name\":\"Cuttack\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":450}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(477, 'created', 451, 'App\\Models\\District', NULL, '{\"name\":\"Deogarh\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":451}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(478, 'created', 452, 'App\\Models\\District', NULL, '{\"name\":\"Dhenkanal\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":452}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(479, 'created', 453, 'App\\Models\\District', NULL, '{\"name\":\"Gajapati\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":453}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(480, 'created', 454, 'App\\Models\\District', NULL, '{\"name\":\"Ganjam\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":454}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(481, 'created', 455, 'App\\Models\\District', NULL, '{\"name\":\"Jagatsinghapur\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":455}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(482, 'created', 456, 'App\\Models\\District', NULL, '{\"name\":\"Jajpur\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":456}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(483, 'created', 457, 'App\\Models\\District', NULL, '{\"name\":\"Jharsuguda\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":457}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(484, 'created', 458, 'App\\Models\\District', NULL, '{\"name\":\"Kalahandi\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":458}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(485, 'created', 459, 'App\\Models\\District', NULL, '{\"name\":\"Kandhamal\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":459}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(486, 'created', 460, 'App\\Models\\District', NULL, '{\"name\":\"Kendrapara\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":460}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(487, 'created', 461, 'App\\Models\\District', NULL, '{\"name\":\"Kendujhar (Keonjhar)\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":461}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(488, 'created', 462, 'App\\Models\\District', NULL, '{\"name\":\"Khordha\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":462}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(489, 'created', 463, 'App\\Models\\District', NULL, '{\"name\":\"Koraput\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":463}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(490, 'created', 464, 'App\\Models\\District', NULL, '{\"name\":\"Malkangiri\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":464}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(491, 'created', 465, 'App\\Models\\District', NULL, '{\"name\":\"Mayurbhanj\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":465}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(492, 'created', 466, 'App\\Models\\District', NULL, '{\"name\":\"Nabarangpur\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":466}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(493, 'created', 467, 'App\\Models\\District', NULL, '{\"name\":\"Nayagarh\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":467}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(494, 'created', 468, 'App\\Models\\District', NULL, '{\"name\":\"Nuapada\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":468}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(495, 'created', 469, 'App\\Models\\District', NULL, '{\"name\":\"Puri\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":469}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(496, 'created', 470, 'App\\Models\\District', NULL, '{\"name\":\"Rayagada\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":470}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(497, 'created', 471, 'App\\Models\\District', NULL, '{\"name\":\"Sambalpur\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":471}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(498, 'created', 472, 'App\\Models\\District', NULL, '{\"name\":\"Sonepur\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":472}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(499, 'created', 473, 'App\\Models\\District', NULL, '{\"name\":\"Sundargarh\",\"status\":1,\"state_id\":26,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":473}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(500, 'created', 27, 'App\\Models\\State', NULL, '{\"name\":\"Puducherry (UT)\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":27}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(501, 'created', 474, 'App\\Models\\District', NULL, '{\"name\":\"Karaikal\",\"status\":1,\"state_id\":27,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":474}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(502, 'created', 475, 'App\\Models\\District', NULL, '{\"name\":\"Mahe\",\"status\":1,\"state_id\":27,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":475}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(503, 'created', 476, 'App\\Models\\District', NULL, '{\"name\":\"Pondicherry\",\"status\":1,\"state_id\":27,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":476}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(504, 'created', 477, 'App\\Models\\District', NULL, '{\"name\":\"Yanam\",\"status\":1,\"state_id\":27,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":477}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(505, 'created', 28, 'App\\Models\\State', NULL, '{\"name\":\"Punjab\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":28}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(506, 'created', 478, 'App\\Models\\District', NULL, '{\"name\":\"Amritsar\",\"status\":1,\"state_id\":28,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":478}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(507, 'created', 479, 'App\\Models\\District', NULL, '{\"name\":\"Barnala\",\"status\":1,\"state_id\":28,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":479}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(508, 'created', 480, 'App\\Models\\District', NULL, '{\"name\":\"Bathinda\",\"status\":1,\"state_id\":28,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":480}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(509, 'created', 481, 'App\\Models\\District', NULL, '{\"name\":\"Faridkot\",\"status\":1,\"state_id\":28,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":481}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(510, 'created', 482, 'App\\Models\\District', NULL, '{\"name\":\"Fatehgarh Sahib\",\"status\":1,\"state_id\":28,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":482}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(511, 'created', 483, 'App\\Models\\District', NULL, '{\"name\":\"Fazilka\",\"status\":1,\"state_id\":28,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":483}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(512, 'created', 484, 'App\\Models\\District', NULL, '{\"name\":\"Ferozepur\",\"status\":1,\"state_id\":28,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":484}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(513, 'created', 485, 'App\\Models\\District', NULL, '{\"name\":\"Gurdaspur\",\"status\":1,\"state_id\":28,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":485}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(514, 'created', 486, 'App\\Models\\District', NULL, '{\"name\":\"Hoshiarpur\",\"status\":1,\"state_id\":28,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":486}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(515, 'created', 487, 'App\\Models\\District', NULL, '{\"name\":\"Jalandhar\",\"status\":1,\"state_id\":28,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":487}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(516, 'created', 488, 'App\\Models\\District', NULL, '{\"name\":\"Kapurthala\",\"status\":1,\"state_id\":28,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":488}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(517, 'created', 489, 'App\\Models\\District', NULL, '{\"name\":\"Ludhiana\",\"status\":1,\"state_id\":28,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":489}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(518, 'created', 490, 'App\\Models\\District', NULL, '{\"name\":\"Mansa\",\"status\":1,\"state_id\":28,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":490}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(519, 'created', 491, 'App\\Models\\District', NULL, '{\"name\":\"Moga\",\"status\":1,\"state_id\":28,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":491}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(520, 'created', 492, 'App\\Models\\District', NULL, '{\"name\":\"Muktsar\",\"status\":1,\"state_id\":28,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":492}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(521, 'created', 493, 'App\\Models\\District', NULL, '{\"name\":\"Nawanshahr (Shahid Bhagat Singh Nagar)\",\"status\":1,\"state_id\":28,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":493}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(522, 'created', 494, 'App\\Models\\District', NULL, '{\"name\":\"Pathankot\",\"status\":1,\"state_id\":28,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":494}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(523, 'created', 495, 'App\\Models\\District', NULL, '{\"name\":\"Patiala\",\"status\":1,\"state_id\":28,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":495}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(524, 'created', 496, 'App\\Models\\District', NULL, '{\"name\":\"Rupnagar\",\"status\":1,\"state_id\":28,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":496}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(525, 'created', 497, 'App\\Models\\District', NULL, '{\"name\":\"Sahibzada Ajit Singh Nagar (Mohali)\",\"status\":1,\"state_id\":28,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":497}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(526, 'created', 498, 'App\\Models\\District', NULL, '{\"name\":\"Sangrur\",\"status\":1,\"state_id\":28,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":498}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(527, 'created', 499, 'App\\Models\\District', NULL, '{\"name\":\"Tarn Taran\",\"status\":1,\"state_id\":28,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":499}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(528, 'created', 29, 'App\\Models\\State', NULL, '{\"name\":\"Rajasthan\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":29}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(529, 'created', 500, 'App\\Models\\District', NULL, '{\"name\":\"Ajmer\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":500}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(530, 'created', 501, 'App\\Models\\District', NULL, '{\"name\":\"Alwar\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":501}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(531, 'created', 502, 'App\\Models\\District', NULL, '{\"name\":\"Banswara\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":502}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(532, 'created', 503, 'App\\Models\\District', NULL, '{\"name\":\"Baran\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":503}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(533, 'created', 504, 'App\\Models\\District', NULL, '{\"name\":\"Barmer\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":504}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(534, 'created', 505, 'App\\Models\\District', NULL, '{\"name\":\"Bharatpur\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":505}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(535, 'created', 506, 'App\\Models\\District', NULL, '{\"name\":\"Bhilwara\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":506}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(536, 'created', 507, 'App\\Models\\District', NULL, '{\"name\":\"Bikaner\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":507}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(537, 'created', 508, 'App\\Models\\District', NULL, '{\"name\":\"Bundi\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":508}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(538, 'created', 509, 'App\\Models\\District', NULL, '{\"name\":\"Chittorgarh\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":509}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(539, 'created', 510, 'App\\Models\\District', NULL, '{\"name\":\"Churu\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":510}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(540, 'created', 511, 'App\\Models\\District', NULL, '{\"name\":\"Dausa\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":511}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(541, 'created', 512, 'App\\Models\\District', NULL, '{\"name\":\"Dholpur\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":512}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(542, 'created', 513, 'App\\Models\\District', NULL, '{\"name\":\"Dungarpur\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":513}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(543, 'created', 514, 'App\\Models\\District', NULL, '{\"name\":\"Hanumangarh\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":514}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(544, 'created', 515, 'App\\Models\\District', NULL, '{\"name\":\"Jaipur\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":515}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(545, 'created', 516, 'App\\Models\\District', NULL, '{\"name\":\"Jaisalmer\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":516}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(546, 'created', 517, 'App\\Models\\District', NULL, '{\"name\":\"Jalore\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":517}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(547, 'created', 518, 'App\\Models\\District', NULL, '{\"name\":\"Jhalawar\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":518}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(548, 'created', 519, 'App\\Models\\District', NULL, '{\"name\":\"Jhunjhunu\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":519}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(549, 'created', 520, 'App\\Models\\District', NULL, '{\"name\":\"Jodhpur\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":520}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(550, 'created', 521, 'App\\Models\\District', NULL, '{\"name\":\"Karauli\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":521}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(551, 'created', 522, 'App\\Models\\District', NULL, '{\"name\":\"Kota\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":522}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(552, 'created', 523, 'App\\Models\\District', NULL, '{\"name\":\"Nagaur\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":523}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(553, 'created', 524, 'App\\Models\\District', NULL, '{\"name\":\"Pali\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":524}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(554, 'created', 525, 'App\\Models\\District', NULL, '{\"name\":\"Pratapgarh\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":525}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(555, 'created', 526, 'App\\Models\\District', NULL, '{\"name\":\"Rajsamand\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":526}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(556, 'created', 527, 'App\\Models\\District', NULL, '{\"name\":\"Sawai Madhopur\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":527}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(557, 'created', 528, 'App\\Models\\District', NULL, '{\"name\":\"Sikar\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":528}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(558, 'created', 529, 'App\\Models\\District', NULL, '{\"name\":\"Sirohi\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":529}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(559, 'created', 530, 'App\\Models\\District', NULL, '{\"name\":\"Sri Ganganagar\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":530}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(560, 'created', 531, 'App\\Models\\District', NULL, '{\"name\":\"Tonk\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":531}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(561, 'created', 532, 'App\\Models\\District', NULL, '{\"name\":\"Udaipur\",\"status\":1,\"state_id\":29,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":532}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(562, 'created', 30, 'App\\Models\\State', NULL, '{\"name\":\"Sikkim\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":30}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(563, 'created', 533, 'App\\Models\\District', NULL, '{\"name\":\"East Sikkim\",\"status\":1,\"state_id\":30,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":533}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(564, 'created', 534, 'App\\Models\\District', NULL, '{\"name\":\"North Sikkim\",\"status\":1,\"state_id\":30,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":534}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(565, 'created', 535, 'App\\Models\\District', NULL, '{\"name\":\"South Sikkim\",\"status\":1,\"state_id\":30,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":535}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(566, 'created', 536, 'App\\Models\\District', NULL, '{\"name\":\"West Sikkim\",\"status\":1,\"state_id\":30,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":536}', '127.0.0.1', '2021-11-27 03:37:56', '2021-11-27 03:37:56'),
(567, 'created', 31, 'App\\Models\\State', NULL, '{\"name\":\"Tamil Nadu\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:56\",\"created_at\":\"2021-11-27 09:07:56\",\"id\":31}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(568, 'created', 537, 'App\\Models\\District', NULL, '{\"name\":\"Ariyalur\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":537}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(569, 'created', 538, 'App\\Models\\District', NULL, '{\"name\":\"Chennai\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":538}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(570, 'created', 539, 'App\\Models\\District', NULL, '{\"name\":\"Coimbatore\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":539}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(571, 'created', 540, 'App\\Models\\District', NULL, '{\"name\":\"Cuddalore\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":540}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(572, 'created', 541, 'App\\Models\\District', NULL, '{\"name\":\"Dharmapuri\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":541}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(573, 'created', 542, 'App\\Models\\District', NULL, '{\"name\":\"Dindigul\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":542}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(574, 'created', 543, 'App\\Models\\District', NULL, '{\"name\":\"Erode\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":543}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(575, 'created', 544, 'App\\Models\\District', NULL, '{\"name\":\"Kanchipuram\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":544}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(576, 'created', 545, 'App\\Models\\District', NULL, '{\"name\":\"Kanyakumari\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":545}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(577, 'created', 546, 'App\\Models\\District', NULL, '{\"name\":\"Karur\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":546}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(578, 'created', 547, 'App\\Models\\District', NULL, '{\"name\":\"Krishnagiri\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":547}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(579, 'created', 548, 'App\\Models\\District', NULL, '{\"name\":\"Madurai\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":548}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(580, 'created', 549, 'App\\Models\\District', NULL, '{\"name\":\"Nagapattinam\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":549}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(581, 'created', 550, 'App\\Models\\District', NULL, '{\"name\":\"Namakkal\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":550}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(582, 'created', 551, 'App\\Models\\District', NULL, '{\"name\":\"Nilgiris\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":551}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(583, 'created', 552, 'App\\Models\\District', NULL, '{\"name\":\"Perambalur\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":552}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(584, 'created', 553, 'App\\Models\\District', NULL, '{\"name\":\"Pudukkottai\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":553}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(585, 'created', 554, 'App\\Models\\District', NULL, '{\"name\":\"Ramanathapuram\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":554}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57');
INSERT INTO `audit_logs` (`id`, `description`, `subject_id`, `subject_type`, `admin_id`, `properties`, `host`, `created_at`, `updated_at`) VALUES
(586, 'created', 555, 'App\\Models\\District', NULL, '{\"name\":\"Salem\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":555}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(587, 'created', 556, 'App\\Models\\District', NULL, '{\"name\":\"Sivaganga\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":556}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(588, 'created', 557, 'App\\Models\\District', NULL, '{\"name\":\"Thanjavur\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":557}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(589, 'created', 558, 'App\\Models\\District', NULL, '{\"name\":\"Theni\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":558}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(590, 'created', 559, 'App\\Models\\District', NULL, '{\"name\":\"Thoothukudi (Tuticorin)\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":559}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(591, 'created', 560, 'App\\Models\\District', NULL, '{\"name\":\"Tiruchirappalli\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":560}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(592, 'created', 561, 'App\\Models\\District', NULL, '{\"name\":\"Tirunelveli\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":561}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(593, 'created', 562, 'App\\Models\\District', NULL, '{\"name\":\"Tiruppur\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":562}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(594, 'created', 563, 'App\\Models\\District', NULL, '{\"name\":\"Tiruvallur\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":563}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(595, 'created', 564, 'App\\Models\\District', NULL, '{\"name\":\"Tiruvannamalai\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":564}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(596, 'created', 565, 'App\\Models\\District', NULL, '{\"name\":\"Tiruvarur\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":565}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(597, 'created', 566, 'App\\Models\\District', NULL, '{\"name\":\"Vellore\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":566}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(598, 'created', 567, 'App\\Models\\District', NULL, '{\"name\":\"Viluppuram\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":567}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(599, 'created', 568, 'App\\Models\\District', NULL, '{\"name\":\"Virudhunagar\",\"status\":1,\"state_id\":31,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":568}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(600, 'created', 32, 'App\\Models\\State', NULL, '{\"name\":\"Telangana\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":32}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(601, 'created', 569, 'App\\Models\\District', NULL, '{\"name\":\"Adilabad\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":569}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(602, 'created', 570, 'App\\Models\\District', NULL, '{\"name\":\"Bhadradri Kothagudem\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":570}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(603, 'created', 571, 'App\\Models\\District', NULL, '{\"name\":\"Hyderabad\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":571}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(604, 'created', 572, 'App\\Models\\District', NULL, '{\"name\":\"Jagtial\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":572}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(605, 'created', 573, 'App\\Models\\District', NULL, '{\"name\":\"Jangaon\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":573}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(606, 'created', 574, 'App\\Models\\District', NULL, '{\"name\":\"Jayashankar Bhoopalpally\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":574}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(607, 'created', 575, 'App\\Models\\District', NULL, '{\"name\":\"Jogulamba Gadwal\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":575}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(608, 'created', 576, 'App\\Models\\District', NULL, '{\"name\":\"Kamareddy\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":576}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(609, 'created', 577, 'App\\Models\\District', NULL, '{\"name\":\"Karimnagar\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":577}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(610, 'created', 578, 'App\\Models\\District', NULL, '{\"name\":\"Khammam\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":578}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(611, 'created', 579, 'App\\Models\\District', NULL, '{\"name\":\"Komaram Bheem Asifabad\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":579}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(612, 'created', 580, 'App\\Models\\District', NULL, '{\"name\":\"Mahabubabad\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":580}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(613, 'created', 581, 'App\\Models\\District', NULL, '{\"name\":\"Mahabubnagar\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":581}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(614, 'created', 582, 'App\\Models\\District', NULL, '{\"name\":\"Mancherial\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":582}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(615, 'created', 583, 'App\\Models\\District', NULL, '{\"name\":\"Medak\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":583}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(616, 'created', 584, 'App\\Models\\District', NULL, '{\"name\":\"Medchal\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":584}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(617, 'created', 585, 'App\\Models\\District', NULL, '{\"name\":\"Nagarkurnool\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":585}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(618, 'created', 586, 'App\\Models\\District', NULL, '{\"name\":\"Nalgonda\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":586}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(619, 'created', 587, 'App\\Models\\District', NULL, '{\"name\":\"Nirmal\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":587}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(620, 'created', 588, 'App\\Models\\District', NULL, '{\"name\":\"Nizamabad\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":588}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(621, 'created', 589, 'App\\Models\\District', NULL, '{\"name\":\"Peddapalli\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":589}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(622, 'created', 590, 'App\\Models\\District', NULL, '{\"name\":\"Rajanna Sircilla\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":590}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(623, 'created', 591, 'App\\Models\\District', NULL, '{\"name\":\"Rangareddy\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":591}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(624, 'created', 592, 'App\\Models\\District', NULL, '{\"name\":\"Sangareddy\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":592}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(625, 'created', 593, 'App\\Models\\District', NULL, '{\"name\":\"Siddipet\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":593}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(626, 'created', 594, 'App\\Models\\District', NULL, '{\"name\":\"Suryapet\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":594}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(627, 'created', 595, 'App\\Models\\District', NULL, '{\"name\":\"Vikarabad\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":595}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(628, 'created', 596, 'App\\Models\\District', NULL, '{\"name\":\"Wanaparthy\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":596}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(629, 'created', 597, 'App\\Models\\District', NULL, '{\"name\":\"Warangal (Rural)\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":597}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(630, 'created', 598, 'App\\Models\\District', NULL, '{\"name\":\"Warangal (Urban)\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":598}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(631, 'created', 599, 'App\\Models\\District', NULL, '{\"name\":\"Yadadri Bhuvanagiri\",\"status\":1,\"state_id\":32,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":599}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(632, 'created', 33, 'App\\Models\\State', NULL, '{\"name\":\"Tripura\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":33}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(633, 'created', 600, 'App\\Models\\District', NULL, '{\"name\":\"Dhalai\",\"status\":1,\"state_id\":33,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":600}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(634, 'created', 601, 'App\\Models\\District', NULL, '{\"name\":\"Gomati\",\"status\":1,\"state_id\":33,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":601}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(635, 'created', 602, 'App\\Models\\District', NULL, '{\"name\":\"Khowai\",\"status\":1,\"state_id\":33,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":602}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(636, 'created', 603, 'App\\Models\\District', NULL, '{\"name\":\"North Tripura\",\"status\":1,\"state_id\":33,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":603}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(637, 'created', 604, 'App\\Models\\District', NULL, '{\"name\":\"Sepahijala\",\"status\":1,\"state_id\":33,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":604}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(638, 'created', 605, 'App\\Models\\District', NULL, '{\"name\":\"South Tripura\",\"status\":1,\"state_id\":33,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":605}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(639, 'created', 606, 'App\\Models\\District', NULL, '{\"name\":\"Unakoti\",\"status\":1,\"state_id\":33,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":606}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(640, 'created', 607, 'App\\Models\\District', NULL, '{\"name\":\"West Tripura\",\"status\":1,\"state_id\":33,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":607}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(641, 'created', 34, 'App\\Models\\State', NULL, '{\"name\":\"Uttarakhand\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":34}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(642, 'created', 608, 'App\\Models\\District', NULL, '{\"name\":\"Almora\",\"status\":1,\"state_id\":34,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":608}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(643, 'created', 609, 'App\\Models\\District', NULL, '{\"name\":\"Bageshwar\",\"status\":1,\"state_id\":34,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":609}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(644, 'created', 610, 'App\\Models\\District', NULL, '{\"name\":\"Chamoli\",\"status\":1,\"state_id\":34,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":610}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(645, 'created', 611, 'App\\Models\\District', NULL, '{\"name\":\"Champawat\",\"status\":1,\"state_id\":34,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":611}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(646, 'created', 612, 'App\\Models\\District', NULL, '{\"name\":\"Dehradun\",\"status\":1,\"state_id\":34,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":612}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(647, 'created', 613, 'App\\Models\\District', NULL, '{\"name\":\"Haridwar\",\"status\":1,\"state_id\":34,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":613}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(648, 'created', 614, 'App\\Models\\District', NULL, '{\"name\":\"Nainital\",\"status\":1,\"state_id\":34,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":614}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(649, 'created', 615, 'App\\Models\\District', NULL, '{\"name\":\"Pauri Garhwal\",\"status\":1,\"state_id\":34,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":615}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(650, 'created', 616, 'App\\Models\\District', NULL, '{\"name\":\"Pithoragarh\",\"status\":1,\"state_id\":34,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":616}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(651, 'created', 617, 'App\\Models\\District', NULL, '{\"name\":\"Rudraprayag\",\"status\":1,\"state_id\":34,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":617}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(652, 'created', 618, 'App\\Models\\District', NULL, '{\"name\":\"Tehri Garhwal\",\"status\":1,\"state_id\":34,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":618}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(653, 'created', 619, 'App\\Models\\District', NULL, '{\"name\":\"Udham Singh Nagar\",\"status\":1,\"state_id\":34,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":619}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(654, 'created', 620, 'App\\Models\\District', NULL, '{\"name\":\"Uttarkashi\",\"status\":1,\"state_id\":34,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":620}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(655, 'created', 35, 'App\\Models\\State', NULL, '{\"name\":\"Uttar Pradesh\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":35}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(656, 'created', 621, 'App\\Models\\District', NULL, '{\"name\":\"Agra\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":621}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(657, 'created', 622, 'App\\Models\\District', NULL, '{\"name\":\"Aligarh\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":622}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(658, 'created', 623, 'App\\Models\\District', NULL, '{\"name\":\"Allahabad\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":623}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(659, 'created', 624, 'App\\Models\\District', NULL, '{\"name\":\"Ambedkar Nagar\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":624}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(660, 'created', 625, 'App\\Models\\District', NULL, '{\"name\":\"Amethi (Chatrapati Sahuji Mahraj Nagar)\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":625}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(661, 'created', 626, 'App\\Models\\District', NULL, '{\"name\":\"Amroha (J.P. Nagar)\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":626}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(662, 'created', 627, 'App\\Models\\District', NULL, '{\"name\":\"Auraiya\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":627}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(663, 'created', 628, 'App\\Models\\District', NULL, '{\"name\":\"Azamgarh\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":628}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(664, 'created', 629, 'App\\Models\\District', NULL, '{\"name\":\"Baghpat\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":629}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(665, 'created', 630, 'App\\Models\\District', NULL, '{\"name\":\"Bahraich\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":630}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(666, 'created', 631, 'App\\Models\\District', NULL, '{\"name\":\"Ballia\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":631}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(667, 'created', 632, 'App\\Models\\District', NULL, '{\"name\":\"Balrampur\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":632}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(668, 'created', 633, 'App\\Models\\District', NULL, '{\"name\":\"Banda\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":633}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(669, 'created', 634, 'App\\Models\\District', NULL, '{\"name\":\"Barabanki\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":634}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(670, 'created', 635, 'App\\Models\\District', NULL, '{\"name\":\"Bareilly\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":635}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(671, 'created', 636, 'App\\Models\\District', NULL, '{\"name\":\"Basti\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":636}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(672, 'created', 637, 'App\\Models\\District', NULL, '{\"name\":\"Bhadohi\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":637}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(673, 'created', 638, 'App\\Models\\District', NULL, '{\"name\":\"Bijnor\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":638}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(674, 'created', 639, 'App\\Models\\District', NULL, '{\"name\":\"Budaun\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":639}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(675, 'created', 640, 'App\\Models\\District', NULL, '{\"name\":\"Bulandshahr\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":640}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(676, 'created', 641, 'App\\Models\\District', NULL, '{\"name\":\"Chandauli\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":641}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(677, 'created', 642, 'App\\Models\\District', NULL, '{\"name\":\"Chitrakoot\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":642}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(678, 'created', 643, 'App\\Models\\District', NULL, '{\"name\":\"Deoria\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":643}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(679, 'created', 644, 'App\\Models\\District', NULL, '{\"name\":\"Etah\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":644}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(680, 'created', 645, 'App\\Models\\District', NULL, '{\"name\":\"Etawah\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":645}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(681, 'created', 646, 'App\\Models\\District', NULL, '{\"name\":\"Faizabad\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":646}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(682, 'created', 647, 'App\\Models\\District', NULL, '{\"name\":\"Farrukhabad\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":647}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(683, 'created', 648, 'App\\Models\\District', NULL, '{\"name\":\"Fatehpur\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":648}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(684, 'created', 649, 'App\\Models\\District', NULL, '{\"name\":\"Firozabad\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":649}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(685, 'created', 650, 'App\\Models\\District', NULL, '{\"name\":\"Gautam Buddha Nagar\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":650}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(686, 'created', 651, 'App\\Models\\District', NULL, '{\"name\":\"Ghaziabad\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":651}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(687, 'created', 652, 'App\\Models\\District', NULL, '{\"name\":\"Ghazipur\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":652}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(688, 'created', 653, 'App\\Models\\District', NULL, '{\"name\":\"Gonda\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":653}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(689, 'created', 654, 'App\\Models\\District', NULL, '{\"name\":\"Gorakhpur\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":654}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(690, 'created', 655, 'App\\Models\\District', NULL, '{\"name\":\"Hamirpur\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":655}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(691, 'created', 656, 'App\\Models\\District', NULL, '{\"name\":\"Hapur (Panchsheel Nagar)\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":656}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(692, 'created', 657, 'App\\Models\\District', NULL, '{\"name\":\"Hardoi\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":657}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(693, 'created', 658, 'App\\Models\\District', NULL, '{\"name\":\"Hathras\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":658}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(694, 'created', 659, 'App\\Models\\District', NULL, '{\"name\":\"Jalaun\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":659}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(695, 'created', 660, 'App\\Models\\District', NULL, '{\"name\":\"Jaunpur\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":660}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(696, 'created', 661, 'App\\Models\\District', NULL, '{\"name\":\"Jhansi\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":661}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(697, 'created', 662, 'App\\Models\\District', NULL, '{\"name\":\"Kannauj\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":662}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(698, 'created', 663, 'App\\Models\\District', NULL, '{\"name\":\"Kanpur Dehat\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":663}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(699, 'created', 664, 'App\\Models\\District', NULL, '{\"name\":\"Kanpur Nagar\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":664}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(700, 'created', 665, 'App\\Models\\District', NULL, '{\"name\":\"Kanshiram Nagar (Kasganj)\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":665}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(701, 'created', 666, 'App\\Models\\District', NULL, '{\"name\":\"Kaushambi\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":666}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(702, 'created', 667, 'App\\Models\\District', NULL, '{\"name\":\"Kushinagar (Padrauna)\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":667}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(703, 'created', 668, 'App\\Models\\District', NULL, '{\"name\":\"Lakhimpur - Kheri\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":668}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(704, 'created', 669, 'App\\Models\\District', NULL, '{\"name\":\"Lalitpur\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":669}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(705, 'created', 670, 'App\\Models\\District', NULL, '{\"name\":\"Lucknow\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":670}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(706, 'created', 671, 'App\\Models\\District', NULL, '{\"name\":\"Maharajganj\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":671}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(707, 'created', 672, 'App\\Models\\District', NULL, '{\"name\":\"Mahoba\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":672}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(708, 'created', 673, 'App\\Models\\District', NULL, '{\"name\":\"Mainpuri\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":673}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(709, 'created', 674, 'App\\Models\\District', NULL, '{\"name\":\"Mathura\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":674}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(710, 'created', 675, 'App\\Models\\District', NULL, '{\"name\":\"Mau\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":675}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(711, 'created', 676, 'App\\Models\\District', NULL, '{\"name\":\"Meerut\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":676}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(712, 'created', 677, 'App\\Models\\District', NULL, '{\"name\":\"Mirzapur\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":677}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(713, 'created', 678, 'App\\Models\\District', NULL, '{\"name\":\"Moradabad\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":678}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(714, 'created', 679, 'App\\Models\\District', NULL, '{\"name\":\"Muzaffarnagar\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":679}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(715, 'created', 680, 'App\\Models\\District', NULL, '{\"name\":\"Pilibhit\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":680}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(716, 'created', 681, 'App\\Models\\District', NULL, '{\"name\":\"Pratapgarh\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":681}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(717, 'created', 682, 'App\\Models\\District', NULL, '{\"name\":\"RaeBareli\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":682}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(718, 'created', 683, 'App\\Models\\District', NULL, '{\"name\":\"Rampur\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":683}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(719, 'created', 684, 'App\\Models\\District', NULL, '{\"name\":\"Saharanpur\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":684}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(720, 'created', 685, 'App\\Models\\District', NULL, '{\"name\":\"Sambhal (Bhim Nagar)\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":685}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(721, 'created', 686, 'App\\Models\\District', NULL, '{\"name\":\"Sant Kabir Nagar\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":686}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(722, 'created', 687, 'App\\Models\\District', NULL, '{\"name\":\"Shahjahanpur\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":687}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(723, 'created', 688, 'App\\Models\\District', NULL, '{\"name\":\"Shamali (Prabuddh Nagar)\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":688}', '127.0.0.1', '2021-11-27 03:37:57', '2021-11-27 03:37:57'),
(724, 'created', 689, 'App\\Models\\District', NULL, '{\"name\":\"Shravasti\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:57\",\"created_at\":\"2021-11-27 09:07:57\",\"id\":689}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(725, 'created', 690, 'App\\Models\\District', NULL, '{\"name\":\"Siddharth Nagar\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":690}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(726, 'created', 691, 'App\\Models\\District', NULL, '{\"name\":\"Sitapur\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":691}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(727, 'created', 692, 'App\\Models\\District', NULL, '{\"name\":\"Sonbhadra\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":692}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(728, 'created', 693, 'App\\Models\\District', NULL, '{\"name\":\"Sultanpur\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":693}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(729, 'created', 694, 'App\\Models\\District', NULL, '{\"name\":\"Unnao\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":694}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(730, 'created', 695, 'App\\Models\\District', NULL, '{\"name\":\"Varanasi\",\"status\":1,\"state_id\":35,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":695}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(731, 'created', 36, 'App\\Models\\State', NULL, '{\"name\":\"West Bengal\",\"status\":1,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":36}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(732, 'created', 696, 'App\\Models\\District', NULL, '{\"name\":\"Alipurduar\",\"status\":1,\"state_id\":36,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":696}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(733, 'created', 697, 'App\\Models\\District', NULL, '{\"name\":\"Bankura\",\"status\":1,\"state_id\":36,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":697}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(734, 'created', 698, 'App\\Models\\District', NULL, '{\"name\":\"Birbhum\",\"status\":1,\"state_id\":36,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":698}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(735, 'created', 699, 'App\\Models\\District', NULL, '{\"name\":\"Cooch Behar\",\"status\":1,\"state_id\":36,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":699}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(736, 'created', 700, 'App\\Models\\District', NULL, '{\"name\":\"Dakshin Dinajpur (South Dinajpur)\",\"status\":1,\"state_id\":36,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":700}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(737, 'created', 701, 'App\\Models\\District', NULL, '{\"name\":\"Darjeeling\",\"status\":1,\"state_id\":36,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":701}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(738, 'created', 702, 'App\\Models\\District', NULL, '{\"name\":\"Hooghly\",\"status\":1,\"state_id\":36,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":702}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(739, 'created', 703, 'App\\Models\\District', NULL, '{\"name\":\"Howrah\",\"status\":1,\"state_id\":36,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":703}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(740, 'created', 704, 'App\\Models\\District', NULL, '{\"name\":\"Jalpaiguri\",\"status\":1,\"state_id\":36,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":704}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(741, 'created', 705, 'App\\Models\\District', NULL, '{\"name\":\"Jhargram\",\"status\":1,\"state_id\":36,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":705}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(742, 'created', 706, 'App\\Models\\District', NULL, '{\"name\":\"Kalimpong\",\"status\":1,\"state_id\":36,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":706}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(743, 'created', 707, 'App\\Models\\District', NULL, '{\"name\":\"Kolkata\",\"status\":1,\"state_id\":36,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":707}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(744, 'created', 708, 'App\\Models\\District', NULL, '{\"name\":\"Malda\",\"status\":1,\"state_id\":36,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":708}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(745, 'created', 709, 'App\\Models\\District', NULL, '{\"name\":\"Murshidabad\",\"status\":1,\"state_id\":36,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":709}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(746, 'created', 710, 'App\\Models\\District', NULL, '{\"name\":\"Nadia\",\"status\":1,\"state_id\":36,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":710}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(747, 'created', 711, 'App\\Models\\District', NULL, '{\"name\":\"North 24 Parganas\",\"status\":1,\"state_id\":36,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":711}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(748, 'created', 712, 'App\\Models\\District', NULL, '{\"name\":\"Paschim Medinipur (West Medinipur)\",\"status\":1,\"state_id\":36,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":712}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(749, 'created', 713, 'App\\Models\\District', NULL, '{\"name\":\"Paschim (West) Burdwan (Bardhaman)\",\"status\":1,\"state_id\":36,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":713}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(750, 'created', 714, 'App\\Models\\District', NULL, '{\"name\":\"Purba Burdwan (Bardhaman)\",\"status\":1,\"state_id\":36,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":714}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(751, 'created', 715, 'App\\Models\\District', NULL, '{\"name\":\"Purba Medinipur (East Medinipur)\",\"status\":1,\"state_id\":36,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":715}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(752, 'created', 716, 'App\\Models\\District', NULL, '{\"name\":\"Purulia\",\"status\":1,\"state_id\":36,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":716}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(753, 'created', 717, 'App\\Models\\District', NULL, '{\"name\":\"South 24 Parganas\",\"status\":1,\"state_id\":36,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":717}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(754, 'created', 718, 'App\\Models\\District', NULL, '{\"name\":\"Uttar Dinajpur (North Dinajpur)\",\"status\":1,\"state_id\":36,\"updated_at\":\"2021-11-27 09:07:58\",\"created_at\":\"2021-11-27 09:07:58\",\"id\":718}', '127.0.0.1', '2021-11-27 03:37:58', '2021-11-27 03:37:58'),
(755, 'created', 1, 'App\\Models\\Vendor', NULL, '{\"mobile\":\"9109844778\",\"email\":\"homver30@gmail.com\",\"updated_at\":\"2021-11-27 09:24:49\",\"created_at\":\"2021-11-27 09:24:49\",\"id\":1}', '127.0.0.1', '2021-11-27 03:54:49', '2021-11-27 03:54:49'),
(756, 'updated', 1, 'App\\Models\\Vendor', NULL, '{\"id\":1,\"name\":null,\"email\":\"homver30@gmail.com\",\"mobile\":\"9109844778\",\"user_type\":\"MANUFACTURER\",\"email_verified_at\":null,\"mobile_verified_at\":null,\"verification_token\":null,\"mobile_verification_token\":null,\"approved\":0,\"verified\":0,\"verified_at\":null,\"created_at\":\"2021-11-27 09:24:49\",\"updated_at\":\"2021-11-27 09:26:06\",\"deleted_at\":null}', '127.0.0.1', '2021-11-27 03:56:06', '2021-11-27 03:56:06'),
(757, 'created', 1, 'App\\Models\\VendorProfile', NULL, '{\"vendor_id\":1,\"company_name\":\"9109844778\",\"representative_name\":\"homver30@gmail.com\",\"email\":\"homver30@gmail.com\",\"mobile\":\"9109844778\",\"billing_address\":\"9109844778\",\"billing_address_two\":\"homver30@gmail.com\",\"billing_state_id\":\"1\",\"billing_district_id\":\"1\",\"billing_pincode\":25554,\"pickup_address\":\"9109844778\",\"pickup_address_two\":\"homver30@gmail.com\",\"pickup_state_id\":\"1\",\"pickup_district_id\":\"1\",\"pickup_pincode\":25554,\"updated_at\":\"2021-11-27 09:26:06\",\"created_at\":\"2021-11-27 09:26:06\",\"id\":1,\"image\":null,\"aadhaar_card\":null,\"pan_card\":null,\"address_proof\":null,\"signature\":null,\"media\":[]}', '127.0.0.1', '2021-11-27 03:56:06', '2021-11-27 03:56:06'),
(758, 'updated', 1, 'App\\Models\\VendorProfile', NULL, '{\"id\":1,\"vendor_id\":1,\"company_name\":\"9109844778\",\"representative_name\":\"homver30@gmail.com\",\"email\":\"homver30@gmail.com\",\"mobile\":\"9109844778\",\"gst_number\":\"homver30@gmail.com\",\"pan_number\":\"9109844778\",\"billing_address\":\"9109844778\",\"billing_address_two\":\"homver30@gmail.com\",\"billing_state_id\":1,\"billing_district_id\":1,\"billing_pincode\":\"25554\",\"pickup_address\":\"9109844778\",\"pickup_address_two\":\"homver30@gmail.com\",\"pickup_state_id\":1,\"pickup_district_id\":1,\"pickup_pincode\":\"25554\",\"bank_name\":\"homver30@gmail.com\",\"account_number\":\"9109844778\",\"account_holder_name\":\"9109844778\",\"ifsc_code\":\"homver30@gmail.com\",\"created_at\":\"2021-11-27 09:26:06\",\"updated_at\":\"2021-11-27 09:26:11\",\"deleted_at\":null,\"image\":null,\"aadhaar_card\":null,\"pan_card\":null,\"address_proof\":null,\"signature\":null,\"media\":[]}', '127.0.0.1', '2021-11-27 03:56:11', '2021-11-27 03:56:11'),
(759, 'created', 1, 'App\\Models\\Product', NULL, '{\"vendor_id\":1,\"name\":\"9109844778\",\"slug\":\"9109844778\",\"description\":null,\"price\":\"500\",\"mop\":\"5000\",\"moq\":\"5\",\"discount\":null,\"product_category_id\":null,\"product_sub_category_id\":null,\"dispatch_time\":null,\"rrp\":null,\"quantity\":null,\"updated_at\":\"2021-11-27 10:14:05\",\"created_at\":\"2021-11-27 10:14:05\",\"id\":1,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-11-27 04:44:05', '2021-11-27 04:44:05'),
(760, 'created', 3, 'App\\Models\\Product', NULL, '{\"vendor_id\":1,\"name\":\"9109844778\",\"slug\":\"91098447781\",\"description\":null,\"price\":\"500\",\"mop\":\"5000\",\"moq\":\"5\",\"discount\":null,\"product_category_id\":null,\"product_sub_category_id\":null,\"dispatch_time\":null,\"rrp\":null,\"quantity\":null,\"updated_at\":\"2021-11-27 10:16:30\",\"created_at\":\"2021-11-27 10:16:30\",\"id\":3,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-11-27 04:46:30', '2021-11-27 04:46:30'),
(761, 'created', 4, 'App\\Models\\Product', NULL, '{\"vendor_id\":1,\"name\":\"9109844778\",\"slug\":\"91098447782\",\"description\":null,\"price\":\"500\",\"mop\":\"5000\",\"moq\":\"5\",\"discount\":null,\"product_category_id\":null,\"product_sub_category_id\":null,\"dispatch_time\":null,\"rrp\":null,\"quantity\":null,\"updated_at\":\"2021-11-27 10:21:14\",\"created_at\":\"2021-11-27 10:21:14\",\"id\":4,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-11-27 04:51:14', '2021-11-27 04:51:14'),
(762, 'created', 5, 'App\\Models\\Product', NULL, '{\"vendor_id\":1,\"name\":\"9109844778\",\"slug\":\"91098447783\",\"description\":null,\"price\":\"500\",\"mop\":\"5000\",\"moq\":\"5\",\"discount\":null,\"product_category_id\":null,\"product_sub_category_id\":null,\"dispatch_time\":null,\"rrp\":null,\"quantity\":null,\"updated_at\":\"2021-11-27 10:21:28\",\"created_at\":\"2021-11-27 10:21:28\",\"id\":5,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-11-27 04:51:28', '2021-11-27 04:51:28'),
(763, 'created', 6, 'App\\Models\\Product', NULL, '{\"vendor_id\":1,\"name\":\"9109844778\",\"slug\":\"91098447784\",\"description\":null,\"price\":\"500\",\"mop\":\"5000\",\"moq\":\"5\",\"discount\":null,\"product_category_id\":null,\"product_sub_category_id\":null,\"dispatch_time\":null,\"rrp\":null,\"quantity\":null,\"updated_at\":\"2021-11-27 10:22:46\",\"created_at\":\"2021-11-27 10:22:46\",\"id\":6,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-11-27 04:52:46', '2021-11-27 04:52:46'),
(764, 'created', 7, 'App\\Models\\Product', NULL, '{\"vendor_id\":1,\"name\":\"9109844778\",\"slug\":\"91098447785\",\"description\":null,\"price\":\"500\",\"mop\":\"5000\",\"moq\":\"5\",\"discount\":null,\"product_category_id\":null,\"product_sub_category_id\":null,\"dispatch_time\":null,\"rrp\":null,\"quantity\":null,\"updated_at\":\"2021-11-27 10:22:56\",\"created_at\":\"2021-11-27 10:22:56\",\"id\":7,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-11-27 04:52:56', '2021-11-27 04:52:56'),
(765, 'created', 8, 'App\\Models\\Product', NULL, '{\"vendor_id\":1,\"name\":\"9109844778\",\"slug\":\"91098447786\",\"description\":null,\"price\":\"500\",\"mop\":\"5000\",\"moq\":\"5\",\"discount\":null,\"product_category_id\":null,\"product_sub_category_id\":null,\"dispatch_time\":null,\"rrp\":null,\"quantity\":null,\"updated_at\":\"2021-11-27 10:23:08\",\"created_at\":\"2021-11-27 10:23:08\",\"id\":8,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-11-27 04:53:08', '2021-11-27 04:53:08');
INSERT INTO `audit_logs` (`id`, `description`, `subject_id`, `subject_type`, `admin_id`, `properties`, `host`, `created_at`, `updated_at`) VALUES
(766, 'created', 9, 'App\\Models\\Product', NULL, '{\"vendor_id\":1,\"name\":\"9109844778\",\"slug\":\"91098447787\",\"description\":null,\"price\":\"500\",\"mop\":\"5000\",\"moq\":\"5\",\"discount\":null,\"product_category_id\":null,\"product_sub_category_id\":null,\"dispatch_time\":null,\"rrp\":null,\"quantity\":null,\"updated_at\":\"2021-11-27 10:23:21\",\"created_at\":\"2021-11-27 10:23:21\",\"id\":9,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-11-27 04:53:21', '2021-11-27 04:53:21'),
(767, 'created', 10, 'App\\Models\\Product', NULL, '{\"vendor_id\":1,\"name\":\"9109844778\",\"slug\":\"91098447788\",\"description\":null,\"price\":\"500\",\"mop\":\"5000\",\"moq\":\"5\",\"discount\":null,\"product_category_id\":null,\"product_sub_category_id\":null,\"dispatch_time\":null,\"rrp\":null,\"quantity\":null,\"updated_at\":\"2021-11-27 10:23:45\",\"created_at\":\"2021-11-27 10:23:45\",\"id\":10,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-11-27 04:53:45', '2021-11-27 04:53:45'),
(768, 'created', 11, 'App\\Models\\Product', NULL, '{\"vendor_id\":1,\"name\":\"9109844778\",\"slug\":\"91098447789\",\"description\":null,\"price\":\"500\",\"mop\":\"5000\",\"moq\":\"5\",\"discount\":null,\"product_category_id\":null,\"product_sub_category_id\":null,\"dispatch_time\":null,\"rrp\":null,\"quantity\":null,\"updated_at\":\"2021-11-27 10:24:42\",\"created_at\":\"2021-11-27 10:24:42\",\"id\":11,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-11-27 04:54:42', '2021-11-27 04:54:42'),
(769, 'created', 12, 'App\\Models\\Product', NULL, '{\"vendor_id\":1,\"name\":\"9109844778\",\"slug\":\"910984477810\",\"description\":null,\"price\":\"500\",\"mop\":\"5000\",\"moq\":\"5\",\"discount\":null,\"product_category_id\":null,\"product_sub_category_id\":null,\"dispatch_time\":null,\"rrp\":null,\"quantity\":null,\"updated_at\":\"2021-11-27 10:25:03\",\"created_at\":\"2021-11-27 10:25:03\",\"id\":12,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-11-27 04:55:03', '2021-11-27 04:55:03'),
(770, 'created', 13, 'App\\Models\\Product', NULL, '{\"vendor_id\":1,\"name\":\"9109844778\",\"slug\":\"910984477811\",\"description\":null,\"price\":\"500\",\"mop\":\"5000\",\"moq\":\"5\",\"discount\":null,\"product_category_id\":null,\"product_sub_category_id\":null,\"dispatch_time\":null,\"rrp\":null,\"quantity\":null,\"updated_at\":\"2021-11-27 10:25:27\",\"created_at\":\"2021-11-27 10:25:27\",\"id\":13,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-11-27 04:55:27', '2021-11-27 04:55:27'),
(771, 'updated', 1, 'App\\Models\\Product', NULL, '{\"id\":1,\"vendor_id\":1,\"name\":\"9109844778\",\"slug\":\"9109844778\",\"description\":null,\"price\":\"500\",\"mop\":\"5000\",\"moq\":\"5\",\"discount\":null,\"product_category_id\":null,\"product_sub_category_id\":null,\"dispatch_time\":null,\"rrp\":null,\"is_approved\":0,\"quantity\":null,\"created_at\":\"2021-11-27 10:14:05\",\"updated_at\":\"2021-11-27 10:27:18\",\"deleted_at\":null,\"brand_id\":null,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-11-27 04:57:18', '2021-11-27 04:57:18'),
(772, 'updated', 1, 'App\\Models\\Product', NULL, '{\"id\":1,\"vendor_id\":1,\"name\":\"Name\",\"slug\":\"9109844778\",\"description\":null,\"price\":\"500\",\"mop\":\"5000\",\"moq\":\"5\",\"discount\":null,\"product_category_id\":null,\"product_sub_category_id\":null,\"dispatch_time\":null,\"rrp\":null,\"is_approved\":0,\"quantity\":null,\"created_at\":\"2021-11-27 10:14:05\",\"updated_at\":\"2021-11-27 10:27:43\",\"deleted_at\":null,\"brand_id\":null,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-11-27 04:57:43', '2021-11-27 04:57:43'),
(773, 'created', 14, 'App\\Models\\Product', NULL, '{\"vendor_id\":1,\"name\":\"9109844778\",\"slug\":\"910984477812\",\"description\":null,\"price\":\"500\",\"mop\":\"5000\",\"moq\":\"5\",\"discount\":null,\"product_category_id\":\"1\",\"product_sub_category_id\":null,\"dispatch_time\":null,\"rrp\":null,\"quantity\":null,\"updated_at\":\"2021-11-27 17:10:10\",\"created_at\":\"2021-11-27 17:10:10\",\"id\":14,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-11-27 11:40:11', '2021-11-27 11:40:11'),
(774, 'created', 15, 'App\\Models\\Product', NULL, '{\"vendor_id\":1,\"name\":\"9109844778\",\"slug\":\"910984477813\",\"description\":null,\"price\":\"500\",\"mop\":\"5000\",\"moq\":\"5\",\"discount\":null,\"product_category_id\":null,\"product_sub_category_id\":null,\"dispatch_time\":null,\"rrp\":null,\"quantity\":null,\"updated_at\":\"2021-11-27 17:34:19\",\"created_at\":\"2021-11-27 17:34:19\",\"id\":15,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-11-27 12:04:19', '2021-11-27 12:04:19'),
(775, 'updated', 15, 'App\\Models\\Product', NULL, '{\"id\":15,\"vendor_id\":1,\"name\":\"Name\",\"slug\":\"910984477813\",\"description\":null,\"price\":\"500\",\"mop\":\"5000\",\"moq\":\"5\",\"discount\":null,\"product_category_id\":null,\"product_sub_category_id\":null,\"dispatch_time\":null,\"rrp\":null,\"approval_status\":\"PENDING\",\"quantity\":null,\"created_at\":\"2021-11-27 17:34:19\",\"updated_at\":\"2021-11-27 17:35:06\",\"deleted_at\":null,\"brand_id\":null,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-11-27 12:05:06', '2021-11-27 12:05:06'),
(776, 'created', 2, 'App\\Models\\Vendor', NULL, '{\"mobile\":\"9109844777\",\"email\":\"homver30@gmail1.com\",\"user_type\":\"MANUFACTURER\",\"updated_at\":\"2021-11-29 11:53:39\",\"created_at\":\"2021-11-29 11:53:39\",\"id\":2}', '127.0.0.1', '2021-11-29 06:23:39', '2021-11-29 06:23:39'),
(777, 'created', 2, 'App\\Models\\VendorProfile', NULL, '{\"mobile\":\"9109844777\",\"email\":\"homver30@gmail1.com\",\"company_name\":\"company\",\"representative_name\":\"representative\",\"billing_address\":\"address\",\"billing_address_two\":null,\"billing_state_id\":\"1\",\"billing_district_id\":\"1\",\"billing_pincode\":\"495555\",\"pickup_address\":\"address\",\"pickup_address_two\":null,\"pickup_state_id\":\"1\",\"pickup_district_id\":\"2\",\"pickup_pincode\":\"455555\",\"pan_number\":\"pnnnnn\",\"gst_number\":\"gstin\",\"bank_name\":\"bank\",\"account_number\":\"12345678\",\"account_holder_name\":\"acoun\",\"ifsc_code\":\"ifsc\",\"vendor_id\":2,\"updated_at\":\"2021-11-29 11:53:39\",\"created_at\":\"2021-11-29 11:53:39\",\"id\":2,\"image\":null,\"aadhaar_card\":null,\"pan_card\":null,\"address_proof\":null,\"signature\":null,\"media\":[]}', '127.0.0.1', '2021-11-29 06:23:39', '2021-11-29 06:23:39'),
(794, 'created', 32, 'App\\Models\\Product', NULL, '{\"name\":\"Test Product\",\"price\":\"5000\",\"moq\":\"5\",\"discount\":\"41\",\"dispatch_time\":\"2 days\",\"rrp\":null,\"description\":null,\"quantity\":null,\"vendor_id\":1,\"slug\":\"test-product\",\"updated_at\":\"2021-11-29 14:13:17\",\"created_at\":\"2021-11-29 14:13:17\",\"id\":32,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-11-29 08:43:17', '2021-11-29 08:43:17'),
(795, 'updated', 15, 'App\\Models\\Product', NULL, '{\"id\":15,\"vendor_id\":1,\"name\":\"Name Test\",\"slug\":\"910984477813\",\"description\":null,\"price\":\"500.00\",\"mop\":\"5000.00\",\"moq\":\"5\",\"discount\":null,\"product_category_id\":null,\"product_sub_category_id\":null,\"dispatch_time\":null,\"rrp\":null,\"approval_status\":\"PENDING\",\"quantity\":null,\"created_at\":\"2021-11-27 17:34:19\",\"updated_at\":\"2021-11-29 16:37:37\",\"deleted_at\":null,\"brand_id\":null,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-11-29 11:07:37', '2021-11-29 11:07:37'),
(796, 'updated', 1, 'App\\Models\\Vendor', NULL, '{\"id\":1,\"name\":\"Company\",\"email\":\"homver30@gmail.com\",\"mobile\":\"9109844778\",\"user_type\":\"MANUFACTURER\",\"email_verified_at\":null,\"mobile_verified_at\":null,\"verification_token\":null,\"mobile_verification_token\":null,\"approved\":0,\"verified\":1,\"verified_at\":null,\"created_at\":\"2021-11-27 09:24:49\",\"updated_at\":\"2021-11-30 06:54:57\",\"deleted_at\":null}', '127.0.0.1', '2021-11-30 01:24:57', '2021-11-30 01:24:57'),
(797, 'updated', 1, 'App\\Models\\VendorProfile', NULL, '{\"id\":1,\"vendor_id\":1,\"company_name\":\"Company\",\"representative_name\":\"homver30@gmail.com\",\"email\":\"homver30@gmail.com\",\"mobile\":\"9109844778\",\"gst_number\":\"homver30@gmail.com\",\"pan_number\":\"9109844778\",\"billing_address\":\"9109844778\",\"billing_address_two\":\"homver30@gmail.com\",\"billing_state_id\":\"2\",\"billing_district_id\":\"7\",\"billing_pincode\":\"25554\",\"pickup_address\":\"9109844778\",\"pickup_address_two\":\"homver30@gmail.com\",\"pickup_state_id\":\"1\",\"pickup_district_id\":\"7\",\"pickup_pincode\":\"25554\",\"bank_name\":\"homver30@gmail.com\",\"account_number\":\"9109844778\",\"account_holder_name\":\"9109844778\",\"ifsc_code\":\"homver30@gmail.com\",\"created_at\":\"2021-11-27 09:26:06\",\"updated_at\":\"2021-11-30 06:54:57\",\"deleted_at\":null,\"pan_card\":{\"id\":4,\"model_type\":\"App\\\\Models\\\\VendorProfile\",\"model_id\":1,\"uuid\":\"607ecf85-e821-49fa-acb6-b31eaed10faf\",\"collection_name\":\"pan_card\",\"name\":\"61a4ca246f4f7_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC\",\"file_name\":\"61a4ca246f4f7_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":48510,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":4,\"created_at\":\"2021-11-29T12:40:06.000000Z\",\"updated_at\":\"2021-11-29T12:40:07.000000Z\",\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/4\\/61a4ca246f4f7_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/4\\/conversions\\/61a4ca246f4f7_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC-preview.jpg\"},\"gst\":{\"id\":3,\"model_type\":\"App\\\\Models\\\\VendorProfile\",\"model_id\":1,\"uuid\":\"8fbdb0c5-4447-479e-b9d5-5b5211795e4e\",\"collection_name\":\"gst\",\"name\":\"61a4ca20a2703_250px-Irrigat\",\"file_name\":\"61a4ca20a2703_250px-Irrigat.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":15187,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":3,\"created_at\":\"2021-11-29T12:40:06.000000Z\",\"updated_at\":\"2021-11-29T12:40:06.000000Z\",\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/3\\/61a4ca20a2703_250px-Irrigat.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/3\\/conversions\\/61a4ca20a2703_250px-Irrigat-preview.jpg\"},\"media\":[{\"id\":3,\"model_type\":\"App\\\\Models\\\\VendorProfile\",\"model_id\":1,\"uuid\":\"8fbdb0c5-4447-479e-b9d5-5b5211795e4e\",\"collection_name\":\"gst\",\"name\":\"61a4ca20a2703_250px-Irrigat\",\"file_name\":\"61a4ca20a2703_250px-Irrigat.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":15187,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":3,\"created_at\":\"2021-11-29T12:40:06.000000Z\",\"updated_at\":\"2021-11-29T12:40:06.000000Z\",\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/3\\/61a4ca20a2703_250px-Irrigat.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/3\\/conversions\\/61a4ca20a2703_250px-Irrigat-preview.jpg\"},{\"id\":4,\"model_type\":\"App\\\\Models\\\\VendorProfile\",\"model_id\":1,\"uuid\":\"607ecf85-e821-49fa-acb6-b31eaed10faf\",\"collection_name\":\"pan_card\",\"name\":\"61a4ca246f4f7_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC\",\"file_name\":\"61a4ca246f4f7_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":48510,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":4,\"created_at\":\"2021-11-29T12:40:06.000000Z\",\"updated_at\":\"2021-11-29T12:40:07.000000Z\",\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/4\\/61a4ca246f4f7_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/4\\/conversions\\/61a4ca246f4f7_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC-preview.jpg\"}]}', '127.0.0.1', '2021-11-30 01:24:57', '2021-11-30 01:24:57'),
(798, 'updated', 1, 'App\\Models\\Vendor', NULL, '{\"id\":1,\"name\":\"Company\",\"email\":\"homver30@gmail.com\",\"mobile\":\"9109844778\",\"user_type\":\"WHOLESALER\",\"email_verified_at\":null,\"mobile_verified_at\":null,\"verification_token\":null,\"mobile_verification_token\":null,\"approved\":0,\"verified\":1,\"verified_at\":null,\"created_at\":\"2021-11-27 09:24:49\",\"updated_at\":\"2021-11-30 06:55:09\",\"deleted_at\":null}', '127.0.0.1', '2021-11-30 01:25:09', '2021-11-30 01:25:09'),
(799, 'updated', 1, 'App\\Models\\Vendor', NULL, '{\"id\":1,\"name\":\"Company\",\"email\":\"homver30@gmail.com\",\"mobile\":\"9109844778\",\"user_type\":\"WHOLESALER\",\"email_verified_at\":null,\"mobile_verified_at\":null,\"verification_token\":null,\"mobile_verification_token\":null,\"approved\":0,\"verified\":1,\"verified_at\":null,\"created_at\":\"2021-11-27 09:24:49\",\"updated_at\":\"2021-11-30 07:00:02\",\"deleted_at\":null}', '127.0.0.1', '2021-11-30 01:30:02', '2021-11-30 01:30:02'),
(800, 'updated', 1, 'App\\Models\\Vendor', NULL, '{\"id\":1,\"name\":\"Company\",\"email\":\"homver30@gmail.com\",\"mobile\":\"9109844778\",\"user_type\":\"WHOLESALER\",\"email_verified_at\":null,\"mobile_verified_at\":null,\"verification_token\":null,\"mobile_verification_token\":null,\"approved\":0,\"verified\":1,\"verified_at\":null,\"created_at\":\"2021-11-27 09:24:49\",\"updated_at\":\"2021-11-30 07:01:12\",\"deleted_at\":null,\"profile\":{\"id\":1,\"vendor_id\":1,\"company_name\":\"Company\",\"representative_name\":\"homver30@gmail.com\",\"email\":\"homver30@gmail.com\",\"mobile\":\"9109844778\",\"gst_number\":\"homver30@gmail.com\",\"pan_number\":\"9109844778\",\"billing_address\":\"9109844778\",\"billing_address_two\":\"homver30@gmail.com\",\"billing_state_id\":2,\"billing_district_id\":7,\"billing_pincode\":\"25554\",\"pickup_address\":\"9109844778\",\"pickup_address_two\":\"homver30@gmail.com\",\"pickup_state_id\":1,\"pickup_district_id\":7,\"pickup_pincode\":\"25554\",\"bank_name\":\"homver30@gmail.com\",\"account_number\":\"9109844778\",\"account_holder_name\":\"9109844778\",\"ifsc_code\":\"homver30@gmail.com\",\"created_at\":\"2021-11-27 09:26:06\",\"updated_at\":\"2021-11-30 06:54:57\",\"deleted_at\":null,\"pan_card\":{\"id\":4,\"model_type\":\"App\\\\Models\\\\VendorProfile\",\"model_id\":1,\"uuid\":\"607ecf85-e821-49fa-acb6-b31eaed10faf\",\"collection_name\":\"pan_card\",\"name\":\"61a4ca246f4f7_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC\",\"file_name\":\"61a4ca246f4f7_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":48510,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":4,\"created_at\":\"2021-11-29T12:40:06.000000Z\",\"updated_at\":\"2021-11-29T12:40:07.000000Z\",\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/4\\/61a4ca246f4f7_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/4\\/conversions\\/61a4ca246f4f7_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC-preview.jpg\"},\"gst\":{\"id\":3,\"model_type\":\"App\\\\Models\\\\VendorProfile\",\"model_id\":1,\"uuid\":\"8fbdb0c5-4447-479e-b9d5-5b5211795e4e\",\"collection_name\":\"gst\",\"name\":\"61a4ca20a2703_250px-Irrigat\",\"file_name\":\"61a4ca20a2703_250px-Irrigat.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":15187,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":3,\"created_at\":\"2021-11-29T12:40:06.000000Z\",\"updated_at\":\"2021-11-29T12:40:06.000000Z\",\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/3\\/61a4ca20a2703_250px-Irrigat.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/3\\/conversions\\/61a4ca20a2703_250px-Irrigat-preview.jpg\"},\"media\":[{\"id\":3,\"model_type\":\"App\\\\Models\\\\VendorProfile\",\"model_id\":1,\"uuid\":\"8fbdb0c5-4447-479e-b9d5-5b5211795e4e\",\"collection_name\":\"gst\",\"name\":\"61a4ca20a2703_250px-Irrigat\",\"file_name\":\"61a4ca20a2703_250px-Irrigat.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":15187,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":3,\"created_at\":\"2021-11-29T12:40:06.000000Z\",\"updated_at\":\"2021-11-29T12:40:06.000000Z\",\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/3\\/61a4ca20a2703_250px-Irrigat.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/3\\/conversions\\/61a4ca20a2703_250px-Irrigat-preview.jpg\"},{\"id\":4,\"model_type\":\"App\\\\Models\\\\VendorProfile\",\"model_id\":1,\"uuid\":\"607ecf85-e821-49fa-acb6-b31eaed10faf\",\"collection_name\":\"pan_card\",\"name\":\"61a4ca246f4f7_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC\",\"file_name\":\"61a4ca246f4f7_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":48510,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":4,\"created_at\":\"2021-11-29T12:40:06.000000Z\",\"updated_at\":\"2021-11-29T12:40:07.000000Z\",\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/4\\/61a4ca246f4f7_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/4\\/conversions\\/61a4ca246f4f7_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC-preview.jpg\"}]}}', '127.0.0.1', '2021-11-30 01:31:12', '2021-11-30 01:31:12'),
(801, 'updated', 1, 'App\\Models\\VendorProfile', NULL, '{\"id\":1,\"vendor_id\":1,\"company_name\":\"Company\",\"representative_name\":\"homver30@gmail.com\",\"email\":\"homver30@gmail.com\",\"mobile\":\"9109844778\",\"gst_number\":\"homver30@gmail.com\",\"pan_number\":\"9109844778\",\"billing_address\":\"9109844778\",\"billing_address_two\":\"homver30@gmail.com\",\"billing_state_id\":2,\"billing_district_id\":7,\"billing_pincode\":\"25554\",\"pickup_address\":\"9109844778\",\"pickup_address_two\":\"homver30@gmail.com\",\"pickup_state_id\":1,\"pickup_district_id\":7,\"pickup_pincode\":\"25554\",\"bank_name\":\"State Bank of India\",\"account_number\":\"9109844778\",\"account_holder_name\":\"Homesh\",\"ifsc_code\":\"IFSCCODE\",\"created_at\":\"2021-11-27 09:26:06\",\"updated_at\":\"2021-11-30 07:59:46\",\"deleted_at\":null,\"pan_card\":{\"id\":4,\"model_type\":\"App\\\\Models\\\\VendorProfile\",\"model_id\":1,\"uuid\":\"607ecf85-e821-49fa-acb6-b31eaed10faf\",\"collection_name\":\"pan_card\",\"name\":\"61a4ca246f4f7_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC\",\"file_name\":\"61a4ca246f4f7_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":48510,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":4,\"created_at\":\"2021-11-29T12:40:06.000000Z\",\"updated_at\":\"2021-11-29T12:40:07.000000Z\",\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/4\\/61a4ca246f4f7_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/4\\/conversions\\/61a4ca246f4f7_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC-preview.jpg\"},\"gst\":{\"id\":3,\"model_type\":\"App\\\\Models\\\\VendorProfile\",\"model_id\":1,\"uuid\":\"8fbdb0c5-4447-479e-b9d5-5b5211795e4e\",\"collection_name\":\"gst\",\"name\":\"61a4ca20a2703_250px-Irrigat\",\"file_name\":\"61a4ca20a2703_250px-Irrigat.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":15187,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":3,\"created_at\":\"2021-11-29T12:40:06.000000Z\",\"updated_at\":\"2021-11-29T12:40:06.000000Z\",\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/3\\/61a4ca20a2703_250px-Irrigat.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/3\\/conversions\\/61a4ca20a2703_250px-Irrigat-preview.jpg\"},\"media\":[{\"id\":3,\"model_type\":\"App\\\\Models\\\\VendorProfile\",\"model_id\":1,\"uuid\":\"8fbdb0c5-4447-479e-b9d5-5b5211795e4e\",\"collection_name\":\"gst\",\"name\":\"61a4ca20a2703_250px-Irrigat\",\"file_name\":\"61a4ca20a2703_250px-Irrigat.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":15187,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":3,\"created_at\":\"2021-11-29T12:40:06.000000Z\",\"updated_at\":\"2021-11-29T12:40:06.000000Z\",\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/3\\/61a4ca20a2703_250px-Irrigat.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/3\\/conversions\\/61a4ca20a2703_250px-Irrigat-preview.jpg\"},{\"id\":4,\"model_type\":\"App\\\\Models\\\\VendorProfile\",\"model_id\":1,\"uuid\":\"607ecf85-e821-49fa-acb6-b31eaed10faf\",\"collection_name\":\"pan_card\",\"name\":\"61a4ca246f4f7_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC\",\"file_name\":\"61a4ca246f4f7_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":48510,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":4,\"created_at\":\"2021-11-29T12:40:06.000000Z\",\"updated_at\":\"2021-11-29T12:40:07.000000Z\",\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/4\\/61a4ca246f4f7_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/4\\/conversions\\/61a4ca246f4f7_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC-preview.jpg\"}]}', '127.0.0.1', '2021-11-30 02:29:46', '2021-11-30 02:29:46'),
(802, 'created', 3, 'App\\Models\\Vendor', 1, '{\"name\":\"Company\",\"email\":\"test@test.com\",\"mobile\":\"1234567890\",\"approved\":true,\"verified\":true,\"verified_at\":\"2021-11-30T12:45:50.923630Z\",\"updated_at\":\"2021-11-30 12:45:50\",\"created_at\":\"2021-11-30 12:45:50\",\"id\":3}', '127.0.0.1', '2021-11-30 07:15:50', '2021-11-30 07:15:50'),
(803, 'created', 3, 'App\\Models\\VendorProfile', 1, '{\"mobile\":\"1234567890\",\"email\":\"test@test.com\",\"company_name\":\"Company\",\"representative_name\":\"Representative\",\"billing_address\":\"Address\",\"billing_state_id\":\"4\",\"billing_district_id\":\"41\",\"billing_pincode\":\"455555\",\"pickup_address\":\"Address\",\"pickup_state_id\":\"2\",\"pickup_district_id\":\"7\",\"pickup_pincode\":\"78944\",\"pan_number\":\"PAN\",\"gst_number\":\"GSTIN\",\"bank_name\":\"Bank\",\"account_number\":\"123456\",\"account_holder_name\":\"Homesh\",\"ifsc_code\":\"IFSCCODE\",\"vendor_id\":3,\"updated_at\":\"2021-11-30 12:45:50\",\"created_at\":\"2021-11-30 12:45:50\",\"id\":3,\"pan_card\":null,\"gst\":null,\"media\":[]}', '127.0.0.1', '2021-11-30 07:15:50', '2021-11-30 07:15:50'),
(804, 'updated', 3, 'App\\Models\\Vendor', 1, '{\"id\":3,\"name\":\"Company\",\"email\":\"test@test.com\",\"mobile\":\"1234567890\",\"user_type\":\"MANUFACTURER\",\"email_verified_at\":null,\"mobile_verified_at\":null,\"verification_token\":null,\"mobile_verification_token\":null,\"approved\":true,\"verified\":true,\"verified_at\":\"2021-11-30T13:41:51.307753Z\",\"created_at\":\"2021-11-30 12:45:50\",\"updated_at\":\"2021-11-30 13:41:51\",\"deleted_at\":null}', '127.0.0.1', '2021-11-30 08:11:51', '2021-11-30 08:11:51'),
(805, 'updated', 3, 'App\\Models\\VendorProfile', 1, '{\"id\":3,\"vendor_id\":3,\"company_name\":\"Company\",\"representative_name\":\"Representative\",\"email\":\"test@test.com\",\"mobile\":\"1234567890\",\"gst_number\":\"GSTIN\",\"pan_number\":\"PAN\",\"billing_address\":\"Address\",\"billing_address_two\":null,\"billing_state_id\":\"4\",\"billing_district_id\":\"41\",\"billing_pincode\":\"455555\",\"pickup_address\":\"Address\",\"pickup_address_two\":null,\"pickup_state_id\":\"2\",\"pickup_district_id\":\"41\",\"pickup_pincode\":\"78944\",\"bank_name\":\"Bank\",\"account_number\":\"123456\",\"account_holder_name\":\"Homesh\",\"ifsc_code\":\"IFSCCODE\",\"created_at\":\"2021-11-30 12:45:50\",\"updated_at\":\"2021-11-30 13:41:51\",\"deleted_at\":null,\"pan_card\":null,\"gst\":null,\"media\":[]}', '127.0.0.1', '2021-11-30 08:11:51', '2021-11-30 08:11:51'),
(806, 'updated', 2, 'App\\Models\\Vendor', 1, '{\"id\":2,\"name\":null,\"email\":\"homver30@gmail1.com\",\"mobile\":\"9109844777\",\"user_type\":\"MANUFACTURER\",\"email_verified_at\":null,\"mobile_verified_at\":null,\"verification_token\":null,\"mobile_verification_token\":null,\"approved\":1,\"verified\":0,\"verified_at\":null,\"created_at\":\"2021-11-29 11:53:39\",\"updated_at\":\"2021-11-30 16:42:56\",\"deleted_at\":null}', '127.0.0.1', '2021-11-30 11:12:56', '2021-11-30 11:12:56');

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `voucher_date` date DEFAULT NULL,
  `voucher_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bill_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bill_items`
--

CREATE TABLE `bill_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bill_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_price_id` bigint(20) UNSIGNED NOT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` decimal(8,2) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE `blocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` double(15,2) NOT NULL,
  `amount` double(15,2) DEFAULT NULL,
  `cart_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_price_id` bigint(20) UNSIGNED NOT NULL,
  `gst` double NOT NULL DEFAULT 0,
  `discount` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `content_categories`
--

CREATE TABLE `content_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `content_category_content_page`
--

CREATE TABLE `content_category_content_page` (
  `content_page_id` bigint(20) UNSIGNED NOT NULL,
  `content_category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `content_pages`
--

CREATE TABLE `content_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_text` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `content_page_content_tag`
--

CREATE TABLE `content_page_content_tag` (
  `content_page_id` bigint(20) UNSIGNED NOT NULL,
  `content_tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `content_tags`
--

CREATE TABLE `content_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `name`, `state_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Nicobar', 1, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(2, 'North and Middle Andaman', 1, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(3, 'South Andaman', 1, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(4, 'Anantapur', 2, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(5, 'Chittoor', 2, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(6, 'East Godavari', 2, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(7, 'Guntur', 2, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(8, 'Krishna', 2, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(9, 'Kurnool', 2, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(10, 'Prakasam', 2, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(11, 'Srikakulam', 2, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(12, 'Sri Potti Sriramulu Nellore', 2, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(13, 'Visakhapatnam', 2, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(14, 'Vizianagaram', 2, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(15, 'West Godavari', 2, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(16, 'YSR District, Kadapa (Cuddapah)', 2, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(17, 'Anjaw', 3, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(18, 'Changlang', 3, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(19, 'Dibang Valley', 3, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(20, 'East Kameng', 3, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(21, 'East Siang', 3, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(22, 'Kra Daadi', 3, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(23, 'Kurung Kumey', 3, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(24, 'Lohit', 3, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(25, 'Longding', 3, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(26, 'Lower Dibang Valley', 3, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(27, 'Lower Siang', 3, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(28, 'Lower Subansiri', 3, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(29, 'Namsai', 3, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(30, 'Papum Pare', 3, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(31, 'Siang', 3, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(32, 'Tawang', 3, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(33, 'Tirap', 3, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(34, 'Upper Siang', 3, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(35, 'Upper Subansiri', 3, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(36, 'West Kameng', 3, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(37, 'West Siang', 3, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(38, 'Baksa', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(39, 'Barpeta', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(40, 'Biswanath', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(41, 'Bongaigaon', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(42, 'Cachar', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(43, 'Charaideo', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(44, 'Chirang', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(45, 'Darrang', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(46, 'Dhemaji', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(47, 'Dhubri', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(48, 'Dibrugarh', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(49, 'Dima Hasao (North Cachar Hills)', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(50, 'Goalpara', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(51, 'Golaghat', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(52, 'Hailakandi', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(53, 'Hojai', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(54, 'Jorhat', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(55, 'Kamrup', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(56, 'Kamrup Metropolitan', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(57, 'Karbi Anglong', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(58, 'Karimganj', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(59, 'Kokrajhar', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(60, 'Lakhimpur', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(61, 'Majuli', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(62, 'Morigaon', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(63, 'Nagaon', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(64, 'Nalbari', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(65, 'Sivasagar', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(66, 'Sonitpur', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(67, 'South Salamara-Mankachar', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(68, 'Tinsukia', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(69, 'Udalguri', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(70, 'West Karbi Anglong', 4, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(71, 'Araria', 5, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(72, 'Arwal', 5, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(73, 'Aurangabad', 5, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(74, 'Banka', 5, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(75, 'Begusarai', 5, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(76, 'Bhagalpur', 5, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(77, 'Bhojpur', 5, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(78, 'Buxar', 5, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(79, 'Darbhanga', 5, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(80, 'East Champaran (Motihari)', 5, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(81, 'Gaya', 5, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(82, 'Gopalganj', 5, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(83, 'Jamui', 5, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(84, 'Jehanabad', 5, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(85, 'Kaimur (Bhabua)', 5, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(86, 'Katihar', 5, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(87, 'Khagaria', 5, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(88, 'Kishanganj', 5, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(89, 'Lakhisarai', 5, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(90, 'Madhepura', 5, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(91, 'Madhubani', 5, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(92, 'Munger (Monghyr)', 5, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(93, 'Muzaffarpur', 5, 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(94, 'Nalanda', 5, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(95, 'Nawada', 5, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(96, 'Patna', 5, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(97, 'Purnia (Purnea)', 5, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(98, 'Rohtas', 5, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(99, 'Saharsa', 5, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(100, 'Samastipur', 5, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(101, 'Saran', 5, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(102, 'Sheikhpura', 5, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(103, 'Sheohar', 5, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(104, 'Sitamarhi', 5, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(105, 'Siwan', 5, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(106, 'Supaul', 5, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(107, 'Vaishali', 5, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(108, 'West Champaran', 5, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(109, 'Chandigarh', 6, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(110, 'Balod', 7, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(111, 'Baloda Bazar', 7, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(112, 'Balrampur', 7, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(113, 'Bastar', 7, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(114, 'Bemetara', 7, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(115, 'Bijapur', 7, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(116, 'Bilaspur', 7, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(117, 'Dantewada (South Bastar)', 7, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(118, 'Dhamtari', 7, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(119, 'Durg', 7, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(120, 'Gariyaband', 7, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(121, 'Janjgir-Champa', 7, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(122, 'Jashpur', 7, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(123, 'Kabirdham (Kawardha)', 7, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(124, 'Kanker (North Bastar)', 7, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(125, 'Kondagaon', 7, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(126, 'Korba', 7, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(127, 'Korea (Koriya)', 7, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(128, 'Mahasamund', 7, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(129, 'Mungeli', 7, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(130, 'Narayanpur', 7, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(131, 'Raigarh', 7, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(132, 'Raipur', 7, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(133, 'Rajnandgaon', 7, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(134, 'Sukma', 7, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(135, 'Surajpur  ', 7, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(136, 'Surguja', 7, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(137, 'Dadra & Nagar Haveli', 8, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(138, 'Daman', 9, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(139, 'Diu', 9, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(140, 'Central Delhi', 10, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(141, 'East Delhi', 10, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(142, 'New Delhi', 10, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(143, 'North Delhi', 10, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(144, 'North East  Delhi', 10, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(145, 'North West  Delhi', 10, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(146, 'Shahdara', 10, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(147, 'South Delhi', 10, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(148, 'South East Delhi', 10, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(149, 'South West  Delhi', 10, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(150, 'West Delhi', 10, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(151, 'North Goa', 11, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(152, 'South Goa', 11, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(153, 'Ahmedabad', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(154, 'Amreli', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(155, 'Anand', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(156, 'Aravalli', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(157, 'Banaskantha (Palanpur)', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(158, 'Bharuch', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(159, 'Bhavnagar', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(160, 'Botad', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(161, 'Chhota Udepur', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(162, 'Dahod', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(163, 'Dangs (Ahwa)', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(164, 'Devbhoomi Dwarka', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(165, 'Gandhinagar', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(166, 'Gir Somnath', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(167, 'Jamnagar', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(168, 'Junagadh', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(169, 'Kachchh', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(170, 'Kheda (Nadiad)', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(171, 'Mahisagar', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(172, 'Mehsana', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(173, 'Morbi', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(174, 'Narmada (Rajpipla)', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(175, 'Navsari', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(176, 'Panchmahal (Godhra)', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(177, 'Patan', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(178, 'Porbandar', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(179, 'Rajkot', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(180, 'Sabarkantha (Himmatnagar)', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(181, 'Surat', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(182, 'Surendranagar', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(183, 'Tapi (Vyara)', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(184, 'Vadodara', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(185, 'Valsad', 12, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(186, 'Ambala', 13, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(187, 'Bhiwani', 13, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(188, 'Charkhi Dadri', 13, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(189, 'Faridabad', 13, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(190, 'Fatehabad', 13, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(191, 'Gurgaon', 13, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(192, 'Hisar', 13, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(193, 'Jhajjar', 13, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(194, 'Jind', 13, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(195, 'Kaithal', 13, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(196, 'Karnal', 13, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(197, 'Kurukshetra', 13, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(198, 'Mahendragarh', 13, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(199, 'Mewat', 13, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(200, 'Palwal', 13, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(201, 'Panchkula', 13, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(202, 'Panipat', 13, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(203, 'Rewari', 13, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(204, 'Rohtak', 13, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(205, 'Sirsa', 13, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(206, 'Sonipat', 13, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(207, 'Yamunanagar', 13, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(208, 'Bilaspur', 14, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(209, 'Chamba', 14, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(210, 'Hamirpur', 14, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(211, 'Kangra', 14, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(212, 'Kinnaur', 14, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(213, 'Kullu', 14, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(214, 'Lahaul & Spiti', 14, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(215, 'Mandi', 14, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(216, 'Shimla', 14, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(217, 'Sirmaur (Sirmour)', 14, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(218, 'Solan', 14, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(219, 'Una', 14, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(220, 'Anantnag', 15, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(221, 'Bandipore', 15, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(222, 'Baramulla', 15, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(223, 'Budgam', 15, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(224, 'Doda', 15, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(225, 'Ganderbal', 15, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(226, 'Jammu', 15, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(227, 'Kargil', 15, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(228, 'Kathua', 15, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(229, 'Kishtwar', 15, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(230, 'Kulgam', 15, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(231, 'Kupwara', 15, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(232, 'Leh', 15, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(233, 'Poonch', 15, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(234, 'Pulwama', 15, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(235, 'Rajouri', 15, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(236, 'Ramban', 15, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(237, 'Reasi', 15, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(238, 'Samba', 15, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(239, 'Shopian', 15, 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(240, 'Srinagar', 15, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(241, 'Udhampur', 15, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(242, 'Bokaro', 16, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(243, 'Chatra', 16, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(244, 'Deoghar', 16, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(245, 'Dhanbad', 16, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(246, 'Dumka', 16, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(247, 'East Singhbhum', 16, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(248, 'Garhwa', 16, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(249, 'Giridih', 16, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(250, 'Godda', 16, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(251, 'Gumla', 16, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(252, 'Hazaribag', 16, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(253, 'Jamtara', 16, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(254, 'Khunti', 16, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(255, 'Koderma', 16, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(256, 'Latehar', 16, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(257, 'Lohardaga', 16, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(258, 'Pakur', 16, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(259, 'Palamu', 16, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(260, 'Ramgarh', 16, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(261, 'Ranchi', 16, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(262, 'Sahibganj', 16, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(263, 'Seraikela-Kharsawan', 16, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(264, 'Simdega', 16, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(265, 'West Singhbhum', 16, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(266, 'Bagalkot', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(267, 'Ballari (Bellary)', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(268, 'Belagavi (Belgaum)', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(269, 'Bengaluru (Bangalore) Rural', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(270, 'Bengaluru (Bangalore) Urban', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(271, 'Bidar', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(272, 'Chamarajanagar', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(273, 'Chikballapur', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(274, 'Chikkamagaluru (Chikmagalur)', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(275, 'Chitradurga', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(276, 'Dakshina Kannada', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(277, 'Davangere', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(278, 'Dharwad', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(279, 'Gadag', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(280, 'Hassan', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(281, 'Haveri', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(282, 'Kalaburagi (Gulbarga)', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(283, 'Kodagu', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(284, 'Kolar', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(285, 'Koppal', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(286, 'Mandya', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(287, 'Mysuru (Mysore)', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(288, 'Raichur', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(289, 'Ramanagara', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(290, 'Shivamogga (Shimoga)', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(291, 'Tumakuru (Tumkur)', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(292, 'Udupi', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(293, 'Uttara Kannada (Karwar)', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(294, 'Vijayapura (Bijapur)', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(295, 'Yadgir', 17, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(296, 'Alappuzha', 18, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(297, 'Ernakulam', 18, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(298, 'Idukki', 18, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(299, 'Kannur', 18, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(300, 'Kasaragod', 18, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(301, 'Kollam', 18, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(302, 'Kottayam', 18, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(303, 'Kozhikode', 18, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(304, 'Malappuram', 18, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(305, 'Palakkad', 18, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(306, 'Pathanamthitta', 18, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(307, 'Thiruvananthapuram', 18, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(308, 'Thrissur', 18, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(309, 'Wayanad', 18, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(310, 'Lakshadweep', 19, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(311, 'Agar Malwa', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(312, 'Alirajpur', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(313, 'Anuppur', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(314, 'Ashoknagar', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(315, 'Balaghat', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(316, 'Barwani', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(317, 'Betul', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(318, 'Bhind', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(319, 'Bhopal', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(320, 'Burhanpur', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(321, 'Chhatarpur', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(322, 'Chhindwara', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(323, 'Damoh', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(324, 'Datia', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(325, 'Dewas', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(326, 'Dhar', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(327, 'Dindori', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(328, 'Guna', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(329, 'Gwalior', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(330, 'Harda', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(331, 'Hoshangabad', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(332, 'Indore', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(333, 'Jabalpur', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(334, 'Jhabua', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(335, 'Katni', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(336, 'Khandwa', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(337, 'Khargone', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(338, 'Mandla', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(339, 'Mandsaur', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(340, 'Morena', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(341, 'Narsinghpur', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(342, 'Neemuch', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(343, 'Panna', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(344, 'Raisen', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(345, 'Rajgarh', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(346, 'Ratlam', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(347, 'Rewa', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(348, 'Sagar', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(349, 'Satna', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(350, 'Sehore', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(351, 'Seoni', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(352, 'Shahdol', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(353, 'Shajapur', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(354, 'Sheopur', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(355, 'Shivpuri', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(356, 'Sidhi', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(357, 'Singrauli', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(358, 'Tikamgarh', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(359, 'Ujjain', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(360, 'Umaria', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(361, 'Vidisha', 20, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(362, 'Ahmednagar', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(363, 'Akola', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(364, 'Amravati', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(365, 'Aurangabad', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(366, 'Beed', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(367, 'Bhandara', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(368, 'Buldhana', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(369, 'Chandrapur', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(370, 'Dhule', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(371, 'Gadchiroli', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(372, 'Gondia', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(373, 'Hingoli', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(374, 'Jalgaon', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(375, 'Jalna', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(376, 'Kolhapur', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(377, 'Latur', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(378, 'Mumbai City', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(379, 'Mumbai Suburban', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(380, 'Nagpur', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(381, 'Nanded', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(382, 'Nandurbar', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(383, 'Nashik', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(384, 'Osmanabad', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(385, 'Palghar', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(386, 'Parbhani', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(387, 'Pune', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(388, 'Raigad', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(389, 'Ratnagiri', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(390, 'Sangli', 21, 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(391, 'Satara', 21, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(392, 'Sindhudurg', 21, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(393, 'Solapur', 21, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(394, 'Thane', 21, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(395, 'Wardha', 21, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(396, 'Washim', 21, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(397, 'Yavatmal', 21, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(398, 'Bishnupur', 22, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(399, 'Chandel', 22, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(400, 'Churachandpur', 22, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(401, 'Imphal East', 22, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(402, 'Imphal West', 22, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(403, 'Jiribam', 22, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(404, 'Kakching', 22, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(405, 'Kamjong', 22, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(406, 'Kangpokpi', 22, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(407, 'Noney', 22, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(408, 'Pherzawl', 22, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(409, 'Senapati', 22, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(410, 'Tamenglong', 22, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(411, 'Tengnoupal', 22, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(412, 'Thoubal', 22, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(413, 'Ukhrul', 22, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(414, 'East Garo Hills', 23, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(415, 'East Jaintia Hills', 23, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(416, 'East Khasi Hills', 23, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(417, 'North Garo Hills', 23, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(418, 'Ri Bhoi', 23, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(419, 'South Garo Hills', 23, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(420, 'South West Garo Hills ', 23, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(421, 'South West Khasi Hills', 23, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(422, 'West Garo Hills', 23, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(423, 'West Jaintia Hills', 23, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(424, 'West Khasi Hills', 23, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(425, 'Aizawl', 24, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(426, 'Champhai', 24, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(427, 'Kolasib', 24, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(428, 'Lawngtlai', 24, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(429, 'Lunglei', 24, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(430, 'Mamit', 24, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(431, 'Saiha', 24, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(432, 'Serchhip', 24, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(433, 'Dimapur', 25, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(434, 'Kiphire', 25, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(435, 'Kohima', 25, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(436, 'Longleng', 25, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(437, 'Mokokchung', 25, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(438, 'Mon', 25, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(439, 'Peren', 25, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(440, 'Phek', 25, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(441, 'Tuensang', 25, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(442, 'Wokha', 25, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(443, 'Zunheboto', 25, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(444, 'Angul', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(445, 'Balangir', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(446, 'Balasore', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(447, 'Bargarh', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(448, 'Bhadrak', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(449, 'Boudh', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(450, 'Cuttack', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(451, 'Deogarh', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(452, 'Dhenkanal', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(453, 'Gajapati', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(454, 'Ganjam', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(455, 'Jagatsinghapur', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(456, 'Jajpur', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(457, 'Jharsuguda', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(458, 'Kalahandi', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(459, 'Kandhamal', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(460, 'Kendrapara', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(461, 'Kendujhar (Keonjhar)', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(462, 'Khordha', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(463, 'Koraput', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(464, 'Malkangiri', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(465, 'Mayurbhanj', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(466, 'Nabarangpur', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(467, 'Nayagarh', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(468, 'Nuapada', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(469, 'Puri', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(470, 'Rayagada', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(471, 'Sambalpur', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(472, 'Sonepur', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(473, 'Sundargarh', 26, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(474, 'Karaikal', 27, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(475, 'Mahe', 27, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(476, 'Pondicherry', 27, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(477, 'Yanam', 27, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(478, 'Amritsar', 28, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(479, 'Barnala', 28, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(480, 'Bathinda', 28, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(481, 'Faridkot', 28, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(482, 'Fatehgarh Sahib', 28, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(483, 'Fazilka', 28, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(484, 'Ferozepur', 28, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(485, 'Gurdaspur', 28, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(486, 'Hoshiarpur', 28, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(487, 'Jalandhar', 28, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(488, 'Kapurthala', 28, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(489, 'Ludhiana', 28, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(490, 'Mansa', 28, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(491, 'Moga', 28, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(492, 'Muktsar', 28, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(493, 'Nawanshahr (Shahid Bhagat Singh Nagar)', 28, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(494, 'Pathankot', 28, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(495, 'Patiala', 28, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(496, 'Rupnagar', 28, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(497, 'Sahibzada Ajit Singh Nagar (Mohali)', 28, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(498, 'Sangrur', 28, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(499, 'Tarn Taran', 28, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(500, 'Ajmer', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(501, 'Alwar', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(502, 'Banswara', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(503, 'Baran', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(504, 'Barmer', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(505, 'Bharatpur', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(506, 'Bhilwara', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(507, 'Bikaner', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(508, 'Bundi', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(509, 'Chittorgarh', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(510, 'Churu', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(511, 'Dausa', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(512, 'Dholpur', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(513, 'Dungarpur', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(514, 'Hanumangarh', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(515, 'Jaipur', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(516, 'Jaisalmer', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(517, 'Jalore', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(518, 'Jhalawar', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(519, 'Jhunjhunu', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(520, 'Jodhpur', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(521, 'Karauli', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(522, 'Kota', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(523, 'Nagaur', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(524, 'Pali', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(525, 'Pratapgarh', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(526, 'Rajsamand', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(527, 'Sawai Madhopur', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(528, 'Sikar', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(529, 'Sirohi', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(530, 'Sri Ganganagar', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(531, 'Tonk', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(532, 'Udaipur', 29, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(533, 'East Sikkim', 30, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(534, 'North Sikkim', 30, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(535, 'South Sikkim', 30, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(536, 'West Sikkim', 30, 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(537, 'Ariyalur', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(538, 'Chennai', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(539, 'Coimbatore', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(540, 'Cuddalore', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(541, 'Dharmapuri', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(542, 'Dindigul', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(543, 'Erode', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(544, 'Kanchipuram', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(545, 'Kanyakumari', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(546, 'Karur', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(547, 'Krishnagiri', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(548, 'Madurai', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(549, 'Nagapattinam', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(550, 'Namakkal', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(551, 'Nilgiris', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(552, 'Perambalur', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(553, 'Pudukkottai', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(554, 'Ramanathapuram', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(555, 'Salem', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(556, 'Sivaganga', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(557, 'Thanjavur', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(558, 'Theni', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(559, 'Thoothukudi (Tuticorin)', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(560, 'Tiruchirappalli', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(561, 'Tirunelveli', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(562, 'Tiruppur', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(563, 'Tiruvallur', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(564, 'Tiruvannamalai', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(565, 'Tiruvarur', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(566, 'Vellore', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(567, 'Viluppuram', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(568, 'Virudhunagar', 31, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(569, 'Adilabad', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(570, 'Bhadradri Kothagudem', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(571, 'Hyderabad', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(572, 'Jagtial', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(573, 'Jangaon', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(574, 'Jayashankar Bhoopalpally', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(575, 'Jogulamba Gadwal', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(576, 'Kamareddy', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(577, 'Karimnagar', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(578, 'Khammam', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(579, 'Komaram Bheem Asifabad', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(580, 'Mahabubabad', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(581, 'Mahabubnagar', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(582, 'Mancherial', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(583, 'Medak', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(584, 'Medchal', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(585, 'Nagarkurnool', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(586, 'Nalgonda', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(587, 'Nirmal', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(588, 'Nizamabad', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(589, 'Peddapalli', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(590, 'Rajanna Sircilla', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(591, 'Rangareddy', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(592, 'Sangareddy', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(593, 'Siddipet', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(594, 'Suryapet', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(595, 'Vikarabad', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(596, 'Wanaparthy', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(597, 'Warangal (Rural)', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(598, 'Warangal (Urban)', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(599, 'Yadadri Bhuvanagiri', 32, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(600, 'Dhalai', 33, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(601, 'Gomati', 33, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(602, 'Khowai', 33, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(603, 'North Tripura', 33, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(604, 'Sepahijala', 33, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(605, 'South Tripura', 33, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(606, 'Unakoti', 33, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(607, 'West Tripura', 33, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(608, 'Almora', 34, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(609, 'Bageshwar', 34, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(610, 'Chamoli', 34, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(611, 'Champawat', 34, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(612, 'Dehradun', 34, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(613, 'Haridwar', 34, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(614, 'Nainital', 34, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(615, 'Pauri Garhwal', 34, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(616, 'Pithoragarh', 34, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(617, 'Rudraprayag', 34, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(618, 'Tehri Garhwal', 34, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(619, 'Udham Singh Nagar', 34, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(620, 'Uttarkashi', 34, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(621, 'Agra', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(622, 'Aligarh', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(623, 'Allahabad', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(624, 'Ambedkar Nagar', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(625, 'Amethi (Chatrapati Sahuji Mahraj Nagar)', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(626, 'Amroha (J.P. Nagar)', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(627, 'Auraiya', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(628, 'Azamgarh', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(629, 'Baghpat', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(630, 'Bahraich', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(631, 'Ballia', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(632, 'Balrampur', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(633, 'Banda', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(634, 'Barabanki', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(635, 'Bareilly', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(636, 'Basti', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(637, 'Bhadohi', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(638, 'Bijnor', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(639, 'Budaun', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(640, 'Bulandshahr', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(641, 'Chandauli', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(642, 'Chitrakoot', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(643, 'Deoria', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(644, 'Etah', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(645, 'Etawah', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(646, 'Faizabad', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(647, 'Farrukhabad', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(648, 'Fatehpur', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(649, 'Firozabad', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL);
INSERT INTO `districts` (`id`, `name`, `state_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(650, 'Gautam Buddha Nagar', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(651, 'Ghaziabad', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(652, 'Ghazipur', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(653, 'Gonda', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(654, 'Gorakhpur', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(655, 'Hamirpur', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(656, 'Hapur (Panchsheel Nagar)', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(657, 'Hardoi', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(658, 'Hathras', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(659, 'Jalaun', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(660, 'Jaunpur', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(661, 'Jhansi', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(662, 'Kannauj', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(663, 'Kanpur Dehat', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(664, 'Kanpur Nagar', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(665, 'Kanshiram Nagar (Kasganj)', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(666, 'Kaushambi', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(667, 'Kushinagar (Padrauna)', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(668, 'Lakhimpur - Kheri', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(669, 'Lalitpur', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(670, 'Lucknow', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(671, 'Maharajganj', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(672, 'Mahoba', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(673, 'Mainpuri', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(674, 'Mathura', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(675, 'Mau', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(676, 'Meerut', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(677, 'Mirzapur', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(678, 'Moradabad', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(679, 'Muzaffarnagar', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(680, 'Pilibhit', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(681, 'Pratapgarh', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(682, 'RaeBareli', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(683, 'Rampur', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(684, 'Saharanpur', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(685, 'Sambhal (Bhim Nagar)', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(686, 'Sant Kabir Nagar', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(687, 'Shahjahanpur', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(688, 'Shamali (Prabuddh Nagar)', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(689, 'Shravasti', 35, 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(690, 'Siddharth Nagar', 35, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(691, 'Sitapur', 35, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(692, 'Sonbhadra', 35, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(693, 'Sultanpur', 35, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(694, 'Unnao', 35, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(695, 'Varanasi', 35, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(696, 'Alipurduar', 36, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(697, 'Bankura', 36, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(698, 'Birbhum', 36, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(699, 'Cooch Behar', 36, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(700, 'Dakshin Dinajpur (South Dinajpur)', 36, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(701, 'Darjeeling', 36, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(702, 'Hooghly', 36, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(703, 'Howrah', 36, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(704, 'Jalpaiguri', 36, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(705, 'Jhargram', 36, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(706, 'Kalimpong', 36, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(707, 'Kolkata', 36, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(708, 'Malda', 36, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(709, 'Murshidabad', 36, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(710, 'Nadia', 36, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(711, 'North 24 Parganas', 36, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(712, 'Paschim Medinipur (West Medinipur)', 36, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(713, 'Paschim (West) Burdwan (Bardhaman)', 36, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(714, 'Purba Burdwan (Bardhaman)', 36, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(715, 'Purba Medinipur (East Medinipur)', 36, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(716, 'Purulia', 36, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(717, 'South 24 Parganas', 36, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL),
(718, 'Uttar Dinajpur (North Dinajpur)', 36, 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `enquiries`
--

CREATE TABLE `enquiries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `attendant_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq_questions`
--

CREATE TABLE `faq_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `follow_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_number` char(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_time` datetime NOT NULL,
  `invoiceable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoiceable_id` bigint(20) UNSIGNED NOT NULL,
  `userable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userable_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `gst` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `total` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logistics`
--

CREATE TABLE `logistics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `approved` tinyint(1) DEFAULT 0,
  `verified` tinyint(1) DEFAULT 0,
  `verified_at` datetime DEFAULT NULL,
  `verification_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_stocks`
--

CREATE TABLE `master_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_price_id` bigint(20) UNSIGNED NOT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`, `generated_conversions`) VALUES
(1, 'App\\Models\\VendorProfile', 2, 'f9285134-8d84-47fb-959a-2f630c0a9eb2', 'gst', '250px-Irrigat', '250px-Irrigat.jpg', 'image/jpeg', 'public', 'public', 15187, '[]', '[]', '[]', 1, '2021-11-29 06:23:41', '2021-11-29 06:23:45', '{\"thumb\":true,\"preview\":true}'),
(2, 'App\\Models\\VendorProfile', 2, 'dc687e6e-54c4-487f-b64b-efaebcbc0f96', 'pan_card', '80-512', '80-512.png', 'image/png', 'public', 'public', 30162, '[]', '[]', '[]', 2, '2021-11-29 06:23:45', '2021-11-29 06:23:46', '{\"thumb\":true,\"preview\":true}'),
(3, 'App\\Models\\VendorProfile', 1, '8fbdb0c5-4447-479e-b9d5-5b5211795e4e', 'gst', '61a4ca20a2703_250px-Irrigat', '61a4ca20a2703_250px-Irrigat.jpg', 'image/jpeg', 'public', 'public', 15187, '[]', '[]', '[]', 3, '2021-11-29 07:10:06', '2021-11-29 07:10:06', '{\"thumb\":true,\"preview\":true}'),
(4, 'App\\Models\\VendorProfile', 1, '607ecf85-e821-49fa-acb6-b31eaed10faf', 'pan_card', '61a4ca246f4f7_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC', '61a4ca246f4f7_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg', 'image/jpeg', 'public', 'public', 48510, '[]', '[]', '[]', 4, '2021-11-29 07:10:06', '2021-11-29 07:10:07', '{\"thumb\":true,\"preview\":true}'),
(5, 'App\\Models\\Product', 32, 'a83cce61-cae0-4c21-a688-f980b71cae7f', 'images', '61a4dfeb06934_250px-Irrigat', '61a4dfeb06934_250px-Irrigat.jpg', 'image/jpeg', 'public', 'public', 15187, '[]', '[]', '[]', 5, '2021-11-29 08:43:17', '2021-11-29 08:43:18', '{\"thumb\":true,\"preview\":true}'),
(6, 'App\\Models\\Product', 32, '730d1b5d-1880-4b19-99ea-e6b1a36617be', 'images', '61a4dfeb7d6d2_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC', '61a4dfeb7d6d2_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg', 'image/jpeg', 'public', 'public', 48510, '[]', '[]', '[]', 6, '2021-11-29 08:43:18', '2021-11-29 08:43:19', '{\"thumb\":true,\"preview\":true}'),
(7, 'App\\Models\\Product', 32, 'a1b0fbf5-79fe-42b4-a237-f531d32b7315', 'images', '61a4dfebe6261_515DsF20K1L._SL1080_', '61a4dfebe6261_515DsF20K1L._SL1080_.jpg', 'image/jpeg', 'public', 'public', 61899, '[]', '[]', '[]', 7, '2021-11-29 08:43:19', '2021-11-29 08:43:20', '{\"thumb\":true,\"preview\":true}'),
(8, 'App\\Models\\Product', 15, '66b0ae88-4635-40da-9561-06ff87c7586d', 'images', '61a501ecc6c73_1-500x500', '61a501ecc6c73_1-500x500.jpg', 'image/jpeg', 'public', 'public', 61857, '[]', '[]', '[]', 8, '2021-11-29 11:08:07', '2021-11-29 11:08:08', '{\"thumb\":true,\"preview\":true}'),
(9, 'App\\Models\\Product', 15, '890e9f9d-ff6a-4965-bf54-6302ae28703f', 'images', '61a501ed3c303_31g08PW3dtL._SX466_', '61a501ed3c303_31g08PW3dtL._SX466_.jpg', 'image/jpeg', 'public', 'public', 12500, '[]', '[]', '[]', 9, '2021-11-29 11:08:08', '2021-11-29 11:08:08', '{\"thumb\":true,\"preview\":true}'),
(10, 'App\\Models\\Product', 15, 'cbd46a4d-55bb-48ba-953f-4dd6c14c7e3a', 'images', '61a501edb332b_80-512', '61a501edb332b_80-512.png', 'image/png', 'public', 'public', 30162, '[]', '[]', '[]', 10, '2021-11-29 11:08:08', '2021-11-29 11:08:09', '{\"thumb\":true,\"preview\":true}');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2021_01_27_000001_create_audit_logs_table', 1),
(4, '2021_01_27_000002_create_media_table', 1),
(5, '2021_01_27_000003_create_article_likes_table', 1),
(6, '2021_01_27_000005_create_states_table', 1),
(7, '2021_01_27_000006_create_districts_table', 1),
(8, '2021_01_27_000007_create_blocks_table', 1),
(9, '2021_01_27_000007_create_pincodes_table', 1),
(10, '2021_01_27_000008_create_areas_table', 1),
(11, '2021_01_27_000008_create_brands_table', 1),
(12, '2021_01_27_000009_create_articles_table', 1),
(13, '2021_01_27_000010_create_article_tags_table', 1),
(14, '2021_01_27_000011_create_article_comments_table', 1),
(15, '2021_01_27_000012_create_followers_table', 1),
(16, '2021_01_27_000013_create_logistics_table', 1),
(17, '2021_01_27_000015_create_transactions_table', 1),
(18, '2021_01_27_000016_create_user_addresses_table', 1),
(19, '2021_01_27_000017_create_settings_table', 1),
(20, '2021_01_27_000018_create_admins_table', 1),
(21, '2021_01_27_000022_create_user_profiles_table', 1),
(22, '2021_01_27_000025_create_vendors_table', 1),
(23, '2021_01_27_000026_create_vendor_profiles_table', 1),
(24, '2021_01_27_000027_create_product_categories_table', 1),
(25, '2021_01_27_000027_create_product_sub_categories_table', 1),
(26, '2021_01_27_000027_create_user_alerts_table', 1),
(27, '2021_01_27_000028_create_products_table', 1),
(28, '2021_01_27_000029_create_product_tags_table', 1),
(29, '2021_01_27_000031_create_carts_table', 1),
(30, '2021_01_27_000032_create_content_categories_table', 1),
(31, '2021_01_27_000033_create_content_tags_table', 1),
(32, '2021_01_27_000034_create_users_table', 1),
(33, '2021_01_27_000035_create_content_pages_table', 1),
(34, '2021_01_27_000036_create_roles_table', 1),
(35, '2021_01_27_000037_create_orders_table', 1),
(36, '2021_01_27_000038_create_faq_categories_table', 1),
(37, '2021_01_27_000039_create_permissions_table', 1),
(38, '2021_01_27_000040_create_faq_questions_table', 1),
(39, '2021_01_27_000041_create_permission_role_pivot_table', 1),
(40, '2021_01_27_000042_create_product_product_tag_pivot_table', 1),
(41, '2021_01_27_000043_create_user_user_alert_pivot_table', 1),
(42, '2021_01_27_000044_create_role_user_pivot_table', 1),
(43, '2021_01_27_000045_create_content_page_content_tag_pivot_table', 1),
(44, '2021_01_27_000046_create_article_article_tag_pivot_table', 1),
(45, '2021_01_27_000047_create_content_category_content_page_pivot_table', 1),
(46, '2021_01_27_000049_add_relationship_fields_to_user_profiles_table', 1),
(47, '2021_01_27_000054_add_relationship_fields_to_carts_table', 1),
(48, '2021_01_27_000055_add_relationship_fields_to_user_addresses_table', 1),
(49, '2021_01_27_000056_add_relationship_fields_to_transactions_table', 1),
(50, '2021_01_27_000057_add_relationship_fields_to_products_table', 1),
(51, '2021_01_27_000058_add_relationship_fields_to_article_likes_table', 1),
(52, '2021_01_27_000059_add_relationship_fields_to_followers_table', 1),
(53, '2021_01_27_000060_add_relationship_fields_to_article_comments_table', 1),
(54, '2021_01_27_000061_add_relationship_fields_to_articles_table', 1),
(55, '2021_01_27_000065_add_relationship_fields_to_faq_questions_table', 1),
(56, '2021_01_27_000067_add_relationship_fields_to_orders_table', 1),
(57, '2021_02_04_091149_create_role_admins_table', 1),
(58, '2021_02_04_121103_create_admin_alerts_table', 1),
(59, '2021_02_04_122046_create_admin_admin_alert_pivot_table', 1),
(60, '2021_02_09_183539_create_role_logistics_table', 1),
(61, '2021_02_09_183608_create_role_vendor_table', 1),
(62, '2021_02_11_000025_create_enquiries_table', 1),
(63, '2021_02_11_000055_add_relationship_fields_to_enquiries_table', 1),
(64, '2021_03_03_065222_create_unit_types_table', 1),
(65, '2021_03_09_074229_create_product_prices_table', 1),
(66, '2021_03_09_075532_add_columns_to_orders_table', 1),
(67, '2021_03_09_075619_create_order_items_table', 1),
(68, '2021_03_09_091846_create_otps_table', 1),
(69, '2021_03_09_170012_add_columns_to_carts_table', 1),
(70, '2021_03_10_062703_create_product_stocks_table', 1),
(71, '2021_03_10_133403_create_sliders_table', 1),
(72, '2021_03_10_133713_create_slider_items_table', 1),
(73, '2021_03_14_152023_add_columns_to_transactions_table', 1),
(74, '2021_03_15_161336_add_transaction_id_column_to_orders_table', 1),
(75, '2021_05_11_100736_create_reviews_table', 1),
(76, '2021_05_15_074441_create_wishlists_table', 1),
(77, '2021_05_15_082604_add_generated_conversions_column_to_media_table', 1),
(78, '2021_05_16_064229_create_site_settings_table', 1),
(79, '2021_05_16_071733_add_name_column_to_user_addresses_table', 1),
(80, '2021_05_16_105347_add_unit_qty_column_to_carts_table', 1),
(81, '2021_05_16_105457_add_more_columns_to_order_items_table', 1),
(82, '2021_05_16_123821_add_is_default_column_to_user_addresses_table', 1),
(83, '2021_05_17_090636_create_push_notifications_table', 1),
(84, '2021_05_17_091145_add_device_token_column_to_users_table', 1),
(85, '2021_05_26_082650_create_jobs_table', 1),
(86, '2021_05_29_120747_add_unit_quantity_column_to_product_stocks_table', 1),
(87, '2021_06_02_083341_create_push_notification_user_table', 1),
(88, '2021_06_08_064846_create_invoices_table', 1),
(89, '2021_06_08_082020_add_is_invoice_generated_coloumn_to_orders_table', 1),
(90, '2021_06_08_083550_add_payment_related_columns_to_orders_table', 1),
(91, '2021_06_09_075952_create_master_stocks_table', 1),
(92, '2021_06_09_080513_create_bills_table', 1),
(93, '2021_06_09_081642_create_bill_items_table', 1),
(94, '2021_06_10_134151_add_is_stock_updated_column_to_orders_table', 1),
(95, '2021_11_27_085521_create_product_options_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address_id` bigint(20) UNSIGNED NOT NULL,
  `sub_total` double NOT NULL DEFAULT 0,
  `gst` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `grand_total` double NOT NULL DEFAULT 0,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_invoice_generated` tinyint(1) NOT NULL DEFAULT 0,
  `paymentable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paymentable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_payment_verified` tinyint(1) NOT NULL DEFAULT 0,
  `is_stock_updated` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_price_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` smallint(5) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `gst` double NOT NULL,
  `discount` double NOT NULL,
  `total_amount` double NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cart_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `discount_amount` decimal(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otps`
--

CREATE TABLE `otps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  `otp` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `v_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_response` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_expired` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `otps`
--

INSERT INTO `otps` (`id`, `user_id`, `vendor_id`, `otp`, `mobile`, `sms_status`, `v_token`, `gateway_response`, `is_expired`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, '8713', '9109844778', NULL, '662581', NULL, 1, '2021-11-27 03:54:49', '2021-11-27 12:23:20'),
(2, NULL, 1, '1448', '9109844778', NULL, NULL, NULL, 1, '2021-11-27 12:22:28', '2021-11-27 12:23:20');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'user_management_access', NULL, NULL, NULL),
(2, 'permission_create', NULL, NULL, NULL),
(3, 'permission_edit', NULL, NULL, NULL),
(4, 'permission_show', NULL, NULL, NULL),
(5, 'permission_delete', NULL, NULL, NULL),
(6, 'permission_access', NULL, NULL, NULL),
(7, 'role_create', NULL, NULL, NULL),
(8, 'role_edit', NULL, NULL, NULL),
(9, 'role_show', NULL, NULL, NULL),
(10, 'role_delete', NULL, NULL, NULL),
(11, 'role_access', NULL, NULL, NULL),
(12, 'user_create', NULL, NULL, NULL),
(13, 'user_edit', NULL, NULL, NULL),
(14, 'user_show', NULL, NULL, NULL),
(15, 'user_delete', NULL, NULL, NULL),
(16, 'user_access', NULL, NULL, NULL),
(17, 'product_management_access', NULL, NULL, NULL),
(18, 'product_category_create', NULL, NULL, NULL),
(19, 'product_category_edit', NULL, NULL, NULL),
(20, 'product_category_show', NULL, NULL, NULL),
(21, 'product_category_delete', NULL, NULL, NULL),
(22, 'product_category_access', NULL, NULL, NULL),
(23, 'product_tag_create', NULL, NULL, NULL),
(24, 'product_tag_edit', NULL, NULL, NULL),
(25, 'product_tag_show', NULL, NULL, NULL),
(26, 'product_tag_delete', NULL, NULL, NULL),
(27, 'product_tag_access', NULL, NULL, NULL),
(28, 'product_create', NULL, NULL, NULL),
(29, 'product_edit', NULL, NULL, NULL),
(30, 'product_show', NULL, NULL, NULL),
(31, 'product_delete', NULL, NULL, NULL),
(32, 'product_access', NULL, NULL, NULL),
(33, 'user_alert_create', NULL, NULL, NULL),
(34, 'user_alert_show', NULL, NULL, NULL),
(35, 'user_alert_delete', NULL, NULL, NULL),
(36, 'user_alert_access', NULL, NULL, NULL),
(37, 'content_management_access', NULL, NULL, NULL),
(38, 'content_category_create', NULL, NULL, NULL),
(39, 'content_category_edit', NULL, NULL, NULL),
(40, 'content_category_show', NULL, NULL, NULL),
(41, 'content_category_delete', NULL, NULL, NULL),
(42, 'content_category_access', NULL, NULL, NULL),
(43, 'content_tag_create', NULL, NULL, NULL),
(44, 'content_tag_edit', NULL, NULL, NULL),
(45, 'content_tag_show', NULL, NULL, NULL),
(46, 'content_tag_delete', NULL, NULL, NULL),
(47, 'content_tag_access', NULL, NULL, NULL),
(48, 'content_page_create', NULL, NULL, NULL),
(49, 'content_page_edit', NULL, NULL, NULL),
(50, 'content_page_show', NULL, NULL, NULL),
(51, 'content_page_delete', NULL, NULL, NULL),
(52, 'content_page_access', NULL, NULL, NULL),
(53, 'faq_management_access', NULL, NULL, NULL),
(54, 'faq_category_create', NULL, NULL, NULL),
(55, 'faq_category_edit', NULL, NULL, NULL),
(56, 'faq_category_show', NULL, NULL, NULL),
(57, 'faq_category_delete', NULL, NULL, NULL),
(58, 'faq_category_access', NULL, NULL, NULL),
(59, 'faq_question_create', NULL, NULL, NULL),
(60, 'faq_question_edit', NULL, NULL, NULL),
(61, 'faq_question_show', NULL, NULL, NULL),
(62, 'faq_question_delete', NULL, NULL, NULL),
(63, 'faq_question_access', NULL, NULL, NULL),
(64, 'audit_log_show', NULL, NULL, NULL),
(65, 'audit_log_access', NULL, NULL, NULL),
(66, 'order_management_access', NULL, NULL, NULL),
(67, 'order_create', NULL, NULL, NULL),
(68, 'order_edit', NULL, NULL, NULL),
(69, 'order_show', NULL, NULL, NULL),
(70, 'order_delete', NULL, NULL, NULL),
(71, 'order_access', NULL, NULL, NULL),
(72, 'cart_create', NULL, NULL, NULL),
(73, 'cart_edit', NULL, NULL, NULL),
(74, 'cart_show', NULL, NULL, NULL),
(75, 'cart_delete', NULL, NULL, NULL),
(76, 'cart_access', NULL, NULL, NULL),
(77, 'vendor_create', NULL, NULL, NULL),
(78, 'vendor_edit', NULL, NULL, NULL),
(79, 'vendor_show', NULL, NULL, NULL),
(80, 'vendor_delete', NULL, NULL, NULL),
(81, 'vendor_access', NULL, NULL, NULL),
(82, 'franchisee_create', NULL, NULL, NULL),
(83, 'franchisee_edit', NULL, NULL, NULL),
(84, 'franchisee_show', NULL, NULL, NULL),
(85, 'franchisee_delete', NULL, NULL, NULL),
(86, 'franchisee_access', NULL, NULL, NULL),
(87, 'area_management_access', NULL, NULL, NULL),
(88, 'pincode_create', NULL, NULL, NULL),
(89, 'pincode_edit', NULL, NULL, NULL),
(90, 'pincode_show', NULL, NULL, NULL),
(91, 'pincode_delete', NULL, NULL, NULL),
(92, 'pincode_access', NULL, NULL, NULL),
(93, 'state_create', NULL, NULL, NULL),
(94, 'state_edit', NULL, NULL, NULL),
(95, 'state_show', NULL, NULL, NULL),
(96, 'state_delete', NULL, NULL, NULL),
(97, 'state_access', NULL, NULL, NULL),
(98, 'district_create', NULL, NULL, NULL),
(99, 'district_edit', NULL, NULL, NULL),
(100, 'district_show', NULL, NULL, NULL),
(101, 'district_delete', NULL, NULL, NULL),
(102, 'district_access', NULL, NULL, NULL),
(103, 'block_create', NULL, NULL, NULL),
(104, 'block_edit', NULL, NULL, NULL),
(105, 'block_show', NULL, NULL, NULL),
(106, 'block_delete', NULL, NULL, NULL),
(107, 'block_access', NULL, NULL, NULL),
(108, 'area_create', NULL, NULL, NULL),
(109, 'area_edit', NULL, NULL, NULL),
(110, 'area_show', NULL, NULL, NULL),
(111, 'area_delete', NULL, NULL, NULL),
(112, 'area_access', NULL, NULL, NULL),
(113, 'brand_create', NULL, NULL, NULL),
(114, 'brand_edit', NULL, NULL, NULL),
(115, 'brand_show', NULL, NULL, NULL),
(116, 'brand_delete', NULL, NULL, NULL),
(117, 'brand_access', NULL, NULL, NULL),
(118, 'logistics_managment_access', NULL, NULL, NULL),
(119, 'forum_management_access', NULL, NULL, NULL),
(120, 'article_create', NULL, NULL, NULL),
(121, 'article_edit', NULL, NULL, NULL),
(122, 'article_show', NULL, NULL, NULL),
(123, 'article_delete', NULL, NULL, NULL),
(124, 'article_access', NULL, NULL, NULL),
(125, 'article_tag_create', NULL, NULL, NULL),
(126, 'article_tag_edit', NULL, NULL, NULL),
(127, 'article_tag_show', NULL, NULL, NULL),
(128, 'article_tag_delete', NULL, NULL, NULL),
(129, 'article_tag_access', NULL, NULL, NULL),
(130, 'article_comment_create', NULL, NULL, NULL),
(131, 'article_comment_edit', NULL, NULL, NULL),
(132, 'article_comment_show', NULL, NULL, NULL),
(133, 'article_comment_delete', NULL, NULL, NULL),
(134, 'article_comment_access', NULL, NULL, NULL),
(135, 'follower_create', NULL, NULL, NULL),
(136, 'follower_edit', NULL, NULL, NULL),
(137, 'follower_show', NULL, NULL, NULL),
(138, 'follower_delete', NULL, NULL, NULL),
(139, 'follower_access', NULL, NULL, NULL),
(140, 'article_like_create', NULL, NULL, NULL),
(141, 'article_like_edit', NULL, NULL, NULL),
(142, 'article_like_show', NULL, NULL, NULL),
(143, 'article_like_delete', NULL, NULL, NULL),
(144, 'article_like_access', NULL, NULL, NULL),
(145, 'logistic_create', NULL, NULL, NULL),
(146, 'logistic_edit', NULL, NULL, NULL),
(147, 'logistic_show', NULL, NULL, NULL),
(148, 'logistic_delete', NULL, NULL, NULL),
(149, 'logistic_access', NULL, NULL, NULL),
(150, 'transaction_management_access', NULL, NULL, NULL),
(151, 'transaction_create', NULL, NULL, NULL),
(152, 'transaction_edit', NULL, NULL, NULL),
(153, 'transaction_show', NULL, NULL, NULL),
(154, 'transaction_delete', NULL, NULL, NULL),
(155, 'transaction_access', NULL, NULL, NULL),
(156, 'user_address_create', NULL, NULL, NULL),
(157, 'user_address_edit', NULL, NULL, NULL),
(158, 'user_address_show', NULL, NULL, NULL),
(159, 'user_address_delete', NULL, NULL, NULL),
(160, 'user_address_access', NULL, NULL, NULL),
(161, 'setting_create', NULL, NULL, NULL),
(162, 'setting_edit', NULL, NULL, NULL),
(163, 'setting_show', NULL, NULL, NULL),
(164, 'setting_delete', NULL, NULL, NULL),
(165, 'setting_access', NULL, NULL, NULL),
(166, 'admin_management_access', NULL, NULL, NULL),
(167, 'admin_create', NULL, NULL, NULL),
(168, 'admin_edit', NULL, NULL, NULL),
(169, 'admin_show', NULL, NULL, NULL),
(170, 'admin_delete', NULL, NULL, NULL),
(171, 'admin_access', NULL, NULL, NULL),
(172, 'city_create', NULL, NULL, NULL),
(173, 'city_edit', NULL, NULL, NULL),
(174, 'city_show', NULL, NULL, NULL),
(175, 'city_delete', NULL, NULL, NULL),
(176, 'city_access', NULL, NULL, NULL),
(177, 'organisation_access', NULL, NULL, NULL),
(178, 'help_center_create', NULL, NULL, NULL),
(179, 'help_center_edit', NULL, NULL, NULL),
(180, 'help_center_show', NULL, NULL, NULL),
(181, 'help_center_delete', NULL, NULL, NULL),
(182, 'help_center_access', NULL, NULL, NULL),
(183, 'help_center_profile_create', NULL, NULL, NULL),
(184, 'help_center_profile_edit', NULL, NULL, NULL),
(185, 'help_center_profile_show', NULL, NULL, NULL),
(186, 'help_center_profile_delete', NULL, NULL, NULL),
(187, 'help_center_profile_access', NULL, NULL, NULL),
(188, 'user_profile_create', NULL, NULL, NULL),
(189, 'user_profile_edit', NULL, NULL, NULL),
(190, 'user_profile_show', NULL, NULL, NULL),
(191, 'user_profile_delete', NULL, NULL, NULL),
(192, 'user_profile_access', NULL, NULL, NULL),
(193, 'information_center_access', NULL, NULL, NULL),
(194, 'crop_create', NULL, NULL, NULL),
(195, 'crop_edit', NULL, NULL, NULL),
(196, 'crop_show', NULL, NULL, NULL),
(197, 'crop_delete', NULL, NULL, NULL),
(198, 'crop_access', NULL, NULL, NULL),
(199, 'franchisee_profile_create', NULL, NULL, NULL),
(200, 'franchisee_profile_edit', NULL, NULL, NULL),
(201, 'franchisee_profile_show', NULL, NULL, NULL),
(202, 'franchisee_profile_delete', NULL, NULL, NULL),
(203, 'franchisee_profile_access', NULL, NULL, NULL),
(204, 'profile_password_edit', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 61),
(1, 62),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(1, 68),
(1, 69),
(1, 70),
(1, 71),
(1, 72),
(1, 73),
(1, 74),
(1, 75),
(1, 76),
(1, 77),
(1, 78),
(1, 79),
(1, 80),
(1, 81),
(1, 82),
(1, 83),
(1, 84),
(1, 85),
(1, 86),
(1, 87),
(1, 88),
(1, 89),
(1, 90),
(1, 91),
(1, 92),
(1, 93),
(1, 94),
(1, 95),
(1, 96),
(1, 97),
(1, 98),
(1, 99),
(1, 100),
(1, 101),
(1, 102),
(1, 103),
(1, 104),
(1, 105),
(1, 106),
(1, 107),
(1, 108),
(1, 109),
(1, 110),
(1, 111),
(1, 112),
(1, 113),
(1, 114),
(1, 115),
(1, 116),
(1, 117),
(1, 118),
(1, 119),
(1, 120),
(1, 121),
(1, 122),
(1, 123),
(1, 124),
(1, 125),
(1, 126),
(1, 127),
(1, 128),
(1, 129),
(1, 130),
(1, 131),
(1, 132),
(1, 133),
(1, 134),
(1, 135),
(1, 136),
(1, 137),
(1, 138),
(1, 139),
(1, 140),
(1, 141),
(1, 142),
(1, 143),
(1, 144),
(1, 145),
(1, 146),
(1, 147),
(1, 148),
(1, 149),
(1, 150),
(1, 151),
(1, 152),
(1, 153),
(1, 154),
(1, 155),
(1, 156),
(1, 157),
(1, 158),
(1, 159),
(1, 160),
(1, 161),
(1, 162),
(1, 163),
(1, 164),
(1, 165),
(1, 166),
(1, 167),
(1, 168),
(1, 169),
(1, 170),
(1, 171),
(1, 172),
(1, 173),
(1, 174),
(1, 175),
(1, 176),
(1, 177),
(1, 178),
(1, 179),
(1, 180),
(1, 181),
(1, 182),
(1, 183),
(1, 184),
(1, 185),
(1, 186),
(1, 187),
(1, 188),
(1, 189),
(1, 190),
(1, 191),
(1, 192),
(1, 193),
(1, 194),
(1, 195),
(1, 196),
(1, 197),
(1, 198),
(1, 199),
(1, 200),
(1, 201),
(1, 202),
(1, 203),
(1, 204),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25),
(2, 26),
(2, 27),
(2, 28),
(2, 29),
(2, 30),
(2, 31),
(2, 32),
(2, 37),
(2, 38),
(2, 39),
(2, 40),
(2, 41),
(2, 42),
(2, 43),
(2, 44),
(2, 45),
(2, 46),
(2, 47),
(2, 48),
(2, 49),
(2, 50),
(2, 51),
(2, 52),
(2, 53),
(2, 54),
(2, 55),
(2, 56),
(2, 57),
(2, 58),
(2, 59),
(2, 60),
(2, 61),
(2, 62),
(2, 63),
(2, 64),
(2, 65),
(2, 66),
(2, 67),
(2, 68),
(2, 69),
(2, 70),
(2, 71),
(2, 72),
(2, 73),
(2, 74),
(2, 75),
(2, 76),
(2, 77),
(2, 78),
(2, 79),
(2, 80),
(2, 81),
(2, 82),
(2, 83),
(2, 84),
(2, 85),
(2, 86),
(2, 87),
(2, 88),
(2, 89),
(2, 90),
(2, 91),
(2, 92),
(2, 93),
(2, 94),
(2, 95),
(2, 96),
(2, 97),
(2, 98),
(2, 99),
(2, 100),
(2, 101),
(2, 102),
(2, 103),
(2, 104),
(2, 105),
(2, 106),
(2, 107),
(2, 108),
(2, 109),
(2, 110),
(2, 111),
(2, 112),
(2, 113),
(2, 114),
(2, 115),
(2, 116),
(2, 117),
(2, 118),
(2, 119),
(2, 120),
(2, 121),
(2, 122),
(2, 123),
(2, 124),
(2, 125),
(2, 126),
(2, 127),
(2, 128),
(2, 129),
(2, 130),
(2, 131),
(2, 132),
(2, 133),
(2, 134),
(2, 135),
(2, 136),
(2, 137),
(2, 138),
(2, 139),
(2, 140),
(2, 141),
(2, 142),
(2, 143),
(2, 144),
(2, 145),
(2, 146),
(2, 147),
(2, 148),
(2, 149),
(2, 150),
(2, 151),
(2, 152),
(2, 153),
(2, 154),
(2, 155),
(2, 161),
(2, 162),
(2, 163),
(2, 164),
(2, 165),
(2, 166),
(2, 167),
(2, 168),
(2, 169),
(2, 170),
(2, 171),
(2, 172),
(2, 173),
(2, 174),
(2, 175),
(2, 176),
(2, 177),
(2, 178),
(2, 179),
(2, 180),
(2, 181),
(2, 182),
(2, 183),
(2, 184),
(2, 185),
(2, 186),
(2, 187),
(2, 193),
(2, 194),
(2, 195),
(2, 196),
(2, 197),
(2, 198),
(2, 199),
(2, 200),
(2, 201),
(2, 202),
(2, 203),
(2, 204);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Vendor', 1, 'user_token', '530d6e01ca84da85500ecf6440a887b9edbfbe1ffa3e406adbbcc200c818dfe1', '[\"*\"]', '2021-11-27 12:23:32', '2021-11-27 03:54:49', '2021-11-27 12:23:32'),
(2, 'App\\Models\\Vendor', 1, 'user_token', '7aa335b276de05a153f99bdae043b4f87bdae6955093316245ac6d4c64540ff7', '[\"*\"]', '2021-11-29 08:45:15', '2021-11-27 12:23:20', '2021-11-29 08:45:15');

-- --------------------------------------------------------

--
-- Table structure for table `pincodes`
--

CREATE TABLE `pincodes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pincode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `block_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `mop` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Minimum order price',
  `moq` smallint(5) UNSIGNED NOT NULL DEFAULT 4 COMMENT 'Minimum order quantity',
  `discount` decimal(5,2) DEFAULT 0.00,
  `product_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_sub_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dispatch_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expected Dispatch Time',
  `rrp` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Refund & Return Policy',
  `approval_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `quantity` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `vendor_id`, `name`, `slug`, `description`, `price`, `mop`, `moq`, `discount`, `product_category_id`, `product_sub_category_id`, `dispatch_time`, `rrp`, `approval_status`, `quantity`, `created_at`, `updated_at`, `deleted_at`, `brand_id`) VALUES
(1, 1, 'Name', '9109844778', NULL, '500.00', '5000.00', 5, NULL, NULL, NULL, NULL, NULL, 'PENDING', NULL, '2021-11-27 04:44:05', '2021-11-27 04:57:43', NULL, NULL),
(3, 1, '9109844778', '91098447781', NULL, '500.00', '5000.00', 5, NULL, NULL, NULL, NULL, NULL, 'ACCEPTED', NULL, '2021-11-27 04:46:30', '2021-11-27 04:46:30', NULL, NULL),
(4, 1, '9109844778', '91098447782', NULL, '500.00', '5000.00', 5, NULL, NULL, NULL, NULL, NULL, '0', NULL, '2021-11-27 04:51:14', '2021-11-27 04:51:14', NULL, NULL),
(5, 1, '9109844778', '91098447783', NULL, '500.00', '5000.00', 5, NULL, NULL, NULL, NULL, NULL, '0', NULL, '2021-11-27 04:51:28', '2021-11-27 04:51:28', NULL, NULL),
(6, 1, '9109844778', '91098447784', NULL, '500.00', '5000.00', 5, NULL, NULL, NULL, NULL, NULL, '0', NULL, '2021-11-27 04:52:46', '2021-11-27 04:52:46', NULL, NULL),
(7, 1, '9109844778', '91098447785', NULL, '500.00', '5000.00', 5, NULL, NULL, NULL, NULL, NULL, '0', NULL, '2021-11-27 04:52:56', '2021-11-27 04:52:56', NULL, NULL),
(8, 1, '9109844778', '91098447786', NULL, '500.00', '5000.00', 5, NULL, NULL, NULL, NULL, NULL, '0', NULL, '2021-11-27 04:53:08', '2021-11-27 04:53:08', NULL, NULL),
(9, 1, '9109844778', '91098447787', NULL, '500.00', '5000.00', 5, NULL, NULL, NULL, NULL, NULL, '0', NULL, '2021-11-27 04:53:21', '2021-11-27 04:53:21', NULL, NULL),
(10, 1, '9109844778', '91098447788', NULL, '500.00', '5000.00', 5, NULL, NULL, NULL, NULL, NULL, '0', NULL, '2021-11-27 04:53:45', '2021-11-27 04:53:45', NULL, NULL),
(11, 1, '9109844778', '91098447789', NULL, '500.00', '5000.00', 5, NULL, NULL, NULL, NULL, NULL, '0', NULL, '2021-11-27 04:54:42', '2021-11-27 04:54:42', NULL, NULL),
(12, 1, '9109844778', '910984477810', NULL, '500.00', '5000.00', 5, NULL, NULL, NULL, NULL, NULL, '0', NULL, '2021-11-27 04:55:03', '2021-11-27 04:55:03', NULL, NULL),
(13, 1, '9109844778', '910984477811', NULL, '500.00', '5000.00', 5, NULL, NULL, NULL, NULL, NULL, '0', NULL, '2021-11-27 04:55:27', '2021-11-27 04:55:27', NULL, NULL),
(14, 1, '9109844778', '910984477812', NULL, '500.00', '5000.00', 5, NULL, 1, NULL, NULL, NULL, '0', NULL, '2021-11-27 11:40:10', '2021-11-27 11:40:10', NULL, NULL),
(15, 1, 'Name Test', '910984477813', NULL, '500.00', '5000.00', 5, NULL, NULL, NULL, NULL, NULL, 'PENDING', NULL, '2021-11-27 12:04:19', '2021-11-29 11:07:37', NULL, NULL),
(32, 1, 'Test Product', 'test-product', NULL, '5000.00', '0.00', 5, '41.00', NULL, NULL, '2 days', NULL, 'PENDING', NULL, '2021-11-29 08:43:17', '2021-11-29 08:43:17', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Agri Equipments', 'Agricultural machinery relates to the mechanical structures and devices used in farming or other agriculture. There are many types of such equipment, from hand tools and power tools to tractors and the countless kinds of farm implements that they tow or operate. Diverse arrays of equipment are used in both organic and nonorganic farming. Especially since the advent of mechanized agriculture, agricultural machinery is an indispensable part of how the world is fed', '2021-04-06 22:03:45', '2021-04-06 22:03:45', NULL),
(2, 'Pesticides', 'Pesticides are substances that are meant to control pests.[1] The term pesticide includes all of the following: herbicide, insecticides (which may include insect growth regulators, termiticides, etc.) nematicide, molluscicide, piscicide, avicide, rodenticide, bactericide, insect repellent, animal repellent, antimicrobial, and fungicide.[2] The most common of these are herbicides which account for approximately 80% of all pesticide use.[3] Most pesticides are intended to serve as plant protection products (also known as crop protection products), which in general, protect plants from weeds, fungi, or insects. As an example - The fungus Alternaria is used to combat the Aquatic weed, Salvinia', '2021-04-06 22:04:46', '2021-04-06 22:04:46', NULL),
(3, 'Fertilizers', 'A fertilizer (American English) or fertiliser (British English; see spelling differences) is any material of natural or synthetic origin that is applied to soil or to plant tissues to supply plant nutrients. Fertilizers may be distinct from liming materials or other non-nutrient soil amendments. Many sources of fertilizer exist, both natural and industrially produced.[1] For most modern agricultural practices, fertilization focuses on three main macro nutrients: Nitrogen (N), Phosphorus (P), and Potassium (K) with occasional addition of supplements like rock dust for micronutrients. Farmers apply these fertilizers in a variety of ways: through dry or pelletized or liquid application processes, using large agricultural equipment or hand-tool methods', '2021-04-06 22:05:43', '2021-04-06 22:05:43', NULL),
(4, 'Seeds', 'A seed is an embryonic plant enclosed in a protective outer covering. The formation of the seed is part of the process of reproduction in seed plants, the spermatophytes, including the gymnosperm and angiosperm plants', '2021-04-06 22:06:37', '2021-04-06 22:06:37', NULL),
(5, 'Sprayers', 'A sprayer is a device used to spray a liquid, where sprayers are commonly used for projection of water, weed killers, crop performance materials, pest maintenance chemicals, as well as manufacturing and production line ingredients. In agriculture, a sprayer is a piece of equipment that is used to apply herbicides, pesticides, and fertilizers on agricultural crops. Sprayers range in size from man-portable units (typically backpacks with spray guns) to trailed sprayers that are connected to a tractor, to self-propelled units similar to tractors, with boom mounts of 4–30 feet up to 60–151 feet in length depending on engineering design for tractor and land size', '2021-04-06 22:08:02', '2021-04-06 22:08:02', NULL),
(6, 'Organic Products', 'An organic product is made from materials produced by organic agriculture. There are different types of organic products. However organic product is more known for food items like organic grocery, organic vegetables, organic certified food etc. Most appropriately organic products can be explained as any products that is made or cultivated organically should be treated as an organic product. Most of the country has very strict food safety and security guidelines to protect consumers from consuming harmful products. Most of the country has its own standard to define products as organic. USA uses USDA certification - NOP National Organic Program to defined a cultivated products as organic. Indian Organic - NPOP (National Program for Organic Production). According to USDA, in order for a product to be considered organic, organic standards must be met. Operations involving these organic products must be \"protecting natural resources, conserving biodiversity, and using only approved substances.\"[1]\r\n\r\nTo be marketed as \"organic\" products require certification and must comply with certain guidelines. In the United States the National List of Allowed and Prohibited Substances details synthetic and non-synthetic substances that can be used in the process of producing organic products. This list involves specific substances that can be used to produce organic material involving crops and livestock', '2021-04-06 22:09:08', '2021-04-06 22:09:08', NULL),
(7, 'Micronutrients', 'Micronutrients are essential elements that are used by plants in small quantities. For most micronutrients, crop uptake is less than one pound per acre. In spite of this low requirement, critical plant functions are limited if micronutrients are unavailable, resulting in plant abnormalities, reduced growth and lower yield. In such cases, expensive, high requirement crop inputs such as nitrogen and water may be wasted. Because of higher yields, higher commodity prices and higher costs of crop inputs, growers are reviewing all potential barriers to top grain production, including micronutrient deficiencies. This Crop Insights will discuss general micronutrient requirements, deficiency symptoms, soil and plant sampling, and fertilization practices. Future Crop Insights articles will discuss specific crops, their micronutrient or secondary nutrient requirements and management considerations.', '2021-04-10 06:13:50', '2021-04-10 06:13:50', NULL),
(8, 'Nursery Garden', 'Nursery, place where plants are grown for transplanting, for use as stock for budding and grafting, or for sale. Commercial nurseries produce and distribute woody and herbaceous plants, including ornamental trees, shrubs, and bulb crops. While most nursery-grown plants are ornamental, the nursery business also includes fruit plants and certain perennial vegetables used in home gardens (e.g., asparagus, rhubarb). Some nurseries are kept for the propagation of native plants for ecological restoration. Greenhouses may be used for tender plants or to keep production going year round, but nurseries most commonly consist of shaded or exposed areas outside. Plants are commonly cultivated from seed or from cuttings and are often grown in pots or other temporary containers.', '2021-04-10 06:26:52', '2021-04-10 06:26:52', NULL),
(9, 'Micronutrient Mixture', 'Micronutrient Mixture of zinc sulphate, copper sulphate, magnesium sulphate, manganese sulphate, boron, ferrous sulphate and amonium molybdate in perfect percentage and in scientific methrod , micronutrient is essential for all plants specific micro nutrients essential for avoiding and curing the micronutrinet deficiency, all micronutrient element are blended in perfect combination.', '2021-04-10 08:20:47', '2021-04-10 08:21:20', '2021-04-10 08:21:20'),
(10, 'new category', NULL, '2021-05-31 07:54:29', '2021-05-31 07:54:29', NULL),
(11, 'Test Franchisee', NULL, '2021-05-31 10:07:12', '2021-05-31 10:07:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_options`
--

CREATE TABLE `product_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `option` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` smallint(5) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_options`
--

INSERT INTO `product_options` (`id`, `product_id`, `option`, `unit`, `quantity`, `created_at`, `updated_at`) VALUES
(2, 11, NULL, NULL, NULL, '2021-11-27 04:54:42', '2021-11-27 04:54:42'),
(3, 12, NULL, NULL, NULL, '2021-11-27 04:55:03', '2021-11-27 04:55:03'),
(4, 13, 'Blue', NULL, NULL, '2021-11-27 04:55:27', '2021-11-27 04:55:27'),
(5, 13, 'Red', NULL, NULL, '2021-11-27 04:55:27', '2021-11-27 04:55:27'),
(8, 1, 'Blue', NULL, NULL, '2021-11-27 04:57:43', '2021-11-27 04:57:43'),
(9, 1, 'Red', NULL, NULL, '2021-11-27 04:57:43', '2021-11-27 04:57:43'),
(10, 14, 'Blue', NULL, NULL, '2021-11-27 11:40:11', '2021-11-27 11:40:11'),
(11, 14, 'Red', NULL, NULL, '2021-11-27 11:40:11', '2021-11-27 11:40:11'),
(14, 15, 'Blue', NULL, NULL, '2021-11-27 12:05:06', '2021-11-27 12:05:06'),
(15, 15, 'Red1', NULL, NULL, '2021-11-27 12:05:06', '2021-11-29 11:07:37');

-- --------------------------------------------------------

--
-- Table structure for table `product_prices`
--

CREATE TABLE `product_prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` smallint(5) UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `discount` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_product_tag`
--

CREATE TABLE `product_product_tag` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_price_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unit_quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_sub_categories`
--

CREATE TABLE `product_sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_sub_categories`
--

INSERT INTO `product_sub_categories` (`id`, `name`, `product_category_id`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Agri Tools', 1, 'List of Modern Equipment and Farm Tools\r\nThe Monoculture. The tiller is a type of agricultural machinery of a single axis. ...\r\nShovel. This element made of tough and sharp sheet metal. ...\r\nWheelbarrow.\r\nThe Harvester.\r\nSprinkler.\r\nSeeder and fertilizer.\r\nBaler', '2021-04-06 22:11:44', '2021-04-06 22:11:44', NULL),
(2, 'Bio Fertilizers', 3, 'A biofertilizer (also bio-fertilizer) is a substance which contains living micro-organisms which, when applied to seeds, plant surfaces, or soil, colonize the rhizosphere or the interior of the plant and promotes growth by increasing the supply or availability of primary nutrients to the host plant.[1] Biofertilizers add nutrients through the natural processes of nitrogen fixation, solubilizing phosphorus, and stimulating plant growth through the synthesis of growth-promoting substances. The microorganisms in biofertilizers restore the soil\'s natural nutrient cycle and build soil organic matter. Through the use of biofertilizers, healthy plants can be grown, while enhancing the sustainability and the health of the soil. Biofertilizers can be expected to reduce the use of synthetic fertilizers and pesticides, but they are not yet able to replace their use. Since they play several roles, a preferred scientific term for such beneficial bacteria is \"plant-growth promoting rhizobacteria\" (PGPR).', '2021-04-06 22:13:13', '2021-04-06 22:13:27', NULL),
(3, 'Agro Industry Equipment', 1, 'The agricultural equipment or Implements or tools which are to be used in farming may be bigger one like carts, bullock driven ploughs, tractor driven plough, transplanter, tractor, harvester, fertiliser applier, ground implements like cultivator, rotovator, puddler etc., and smaller agricultural equipments which can also be called as hand tools like kurpi, hand digger, weeders, scoop, cutter, sickle, saws, secateurs, sheers, clippers, spades, etc.', '2021-04-10 07:01:15', '2021-04-10 07:01:15', NULL),
(4, 'Agro Shade Nets', 1, 'These nets are made from 100% virgin HDPE and are treated with color master batches and Ultra-violet (UV) stabilizers. These nets are classified by the amount of sunlight that can pass through it. These products are mainly used in applications related to crop protection and agriculture.', '2021-04-10 07:06:20', '2021-04-10 07:06:20', NULL),
(5, 'Power Sprayers', 1, 'A power sprayer used to apply a highly concentrated pesticide in highly dispersed form usually by delivering it into a strong air blast generated by fans or blowers.', '2021-04-10 07:08:39', '2021-04-10 07:08:39', NULL),
(6, 'Brushcutter', 1, 'A brushcutter (also called a brush saw or clearing saw) is a powered garden or agricultural tool used to trim weeds, small trees, and other foliage not accessible by a lawn mower or rotary mower. Various blades or trimmer heads can be attached to the machine for specific applications.', '2021-04-10 07:10:12', '2021-04-10 07:10:12', NULL),
(7, 'Chaff Cutter', 1, 'A chaff cutter is a mechanical device for cutting straw or hay into small pieces before being mixed together with other forage and fed to horses and cattle. This aids the animal\'s digestion and prevents animals from rejecting any part of their food.', '2021-04-10 07:31:30', '2021-04-10 07:31:30', NULL),
(8, 'Chainsaw', 1, 'A chainsaw (or chain saw[1]) is a portable gasoline-, electric-, or battery-powered saw that cuts with a set of teeth attached to a rotating chain driven along a guide bar. It is used in activities such as tree felling, limbing, bucking, pruning, cutting firebreaks in wildland fire suppression, and harvesting of firewood. Chainsaws with specially designed bar-and-chain combinations have been developed as tools for use in chainsaw art and chainsaw mills.', '2021-04-10 07:33:17', '2021-04-10 07:33:17', NULL),
(9, 'Drip Irrigation', 1, 'Drip irrigation is a type of micro-irrigation system that has the potential to save water and nutrients by allowing water to drip slowly to the roots of plants, either from above the soil surface or buried below the surface. The goal is to place water directly into the root zone and minimize evaporation.', '2021-04-10 07:35:44', '2021-04-10 07:35:44', NULL),
(10, 'Mini Tiller', 1, 'Mini tillers are a new type of small agricultural tillers or cultivators used by farmers or homeowners. These are also known as power tillers or garden tillers. Compact, powerful and, most importantly, inexpensive, these agricultural rotary tillers are providing alternatives to four-wheel tractors and in the small farmers\' fields in developing countries are more economical than four-wheel tractors.', '2021-04-10 07:37:39', '2021-04-10 07:39:49', '2021-04-10 07:39:49'),
(11, 'Mini Tiller', 1, 'Mini tillers are a new type of small agricultural tillers or cultivators used by farmers or homeowners. These are also known as power tillers or garden tillers. Compact, powerful and, most importantly, inexpensive, these agricultural rotary tillers are providing alternatives to four-wheel tractors and in the small farmers\' fields in developing countries are more economical than four-wheel tractors.', '2021-04-10 07:37:45', '2021-04-10 07:37:45', NULL),
(12, 'Mulching Film', 1, 'Mulch films are used to modify soil temperature, limit weed growth, prevent moisture loss, and improve crop yield as well as precocity.', '2021-04-10 07:39:32', '2021-04-10 07:39:58', '2021-04-10 07:39:58'),
(13, 'Mulching Film', 1, 'Mulch films are used to modify soil temperature, limit weed growth, prevent moisture loss, and improve crop yield as well as precocity.', '2021-04-10 07:39:37', '2021-04-10 07:39:37', NULL),
(14, 'Power Tiller', 1, 'Power Tiller or Heavy Tiller is an innovative machine used for cultivation, tillage, showing and weeding that contains a self-set of blades set up with a powerful engine. Buy Power Tiller is the perfect option to increase farm productivity. \r\n\r\nPower tiller equipment is two-wheeled farm equipment that fitted with a rotary tiller performs smoothly all farm operations. It prepares the soil, plants and sowing seeds, spraying fertilizer. Farm power tiller provides efficient working in paddy and wet fields.', '2021-04-10 07:41:36', '2021-04-10 07:41:36', NULL),
(15, 'Power Weeder', 1, 'Power Weeders are machines used for removing weeds, stirring and pulverizing the soil and for loosening the soil after the crop begins to grow. Power Weeders are manufactured using high quality raw materials with the help of latest technology. These machines are widely used for weeding cotton, tomato, tapioca, paddy, sugarcane, pulses and various other plant fields.', '2021-04-10 07:44:52', '2021-04-10 07:44:52', NULL),
(16, 'Pumps', 1, 'A pump is a device that moves fluids (liquids or gases), or sometimes slurries, by mechanical action, typically converted from electrical energy into hydraulic energy. Pumps can be classified into three major groups according to the method they use to move the fluid: direct lift, displacement, and gravity pumps.', '2021-04-10 07:47:10', '2021-04-10 07:47:10', NULL),
(17, 'Rotavator', 1, 'Rotavators are potent pieces of gardening machinery, often used in allotments and fields, to break up, churn and aerate the soil before planting seeds and bulbs or laying turf. Rotavators uses a set of blades or rotors which twist and break through the soil.', '2021-04-10 07:48:49', '2021-04-10 07:48:49', NULL),
(18, 'Seedling Trays', 1, 'A seed starting tray is a gardening tool specifically designed to hold multiple seeds, starting from the germination stage, until the seedlings are ready for transplantation. Using such a tray ensures better nutrient availability for each seed, and eliminates the need for multiple plantings.', '2021-04-10 07:51:35', '2021-04-10 07:51:35', NULL),
(19, 'Seeds Drill', 1, 'A seed drill is a long iron tube having a funnel at the top. The seed drill is tied to back of the plough and seeds are put into the funnel of the seed drill.As the plough makes furrows in the soil,the seed from seed drill are gradually released and sown into the soil.', '2021-04-10 07:53:09', '2021-04-10 07:53:09', NULL),
(20, 'Starters', 1, 'A motor starter is an electrical device that is used to start & stop a motor safely. Similar to a relay, the motor starter switches the power ON/OFF & unlike a relay, it also provides a low voltage & overcurrent protection.', '2021-04-10 07:55:37', '2021-04-10 07:55:37', NULL),
(21, 'Tarpaulin', 1, 'A tarpaulin or tarp is a large sheet of strong, flexible, water-resistant or waterproof material, often cloth such as canvas or polyester coated with polyurethane, or made of plastics such as polyethylene. Tarpaulins often have reinforced grommets at the corners and along the sides to form attachment points for rope, allowing them to be tied down or suspended.\r\n\r\nInexpensive modern tarpaulins are made from woven polyethylene; this material is so associated with tarpaulins that it has become colloquially known in some quarters as polytarp.', '2021-04-10 07:57:26', '2021-04-10 07:57:26', NULL),
(22, 'Transplanter', 1, 'A transplanter is an agricultural machine used for transplanting seedlings to the field. This is very important as it reduces the time taken to transplant seedlings (when compared to manual transplanting), thus allowing more time for harvesting. It also reduces the use of manual energy.', '2021-04-10 07:58:31', '2021-04-10 07:58:31', NULL),
(23, 'Tree Guard', 1, 'A Tree guard, is a type of plastic shelter used to nurture trees in the early stages of their growth.', '2021-04-10 08:00:50', '2021-04-10 08:01:08', '2021-04-10 08:01:08'),
(24, 'Tree Guard', 1, 'A Tree guard, is a type of plastic shelter used to nurture trees in the early stages of their growth.', '2021-04-10 08:00:54', '2021-04-10 08:01:05', '2021-04-10 08:01:05'),
(25, 'Tree Guard', 1, 'A Tree guard, is a type of plastic shelter used to nurture trees in the early stages of their growth.', '2021-04-10 08:00:59', '2021-04-10 08:00:59', NULL),
(26, 'Individual Micronutrient', 7, NULL, '2021-04-10 08:02:53', '2021-04-10 08:02:53', NULL),
(27, 'Micronutrient Mixture', 7, 'Micronutrient Mixture of zinc sulphate, copper sulphate, magnesium sulphate, manganese sulphate, boron, ferrous sulphate and amonium molybdate in perfect percentage and in scientific methrod , micronutrient is essential for all plants specific micro nutrients essential for avoiding and curing the micronutrinet deficiency, all micronutrient element are blended in perfect combination.', '2021-04-10 08:21:14', '2021-04-10 08:21:14', NULL),
(28, 'Micronutrients Spray', 1, 'Micronutrients Spray foliar spay containing all the essential micronutrients like zinc, ferrous, magnesium , manganese, copper, boron, molybdate , Plant specific micro nutrients essential for avoiding and curing the micronutrinet deficiency, all micronutrient element are blended in perfect combination, chemical micronutrient, micronutrinet powder, micronutrient liquid, micronutrient for foliar spray, micronutrient for foliar application.', '2021-04-10 08:22:25', '2021-04-10 08:22:25', NULL),
(29, 'Grow Bags', 8, 'A growbag is a large plastic bag filled with a growing medium and used for growing plants, usually tomatoes or other salad crops. The growing medium is usually based on a soilless organic material such as peat, coir, composted green waste, composted bark or composted wood chips, or a mixture of these. Various nutrients are added, sufficient for one season\'s growing, so frequently only planting and watering are required of the end-user. Planting is undertaken by first laying the bag flat on the floor or bench of the growing area, then cutting access holes in the uppermost surface, into which the plants are inserted.', '2021-04-10 08:27:00', '2021-04-10 08:27:00', NULL),
(30, 'Net Pots', 8, 'Net pots made from premium quality plastic that are 100% virgin plastic. These net pots can be used for all kinds of hydroponic systems.', '2021-04-10 08:28:59', '2021-04-10 08:28:59', NULL),
(31, 'Nursery Seeds', 8, NULL, '2021-04-10 08:30:55', '2021-04-10 08:30:55', NULL),
(32, 'Pots & Planters', 8, NULL, '2021-04-10 08:32:04', '2021-04-10 08:32:12', '2021-04-10 08:32:12'),
(33, 'Pots & Planters', 8, NULL, '2021-04-10 08:32:07', '2021-04-10 08:32:07', NULL),
(34, 'Potting Soil', 8, 'Potting soil, also known as potting mix or miracle soil, is a medium in which to grow plants, herbs and vegetables in a pot or other durable container.', '2021-04-10 08:33:22', '2021-04-10 08:33:22', NULL),
(35, 'Sprayers', 8, 'A sprayer is a device used to spray a liquid, where sprayers are commonly used for projection of water, weed killers, crop performance materials, pest maintenance chemicals, as well as manufacturing and production line ingredients.', '2021-04-10 08:34:56', '2021-04-10 08:34:56', NULL),
(36, 'Live Bacteria Series', 6, NULL, '2021-04-10 08:36:39', '2021-04-10 08:36:39', NULL),
(37, 'Organic Coated Granules', 6, NULL, '2021-04-10 08:37:49', '2021-04-10 08:37:49', NULL),
(38, 'Organic Neem Products', 6, NULL, '2021-04-10 08:38:54', '2021-04-10 08:38:54', NULL),
(39, 'Organic PGR Technicals', 6, NULL, '2021-04-10 08:39:56', '2021-04-10 08:39:56', NULL),
(40, 'Organic Premium PGR', 6, NULL, '2021-04-10 08:40:48', '2021-04-10 08:40:48', NULL),
(41, 'Organic Stimulant', 6, NULL, '2021-04-10 08:41:39', '2021-04-10 08:41:39', NULL),
(42, 'Biological Control', 2, 'Biological control or biocontrol is a method of controlling pests such as insects, mites, weeds and plant diseases using other organisms. It relies on predation, parasitism, herbivory, or other natural mechanisms, but typically also involves an active human management role.', '2021-04-10 08:44:53', '2021-04-10 08:44:53', NULL),
(43, 'HouseHold Insecticides', 2, 'Household insecticides are the chemicals used to destroy or inactivate insects from houses. Household insecticides include the natural and synthetic substances applied to the skin, clothes and the surfaces of houses to control the growth of insects or roaches.', '2021-04-10 08:46:43', '2021-04-10 08:46:43', NULL),
(44, 'Insecticides', 2, 'Insecticides are substances used to kill insects. They include ovicides and larvicides used against insect eggs and larvae, respectively. Insecticides are used in agriculture, medicine, industry and by consumers.', '2021-04-10 08:48:09', '2021-04-10 08:48:09', NULL),
(45, 'Fungicides', 2, 'Fungicides are biocidal chemical compounds or biological organisms used to kill parasitic fungi or their spores. A fungistatic inhibits their growth. Fungi can cause serious damage in agriculture, resulting in critical losses of yield, quality, and profit.', '2021-04-10 08:49:20', '2021-04-10 08:49:20', NULL),
(46, 'Herbicides', 2, 'A herbicide is a pesticide used to kill unwanted plants. Selective herbicides kill certain targets while leaving the desired crop relatively unharmed. Some of these act by interfering with the growth of the weed and are often based on plant hormones.', '2021-04-10 08:50:20', '2021-04-10 08:50:20', NULL),
(47, 'Biopesticide', 2, 'Biopesticides, a contraction of \'biological pesticides\', include several types of pest management intervention: through predatory, parasitic, or chemical relationships. The term has been associated historically with biological pest control – and by implication, the manipulation of living organisms.', '2021-04-10 08:51:51', '2021-04-10 08:51:51', NULL),
(48, 'Cotton Seeds', 4, 'Cottonseed is the seed of the cotton plant.', '2021-04-10 08:53:29', '2021-04-10 08:53:29', NULL),
(49, 'Field Crops Seeds', 4, 'Field crops are grown on a large scale for consumption purposes.', '2021-04-10 08:55:52', '2021-04-10 08:55:52', NULL),
(50, 'Flower Seeds', 4, 'Flower Seeds are the byproduct of a flower or flower-like structure. Sometimes seeds are encased in fruits, but not always.', '2021-04-10 12:16:49', '2021-04-10 12:16:49', NULL),
(51, 'Home / kitchen Garden Seeds', 4, 'Kitchen garden is the growing of fruits and vegetables at the backyard of house by using kitchen waste water. Otherwise called as Home garden or Nutrition garden or Kitchen gardening or Vegetable gardening. Advantages of Kitchen garden : Supply fresh fruits and vegetables high in nutritive value.', '2021-04-10 12:18:41', '2021-04-10 12:18:41', NULL),
(52, 'Other Seeds', 4, 'All other type of seeds.', '2021-04-10 12:20:07', '2021-04-10 12:20:07', NULL),
(53, 'Vegetable Seeds', 4, 'Edible seeds are also known as legumes. Apart from sweet corn, seeds usually grow in pods which are sometimes eaten along with the seeds. Examples are peas, beans, snow peas (mangetout), sprouted beans and seeds and sweet corn.', '2021-04-10 12:22:37', '2021-04-10 12:22:37', NULL),
(54, 'Battery Sprayers', 5, 'Battery Powered Disinfectant Sprayer is used to clean and disinfect frequently touched surfaces such as tables, doorknobs, light switches, etc.  These sprayers are also equipped with mopping features and extendable arms to reach hidden areas and clean comprehensively.', '2021-04-10 12:26:25', '2021-04-10 12:26:25', NULL),
(55, 'Hand Garden Sprayers', 5, 'A sprayer is a device used to spray a liquid, where sprayers are commonly used for projection of water, weed killers, crop performance materials, pest maintenance chemicals, as well as manufacturing and production line ingredients.', '2021-04-10 12:27:18', '2021-04-10 12:27:18', NULL),
(56, 'Manual Knapsack Sprayers', 5, 'A sprayer is a device used to spray a liquid, where sprayers are commonly used for projection of water, weed killers, crop performance materials, pest maintenance chemicals, as well as manufacturing and production line ingredients.', '2021-04-10 12:28:45', '2021-04-10 12:29:09', NULL),
(57, 'Petrol Power Sprayers', 5, 'All the sprayers which impart the mechanical energy developed by an I.C. Engine, on the spray fluid before spraying is called as a power sprayer. The most commonly used type of power sprayer in India is a gaseous energy type knapsack sprayer.', '2021-04-10 12:30:45', '2021-04-10 12:30:45', NULL),
(58, 'Bio Fertilisers', 3, 'Biofertilizers are the substance that contains microbes, which helps in promoting the growth of plants and trees by increasing the supply of essential nutrients to the plants. It comprises living organisms which include mycorrhizal fungi, blue-green algae, and bacteria.', '2021-04-10 12:33:02', '2021-04-10 12:33:02', NULL),
(59, 'Secondary Fertilisers', 3, 'Sulphur (S), magnesium (Mg) and calcium (Ca) are essential plant nutrients. They are called “secondary” nutrients because plants require them in smaller quantities than nitrogen (N), phosphorus (P), and potassium (K).', '2021-04-10 12:34:29', '2021-04-10 12:34:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_tags`
--

CREATE TABLE `product_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `push_notifications`
--

CREATE TABLE `push_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `push_notification_user`
--

CREATE TABLE `push_notification_user` (
  `push_notification_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `star` tinyint(3) UNSIGNED NOT NULL COMMENT 'star between 1 to 5',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', NULL, NULL, NULL),
(2, 'Franchisee', NULL, NULL, NULL),
(3, 'Help Center', NULL, NULL, NULL),
(4, 'Vendor', NULL, NULL, NULL),
(5, 'Logistics', NULL, NULL, NULL),
(6, 'Moderator', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_admin`
--

CREATE TABLE `role_admin` (
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_admin`
--

INSERT INTO `role_admin` (`admin_id`, `role_id`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `role_logistics`
--

CREATE TABLE `role_logistics` (
  `logistics_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_vendor`
--

CREATE TABLE `role_vendor` (
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `setting_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `setting_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `about_us` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_and_c` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privacy_policy` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `slider_items`
--

CREATE TABLE `slider_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slider_id` bigint(20) UNSIGNED NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Andaman and Nicobar Island (UT)', 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(2, 'Andhra Pradesh', 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(3, 'Arunachal Pradesh', 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(4, 'Assam', 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(5, 'Bihar', 1, '2021-11-27 03:37:53', '2021-11-27 03:37:53', NULL),
(6, 'Chandigarh (UT)', 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(7, 'Chhattisgarh', 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(8, 'Dadra and Nagar Haveli (UT)', 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(9, 'Daman and Diu (UT)', 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(10, 'Delhi (NCT)', 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(11, 'Goa', 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(12, 'Gujarat', 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(13, 'Haryana', 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(14, 'Himachal Pradesh', 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(15, 'Jammu and Kashmir', 1, '2021-11-27 03:37:54', '2021-11-27 03:37:54', NULL),
(16, 'Jharkhand', 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(17, 'Karnataka', 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(18, 'Kerala', 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(19, 'Lakshadweep (UT)', 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(20, 'Madhya Pradesh', 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(21, 'Maharashtra', 1, '2021-11-27 03:37:55', '2021-11-27 03:37:55', NULL),
(22, 'Manipur', 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(23, 'Meghalaya', 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(24, 'Mizoram', 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(25, 'Nagaland', 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(26, 'Odisha', 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(27, 'Puducherry (UT)', 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(28, 'Punjab', 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(29, 'Rajasthan', 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(30, 'Sikkim', 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(31, 'Tamil Nadu', 1, '2021-11-27 03:37:56', '2021-11-27 03:37:56', NULL),
(32, 'Telangana', 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(33, 'Tripura', 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(34, 'Uttarakhand', 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(35, 'Uttar Pradesh', 1, '2021-11-27 03:37:57', '2021-11-27 03:37:57', NULL),
(36, 'West Bengal', 1, '2021-11-27 03:37:58', '2021-11-27 03:37:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `transaction_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unit_types`
--

CREATE TABLE `unit_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved` tinyint(1) DEFAULT 0,
  `verified` tinyint(1) DEFAULT 0,
  `verified_at` datetime DEFAULT NULL,
  `verification_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_verified_at` datetime DEFAULT NULL,
  `referral_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `device_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `pincode_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `block_id` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `area_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_alerts`
--

CREATE TABLE `user_alerts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `alert_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alert_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE `user_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_user_alert`
--

CREATE TABLE `user_user_alert` (
  `user_alert_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'MANUFACTURER, WHOLESALER',
  `email_verified_at` datetime DEFAULT NULL,
  `mobile_verified_at` datetime DEFAULT NULL,
  `verification_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_verification_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved` tinyint(1) DEFAULT 0,
  `verified` tinyint(1) DEFAULT 0,
  `verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `email`, `mobile`, `password`, `user_type`, `email_verified_at`, `mobile_verified_at`, `verification_token`, `mobile_verification_token`, `remember_token`, `approved`, `verified`, `verified_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Company', 'homver30@gmail.com', '9109844778', '$2y$10$ip0a06qc.510F5TPkU9Fu.Ex2sawWTaiCx.so/5cdfvd43wlh6yU.', 'WHOLESALER', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, '2021-11-27 03:54:49', '2021-11-30 01:31:12', NULL),
(2, NULL, 'homver30@gmail1.com', '9109844777', '$2y$10$xdPuaVJbSUSXcP6.BLMJ2OhXcX6GvXYVwLf0JY9mbH7PejvPCCR.S', 'MANUFACTURER', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2021-11-29 06:23:39', '2021-11-30 11:12:56', NULL),
(3, 'Company', 'test@test.com', '1234567890', '$2y$10$EDxUqqgzdNajSzzo5Jt3Ou26yMtcimYsS7DM.b0ZMvqra46XFUpcu', 'MANUFACTURER', NULL, NULL, NULL, NULL, NULL, 1, 1, '2021-11-30 08:11:51', '2021-11-30 07:15:50', '2021-11-30 08:11:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_profiles`
--

CREATE TABLE `vendor_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `representative_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_pincode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_address_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pickup_district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pickup_pincode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_holder_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ifsc_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_profiles`
--

INSERT INTO `vendor_profiles` (`id`, `vendor_id`, `company_name`, `representative_name`, `email`, `mobile`, `gst_number`, `pan_number`, `billing_address`, `billing_address_two`, `billing_state_id`, `billing_district_id`, `billing_pincode`, `pickup_address`, `pickup_address_two`, `pickup_state_id`, `pickup_district_id`, `pickup_pincode`, `bank_name`, `account_number`, `account_holder_name`, `ifsc_code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Company', 'homver30@gmail.com', 'homver30@gmail.com', '9109844778', 'homver30@gmail.com', '9109844778', '9109844778', 'homver30@gmail.com', 2, 7, '25554', '9109844778', 'homver30@gmail.com', 1, 7, '25554', 'State Bank of India', '9109844778', 'Homesh', 'IFSCCODE', '2021-11-27 03:56:06', '2021-11-30 02:29:46', NULL),
(2, 2, 'company', 'representative', 'homver30@gmail1.com', '9109844777', 'gstin', 'pnnnnn', 'address', NULL, 1, 1, '495555', 'address', NULL, 1, 2, '455555', 'bank', '12345678', 'acoun', 'ifsc', '2021-11-29 06:23:39', '2021-11-29 06:23:39', NULL),
(3, 3, 'Company', 'Representative', 'test@test.com', '1234567890', 'GSTIN', 'PAN', 'Address', NULL, 4, 41, '455555', 'Address', NULL, 2, 41, '78944', 'Bank', '123456', 'Homesh', 'IFSCCODE', '2021-11-30 07:15:50', '2021-11-30 08:11:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_price_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_mobile_unique` (`mobile`);

--
-- Indexes for table `admin_admin_alert`
--
ALTER TABLE `admin_admin_alert`
  ADD KEY `admin_alert_id_fk_2924387` (`admin_alert_id`),
  ADD KEY `admin_id_fk_2924387` (`admin_id`);

--
-- Indexes for table `admin_alerts`
--
ALTER TABLE `admin_alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `areas_pincode_id_foreign` (`pincode_id`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_fk_2993335` (`user_id`);

--
-- Indexes for table `article_article_tag`
--
ALTER TABLE `article_article_tag`
  ADD KEY `article_id_fk_2995560` (`article_id`),
  ADD KEY `article_tag_id_fk_2995560` (`article_tag_id`);

--
-- Indexes for table `article_comments`
--
ALTER TABLE `article_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_fk_2995574` (`user_id`),
  ADD KEY `article_fk_2995580` (`article_id`);

--
-- Indexes for table `article_likes`
--
ALTER TABLE `article_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_fk_2995642` (`user_id`),
  ADD KEY `article_fk_2995643` (`article_id`);

--
-- Indexes for table `article_tags`
--
ALTER TABLE `article_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_vendor_id_foreign` (`vendor_id`);

--
-- Indexes for table `bill_items`
--
ALTER TABLE `bill_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_items_bill_id_foreign` (`bill_id`),
  ADD KEY `bill_items_product_id_foreign` (`product_id`),
  ADD KEY `bill_items_product_price_id_foreign` (`product_price_id`);

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blocks_district_id_foreign` (`district_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_fk_2939007` (`order_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_product_price_id_foreign` (`product_price_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Indexes for table `content_categories`
--
ALTER TABLE `content_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_category_content_page`
--
ALTER TABLE `content_category_content_page`
  ADD KEY `content_page_id_fk_2924404` (`content_page_id`),
  ADD KEY `content_category_id_fk_2924404` (`content_category_id`);

--
-- Indexes for table `content_pages`
--
ALTER TABLE `content_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_page_content_tag`
--
ALTER TABLE `content_page_content_tag`
  ADD KEY `content_page_id_fk_2924405` (`content_page_id`),
  ADD KEY `content_tag_id_fk_2924405` (`content_tag_id`);

--
-- Indexes for table `content_tags`
--
ALTER TABLE `content_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `districts_state_id_foreign` (`state_id`);

--
-- Indexes for table `enquiries`
--
ALTER TABLE `enquiries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendant_fk_3167399` (`attendant_id`);

--
-- Indexes for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_questions`
--
ALTER TABLE `faq_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_fk_2924418` (`category_id`),
  ADD KEY `created_by_fk_2927060` (`created_by_id`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_fk_2995632` (`user_id`),
  ADD KEY `follow_fk_2995633` (`follow_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoices_invoice_number_unique` (`invoice_number`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `logistics`
--
ALTER TABLE `logistics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `logistics_email_unique` (`email`),
  ADD UNIQUE KEY `logistics_mobile_unique` (`mobile`);

--
-- Indexes for table `master_stocks`
--
ALTER TABLE `master_stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `master_stocks_product_id_foreign` (`product_id`),
  ADD KEY `master_stocks_product_price_id_foreign` (`product_price_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_fk_2927119` (`user_id`),
  ADD KEY `address_fk_2998788` (`address_id`),
  ADD KEY `orders_transaction_id_foreign` (`transaction_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_product_price_id_foreign` (`product_price_id`),
  ADD KEY `order_items_user_id_foreign` (`user_id`);

--
-- Indexes for table `otps`
--
ALTER TABLE `otps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD KEY `role_id_fk_2902509` (`role_id`),
  ADD KEY `permission_id_fk_2902509` (`permission_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pincodes`
--
ALTER TABLE `pincodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pincodes_block_id_foreign` (`block_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_vendor_id_foreign` (`vendor_id`),
  ADD KEY `products_product_category_id_foreign` (`product_category_id`),
  ADD KEY `products_product_sub_category_id_foreign` (`product_sub_category_id`),
  ADD KEY `brand_fk_2974094` (`brand_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_options`
--
ALTER TABLE `product_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_options_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_prices`
--
ALTER TABLE `product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_prices_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_product_tag`
--
ALTER TABLE `product_product_tag`
  ADD KEY `product_id_fk_2902540` (`product_id`),
  ADD KEY `product_tag_id_fk_2902540` (`product_tag_id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_stocks_vendor_id_foreign` (`vendor_id`),
  ADD KEY `product_stocks_product_id_foreign` (`product_id`),
  ADD KEY `product_stocks_product_price_id_foreign` (`product_price_id`);

--
-- Indexes for table `product_sub_categories`
--
ALTER TABLE `product_sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_sub_categories_product_category_id_foreign` (`product_category_id`);

--
-- Indexes for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `push_notifications`
--
ALTER TABLE `push_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `push_notification_user`
--
ALTER TABLE `push_notification_user`
  ADD KEY `push_notification_user_push_notification_id_foreign` (`push_notification_id`),
  ADD KEY `push_notification_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_vendor_id_foreign` (`vendor_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_admin`
--
ALTER TABLE `role_admin`
  ADD KEY `admin_id_fk_custom_01` (`admin_id`),
  ADD KEY `role_id_fk_custom_02` (`role_id`);

--
-- Indexes for table `role_logistics`
--
ALTER TABLE `role_logistics`
  ADD KEY `logistics_id_fk_001` (`logistics_id`),
  ADD KEY `role_id_fk_0092` (`role_id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD KEY `user_id_fk_2902518` (`user_id`),
  ADD KEY `role_id_fk_2902518` (`role_id`);

--
-- Indexes for table `role_vendor`
--
ALTER TABLE `role_vendor`
  ADD KEY `vendor_id_fk_001` (`vendor_id`),
  ADD KEY `role_id_fk_0095` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider_items`
--
ALTER TABLE `slider_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slider_items_slider_id_foreign` (`slider_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unit_types`
--
ALTER TABLE `unit_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_mobile_unique` (`mobile`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_fk_2998741` (`user_id`),
  ADD KEY `pincode_fk_2998742` (`pincode_id`),
  ADD KEY `district_fk_2998743` (`district_id`),
  ADD KEY `block_fk_2998744` (`block_id`),
  ADD KEY `state_fk_2998745` (`state_id`),
  ADD KEY `area_fk_2998746` (`area_id`);

--
-- Indexes for table `user_alerts`
--
ALTER TABLE `user_alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_fk_3068042` (`user_id`);

--
-- Indexes for table `user_user_alert`
--
ALTER TABLE `user_user_alert`
  ADD KEY `user_alert_id_fk_2924387` (`user_alert_id`),
  ADD KEY `user_id_fk_2924387` (`user_id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_email_unique` (`email`),
  ADD UNIQUE KEY `vendors_mobile_unique` (`mobile`);

--
-- Indexes for table `vendor_profiles`
--
ALTER TABLE `vendor_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_profiles_vendor_id_foreign` (`vendor_id`),
  ADD KEY `vendor_profiles_billing_state_id_foreign` (`billing_state_id`),
  ADD KEY `vendor_profiles_billing_district_id_foreign` (`billing_district_id`),
  ADD KEY `vendor_profiles_pickup_state_id_foreign` (`pickup_state_id`),
  ADD KEY `vendor_profiles_pickup_district_id_foreign` (`pickup_district_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_product_price_id_foreign` (`product_price_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_alerts`
--
ALTER TABLE `admin_alerts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `article_comments`
--
ALTER TABLE `article_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `article_likes`
--
ALTER TABLE `article_likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `article_tags`
--
ALTER TABLE `article_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=807;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bill_items`
--
ALTER TABLE `bill_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blocks`
--
ALTER TABLE `blocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content_categories`
--
ALTER TABLE `content_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content_pages`
--
ALTER TABLE `content_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content_tags`
--
ALTER TABLE `content_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=719;

--
-- AUTO_INCREMENT for table `enquiries`
--
ALTER TABLE `enquiries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq_questions`
--
ALTER TABLE `faq_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logistics`
--
ALTER TABLE `logistics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `master_stocks`
--
ALTER TABLE `master_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `otps`
--
ALTER TABLE `otps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pincodes`
--
ALTER TABLE `pincodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_options`
--
ALTER TABLE `product_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `product_prices`
--
ALTER TABLE `product_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_sub_categories`
--
ALTER TABLE `product_sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `product_tags`
--
ALTER TABLE `product_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `push_notifications`
--
ALTER TABLE `push_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slider_items`
--
ALTER TABLE `slider_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `unit_types`
--
ALTER TABLE `unit_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_alerts`
--
ALTER TABLE `user_alerts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vendor_profiles`
--
ALTER TABLE `vendor_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_admin_alert`
--
ALTER TABLE `admin_admin_alert`
  ADD CONSTRAINT `admin_alert_id_fk_2924387` FOREIGN KEY (`admin_alert_id`) REFERENCES `user_alerts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admin_id_fk_2924387` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `areas`
--
ALTER TABLE `areas`
  ADD CONSTRAINT `areas_pincode_id_foreign` FOREIGN KEY (`pincode_id`) REFERENCES `pincodes` (`id`);

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `user_fk_2993335` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `article_article_tag`
--
ALTER TABLE `article_article_tag`
  ADD CONSTRAINT `article_id_fk_2995560` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `article_tag_id_fk_2995560` FOREIGN KEY (`article_tag_id`) REFERENCES `article_tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `article_comments`
--
ALTER TABLE `article_comments`
  ADD CONSTRAINT `article_fk_2995580` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  ADD CONSTRAINT `user_fk_2995574` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `article_likes`
--
ALTER TABLE `article_likes`
  ADD CONSTRAINT `article_fk_2995643` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  ADD CONSTRAINT `user_fk_2995642` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`);

--
-- Constraints for table `bill_items`
--
ALTER TABLE `bill_items`
  ADD CONSTRAINT `bill_items_bill_id_foreign` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`),
  ADD CONSTRAINT `bill_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `bill_items_product_price_id_foreign` FOREIGN KEY (`product_price_id`) REFERENCES `product_prices` (`id`);

--
-- Constraints for table `blocks`
--
ALTER TABLE `blocks`
  ADD CONSTRAINT `blocks_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`);

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `carts_product_price_id_foreign` FOREIGN KEY (`product_price_id`) REFERENCES `product_prices` (`id`),
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `order_fk_2939007` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `content_category_content_page`
--
ALTER TABLE `content_category_content_page`
  ADD CONSTRAINT `content_category_id_fk_2924404` FOREIGN KEY (`content_category_id`) REFERENCES `content_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `content_page_id_fk_2924404` FOREIGN KEY (`content_page_id`) REFERENCES `content_pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `content_page_content_tag`
--
ALTER TABLE `content_page_content_tag`
  ADD CONSTRAINT `content_page_id_fk_2924405` FOREIGN KEY (`content_page_id`) REFERENCES `content_pages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `content_tag_id_fk_2924405` FOREIGN KEY (`content_tag_id`) REFERENCES `content_tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `districts_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`);

--
-- Constraints for table `enquiries`
--
ALTER TABLE `enquiries`
  ADD CONSTRAINT `attendant_fk_3167399` FOREIGN KEY (`attendant_id`) REFERENCES `admins` (`id`);

--
-- Constraints for table `faq_questions`
--
ALTER TABLE `faq_questions`
  ADD CONSTRAINT `category_fk_2924418` FOREIGN KEY (`category_id`) REFERENCES `faq_categories` (`id`),
  ADD CONSTRAINT `created_by_fk_2927060` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `followers`
--
ALTER TABLE `followers`
  ADD CONSTRAINT `follow_fk_2995633` FOREIGN KEY (`follow_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_fk_2995632` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `master_stocks`
--
ALTER TABLE `master_stocks`
  ADD CONSTRAINT `master_stocks_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `master_stocks_product_price_id_foreign` FOREIGN KEY (`product_price_id`) REFERENCES `product_prices` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `address_fk_2998788` FOREIGN KEY (`address_id`) REFERENCES `user_addresses` (`id`),
  ADD CONSTRAINT `orders_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`),
  ADD CONSTRAINT `user_fk_2927119` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_items_product_price_id_foreign` FOREIGN KEY (`product_price_id`) REFERENCES `product_prices` (`id`),
  ADD CONSTRAINT `order_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_id_fk_2902509` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_id_fk_2902509` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pincodes`
--
ALTER TABLE `pincodes`
  ADD CONSTRAINT `pincodes_block_id_foreign` FOREIGN KEY (`block_id`) REFERENCES `blocks` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `brand_fk_2974094` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `products_product_category_id_foreign` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`),
  ADD CONSTRAINT `products_product_sub_category_id_foreign` FOREIGN KEY (`product_sub_category_id`) REFERENCES `product_sub_categories` (`id`),
  ADD CONSTRAINT `products_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`);

--
-- Constraints for table `product_options`
--
ALTER TABLE `product_options`
  ADD CONSTRAINT `product_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_prices`
--
ALTER TABLE `product_prices`
  ADD CONSTRAINT `product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_product_tag`
--
ALTER TABLE `product_product_tag`
  ADD CONSTRAINT `product_id_fk_2902540` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_tag_id_fk_2902540` FOREIGN KEY (`product_tag_id`) REFERENCES `product_tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD CONSTRAINT `product_stocks_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_stocks_product_price_id_foreign` FOREIGN KEY (`product_price_id`) REFERENCES `product_prices` (`id`),
  ADD CONSTRAINT `product_stocks_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`);

--
-- Constraints for table `product_sub_categories`
--
ALTER TABLE `product_sub_categories`
  ADD CONSTRAINT `product_sub_categories_product_category_id_foreign` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`);

--
-- Constraints for table `push_notification_user`
--
ALTER TABLE `push_notification_user`
  ADD CONSTRAINT `push_notification_user_push_notification_id_foreign` FOREIGN KEY (`push_notification_id`) REFERENCES `push_notifications` (`id`),
  ADD CONSTRAINT `push_notification_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reviews_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`);

--
-- Constraints for table `role_admin`
--
ALTER TABLE `role_admin`
  ADD CONSTRAINT `admin_id_fk_custom_01` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`),
  ADD CONSTRAINT `role_id_fk_custom_02` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `role_logistics`
--
ALTER TABLE `role_logistics`
  ADD CONSTRAINT `logistics_id_fk_001` FOREIGN KEY (`logistics_id`) REFERENCES `logistics` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_id_fk_0092` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_id_fk_2902518` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_id_fk_2902518` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_vendor`
--
ALTER TABLE `role_vendor`
  ADD CONSTRAINT `role_id_fk_0095` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendor_id_fk_001` FOREIGN KEY (`vendor_id`) REFERENCES `logistics` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `slider_items`
--
ALTER TABLE `slider_items`
  ADD CONSTRAINT `slider_items_slider_id_foreign` FOREIGN KEY (`slider_id`) REFERENCES `sliders` (`id`);

--
-- Constraints for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD CONSTRAINT `area_fk_2998746` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`),
  ADD CONSTRAINT `block_fk_2998744` FOREIGN KEY (`block_id`) REFERENCES `blocks` (`id`),
  ADD CONSTRAINT `district_fk_2998743` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  ADD CONSTRAINT `pincode_fk_2998742` FOREIGN KEY (`pincode_id`) REFERENCES `pincodes` (`id`),
  ADD CONSTRAINT `state_fk_2998745` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`),
  ADD CONSTRAINT `user_fk_2998741` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD CONSTRAINT `user_fk_3068042` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_user_alert`
--
ALTER TABLE `user_user_alert`
  ADD CONSTRAINT `user_alert_id_fk_2924387` FOREIGN KEY (`user_alert_id`) REFERENCES `user_alerts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_id_fk_2924387` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vendor_profiles`
--
ALTER TABLE `vendor_profiles`
  ADD CONSTRAINT `vendor_profiles_billing_district_id_foreign` FOREIGN KEY (`billing_district_id`) REFERENCES `districts` (`id`),
  ADD CONSTRAINT `vendor_profiles_billing_state_id_foreign` FOREIGN KEY (`billing_state_id`) REFERENCES `states` (`id`),
  ADD CONSTRAINT `vendor_profiles_pickup_district_id_foreign` FOREIGN KEY (`pickup_district_id`) REFERENCES `districts` (`id`),
  ADD CONSTRAINT `vendor_profiles_pickup_state_id_foreign` FOREIGN KEY (`pickup_state_id`) REFERENCES `states` (`id`),
  ADD CONSTRAINT `vendor_profiles_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`);

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `wishlists_product_price_id_foreign` FOREIGN KEY (`product_price_id`) REFERENCES `product_prices` (`id`),
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
