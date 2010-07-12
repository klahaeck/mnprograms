-- phpMyAdmin SQL Dump
-- version 3.3.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 08, 2010 at 08:45 PM
-- Server version: 5.1.48
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mnprograms_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `applicants`
--

CREATE TABLE IF NOT EXISTS `applicants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `applicants`
--


-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE IF NOT EXISTS `programs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guidlines` text COLLATE utf8_unicode_ci,
  `contact` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `logo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo_file_size` int(11) DEFAULT NULL,
  `logo_updated_at` datetime DEFAULT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `title`, `guidlines`, `contact`, `created_at`, `updated_at`, `logo_file_name`, `logo_content_type`, `logo_file_size`, `logo_updated_at`, `start`, `end`, `description`, `url`) VALUES
(1, 'CSA', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est ', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est ', '2010-06-24 01:29:16', '2010-06-29 00:14:16', 'csa_logo.jpg', 'image/jpeg', 13855, '2010-06-24 01:37:41', '2010-06-28', '2010-06-28', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est', 'csa');

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20100624004142'),
('20100624004211'),
('20100624015450'),
('20100624015959'),
('20100624020040'),
('20100624020156'),
('20100624020908'),
('20100624020940'),
('20100627204723'),
('20100627210748'),
('20100628004741'),
('20100629001057'),
('20100629011938'),
('20100707012412'),
('20100707162716');

-- --------------------------------------------------------

--
-- Table structure for table `statements`
--

CREATE TABLE IF NOT EXISTS `statements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `statements`
--


-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE IF NOT EXISTS `submissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `media_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `media_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `media_file_size` int(11) DEFAULT NULL,
  `media_updated_at` datetime DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `submissions`
--


-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE IF NOT EXISTS `types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Visual Arts', '2010-06-24 02:06:03', '2010-06-24 02:06:03'),
(2, 'Music', '2010-06-24 02:06:12', '2010-06-24 02:06:12'),
(3, 'Performance/Video', '2010-06-24 02:06:25', '2010-06-24 02:06:32'),
(4, 'Literary', '2010-06-24 02:06:43', '2010-06-24 02:06:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password_salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `role_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `encrypted_password`, `password_salt`, `confirmation_token`, `confirmed_at`, `confirmation_sent_at`, `reset_password_token`, `remember_token`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `created_at`, `updated_at`, `role_name`) VALUES
(2, 'kla.haeck@gmail.com', '0529c2b6ad68f37638090f789f724420df967d60', 'wwkA4-hHRax5aaAD2xId', NULL, NULL, NULL, NULL, NULL, NULL, 12, '2010-07-08 01:26:03', '2010-07-08 01:19:09', '127.0.0.1', '127.0.0.1', '2010-07-06 19:51:34', '2010-07-08 01:26:03', 'admin');
