-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 27, 2022 at 06:28 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `created_at`, `updated_at`) VALUES
(2, 'PS4', NULL, NULL),
(3, 'PS3', NULL, NULL),
(4, 'ps2', NULL, NULL),
(6, 'Iphone', NULL, NULL),
(7, 'SamSung1', NULL, NULL),
(8, 'Realme', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_06_18_080319_create_categories_table', 1),
(6, '2022_06_18_080754_create_products_table', 1),
(7, '2022_06_18_131225_create_add_status_product', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_quantity` varchar(255) NOT NULL,
  `product_price` varchar(255) NOT NULL,
  `product_description` text NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('pending','approve','reject') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_image`, `product_quantity`, `product_price`, `product_description`, `category_id`, `created_at`, `updated_at`, `status`) VALUES
(3, 'Easy Polo Black Edition', '1655568476-product.jpg', '11', '120000', '1111111111111111111111111111111111111 hung manh', 3, NULL, NULL, 'reject'),
(4, 'Easy Polo Black Edition', '1655568476-product.jpg', '11', '120000', '1111111111111111111111111111111111111', 3, NULL, NULL, 'approve'),
(6, 'Easy Polo Black Edition', '1655568476-product.jpg', '11', '120000', '1111111111111111111111111111111111111', 3, NULL, NULL, 'reject'),
(7, 'Easy Polo Black Edition 123', '1655738193-product.jpg', '1', '23123', '1asasadsad ad sadasdasd', 3, NULL, NULL, 'pending'),
(8, 'Easy Polo Black Edition 112233', '1655741577-product.jpg', '10', '130000', 'ffffffffffffffffffffffffffffffffffffffffffff', 3, NULL, NULL, 'pending'),
(9, 'Easy Polo Black 333', '1655741613-product.jpg', '123', '23123', 'ggggggggggggggggggggggggggggggggggggggg', 2, NULL, NULL, 'pending'),
(10, 'Easy Polo Black Edition', '1655568476-product.jpg', '11', '120000', '1111111111111111111111111111111111111 hung manh', 3, NULL, NULL, 'reject'),
(11, 'Easy Polo Black Edition', '1655568476-product.jpg', '11', '120000', '1111111111111111111111111111111111111', 3, NULL, NULL, 'approve'),
(12, 'Easy Polo Black Edition', '1655568476-product.jpg', '11', '120000', '1111111111111111111111111111111111111', 3, NULL, NULL, 'reject'),
(13, 'Easy Polo Black Edition 123', '1655738193-product.jpg', '1', '23123', '1asasadsad ad sadasdasd', 3, NULL, NULL, 'pending'),
(14, 'Easy Polo Black Edition 112233', '1655741577-product.jpg', '10', '130000', 'ffffffffffffffffffffffffffffffffffffffffffff', 3, NULL, NULL, 'pending'),
(15, 'Easy Polo Black 333', '1655741613-product.jpg', '123', '23123', 'ggggggggggggggggggggggggggggggggggggggg', 2, NULL, NULL, 'pending'),
(16, 'Easy Polo Black Edition', '1655568476-product.jpg', '11', '120000', '1111111111111111111111111111111111111', 3, NULL, NULL, 'approve'),
(17, 'Easy Polo Black Edition', '1655568476-product.jpg', '11', '120000', '1111111111111111111111111111111111111', 3, NULL, NULL, 'reject'),
(18, 'Easy Polo Black Edition 123', '1655738193-product.jpg', '1', '23123', '1asasadsad ad sadasdasd', 3, NULL, NULL, 'pending'),
(19, 'Easy Polo Black Edition 112233', '1655741577-product.jpg', '10', '130000', 'ffffffffffffffffffffffffffffffffffffffffffff', 3, NULL, NULL, 'pending'),
(20, 'Easy Polo Black 333', '1655741613-product.jpg', '123', '23123', 'ggggggggggggggggggggggggggggggggggggggg', 2, NULL, NULL, 'pending'),
(21, 'Easy Polo Black Edition', '1655568476-product.jpg', '11', '120000', '1111111111111111111111111111111111111 hung manh', 3, NULL, NULL, 'reject'),
(22, 'Easy Polo Black Edition', '1655568476-product.jpg', '11', '120000', '1111111111111111111111111111111111111', 3, NULL, NULL, 'approve'),
(23, 'Easy Polo Black Edition', '1655568476-product.jpg', '11', '120000', '1111111111111111111111111111111111111', 3, NULL, NULL, 'reject'),
(24, 'Easy Polo Black Edition 123', '1655738193-product.jpg', '1', '23123', '1asasadsad ad sadasdasd', 3, NULL, NULL, 'pending'),
(25, 'Easy Polo Black Edition 112233', '1655741577-product.jpg', '10', '130000', 'ffffffffffffffffffffffffffffffffffffffffffff', 3, NULL, NULL, 'pending'),
(26, 'Easy Polo Black 333', '1655741613-product.jpg', '123', '23123', 'ggggggggggggggggggggggggggggggggggggggg', 2, NULL, NULL, 'pending'),
(27, 'Easy Polo Black Edition', '1655568476-product.jpg', '11', '120000', '1111111111111111111111111111111111111 hung manh', 3, NULL, NULL, 'reject'),
(28, 'Easy Polo Black Edition 123', '1655738193-product.jpg', '1', '23123', '1asasadsad ad sadasdasd', 3, NULL, NULL, 'pending'),
(29, 'Easy Polo Black Edition 112233', '1655741577-product.jpg', '10', '130000', 'ffffffffffffffffffffffffffffffffffffffffffff', 3, NULL, NULL, 'pending'),
(30, 'Easy Polo Black 333', '1655741613-product.jpg', '123', '23123', 'ggggggggggggggggggggggggggggggggggggggg', 2, NULL, NULL, 'pending'),
(31, 'Easy Polo Black Edition', '1655568476-product.jpg', '11', '120000', '1111111111111111111111111111111111111 hung manh', 3, NULL, NULL, 'reject'),
(32, 'Easy Polo Black Edition', '1655568476-product.jpg', '11', '120000', '1111111111111111111111111111111111111', 3, NULL, NULL, 'approve'),
(33, 'Easy Polo Black Edition', '1655568476-product.jpg', '11', '120000', '1111111111111111111111111111111111111', 3, NULL, NULL, 'reject'),
(34, 'Easy Polo Black Edition 123', '1655738193-product.jpg', '1', '23123', '1asasadsad ad sadasdasd', 3, NULL, NULL, 'pending'),
(35, 'Easy Polo Black Edition 112233', '1655741577-product.jpg', '10', '130000', 'ffffffffffffffffffffffffffffffffffffffffffff', 3, NULL, NULL, 'pending'),
(36, 'Easy Polo Black 333', '1655741613-product.jpg', '123', '23123', 'ggggggggggggggggggggggggggggggggggggggg', 2, NULL, NULL, 'pending'),
(37, 'Easy Polo Black Edition', '1655568476-product.jpg', '11', '120000', '1111111111111111111111111111111111111 hung manh', 3, NULL, NULL, 'reject');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
