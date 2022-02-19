-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2021 at 04:18 PM
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
(1, 'created', 1, 'App\\Models\\Vendor', NULL, '{\"mobile\":\"9109844778\",\"email\":\"homver30@gmail.com\",\"user_type\":\"MANUFACTURER\",\"name\":\"Company\",\"verified\":1,\"updated_at\":\"2021-12-03 09:16:38\",\"created_at\":\"2021-12-03 09:16:38\",\"id\":1}', '127.0.0.1', '2021-12-03 03:46:38', '2021-12-03 03:46:38'),
(2, 'created', 1, 'App\\Models\\VendorProfile', NULL, '{\"mobile\":\"9109844778\",\"email\":\"homver30@gmail.com\",\"company_name\":\"Company\",\"representative_name\":\"Representative\",\"billing_address\":\"Billing Address\",\"billing_address_two\":null,\"billing_state_id\":\"7\",\"billing_district_id\":\"111\",\"billing_pincode\":\"492001\",\"pickup_address_two\":null,\"pan_number\":\"PAN\",\"gst_number\":\"GSIN\",\"bank_name\":\"Bank\",\"account_number\":\"123456\",\"account_holder_name\":\"Homesh\",\"ifsc_code\":\"IFSC\",\"vendor_id\":1,\"updated_at\":\"2021-12-03 09:16:38\",\"created_at\":\"2021-12-03 09:16:38\",\"id\":1,\"pan_card\":null,\"gst\":null,\"media\":[]}', '127.0.0.1', '2021-12-03 03:46:38', '2021-12-03 03:46:38'),
(3, 'created', 1, 'App\\Models\\Product', NULL, '{\"name\":\"Product One\",\"price\":\"5000\",\"moq\":\"5\",\"discount\":\"1\",\"dispatch_time\":\"2 days\",\"rrp\":null,\"product_category_id\":\"1\",\"product_sub_category_id\":\"1\",\"description\":null,\"quantity\":null,\"vendor_id\":1,\"slug\":\"product-one\",\"updated_at\":\"2021-12-03 09:21:35\",\"created_at\":\"2021-12-03 09:21:35\",\"id\":1,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-12-03 03:51:35', '2021-12-03 03:51:35'),
(4, 'created', 2, 'App\\Models\\Product', NULL, '{\"name\":\"Product Two\",\"price\":\"200\",\"moq\":\"12\",\"discount\":null,\"dispatch_time\":\"2 days\",\"rrp\":null,\"product_category_id\":\"2\",\"product_sub_category_id\":\"30\",\"description\":null,\"quantity\":null,\"vendor_id\":1,\"slug\":\"product-two\",\"updated_at\":\"2021-12-03 09:24:09\",\"created_at\":\"2021-12-03 09:24:09\",\"id\":2,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-12-03 03:54:09', '2021-12-03 03:54:09'),
(5, 'created', 3, 'App\\Models\\Product', NULL, '{\"discount\":null,\"name\":\"Product Three\",\"price\":\"500\",\"moq\":\"5\",\"dispatch_time\":null,\"rrp\":null,\"product_category_id\":null,\"product_sub_category_id\":null,\"description\":null,\"quantity\":null,\"vendor_id\":1,\"slug\":\"product-three\",\"updated_at\":\"2021-12-03 09:25:56\",\"created_at\":\"2021-12-03 09:25:56\",\"id\":3,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-12-03 03:55:56', '2021-12-03 03:55:56'),
(6, 'created', 4, 'App\\Models\\Product', NULL, '{\"discount\":\"0\",\"name\":\"Product Four\",\"price\":\"1400\",\"moq\":\"14\",\"dispatch_time\":null,\"rrp\":null,\"product_category_id\":null,\"product_sub_category_id\":null,\"description\":null,\"quantity\":null,\"vendor_id\":1,\"slug\":\"product-four\",\"updated_at\":\"2021-12-03 09:30:00\",\"created_at\":\"2021-12-03 09:30:00\",\"id\":4,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-12-03 04:00:00', '2021-12-03 04:00:00'),
(7, 'created', 1, 'App\\Models\\User', NULL, '{\"name\":\"Company\",\"email\":\"homver301@gmail.com\",\"mobile\":\"9109844771\",\"device_token\":\"ehf7jciXSDSiEyulFGKe1h:APA91bFht6Q6hep_PGtxB9Khk4wVAv93zGjLpq530XO8sXxdNL3uLiubLdefu4tFZJlBvECc7cL4CBZpKVZ0LWkcLvnbewl-D_RaakjWeGdYFIEsDyXqZWjcUTwvJ92Sonf4y0VeLP3Q\",\"updated_at\":\"2021-12-03 09:30:54\",\"created_at\":\"2021-12-03 09:30:54\",\"id\":1}', '127.0.0.1', '2021-12-03 04:00:54', '2021-12-03 04:00:54'),
(8, 'created', 1, 'App\\Models\\Cart', NULL, '{\"user_id\":1,\"product_id\":1,\"product_option_id\":1,\"quantity\":5,\"updated_at\":\"2021-12-03 09:34:54\",\"created_at\":\"2021-12-03 09:34:54\",\"id\":1}', '127.0.0.1', '2021-12-03 04:04:54', '2021-12-03 04:04:54'),
(9, 'created', 2, 'App\\Models\\Cart', NULL, '{\"user_id\":1,\"product_id\":2,\"product_option_id\":null,\"quantity\":12,\"updated_at\":\"2021-12-03 09:35:23\",\"created_at\":\"2021-12-03 09:35:23\",\"id\":2}', '127.0.0.1', '2021-12-03 04:05:23', '2021-12-03 04:05:23'),
(10, 'updated', 1, 'App\\Models\\Cart', NULL, '{\"id\":1,\"user_id\":1,\"product_id\":1,\"product_option_id\":1,\"quantity\":6,\"created_at\":\"2021-12-03 09:34:54\",\"updated_at\":\"2021-12-03 09:35:58\",\"deleted_at\":null,\"order_id\":null,\"product\":{\"id\":1,\"vendor_id\":1,\"name\":\"Product One\",\"slug\":\"product-one\",\"description\":null,\"price\":\"5000.00\",\"mop\":\"0.00\",\"moq\":5,\"discount\":\"1.00\",\"product_category_id\":1,\"product_sub_category_id\":1,\"dispatch_time\":\"2 days\",\"rrp\":null,\"approval_status\":\"PENDING\",\"quantity\":null,\"created_at\":\"2021-12-03 09:21:35\",\"updated_at\":\"2021-12-03 09:21:35\",\"deleted_at\":null,\"brand_id\":null,\"images\":[{\"id\":3,\"model_type\":\"App\\\\Models\\\\Product\",\"model_id\":1,\"uuid\":\"29ab9b4d-b3db-4aa7-b715-e016a98d54dd\",\"collection_name\":\"images\",\"name\":\"61a9e0c25a907_250px-Irrigat\",\"file_name\":\"61a9e0c25a907_250px-Irrigat.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":15187,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":3,\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"created_at\":\"2021-12-03T09:21:35.000000Z\",\"updated_at\":\"2021-12-03T09:21:36.000000Z\",\"url\":\"http:\\/\\/localhost:8000\\/storage\\/3\\/61a9e0c25a907_250px-Irrigat.jpg\",\"thumbnail\":\"http:\\/\\/localhost:8000\\/storage\\/3\\/conversions\\/61a9e0c25a907_250px-Irrigat-thumb.jpg\",\"preview\":\"http:\\/\\/localhost:8000\\/storage\\/3\\/conversions\\/61a9e0c25a907_250px-Irrigat-preview.jpg\",\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/3\\/61a9e0c25a907_250px-Irrigat.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/3\\/conversions\\/61a9e0c25a907_250px-Irrigat-preview.jpg\"},{\"id\":4,\"model_type\":\"App\\\\Models\\\\Product\",\"model_id\":1,\"uuid\":\"af9516c5-d5fa-4a76-8519-f550804d6c9c\",\"collection_name\":\"images\",\"name\":\"61a9e0c2d797a_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC\",\"file_name\":\"61a9e0c2d797a_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":48510,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":4,\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"created_at\":\"2021-12-03T09:21:36.000000Z\",\"updated_at\":\"2021-12-03T09:21:36.000000Z\",\"url\":\"http:\\/\\/localhost:8000\\/storage\\/4\\/61a9e0c2d797a_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg\",\"thumbnail\":\"http:\\/\\/localhost:8000\\/storage\\/4\\/conversions\\/61a9e0c2d797a_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC-thumb.jpg\",\"preview\":\"http:\\/\\/localhost:8000\\/storage\\/4\\/conversions\\/61a9e0c2d797a_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC-preview.jpg\",\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/4\\/61a9e0c2d797a_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/4\\/conversions\\/61a9e0c2d797a_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC-preview.jpg\"},{\"id\":5,\"model_type\":\"App\\\\Models\\\\Product\",\"model_id\":1,\"uuid\":\"3beea4b4-1853-4cae-ad68-56d4bb0d9b1f\",\"collection_name\":\"images\",\"name\":\"61a9e0c34eb0f_515DsF20K1L._SL1080_\",\"file_name\":\"61a9e0c34eb0f_515DsF20K1L._SL1080_.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":61899,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":5,\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"created_at\":\"2021-12-03T09:21:37.000000Z\",\"updated_at\":\"2021-12-03T09:21:37.000000Z\",\"url\":\"http:\\/\\/localhost:8000\\/storage\\/5\\/61a9e0c34eb0f_515DsF20K1L._SL1080_.jpg\",\"thumbnail\":\"http:\\/\\/localhost:8000\\/storage\\/5\\/conversions\\/61a9e0c34eb0f_515DsF20K1L._SL1080_-thumb.jpg\",\"preview\":\"http:\\/\\/localhost:8000\\/storage\\/5\\/conversions\\/61a9e0c34eb0f_515DsF20K1L._SL1080_-preview.jpg\",\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/5\\/61a9e0c34eb0f_515DsF20K1L._SL1080_.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/5\\/conversions\\/61a9e0c34eb0f_515DsF20K1L._SL1080_-preview.jpg\"}],\"media\":[{\"id\":3,\"model_type\":\"App\\\\Models\\\\Product\",\"model_id\":1,\"uuid\":\"29ab9b4d-b3db-4aa7-b715-e016a98d54dd\",\"collection_name\":\"images\",\"name\":\"61a9e0c25a907_250px-Irrigat\",\"file_name\":\"61a9e0c25a907_250px-Irrigat.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":15187,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":3,\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"created_at\":\"2021-12-03T09:21:35.000000Z\",\"updated_at\":\"2021-12-03T09:21:36.000000Z\",\"url\":\"http:\\/\\/localhost:8000\\/storage\\/3\\/61a9e0c25a907_250px-Irrigat.jpg\",\"thumbnail\":\"http:\\/\\/localhost:8000\\/storage\\/3\\/conversions\\/61a9e0c25a907_250px-Irrigat-thumb.jpg\",\"preview\":\"http:\\/\\/localhost:8000\\/storage\\/3\\/conversions\\/61a9e0c25a907_250px-Irrigat-preview.jpg\",\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/3\\/61a9e0c25a907_250px-Irrigat.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/3\\/conversions\\/61a9e0c25a907_250px-Irrigat-preview.jpg\"},{\"id\":4,\"model_type\":\"App\\\\Models\\\\Product\",\"model_id\":1,\"uuid\":\"af9516c5-d5fa-4a76-8519-f550804d6c9c\",\"collection_name\":\"images\",\"name\":\"61a9e0c2d797a_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC\",\"file_name\":\"61a9e0c2d797a_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":48510,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":4,\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"created_at\":\"2021-12-03T09:21:36.000000Z\",\"updated_at\":\"2021-12-03T09:21:36.000000Z\",\"url\":\"http:\\/\\/localhost:8000\\/storage\\/4\\/61a9e0c2d797a_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg\",\"thumbnail\":\"http:\\/\\/localhost:8000\\/storage\\/4\\/conversions\\/61a9e0c2d797a_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC-thumb.jpg\",\"preview\":\"http:\\/\\/localhost:8000\\/storage\\/4\\/conversions\\/61a9e0c2d797a_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC-preview.jpg\",\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/4\\/61a9e0c2d797a_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/4\\/conversions\\/61a9e0c2d797a_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC-preview.jpg\"},{\"id\":5,\"model_type\":\"App\\\\Models\\\\Product\",\"model_id\":1,\"uuid\":\"3beea4b4-1853-4cae-ad68-56d4bb0d9b1f\",\"collection_name\":\"images\",\"name\":\"61a9e0c34eb0f_515DsF20K1L._SL1080_\",\"file_name\":\"61a9e0c34eb0f_515DsF20K1L._SL1080_.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":61899,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":5,\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"created_at\":\"2021-12-03T09:21:37.000000Z\",\"updated_at\":\"2021-12-03T09:21:37.000000Z\",\"url\":\"http:\\/\\/localhost:8000\\/storage\\/5\\/61a9e0c34eb0f_515DsF20K1L._SL1080_.jpg\",\"thumbnail\":\"http:\\/\\/localhost:8000\\/storage\\/5\\/conversions\\/61a9e0c34eb0f_515DsF20K1L._SL1080_-thumb.jpg\",\"preview\":\"http:\\/\\/localhost:8000\\/storage\\/5\\/conversions\\/61a9e0c34eb0f_515DsF20K1L._SL1080_-preview.jpg\",\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/5\\/61a9e0c34eb0f_515DsF20K1L._SL1080_.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/5\\/conversions\\/61a9e0c34eb0f_515DsF20K1L._SL1080_-preview.jpg\"}]}}', '127.0.0.1', '2021-12-03 04:05:58', '2021-12-03 04:05:58'),
(11, 'created', 3, 'App\\Models\\Cart', NULL, '{\"user_id\":1,\"product_id\":3,\"product_option_id\":null,\"quantity\":5,\"updated_at\":\"2021-12-03 09:36:28\",\"created_at\":\"2021-12-03 09:36:28\",\"id\":3}', '127.0.0.1', '2021-12-03 04:06:28', '2021-12-03 04:06:28'),
(12, 'deleted', 3, 'App\\Models\\Cart', NULL, '{\"id\":3,\"user_id\":1,\"product_id\":3,\"product_option_id\":null,\"quantity\":5,\"created_at\":\"2021-12-03 09:36:28\",\"updated_at\":\"2021-12-03 09:36:28\",\"deleted_at\":null,\"order_id\":null}', '127.0.0.1', '2021-12-03 04:06:39', '2021-12-03 04:06:39'),
(14, 'updated', 3, 'App\\Models\\Product', NULL, '{\"id\":3,\"vendor_id\":1,\"name\":\"Product Three\",\"slug\":\"product-three\",\"description\":null,\"price\":\"500.00\",\"mop\":\"0.00\",\"moq\":\"5\",\"discount\":\"1\",\"product_category_id\":null,\"product_sub_category_id\":null,\"dispatch_time\":null,\"rrp\":null,\"approval_status\":\"PENDING\",\"quantity\":null,\"created_at\":\"2021-12-03 09:25:56\",\"updated_at\":\"2021-12-03 09:40:24\",\"deleted_at\":null,\"brand_id\":null,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-12-03 04:10:24', '2021-12-03 04:10:24'),
(15, 'updated', 4, 'App\\Models\\Product', NULL, '{\"id\":4,\"vendor_id\":1,\"name\":\"Product Four\",\"slug\":\"product-four\",\"description\":null,\"price\":\"1400.00\",\"mop\":\"0.00\",\"moq\":\"14\",\"discount\":\"5.00\",\"product_category_id\":null,\"product_sub_category_id\":null,\"dispatch_time\":null,\"rrp\":null,\"approval_status\":\"PENDING\",\"quantity\":null,\"created_at\":\"2021-12-03 09:30:00\",\"updated_at\":\"2021-12-03 09:41:21\",\"deleted_at\":null,\"brand_id\":null,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-12-03 04:11:21', '2021-12-03 04:11:21'),
(16, 'created', 2, 'App\\Models\\Vendor', NULL, '{\"mobile\":\"9109844774\",\"email\":\"homver10@gmail.com\",\"updated_at\":\"2021-12-03 17:27:24\",\"created_at\":\"2021-12-03 17:27:24\",\"id\":2}', '127.0.0.1', '2021-12-03 11:57:24', '2021-12-03 11:57:24'),
(17, 'updated', 2, 'App\\Models\\Vendor', NULL, '{\"id\":2,\"name\":null,\"email\":\"homver10@gmail.com\",\"mobile\":\"9109844774\",\"user_type\":\"MANUFACTURER\",\"email_verified_at\":null,\"mobile_verified_at\":null,\"verification_token\":null,\"mobile_verification_token\":null,\"approved\":0,\"verified\":0,\"verified_at\":null,\"created_at\":\"2021-12-03 17:27:24\",\"updated_at\":\"2021-12-03 17:29:26\",\"deleted_at\":null}', '127.0.0.1', '2021-12-03 11:59:26', '2021-12-03 11:59:26'),
(18, 'created', 2, 'App\\Models\\VendorProfile', NULL, '{\"vendor_id\":2,\"company_name\":\"9109844778\",\"representative_name\":\"homver30@gmail.com\",\"email\":\"homver30@gmail.com\",\"mobile\":\"9109844778\",\"billing_address\":\"9109844778\",\"billing_address_two\":\"homver30@gmail.com\",\"billing_state_id\":\"1\",\"billing_district_id\":\"1\",\"billing_pincode\":25554,\"pickup_address\":\"9109844778\",\"pickup_address_two\":\"homver30@gmail.com\",\"pickup_state_id\":\"1\",\"pickup_district_id\":\"1\",\"pickup_pincode\":25554,\"updated_at\":\"2021-12-03 17:29:27\",\"created_at\":\"2021-12-03 17:29:27\",\"id\":2,\"pan_card\":null,\"gst\":null,\"media\":[]}', '127.0.0.1', '2021-12-03 11:59:27', '2021-12-03 11:59:27'),
(19, 'updated', 2, 'App\\Models\\VendorProfile', NULL, '{\"id\":2,\"vendor_id\":2,\"company_name\":\"9109844778\",\"representative_name\":\"homver30@gmail.com\",\"email\":\"homver30@gmail.com\",\"mobile\":\"9109844778\",\"gst_number\":\"homver30@gmail.com\",\"pan_number\":\"9109844778\",\"billing_address\":\"9109844778\",\"billing_address_two\":\"homver30@gmail.com\",\"billing_state_id\":1,\"billing_district_id\":1,\"billing_pincode\":\"25554\",\"pickup_address\":\"9109844778\",\"pickup_address_two\":\"homver30@gmail.com\",\"pickup_state_id\":1,\"pickup_district_id\":1,\"pickup_pincode\":\"25554\",\"bank_name\":\"homver30@gmail.com\",\"account_number\":\"9109844778\",\"account_holder_name\":\"9109844778\",\"ifsc_code\":\"homver30@gmail.com\",\"created_at\":\"2021-12-03 17:29:27\",\"updated_at\":\"2021-12-03 17:29:31\",\"deleted_at\":null,\"pan_card\":null,\"gst\":null,\"media\":[]}', '127.0.0.1', '2021-12-03 11:59:31', '2021-12-03 11:59:31'),
(27, 'created', 8, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-7765515296809260\",\"order_group_number\":2167141910572865,\"vendor_id\":1,\"payment_type\":\"ONLINE\",\"sub_total\":30000,\"discount_amount\":315,\"charge_percent\":5,\"charge_amount\":1500,\"grand_total\":31185,\"updated_at\":\"2021-12-03 18:29:58\",\"created_at\":\"2021-12-03 18:29:58\",\"id\":8}', '127.0.0.1', '2021-12-03 12:59:58', '2021-12-03 12:59:58'),
(28, 'created', 9, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-6711807791308935\",\"order_group_number\":2167141910572865,\"vendor_id\":2,\"payment_type\":\"ONLINE\",\"sub_total\":2400,\"discount_amount\":0,\"charge_percent\":5,\"charge_amount\":120,\"grand_total\":2520,\"updated_at\":\"2021-12-03 18:29:58\",\"created_at\":\"2021-12-03 18:29:58\",\"id\":9}', '127.0.0.1', '2021-12-03 12:59:58', '2021-12-03 12:59:58'),
(29, 'created', 4, 'App\\Models\\Cart', NULL, '{\"user_id\":1,\"product_id\":3,\"product_option_id\":null,\"quantity\":5,\"updated_at\":\"2021-12-03 18:33:40\",\"created_at\":\"2021-12-03 18:33:40\",\"id\":4}', '127.0.0.1', '2021-12-03 13:03:40', '2021-12-03 13:03:40'),
(30, 'created', 10, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-7789167459064520\",\"order_group_number\":3069781574261446,\"vendor_id\":1,\"payment_type\":\"ONLINE\",\"sub_total\":32500,\"discount_amount\":55,\"charge_percent\":5,\"charge_amount\":1625,\"grand_total\":34070,\"updated_at\":\"2021-12-03 18:35:15\",\"created_at\":\"2021-12-03 18:35:15\",\"id\":10}', '127.0.0.1', '2021-12-03 13:05:15', '2021-12-03 13:05:15'),
(31, 'created', 11, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-695737670561842\",\"order_group_number\":3069781574261446,\"vendor_id\":2,\"payment_type\":\"ONLINE\",\"sub_total\":2400,\"discount_amount\":0,\"charge_percent\":5,\"charge_amount\":120,\"grand_total\":2520,\"updated_at\":\"2021-12-03 18:35:15\",\"created_at\":\"2021-12-03 18:35:15\",\"id\":11}', '127.0.0.1', '2021-12-03 13:05:15', '2021-12-03 13:05:15'),
(32, 'created', 12, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-7708139231304402\",\"order_group_number\":2857219999897869,\"vendor_id\":1,\"payment_type\":\"ONLINE\",\"sub_total\":32500,\"discount_amount\":325,\"charge_percent\":5,\"charge_amount\":1625,\"grand_total\":33800,\"updated_at\":\"2021-12-03 18:36:04\",\"created_at\":\"2021-12-03 18:36:04\",\"id\":12}', '127.0.0.1', '2021-12-03 13:06:04', '2021-12-03 13:06:04'),
(33, 'created', 13, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-6261513207041661\",\"order_group_number\":2857219999897869,\"vendor_id\":2,\"payment_type\":\"ONLINE\",\"sub_total\":2400,\"discount_amount\":0,\"charge_percent\":5,\"charge_amount\":120,\"grand_total\":2520,\"updated_at\":\"2021-12-03 18:36:04\",\"created_at\":\"2021-12-03 18:36:04\",\"id\":13}', '127.0.0.1', '2021-12-03 13:06:04', '2021-12-03 13:06:04'),
(34, 'created', 14, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-4836623859737852\",\"order_group_number\":3548366800215624,\"vendor_id\":1,\"payment_type\":\"ONLINE\",\"sub_total\":32500,\"discount_amount\":325,\"charge_percent\":5,\"charge_amount\":1625,\"grand_total\":35425,\"updated_at\":\"2021-12-03 18:40:28\",\"created_at\":\"2021-12-03 18:40:28\",\"id\":14}', '127.0.0.1', '2021-12-03 13:10:28', '2021-12-03 13:10:28'),
(35, 'created', 15, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-2754983751137762\",\"order_group_number\":3548366800215624,\"vendor_id\":2,\"payment_type\":\"ONLINE\",\"sub_total\":2400,\"discount_amount\":0,\"charge_percent\":5,\"charge_amount\":120,\"grand_total\":2640,\"updated_at\":\"2021-12-03 18:40:28\",\"created_at\":\"2021-12-03 18:40:28\",\"id\":15}', '127.0.0.1', '2021-12-03 13:10:28', '2021-12-03 13:10:28'),
(36, 'created', 16, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-7722395847636128\",\"order_group_number\":4451976084978711,\"vendor_id\":1,\"payment_type\":\"ONLINE\",\"sub_total\":32500,\"discount_amount\":341.25,\"charge_percent\":5,\"charge_amount\":1625,\"grand_total\":33783.75,\"updated_at\":\"2021-12-03 18:41:54\",\"created_at\":\"2021-12-03 18:41:54\",\"id\":16}', '127.0.0.1', '2021-12-03 13:11:54', '2021-12-03 13:11:54'),
(37, 'created', 17, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-5401978653479030\",\"order_group_number\":4451976084978711,\"vendor_id\":2,\"payment_type\":\"ONLINE\",\"sub_total\":2400,\"discount_amount\":0,\"charge_percent\":5,\"charge_amount\":120,\"grand_total\":2520,\"updated_at\":\"2021-12-03 18:41:54\",\"created_at\":\"2021-12-03 18:41:54\",\"id\":17}', '127.0.0.1', '2021-12-03 13:11:54', '2021-12-03 13:11:54'),
(38, 'created', 18, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-5423917385909360\",\"order_group_number\":4218641325609162,\"vendor_id\":1,\"payment_type\":\"ONLINE\",\"sub_total\":32500,\"discount_amount\":341.25,\"charge_percent\":5,\"charge_amount\":1625,\"grand_total\":33783.75,\"updated_at\":\"2021-12-03 18:56:07\",\"created_at\":\"2021-12-03 18:56:07\",\"id\":18}', '127.0.0.1', '2021-12-03 13:26:07', '2021-12-03 13:26:07'),
(39, 'created', 19, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-7432351977212695\",\"order_group_number\":4218641325609162,\"vendor_id\":2,\"payment_type\":\"ONLINE\",\"sub_total\":2400,\"discount_amount\":0,\"charge_percent\":5,\"charge_amount\":120,\"grand_total\":2520,\"updated_at\":\"2021-12-03 18:56:07\",\"created_at\":\"2021-12-03 18:56:07\",\"id\":19}', '127.0.0.1', '2021-12-03 13:26:07', '2021-12-03 13:26:07'),
(40, 'created', 20, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-3338445126735428\",\"order_group_number\":9519374935204832,\"vendor_id\":1,\"payment_type\":\"ONLINE\",\"sub_total\":32500,\"discount_amount\":341.25,\"charge_percent\":5,\"charge_amount\":1625,\"grand_total\":33783.75,\"updated_at\":\"2021-12-04 08:28:15\",\"created_at\":\"2021-12-04 08:28:15\",\"id\":20}', '127.0.0.1', '2021-12-04 02:58:15', '2021-12-04 02:58:15'),
(41, 'created', 21, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-1992307998263394\",\"order_group_number\":9519374935204832,\"vendor_id\":2,\"payment_type\":\"ONLINE\",\"sub_total\":2400,\"discount_amount\":0,\"charge_percent\":5,\"charge_amount\":120,\"grand_total\":2520,\"updated_at\":\"2021-12-04 08:28:15\",\"created_at\":\"2021-12-04 08:28:15\",\"id\":21}', '127.0.0.1', '2021-12-04 02:58:15', '2021-12-04 02:58:15'),
(42, 'created', 22, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-6012125464254574\",\"order_group_number\":4686504131305911,\"vendor_id\":1,\"payment_type\":\"ONLINE\",\"sub_total\":32500,\"discount_amount\":325,\"charge_percent\":5,\"charge_amount\":1625,\"grand_total\":33783.75,\"updated_at\":\"2021-12-04 08:37:06\",\"created_at\":\"2021-12-04 08:37:06\",\"id\":22}', '127.0.0.1', '2021-12-04 03:07:06', '2021-12-04 03:07:06'),
(43, 'created', 23, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-4825529496731993\",\"order_group_number\":4686504131305911,\"vendor_id\":2,\"payment_type\":\"ONLINE\",\"sub_total\":2400,\"discount_amount\":0,\"charge_percent\":5,\"charge_amount\":120,\"grand_total\":2520,\"updated_at\":\"2021-12-04 08:37:06\",\"created_at\":\"2021-12-04 08:37:06\",\"id\":23}', '127.0.0.1', '2021-12-04 03:07:06', '2021-12-04 03:07:06'),
(44, 'created', 24, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-3750114973479878\",\"order_group_number\":6155858042262585,\"vendor_id\":1,\"payment_type\":\"ONLINE\",\"sub_total\":32500,\"discount_amount\":325,\"charge_percent\":5,\"charge_amount\":1689.1875,\"grand_total\":33783.75,\"updated_at\":\"2021-12-04 08:39:42\",\"created_at\":\"2021-12-04 08:39:42\",\"id\":24}', '127.0.0.1', '2021-12-04 03:09:42', '2021-12-04 03:09:42'),
(45, 'created', 25, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-4829529596940859\",\"order_group_number\":6155858042262585,\"vendor_id\":2,\"payment_type\":\"ONLINE\",\"sub_total\":2400,\"discount_amount\":0,\"charge_percent\":5,\"charge_amount\":126,\"grand_total\":2520,\"updated_at\":\"2021-12-04 08:39:42\",\"created_at\":\"2021-12-04 08:39:42\",\"id\":25}', '127.0.0.1', '2021-12-04 03:09:42', '2021-12-04 03:09:42'),
(46, 'created', 26, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-8056203749787165\",\"order_group_number\":272476833759884,\"vendor_id\":1,\"payment_type\":\"ONLINE\",\"sub_total\":32500,\"discount_amount\":325,\"charge_percent\":5,\"charge_amount\":1608.75,\"grand_total\":33783.75,\"updated_at\":\"2021-12-04 08:47:44\",\"created_at\":\"2021-12-04 08:47:44\",\"id\":26}', '127.0.0.1', '2021-12-04 03:17:44', '2021-12-04 03:17:44'),
(47, 'created', 27, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-2399343030096663\",\"order_group_number\":272476833759884,\"vendor_id\":2,\"payment_type\":\"ONLINE\",\"sub_total\":2400,\"discount_amount\":0,\"charge_percent\":5,\"charge_amount\":120,\"grand_total\":2520,\"updated_at\":\"2021-12-04 08:47:44\",\"created_at\":\"2021-12-04 08:47:44\",\"id\":27}', '127.0.0.1', '2021-12-04 03:17:44', '2021-12-04 03:17:44'),
(48, 'created', 28, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-9158607488421383\",\"order_group_number\":692869393061991,\"vendor_id\":1,\"payment_type\":\"ONLINE\",\"sub_total\":32500,\"discount_amount\":325,\"charge_percent\":5,\"charge_amount\":1608.75,\"grand_total\":33783.75,\"updated_at\":\"2021-12-04 09:09:19\",\"created_at\":\"2021-12-04 09:09:19\",\"id\":28}', '127.0.0.1', '2021-12-04 03:39:19', '2021-12-04 03:39:19'),
(49, 'created', 29, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-7245525560049674\",\"order_group_number\":692869393061991,\"vendor_id\":2,\"payment_type\":\"ONLINE\",\"sub_total\":2400,\"discount_amount\":0,\"charge_percent\":5,\"charge_amount\":120,\"grand_total\":2520,\"updated_at\":\"2021-12-04 09:09:19\",\"created_at\":\"2021-12-04 09:09:19\",\"id\":29}', '127.0.0.1', '2021-12-04 03:39:19', '2021-12-04 03:39:19'),
(50, 'created', 30, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-4400240771660847\",\"order_group_number\":1945955497533715,\"vendor_id\":1,\"payment_type\":\"ONLINE\",\"sub_total\":32500,\"discount_amount\":325,\"charge_percent\":5,\"charge_amount\":1608.75,\"grand_total\":33783.75,\"updated_at\":\"2021-12-04 09:10:48\",\"created_at\":\"2021-12-04 09:10:48\",\"id\":30}', '127.0.0.1', '2021-12-04 03:40:48', '2021-12-04 03:40:48'),
(51, 'created', 31, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-3289057823648718\",\"order_group_number\":1945955497533715,\"vendor_id\":2,\"payment_type\":\"ONLINE\",\"sub_total\":2400,\"discount_amount\":0,\"charge_percent\":5,\"charge_amount\":120,\"grand_total\":2520,\"updated_at\":\"2021-12-04 09:10:48\",\"created_at\":\"2021-12-04 09:10:48\",\"id\":31}', '127.0.0.1', '2021-12-04 03:40:48', '2021-12-04 03:40:48'),
(52, 'created', 32, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-9257593798472135\",\"order_group_number\":4566010513130747,\"vendor_id\":1,\"payment_type\":\"ONLINE\",\"sub_total\":32500,\"discount_amount\":325,\"charge_percent\":5,\"charge_amount\":1608.75,\"grand_total\":33783.75,\"updated_at\":\"2021-12-04 09:11:08\",\"created_at\":\"2021-12-04 09:11:08\",\"id\":32}', '127.0.0.1', '2021-12-04 03:41:08', '2021-12-04 03:41:08'),
(53, 'created', 33, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-6615082323258955\",\"order_group_number\":4566010513130747,\"vendor_id\":2,\"payment_type\":\"ONLINE\",\"sub_total\":2400,\"discount_amount\":0,\"charge_percent\":5,\"charge_amount\":120,\"grand_total\":2520,\"updated_at\":\"2021-12-04 09:11:08\",\"created_at\":\"2021-12-04 09:11:08\",\"id\":33}', '127.0.0.1', '2021-12-04 03:41:08', '2021-12-04 03:41:08'),
(54, 'created', 34, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-8295003435385035\",\"order_group_number\":1109501312987155,\"vendor_id\":1,\"payment_type\":\"ONLINE\",\"sub_total\":32500,\"discount_amount\":325,\"charge_percent\":5,\"charge_amount\":1608.75,\"grand_total\":33783.75,\"updated_at\":\"2021-12-04 09:41:04\",\"created_at\":\"2021-12-04 09:41:04\",\"id\":34}', '127.0.0.1', '2021-12-04 04:11:04', '2021-12-04 04:11:04'),
(55, 'created', 35, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-9977721774006869\",\"order_group_number\":1109501312987155,\"vendor_id\":2,\"payment_type\":\"ONLINE\",\"sub_total\":2400,\"discount_amount\":0,\"charge_percent\":5,\"charge_amount\":120,\"grand_total\":2520,\"updated_at\":\"2021-12-04 09:41:04\",\"created_at\":\"2021-12-04 09:41:04\",\"id\":35}', '127.0.0.1', '2021-12-04 04:11:04', '2021-12-04 04:11:04'),
(56, 'created', 36, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-1505971194675460\",\"order_group_number\":4286845059661474,\"vendor_id\":1,\"payment_type\":\"ONLINE\",\"sub_total\":32500,\"discount_amount\":325,\"charge_percent\":5,\"charge_amount\":1608.75,\"grand_total\":33783.75,\"updated_at\":\"2021-12-04 09:47:45\",\"created_at\":\"2021-12-04 09:47:45\",\"id\":36}', '127.0.0.1', '2021-12-04 04:17:45', '2021-12-04 04:17:45'),
(57, 'created', 37, 'App\\Models\\Order', NULL, '{\"payment_status\":\"PENDING\",\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-1648034493656266\",\"order_group_number\":4286845059661474,\"vendor_id\":2,\"payment_type\":\"ONLINE\",\"sub_total\":2400,\"discount_amount\":0,\"charge_percent\":5,\"charge_amount\":120,\"grand_total\":2520,\"updated_at\":\"2021-12-04 09:47:45\",\"created_at\":\"2021-12-04 09:47:45\",\"id\":37}', '127.0.0.1', '2021-12-04 04:17:45', '2021-12-04 04:17:45'),
(58, 'updated', 32, 'App\\Models\\Order', NULL, '{\"id\":32,\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-9257593798472135\",\"order_group_number\":\"4566010513130747\",\"vendor_id\":1,\"payment_type\":\"ONLINE\",\"sub_total\":\"32500.00\",\"discount_amount\":\"325.00\",\"charge_percent\":\"5.00\",\"charge_amount\":\"1608.75\",\"grand_total\":\"33783.75\",\"amount_paid\":\"0.00\",\"payment_status\":\"PENDING\",\"status\":\"CONFIRMED\",\"is_invoice_generated\":0,\"created_at\":\"2021-12-04 09:11:08\",\"updated_at\":\"2021-12-04 16:36:38\",\"deleted_at\":null}', '127.0.0.1', '2021-12-04 11:06:38', '2021-12-04 11:06:38'),
(59, 'updated', 28, 'App\\Models\\Order', NULL, '{\"id\":28,\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-9158607488421383\",\"order_group_number\":\"692869393061991\",\"vendor_id\":1,\"payment_type\":\"ONLINE\",\"sub_total\":\"32500.00\",\"discount_amount\":\"325.00\",\"charge_percent\":\"5.00\",\"charge_amount\":\"1608.75\",\"grand_total\":\"33783.75\",\"amount_paid\":\"0.00\",\"payment_status\":\"PENDING\",\"status\":\"CANCELLED\",\"is_invoice_generated\":0,\"created_at\":\"2021-12-04 09:09:19\",\"updated_at\":\"2021-12-04 16:40:31\",\"deleted_at\":null}', '127.0.0.1', '2021-12-04 11:10:31', '2021-12-04 11:10:31'),
(60, 'created', 2, 'App\\Models\\User', 1, '{\"approved\":1,\"updated_at\":\"2021-12-06 13:19:28\",\"created_at\":\"2021-12-06 13:19:28\",\"id\":2}', '127.0.0.1', '2021-12-06 07:49:28', '2021-12-06 07:49:28'),
(61, 'updated', 37, 'App\\Models\\Order', 1, '{\"id\":37,\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-1648034493656266\",\"order_group_number\":\"4286845059661474\",\"vendor_id\":2,\"payment_type\":\"ONLINE\",\"sub_total\":\"2400.00\",\"discount_amount\":\"0.00\",\"charge_percent\":\"5.00\",\"charge_amount\":\"120.00\",\"grand_total\":\"2520.00\",\"amount_paid\":\"0.00\",\"payment_status\":\"PENDING\",\"status\":\"CONFIRMED\",\"is_invoice_generated\":0,\"created_at\":\"2021-12-04 09:47:45\",\"updated_at\":\"2021-12-06 15:27:23\",\"deleted_at\":null}', '127.0.0.1', '2021-12-06 09:57:23', '2021-12-06 09:57:23'),
(62, 'updated', 37, 'App\\Models\\Order', 1, '{\"id\":37,\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-1648034493656266\",\"order_group_number\":\"4286845059661474\",\"vendor_id\":2,\"payment_type\":\"ONLINE\",\"sub_total\":\"2400.00\",\"discount_amount\":\"0.00\",\"charge_percent\":\"5.00\",\"charge_amount\":\"120.00\",\"grand_total\":\"2520.00\",\"amount_paid\":\"0.00\",\"payment_status\":\"SUCCESS\",\"status\":\"CONFIRMED\",\"is_invoice_generated\":0,\"payment_verified_by_id\":1,\"created_at\":\"2021-12-04 09:47:45\",\"updated_at\":\"2021-12-07 05:13:56\",\"deleted_at\":null}', '127.0.0.1', '2021-12-06 23:43:56', '2021-12-06 23:43:56'),
(63, 'updated', 37, 'App\\Models\\Order', 1, '{\"id\":37,\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-1648034493656266\",\"order_group_number\":\"4286845059661474\",\"vendor_id\":2,\"payment_type\":\"ONLINE\",\"sub_total\":\"2400.00\",\"discount_amount\":\"0.00\",\"charge_percent\":\"5.00\",\"charge_amount\":\"120.00\",\"grand_total\":\"2520.00\",\"amount_paid\":\"0.00\",\"payment_status\":\"VERIFIED\",\"status\":\"CONFIRMED\",\"is_invoice_generated\":0,\"payment_verified_by_id\":1,\"created_at\":\"2021-12-04 09:47:45\",\"updated_at\":\"2021-12-07 05:14:34\",\"deleted_at\":null}', '127.0.0.1', '2021-12-06 23:44:34', '2021-12-06 23:44:34'),
(64, 'updated', 36, 'App\\Models\\Order', 1, '{\"id\":36,\"user_id\":1,\"billing_address_id\":1,\"shipping_address_id\":1,\"order_number\":\"BB-ORD-1505971194675460\",\"order_group_number\":\"4286845059661474\",\"vendor_id\":1,\"payment_type\":\"ONLINE\",\"sub_total\":\"32500.00\",\"discount_amount\":\"325.00\",\"charge_percent\":\"5.00\",\"charge_amount\":\"1608.75\",\"grand_total\":\"33783.75\",\"amount_paid\":\"0.00\",\"payment_status\":\"PENDING\",\"status\":\"SHIPPED\",\"is_invoice_generated\":0,\"payment_verified_by_id\":0,\"created_at\":\"2021-12-04 09:47:45\",\"updated_at\":\"2021-12-07 05:22:22\",\"deleted_at\":null}', '127.0.0.1', '2021-12-06 23:52:22', '2021-12-06 23:52:22'),
(66, 'created', 4, 'App\\Models\\User', 1, '{\"mobile\":\"7893210477\",\"email\":\"test@test.com\",\"approved\":1,\"verified\":1,\"updated_at\":\"2021-12-07 12:36:56\",\"created_at\":\"2021-12-07 12:36:56\",\"id\":4}', '127.0.0.1', '2021-12-07 07:06:56', '2021-12-07 07:06:56'),
(67, 'updated', 4, 'App\\Models\\User', 1, '{\"id\":4,\"name\":\"COmp\",\"email\":\"test@test.com\",\"mobile\":\"7893210477\",\"email_verified_at\":null,\"approved\":1,\"verified\":1,\"verified_at\":null,\"verification_token\":null,\"mobile_verified_at\":null,\"referral_code\":null,\"device_token\":null,\"created_at\":\"2021-12-07 12:36:56\",\"updated_at\":\"2021-12-07 13:49:35\",\"deleted_at\":null}', '127.0.0.1', '2021-12-07 08:19:35', '2021-12-07 08:19:35'),
(68, 'updated', 2, 'App\\Models\\User', 1, '{\"id\":2,\"name\":\"new\",\"email\":\"admin@bulkbajaar.com\",\"mobile\":\"0321456987\",\"email_verified_at\":null,\"approved\":1,\"verified\":0,\"verified_at\":null,\"verification_token\":null,\"mobile_verified_at\":null,\"referral_code\":null,\"device_token\":null,\"created_at\":\"2021-12-06 13:19:28\",\"updated_at\":\"2021-12-08 08:44:41\",\"deleted_at\":null}', '127.0.0.1', '2021-12-08 03:14:41', '2021-12-08 03:14:41'),
(75, 'created', 11, 'App\\Models\\Product', 1, '{\"discount\":\"0\",\"name\":\"Product Test\",\"price\":\"78\",\"moq\":\"50\",\"dispatch_time\":null,\"rrp\":null,\"product_category_id\":null,\"product_sub_category_id\":null,\"description\":null,\"sku\":\"SKU\",\"hsn\":null,\"quantity\":null,\"vendor_id\":\"1\",\"slug\":\"product-test\",\"updated_at\":\"2021-12-08 09:22:18\",\"created_at\":\"2021-12-08 09:22:18\",\"id\":11,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-12-08 03:52:18', '2021-12-08 03:52:18'),
(76, 'created', 12, 'App\\Models\\Product', 1, '{\"discount\":\"0\",\"name\":\"Product Test\",\"price\":\"78\",\"moq\":\"50\",\"dispatch_time\":null,\"rrp\":null,\"product_category_id\":null,\"product_sub_category_id\":null,\"description\":null,\"sku\":\"SKU\",\"hsn\":null,\"quantity\":null,\"vendor_id\":\"2\",\"slug\":\"product-test1\",\"updated_at\":\"2021-12-08 09:22:18\",\"created_at\":\"2021-12-08 09:22:18\",\"id\":12,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-12-08 03:52:18', '2021-12-08 03:52:18'),
(77, 'created', 13, 'App\\Models\\Product', 1, '{\"discount\":\"0\",\"name\":\"Product Test1\",\"price\":\"50\",\"moq\":\"15\",\"dispatch_time\":null,\"rrp\":null,\"product_category_id\":null,\"product_sub_category_id\":null,\"description\":null,\"sku\":\"SKU1\",\"hsn\":\"HSN\",\"quantity\":null,\"vendor_id\":\"1\",\"slug\":\"product-test11\",\"updated_at\":\"2021-12-08 09:23:24\",\"created_at\":\"2021-12-08 09:23:24\",\"id\":13,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-12-08 03:53:24', '2021-12-08 03:53:24'),
(81, 'created', 17, 'App\\Models\\Product', 1, '{\"discount\":\"0\",\"vendor_id\":\"1\",\"name\":\"Product Test2\",\"price\":\"78\",\"moq\":\"1\",\"dispatch_time\":null,\"rrp\":null,\"product_category_id\":\"1\",\"product_sub_category_id\":\"5\",\"description\":null,\"sku\":\"SKU\",\"hsn\":null,\"quantity\":null,\"slug\":\"product-test2\",\"updated_at\":\"2021-12-08 10:17:24\",\"created_at\":\"2021-12-08 10:17:24\",\"id\":17,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-12-08 04:47:24', '2021-12-08 04:47:24'),
(82, 'updated', 17, 'App\\Models\\Product', 1, '{\"id\":17,\"vendor_id\":1,\"name\":\"Product Test2\",\"slug\":\"product-test2\",\"description\":null,\"price\":\"78.00\",\"moq\":\"1\",\"discount\":\"0.00\",\"product_category_id\":\"1\",\"product_sub_category_id\":\"5\",\"dispatch_time\":null,\"rrp\":null,\"approval_status\":\"APPROVED\",\"quantity\":null,\"sku\":\"SKU\",\"hsn\":\"HSN5\",\"created_at\":\"2021-12-08 10:17:24\",\"updated_at\":\"2021-12-08 10:25:19\",\"deleted_at\":null,\"brand_id\":null,\"images\":[{\"id\":18,\"model_type\":\"App\\\\Models\\\\Product\",\"model_id\":17,\"uuid\":\"49c4a67e-eb47-472c-b614-c3d081e23061\",\"collection_name\":\"images\",\"name\":\"61b086319cbac_61IO4txt5ZL._SL1200_\",\"file_name\":\"61b086319cbac_61IO4txt5ZL._SL1200_.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":76769,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":11,\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"created_at\":\"2021-12-08T10:17:24.000000Z\",\"updated_at\":\"2021-12-08T10:17:25.000000Z\",\"url\":\"http:\\/\\/localhost:8000\\/storage\\/18\\/61b086319cbac_61IO4txt5ZL._SL1200_.jpg\",\"thumbnail\":\"http:\\/\\/localhost:8000\\/storage\\/18\\/conversions\\/61b086319cbac_61IO4txt5ZL._SL1200_-thumb.jpg\",\"preview\":\"http:\\/\\/localhost:8000\\/storage\\/18\\/conversions\\/61b086319cbac_61IO4txt5ZL._SL1200_-preview.jpg\",\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/18\\/61b086319cbac_61IO4txt5ZL._SL1200_.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/18\\/conversions\\/61b086319cbac_61IO4txt5ZL._SL1200_-preview.jpg\"},{\"id\":19,\"model_type\":\"App\\\\Models\\\\Product\",\"model_id\":17,\"uuid\":\"979d3ae2-0906-425e-b806-a3e65e878ad0\",\"collection_name\":\"images\",\"name\":\"61b086321beec_31g08PW3dtL._SX466_\",\"file_name\":\"61b086321beec_31g08PW3dtL._SX466_.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":12500,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":12,\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"created_at\":\"2021-12-08T10:17:25.000000Z\",\"updated_at\":\"2021-12-08T10:17:26.000000Z\",\"url\":\"http:\\/\\/localhost:8000\\/storage\\/19\\/61b086321beec_31g08PW3dtL._SX466_.jpg\",\"thumbnail\":\"http:\\/\\/localhost:8000\\/storage\\/19\\/conversions\\/61b086321beec_31g08PW3dtL._SX466_-thumb.jpg\",\"preview\":\"http:\\/\\/localhost:8000\\/storage\\/19\\/conversions\\/61b086321beec_31g08PW3dtL._SX466_-preview.jpg\",\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/19\\/61b086321beec_31g08PW3dtL._SX466_.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/19\\/conversions\\/61b086321beec_31g08PW3dtL._SX466_-preview.jpg\"},{\"id\":20,\"model_type\":\"App\\\\Models\\\\Product\",\"model_id\":17,\"uuid\":\"f31c7e01-3739-4e99-bdb9-8fbc607e0757\",\"collection_name\":\"images\",\"name\":\"61b086328dc88_61SsDH42C2L._SL1500_\",\"file_name\":\"61b086328dc88_61SsDH42C2L._SL1500_.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":66673,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":13,\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"created_at\":\"2021-12-08T10:17:26.000000Z\",\"updated_at\":\"2021-12-08T10:17:27.000000Z\",\"url\":\"http:\\/\\/localhost:8000\\/storage\\/20\\/61b086328dc88_61SsDH42C2L._SL1500_.jpg\",\"thumbnail\":\"http:\\/\\/localhost:8000\\/storage\\/20\\/conversions\\/61b086328dc88_61SsDH42C2L._SL1500_-thumb.jpg\",\"preview\":\"http:\\/\\/localhost:8000\\/storage\\/20\\/conversions\\/61b086328dc88_61SsDH42C2L._SL1500_-preview.jpg\",\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/20\\/61b086328dc88_61SsDH42C2L._SL1500_.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/20\\/conversions\\/61b086328dc88_61SsDH42C2L._SL1500_-preview.jpg\"}],\"media\":[{\"id\":18,\"model_type\":\"App\\\\Models\\\\Product\",\"model_id\":17,\"uuid\":\"49c4a67e-eb47-472c-b614-c3d081e23061\",\"collection_name\":\"images\",\"name\":\"61b086319cbac_61IO4txt5ZL._SL1200_\",\"file_name\":\"61b086319cbac_61IO4txt5ZL._SL1200_.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":76769,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":11,\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"created_at\":\"2021-12-08T10:17:24.000000Z\",\"updated_at\":\"2021-12-08T10:17:25.000000Z\",\"url\":\"http:\\/\\/localhost:8000\\/storage\\/18\\/61b086319cbac_61IO4txt5ZL._SL1200_.jpg\",\"thumbnail\":\"http:\\/\\/localhost:8000\\/storage\\/18\\/conversions\\/61b086319cbac_61IO4txt5ZL._SL1200_-thumb.jpg\",\"preview\":\"http:\\/\\/localhost:8000\\/storage\\/18\\/conversions\\/61b086319cbac_61IO4txt5ZL._SL1200_-preview.jpg\",\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/18\\/61b086319cbac_61IO4txt5ZL._SL1200_.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/18\\/conversions\\/61b086319cbac_61IO4txt5ZL._SL1200_-preview.jpg\"},{\"id\":19,\"model_type\":\"App\\\\Models\\\\Product\",\"model_id\":17,\"uuid\":\"979d3ae2-0906-425e-b806-a3e65e878ad0\",\"collection_name\":\"images\",\"name\":\"61b086321beec_31g08PW3dtL._SX466_\",\"file_name\":\"61b086321beec_31g08PW3dtL._SX466_.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":12500,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":12,\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"created_at\":\"2021-12-08T10:17:25.000000Z\",\"updated_at\":\"2021-12-08T10:17:26.000000Z\",\"url\":\"http:\\/\\/localhost:8000\\/storage\\/19\\/61b086321beec_31g08PW3dtL._SX466_.jpg\",\"thumbnail\":\"http:\\/\\/localhost:8000\\/storage\\/19\\/conversions\\/61b086321beec_31g08PW3dtL._SX466_-thumb.jpg\",\"preview\":\"http:\\/\\/localhost:8000\\/storage\\/19\\/conversions\\/61b086321beec_31g08PW3dtL._SX466_-preview.jpg\",\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/19\\/61b086321beec_31g08PW3dtL._SX466_.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/19\\/conversions\\/61b086321beec_31g08PW3dtL._SX466_-preview.jpg\"},{\"id\":20,\"model_type\":\"App\\\\Models\\\\Product\",\"model_id\":17,\"uuid\":\"f31c7e01-3739-4e99-bdb9-8fbc607e0757\",\"collection_name\":\"images\",\"name\":\"61b086328dc88_61SsDH42C2L._SL1500_\",\"file_name\":\"61b086328dc88_61SsDH42C2L._SL1500_.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":66673,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":13,\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"created_at\":\"2021-12-08T10:17:26.000000Z\",\"updated_at\":\"2021-12-08T10:17:27.000000Z\",\"url\":\"http:\\/\\/localhost:8000\\/storage\\/20\\/61b086328dc88_61SsDH42C2L._SL1500_.jpg\",\"thumbnail\":\"http:\\/\\/localhost:8000\\/storage\\/20\\/conversions\\/61b086328dc88_61SsDH42C2L._SL1500_-thumb.jpg\",\"preview\":\"http:\\/\\/localhost:8000\\/storage\\/20\\/conversions\\/61b086328dc88_61SsDH42C2L._SL1500_-preview.jpg\",\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/20\\/61b086328dc88_61SsDH42C2L._SL1500_.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/20\\/conversions\\/61b086328dc88_61SsDH42C2L._SL1500_-preview.jpg\"}]}', '127.0.0.1', '2021-12-08 04:55:19', '2021-12-08 04:55:19'),
(83, 'created', 18, 'App\\Models\\Product', NULL, '{\"discount\":\"0\",\"name\":\"Product Test\",\"price\":\"478\",\"moq\":\"78\",\"dispatch_time\":null,\"rrp\":null,\"product_category_id\":\"4\",\"product_sub_category_id\":\"48\",\"description\":null,\"sku\":\"SKU\",\"hsn\":null,\"quantity\":null,\"vendor_id\":1,\"slug\":\"product-test3\",\"updated_at\":\"2021-12-08 13:42:31\",\"created_at\":\"2021-12-08 13:42:31\",\"id\":18,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-12-08 08:12:31', '2021-12-08 08:12:31'),
(84, 'updated', 1, 'App\\Models\\Vendor', NULL, '{\"id\":1,\"name\":\"Company\",\"email\":\"homver30@gmail.com\",\"mobile\":\"9109844778\",\"user_type\":\"MANUFACTURER\",\"email_verified_at\":null,\"mobile_verified_at\":null,\"verification_token\":null,\"mobile_verification_token\":null,\"approved\":0,\"verified\":1,\"verified_at\":null,\"created_at\":\"2021-12-03 09:16:38\",\"updated_at\":\"2021-12-08 14:01:56\",\"deleted_at\":null}', '127.0.0.1', '2021-12-08 08:31:56', '2021-12-08 08:31:56');
INSERT INTO `audit_logs` (`id`, `description`, `subject_id`, `subject_type`, `admin_id`, `properties`, `host`, `created_at`, `updated_at`) VALUES
(85, 'updated', 1, 'App\\Models\\VendorProfile', NULL, '{\"id\":1,\"vendor_id\":1,\"company_name\":\"Company\",\"representative_name\":\"Representative\",\"email\":\"homver30@gmail.com\",\"mobile\":\"9109844778\",\"gst_number\":\"GSIN\",\"pan_number\":\"PAN\",\"billing_address\":\"Billing Address\",\"billing_address_two\":null,\"billing_state_id\":\"7\",\"billing_district_id\":\"111\",\"billing_pincode\":\"492001\",\"pickup_address\":\"pickup\",\"pickup_address_two\":null,\"pickup_state_id\":\"1\",\"pickup_district_id\":\"2\",\"pickup_pincode\":\"492001\",\"bank_name\":\"Bank\",\"account_number\":\"123456\",\"account_holder_name\":\"Homesh\",\"ifsc_code\":\"IFSC\",\"created_at\":\"2021-12-03 09:16:38\",\"updated_at\":\"2021-12-08 14:01:56\",\"deleted_at\":null,\"pan_card\":{\"id\":2,\"model_type\":\"App\\\\Models\\\\VendorProfile\",\"model_id\":1,\"uuid\":\"b2908050-0271-41e2-ab9a-665af17ea831\",\"collection_name\":\"pan_card\",\"name\":\"500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC\",\"file_name\":\"500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":48510,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":2,\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"created_at\":\"2021-12-03T09:16:39.000000Z\",\"updated_at\":\"2021-12-03T09:16:39.000000Z\",\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/2\\/500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/2\\/conversions\\/500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC-preview.jpg\"},\"gst\":{\"id\":1,\"model_type\":\"App\\\\Models\\\\VendorProfile\",\"model_id\":1,\"uuid\":\"21365fc1-5794-4fdb-82d5-a5243d86207c\",\"collection_name\":\"gst\",\"name\":\"515DsF20K1L._SL1080_\",\"file_name\":\"515DsF20K1L._SL1080_.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":61899,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":1,\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"created_at\":\"2021-12-03T09:16:38.000000Z\",\"updated_at\":\"2021-12-03T09:16:39.000000Z\",\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/1\\/515DsF20K1L._SL1080_.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/1\\/conversions\\/515DsF20K1L._SL1080_-preview.jpg\"},\"media\":[{\"id\":1,\"model_type\":\"App\\\\Models\\\\VendorProfile\",\"model_id\":1,\"uuid\":\"21365fc1-5794-4fdb-82d5-a5243d86207c\",\"collection_name\":\"gst\",\"name\":\"515DsF20K1L._SL1080_\",\"file_name\":\"515DsF20K1L._SL1080_.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":61899,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":1,\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"created_at\":\"2021-12-03T09:16:38.000000Z\",\"updated_at\":\"2021-12-03T09:16:39.000000Z\",\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/1\\/515DsF20K1L._SL1080_.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/1\\/conversions\\/515DsF20K1L._SL1080_-preview.jpg\"},{\"id\":2,\"model_type\":\"App\\\\Models\\\\VendorProfile\",\"model_id\":1,\"uuid\":\"b2908050-0271-41e2-ab9a-665af17ea831\",\"collection_name\":\"pan_card\",\"name\":\"500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC\",\"file_name\":\"500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":48510,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":2,\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"created_at\":\"2021-12-03T09:16:39.000000Z\",\"updated_at\":\"2021-12-03T09:16:39.000000Z\",\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/2\\/500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/2\\/conversions\\/500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC-preview.jpg\"}]}', '127.0.0.1', '2021-12-08 08:31:56', '2021-12-08 08:31:56'),
(86, 'updated', 18, 'App\\Models\\Product', 1, '{\"id\":18,\"vendor_id\":1,\"name\":\"Product Test\",\"slug\":\"product-test3\",\"description\":null,\"price\":\"478.00\",\"moq\":78,\"discount\":\"0.00\",\"product_category_id\":4,\"product_sub_category_id\":48,\"dispatch_time\":null,\"rrp\":null,\"approval_status\":\"APPROVED\",\"quantity\":null,\"sku\":\"SKU\",\"hsn\":null,\"created_at\":\"2021-12-08 13:42:31\",\"updated_at\":\"2021-12-09 09:02:56\",\"deleted_at\":null,\"brand_id\":null,\"images\":[],\"media\":[]}', '127.0.0.1', '2021-12-09 03:32:56', '2021-12-09 03:32:56'),
(87, 'updated', 1, 'App\\Models\\VendorProfile', NULL, '{\"id\":1,\"vendor_id\":1,\"company_name\":\"Company\",\"representative_name\":\"Representative\",\"email\":\"homver30@gmail.com\",\"mobile\":\"9109844778\",\"gst_number\":\"GSIN\",\"pan_number\":\"PAN\",\"billing_address\":\"Billing Address\",\"billing_address_two\":null,\"billing_state_id\":7,\"billing_district_id\":111,\"billing_pincode\":\"492001\",\"pickup_address\":\"pickup\",\"pickup_address_two\":null,\"pickup_state_id\":1,\"pickup_district_id\":2,\"pickup_pincode\":\"492001\",\"bank_name\":\"Bank\",\"account_number\":\"123456\",\"account_holder_name\":\"Homesh\",\"ifsc_code\":\"IFSC\",\"mop\":\"2000\",\"created_at\":\"2021-12-03 09:16:38\",\"updated_at\":\"2021-12-09 09:25:17\",\"deleted_at\":null,\"pan_card\":{\"id\":2,\"model_type\":\"App\\\\Models\\\\VendorProfile\",\"model_id\":1,\"uuid\":\"b2908050-0271-41e2-ab9a-665af17ea831\",\"collection_name\":\"pan_card\",\"name\":\"500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC\",\"file_name\":\"500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":48510,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":2,\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"created_at\":\"2021-12-03T09:16:39.000000Z\",\"updated_at\":\"2021-12-03T09:16:39.000000Z\",\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/2\\/500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/2\\/conversions\\/500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC-preview.jpg\"},\"gst\":{\"id\":1,\"model_type\":\"App\\\\Models\\\\VendorProfile\",\"model_id\":1,\"uuid\":\"21365fc1-5794-4fdb-82d5-a5243d86207c\",\"collection_name\":\"gst\",\"name\":\"515DsF20K1L._SL1080_\",\"file_name\":\"515DsF20K1L._SL1080_.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":61899,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":1,\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"created_at\":\"2021-12-03T09:16:38.000000Z\",\"updated_at\":\"2021-12-03T09:16:39.000000Z\",\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/1\\/515DsF20K1L._SL1080_.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/1\\/conversions\\/515DsF20K1L._SL1080_-preview.jpg\"},\"media\":[{\"id\":1,\"model_type\":\"App\\\\Models\\\\VendorProfile\",\"model_id\":1,\"uuid\":\"21365fc1-5794-4fdb-82d5-a5243d86207c\",\"collection_name\":\"gst\",\"name\":\"515DsF20K1L._SL1080_\",\"file_name\":\"515DsF20K1L._SL1080_.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":61899,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":1,\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"created_at\":\"2021-12-03T09:16:38.000000Z\",\"updated_at\":\"2021-12-03T09:16:39.000000Z\",\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/1\\/515DsF20K1L._SL1080_.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/1\\/conversions\\/515DsF20K1L._SL1080_-preview.jpg\"},{\"id\":2,\"model_type\":\"App\\\\Models\\\\VendorProfile\",\"model_id\":1,\"uuid\":\"b2908050-0271-41e2-ab9a-665af17ea831\",\"collection_name\":\"pan_card\",\"name\":\"500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC\",\"file_name\":\"500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg\",\"mime_type\":\"image\\/jpeg\",\"disk\":\"public\",\"conversions_disk\":\"public\",\"size\":48510,\"manipulations\":[],\"custom_properties\":[],\"responsive_images\":[],\"order_column\":2,\"generated_conversions\":{\"thumb\":true,\"preview\":true},\"created_at\":\"2021-12-03T09:16:39.000000Z\",\"updated_at\":\"2021-12-03T09:16:39.000000Z\",\"original_url\":\"http:\\/\\/localhost:8000\\/storage\\/2\\/500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg\",\"preview_url\":\"http:\\/\\/localhost:8000\\/storage\\/2\\/conversions\\/500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC-preview.jpg\"}]}', '127.0.0.1', '2021-12-09 03:55:17', '2021-12-09 03:55:17');

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
  `product_option_id` bigint(20) UNSIGNED NOT NULL,
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

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Coromandel International Limited', 1, '2021-04-06 22:15:33', '2021-04-06 22:15:33', NULL),
(2, 'Deepak Fertilisers and Petrochemicals Corporation Limited', 1, '2021-04-06 22:15:51', '2021-04-06 22:15:51', NULL),
(3, 'Fertilisers And Chemicals Travancore Limited (FACT)', 1, '2021-04-06 22:16:11', '2021-04-06 22:16:11', NULL),
(4, 'Gujarat Narmada Valley Fertilizers & Chemicals Limited (GNFC)', 1, '2021-04-06 22:16:23', '2021-04-06 22:16:23', NULL),
(5, 'Taparia', 1, '2021-04-10 12:38:58', '2021-04-10 12:38:58', NULL),
(6, 'Falcon', 1, '2021-04-10 12:48:13', '2021-04-10 12:48:13', NULL),
(7, 'Kohinoor', 1, '2021-04-10 12:52:08', '2021-04-10 12:52:08', NULL),
(8, 'Crompton Greaves limited', 1, '2021-04-10 12:55:39', '2021-04-10 12:55:39', NULL),
(9, 'Test Brand', 0, '2021-06-02 08:29:10', '2021-06-02 08:29:10', NULL),
(10, 'test', 0, '2021-06-02 10:59:48', '2021-06-02 10:59:48', NULL),
(11, 'new', 0, '2021-06-02 11:00:06', '2021-06-02 11:00:06', NULL),
(12, 'tests', 1, '2021-06-02 11:01:23', '2021-06-02 11:01:23', NULL),
(13, 'test', 1, '2021-06-02 11:03:09', '2021-06-02 11:06:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_option_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `product_option_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 6, '2021-12-03 04:04:54', '2021-12-03 04:05:58'),
(2, 1, 2, NULL, 12, '2021-12-03 04:05:23', '2021-12-03 04:05:23'),
(4, 1, 3, NULL, 5, '2021-12-03 13:03:40', '2021-12-03 13:03:40');

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
(1, 'Nicobar', 1, 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(2, 'North and Middle Andaman', 1, 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(3, 'South Andaman', 1, 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(4, 'Anantapur', 2, 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(5, 'Chittoor', 2, 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(6, 'East Godavari', 2, 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(7, 'Guntur', 2, 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(8, 'Krishna', 2, 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(9, 'Kurnool', 2, 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(10, 'Prakasam', 2, 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(11, 'Srikakulam', 2, 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(12, 'Sri Potti Sriramulu Nellore', 2, 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(13, 'Visakhapatnam', 2, 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(14, 'Vizianagaram', 2, 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(15, 'West Godavari', 2, 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(16, 'YSR District, Kadapa (Cuddapah)', 2, 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(17, 'Anjaw', 3, 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(18, 'Changlang', 3, 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(19, 'Dibang Valley', 3, 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(20, 'East Kameng', 3, 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(21, 'East Siang', 3, 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(22, 'Kra Daadi', 3, 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(23, 'Kurung Kumey', 3, 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(24, 'Lohit', 3, 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(25, 'Longding', 3, 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(26, 'Lower Dibang Valley', 3, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(27, 'Lower Siang', 3, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(28, 'Lower Subansiri', 3, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(29, 'Namsai', 3, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(30, 'Papum Pare', 3, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(31, 'Siang', 3, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(32, 'Tawang', 3, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(33, 'Tirap', 3, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(34, 'Upper Siang', 3, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(35, 'Upper Subansiri', 3, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(36, 'West Kameng', 3, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(37, 'West Siang', 3, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(38, 'Baksa', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(39, 'Barpeta', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(40, 'Biswanath', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(41, 'Bongaigaon', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(42, 'Cachar', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(43, 'Charaideo', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(44, 'Chirang', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(45, 'Darrang', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(46, 'Dhemaji', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(47, 'Dhubri', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(48, 'Dibrugarh', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(49, 'Dima Hasao (North Cachar Hills)', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(50, 'Goalpara', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(51, 'Golaghat', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(52, 'Hailakandi', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(53, 'Hojai', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(54, 'Jorhat', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(55, 'Kamrup', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(56, 'Kamrup Metropolitan', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(57, 'Karbi Anglong', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(58, 'Karimganj', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(59, 'Kokrajhar', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(60, 'Lakhimpur', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(61, 'Majuli', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(62, 'Morigaon', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(63, 'Nagaon', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(64, 'Nalbari', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(65, 'Sivasagar', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(66, 'Sonitpur', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(67, 'South Salamara-Mankachar', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(68, 'Tinsukia', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(69, 'Udalguri', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(70, 'West Karbi Anglong', 4, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(71, 'Araria', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(72, 'Arwal', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(73, 'Aurangabad', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(74, 'Banka', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(75, 'Begusarai', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(76, 'Bhagalpur', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(77, 'Bhojpur', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(78, 'Buxar', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(79, 'Darbhanga', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(80, 'East Champaran (Motihari)', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(81, 'Gaya', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(82, 'Gopalganj', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(83, 'Jamui', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(84, 'Jehanabad', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(85, 'Kaimur (Bhabua)', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(86, 'Katihar', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(87, 'Khagaria', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(88, 'Kishanganj', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(89, 'Lakhisarai', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(90, 'Madhepura', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(91, 'Madhubani', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(92, 'Munger (Monghyr)', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(93, 'Muzaffarpur', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(94, 'Nalanda', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(95, 'Nawada', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(96, 'Patna', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(97, 'Purnia (Purnea)', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(98, 'Rohtas', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(99, 'Saharsa', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(100, 'Samastipur', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(101, 'Saran', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(102, 'Sheikhpura', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(103, 'Sheohar', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(104, 'Sitamarhi', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(105, 'Siwan', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(106, 'Supaul', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(107, 'Vaishali', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(108, 'West Champaran', 5, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(109, 'Chandigarh', 6, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(110, 'Balod', 7, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(111, 'Baloda Bazar', 7, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(112, 'Balrampur', 7, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(113, 'Bastar', 7, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(114, 'Bemetara', 7, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(115, 'Bijapur', 7, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(116, 'Bilaspur', 7, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(117, 'Dantewada (South Bastar)', 7, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(118, 'Dhamtari', 7, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(119, 'Durg', 7, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(120, 'Gariyaband', 7, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(121, 'Janjgir-Champa', 7, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(122, 'Jashpur', 7, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(123, 'Kabirdham (Kawardha)', 7, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(124, 'Kanker (North Bastar)', 7, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(125, 'Kondagaon', 7, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(126, 'Korba', 7, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(127, 'Korea (Koriya)', 7, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(128, 'Mahasamund', 7, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(129, 'Mungeli', 7, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(130, 'Narayanpur', 7, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(131, 'Raigarh', 7, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(132, 'Raipur', 7, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(133, 'Rajnandgaon', 7, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(134, 'Sukma', 7, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(135, 'Surajpur  ', 7, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(136, 'Surguja', 7, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(137, 'Dadra & Nagar Haveli', 8, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(138, 'Daman', 9, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(139, 'Diu', 9, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(140, 'Central Delhi', 10, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(141, 'East Delhi', 10, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(142, 'New Delhi', 10, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(143, 'North Delhi', 10, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(144, 'North East  Delhi', 10, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(145, 'North West  Delhi', 10, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(146, 'Shahdara', 10, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(147, 'South Delhi', 10, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(148, 'South East Delhi', 10, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(149, 'South West  Delhi', 10, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(150, 'West Delhi', 10, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(151, 'North Goa', 11, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(152, 'South Goa', 11, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(153, 'Ahmedabad', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(154, 'Amreli', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(155, 'Anand', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(156, 'Aravalli', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(157, 'Banaskantha (Palanpur)', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(158, 'Bharuch', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(159, 'Bhavnagar', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(160, 'Botad', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(161, 'Chhota Udepur', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(162, 'Dahod', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(163, 'Dangs (Ahwa)', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(164, 'Devbhoomi Dwarka', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(165, 'Gandhinagar', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(166, 'Gir Somnath', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(167, 'Jamnagar', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(168, 'Junagadh', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(169, 'Kachchh', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(170, 'Kheda (Nadiad)', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(171, 'Mahisagar', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(172, 'Mehsana', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(173, 'Morbi', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(174, 'Narmada (Rajpipla)', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(175, 'Navsari', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(176, 'Panchmahal (Godhra)', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(177, 'Patan', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(178, 'Porbandar', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(179, 'Rajkot', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(180, 'Sabarkantha (Himmatnagar)', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(181, 'Surat', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(182, 'Surendranagar', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(183, 'Tapi (Vyara)', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(184, 'Vadodara', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(185, 'Valsad', 12, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(186, 'Ambala', 13, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(187, 'Bhiwani', 13, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(188, 'Charkhi Dadri', 13, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(189, 'Faridabad', 13, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(190, 'Fatehabad', 13, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(191, 'Gurgaon', 13, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(192, 'Hisar', 13, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(193, 'Jhajjar', 13, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(194, 'Jind', 13, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(195, 'Kaithal', 13, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(196, 'Karnal', 13, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(197, 'Kurukshetra', 13, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(198, 'Mahendragarh', 13, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(199, 'Mewat', 13, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(200, 'Palwal', 13, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(201, 'Panchkula', 13, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(202, 'Panipat', 13, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(203, 'Rewari', 13, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(204, 'Rohtak', 13, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(205, 'Sirsa', 13, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(206, 'Sonipat', 13, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(207, 'Yamunanagar', 13, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(208, 'Bilaspur', 14, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(209, 'Chamba', 14, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(210, 'Hamirpur', 14, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(211, 'Kangra', 14, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(212, 'Kinnaur', 14, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(213, 'Kullu', 14, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(214, 'Lahaul & Spiti', 14, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(215, 'Mandi', 14, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(216, 'Shimla', 14, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(217, 'Sirmaur (Sirmour)', 14, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(218, 'Solan', 14, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(219, 'Una', 14, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(220, 'Anantnag', 15, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(221, 'Bandipore', 15, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(222, 'Baramulla', 15, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(223, 'Budgam', 15, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(224, 'Doda', 15, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(225, 'Ganderbal', 15, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(226, 'Jammu', 15, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(227, 'Kargil', 15, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(228, 'Kathua', 15, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(229, 'Kishtwar', 15, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(230, 'Kulgam', 15, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(231, 'Kupwara', 15, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(232, 'Leh', 15, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(233, 'Poonch', 15, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(234, 'Pulwama', 15, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(235, 'Rajouri', 15, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(236, 'Ramban', 15, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(237, 'Reasi', 15, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(238, 'Samba', 15, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(239, 'Shopian', 15, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(240, 'Srinagar', 15, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(241, 'Udhampur', 15, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(242, 'Bokaro', 16, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(243, 'Chatra', 16, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(244, 'Deoghar', 16, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(245, 'Dhanbad', 16, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(246, 'Dumka', 16, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(247, 'East Singhbhum', 16, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(248, 'Garhwa', 16, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(249, 'Giridih', 16, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(250, 'Godda', 16, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(251, 'Gumla', 16, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(252, 'Hazaribag', 16, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(253, 'Jamtara', 16, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(254, 'Khunti', 16, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(255, 'Koderma', 16, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(256, 'Latehar', 16, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(257, 'Lohardaga', 16, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(258, 'Pakur', 16, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(259, 'Palamu', 16, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(260, 'Ramgarh', 16, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(261, 'Ranchi', 16, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(262, 'Sahibganj', 16, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(263, 'Seraikela-Kharsawan', 16, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(264, 'Simdega', 16, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(265, 'West Singhbhum', 16, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(266, 'Bagalkot', 17, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(267, 'Ballari (Bellary)', 17, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(268, 'Belagavi (Belgaum)', 17, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(269, 'Bengaluru (Bangalore) Rural', 17, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(270, 'Bengaluru (Bangalore) Urban', 17, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(271, 'Bidar', 17, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(272, 'Chamarajanagar', 17, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(273, 'Chikballapur', 17, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(274, 'Chikkamagaluru (Chikmagalur)', 17, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(275, 'Chitradurga', 17, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(276, 'Dakshina Kannada', 17, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(277, 'Davangere', 17, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(278, 'Dharwad', 17, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(279, 'Gadag', 17, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(280, 'Hassan', 17, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(281, 'Haveri', 17, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(282, 'Kalaburagi (Gulbarga)', 17, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(283, 'Kodagu', 17, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(284, 'Kolar', 17, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(285, 'Koppal', 17, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(286, 'Mandya', 17, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(287, 'Mysuru (Mysore)', 17, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(288, 'Raichur', 17, 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(289, 'Ramanagara', 17, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(290, 'Shivamogga (Shimoga)', 17, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(291, 'Tumakuru (Tumkur)', 17, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(292, 'Udupi', 17, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(293, 'Uttara Kannada (Karwar)', 17, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(294, 'Vijayapura (Bijapur)', 17, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(295, 'Yadgir', 17, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(296, 'Alappuzha', 18, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(297, 'Ernakulam', 18, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(298, 'Idukki', 18, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(299, 'Kannur', 18, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(300, 'Kasaragod', 18, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(301, 'Kollam', 18, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(302, 'Kottayam', 18, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(303, 'Kozhikode', 18, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(304, 'Malappuram', 18, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(305, 'Palakkad', 18, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(306, 'Pathanamthitta', 18, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(307, 'Thiruvananthapuram', 18, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(308, 'Thrissur', 18, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(309, 'Wayanad', 18, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(310, 'Lakshadweep', 19, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(311, 'Agar Malwa', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(312, 'Alirajpur', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(313, 'Anuppur', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(314, 'Ashoknagar', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(315, 'Balaghat', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(316, 'Barwani', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(317, 'Betul', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(318, 'Bhind', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(319, 'Bhopal', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(320, 'Burhanpur', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(321, 'Chhatarpur', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(322, 'Chhindwara', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(323, 'Damoh', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(324, 'Datia', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(325, 'Dewas', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(326, 'Dhar', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(327, 'Dindori', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(328, 'Guna', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(329, 'Gwalior', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(330, 'Harda', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(331, 'Hoshangabad', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(332, 'Indore', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(333, 'Jabalpur', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(334, 'Jhabua', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(335, 'Katni', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(336, 'Khandwa', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(337, 'Khargone', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(338, 'Mandla', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(339, 'Mandsaur', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(340, 'Morena', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(341, 'Narsinghpur', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(342, 'Neemuch', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(343, 'Panna', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(344, 'Raisen', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(345, 'Rajgarh', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(346, 'Ratlam', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(347, 'Rewa', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(348, 'Sagar', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(349, 'Satna', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(350, 'Sehore', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(351, 'Seoni', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(352, 'Shahdol', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(353, 'Shajapur', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(354, 'Sheopur', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(355, 'Shivpuri', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(356, 'Sidhi', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(357, 'Singrauli', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(358, 'Tikamgarh', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(359, 'Ujjain', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(360, 'Umaria', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(361, 'Vidisha', 20, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(362, 'Ahmednagar', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(363, 'Akola', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(364, 'Amravati', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(365, 'Aurangabad', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(366, 'Beed', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(367, 'Bhandara', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(368, 'Buldhana', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(369, 'Chandrapur', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(370, 'Dhule', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(371, 'Gadchiroli', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(372, 'Gondia', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(373, 'Hingoli', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(374, 'Jalgaon', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(375, 'Jalna', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(376, 'Kolhapur', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(377, 'Latur', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(378, 'Mumbai City', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(379, 'Mumbai Suburban', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(380, 'Nagpur', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(381, 'Nanded', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(382, 'Nandurbar', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(383, 'Nashik', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(384, 'Osmanabad', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(385, 'Palghar', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(386, 'Parbhani', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(387, 'Pune', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(388, 'Raigad', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(389, 'Ratnagiri', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(390, 'Sangli', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(391, 'Satara', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(392, 'Sindhudurg', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(393, 'Solapur', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(394, 'Thane', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(395, 'Wardha', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(396, 'Washim', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(397, 'Yavatmal', 21, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(398, 'Bishnupur', 22, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(399, 'Chandel', 22, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(400, 'Churachandpur', 22, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(401, 'Imphal East', 22, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(402, 'Imphal West', 22, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(403, 'Jiribam', 22, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(404, 'Kakching', 22, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(405, 'Kamjong', 22, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(406, 'Kangpokpi', 22, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(407, 'Noney', 22, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(408, 'Pherzawl', 22, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(409, 'Senapati', 22, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(410, 'Tamenglong', 22, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(411, 'Tengnoupal', 22, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(412, 'Thoubal', 22, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(413, 'Ukhrul', 22, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(414, 'East Garo Hills', 23, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(415, 'East Jaintia Hills', 23, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(416, 'East Khasi Hills', 23, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(417, 'North Garo Hills', 23, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(418, 'Ri Bhoi', 23, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(419, 'South Garo Hills', 23, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(420, 'South West Garo Hills ', 23, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(421, 'South West Khasi Hills', 23, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(422, 'West Garo Hills', 23, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(423, 'West Jaintia Hills', 23, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(424, 'West Khasi Hills', 23, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(425, 'Aizawl', 24, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(426, 'Champhai', 24, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(427, 'Kolasib', 24, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(428, 'Lawngtlai', 24, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(429, 'Lunglei', 24, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(430, 'Mamit', 24, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(431, 'Saiha', 24, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(432, 'Serchhip', 24, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(433, 'Dimapur', 25, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(434, 'Kiphire', 25, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(435, 'Kohima', 25, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(436, 'Longleng', 25, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(437, 'Mokokchung', 25, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(438, 'Mon', 25, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(439, 'Peren', 25, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(440, 'Phek', 25, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(441, 'Tuensang', 25, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(442, 'Wokha', 25, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(443, 'Zunheboto', 25, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(444, 'Angul', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(445, 'Balangir', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(446, 'Balasore', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(447, 'Bargarh', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(448, 'Bhadrak', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(449, 'Boudh', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(450, 'Cuttack', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(451, 'Deogarh', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(452, 'Dhenkanal', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(453, 'Gajapati', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(454, 'Ganjam', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(455, 'Jagatsinghapur', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(456, 'Jajpur', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(457, 'Jharsuguda', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(458, 'Kalahandi', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(459, 'Kandhamal', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(460, 'Kendrapara', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(461, 'Kendujhar (Keonjhar)', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(462, 'Khordha', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(463, 'Koraput', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(464, 'Malkangiri', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(465, 'Mayurbhanj', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(466, 'Nabarangpur', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(467, 'Nayagarh', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(468, 'Nuapada', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(469, 'Puri', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(470, 'Rayagada', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(471, 'Sambalpur', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(472, 'Sonepur', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(473, 'Sundargarh', 26, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(474, 'Karaikal', 27, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(475, 'Mahe', 27, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(476, 'Pondicherry', 27, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(477, 'Yanam', 27, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(478, 'Amritsar', 28, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(479, 'Barnala', 28, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(480, 'Bathinda', 28, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(481, 'Faridkot', 28, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(482, 'Fatehgarh Sahib', 28, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(483, 'Fazilka', 28, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(484, 'Ferozepur', 28, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(485, 'Gurdaspur', 28, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(486, 'Hoshiarpur', 28, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(487, 'Jalandhar', 28, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(488, 'Kapurthala', 28, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(489, 'Ludhiana', 28, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(490, 'Mansa', 28, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(491, 'Moga', 28, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(492, 'Muktsar', 28, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(493, 'Nawanshahr (Shahid Bhagat Singh Nagar)', 28, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(494, 'Pathankot', 28, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(495, 'Patiala', 28, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(496, 'Rupnagar', 28, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(497, 'Sahibzada Ajit Singh Nagar (Mohali)', 28, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(498, 'Sangrur', 28, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(499, 'Tarn Taran', 28, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(500, 'Ajmer', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(501, 'Alwar', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(502, 'Banswara', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(503, 'Baran', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(504, 'Barmer', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(505, 'Bharatpur', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(506, 'Bhilwara', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(507, 'Bikaner', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(508, 'Bundi', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(509, 'Chittorgarh', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(510, 'Churu', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(511, 'Dausa', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(512, 'Dholpur', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(513, 'Dungarpur', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(514, 'Hanumangarh', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(515, 'Jaipur', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(516, 'Jaisalmer', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(517, 'Jalore', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(518, 'Jhalawar', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(519, 'Jhunjhunu', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(520, 'Jodhpur', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(521, 'Karauli', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(522, 'Kota', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(523, 'Nagaur', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(524, 'Pali', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(525, 'Pratapgarh', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(526, 'Rajsamand', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(527, 'Sawai Madhopur', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(528, 'Sikar', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(529, 'Sirohi', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(530, 'Sri Ganganagar', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(531, 'Tonk', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(532, 'Udaipur', 29, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(533, 'East Sikkim', 30, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(534, 'North Sikkim', 30, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(535, 'South Sikkim', 30, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(536, 'West Sikkim', 30, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(537, 'Ariyalur', 31, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(538, 'Chennai', 31, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(539, 'Coimbatore', 31, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(540, 'Cuddalore', 31, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(541, 'Dharmapuri', 31, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(542, 'Dindigul', 31, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(543, 'Erode', 31, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(544, 'Kanchipuram', 31, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(545, 'Kanyakumari', 31, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(546, 'Karur', 31, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(547, 'Krishnagiri', 31, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(548, 'Madurai', 31, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(549, 'Nagapattinam', 31, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(550, 'Namakkal', 31, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(551, 'Nilgiris', 31, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(552, 'Perambalur', 31, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(553, 'Pudukkottai', 31, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(554, 'Ramanathapuram', 31, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(555, 'Salem', 31, 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(556, 'Sivaganga', 31, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(557, 'Thanjavur', 31, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(558, 'Theni', 31, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(559, 'Thoothukudi (Tuticorin)', 31, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(560, 'Tiruchirappalli', 31, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(561, 'Tirunelveli', 31, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(562, 'Tiruppur', 31, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(563, 'Tiruvallur', 31, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(564, 'Tiruvannamalai', 31, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(565, 'Tiruvarur', 31, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(566, 'Vellore', 31, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(567, 'Viluppuram', 31, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(568, 'Virudhunagar', 31, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(569, 'Adilabad', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(570, 'Bhadradri Kothagudem', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(571, 'Hyderabad', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(572, 'Jagtial', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(573, 'Jangaon', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(574, 'Jayashankar Bhoopalpally', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(575, 'Jogulamba Gadwal', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(576, 'Kamareddy', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(577, 'Karimnagar', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(578, 'Khammam', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(579, 'Komaram Bheem Asifabad', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(580, 'Mahabubabad', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(581, 'Mahabubnagar', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(582, 'Mancherial', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(583, 'Medak', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(584, 'Medchal', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(585, 'Nagarkurnool', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(586, 'Nalgonda', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(587, 'Nirmal', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(588, 'Nizamabad', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(589, 'Peddapalli', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(590, 'Rajanna Sircilla', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(591, 'Rangareddy', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(592, 'Sangareddy', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(593, 'Siddipet', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(594, 'Suryapet', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(595, 'Vikarabad', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(596, 'Wanaparthy', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(597, 'Warangal (Rural)', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(598, 'Warangal (Urban)', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(599, 'Yadadri Bhuvanagiri', 32, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(600, 'Dhalai', 33, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(601, 'Gomati', 33, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(602, 'Khowai', 33, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(603, 'North Tripura', 33, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(604, 'Sepahijala', 33, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(605, 'South Tripura', 33, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(606, 'Unakoti', 33, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(607, 'West Tripura', 33, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(608, 'Almora', 34, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(609, 'Bageshwar', 34, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(610, 'Chamoli', 34, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(611, 'Champawat', 34, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(612, 'Dehradun', 34, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(613, 'Haridwar', 34, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(614, 'Nainital', 34, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(615, 'Pauri Garhwal', 34, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(616, 'Pithoragarh', 34, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(617, 'Rudraprayag', 34, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(618, 'Tehri Garhwal', 34, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(619, 'Udham Singh Nagar', 34, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(620, 'Uttarkashi', 34, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(621, 'Agra', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(622, 'Aligarh', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(623, 'Allahabad', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(624, 'Ambedkar Nagar', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(625, 'Amethi (Chatrapati Sahuji Mahraj Nagar)', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(626, 'Amroha (J.P. Nagar)', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(627, 'Auraiya', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(628, 'Azamgarh', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(629, 'Baghpat', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(630, 'Bahraich', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(631, 'Ballia', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(632, 'Balrampur', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(633, 'Banda', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(634, 'Barabanki', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(635, 'Bareilly', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(636, 'Basti', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(637, 'Bhadohi', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(638, 'Bijnor', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(639, 'Budaun', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(640, 'Bulandshahr', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(641, 'Chandauli', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(642, 'Chitrakoot', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(643, 'Deoria', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(644, 'Etah', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(645, 'Etawah', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(646, 'Faizabad', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(647, 'Farrukhabad', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(648, 'Fatehpur', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(649, 'Firozabad', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL);
INSERT INTO `districts` (`id`, `name`, `state_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(650, 'Gautam Buddha Nagar', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(651, 'Ghaziabad', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(652, 'Ghazipur', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(653, 'Gonda', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(654, 'Gorakhpur', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(655, 'Hamirpur', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(656, 'Hapur (Panchsheel Nagar)', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(657, 'Hardoi', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(658, 'Hathras', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(659, 'Jalaun', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(660, 'Jaunpur', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(661, 'Jhansi', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(662, 'Kannauj', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(663, 'Kanpur Dehat', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(664, 'Kanpur Nagar', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(665, 'Kanshiram Nagar (Kasganj)', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(666, 'Kaushambi', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(667, 'Kushinagar (Padrauna)', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(668, 'Lakhimpur - Kheri', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(669, 'Lalitpur', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(670, 'Lucknow', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(671, 'Maharajganj', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(672, 'Mahoba', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(673, 'Mainpuri', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(674, 'Mathura', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(675, 'Mau', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(676, 'Meerut', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(677, 'Mirzapur', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(678, 'Moradabad', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(679, 'Muzaffarnagar', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(680, 'Pilibhit', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(681, 'Pratapgarh', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(682, 'RaeBareli', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(683, 'Rampur', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(684, 'Saharanpur', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(685, 'Sambhal (Bhim Nagar)', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(686, 'Sant Kabir Nagar', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(687, 'Shahjahanpur', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(688, 'Shamali (Prabuddh Nagar)', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(689, 'Shravasti', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(690, 'Siddharth Nagar', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(691, 'Sitapur', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(692, 'Sonbhadra', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(693, 'Sultanpur', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(694, 'Unnao', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(695, 'Varanasi', 35, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(696, 'Alipurduar', 36, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(697, 'Bankura', 36, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(698, 'Birbhum', 36, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(699, 'Cooch Behar', 36, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(700, 'Dakshin Dinajpur (South Dinajpur)', 36, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(701, 'Darjeeling', 36, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(702, 'Hooghly', 36, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(703, 'Howrah', 36, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(704, 'Jalpaiguri', 36, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(705, 'Jhargram', 36, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(706, 'Kalimpong', 36, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(707, 'Kolkata', 36, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(708, 'Malda', 36, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(709, 'Murshidabad', 36, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(710, 'Nadia', 36, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(711, 'North 24 Parganas', 36, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(712, 'Paschim Medinipur (West Medinipur)', 36, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(713, 'Paschim (West) Burdwan (Bardhaman)', 36, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(714, 'Purba Burdwan (Bardhaman)', 36, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(715, 'Purba Medinipur (East Medinipur)', 36, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(716, 'Purulia', 36, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(717, 'South 24 Parganas', 36, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(718, 'Uttar Dinajpur (North Dinajpur)', 36, 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(719, 'Gariaband', 7, 1, '2021-04-05 08:47:35', '2021-04-05 08:52:15', '2021-04-05 08:52:15'),
(720, 'New District', 37, 1, '2021-05-27 04:28:44', '2021-05-27 04:31:51', '2021-05-27 04:31:51'),
(721, 'New District', 2, 1, '2021-06-02 11:49:50', '2021-06-02 11:51:41', NULL);

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
  `product_option_id` bigint(20) UNSIGNED NOT NULL,
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
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `generated_conversions` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `responsive_images`, `order_column`, `generated_conversions`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\VendorProfile', 1, '21365fc1-5794-4fdb-82d5-a5243d86207c', 'gst', '515DsF20K1L._SL1080_', '515DsF20K1L._SL1080_.jpg', 'image/jpeg', 'public', 'public', 61899, '[]', '[]', '[]', 1, '{\"thumb\":true,\"preview\":true}', '2021-12-03 03:46:38', '2021-12-03 03:46:39'),
(2, 'App\\Models\\VendorProfile', 1, 'b2908050-0271-41e2-ab9a-665af17ea831', 'pan_card', '500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC', '500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg', 'image/jpeg', 'public', 'public', 48510, '[]', '[]', '[]', 2, '{\"thumb\":true,\"preview\":true}', '2021-12-03 03:46:39', '2021-12-03 03:46:39'),
(3, 'App\\Models\\Product', 1, '29ab9b4d-b3db-4aa7-b715-e016a98d54dd', 'images', '61a9e0c25a907_250px-Irrigat', '61a9e0c25a907_250px-Irrigat.jpg', 'image/jpeg', 'public', 'public', 15187, '[]', '[]', '[]', 3, '{\"thumb\":true,\"preview\":true}', '2021-12-03 03:51:35', '2021-12-03 03:51:36'),
(4, 'App\\Models\\Product', 1, 'af9516c5-d5fa-4a76-8519-f550804d6c9c', 'images', '61a9e0c2d797a_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC', '61a9e0c2d797a_500_F_218680465_Evhez3l0Sff6yqkPbZnLFcRissJ67uZC.jpg', 'image/jpeg', 'public', 'public', 48510, '[]', '[]', '[]', 4, '{\"thumb\":true,\"preview\":true}', '2021-12-03 03:51:36', '2021-12-03 03:51:36'),
(5, 'App\\Models\\Product', 1, '3beea4b4-1853-4cae-ad68-56d4bb0d9b1f', 'images', '61a9e0c34eb0f_515DsF20K1L._SL1080_', '61a9e0c34eb0f_515DsF20K1L._SL1080_.jpg', 'image/jpeg', 'public', 'public', 61899, '[]', '[]', '[]', 5, '{\"thumb\":true,\"preview\":true}', '2021-12-03 03:51:37', '2021-12-03 03:51:37'),
(6, 'App\\Models\\Product', 2, '59d4a7ef-89d1-4249-b097-4f578c646f70', 'images', '61a9e1d3add75_2-stroke-brush-cutter-500x500', '61a9e1d3add75_2-stroke-brush-cutter-500x500.jpg', 'image/jpeg', 'public', 'public', 18040, '[]', '[]', '[]', 6, '{\"thumb\":true,\"preview\":true}', '2021-12-03 03:54:09', '2021-12-03 03:54:10'),
(7, 'App\\Models\\Product', 2, '6d2bbd7b-0391-496c-8dc0-e71780ccdd95', 'images', '61a9e1d429f80_1-500x500', '61a9e1d429f80_1-500x500.jpg', 'image/jpeg', 'public', 'public', 61857, '[]', '[]', '[]', 7, '{\"thumb\":true,\"preview\":true}', '2021-12-03 03:54:10', '2021-12-03 03:54:11'),
(8, 'App\\Models\\Product', 2, 'c41e7d27-e610-475d-84a8-000593ed6599', 'images', '61a9e1d4ab01c_31g08PW3dtL._SX466_', '61a9e1d4ab01c_31g08PW3dtL._SX466_.jpg', 'image/jpeg', 'public', 'public', 12500, '[]', '[]', '[]', 8, '{\"thumb\":true,\"preview\":true}', '2021-12-03 03:54:11', '2021-12-03 03:54:12'),
(9, 'App\\Models\\Product', 2, 'fcf14910-0272-4aae-9444-a32c254cfd29', 'images', '61a9e1d532bc8_80-512', '61a9e1d532bc8_80-512.png', 'image/png', 'public', 'public', 30162, '[]', '[]', '[]', 9, '{\"thumb\":true,\"preview\":true}', '2021-12-03 03:54:12', '2021-12-03 03:54:12'),
(16, 'App\\Models\\Product', 13, 'bc48fdf2-39be-42af-8fc0-51e038727b6a', 'images', '61b0797026d47_250px-Irrigat', '61b0797026d47_250px-Irrigat.jpg', 'image/jpeg', 'public', 'public', 15187, '[]', '[]', '[]', 10, '{\"thumb\":true,\"preview\":true}', '2021-12-08 03:53:24', '2021-12-08 03:53:24'),
(18, 'App\\Models\\Product', 17, '49c4a67e-eb47-472c-b614-c3d081e23061', 'images', '61b086319cbac_61IO4txt5ZL._SL1200_', '61b086319cbac_61IO4txt5ZL._SL1200_.jpg', 'image/jpeg', 'public', 'public', 76769, '[]', '[]', '[]', 11, '{\"thumb\":true,\"preview\":true}', '2021-12-08 04:47:24', '2021-12-08 04:47:25'),
(19, 'App\\Models\\Product', 17, '979d3ae2-0906-425e-b806-a3e65e878ad0', 'images', '61b086321beec_31g08PW3dtL._SX466_', '61b086321beec_31g08PW3dtL._SX466_.jpg', 'image/jpeg', 'public', 'public', 12500, '[]', '[]', '[]', 12, '{\"thumb\":true,\"preview\":true}', '2021-12-08 04:47:25', '2021-12-08 04:47:26'),
(20, 'App\\Models\\Product', 17, 'f31c7e01-3739-4e99-bdb9-8fbc607e0757', 'images', '61b086328dc88_61SsDH42C2L._SL1500_', '61b086328dc88_61SsDH42C2L._SL1500_.jpg', 'image/jpeg', 'public', 'public', 66673, '[]', '[]', '[]', 13, '{\"thumb\":true,\"preview\":true}', '2021-12-08 04:47:26', '2021-12-08 04:47:27');

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
(17, '2021_01_27_000037_create_transactions_table.php', 1),
(18, '2021_01_27_000015_create_users_table', 1),
(19, '2021_01_27_000016_create_user_addresses_table', 1),
(20, '2021_01_27_000017_create_settings_table', 1),
(21, '2021_01_27_000018_create_admins_table', 1),
(22, '2021_01_27_000022_create_user_profiles_table', 1),
(23, '2021_01_27_000025_create_vendors_table', 1),
(24, '2021_01_27_000026_create_vendor_profiles_table', 1),
(25, '2021_01_27_000027_create_product_categories_table', 1),
(26, '2021_01_27_000027_create_product_sub_categories_table', 1),
(27, '2021_01_27_000027_create_user_alerts_table', 1),
(28, '2021_01_27_000028_create_products_table', 1),
(29, '2021_01_27_000029_create_product_tags_table', 1),
(30, '2021_01_27_000030_create_product_options_table', 1),
(31, '2021_01_27_000031_create_carts_table', 1),
(32, '2021_01_27_000032_create_content_categories_table', 1),
(33, '2021_01_27_000033_create_content_tags_table', 1),
(34, '2021_01_27_000035_create_content_pages_table', 1),
(35, '2021_01_27_000036_create_roles_table', 1),
(36, '2021_01_27_000037_create_orders_table', 1),
(37, '2021_01_27_000038_create_faq_categories_table', 1),
(38, '2021_01_27_000039_create_permissions_table', 1),
(39, '2021_01_27_000040_create_faq_questions_table', 1),
(40, '2021_01_27_000041_create_permission_role_pivot_table', 1),
(41, '2021_01_27_000042_create_product_product_tag_pivot_table', 1),
(42, '2021_01_27_000043_create_user_user_alert_pivot_table', 1),
(43, '2021_01_27_000044_create_role_user_pivot_table', 1),
(44, '2021_01_27_000045_create_content_page_content_tag_pivot_table', 1),
(45, '2021_01_27_000046_create_article_article_tag_pivot_table', 1),
(46, '2021_01_27_000047_create_content_category_content_page_pivot_table', 1),
(47, '2021_01_27_000054_add_relationship_fields_to_carts_table', 1),
(48, '2021_01_27_000056_add_relationship_fields_to_transactions_table', 1),
(49, '2021_01_27_000057_add_relationship_fields_to_products_table', 1),
(50, '2021_01_27_000058_add_relationship_fields_to_article_likes_table', 1),
(51, '2021_01_27_000059_add_relationship_fields_to_followers_table', 1),
(52, '2021_01_27_000060_add_relationship_fields_to_article_comments_table', 1),
(53, '2021_01_27_000061_add_relationship_fields_to_articles_table', 1),
(54, '2021_01_27_000065_add_relationship_fields_to_faq_questions_table', 1),
(55, '2021_01_27_000067_add_relationship_fields_to_orders_table', 1),
(56, '2021_02_04_091149_create_role_admins_table', 1),
(57, '2021_02_04_121103_create_admin_alerts_table', 1),
(58, '2021_02_04_122046_create_admin_admin_alert_pivot_table', 1),
(59, '2021_02_09_183539_create_role_logistics_table', 1),
(60, '2021_02_09_183608_create_role_vendor_table', 1),
(61, '2021_02_11_000025_create_enquiries_table', 1),
(62, '2021_02_11_000055_add_relationship_fields_to_enquiries_table', 1),
(63, '2021_03_03_065222_create_unit_types_table', 1),
(64, '2021_03_09_075532_add_columns_to_orders_table', 1),
(65, '2021_03_09_075619_create_order_items_table', 1),
(66, '2021_03_09_091846_create_otps_table', 1),
(67, '2021_01_27_000002_create_media_table', 2),
(68, '2021_01_27_000037_create_transactions_table.php', 2),
(69, '2021_01_27_000037_create_transactions_table', 3),
(70, '2021_03_10_062703_create_product_stocks_table', 4),
(71, '2021_03_10_133403_create_sliders_table', 5),
(72, '2021_03_10_133713_create_slider_items_table', 6),
(73, '2021_05_11_100736_create_reviews_table', 7),
(74, '2021_05_15_074441_create_wishlists_table', 8),
(75, '2021_05_16_064229_create_site_settings_table', 9),
(76, '2021_05_17_090636_create_push_notifications_table', 10),
(77, '2021_05_26_082650_create_jobs_table', 11),
(78, '2021_05_29_120747_add_unit_quantity_column_to_product_stocks_table', 11),
(79, '2021_06_02_083341_create_push_notification_user_table', 12),
(80, '2021_06_08_064846_create_invoices_table', 13),
(81, '2021_06_09_075952_create_master_stocks_table', 13),
(82, '2021_06_09_080513_create_bills_table', 13),
(83, '2021_06_09_081642_create_bill_items_table', 13),
(84, '2021_12_08_140726_create_ship_rocket_settings_table', 14),
(85, '2021_12_09_081904_create_product_portal_charges_table', 15);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `billing_address_id` bigint(20) UNSIGNED NOT NULL,
  `shipping_address_id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_group_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(8,2) NOT NULL,
  `discount_amount` decimal(8,2) DEFAULT NULL,
  `charge_percent` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'platform chargecharge',
  `charge_amount` decimal(8,2) NOT NULL DEFAULT 0.00 COMMENT 'platform charge',
  `grand_total` decimal(8,2) NOT NULL,
  `amount_paid` decimal(8,2) NOT NULL DEFAULT 0.00,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `is_invoice_generated` tinyint(1) NOT NULL DEFAULT 0,
  `payment_verified_by_id` bigint(1) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `billing_address_id`, `shipping_address_id`, `order_number`, `order_group_number`, `vendor_id`, `payment_type`, `sub_total`, `discount_amount`, `charge_percent`, `charge_amount`, `grand_total`, `amount_paid`, `payment_status`, `status`, `is_invoice_generated`, `payment_verified_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(26, 1, 1, 1, 'BB-ORD-8056203749787165', '272476833759884', 1, 'ONLINE', '32500.00', '325.00', '5.00', '1608.75', '33783.75', '0.00', 'PENDING', 'PENDING', 0, 0, '2021-12-04 03:17:44', '2021-12-04 03:17:44', NULL),
(27, 1, 1, 1, 'BB-ORD-2399343030096663', '272476833759884', 2, 'ONLINE', '2400.00', '0.00', '5.00', '120.00', '2520.00', '0.00', 'PENDING', 'PENDING', 0, 0, '2021-12-04 03:17:44', '2021-12-04 03:17:44', NULL),
(28, 1, 1, 1, 'BB-ORD-9158607488421383', '692869393061991', 1, 'ONLINE', '32500.00', '325.00', '5.00', '1608.75', '33783.75', '0.00', 'PENDING', 'CANCELLED', 0, 0, '2021-12-04 03:39:19', '2021-12-04 11:10:31', NULL),
(29, 1, 1, 1, 'BB-ORD-7245525560049674', '692869393061991', 2, 'ONLINE', '2400.00', '0.00', '5.00', '120.00', '2520.00', '0.00', 'PENDING', 'PENDING', 0, 0, '2021-12-04 03:39:19', '2021-12-04 03:39:19', NULL),
(30, 1, 1, 1, 'BB-ORD-4400240771660847', '1945955497533715', 1, 'ONLINE', '32500.00', '325.00', '5.00', '1608.75', '33783.75', '0.00', 'PENDING', 'PENDING', 0, 0, '2021-12-04 03:40:48', '2021-12-04 03:40:48', NULL),
(31, 1, 1, 1, 'BB-ORD-3289057823648718', '1945955497533715', 2, 'ONLINE', '2400.00', '0.00', '5.00', '120.00', '2520.00', '0.00', 'PENDING', 'PENDING', 0, 0, '2021-12-04 03:40:48', '2021-12-04 03:40:48', NULL),
(32, 1, 1, 1, 'BB-ORD-9257593798472135', '4566010513130747', 1, 'ONLINE', '32500.00', '325.00', '5.00', '1608.75', '33783.75', '0.00', 'PENDING', 'CONFIRMED', 0, 0, '2021-12-04 03:41:08', '2021-12-04 11:06:38', NULL),
(33, 1, 1, 1, 'BB-ORD-6615082323258955', '4566010513130747', 2, 'ONLINE', '2400.00', '0.00', '5.00', '120.00', '2520.00', '0.00', 'PENDING', 'PENDING', 0, 0, '2021-12-04 03:41:08', '2021-12-04 03:41:08', NULL),
(34, 1, 1, 1, 'BB-ORD-8295003435385035', '1109501312987155', 1, 'ONLINE', '32500.00', '325.00', '5.00', '1608.75', '33783.75', '0.00', 'PENDING', 'PENDING', 0, 0, '2021-12-04 04:11:04', '2021-12-04 04:11:04', NULL),
(35, 1, 1, 1, 'BB-ORD-9977721774006869', '1109501312987155', 2, 'ONLINE', '2400.00', '0.00', '5.00', '120.00', '2520.00', '0.00', 'PENDING', 'PENDING', 0, 0, '2021-12-04 04:11:04', '2021-12-04 04:11:04', NULL),
(36, 1, 1, 1, 'BB-ORD-1505971194675460', '4286845059661474', 1, 'ONLINE', '32500.00', '325.00', '5.00', '1608.75', '33783.75', '0.00', 'PENDING', 'SHIPPED', 0, 0, '2021-12-04 04:17:45', '2021-12-06 23:52:22', NULL),
(37, 1, 1, 1, 'BB-ORD-1648034493656266', '4286845059661474', 2, 'ONLINE', '2400.00', '0.00', '5.00', '120.00', '2520.00', '0.00', 'VERIFIED', 'CONFIRMED', 0, 1, '2021-12-04 04:17:45', '2021-12-06 23:44:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_option_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` double NOT NULL,
  `quantity` smallint(5) UNSIGNED NOT NULL,
  `discount` double(5,2) NOT NULL,
  `discount_amount` double NOT NULL,
  `charge_percent` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'platform chargecharge',
  `charge_amount` decimal(8,2) NOT NULL DEFAULT 0.00 COMMENT 'platform charge',
  `total_amount` double NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `order_number`, `product_id`, `product_option_id`, `amount`, `quantity`, `discount`, `discount_amount`, `charge_percent`, `charge_amount`, `total_amount`, `status`, `created_at`, `updated_at`) VALUES
(30, 26, 'BB-ORD-8056203749787165-1', 1, 1, 5000, 6, 1.00, 300, '5.00', '1485.00', 31185, 'PENDING', '2021-12-04 03:17:44', '2021-12-04 03:17:44'),
(31, 26, 'BB-ORD-8056203749787165-2', 3, NULL, 500, 5, 1.00, 25, '5.00', '123.75', 2598.75, 'PENDING', '2021-12-04 03:17:44', '2021-12-04 03:17:44'),
(32, 27, 'BB-ORD-2399343030096663-1', 2, NULL, 200, 12, 0.00, 0, '5.00', '120.00', 2520, 'PENDING', '2021-12-04 03:17:44', '2021-12-04 03:17:44'),
(33, 28, 'BB-ORD-9158607488421383-1', 1, 1, 5000, 6, 1.00, 300, '5.00', '1485.00', 31185, 'PENDING', '2021-12-04 03:39:19', '2021-12-04 03:39:19'),
(34, 28, 'BB-ORD-9158607488421383-2', 3, NULL, 500, 5, 1.00, 25, '5.00', '123.75', 2598.75, 'PENDING', '2021-12-04 03:39:19', '2021-12-04 03:39:19'),
(35, 29, 'BB-ORD-7245525560049674-1', 2, NULL, 200, 12, 0.00, 0, '5.00', '120.00', 2520, 'PENDING', '2021-12-04 03:39:19', '2021-12-04 03:39:19'),
(36, 30, 'BB-ORD-4400240771660847-1', 1, 1, 5000, 6, 1.00, 300, '5.00', '1485.00', 31185, 'PENDING', '2021-12-04 03:40:48', '2021-12-04 03:40:48'),
(37, 30, 'BB-ORD-4400240771660847-2', 3, NULL, 500, 5, 1.00, 25, '5.00', '123.75', 2598.75, 'PENDING', '2021-12-04 03:40:48', '2021-12-04 03:40:48'),
(38, 31, 'BB-ORD-3289057823648718-1', 2, NULL, 200, 12, 0.00, 0, '5.00', '120.00', 2520, 'PENDING', '2021-12-04 03:40:48', '2021-12-04 03:40:48'),
(39, 32, 'BB-ORD-9257593798472135-1', 1, 1, 5000, 6, 1.00, 300, '5.00', '1485.00', 31185, 'PENDING', '2021-12-04 03:41:08', '2021-12-04 03:41:08'),
(40, 32, 'BB-ORD-9257593798472135-2', 3, NULL, 500, 5, 1.00, 25, '5.00', '123.75', 2598.75, 'PENDING', '2021-12-04 03:41:08', '2021-12-04 03:41:08'),
(41, 33, 'BB-ORD-6615082323258955-1', 2, NULL, 200, 12, 0.00, 0, '5.00', '120.00', 2520, 'PENDING', '2021-12-04 03:41:08', '2021-12-04 03:41:08'),
(42, 34, 'BB-ORD-8295003435385035-1', 1, 1, 5000, 6, 1.00, 300, '5.00', '1485.00', 31185, 'PENDING', '2021-12-04 04:11:04', '2021-12-04 04:11:04'),
(43, 34, 'BB-ORD-8295003435385035-2', 3, NULL, 500, 5, 1.00, 25, '5.00', '123.75', 2598.75, 'PENDING', '2021-12-04 04:11:04', '2021-12-04 04:11:04'),
(44, 35, 'BB-ORD-9977721774006869-1', 2, NULL, 200, 12, 0.00, 0, '5.00', '120.00', 2520, 'PENDING', '2021-12-04 04:11:04', '2021-12-04 04:11:04'),
(45, 36, 'BB-ORD-1505971194675460-1', 1, 1, 5000, 6, 1.00, 300, '5.00', '1485.00', 31185, 'PENDING', '2021-12-04 04:17:45', '2021-12-04 04:17:45'),
(46, 36, 'BB-ORD-1505971194675460-2', 3, NULL, 500, 5, 1.00, 25, '5.00', '123.75', 2598.75, 'PENDING', '2021-12-04 04:17:45', '2021-12-04 04:17:45'),
(47, 37, 'BB-ORD-1648034493656266-1', 2, NULL, 200, 12, 0.00, 0, '5.00', '120.00', 2520, 'PENDING', '2021-12-04 04:17:45', '2021-12-04 04:17:45');

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
(1, NULL, NULL, '7569', '9109844778', NULL, '798763', NULL, 1, '2021-12-03 04:00:33', '2021-12-03 04:00:44'),
(2, NULL, 2, '4680', '9109844774', NULL, '710869', NULL, 1, '2021-12-03 11:57:24', '2021-12-03 11:59:21');

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
(1, 'App\\Models\\User', 1, 'user_token', '26c1a5d54c58c2c4578f8cabfe62ab036310b008dddbc58f3befc7f7788fdde0', '[\"*\"]', '2021-12-04 05:39:59', '2021-12-03 04:00:54', '2021-12-04 05:39:59'),
(2, 'App\\Models\\Vendor', 2, 'user_token', '5104e087fddc1d25e4f9a6baca5daed09dbe8402d28294a6117d488500b1865a', '[\"*\"]', '2021-12-03 11:59:31', '2021-12-03 11:57:24', '2021-12-03 11:59:31');

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
  `moq` smallint(5) UNSIGNED NOT NULL DEFAULT 4 COMMENT 'Minimum order quantity',
  `discount` decimal(5,2) NOT NULL DEFAULT 0.00,
  `product_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_sub_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dispatch_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expected Dispatch Time',
  `rrp` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Refund & Return Policy',
  `approval_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `quantity` int(10) UNSIGNED DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hsn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `vendor_id`, `name`, `slug`, `description`, `price`, `moq`, `discount`, `product_category_id`, `product_sub_category_id`, `dispatch_time`, `rrp`, `approval_status`, `quantity`, `sku`, `hsn`, `created_at`, `updated_at`, `deleted_at`, `brand_id`) VALUES
(1, 1, 'Product One', 'product-one', NULL, '5000.00', 5, '1.00', 1, 1, '2 days', NULL, 'APPROVED', NULL, NULL, NULL, '2021-12-03 03:51:35', '2021-12-08 04:49:50', NULL, NULL),
(2, 2, 'Product Two', 'product-two', NULL, '200.00', 12, '0.00', 2, 30, '2 days', NULL, 'APPROVED', NULL, NULL, NULL, '2021-12-03 03:54:09', '2021-12-08 04:49:50', NULL, NULL),
(3, 1, 'Product Three', 'product-three', NULL, '500.00', 5, '1.00', NULL, NULL, NULL, NULL, 'APPROVED', NULL, NULL, NULL, '2021-12-03 03:55:56', '2021-12-08 04:49:50', NULL, NULL),
(4, 1, 'Product Four', 'product-four', NULL, '1400.00', 14, '5.00', NULL, NULL, NULL, NULL, 'APPROVED', NULL, NULL, NULL, '2021-12-03 04:00:00', '2021-12-08 04:49:50', NULL, NULL),
(11, 1, 'Product Test', 'product-test', NULL, '78.00', 50, '0.00', NULL, NULL, NULL, NULL, 'APPROVED', NULL, 'SKU', NULL, '2021-12-08 03:52:18', '2021-12-08 04:49:50', NULL, NULL),
(12, 2, 'Product Test', 'product-test1', NULL, '78.00', 50, '0.00', NULL, NULL, NULL, NULL, 'APPROVED', NULL, 'SKU', NULL, '2021-12-08 03:52:18', '2021-12-08 04:49:50', NULL, NULL),
(13, 1, 'Product Test1', 'product-test11', NULL, '50.00', 15, '0.00', NULL, NULL, NULL, NULL, 'APPROVED', NULL, 'SKU1', 'HSN', '2021-12-08 03:53:24', '2021-12-08 04:49:50', NULL, NULL),
(17, 1, 'Product Test2', 'product-test2', NULL, '78.00', 1, '0.00', 1, 5, NULL, NULL, 'APPROVED', NULL, 'SKU', 'HSN5', '2021-12-08 04:47:24', '2021-12-08 04:55:19', NULL, NULL),
(18, 1, 'Product Test', 'product-test3', NULL, '478.00', 78, '0.00', 4, 48, NULL, NULL, 'APPROVED', NULL, 'SKU', NULL, '2021-12-08 08:12:31', '2021-12-09 03:32:56', NULL, NULL);

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
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_options`
--

INSERT INTO `product_options` (`id`, `product_id`, `option`, `unit`, `quantity`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '25 KG', 'KG', NULL, '2021-12-03 03:51:37', '2021-12-03 03:51:37', NULL),
(2, 18, '478', 'KG', NULL, '2021-12-08 08:15:12', '2021-12-08 08:15:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_portal_charges`
--

CREATE TABLE `product_portal_charges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `charge` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_portal_charges`
--

INSERT INTO `product_portal_charges` (`id`, `product_id`, `charge`, `created_at`, `updated_at`) VALUES
(1, 18, '10.00', '2021-12-09 03:30:44', '2021-12-09 03:30:53'),
(2, 13, '2.00', '2021-12-09 04:06:11', '2021-12-09 04:06:11');

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

--
-- Dumping data for table `product_tags`
--

INSERT INTO `product_tags` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Bio Fertilizers', '2021-04-06 22:13:52', '2021-04-06 22:13:52', NULL),
(2, 'Fertilizers', '2021-04-06 22:14:04', '2021-04-06 22:14:04', NULL),
(3, 'Organic Products', '2021-04-06 22:14:13', '2021-04-06 22:14:13', NULL),
(4, 'Seeds', '2021-04-10 12:34:49', '2021-04-10 12:34:49', NULL),
(5, 'Secondary Fertilisers', '2021-04-10 12:35:05', '2021-04-10 12:35:05', NULL),
(6, 'Sprayers', '2021-04-10 12:35:16', '2021-04-10 12:35:16', NULL),
(7, 'Vegetable Seeds', '2021-04-10 12:35:24', '2021-04-10 12:35:24', NULL),
(8, 'Flower Seeds', '2021-04-10 12:35:34', '2021-04-10 12:35:34', NULL),
(9, 'Fruit Seeds', '2021-04-10 12:35:45', '2021-04-10 12:35:45', NULL),
(10, 'Tools', '2021-04-10 12:36:05', '2021-04-10 12:36:05', NULL),
(11, 'Hand Garden Sprayers', '2021-04-10 12:36:19', '2021-04-10 12:36:19', NULL);

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
-- Table structure for table `ship_rocket_settings`
--

CREATE TABLE `ship_rocket_settings` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ship_rocket_settings`
--

INSERT INTO `ship_rocket_settings` (`id`, `email`, `password`, `token`, `created_at`, `updated_at`) VALUES
(1, 'homesh3007@gmail.com', 'homesh', NULL, '2021-12-09 01:55:25', '2021-12-09 01:55:25');

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
(1, 'Andaman and Nicobar Island (UT)', 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(2, 'Andhra Pradesh', 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(3, 'Arunachal Pradesh', 1, '2021-02-22 09:44:04', '2021-02-22 09:44:04', NULL),
(4, 'Assam', 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(5, 'Bihar', 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(6, 'Chandigarh (UT)', 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(7, 'Chhattisgarh', 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(8, 'Dadra and Nagar Haveli (UT)', 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(9, 'Daman and Diu (UT)', 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(10, 'Delhi (NCT)', 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(11, 'Goa', 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(12, 'Gujarat', 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(13, 'Haryana', 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(14, 'Himachal Pradesh', 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(15, 'Jammu and Kashmir', 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(16, 'Jharkhand', 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(17, 'Karnataka', 1, '2021-02-22 09:44:05', '2021-02-22 09:44:05', NULL),
(18, 'Kerala', 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(19, 'Lakshadweep (UT)', 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(20, 'Madhya Pradesh', 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(21, 'Maharashtra', 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(22, 'Manipur', 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(23, 'Meghalaya', 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(24, 'Mizoram', 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(25, 'Nagaland', 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(26, 'Odisha', 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(27, 'Puducherry (UT)', 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(28, 'Punjab', 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(29, 'Rajasthan', 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(30, 'Sikkim', 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(31, 'Tamil Nadu', 1, '2021-02-22 09:44:06', '2021-02-22 09:44:06', NULL),
(32, 'Telangana', 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(33, 'Tripura', 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(34, 'Uttarakhand', 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(35, 'Uttar Pradesh', 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(36, 'West Bengal', 1, '2021-02-22 09:44:07', '2021-02-22 09:44:07', NULL),
(37, 'New State', 1, '2021-05-27 04:28:24', '2021-05-27 04:31:41', '2021-05-27 04:31:41'),
(38, 'New State', 1, '2021-06-02 11:32:42', '2021-06-02 11:34:36', '2021-06-02 11:34:36'),
(39, 'New State', 0, '2021-06-02 11:34:45', '2021-06-02 11:35:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gateway` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `payment_id`, `gateway`, `amount`, `status`, `currency`, `method`, `meta_data`, `order_group`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'pay_123456', 'razorpay', 3630375, 'captured', 'inr', 'card', '', '4286845059661474', 1, NULL, NULL, NULL);

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

--
-- Dumping data for table `unit_types`
--

INSERT INTO `unit_types` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'KG', 1, '2021-04-06 22:19:23', '2021-04-06 22:19:23'),
(2, 'GM', 1, '2021-04-06 22:19:32', '2021-04-06 22:19:32'),
(3, 'LTR', 1, '2021-04-06 22:19:40', '2021-04-06 22:19:40'),
(4, 'PKG', 1, '2021-04-06 22:19:56', '2021-04-06 22:19:56'),
(5, 'PCS', 1, '2021-04-06 22:20:07', '2021-04-06 22:20:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved` tinyint(1) DEFAULT 0,
  `verified` tinyint(1) DEFAULT 0,
  `verified_at` datetime DEFAULT NULL,
  `verification_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_verified_at` datetime DEFAULT NULL,
  `referral_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `email_verified_at`, `password`, `remember_token`, `approved`, `verified`, `verified_at`, `verification_token`, `mobile_verified_at`, `referral_code`, `device_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Company', 'homver301@gmail.com', '9109844771', NULL, '$2y$10$11LjdDcvpkJi8hpzpILpUO5uL.nGh6C.47XrUUUGqYbj.lGYaf8yG', NULL, 1, 0, NULL, NULL, NULL, NULL, 'ehf7jciXSDSiEyulFGKe1h:APA91bFht6Q6hep_PGtxB9Khk4wVAv93zGjLpq530XO8sXxdNL3uLiubLdefu4tFZJlBvECc7cL4CBZpKVZ0LWkcLvnbewl-D_RaakjWeGdYFIEsDyXqZWjcUTwvJ92Sonf4y0VeLP3Q', '2021-12-03 04:00:54', '2021-12-06 07:33:21', NULL),
(2, 'new', 'admin@bulkbajaar.com', '0321456987', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-06 07:49:28', '2021-12-08 03:14:41', NULL),
(4, 'COmp', 'test@test.com', '7893210477', NULL, '$2y$10$VyH..Bd3FNaiJqiXALBrleg1F50.R0I87IRkcH4.S1OPKNvCvGg4a', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, '2021-12-07 07:06:56', '2021-12-07 08:19:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pincode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `user_id`, `name`, `address`, `address_line_two`, `state_id`, `district_id`, `pincode`, `address_type`, `is_default`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, NULL, '9109844778', NULL, 1, 1, '25554', 'BILLING', 0, '2021-12-03 04:00:54', '2021-12-03 04:00:54', NULL),
(2, 1, NULL, '9109844778', NULL, 1, 1, '25554', 'BILLING', 0, '2021-12-03 04:00:54', '2021-12-03 04:00:54', NULL),
(3, 4, NULL, 'Billing', NULL, 3, 19, '4777', 'BILLING', 0, '2021-12-07 07:06:56', '2021-12-07 08:21:54', NULL),
(4, 4, NULL, 'Billing', NULL, 3, 17, '4777', 'SHIPPING', 0, '2021-12-07 07:06:56', '2021-12-07 08:21:54', NULL),
(5, 4, NULL, 'Billing', NULL, 3, 21, '4777', 'BILLING', 0, '2021-12-07 08:19:50', '2021-12-07 08:19:50', NULL),
(6, 4, NULL, 'Billing', NULL, 3, 20, '4777', 'SHIPPING', 0, '2021-12-07 08:19:50', '2021-12-07 08:19:50', NULL),
(7, 2, NULL, 'Shipping', 'line2', 3, 19, '459877', 'SHIPPING', 1, '2021-12-08 02:22:29', '2021-12-08 03:14:41', NULL),
(8, 2, NULL, 'billing', NULL, 1, 1, '47888', 'BILLING', 0, '2021-12-08 03:14:41', '2021-12-08 03:14:41', NULL);

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
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `representative_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_profiles`
--

INSERT INTO `user_profiles` (`id`, `user_id`, `company_name`, `representative_name`, `email`, `mobile`, `gst_number`, `pan_number`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Company', 'homver30@gmail.com', 'homver301@gmail.com', '9109844771', NULL, NULL, '2021-12-03 04:00:54', '2021-12-03 04:00:54', NULL),
(2, 4, 'COmp', 'Test', 'test@test.com', '7893210477', NULL, '45698712PAN', '2021-12-07 07:06:56', '2021-12-07 08:19:35', NULL),
(3, 2, 'new', 'test', 'admin@bulkbajaar.com', '0321456987', 'gst', 'Pan', '2021-12-08 03:14:41', '2021-12-08 03:14:41', NULL);

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
(1, 'Company', 'homver30@gmail.com', '9109844778', '$2y$10$O5R4jFIgvw4oNYUh/A1vJOcPECAnJ73Dw9ktTgyfOKqojl2.hPk.S', 'MANUFACTURER', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, '2021-12-03 03:46:38', '2021-12-08 08:31:56', NULL),
(2, 'New Vendor', 'homver10@gmail.com', '9109844774', '$2y$10$tZL3gydnQNGVkK5w/qPvCuoZWy6AcLTQNEXieKc7R5346kz17xNMu', 'MANUFACTURER', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2021-12-03 11:57:24', '2021-12-06 07:28:28', NULL);

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
  `mop` decimal(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_profiles`
--

INSERT INTO `vendor_profiles` (`id`, `vendor_id`, `company_name`, `representative_name`, `email`, `mobile`, `gst_number`, `pan_number`, `billing_address`, `billing_address_two`, `billing_state_id`, `billing_district_id`, `billing_pincode`, `pickup_address`, `pickup_address_two`, `pickup_state_id`, `pickup_district_id`, `pickup_pincode`, `bank_name`, `account_number`, `account_holder_name`, `ifsc_code`, `mop`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Company', 'Representative', 'homver30@gmail.com', '9109844778', 'GSIN', 'PAN', 'Billing Address', NULL, 7, 111, '492001', 'pickup', NULL, 1, 2, '492001', 'Bank', '123456', 'Homesh', 'IFSC', '2000.00', '2021-12-03 03:46:38', '2021-12-09 03:55:17', NULL),
(2, 2, '9109844778', 'homver30@gmail.com', 'homver30@gmail.com', '9109844778', 'homver30@gmail.com', '9109844778', '9109844778', 'homver30@gmail.com', 1, 1, '25554', '9109844778', 'homver30@gmail.com', 1, 1, '25554', 'homver30@gmail.com', '9109844778', '9109844778', 'homver30@gmail.com', '0.00', '2021-12-03 11:59:27', '2021-12-03 11:59:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_option_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `product_option_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, '2021-12-03 08:23:21', '2021-12-03 08:23:21'),
(3, 1, 1, 1, '2021-12-03 08:29:06', '2021-12-03 08:29:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `admins_email_unique` (`email`) USING BTREE,
  ADD UNIQUE KEY `admins_mobile_unique` (`mobile`) USING BTREE;

--
-- Indexes for table `admin_admin_alert`
--
ALTER TABLE `admin_admin_alert`
  ADD KEY `admin_alert_id_fk_2924387` (`admin_alert_id`) USING BTREE,
  ADD KEY `admin_id_fk_2924387` (`admin_id`) USING BTREE;

--
-- Indexes for table `admin_alerts`
--
ALTER TABLE `admin_alerts`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `areas_pincode_id_foreign` (`pincode_id`) USING BTREE;

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_fk_2993335` (`user_id`) USING BTREE;

--
-- Indexes for table `article_article_tag`
--
ALTER TABLE `article_article_tag`
  ADD KEY `article_id_fk_2995560` (`article_id`) USING BTREE,
  ADD KEY `article_tag_id_fk_2995560` (`article_tag_id`) USING BTREE;

--
-- Indexes for table `article_comments`
--
ALTER TABLE `article_comments`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_fk_2995574` (`user_id`) USING BTREE,
  ADD KEY `article_fk_2995580` (`article_id`) USING BTREE;

--
-- Indexes for table `article_likes`
--
ALTER TABLE `article_likes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_fk_2995642` (`user_id`) USING BTREE,
  ADD KEY `article_fk_2995643` (`article_id`) USING BTREE;

--
-- Indexes for table `article_tags`
--
ALTER TABLE `article_tags`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `bills_vendor_id_foreign` (`vendor_id`) USING BTREE;

--
-- Indexes for table `bill_items`
--
ALTER TABLE `bill_items`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `bill_items_bill_id_foreign` (`bill_id`) USING BTREE,
  ADD KEY `bill_items_product_id_foreign` (`product_id`) USING BTREE,
  ADD KEY `bill_items_product_option_id_foreign` (`product_option_id`) USING BTREE;

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `blocks_district_id_foreign` (`district_id`) USING BTREE;

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `carts_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `carts_product_id_foreign` (`product_id`) USING BTREE,
  ADD KEY `carts_product_option_id_foreign` (`product_option_id`) USING BTREE;

--
-- Indexes for table `content_categories`
--
ALTER TABLE `content_categories`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `content_category_content_page`
--
ALTER TABLE `content_category_content_page`
  ADD KEY `content_page_id_fk_2924404` (`content_page_id`) USING BTREE,
  ADD KEY `content_category_id_fk_2924404` (`content_category_id`) USING BTREE;

--
-- Indexes for table `content_pages`
--
ALTER TABLE `content_pages`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `content_page_content_tag`
--
ALTER TABLE `content_page_content_tag`
  ADD KEY `content_page_id_fk_2924405` (`content_page_id`) USING BTREE,
  ADD KEY `content_tag_id_fk_2924405` (`content_tag_id`) USING BTREE;

--
-- Indexes for table `content_tags`
--
ALTER TABLE `content_tags`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `districts_state_id_foreign` (`state_id`) USING BTREE;

--
-- Indexes for table `enquiries`
--
ALTER TABLE `enquiries`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `attendant_fk_3167399` (`attendant_id`) USING BTREE;

--
-- Indexes for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `faq_questions`
--
ALTER TABLE `faq_questions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `category_fk_2924418` (`category_id`) USING BTREE,
  ADD KEY `created_by_fk_2927060` (`created_by_id`) USING BTREE;

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_fk_2995632` (`user_id`) USING BTREE,
  ADD KEY `follow_fk_2995633` (`follow_id`) USING BTREE;

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `invoices_invoice_number_unique` (`invoice_number`) USING BTREE;

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `jobs_queue_index` (`queue`) USING BTREE;

--
-- Indexes for table `logistics`
--
ALTER TABLE `logistics`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `logistics_email_unique` (`email`) USING BTREE,
  ADD UNIQUE KEY `logistics_mobile_unique` (`mobile`) USING BTREE;

--
-- Indexes for table `master_stocks`
--
ALTER TABLE `master_stocks`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `master_stocks_product_id_foreign` (`product_id`) USING BTREE,
  ADD KEY `master_stocks_product_option_id_foreign` (`product_option_id`) USING BTREE;

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`) USING BTREE;

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_billing_address_id_foreign` (`billing_address_id`),
  ADD KEY `orders_shipping_address_id_foreign` (`shipping_address_id`),
  ADD KEY `orders_vendor_id_foreign` (`vendor_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_product_option_id_foreign` (`product_option_id`);

--
-- Indexes for table `otps`
--
ALTER TABLE `otps`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`) USING BTREE;

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD KEY `role_id_fk_2902509` (`role_id`) USING BTREE,
  ADD KEY `permission_id_fk_2902509` (`permission_id`) USING BTREE;

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`) USING BTREE,
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`) USING BTREE;

--
-- Indexes for table `pincodes`
--
ALTER TABLE `pincodes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `pincodes_block_id_foreign` (`block_id`) USING BTREE;

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `products_slug_unique` (`slug`) USING BTREE,
  ADD KEY `products_vendor_id_foreign` (`vendor_id`) USING BTREE,
  ADD KEY `products_product_category_id_foreign` (`product_category_id`) USING BTREE,
  ADD KEY `products_product_sub_category_id_foreign` (`product_sub_category_id`) USING BTREE,
  ADD KEY `brand_fk_2974094` (`brand_id`) USING BTREE;

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `product_options`
--
ALTER TABLE `product_options`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `product_options_product_id_foreign` (`product_id`) USING BTREE;

--
-- Indexes for table `product_portal_charges`
--
ALTER TABLE `product_portal_charges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_portal_charges_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_product_tag`
--
ALTER TABLE `product_product_tag`
  ADD KEY `product_id_fk_2902540` (`product_id`) USING BTREE,
  ADD KEY `product_tag_id_fk_2902540` (`product_tag_id`) USING BTREE;

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `product_stocks_vendor_id_foreign` (`vendor_id`) USING BTREE,
  ADD KEY `product_stocks_product_id_foreign` (`product_id`) USING BTREE;

--
-- Indexes for table `product_sub_categories`
--
ALTER TABLE `product_sub_categories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `product_sub_categories_product_category_id_foreign` (`product_category_id`) USING BTREE;

--
-- Indexes for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `push_notifications`
--
ALTER TABLE `push_notifications`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `push_notification_user`
--
ALTER TABLE `push_notification_user`
  ADD KEY `push_notification_user_push_notification_id_foreign` (`push_notification_id`) USING BTREE,
  ADD KEY `push_notification_user_user_id_foreign` (`user_id`) USING BTREE;

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
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `role_admin`
--
ALTER TABLE `role_admin`
  ADD KEY `admin_id_fk_custom_01` (`admin_id`) USING BTREE,
  ADD KEY `role_id_fk_custom_02` (`role_id`) USING BTREE;

--
-- Indexes for table `role_logistics`
--
ALTER TABLE `role_logistics`
  ADD KEY `logistics_id_fk_001` (`logistics_id`) USING BTREE,
  ADD KEY `role_id_fk_0092` (`role_id`) USING BTREE;

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD KEY `user_id_fk_2902518` (`user_id`) USING BTREE,
  ADD KEY `role_id_fk_2902518` (`role_id`) USING BTREE;

--
-- Indexes for table `role_vendor`
--
ALTER TABLE `role_vendor`
  ADD KEY `vendor_id_fk_001` (`vendor_id`) USING BTREE,
  ADD KEY `role_id_fk_0095` (`role_id`) USING BTREE;

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ship_rocket_settings`
--
ALTER TABLE `ship_rocket_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `slider_items`
--
ALTER TABLE `slider_items`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `slider_items_slider_id_foreign` (`slider_id`) USING BTREE;

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_order_group_index` (`order_group`);

--
-- Indexes for table `unit_types`
--
ALTER TABLE `unit_types`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `users_email_unique` (`email`) USING BTREE,
  ADD UNIQUE KEY `users_mobile_unique` (`mobile`) USING BTREE;

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_addresses_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `user_addresses_state_id_foreign` (`state_id`) USING BTREE,
  ADD KEY `user_addresses_district_id_foreign` (`district_id`) USING BTREE;

--
-- Indexes for table `user_alerts`
--
ALTER TABLE `user_alerts`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_profiles_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indexes for table `user_user_alert`
--
ALTER TABLE `user_user_alert`
  ADD KEY `user_alert_id_fk_2924387` (`user_alert_id`) USING BTREE,
  ADD KEY `user_id_fk_2924387` (`user_id`) USING BTREE;

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `vendors_email_unique` (`email`) USING BTREE,
  ADD UNIQUE KEY `vendors_mobile_unique` (`mobile`) USING BTREE;

--
-- Indexes for table `vendor_profiles`
--
ALTER TABLE `vendor_profiles`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `vendor_profiles_vendor_id_foreign` (`vendor_id`) USING BTREE,
  ADD KEY `vendor_profiles_billing_state_id_foreign` (`billing_state_id`) USING BTREE,
  ADD KEY `vendor_profiles_billing_district_id_foreign` (`billing_district_id`) USING BTREE,
  ADD KEY `vendor_profiles_pickup_state_id_foreign` (`pickup_state_id`) USING BTREE,
  ADD KEY `vendor_profiles_pickup_district_id_foreign` (`pickup_district_id`) USING BTREE;

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `wishlists_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `wishlists_product_id_foreign` (`product_id`) USING BTREE,
  ADD KEY `wishlists_product_option_id_foreign` (`product_option_id`) USING BTREE;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=722;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_options`
--
ALTER TABLE `product_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_portal_charges`
--
ALTER TABLE `product_portal_charges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
-- AUTO_INCREMENT for table `ship_rocket_settings`
--
ALTER TABLE `ship_rocket_settings`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `unit_types`
--
ALTER TABLE `unit_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_alerts`
--
ALTER TABLE `user_alerts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vendor_profiles`
--
ALTER TABLE `vendor_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- Constraints for table `blocks`
--
ALTER TABLE `blocks`
  ADD CONSTRAINT `blocks_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`);

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `carts_product_option_id_foreign` FOREIGN KEY (`product_option_id`) REFERENCES `product_options` (`id`),
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

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
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_billing_address_id_foreign` FOREIGN KEY (`billing_address_id`) REFERENCES `user_addresses` (`id`),
  ADD CONSTRAINT `orders_shipping_address_id_foreign` FOREIGN KEY (`shipping_address_id`) REFERENCES `user_addresses` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_items_product_option_id_foreign` FOREIGN KEY (`product_option_id`) REFERENCES `product_options` (`id`);

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
-- Constraints for table `product_portal_charges`
--
ALTER TABLE `product_portal_charges`
  ADD CONSTRAINT `product_portal_charges_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `product_stocks_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`);

--
-- Constraints for table `product_sub_categories`
--
ALTER TABLE `product_sub_categories`
  ADD CONSTRAINT `product_sub_categories_product_category_id_foreign` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`);

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
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD CONSTRAINT `user_addresses_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  ADD CONSTRAINT `user_addresses_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`),
  ADD CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD CONSTRAINT `user_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
