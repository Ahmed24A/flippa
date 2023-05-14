-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 14, 2023 at 02:59 PM
-- Server version: 10.3.38-MariaDB-cll-lve
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kanzzxcg_shortenk`
--

-- --------------------------------------------------------

--
-- Table structure for table `billing_plans`
--

CREATE TABLE `billing_plans` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `amount` decimal(13,2) DEFAULT NULL,
  `currency` varchar(191) NOT NULL,
  `currency_symbol` varchar(191) NOT NULL DEFAULT '$',
  `interval` varchar(191) NOT NULL DEFAULT 'month',
  `interval_count` int(11) NOT NULL DEFAULT 1,
  `parent_id` int(11) DEFAULT NULL,
  `legacy_permissions` text DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `paypal_id` varchar(50) DEFAULT NULL,
  `recommended` tinyint(1) NOT NULL DEFAULT 0,
  `free` tinyint(1) NOT NULL DEFAULT 0,
  `show_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `features` text DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `available_space` bigint(20) UNSIGNED DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `biolink_appearances`
--

CREATE TABLE `biolink_appearances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `biolink_id` bigint(20) UNSIGNED NOT NULL,
  `config` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `biolink_widgets`
--

CREATE TABLE `biolink_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `biolink_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `config` longtext NOT NULL,
  `pinned` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `biolink_widgets`
--

INSERT INTO `biolink_widgets` (`id`, `biolink_id`, `type`, `active`, `position`, `config`, `pinned`, `created_at`, `updated_at`) VALUES
(1, 1, 'image', 1, 0, '{\"type\":\"avatar\"}', 'top', NULL, '2023-05-10 23:30:22'),
(2, 1, 'text', 1, 1, '{\"title\":\"@pattersonl23\"}', 'top', NULL, NULL),
(3, 1, 'socials', 1, 2, '{\"facebook\":\"https:\\/\\/facebook.com\\/username\",\"instagram\":\"#instagram-handle\",\"twitter\":\"#twitter-handle\"}', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `path` varchar(191) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `commentable_id` int(10) UNSIGNED NOT NULL,
  `commentable_type` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `css_themes`
--

CREATE TABLE `css_themes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `is_dark` tinyint(1) NOT NULL DEFAULT 0,
  `default_light` tinyint(1) NOT NULL DEFAULT 0,
  `default_dark` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `colors` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `css_themes`
--

INSERT INTO `css_themes` (`id`, `name`, `is_dark`, `default_light`, `default_dark`, `user_id`, `colors`, `created_at`, `updated_at`) VALUES
(1, 'Dark', 1, 0, 1, 1, '{\"--be-foreground-base\":\"255 255 255\",\"--be-primary-light\":\"239 246 255\",\"--be-primary\":\"191 219 254\",\"--be-primary-dark\":\"147 197 253\",\"--be-on-primary\":\"56 30 114\",\"--be-background\":\"23 23 26\",\"--be-background-alt\":\"34 34 38\",\"--be-background-chip\":\"66 68 74\",\"--be-paper\":\"36 37 40\",\"--be-disabled-bg-opacity\":\"12%\",\"--be-disabled-fg-opacity\":\"30%\",\"--be-hover-opacity\":\"8%\",\"--be-focus-opacity\":\"12%\",\"--be-selected-opacity\":\"16%\",\"--be-text-main-opacity\":\"100%\",\"--be-text-muted-opacity\":\"70%\",\"--be-divider-opacity\":\"12%\"}', '2023-03-08 19:52:45', '2023-03-08 19:52:45'),
(2, 'Light', 0, 1, 0, 1, '{\"--be-foreground-base\":\"0 0 0\",\"--be-primary-light\":\"191 219 254\",\"--be-primary\":\"59 130 246\",\"--be-primary-dark\":\"37 99 235\",\"--be-on-primary\":\"255 255 255\",\"--be-background\":\"255 255 255\",\"--be-background-alt\":\"246 248 250\",\"--be-background-chip\":\"233 236 239\",\"--be-paper\":\"255 255 255\",\"--be-disabled-bg-opacity\":\"12%\",\"--be-disabled-fg-opacity\":\"26%\",\"--be-hover-opacity\":\"4%\",\"--be-focus-opacity\":\"12%\",\"--be-selected-opacity\":\"8%\",\"--be-text-main-opacity\":\"87%\",\"--be-text-muted-opacity\":\"60%\",\"--be-divider-opacity\":\"12%\"}', '2023-03-08 19:52:45', '2023-03-08 19:52:45');

-- --------------------------------------------------------

--
-- Table structure for table `csv_exports`
--

CREATE TABLE `csv_exports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cache_name` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `download_name` varchar(50) NOT NULL,
  `uuid` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_domains`
--

CREATE TABLE `custom_domains` (
  `id` int(10) UNSIGNED NOT NULL,
  `host` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `global` tinyint(1) NOT NULL DEFAULT 0,
  `resource_id` int(10) UNSIGNED DEFAULT NULL,
  `resource_type` varchar(20) DEFAULT NULL,
  `workspace_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages`
--

CREATE TABLE `custom_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `body` longtext NOT NULL,
  `slug` varchar(191) NOT NULL,
  `meta` text DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'default',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `workspace_id` int(10) UNSIGNED DEFAULT NULL,
  `hide_nav` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_pages`
--

INSERT INTO `custom_pages` (`id`, `title`, `body`, `slug`, `meta`, `type`, `created_at`, `updated_at`, `user_id`, `workspace_id`, `hide_nav`) VALUES
(1, 'Privacy Policy', '<h1>Example Privacy Policy</h1><p>The standard Lorem Ipsum passage, used since the 1500s\n    \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p>\n\n<p>Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\n    \"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p>\n\n<p>1914 translation by H. Rackham\n    \"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>\n\n<p>Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\n    \"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p>\n\n<p>1914 translation by H. Rackham\n    \"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', 'privacy-policy', NULL, 'default', '2023-03-08 19:52:45', '2023-03-08 19:52:45', NULL, NULL, 0),
(2, 'Terms of Service', '<h1>Example Terms of Service</h1><p>The standard Lorem Ipsum passage, used since the 1500s\n    \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p>\n\n<p>Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\n    \"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p>\n\n<p>1914 translation by H. Rackham\n    \"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>\n\n<p>Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\n    \"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p>\n\n<p>1914 translation by H. Rackham\n    \"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', 'terms-of-service', NULL, 'default', '2023-03-08 19:52:45', '2023-03-08 19:52:45', NULL, NULL, 0),
(3, 'About Us', '<h1>Example About Us</h1><p>The standard Lorem Ipsum passage, used since the 1500s\n    \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p>\n\n<p>Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\n    \"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p>\n\n<p>1914 translation by H. Rackham\n    \"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>\n\n<p>Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\n    \"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p>\n\n<p>1914 translation by H. Rackham\n    \"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', 'about-us', NULL, 'default', '2023-03-08 19:52:45', '2023-03-08 19:52:45', NULL, NULL, 0),
(4, 'ABC', '<p></p>', 'abc', NULL, 'link_page', '2023-05-10 07:15:07', '2023-05-10 07:15:07', 17, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `file_entries`
--

CREATE TABLE `file_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `file_size` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `mime` varchar(100) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `user_id` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `public` tinyint(1) NOT NULL DEFAULT 0,
  `disk_prefix` varchar(191) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `path` varchar(191) DEFAULT NULL,
  `preview_token` varchar(15) DEFAULT NULL,
  `thumbnail` tinyint(1) NOT NULL DEFAULT 0,
  `workspace_id` int(10) UNSIGNED DEFAULT NULL,
  `owner_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `file_entries`
--

INSERT INTO `file_entries` (`id`, `name`, `file_name`, `file_size`, `mime`, `extension`, `user_id`, `created_at`, `updated_at`, `public`, `disk_prefix`, `parent_id`, `description`, `password`, `type`, `deleted_at`, `path`, `preview_token`, `thumbnail`, `workspace_id`, `owner_id`) VALUES
(1, 'SH-removebg-preview.png', '2dcf437b-5177-4393-beae-3c5f5669fa96.png', 23108, 'image/png', 'png', NULL, '2023-03-10 13:28:39', '2023-03-10 13:28:39', 1, 'branding_media', NULL, NULL, NULL, 'image', NULL, NULL, NULL, 0, 0, 1),
(2, 'SH-removebg-preview.png', '8d6e85a3-57eb-4193-a95e-4b36cb0ef09c.png', 23108, 'image/png', 'png', NULL, '2023-03-10 13:28:58', '2023-03-10 13:28:58', 1, 'branding_media', NULL, NULL, NULL, 'image', NULL, NULL, NULL, 0, 0, 1),
(3, 'SH(1).png', 'aa64d7f3-6fa3-48a3-a7f3-0ebda0da63e0.png', 33037, 'image/png', 'png', NULL, '2023-03-10 13:47:03', '2023-03-10 13:47:03', 1, 'branding_media', NULL, NULL, NULL, 'image', NULL, NULL, NULL, 0, 0, 1),
(4, 'SH(2).png', '765a6e49-36e6-41a1-95b0-ea906fc22b44.png', 37614, 'image/png', 'png', NULL, '2023-03-10 13:49:35', '2023-03-10 13:49:35', 1, 'branding_media', NULL, NULL, NULL, 'image', NULL, NULL, NULL, 0, 0, 1),
(5, 'SH(2).png', '64da9f8c-671a-441c-8b3e-ed2701b0e654.png', 37614, 'image/png', 'png', NULL, '2023-03-10 13:52:11', '2023-03-10 13:52:11', 1, 'branding_media', NULL, NULL, NULL, 'image', NULL, NULL, NULL, 0, 0, 1),
(6, 'SH(1).png', '46e3fbfe-0c92-4239-970f-717941762042.png', 33037, 'image/png', 'png', NULL, '2023-03-10 13:52:17', '2023-03-10 13:52:17', 1, 'branding_media', NULL, NULL, NULL, 'image', NULL, NULL, NULL, 0, 0, 1),
(7, 'SH(3).png', 'a482ff19-f431-47d2-939d-8a8eb75cbe0a.png', 22074, 'image/png', 'png', NULL, '2023-03-10 13:56:02', '2023-03-10 13:56:02', 1, 'branding_media', NULL, NULL, NULL, 'image', NULL, NULL, NULL, 0, 0, 1),
(8, 'SH(4).png', '604e8eeb-74d1-4df6-b78a-d482ce4011a0.png', 24645, 'image/png', 'png', NULL, '2023-03-10 13:56:51', '2023-03-10 13:56:51', 1, 'branding_media', NULL, NULL, NULL, 'image', NULL, NULL, NULL, 0, 0, 1),
(9, 'SH(5).png', 'cc69274e-e566-4d89-80f7-25dc13c34e2a.png', 21019, 'image/png', 'png', NULL, '2023-03-10 13:57:46', '2023-03-10 13:57:46', 1, 'branding_media', NULL, NULL, NULL, 'image', NULL, NULL, NULL, 0, 0, 1),
(10, 'photo_2023-03-10_16-15-23.png', 'de63c9db-618a-4cc5-89f4-ac6f4a5b3148.png', 81995, 'image/png', 'png', NULL, '2023-03-10 19:20:46', '2023-03-10 19:20:46', 1, 'branding_media', NULL, NULL, NULL, 'image', NULL, NULL, NULL, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `file_entry_models`
--

CREATE TABLE `file_entry_models` (
  `id` int(10) UNSIGNED NOT NULL,
  `file_entry_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(60) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `owner` tinyint(1) NOT NULL DEFAULT 0,
  `permissions` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `file_entry_models`
--

INSERT INTO `file_entry_models` (`id`, `file_entry_id`, `model_id`, `model_type`, `created_at`, `updated_at`, `owner`, `permissions`) VALUES
(1, 1, 1, 'App\\User', '2023-03-10 13:28:39', '2023-03-10 13:28:39', 1, NULL),
(2, 2, 1, 'App\\User', '2023-03-10 13:28:58', '2023-03-10 13:28:58', 1, NULL),
(3, 3, 1, 'App\\User', '2023-03-10 13:47:03', '2023-03-10 13:47:03', 1, NULL),
(4, 4, 1, 'App\\User', '2023-03-10 13:49:35', '2023-03-10 13:49:35', 1, NULL),
(5, 5, 1, 'App\\User', '2023-03-10 13:52:11', '2023-03-10 13:52:11', 1, NULL),
(6, 6, 1, 'App\\User', '2023-03-10 13:52:17', '2023-03-10 13:52:17', 1, NULL),
(7, 7, 1, 'App\\User', '2023-03-10 13:56:02', '2023-03-10 13:56:02', 1, NULL),
(8, 8, 1, 'App\\User', '2023-03-10 13:56:51', '2023-03-10 13:56:51', 1, NULL),
(9, 9, 1, 'App\\User', '2023-03-10 13:57:46', '2023-03-10 13:57:46', 1, NULL),
(10, 10, 1, 'App\\User', '2023-03-10 19:20:46', '2023-03-10 19:20:46', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `uuid` varchar(10) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `linkeable_rules`
--

CREATE TABLE `linkeable_rules` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(30) NOT NULL,
  `linkeable_id` int(11) NOT NULL,
  `linkeable_type` varchar(50) NOT NULL,
  `key` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `hash` varchar(10) NOT NULL,
  `alias` varchar(50) DEFAULT NULL,
  `long_url` text NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `domain_id` int(11) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `expires_at` timestamp NULL DEFAULT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(30) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `workspace_id` int(10) UNSIGNED DEFAULT NULL,
  `thumbnail` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `clicked_at` timestamp NULL DEFAULT NULL,
  `clicks_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `activates_at` timestamp NULL DEFAULT NULL,
  `utm` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`id`, `name`, `hash`, `alias`, `long_url`, `user_id`, `domain_id`, `password`, `active`, `expires_at`, `description`, `type`, `type_id`, `created_at`, `updated_at`, `deleted_at`, `workspace_id`, `thumbnail`, `image`, `clicked_at`, `clicks_count`, `activates_at`, `utm`) VALUES
(1, 'Down or Not? Check if a Site Is Down for Everyone or Just You for FREE 2023', 'D9v28', NULL, 'https://www.websiteplanet.com/webtools/down-or-not/?dorn=itsshortlink.com', NULL, NULL, NULL, 1, NULL, 'Is your website down right now? Use this free online tool to check if a site is down for everyone or only on your computer. Find out how to fix potential issues.', 'direct', NULL, '2023-03-09 05:47:59', '2023-03-09 05:47:59', NULL, 0, NULL, 'https://dt2sdf0db8zob.cloudfront.net/wp-content/themes/websiteplanet/img/websiteplanet_image.png', NULL, 0, NULL, NULL),
(2, 'Log into Facebook', 'HIutG', NULL, 'https://www.facebook.com/business/ads?content_id=RWyjE5YLAnahlgk&ref=sem_smb&utm_source=GOOGLE&utm_medium=fbsmbsem&utm_campaign=PFX_SEM_G_BusinessAds_BR_EN_Brand_Exact_Desktop_IG&utm_content=IG-Cost_Evaluating-&utm_term=advertising%20on%20instagram%20cost&utm_ct=EVG&gclid=CjwKCAiAlp2fBhBPEiwA2Q10Dy0ks527gPiTHlPn-jxu8PKvNOaB5dNZTLMcoWHIU_Zo4fWKTT69khoC-swQAvD_BwE', 1, 0, NULL, 1, NULL, 'Log into Facebook to start sharing and connecting with your friends, family, and people you know.', 'direct', NULL, '2023-03-09 05:57:45', '2023-03-09 05:57:45', NULL, 0, NULL, NULL, NULL, 0, NULL, NULL),
(3, 'Log into Facebook', 'JW43b', NULL, 'https://www.facebook.com/business/ads?content_id=RWyjE5YLAnahlgk&ref=sem_smb&utm_source=GOOGLE&utm_medium=fbsmbsem&utm_campaign=PFX_SEM_G_BusinessAds_BR_EN_Brand_Exact_Desktop_IG&utm_content=IG-Cost_Evaluating-&utm_term=advertising%20on%20instagram%20cost&utm_ct=EVG&gclid=CjwKCAiAlp2fBhBPEiwA2Q10Dy0ks527gPiTHlPn-jxu8PKvNOaB5dNZTLMcoWHIU_Zo4fWKTT69khoC-swQAvD_BwE', NULL, NULL, NULL, 1, NULL, 'Log into Facebook to start sharing and connecting with your friends, family, and people you know.', 'direct', NULL, '2023-03-09 05:59:56', '2023-03-09 05:59:56', NULL, 0, NULL, NULL, NULL, 0, NULL, NULL),
(4, 'Shah Group - Global Branding & Market Strategy', 'zvng6', NULL, 'https://shahgroup.com', NULL, NULL, NULL, 1, NULL, 'Shah Group is a global branding and market strategy consultancy. We create brands that resonate in the hand, heart and mind of consumers.', 'direct', NULL, '2023-03-11 00:46:19', '2023-03-11 00:46:19', NULL, 0, NULL, 'https://shahgroup.com/wp-content/uploads/2021/10/h6-img-03.png', NULL, 0, NULL, NULL),
(5, 'Log In ‹ WP Blogging 101 — WordPress', 'sjiMf', NULL, 'https://wpblogging101.com/loginx/', NULL, NULL, NULL, 1, NULL, NULL, 'direct', NULL, '2023-03-13 05:50:54', '2023-03-13 05:51:02', NULL, 0, NULL, NULL, '2023-03-13 05:51:02', 1, NULL, NULL),
(6, 'CondoVive', 'aGG7G', NULL, 'https://condovive.com/en-US/pricing', NULL, NULL, NULL, 1, NULL, 'CondoVive es una es herramienta que facilita la administración de todas tus propiedades sin importar si es horizontal, vertical o de uso comercial. ¡Transparencia, cobranza, factur...', 'direct', NULL, '2023-03-14 23:56:05', '2023-03-14 23:56:05', NULL, 0, NULL, 'http://condovive.com/images/portada_condovive.png', NULL, 0, NULL, NULL),
(7, '\n  Like our content? – Teddy\'s Eczema Bar\n  ', 'PfeH2', NULL, 'https://eczemabar.com/pages/newsletter-subscription', NULL, NULL, NULL, 1, NULL, 'Subscribe to our mailing list. 💌 (No spam! Only glam!)  ', 'direct', NULL, '2023-03-15 02:16:41', '2023-05-09 23:51:48', NULL, 0, NULL, 'http://cdn.shopify.com/s/files/1/0532/5461/9336/files/Teddys_Social15_-_01_Clear_Bar_bathroom_3b807c97-9d42-41fb-9342-b654c397c78f_1200x1200.jpg?v=1630070853', '2023-05-09 23:51:48', 31, NULL, NULL),
(8, 'Strong Mind Guide', '86xp7', NULL, 'https://strongmindguide.com/collections/all', NULL, NULL, NULL, 1, NULL, NULL, 'direct', NULL, '2023-03-15 17:13:57', '2023-03-15 17:13:57', NULL, 0, NULL, NULL, NULL, 0, NULL, NULL),
(9, '\n      QuokkaMousepads.com | Australia\'s No. 1 Custom Mousepad Brand\n', 'UtIjt', NULL, 'https://quokkamousepads.com/', NULL, NULL, NULL, 1, NULL, 'Bring your desktop to life. Get rid of the boring black or plain mousepads we\'re all used to. Upload your own design, choose a size and we\'ll print it! We also have some unique des...', 'direct', NULL, '2023-03-16 19:17:06', '2023-03-16 19:17:11', NULL, 0, NULL, 'http://cdn.shopify.com/s/files/1/0588/4169/4345/files/QuokkaMousepadsSharePreview2.jpg?v=1666252364', '2023-03-16 19:17:11', 1, NULL, NULL),
(10, 'Success Mitra', 'BOFLb', NULL, 'https://successmitra.com', NULL, NULL, NULL, 1, NULL, 'Success Mitra’s Test Series have a great number of tests for you to attempt and polish your preparation. Prepare for your exams with us.', 'direct', NULL, '2023-03-16 22:15:32', '2023-03-16 22:15:32', NULL, 0, NULL, NULL, NULL, 0, NULL, NULL),
(11, 'Matchingham-Games', 'wXiJ3', NULL, 'https://matchingham.gs/publishing', NULL, NULL, NULL, 1, NULL, 'Matchingham-Games', 'direct', NULL, '2023-03-17 21:16:37', '2023-03-17 21:16:45', NULL, 0, NULL, NULL, '2023-03-17 21:16:45', 1, NULL, NULL),
(12, 'Copy of NicUGCcreator', 'YQKT0', NULL, 'https://nvmanagement.my.canva.site/nvmanagement95', NULL, NULL, NULL, 1, NULL, 'UGC WEBSITE, CONTENT CREATION, PORTFOLIO, CONTENT CREATOR', 'direct', NULL, '2023-03-18 22:10:35', '2023-03-18 22:10:35', NULL, 0, NULL, NULL, NULL, 0, NULL, NULL),
(13, 'Google', 'Bpi6j', NULL, 'https://Google.com', NULL, NULL, NULL, 1, NULL, 'Search the world\'s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you\'re looking for.', 'direct', NULL, '2023-03-20 23:50:21', '2023-03-20 23:50:21', NULL, 0, NULL, NULL, NULL, 0, NULL, NULL),
(14, '  shortenk — SaaS For Sale on Flippa: Looking for the best url shortener & link in bio creator? Look...', 'jZN53', NULL, 'https://flippa.com/11437864-looking-for-the-best-url-shortener-link-in-bio-creator-look-no-further-than-shortenk-the-ultimate-solution-for-creating-professional-and-customizable-public', NULL, NULL, NULL, 1, NULL, 'Looking for the best url shortener & link in bio creator? Look no further than shortenk the ultimate solution for creating professional and customizable public.', 'direct', NULL, '2023-03-21 20:02:28', '2023-03-21 20:02:28', NULL, 0, NULL, 'https://d2jafhvbn4akdi.cloudfront.net/listing_hero_d357827e-7d28-45d8-a032-8d2fbc2c34ce.png', NULL, 0, NULL, NULL),
(15, 'Play Chess Online Against the Computer - Chess.com', 'YCp8n', NULL, 'https://www.chess.com/play/computer', NULL, NULL, NULL, 1, NULL, 'Try playing an online chess game against a top chess computer. You can set the level from 1 to 10, from easy to grandmaster. If you get stuck, use a hint or take back the move. Whe...', 'direct', NULL, '2023-03-23 15:47:05', '2023-03-23 15:47:17', NULL, 0, NULL, 'https://www.chess.com/bundles/web/images/social/share-play-computer.62edc750.png', '2023-03-23 15:47:17', 1, NULL, NULL),
(16, 'Galinha Magricela - Galinha Magricela', 'gloxH', NULL, 'https://www.galinhamagricela.com', NULL, NULL, NULL, 1, NULL, 'Galinha Magricela - A sua loja de Brinquedos online onde os Brinquedos se transformam em sorrisos e momentos únicos de diversão', 'direct', NULL, '2023-03-23 16:29:20', '2023-03-23 16:29:20', NULL, 0, NULL, NULL, NULL, 0, NULL, NULL),
(17, 'List of Best Recruitment Agencies | Dubai, Abu Dhabi, UAE (2023)', '2xH1q', NULL, 'https://www.edarabia.com/recruitment-agencies/', NULL, NULL, NULL, 1, NULL, 'UAE top Recruitment Agencies, find the best Recruitment Agencies, write and view reviews', 'direct', NULL, '2023-03-25 02:17:59', '2023-03-25 02:17:59', NULL, 0, NULL, 'https://www.edarabia.com/wp-content/uploads/2020/02/ed-social-logo.jpg', NULL, 0, NULL, NULL),
(18, 'i.imgur.com', 'Ct8Jn', NULL, 'https://i.imgur.com/uAbBiVl.png', NULL, NULL, NULL, 1, NULL, NULL, 'direct', NULL, '2023-03-25 05:04:47', '2023-03-25 05:05:01', NULL, 0, NULL, NULL, '2023-03-25 05:05:01', 2, NULL, NULL),
(19, 'Google', '4Tm5J', NULL, 'https://Google.com', NULL, NULL, NULL, 1, NULL, 'Search the world\'s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you\'re looking for.', 'direct', NULL, '2023-03-25 10:11:44', '2023-03-25 10:11:44', NULL, 0, NULL, NULL, NULL, 0, NULL, NULL),
(20, 'Google', 'KQ2fI', NULL, 'https://Www.google.com', NULL, NULL, NULL, 1, NULL, 'Search the world\'s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you\'re looking for.', 'direct', NULL, '2023-03-31 02:00:20', '2023-03-31 02:01:12', NULL, 0, NULL, NULL, '2023-03-31 02:01:12', 2, NULL, NULL),
(21, '[UA→GA4] GA4 migration walkthrough (videos) - Analytics Help', 'RtHoi', NULL, 'https://support.google.com/analytics/answer/13392826', NULL, NULL, NULL, 1, NULL, 'See how to migrate to GA4 and link to Google Ads, and in a second video, how to migrate ecommerce to GA4 and import purchase conversions to Google AdsGoogle Analytics', 'direct', NULL, '2023-04-05 00:45:17', '2023-04-05 00:45:17', NULL, 0, NULL, NULL, NULL, 0, NULL, NULL),
(22, 'Gmail', 'ar7Nr', NULL, 'https://mail.google.com/mail/u/0/?tab=rm&ogbl#category/promotions/FMfcgzGslkrfqQtxjQpNVdSvPJfKNbbX', NULL, NULL, NULL, 1, NULL, 'Gmail is email that’s intuitive, efficient, and useful. 15 GB of storage, less spam, and mobile access.', 'direct', NULL, '2023-04-05 05:53:49', '2023-04-05 05:53:49', NULL, 0, NULL, NULL, NULL, 0, NULL, NULL),
(23, 'Andrew Huberman - YouTube', 'qTTKp', NULL, 'https://www.youtube.com/@hubermanlab/videos', NULL, NULL, NULL, 1, NULL, 'Welcome to the official Huberman Lab YouTube channel. The Huberman Lab podcast is hosted by Dr. Andrew Huberman, a neuroscientist and tenured professor of ne...', 'direct', NULL, '2023-04-05 14:59:26', '2023-04-05 14:59:26', NULL, 0, NULL, 'https://yt3.googleusercontent.com/5ONImZvpa9_hYK12Xek2E2JLzRc732DWsZMX2F-AZ1cTutTQLBuAmcEtFwrCgypqJncl5HrV2w=s900-c-k-c0x00ffffff-no-rj', NULL, 0, NULL, NULL),
(24, 'The domain name gggggggggg.com is for sale | Dan.com', 'ILcvn', NULL, 'https://Www.gggggggggg.com', NULL, NULL, NULL, 1, NULL, 'The domain name gggggggggg.com is for sale. Make an offer or buy it now at a set price.', 'direct', NULL, '2023-04-08 11:08:36', '2023-04-08 11:08:36', NULL, 0, NULL, 'https://cdn2.dan.com/assets/public/meta_image-4d82981355bc90e79a8801ee2a706ede37e2473c6c9bd8a645158a371dbacfa5.png', NULL, 0, NULL, NULL),
(25, 'i.imgur.com', 'S4LHY', NULL, 'https://i.imgur.com/qg1om3l.png', NULL, NULL, NULL, 1, NULL, NULL, 'direct', NULL, '2023-04-09 04:06:53', '2023-04-09 04:15:37', NULL, 0, NULL, NULL, '2023-04-09 04:15:37', 4, NULL, NULL),
(26, 'primenm.com', 'EDBXp', NULL, 'https://primenm.com/0/0/0/6331483a3d1ef18ef9a239b288a5366b/PPPPPPPPPPP', NULL, NULL, NULL, 1, NULL, NULL, 'direct', NULL, '2023-04-09 04:13:29', '2023-04-09 04:13:29', NULL, 0, NULL, NULL, NULL, 0, NULL, NULL),
(27, 'Login - Nextdoor', 'EisIx', NULL, 'https://nextdoor.com/profile/25370927?init_source=notification_center', NULL, NULL, NULL, 1, NULL, 'Join Nextdoor, an app for neighborhoods where you can get local tips, buy and sell items, and more', 'direct', NULL, '2023-04-10 07:15:03', '2023-04-10 07:15:03', NULL, 0, NULL, 'https://d19rpgkrjeba2z.cloudfront.net/fca2f8caa1627336/static/images/fb_share_logo4.png', NULL, 0, NULL, NULL),
(28, 'Order Lab Tests and Blood Tests Online | Testing.com', '7fhUM', NULL, 'https://Testing.com', NULL, NULL, NULL, 1, NULL, 'Testing.com is a trusted health resource designed to help patients and caregivers easily order and understand the many lab tests that are a vital part of medical care.', 'direct', NULL, '2023-04-10 15:54:20', '2023-04-10 15:54:29', NULL, 0, NULL, NULL, '2023-04-10 15:54:29', 1, NULL, NULL),
(29, 'Google', 'Ng7MK', NULL, 'https://google.com', NULL, NULL, NULL, 1, NULL, 'Search the world\'s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you\'re looking for.', 'direct', NULL, '2023-04-11 05:16:50', '2023-04-11 05:16:50', NULL, 0, NULL, NULL, NULL, 0, NULL, NULL),
(30, 'Linkdz - URL Shortener.', 'cbn9m', NULL, 'https://shortenk.com/#pricing', NULL, NULL, NULL, 1, NULL, 'Shorten, create and share trusted, powerful links for your business. Try linkdz for free.', 'direct', NULL, '2023-04-11 13:53:30', '2023-04-11 13:53:30', NULL, 0, NULL, NULL, NULL, 0, NULL, NULL),
(31, 'Google', 'OponU', NULL, 'https://google.com', NULL, NULL, NULL, 1, NULL, 'Search the world\'s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you\'re looking for.', 'direct', NULL, '2023-04-13 08:09:36', '2023-04-13 08:09:53', NULL, 0, NULL, NULL, '2023-04-13 08:09:53', 1, NULL, NULL),
(32, 'Marketplace - ClickBank', 'BgNGe', NULL, 'https://accounts.clickbank.com/marketplace.htm#/results', NULL, NULL, NULL, 1, NULL, NULL, 'direct', NULL, '2023-04-14 08:25:48', '2023-04-14 08:25:48', NULL, 0, NULL, NULL, NULL, 0, NULL, NULL),
(33, 'micro saas for sale - Google Search', 'yOb3b', NULL, 'https://www.google.com/search?q=micro+saas+for+sale&rlz=1C1CHBF_enUS908US908&oq=micro+saas+for+sale+&aqs=chrome..69i57.2801j0j1&sourceid=chrome&ie=UTF-8', NULL, NULL, NULL, 1, NULL, NULL, 'direct', NULL, '2023-04-15 09:27:10', '2023-04-15 09:27:46', NULL, 0, NULL, NULL, '2023-04-15 09:27:46', 1, NULL, NULL),
(34, 'The Income Insider - YouTube', 'PNXwz', NULL, 'https://www.youtube.com/@incomeinsidee/about', NULL, NULL, NULL, 1, NULL, 'Hi, Welcome.Learn about AI technology for business and online earning on our YouTube channel. Get insights on machine learning, e-commerce, and digital marke...', 'direct', NULL, '2023-04-15 15:57:10', '2023-04-15 15:57:10', NULL, 0, NULL, 'https://yt3.googleusercontent.com/cRxabpc0aLDwSueZcTwRdk4qD_zQhvCXAsxNAt9HSF--0Izp6Gy1XJcLCSZdIfX8Rg69yd0a4A=s900-c-k-c0x00ffffff-no-rj', NULL, 0, NULL, NULL),
(35, '  1st Page SEO Pro — SaaS For Sale on Flippa: Potential for $10 000 per month within a year!\n', 'pyB8L', NULL, 'https://flippa.com/11520639-potential-for-10-000-per-month-within-a-year', NULL, NULL, NULL, 1, NULL, 'Potential for $10 000 per month within a year!', 'direct', NULL, '2023-04-16 21:22:35', '2023-04-16 21:22:35', NULL, 0, NULL, 'https://d2jafhvbn4akdi.cloudfront.net/listing_hero_9a633f0a-cbff-4b09-a82e-2ca4f74de63c.png', NULL, 0, NULL, NULL),
(36, 'BBC - Home', 's0Dni', NULL, 'https://bbc.co.uk', NULL, NULL, NULL, 1, NULL, 'The best of the BBC, with the latest news and sport headlines, weather, TV & radio highlights and much more from across the whole of BBC Online.', 'direct', NULL, '2023-04-18 11:32:23', '2023-04-18 11:32:23', NULL, 0, NULL, 'https://static.files.bbci.co.uk/core/website/assets/static/webcore/bbc_blocks_84x24.5b565ac136ea8f9cb3b0f8e02eca1e0f.svg', NULL, 0, NULL, NULL),
(37, '  graburls.com — SaaS For Sale on Flippa: GrabUrls - Brand Domain name, Powerful url shortner websit...', 'GL2Eu', NULL, 'https://graburls.com/jNHne', NULL, NULL, NULL, 1, NULL, 'GrabUrls - Brand Domain name, Powerful url shortner website: shorten a long link into short smart link with one click. High Income Potential', 'direct', NULL, '2023-04-18 12:14:31', '2023-04-18 12:14:31', NULL, 0, NULL, 'https://d2jafhvbn4akdi.cloudfront.net/listing_hero_445d77a7-df2b-4ad4-9bc9-646ad8b20ac9.png', NULL, 0, NULL, NULL),
(38, 'LeadsHunt | Find new clients for your\nagency business', 'IspKu', NULL, 'https://getleadshunt.com', NULL, NULL, NULL, 1, NULL, 'Find new clients for your agency business', 'direct', NULL, '2023-04-19 02:11:42', '2023-04-19 02:13:26', NULL, 0, NULL, NULL, '2023-04-19 02:13:26', 2, NULL, NULL),
(39, 'WordPress › Error', 'g8kXt', NULL, 'https://miarriendo.com/venta-arriendo-de-inmuebles-finca-raiz-en-colombia/?preview_id=27&preview_nonce=3233dd7635&preview=true', NULL, NULL, NULL, 1, NULL, NULL, 'direct', NULL, '2023-04-19 20:18:55', '2023-04-19 20:18:55', NULL, 0, NULL, NULL, NULL, 0, NULL, NULL),
(40, 'Sorry! Something went wrong!', 'KHfzb', NULL, 'https://www.amazon.com/s?me=A14JXFGLWQC5TT', NULL, NULL, NULL, 1, NULL, NULL, 'direct', NULL, '2023-04-20 20:35:58', '2023-04-20 20:37:19', NULL, 0, NULL, NULL, '2023-04-20 20:37:19', 3, NULL, NULL),
(41, 'cloud-based help desk management solution - Google Search', 'JQlfX', NULL, 'https://www.google.com/search?q=cloud-based+help+desk+management+solution&client=firefox-b-d&sxsrf=APwXEdcYSBRwSpszOGvMMGXcyggfyENFvg:1682170757703&source=lnms&tbm=isch&sa=X&ved=2ahUKEwikktuzzr3-AhXncGwGHYBJDw0Q_AUoAXoECA4QAw&biw=1920&bih=884&dpr=1#imgrc=fAUPCmrENx8v1M', NULL, NULL, NULL, 1, NULL, NULL, 'direct', NULL, '2023-04-22 22:39:56', '2023-04-22 22:40:12', NULL, 0, NULL, NULL, '2023-04-22 22:40:12', 1, NULL, NULL),
(42, 'Access to this page has been denied.', 'wz3rx', NULL, 'https://www.zoominfo.com/c/itexams/476500703', NULL, NULL, NULL, 1, NULL, NULL, 'direct', NULL, '2023-04-22 22:40:40', '2023-04-22 22:40:56', NULL, 0, NULL, NULL, '2023-04-22 22:40:56', 1, NULL, NULL),
(43, 'Krater.ai – Your AI Suite', 'vXhr9', NULL, 'https://www.krater.ai/', NULL, NULL, NULL, 1, NULL, 'Discover the future of creating with Krater.ai: Our AI-powered tools are the perfect solution for anyone looking to create high-quality content with ease. With advanced technology...', 'direct', NULL, '2023-04-30 12:52:31', '2023-04-30 12:52:40', NULL, 0, NULL, 'https://okaaaay.cdn.bubble.io/f1681493237080x607698258927283100/sharepng.png', '2023-04-30 12:52:40', 1, NULL, NULL),
(44, 'LeadsHunt | Find new clients for your\nagency business', 'XV77x', NULL, 'https://GetLeadshunt.com', NULL, NULL, NULL, 1, NULL, 'Find new clients for your agency business', 'direct', NULL, '2023-04-30 19:13:19', '2023-04-30 19:13:33', NULL, 0, NULL, NULL, '2023-04-30 19:13:33', 1, NULL, NULL),
(45, '1st Page Seo Pro', 'SafPk', NULL, 'https://www.1stpageseopro.com/', NULL, NULL, NULL, 1, NULL, NULL, 'direct', NULL, '2023-05-04 02:25:38', '2023-05-04 02:25:38', NULL, 0, NULL, NULL, NULL, 0, NULL, NULL),
(46, '1st Page Seo Pro', 'ZgnuJ', NULL, 'https://www.1stpageseopro.com/', NULL, NULL, NULL, 1, NULL, NULL, 'direct', NULL, '2023-05-04 02:25:55', '2023-05-04 02:25:55', NULL, 0, NULL, NULL, NULL, 0, NULL, NULL),
(47, '  Shortenk —  SaaS platform URL Shortener - Link Shortener and Bio Pages  - SaaS For Sale on Flippa:...', 'xiYl2', NULL, 'https://flippa.com/11527305-looking-for-the-best-url-shortener-link-in-bio-creator-look-no-further-than-shortenk-the-ultimate-solution-for-creating-professional-and-customizable-public', NULL, NULL, NULL, 1, NULL, 'Looking for the best url shortener & link in bio creator? Look no further than shortenk the ultimate solution for creating professional and customizable public.', 'direct', NULL, '2023-05-04 05:21:02', '2023-05-04 05:21:02', NULL, 0, NULL, 'https://d2jafhvbn4akdi.cloudfront.net/listing_hero_110d773d-c920-4404-bb63-82f4703a1cf8.png', NULL, 0, NULL, NULL),
(48, '  Shortenk —  SaaS platform URL Shortener - Link Shortener and Bio Pages  - SaaS For Sale on Flippa:...', 'QXTss', NULL, 'https://flippa.com/11527305-looking-for-the-best-url-shortener-link-in-bio-creator-look-no-further-than-shortenk-the-ultimate-solution-for-creating-professional-and-customizable-public', NULL, NULL, NULL, 1, NULL, 'Looking for the best url shortener & link in bio creator? Look no further than shortenk the ultimate solution for creating professional and customizable public.', 'direct', NULL, '2023-05-04 14:49:27', '2023-05-04 14:49:27', NULL, 0, NULL, 'https://d2jafhvbn4akdi.cloudfront.net/listing_hero_110d773d-c920-4404-bb63-82f4703a1cf8.png', NULL, 0, NULL, NULL),
(49, 'FBAdsToDropship – Titik Digital', '4cZ9B', NULL, 'https://titikdigital.net/fbadstodropship', NULL, NULL, NULL, 1, NULL, NULL, 'direct', NULL, '2023-05-05 05:46:06', '2023-05-05 05:46:29', NULL, 0, NULL, NULL, '2023-05-05 05:46:29', 1, NULL, NULL),
(50, 'Shortenk - URL Shortener.', 'LsbqO', NULL, 'https://shortenk.com/#features', NULL, NULL, NULL, 1, NULL, 'Shorten, create and share trusted, powerful links for your business. Try linkdz for free.', 'direct', NULL, '2023-05-07 17:51:30', '2023-05-07 17:51:30', NULL, 0, NULL, NULL, NULL, 0, NULL, NULL),
(51, '  listen.lt — SaaS For Sale on Flippa: I created Listen.lt in 2017 when I was running a record label...', '117HY', NULL, 'https://flippa.com/11517525-i-created-listen-lt-in-2017-when-i-was-running-a-record-label-to-have-a-shortlist-platform-for-music-releases-i-made-the-platform-free-to-use-since-2017', NULL, NULL, NULL, 1, NULL, 'I created Listen.lt in 2017 when I was running a record label to have a shortlist platform for music releases. \r\nI made the platform free to use since 2017.\r\n', 'direct', NULL, '2023-05-07 20:34:16', '2023-05-07 20:34:22', NULL, 0, NULL, 'https://d2jafhvbn4akdi.cloudfront.net/listing_hero_3dda99a0-60d3-410f-89bc-010367e5d482.png', '2023-05-07 20:34:22', 1, NULL, NULL),
(52, 'YouTube', 'OBQlo', NULL, 'https://m.youtube.com/', NULL, NULL, NULL, 1, NULL, 'Enjoy the videos and music you love, upload original content, and share it all with friends, family, and the world on YouTube.', 'direct', NULL, '2023-05-09 12:11:08', '2023-05-09 12:11:24', NULL, 0, NULL, 'https://www.youtube.com/img/desktop/yt_1200.png', '2023-05-09 12:11:24', 1, NULL, NULL),
(53, 'Figma', 'dl2Ua', NULL, 'https://www.figma.com/file/316bVy9WZGf7xdEKOpwpbu/Open-Source-Dashboards-UI-Kit-(Community)?type=design&t=b92HUkV5MbeeHvs3-0', 17, 0, NULL, 1, NULL, 'Created with Figma', 'direct', NULL, '2023-05-10 07:16:33', '2023-05-10 07:16:33', NULL, 0, NULL, 'https://www.figma.com/file/316bVy9WZGf7xdEKOpwpbu/thumbnail?ver=thumbnails/04aa6ad8-3e60-4f99-8781-4a8067c2f2b3', NULL, 0, NULL, NULL),
(54, 'Music for Work — Limitless Productivity Playlist - YouTube', 'KbTo1', NULL, 'https://www.youtube.com/watch?v=4MFOBeUCPkw&ab_channel=ChillMusicLab', NULL, NULL, NULL, 1, NULL, 'We\'re in the era of information overload. There\'s never enough time to complete all the tasks, and it\'s impossible to stay focused. The noise from the outsid...', 'direct', NULL, '2023-05-10 11:15:16', '2023-05-10 11:15:16', NULL, 0, NULL, 'https://i.ytimg.com/vi/4MFOBeUCPkw/maxresdefault.jpg', NULL, 0, NULL, NULL),
(55, 'Google', 'Cusc8', NULL, 'https://www.google.com', NULL, NULL, NULL, 1, NULL, 'Search the world\'s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you\'re looking for.', 'direct', NULL, '2023-05-10 21:58:12', '2023-05-10 21:58:20', NULL, 0, NULL, NULL, '2023-05-10 21:58:20', 1, NULL, NULL),
(56, 'TradingSense | Stock Market Intelligence and Forecasting', 'QQl9z', NULL, 'https://tradingsense.github.io', NULL, NULL, NULL, 1, NULL, NULL, 'direct', NULL, '2023-05-10 23:26:51', '2023-05-10 23:26:56', NULL, 0, NULL, NULL, '2023-05-10 23:26:56', 1, NULL, NULL),
(57, 'TradingSense | Stock Market Intelligence and Forecasting', 'fdvDD', NULL, 'https://tradingsense.github.io', 18, 0, NULL, 1, NULL, NULL, 'direct', NULL, '2023-05-10 23:29:43', '2023-05-10 23:29:50', NULL, 0, NULL, NULL, '2023-05-10 23:29:50', 1, NULL, NULL),
(58, 'Showtimes - CineLux Green Valley Cinema', 'erMLR', NULL, 'https://www.cineluxtheatres.com/cinelux-green-valley-cinema/?date=2023-05-15', NULL, NULL, NULL, 1, NULL, NULL, 'direct', NULL, '2023-05-11 11:37:39', '2023-05-11 11:37:39', NULL, 0, NULL, NULL, NULL, 0, NULL, NULL),
(59, 'Twój przewodnik po świecie KETO. - KetoLord', 'Jx9bJ', NULL, 'https://www.ketolord.pl', NULL, NULL, NULL, 1, NULL, 'Rozpocznij swoją przygodę z KETO na KetoLord.pl! Zapewniamy godne zaufania, praktyczne porady i zasoby ułatwiające przejście na dietę KETO.', 'direct', NULL, '2023-05-12 14:13:12', '2023-05-12 14:13:22', NULL, 0, NULL, NULL, '2023-05-12 14:13:22', 1, NULL, NULL),
(60, 'LeadsHunt | Find new clients for your agency business.', 'yRuxl', NULL, 'https://GetLeadsHunt.com', NULL, NULL, NULL, 1, NULL, NULL, 'direct', NULL, '2023-05-12 17:14:50', '2023-05-12 17:16:21', NULL, 0, NULL, NULL, '2023-05-12 17:16:21', 3, NULL, NULL),
(61, '  Shortenk —  SaaS platform URL Shortener - Link Shortener and Bio Pages  - SaaS For Sale on Flippa:...', 'IIwjl', NULL, 'https://flippa.com/11527305-looking-for-the-best-url-shortener-link-in-bio-creator-look-no-further-than-shortenk-the-ultimate-solution-for-creating-professional-and-customizable-public', NULL, NULL, NULL, 1, NULL, 'Looking for the best url shortener & link in bio creator? Look no further than shortenk the ultimate solution for creating professional and customizable public.', 'direct', NULL, '2023-05-13 16:05:45', '2023-05-13 16:06:02', NULL, 0, NULL, 'https://d2jafhvbn4akdi.cloudfront.net/listing_hero_110d773d-c920-4404-bb63-82f4703a1cf8.png', '2023-05-13 16:06:02', 1, NULL, NULL),
(62, 'LeadsHunt | Find new clients for your agency business.', 'oEct1', NULL, 'https://getleadshunt.com', 19, 0, NULL, 1, NULL, NULL, 'direct', NULL, '2023-05-14 03:14:32', '2023-05-14 21:37:42', NULL, 0, NULL, NULL, '2023-05-14 21:37:42', 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `link_clicks`
--

CREATE TABLE `link_clicks` (
  `id` int(10) UNSIGNED NOT NULL,
  `linkeable_id` int(11) NOT NULL,
  `platform` varchar(30) DEFAULT NULL,
  `device` varchar(30) DEFAULT NULL,
  `browser` varchar(30) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `crawler` tinyint(1) NOT NULL DEFAULT 0,
  `referrer` varchar(191) DEFAULT NULL,
  `ip` varchar(191) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `linkeable_type` varchar(50) NOT NULL,
  `owner_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `link_clicks`
--

INSERT INTO `link_clicks` (`id`, `linkeable_id`, `platform`, `device`, `browser`, `location`, `crawler`, `referrer`, `ip`, `created_at`, `city`, `state`, `linkeable_type`, `owner_id`) VALUES
(1, 5, 'windows', 'desktop', 'chrome', 'IN', 0, NULL, '117.223.239.123', '2023-03-13 05:51:02', 'Hoshiarpur', 'PB', 'App\\Link', NULL),
(2, 7, 'windows', 'desktop', 'chrome', 'US', 0, NULL, '98.116.105.89', '2023-03-15 02:20:23', 'Yonkers', 'NY', 'App\\Link', NULL),
(3, 7, '', 'desktop', '', 'US', 1, NULL, '173.252.79.17', '2023-03-15 02:35:09', NULL, NULL, 'App\\Link', NULL),
(4, 7, 'ios', 'mobile', 'safari', 'IE', 0, NULL, '31.13.115.11', '2023-03-15 02:35:11', NULL, NULL, 'App\\Link', NULL),
(5, 7, 'ios', 'mobile', 'mozilla', 'US', 0, 'https://l.instagram.com/', '24.184.29.139', '2023-03-15 02:35:17', 'Montville', 'NJ', 'App\\Link', NULL),
(6, 9, 'windows', 'desktop', 'chrome', 'AU', 0, NULL, '180.150.80.3', '2023-03-16 19:17:11', NULL, 'WA', 'App\\Link', NULL),
(7, 7, 'ios', 'mobile', 'mozilla', 'CA', 0, 'https://l.instagram.com/', '24.84.44.84', '2023-03-17 13:29:23', 'Langley', 'BC', 'App\\Link', NULL),
(8, 11, 'os x', 'desktop', 'chrome', 'GB', 0, NULL, '82.19.116.127', '2023-03-17 21:16:45', 'Leicester', 'LCE', 'App\\Link', NULL),
(9, 7, 'ios', 'mobile', 'mozilla', 'US', 0, 'https://l.instagram.com/', '68.37.33.196', '2023-03-18 23:46:08', 'Ann Arbor', 'MI', 'App\\Link', NULL),
(10, 15, 'ios', 'mobile', 'safari', 'MX', 0, NULL, '201.103.98.68', '2023-03-23 15:47:17', 'Cuauhtemoc', 'CMX', 'App\\Link', NULL),
(11, 18, 'windows', 'desktop', 'chrome', 'MA', 0, NULL, '196.92.141.161', '2023-03-25 05:04:54', 'Meknes', 'MEK', 'App\\Link', NULL),
(12, 18, 'windows', 'desktop', 'chrome', 'MA', 0, 'http://app.goodwork.services/', '196.92.141.161', '2023-03-25 05:05:01', 'Meknes', 'MEK', 'App\\Link', NULL),
(13, 7, 'ios', 'mobile', 'mozilla', 'US', 0, 'https://l.instagram.com/', '67.194.237.173', '2023-03-25 05:47:53', 'Ann Arbor', 'MI', 'App\\Link', NULL),
(14, 7, 'ios', 'mobile', 'mozilla', 'US', 0, 'https://l.instagram.com/', '172.58.188.183', '2023-03-28 05:33:39', 'Washington', 'DC', 'App\\Link', NULL),
(15, 7, 'androidos', 'mobile', 'chrome', 'US', 1, NULL, '173.252.87.17', '2023-03-28 20:38:21', NULL, NULL, 'App\\Link', NULL),
(16, 7, 'androidos', 'mobile', 'chrome', 'US', 0, NULL, '173.252.95.2', '2023-03-29 19:33:29', NULL, NULL, 'App\\Link', NULL),
(17, 7, 'ios', 'mobile', 'mozilla', 'US', 0, 'https://l.instagram.com/', '144.121.134.148', '2023-03-30 19:00:48', 'Newark', 'DE', 'App\\Link', NULL),
(18, 20, 'ios', 'mobile', 'mozilla', 'ZA', 0, NULL, '41.87.201.60', '2023-03-31 02:00:51', 'Cape Town', 'WC', 'App\\Link', NULL),
(19, 20, 'ios', 'mobile', 'mozilla', 'ZA', 0, NULL, '41.87.201.60', '2023-03-31 02:01:12', 'Cape Town', 'WC', 'App\\Link', NULL),
(20, 7, 'androidos', 'mobile', 'chrome', 'US', 0, 'https://l.instagram.com/', '184.152.65.75', '2023-04-04 15:25:54', 'Brooklyn', 'NY', 'App\\Link', NULL),
(21, 7, 'androidos', 'mobile', 'chrome', 'US', 0, 'https://l.instagram.com/', '108.41.199.140', '2023-04-08 02:27:42', 'Brooklyn', 'NY', 'App\\Link', NULL),
(22, 25, 'windows', 'desktop', 'chrome', 'MA', 0, 'https://webmail.windstream.net/', '160.179.73.135', '2023-04-09 04:09:52', 'Meknes', 'MEK', 'App\\Link', NULL),
(23, 25, 'windows', 'desktop', 'chrome', 'MA', 0, 'https://webmail.windstream.net/', '160.179.73.135', '2023-04-09 04:10:33', 'Meknes', 'MEK', 'App\\Link', NULL),
(24, 25, 'windows', 'desktop', 'chrome', 'MA', 0, 'https://webmail.windstream.net/', '160.179.73.135', '2023-04-09 04:12:03', 'Meknes', 'MEK', 'App\\Link', NULL),
(25, 25, 'windows', 'desktop', 'chrome', 'MA', 0, 'https://webmail.windstream.net/', '160.179.73.135', '2023-04-09 04:15:37', 'Meknes', 'MEK', 'App\\Link', NULL),
(26, 28, 'ios', 'mobile', 'safari', 'ES', 0, NULL, '185.77.179.163', '2023-04-10 15:54:29', 'Pinoso', 'A', 'App\\Link', NULL),
(27, 31, 'os x', 'desktop', 'safari', 'US', 0, NULL, '107.130.81.28', '2023-04-13 08:09:53', 'Little Elm', 'TX', 'App\\Link', NULL),
(28, 33, 'windows', 'desktop', 'chrome', 'US', 0, NULL, '76.201.1.26', '2023-04-15 09:27:46', 'Allen', 'TX', 'App\\Link', NULL),
(29, 7, 'ios', 'mobile', 'mozilla', 'US', 0, 'https://l.instagram.com/', '62.182.98.205', '2023-04-17 19:28:45', 'New York', 'NY', 'App\\Link', NULL),
(30, 7, 'ios', 'mobile', 'safari', 'US', 0, NULL, '173.252.95.119', '2023-04-17 21:47:55', NULL, NULL, 'App\\Link', NULL),
(31, 7, 'androidos', 'mobile', 'chrome', 'US', 0, 'https://l.instagram.com/', '184.59.232.45', '2023-04-18 05:11:12', 'Appleton', 'WI', 'App\\Link', NULL),
(32, 38, 'windows', 'desktop', 'chrome', 'US', 0, NULL, '50.224.12.226', '2023-04-19 02:11:58', 'Wilmington', 'DE', 'App\\Link', NULL),
(33, 38, 'windows', 'desktop', 'chrome', 'US', 0, NULL, '50.224.12.226', '2023-04-19 02:13:26', 'Wilmington', 'DE', 'App\\Link', NULL),
(34, 7, 'ios', 'tablet', 'mozilla', 'US', 0, 'https://l.instagram.com/', '24.217.247.192', '2023-04-19 07:03:39', 'Edwardsville', 'IL', 'App\\Link', NULL),
(35, 7, 'androidos', 'mobile', 'chrome', 'KR', 0, 'https://l.instagram.com/', '115.40.222.84', '2023-04-19 18:02:02', 'Changwon', '48', 'App\\Link', NULL),
(36, 7, 'ios', 'mobile', 'mozilla', 'US', 0, 'https://l.instagram.com/', '24.145.81.93', '2023-04-19 19:35:49', 'Aiken', 'SC', 'App\\Link', NULL),
(37, 7, 'ios', 'mobile', 'mozilla', 'US', 0, 'https://l.instagram.com/', '72.109.188.24', '2023-04-19 19:41:13', 'Locust Grove', 'GA', 'App\\Link', NULL),
(38, 7, 'windows', 'desktop', 'chrome', 'US', 0, 'https://l.instagram.com/', '198.208.47.88', '2023-04-19 22:38:04', 'Troy', 'MI', 'App\\Link', NULL),
(39, 7, 'ios', 'mobile', 'mozilla', 'US', 0, 'https://l.instagram.com/', '198.210.87.225', '2023-04-20 05:37:06', 'Hays', 'KS', 'App\\Link', NULL),
(40, 7, 'ios', 'mobile', 'safari', 'IE', 0, NULL, '31.13.127.119', '2023-04-20 05:40:31', 'Clonee', 'MH', 'App\\Link', NULL),
(41, 40, 'windows', 'desktop', 'edge', 'CA', 0, NULL, '198.169.133.115', '2023-04-20 20:36:13', 'Saskatoon', 'SK', 'App\\Link', NULL),
(42, 40, 'windows', 'desktop', 'edge', 'CA', 0, NULL, '198.169.133.115', '2023-04-20 20:37:06', 'Saskatoon', 'SK', 'App\\Link', NULL),
(43, 40, 'windows', 'desktop', 'edge', 'CA', 0, NULL, '198.169.133.115', '2023-04-20 20:37:19', 'Saskatoon', 'SK', 'App\\Link', NULL),
(44, 7, 'ios', 'mobile', 'mozilla', 'US', 0, 'https://l.instagram.com/', '108.241.119.13', '2023-04-21 04:53:56', 'Cartersville', 'GA', 'App\\Link', NULL),
(45, 7, 'os x', 'desktop', 'safari', 'US', 0, NULL, '108.241.119.13', '2023-04-21 04:53:57', 'Cartersville', 'GA', 'App\\Link', NULL),
(46, 7, 'ios', 'mobile', 'mozilla', 'US', 0, 'https://l.instagram.com/', '174.107.67.163', '2023-04-21 23:37:06', 'Columbia', 'SC', 'App\\Link', NULL),
(47, 7, 'ios', 'mobile', 'mozilla', 'US', 0, 'https://l.instagram.com/', '98.116.105.89', '2023-04-22 00:45:32', 'Yonkers', 'NY', 'App\\Link', NULL),
(48, 7, 'ios', 'mobile', 'mozilla', 'US', 0, 'https://l.instagram.com/', '104.136.234.241', '2023-04-22 14:40:35', 'Davenport', 'FL', 'App\\Link', NULL),
(49, 41, 'os x', 'desktop', 'safari', 'IN', 0, NULL, '103.195.201.214', '2023-04-22 22:40:12', 'Delhi', 'DL', 'App\\Link', NULL),
(50, 42, 'os x', 'desktop', 'safari', 'IN', 0, NULL, '103.195.201.214', '2023-04-22 22:40:56', 'Delhi', 'DL', 'App\\Link', NULL),
(51, 7, 'ios', 'mobile', 'mozilla', 'US', 0, 'https://l.instagram.com/', '172.58.223.174', '2023-04-23 01:33:52', 'Providence', 'RI', 'App\\Link', NULL),
(52, 7, 'ios', 'mobile', 'mozilla', 'US', 0, 'https://l.instagram.com/', '47.199.222.22', '2023-04-30 03:40:58', 'Tampa', 'FL', 'App\\Link', NULL),
(53, 7, 'ios', 'mobile', 'mozilla', 'US', 0, 'https://l.instagram.com/', '47.199.222.22', '2023-04-30 03:42:09', 'Tampa', 'FL', 'App\\Link', NULL),
(54, 43, 'windows', 'desktop', 'chrome', 'IN', 0, NULL, '49.206.12.29', '2023-04-30 12:52:40', 'Bengaluru', 'KA', 'App\\Link', NULL),
(55, 44, 'ios', 'mobile', 'safari', 'US', 0, NULL, '172.58.129.195', '2023-04-30 19:13:33', 'Miami', 'FL', 'App\\Link', NULL),
(56, 7, 'androidos', 'mobile', 'chrome', 'US', 1, NULL, '66.249.68.93', '2023-05-01 14:50:45', NULL, NULL, 'App\\Link', NULL),
(57, 7, 'ios', 'mobile', 'mozilla', 'US', 0, 'https://l.instagram.com/', '67.8.113.163', '2023-05-02 21:41:43', 'Sanford', 'FL', 'App\\Link', NULL),
(58, 49, 'windows', 'desktop', 'chrome', 'ID', 0, NULL, '110.137.37.30', '2023-05-05 05:46:29', 'Bandar Lampung', 'LA', 'App\\Link', NULL),
(59, 51, 'windows', 'desktop', 'chrome', 'BE', 0, NULL, '109.128.253.158', '2023-05-07 20:34:22', 'Brussels', 'BRU', 'App\\Link', NULL),
(60, 52, 'ios', 'mobile', 'safari', 'JP', 0, NULL, '133.106.144.49', '2023-05-09 12:11:24', 'Minatomirai', '14', 'App\\Link', NULL),
(61, 7, 'ios', 'mobile', 'mozilla', 'US', 0, 'https://l.instagram.com/', '75.28.109.47', '2023-05-09 23:51:48', 'Los Angeles', 'CA', 'App\\Link', NULL),
(62, 55, 'chromeos', 'desktop', 'chrome', 'US', 0, NULL, '165.139.44.161', '2023-05-10 21:58:20', 'Gary', 'IN', 'App\\Link', NULL),
(63, 56, 'chromeos', 'desktop', 'chrome', 'US', 0, NULL, '165.139.44.161', '2023-05-10 23:26:56', 'Gary', 'IN', 'App\\Link', NULL),
(64, 57, 'chromeos', 'desktop', 'chrome', 'US', 0, NULL, '165.139.44.161', '2023-05-10 23:29:50', 'Gary', 'IN', 'App\\Link', 18),
(65, 59, 'windows', 'desktop', 'chrome', 'PL', 0, NULL, '78.8.100.236', '2023-05-12 14:13:22', 'Wroclaw', '02', 'App\\Link', NULL),
(66, 60, 'ios', 'mobile', 'safari', 'US', 0, NULL, '172.58.129.249', '2023-05-12 17:15:14', 'Miami', 'FL', 'App\\Link', NULL),
(67, 60, 'ios', 'mobile', 'safari', 'US', 0, NULL, '172.58.129.249', '2023-05-12 17:15:29', 'Miami', 'FL', 'App\\Link', NULL),
(68, 60, 'windows', 'desktop', 'chrome', 'US', 0, NULL, '50.224.12.226', '2023-05-12 17:16:21', 'Wilmington', 'DE', 'App\\Link', NULL),
(69, 61, 'windows', 'desktop', 'chrome', 'TT', 0, NULL, '186.96.212.45', '2023-05-13 16:06:02', 'Chaguanas', 'CHA', 'App\\Link', NULL),
(70, 62, 'ios', 'mobile', 'safari', 'US', 0, NULL, '98.53.94.133', '2023-05-14 03:15:08', 'Miami', 'FL', 'App\\Link', 19),
(71, 62, 'os x', 'desktop', 'chrome', 'US', 0, NULL, '98.53.94.133', '2023-05-14 16:53:53', 'Miami', 'FL', 'App\\Link', 19),
(72, 62, '', 'desktop', '', 'US', 1, NULL, '199.16.157.181', '2023-05-14 16:54:33', 'Atlanta', 'GA', 'App\\Link', 19),
(73, 62, 'os x', 'desktop', 'chrome', 'US', 0, 'https://t.co/', '98.53.94.133', '2023-05-14 16:54:37', 'Miami', 'FL', 'App\\Link', 19),
(74, 62, 'os x', 'desktop', 'chrome', 'US', 0, 'https://t.co/', '98.53.94.133', '2023-05-14 16:54:50', 'Miami', 'FL', 'App\\Link', 19),
(75, 62, 'os x', 'desktop', 'chrome', 'US', 0, 'https://t.co/', '98.53.94.133', '2023-05-14 16:55:09', 'Miami', 'FL', 'App\\Link', 19),
(76, 62, 'ios', 'mobile', 'safari', 'US', 0, 'https://t.co/', '98.53.94.133', '2023-05-14 16:55:53', 'Miami', 'FL', 'App\\Link', 19),
(77, 62, 'ios', 'mobile', 'safari', 'US', 0, 'https://t.co/', '172.58.129.75', '2023-05-14 18:46:53', 'Miami', 'FL', 'App\\Link', 19),
(78, 62, 'os x', 'desktop', 'firefox', 'BE', 0, NULL, '188.95.54.9', '2023-05-14 19:19:47', 'Antwerp', 'VAN', 'App\\Link', 19),
(79, 62, 'ios', 'mobile', 'safari', 'US', 0, 'https://t.co/', '98.53.94.133', '2023-05-14 19:45:06', 'Miami', 'FL', 'App\\Link', 19),
(80, 62, 'ios', 'mobile', 'safari', 'US', 0, 'https://t.co/', '98.53.94.133', '2023-05-14 21:37:42', 'Miami', 'FL', 'App\\Link', 19);

-- --------------------------------------------------------

--
-- Table structure for table `link_groups`
--

CREATE TABLE `link_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `hash` varchar(50) NOT NULL,
  `workspace_id` int(10) UNSIGNED DEFAULT NULL,
  `rotator` tinyint(1) NOT NULL DEFAULT 0,
  `domain_id` int(11) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `clicked_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `clicks_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `utm` text DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'group',
  `activates_at` timestamp NULL DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `link_groups`
--

INSERT INTO `link_groups` (`id`, `name`, `user_id`, `created_at`, `updated_at`, `active`, `description`, `hash`, `workspace_id`, `rotator`, `domain_id`, `password`, `expires_at`, `clicked_at`, `deleted_at`, `clicks_count`, `utm`, `type`, `activates_at`, `image`) VALUES
(1, 'https://shortenk.com/fdvDD', 18, '2023-05-10 23:30:16', '2023-05-10 23:30:16', 1, NULL, 'ymXVFm', 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 'biolink', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `link_group_link`
--

CREATE TABLE `link_group_link` (
  `id` int(10) UNSIGNED NOT NULL,
  `link_id` int(11) NOT NULL,
  `link_group_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `animation` varchar(40) DEFAULT NULL,
  `leap_until` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `link_overlays`
--

CREATE TABLE `link_overlays` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `user_id` varchar(191) NOT NULL,
  `position` varchar(20) NOT NULL,
  `message` varchar(191) NOT NULL,
  `label` varchar(191) DEFAULT NULL,
  `btn_link` varchar(191) DEFAULT NULL,
  `btn_text` varchar(191) DEFAULT NULL,
  `colors` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `workspace_id` int(10) UNSIGNED DEFAULT NULL,
  `theme` varchar(20) NOT NULL DEFAULT 'default',
  `image` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `link_tracking_pixel`
--

CREATE TABLE `link_tracking_pixel` (
  `id` int(10) UNSIGNED NOT NULL,
  `linkeable_id` int(11) NOT NULL,
  `tracking_pixel_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `linkeable_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `localizations`
--

CREATE TABLE `localizations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `language` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `localizations`
--

INSERT INTO `localizations` (`id`, `name`, `created_at`, `updated_at`, `language`) VALUES
(1, 'English', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2015_04_127_156842_create_social_profiles_table', 1),
(5, '2015_04_127_156842_create_users_oauth_table', 1),
(6, '2015_05_29_131549_create_settings_table', 1),
(7, '2016_05_12_190852_create_tags_table', 1),
(8, '2016_05_12_190958_create_taggables_table', 1),
(9, '2016_05_26_170044_create_uploads_table', 1),
(10, '2016_05_27_143158_create_uploadables_table', 1),
(11, '2016_07_14_153703_create_groups_table', 1),
(12, '2016_07_14_153921_create_user_group_table', 1),
(13, '2017_07_02_120142_create_pages_table', 1),
(14, '2017_07_11_122825_create_localizations_table', 1),
(15, '2017_08_26_131330_add_private_field_to_settings_table', 1),
(16, '2017_09_17_144728_add_columns_to_users_table', 1),
(17, '2017_09_17_152854_make_password_column_nullable', 1),
(18, '2017_09_30_152855_make_settings_value_column_nullable', 1),
(19, '2017_10_01_152897_add_public_column_to_uploads_table', 1),
(20, '2017_12_04_132911_add_avatar_column_to_users_table', 1),
(21, '2018_01_10_140732_create_subscriptions_table', 1),
(22, '2018_01_10_140746_add_billing_to_users_table', 1),
(23, '2018_01_10_161706_create_billing_plans_table', 1),
(24, '2018_07_24_113757_add_available_space_to_billing_plans_table', 1),
(25, '2018_07_24_124254_add_available_space_to_users_table', 1),
(26, '2018_07_26_142339_rename_groups_to_roles', 1),
(27, '2018_07_26_142842_rename_user_role_table_columns_to_roles', 1),
(28, '2018_08_07_124200_rename_uploads_to_file_entries', 1),
(29, '2018_08_07_124327_refactor_file_entries_columns', 1),
(30, '2018_08_07_130653_add_folder_path_column_to_file_entries_table', 1),
(31, '2018_08_07_140440_migrate_file_entry_users_to_many_to_many', 1),
(32, '2018_08_15_132225_move_uploads_into_subfolders', 1),
(33, '2018_08_31_104145_rename_uploadables_table', 1),
(34, '2018_08_31_104325_rename_file_entry_models_table_columns', 1),
(35, '2018_11_26_171703_add_type_and_title_columns_to_pages_table', 1),
(36, '2018_12_01_144233_change_unique_index_on_tags_table', 1),
(37, '2019_02_16_150049_delete_old_seo_settings', 1),
(38, '2019_02_24_141457_create_jobs_table', 1),
(39, '2019_03_11_162627_add_preview_token_to_file_entries_table', 1),
(40, '2019_03_12_160803_add_thumbnail_column_to_file_entries_table', 1),
(41, '2019_03_16_161836_add_paypal_id_column_to_billing_plans_table', 1),
(42, '2019_05_14_120930_index_description_column_in_file_entries_table', 1),
(43, '2019_05_21_135544_create_links_table', 1),
(44, '2019_05_22_130538_create_link_rules_table', 1),
(45, '2019_05_25_163134_create_link_clicks_table', 1),
(46, '2019_06_01_141515_create_link_groups_table', 1),
(47, '2019_06_01_141648_create_link_group_link_table', 1),
(48, '2019_06_08_120504_create_custom_domains_table', 1),
(49, '2019_06_10_143040_create_link_overlay_table', 1),
(50, '2019_06_13_140318_add_user_id_column_to_pages_table', 1),
(51, '2019_06_15_114320_rename_pages_table_to_custom_pages', 1),
(52, '2019_06_18_133933_create_permissions_table', 1),
(53, '2019_06_18_134203_create_permissionables_table', 1),
(54, '2019_06_18_135822_rename_permissions_columns', 1),
(55, '2019_06_26_121900_create_tracking_pixels_table', 1),
(56, '2019_06_26_135814_create_link_tracking_pixel_table', 1),
(57, '2019_07_08_122001_create_css_themes_table', 1),
(58, '2019_07_20_141752_create_invoices_table', 1),
(59, '2019_08_19_121112_add_global_column_to_custom_domains_table', 1),
(60, '2019_09_13_141123_change_plan_amount_to_float', 1),
(61, '2019_10_14_171943_add_index_to_username_column', 1),
(62, '2019_10_20_143522_create_comments_table', 1),
(63, '2019_10_23_134520_create_notifications_table', 1),
(64, '2019_11_21_144956_add_resource_id_and_type_to_custom_domains_table', 1),
(65, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(66, '2019_12_14_194512_rename_public_path_column_to_disk_prefix', 1),
(67, '2019_12_24_165237_change_file_size_column_default_value_to_0', 1),
(68, '2019_12_28_190836_update_file_entry_models_table_to_v2', 1),
(69, '2019_12_28_191105_move_user_file_entry_table_records_to_file_entry_models', 1),
(70, '2020_01_26_143733_create_notification_subscriptions_table', 1),
(71, '2020_03_03_140720_add_language_col_to_localizations_table', 1),
(72, '2020_03_03_143142_add_lang_code_to_existing_localizations', 1),
(73, '2020_03_15_140407_add_status_and_desc_to_link_groups_table', 1),
(74, '2020_03_18_155747_add_soft_deletes_column_to_links_table', 1),
(75, '2020_03_21_142245_add_header_image_to_existing_appearance_settings', 1),
(76, '2020_04_14_163347_add_hidden_column_to_plans_table', 1),
(77, '2020_06_27_180040_add_verified_at_column_to_users_table', 1),
(78, '2020_06_27_180253_move_confirmed_column_to_email_verified_at', 1),
(79, '2020_07_15_144024_fix_issues_with_migration_to_laravel_7', 1),
(80, '2020_07_22_165126_create_workspaces_table', 1),
(81, '2020_07_23_145652_create_workspace_invites_table', 1),
(82, '2020_07_23_164502_create_workspace_user_table', 1),
(83, '2020_07_26_165349_add_columns_to_roles_table', 1),
(84, '2020_07_29_141418_add_workspace_id_column_to_workspaceable_models', 1),
(85, '2020_07_30_152330_add_type_column_to_permissions_table', 1),
(86, '2020_08_13_151842_add_theme_and_image_columns_to_link_overlays_table', 1),
(87, '2020_08_14_164031_add_image_column_to_links_table', 1),
(88, '2020_08_15_125817_rename_link_groups_slug_column_to_hash', 1),
(89, '2020_08_29_165057_add_hide_nav_column_to_custom_pages_table', 1),
(90, '2021_04_22_172459_add_internal_columm_to_roles_table', 1),
(91, '2021_05_03_173446_add_deleted_column_to_comments_table', 1),
(92, '2021_05_12_164940_add_advanced_column_to_permissions_table', 1),
(93, '2021_06_03_154721_add_clicks_column_links_table', 1),
(94, '2021_06_03_154902_materialize_link_clicks', 1),
(95, '2021_06_04_143405_add_workspace_id_col_to_custom_domains_table', 1),
(96, '2021_06_04_143406_add_workspace_id_col_to_custom_pages_table', 1),
(97, '2021_06_04_143406_add_workspace_id_col_to_file_entries_table', 1),
(98, '2021_06_05_182202_create_csv_exports_table', 1),
(99, '2021_06_07_150049_add_utm_col_to_links_table', 1),
(100, '2021_06_07_184331_remove_unique_from_alias_in_links_table', 1),
(101, '2021_06_08_162624_migrate_landing_page_cta_to_menu_item', 1),
(102, '2021_06_15_162102_add_city_col_to_link_clicks_table', 1),
(103, '2021_06_15_174430_add_domain_id_to_groups_table', 1),
(104, '2021_06_16_173551_make_value_col_in_rules_table_nullable', 1),
(105, '2021_06_18_161030_rename_gateway_col_in_subscriptions_table', 1),
(106, '2021_06_19_111939_add_owner_id_column_to_file_entries_table', 1),
(107, '2021_06_19_112035_materialize_owner_id_in_file_entries_table', 1),
(108, '2021_06_21_171658_create_biolink_widgets_table', 1),
(109, '2021_06_23_132211_add_position_column_in_link_group_link_table', 1),
(110, '2021_06_26_114644_create_biolink_appearance_table', 1),
(111, '2021_06_26_161918_rename_title_to_name_in_links_table', 1),
(112, '2021_06_26_165801_change_active_default_to_1_in_links_table', 1),
(113, '2021_06_26_165856_migrate_active_col_value_in_links_table', 1),
(114, '2021_06_26_170547_rename_public_to_active_in_link_groups_table', 1),
(115, '2021_06_26_171713_rename_link_rules_to_linkeable_rules', 1),
(116, '2021_06_27_124517_migrateTables_to_linkeableMorph', 1),
(117, '2021_06_27_131841_hydrate_linkeable_type_column', 1),
(118, '2021_06_27_131842_hydrate_owner_id_col_in_link_clicks_table', 1),
(119, '2021_07_02_182436_add_deleted_at_col_to_link_groups_table', 1),
(120, '2021_07_06_144837_migrate_landing_page_config_to_20', 1),
(121, '2021_07_06_154011_add_activates_at_col_to_link_groups_table', 1),
(122, '2021_07_10_145319_increase_hash_len_in_link_groups_table', 1),
(123, '2021_07_17_093454_add_created_at_col_to_user_role_table', 1),
(124, '2021_09_30_123758_slugify_tag_name_column', 1),
(125, '2021_10_13_132915_add_token_cols_to_social_profiles_table', 1),
(126, '2022_04_08_122553_change_default_workspace_id_from_null_to_zero', 1),
(127, '2022_04_23_115027_add_id_to_all_menus', 1),
(128, '2022_08_10_200344_add_produce_id_column_to_subscriptions_table', 1),
(129, '2022_08_11_160401_create_prices_table', 1),
(130, '2022_08_11_170041_create_products_table', 1),
(131, '2022_08_11_170117_move_billing_plans_to_products_and_prices_tables', 1),
(132, '2022_08_17_184337_add_card_expires_column_to_users_table', 1),
(133, '2022_08_24_192127_migrate_common_settings_to_v3', 1),
(134, '2022_09_03_164633_add_expires_at_column_to_personal_access_tokens_table', 1),
(135, '2022_09_27_124344_change_available_space_column_to_big_int', 1),
(136, '2022_09_28_121423_migrate_notif_settings_from_array_to_obj', 1),
(137, '2022_11_06_115107_increase_file_name_column_length', 1),
(138, '2022_11_12_133125_add_image_col_to_link_groups_table', 1),
(139, '2022_11_28_133131_add_pinned_col_to_widgets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_subscriptions`
--

CREATE TABLE `notification_subscriptions` (
  `id` char(36) NOT NULL,
  `notif_id` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL,
  `channels` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissionables`
--

CREATE TABLE `permissionables` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(11) NOT NULL,
  `permissionable_id` int(11) NOT NULL,
  `permissionable_type` varchar(40) NOT NULL,
  `restrictions` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissionables`
--

INSERT INTO `permissionables` (`id`, `permission_id`, `permissionable_id`, `permissionable_type`, `restrictions`) VALUES
(1, 1, 1, 'App\\User', '[]'),
(2, 4, 1, 'Common\\Auth\\Roles\\Role', '[]'),
(3, 9, 1, 'Common\\Auth\\Roles\\Role', '[]'),
(4, 10, 1, 'Common\\Auth\\Roles\\Role', '[{\"name\":\"count\",\"value\":5}]'),
(5, 14, 1, 'Common\\Auth\\Roles\\Role', '[{\"name\":\"count\",\"value\":5}]'),
(6, 18, 1, 'Common\\Auth\\Roles\\Role', '[]'),
(7, 22, 1, 'Common\\Auth\\Roles\\Role', '[]'),
(8, 26, 1, 'Common\\Auth\\Roles\\Role', '[]'),
(9, 32, 1, 'Common\\Auth\\Roles\\Role', '[]'),
(10, 37, 1, 'Common\\Auth\\Roles\\Role', '[]'),
(11, 42, 1, 'Common\\Auth\\Roles\\Role', '[{\"name\":\"count\",\"value\":3},{\"name\":\"member_count\",\"value\":5}]'),
(12, 48, 1, 'Common\\Auth\\Roles\\Role', '[{\"name\":\"count\",\"value\":20},{\"name\":\"click_count\",\"value\":5000}]'),
(13, 52, 1, 'Common\\Auth\\Roles\\Role', '[{\"name\":\"count\",\"value\":5}]'),
(14, 56, 1, 'Common\\Auth\\Roles\\Role', '[{\"name\":\"count\",\"value\":5}]'),
(15, 60, 1, 'Common\\Auth\\Roles\\Role', '[{\"name\":\"count\",\"value\":3}]'),
(16, 64, 1, 'Common\\Auth\\Roles\\Role', '[{\"name\":\"count\",\"value\":5}]'),
(17, 9, 2, 'Common\\Auth\\Roles\\Role', '[]'),
(18, 48, 2, 'Common\\Auth\\Roles\\Role', '[]'),
(19, 26, 2, 'Common\\Auth\\Roles\\Role', '[]'),
(20, 32, 2, 'Common\\Auth\\Roles\\Role', '[]'),
(21, 37, 2, 'Common\\Auth\\Roles\\Role', '[]'),
(22, 22, 2, 'Common\\Auth\\Roles\\Role', '[]'),
(23, 48, 1, 'Common\\Billing\\Models\\Product', '[{\"name\":\"count\",\"value\":50},{\"name\":\"click_count\",\"value\":1000}]'),
(24, 10, 1, 'Common\\Billing\\Models\\Product', '[{\"name\":\"count\",\"value\":10}]'),
(25, 56, 1, 'Common\\Billing\\Models\\Product', '[{\"name\":\"count\",\"value\":10}]'),
(26, 52, 1, 'Common\\Billing\\Models\\Product', '[{\"name\":\"count\",\"value\":10}]'),
(27, 64, 1, 'Common\\Billing\\Models\\Product', '[{\"name\":\"count\",\"value\":10}]'),
(28, 48, 2, 'Common\\Billing\\Models\\Product', '[{\"name\":\"count\",\"value\":150},{\"name\":\"click_count\",\"value\":3000}]'),
(29, 10, 2, 'Common\\Billing\\Models\\Product', '[{\"name\":\"count\",\"value\":30}]'),
(30, 56, 2, 'Common\\Billing\\Models\\Product', '[{\"name\":\"count\",\"value\":30}]'),
(31, 52, 2, 'Common\\Billing\\Models\\Product', '[{\"name\":\"count\",\"value\":30}]'),
(32, 64, 2, 'Common\\Billing\\Models\\Product', '[{\"name\":\"count\",\"value\":30}]'),
(33, 48, 3, 'Common\\Billing\\Models\\Product', '[]'),
(34, 10, 3, 'Common\\Billing\\Models\\Product', '[]'),
(35, 56, 3, 'Common\\Billing\\Models\\Product', '[]'),
(36, 52, 3, 'Common\\Billing\\Models\\Product', '[]'),
(37, 64, 3, 'Common\\Billing\\Models\\Product', '[]'),
(38, 9, 3, 'Common\\Auth\\Roles\\Role', NULL),
(39, 10, 3, 'Common\\Auth\\Roles\\Role', NULL),
(40, 11, 3, 'Common\\Auth\\Roles\\Role', NULL),
(41, 12, 3, 'Common\\Auth\\Roles\\Role', NULL),
(42, 13, 3, 'Common\\Auth\\Roles\\Role', NULL),
(43, 14, 3, 'Common\\Auth\\Roles\\Role', NULL),
(44, 15, 3, 'Common\\Auth\\Roles\\Role', NULL),
(45, 16, 3, 'Common\\Auth\\Roles\\Role', NULL),
(46, 45, 3, 'Common\\Auth\\Roles\\Role', NULL),
(47, 46, 3, 'Common\\Auth\\Roles\\Role', NULL),
(48, 47, 3, 'Common\\Auth\\Roles\\Role', NULL),
(49, 48, 3, 'Common\\Auth\\Roles\\Role', NULL),
(50, 49, 3, 'Common\\Auth\\Roles\\Role', NULL),
(51, 50, 3, 'Common\\Auth\\Roles\\Role', NULL),
(52, 51, 3, 'Common\\Auth\\Roles\\Role', NULL),
(53, 52, 3, 'Common\\Auth\\Roles\\Role', NULL),
(54, 53, 3, 'Common\\Auth\\Roles\\Role', NULL),
(55, 54, 3, 'Common\\Auth\\Roles\\Role', NULL),
(56, 55, 3, 'Common\\Auth\\Roles\\Role', NULL),
(57, 56, 3, 'Common\\Auth\\Roles\\Role', NULL),
(58, 57, 3, 'Common\\Auth\\Roles\\Role', NULL),
(59, 58, 3, 'Common\\Auth\\Roles\\Role', NULL),
(60, 59, 3, 'Common\\Auth\\Roles\\Role', NULL),
(61, 64, 3, 'Common\\Auth\\Roles\\Role', NULL),
(62, 65, 3, 'Common\\Auth\\Roles\\Role', NULL),
(63, 66, 3, 'Common\\Auth\\Roles\\Role', NULL),
(64, 67, 3, 'Common\\Auth\\Roles\\Role', NULL),
(65, 9, 4, 'Common\\Auth\\Roles\\Role', NULL),
(66, 10, 4, 'Common\\Auth\\Roles\\Role', NULL),
(67, 11, 4, 'Common\\Auth\\Roles\\Role', NULL),
(68, 12, 4, 'Common\\Auth\\Roles\\Role', NULL),
(69, 13, 4, 'Common\\Auth\\Roles\\Role', NULL),
(70, 14, 4, 'Common\\Auth\\Roles\\Role', NULL),
(71, 15, 4, 'Common\\Auth\\Roles\\Role', NULL),
(72, 16, 4, 'Common\\Auth\\Roles\\Role', NULL),
(73, 48, 4, 'Common\\Auth\\Roles\\Role', NULL),
(74, 49, 4, 'Common\\Auth\\Roles\\Role', NULL),
(75, 50, 4, 'Common\\Auth\\Roles\\Role', NULL),
(76, 51, 4, 'Common\\Auth\\Roles\\Role', NULL),
(77, 52, 4, 'Common\\Auth\\Roles\\Role', NULL),
(78, 53, 4, 'Common\\Auth\\Roles\\Role', NULL),
(79, 54, 4, 'Common\\Auth\\Roles\\Role', NULL),
(80, 55, 4, 'Common\\Auth\\Roles\\Role', NULL),
(81, 56, 4, 'Common\\Auth\\Roles\\Role', NULL),
(82, 57, 4, 'Common\\Auth\\Roles\\Role', NULL),
(83, 58, 4, 'Common\\Auth\\Roles\\Role', NULL),
(84, 59, 4, 'Common\\Auth\\Roles\\Role', NULL),
(85, 64, 4, 'Common\\Auth\\Roles\\Role', NULL),
(86, 65, 4, 'Common\\Auth\\Roles\\Role', NULL),
(87, 66, 4, 'Common\\Auth\\Roles\\Role', NULL),
(88, 67, 4, 'Common\\Auth\\Roles\\Role', NULL),
(89, 9, 5, 'Common\\Auth\\Roles\\Role', NULL),
(90, 10, 5, 'Common\\Auth\\Roles\\Role', NULL),
(91, 13, 5, 'Common\\Auth\\Roles\\Role', NULL),
(92, 14, 5, 'Common\\Auth\\Roles\\Role', NULL),
(93, 48, 5, 'Common\\Auth\\Roles\\Role', NULL),
(94, 49, 5, 'Common\\Auth\\Roles\\Role', NULL),
(95, 52, 5, 'Common\\Auth\\Roles\\Role', NULL),
(96, 53, 5, 'Common\\Auth\\Roles\\Role', NULL),
(97, 56, 5, 'Common\\Auth\\Roles\\Role', NULL),
(98, 57, 5, 'Common\\Auth\\Roles\\Role', NULL),
(99, 64, 5, 'Common\\Auth\\Roles\\Role', NULL),
(100, 65, 5, 'Common\\Auth\\Roles\\Role', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `display_name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `group` varchar(30) NOT NULL,
  `restrictions` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'sitewide',
  `advanced` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `group`, `restrictions`, `created_at`, `updated_at`, `type`, `advanced`) VALUES
(1, 'admin', 'Super Admin', 'Give all permissions to user.', 'admin', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 0),
(2, 'admin.access', 'Access Admin', 'Required in order to access any admin area page.', 'admin', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 0),
(3, 'appearance.update', 'Update Appearance', 'Allows access to appearance editor.', 'admin', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 0),
(4, 'api.access', 'Access Api', 'Allow users to use the API and access API section in their account settings page.', 'api', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 0),
(5, 'roles.view', 'View Roles', 'Allow viewing ALL roles, regardless of who is the owner.', 'roles', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(6, 'roles.create', 'Create Roles', 'Allow creating new roles, regardless of who is the owner.', 'roles', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(7, 'roles.update', 'Update Roles', 'Allow updating ALL roles, regardless of who is the owner.', 'roles', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(8, 'roles.delete', 'Delete Roles', 'Allow deleting ALL roles, regardless of who is the owner.', 'roles', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(9, 'custom_pages.view', 'View Custom Pages', 'Allow viewing of all pages on the site, regardless of who created them. User can view their own pages without this permission.', 'custom_pages', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(10, 'custom_pages.create', 'Create Custom Pages', 'Allow creating new custom pages, regardless of who is the owner.', 'custom_pages', '[{\"name\":\"count\",\"type\":\"number\",\"description\":\"Maximum number of pages user will be able to create. Leave empty for unlimited.\"}]', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(11, 'custom_pages.update', 'Update Custom Pages', 'Allow editing of all pages on the site, regardless of who created them. User can edit their own pages without this permission.', 'custom_pages', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(12, 'custom_pages.delete', 'Delete Custom Pages', 'Allow deleting of all pages on the site, regardless of who created them. User can delete their own pages without this permission.', 'custom_pages', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(13, 'custom_domains.view', 'View Custom Domains', 'Allow viewing all domains on the site, regardless of who created them. User can view their own domains without this permission.', 'custom_domains', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(14, 'custom_domains.create', 'Create Custom Domains', 'Allow user to connect their own custom domains.', 'custom_domains', '[{\"name\":\"count\",\"type\":\"number\",\"description\":\"Maximum number of domains user will be able to create. Leave empty for unlimited.\"}]', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 0),
(15, 'custom_domains.update', 'Update Custom Domains', 'Allow editing all domains on the site, regardless of who created them. User can edit their own domains without this permission.', 'custom_domains', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(16, 'custom_domains.delete', 'Delete Custom Domains', 'Allow deleting all domains on the site, regardless of who created them. User can delete their own domains without this permission.', 'custom_domains', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(17, 'files.view', 'View Files', 'Allow viewing all uploaded files on the site. Users can view their own uploads without this permission.', 'files', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(18, 'files.create', 'Create Files', 'Allow uploading files on the site. This permission is used by any page where it is possible for user to upload files.', 'files', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(19, 'files.update', 'Update Files', 'Allow editing all uploaded files on the site. Users can edit their own uploads without this permission.', 'files', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(20, 'files.delete', 'Delete Files', 'Allow deleting all uploaded files on the site. Users can delete their own uploads (where applicable) without this permission.', 'files', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(21, 'files.download', 'Download Files', 'Allow downloading all uploaded files on the site. Users can download their own uploads (where applicable) without this permission.', 'files', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(22, 'users.view', 'View Users', 'Allow viewing user profile pages on the site. User can view their own profile without this permission.', 'users', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 0),
(23, 'users.create', 'Create Users', 'Allow creating users from admin area. Users can register for new accounts without this permission. Registration can be disabled from settings page.', 'users', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(24, 'users.update', 'Update Users', 'Allow editing details of any user on the site. User can edit their own details without this permission.', 'users', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(25, 'users.delete', 'Delete Users', 'Allow deleting any user on the site. User can request deletion of their own account without this permission.', 'users', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(26, 'localizations.view', 'View Localizations', 'Allow viewing ALL localizations, regardless of who is the owner.', 'localizations', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(27, 'localizations.create', 'Create Localizations', 'Allow creating new localizations, regardless of who is the owner.', 'localizations', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(28, 'localizations.update', 'Update Localizations', 'Allow updating ALL localizations, regardless of who is the owner.', 'localizations', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(29, 'localizations.delete', 'Delete Localizations', 'Allow deleting ALL localizations, regardless of who is the owner.', 'localizations', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(30, 'settings.view', 'View Settings', 'Allow viewing ALL settings, regardless of who is the owner.', 'settings', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(31, 'settings.update', 'Update Settings', 'Allow updating ALL settings, regardless of who is the owner.', 'settings', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(32, 'plans.view', 'View Plans', 'Allow viewing ALL plans, regardless of who is the owner.', 'plans', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(33, 'plans.create', 'Create Plans', 'Allow creating new plans, regardless of who is the owner.', 'plans', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(34, 'plans.update', 'Update Plans', 'Allow updating ALL plans, regardless of who is the owner.', 'plans', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(35, 'plans.delete', 'Delete Plans', 'Allow deleting ALL plans, regardless of who is the owner.', 'plans', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(36, 'invoices.view', 'View Invoices', 'Allow viewing ALL invoices, regardless of who is the owner.', 'invoices', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(37, 'tags.view', 'View Tags', 'Allow viewing ALL tags, regardless of who is the owner.', 'tags', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(38, 'tags.create', 'Create Tags', 'Allow creating new tags, regardless of who is the owner.', 'tags', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(39, 'tags.update', 'Update Tags', 'Allow updating ALL tags, regardless of who is the owner.', 'tags', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(40, 'tags.delete', 'Delete Tags', 'Allow deleting ALL tags, regardless of who is the owner.', 'tags', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(41, 'workspaces.view', 'View Workspaces', 'Allow viewing of all workspaces on the site, regardless of who created them. User can view their own workspaces without this permission.', 'workspaces', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(42, 'workspaces.create', 'Create Workspaces', 'Allow creating new workspaces, regardless of who is the owner.', 'workspaces', '[{\"name\":\"count\",\"type\":\"number\",\"description\":\"Maximum number of workspaces user will be able to create. Leave empty for unlimited.\"},{\"name\":\"member_count\",\"type\":\"number\",\"description\":\"Maximum number of members workspace is allowed to have.\"}]', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 0),
(43, 'workspaces.update', 'Update Workspaces', 'Allow editing of all workspaces on the site, regardless of who created them. User can edit their own workspaces without this permission.', 'workspaces', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(44, 'workspaces.delete', 'Delete Workspaces', 'Allow deleting of all workspaces on the site, regardless of who created them. User can delete their own workspaces without this permission.', 'workspaces', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(45, 'workspace_members.invite', 'Invite Members', 'Allow user to invite new members into a workspace.', 'workspace_members', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'workspace', 0),
(46, 'workspace_members.update', 'Update Members', 'Allow user to change role of other members.', 'workspace_members', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'workspace', 0),
(47, 'workspace_members.delete', 'Delete Members', 'Allow user to remove members from workspace.', 'workspace_members', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'workspace', 0),
(48, 'links.create', 'Create Links', 'Allow creating new links, regardless of who is the owner.', 'links', '[{\"name\":\"count\",\"type\":\"number\",\"description\":\"Maximum number of urls user will be able to create. Leave empty for unlimited.\"},{\"name\":\"click_count\",\"type\":\"number\",\"description\":\"Maximum number of clicks\\/visits allowed per month for all user urls. Leave empty for unlimited.\"},{\"name\":\"alias\",\"type\":\"bool\",\"description\":\"Whether user is allowed to set custom alias for links.\"},{\"name\":\"expiration\",\"type\":\"bool\",\"description\":\"Whether user is allowed to set expiration date or clicks for links.\"},{\"name\":\"password\",\"type\":\"bool\",\"description\":\"Whether user is allowed to set password for links.\"},{\"name\":\"utm\",\"type\":\"bool\",\"description\":\"Whether user is allowed to use utm builder when shortening links.\"},{\"name\":\"retargeting\",\"type\":\"bool\",\"description\":\"Whether user is allowed to use location, device and platform retargeting features.\"}]', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 0),
(49, 'links.view', 'View Links', 'Allow viewing of all links on the site, regardless of who created them. User can view their own links without this permission.', 'links', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(50, 'links.update', 'Update Links', 'Allow editing of all links on the site, regardless of who created them. User can edit their own links without this permission.', 'links', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(51, 'links.delete', 'Delete Links', 'Allow deleting of all links on the site, regardless of who created them. User can delete their own links without this permission.', 'links', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(52, 'link_overlays.create', 'Create Link Overlays', 'Allow creating new link overlays, regardless of who is the owner.', 'link_overlays', '[{\"name\":\"count\",\"type\":\"number\",\"description\":\"Maximum number of overlays user will be able to create. Leave empty for unlimited.\"}]', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 0),
(53, 'link_overlays.view', 'View Link Overlays', 'Allow viewing of all overlays on the site, regardless of who created them. User can view their own overlays without this permission.', 'link_overlays', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(54, 'link_overlays.update', 'Update Link Overlays', 'Allow editing of all overlays on the site, regardless of who created them. User can edit their own overlays without this permission.', 'link_overlays', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(55, 'link_overlays.delete', 'Delete Link Overlays', 'Allow deleting of all overlays on the site, regardless of who created them. User can delete their own overlays without this permission.', 'link_overlays', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(56, 'link_groups.create', 'Create Link Groups', 'Allow creating new link groups, regardless of who is the owner.', 'link_groups', '[{\"name\":\"count\",\"type\":\"number\",\"description\":\"Maximum number of groups user will be able to create. Leave empty for unlimited.\"}]', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 0),
(57, 'link_groups.view', 'View Link Groups', 'Allow viewing of all link groups on the site, regardless of who created them. User can view their own groups without this permission.', 'link_groups', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(58, 'link_groups.update', 'Update Link Groups', 'Allow editing of all link groups on the site, regardless of who created them. User can edit their own groups without this permission.', 'link_groups', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(59, 'link_groups.delete', 'Delete Link Groups', 'Allow deleting of all link groups on the site, regardless of who created them. User can delete their own groups without this permission.', 'link_groups', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(60, 'biolinks.create', 'Create Biolinks', 'Allow creating new biolinks, regardless of who is the owner.', 'biolinks', '[{\"name\":\"count\",\"type\":\"number\",\"description\":\"Maximum number of biolinks user will be able to create. Leave empty for unlimited.\"}]', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 0),
(61, 'biolinks.view', 'View Biolinks', 'Allow viewing of all biolinks on the site, regardless of who created them. User can view their own biolinks without this permission.', 'biolinks', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(62, 'biolinks.update', 'Update Biolinks', 'Allow editing of all biolinks on the site, regardless of who created them. User can edit their own biolinks without this permission.', 'biolinks', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(63, 'biolinks.delete', 'Delete Biolinks', 'Allow deleting of all biolinks on the site, regardless of who created them. User can delete their own biolinks without this permission.', 'biolinks', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(64, 'tracking_pixels.create', 'Create Tracking Pixels', 'Allow creating new tracking pixels, regardless of who is the owner.', 'tracking_pixels', '[{\"name\":\"count\",\"type\":\"number\",\"description\":\"Maximum number of pixels user will be able to create. Leave empty for unlimited.\"}]', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 0),
(65, 'tracking_pixels.view', 'View Tracking Pixels', 'Allow viewing of all pixels on the site, regardless of who created them. User can view their own pixels without this permission.', 'tracking_pixels', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(66, 'tracking_pixels.update', 'Update Tracking Pixels', 'Allow editing of all pixels on the site, regardless of who created them. User can edit their own pixels without this permission.', 'tracking_pixels', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1),
(67, 'tracking_pixels.delete', 'Delete Tracking Pixels', 'Allow deleting of all pixels on the site, regardless of who created them. User can delete their own pixels without this permission.', 'tracking_pixels', NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'sitewide', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

CREATE TABLE `prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(13,2) NOT NULL,
  `currency` varchar(191) NOT NULL,
  `interval` varchar(191) NOT NULL DEFAULT 'month',
  `interval_count` int(11) NOT NULL DEFAULT 1,
  `product_id` int(11) NOT NULL,
  `stripe_id` varchar(50) DEFAULT NULL,
  `paypal_id` varchar(50) DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prices`
--

INSERT INTO `prices` (`id`, `amount`, `currency`, `interval`, `interval_count`, `product_id`, `stripe_id`, `paypal_id`, `default`, `created_at`, `updated_at`) VALUES
(1, '1.00', 'USD', 'month', 1, 1, 'price_1MjW18ABwYyaue17TniOxkfw', 'P-008600962F863573YMQERI4Q', 0, '2023-03-08 19:52:45', '2023-03-09 04:06:17'),
(2, '54.00', 'USD', 'month', 6, 1, 'price_1MjW18ABwYyaue17mkpX984r', 'P-2V477014SC424721EMQERI4Q', 0, '2023-03-08 19:52:45', '2023-03-09 04:06:17'),
(3, '96.00', 'USD', 'month', 12, 1, 'price_1MjW18ABwYyaue17ncji1B8H', 'P-7PX616163C803030RMQERI4Q', 0, '2023-03-08 19:52:45', '2023-03-09 04:06:17'),
(4, '15.00', 'USD', 'month', 1, 2, 'price_1MjW19ABwYyaue17UrOBkcaD', 'P-04C54577P3998792BMQERI4Y', 0, '2023-03-08 19:52:45', '2023-03-09 04:04:19'),
(5, '81.00', 'USD', 'month', 6, 2, 'price_1MjW19ABwYyaue17F34d1qoh', 'P-33626674LJ416315MMQERI4Y', 0, '2023-03-08 19:52:45', '2023-03-09 04:04:19'),
(6, '144.00', 'USD', 'month', 12, 2, 'price_1MjW19ABwYyaue17IbBGm66d', 'P-8XJ1506676783844PMQERI4Y', 0, '2023-03-08 19:52:45', '2023-03-09 04:04:19'),
(7, '20.00', 'USD', 'month', 1, 3, 'price_1MjW1AABwYyaue17tHiChglj', 'P-36Y60776UA7427706MQERI5A', 0, '2023-03-08 19:52:45', '2023-03-09 04:04:20'),
(8, '135.00', 'USD', 'month', 6, 3, 'price_1MjW1AABwYyaue17G1xprV9a', 'P-3S537214WN1154129MQERI5A', 0, '2023-03-08 19:52:45', '2023-03-09 04:04:20'),
(9, '240.00', 'USD', 'month', 12, 3, 'price_1MjW1AABwYyaue17YAsAbiWX', 'P-7MC57885B4736531UMQERI5I', 0, '2023-03-08 19:52:45', '2023-03-09 04:04:21');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `feature_list` text DEFAULT NULL,
  `position` smallint(6) NOT NULL DEFAULT 0,
  `recommended` tinyint(1) NOT NULL DEFAULT 0,
  `free` tinyint(1) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `available_space` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `uuid`, `feature_list`, `position`, `recommended`, `free`, `hidden`, `available_space`, `created_at`, `updated_at`) VALUES
(1, 'Basic', NULL, '98451970-5cce-4b49-bec4-10f4d5ace5da', '[\"Up to 1000 visitors \\/ month\",\"Up to 50 links\",\"Up to 10 custom link pages\",\"Up to 10 link groups\",\"Up to 10 link overlays\",\"Up to 10 tracking pixels\"]', 1, 1, 0, 0, NULL, '2023-03-08 19:52:45', '2023-03-09 04:05:49'),
(2, 'Standard', NULL, '1ae66695-c176-4ff5-bd8e-d4ec08c5a27f', '[\"Up to 3000 visitors \\/ month\",\"Up to 150 links\",\"Up to 30 custom link pages\",\"Up to 30 link groups\",\"Up to 30 link overlays\",\"Up to 30 tracking pixels\"]', 2, 1, 0, 0, NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45'),
(3, 'Pro', NULL, 'd6d9de95-6050-47df-b1b4-74b0d75a2dc2', '[\"Unlimited visitors \\/ month\",\"Unlimited links\",\"Unlimited link pages\",\"Unlimited link groups\",\"Unlimited link overlays\",\"Unlimited tracking pixels\"]', 3, 0, 0, 0, NULL, '2023-03-08 19:52:45', '2023-03-08 19:52:45');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `legacy_permissions` text DEFAULT NULL,
  `default` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `guests` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'sitewide',
  `internal` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `legacy_permissions`, `default`, `guests`, `created_at`, `updated_at`, `description`, `type`, `internal`) VALUES
(1, 'users', NULL, 1, 0, '2023-03-08 19:52:45', '2023-03-08 19:52:45', NULL, 'sitewide', 0),
(2, 'guests', NULL, 0, 1, '2023-03-08 19:52:45', '2023-03-08 19:52:45', NULL, 'sitewide', 0),
(3, 'Workspace Admin', NULL, 0, 0, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'Manage all workspace resources, invite and manage members.', 'workspace', 0),
(4, 'Workspace Editor', NULL, 0, 0, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'Manage all workspace resources, regardless of resource owner.', 'workspace', 0),
(5, 'Workspace Member', NULL, 0, 0, '2023-03-08 19:52:45', '2023-03-08 19:52:45', 'Create workspace resources, but can\'t edit or delete resources owned by other members.', 'workspace', 0);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `private` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_at`, `updated_at`, `private`) VALUES
(1, 'dates.format', 'short', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(2, 'dates.locale', 'en_US', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(3, 'dates.default_timezone', 'auto', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(4, 'locale.default', 'auto', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(5, 'social.google.enable', 'false', '2023-03-08 19:52:45', '2023-03-09 12:28:11', 0),
(6, 'social.twitter.enable', 'false', '2023-03-08 19:52:45', '2023-03-09 12:28:11', 0),
(7, 'social.facebook.enable', 'false', '2023-03-08 19:52:45', '2023-03-09 12:28:11', 0),
(8, 'realtime.enable', 'false', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(9, 'registration.disable', 'false', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(10, 'cache.report_minutes', '60', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(11, 'branding.logo_dark', 'storage/branding_media/de63c9db-618a-4cc5-89f4-ac6f4a5b3148.png', '2023-03-08 19:52:45', '2023-03-10 19:23:19', 0),
(12, 'branding.logo_light', 'storage/branding_media/604e8eeb-74d1-4df6-b78a-d482ce4011a0.png', '2023-03-08 19:52:45', '2023-03-10 13:57:59', 0),
(13, 'i18n.default_localization', 'en', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(14, 'i18n.enable', 'true', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(15, 'logging.sentry_public', '', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(16, 'realtime.pusher_key', '', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(17, 'themes.user_change', 'true', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(18, 'themes.default_id', '0', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(19, 'billing.enable', 'true', '2023-03-08 19:52:45', '2023-03-09 04:03:29', 0),
(20, 'billing.paypal_test_mode', 'true', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(21, 'billing.stripe_test_mode', 'true', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(22, 'billing.stripe.enable', 'true', '2023-03-08 19:52:45', '2023-03-09 04:03:29', 0),
(23, 'billing.paypal.enable', 'false', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(24, 'billing.accepted_cards', '[\"visa\",\"mastercard\",\"american-express\",\"discover\"]', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(25, 'custom_domains.default_host', '', '2023-03-08 19:52:45', '2023-03-09 05:56:09', 0),
(26, 'uploads.chunk', 'true', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(27, 'uploads.chunk_size', '5242880', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(28, 'cookie_notice.enable', 'true', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(29, 'cookie_notice.position', 'bottom', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(30, 'links.default_type', 'direct', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(31, 'links.enable_type', 'true', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(32, 'links.redirect_time', '10', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(33, 'links.retargeting', 'true', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(34, 'links.pixels', 'true', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(35, 'links.homepage_creation', 'true', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(36, 'links.homepage_stats', 'true', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(37, 'links.home_expiration', '1day', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(38, 'links.alias_min', '5', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(39, 'links.alias_max', '10', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(40, 'links.min_len', '3', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(41, 'links.max_len', '1000', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(42, 'links.alias_content', 'alpha_dash', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(43, 'homepage.appearance', '{\"headerTitle\":\"Create Click-Worthy Links\",\"headerSubtitle\":\"its Shortlink helps you maximize the impact of every digital initiative with industry-leading features and tools.\",\"headerImage\":\"images\\/landing\\/landing-bg.jpg\",\"headerImageOpacity\":1,\"headerOverlayColor1\":null,\"headerOverlayColor2\":null,\"footerTitle\":\"Get started today\",\"footerSubtitle\":\"The easiest way to get more clicks with custom links. Sign up below and create your first link or biolink in less than 30 seconds.\",\"pricingTitle\":\"Simple pricing, for everyone.\",\"pricingSubtitle\":\"It doesn\\u2019t matter what size your business is, we offer a simple pricing model that scales with your needs.\",\"footerImage\":\"images\\/landing\\/landing-bg.jpg\",\"actions\":{\"inputText\":\"Paste a long url\",\"inputButton\":\"Shorten\",\"cta1\":{\"label\":\"Get started\",\"type\":\"route\"},\"cta2\":{\"label\":\"Learn more\",\"type\":\"route\"},\"cta3\":{\"label\":\"Sign up for free\",\"type\":\"route\",\"action\":\"\\/register\"}},\"primaryFeatures\":[{\"title\":\"Password Protect\",\"subtitle\":\"Set a password to protect your links from unauthorized access.\",\"image\":\"images\\/landing\\/authentication.svg\"},{\"title\":\"Retargeting\",\"subtitle\":\"Add retargeting pixels to your links and turn every URL into perfectly targeted ads.\",\"image\":\"images\\/landing\\/right-direction.svg\"},{\"title\":\"Groups\",\"subtitle\":\"Group links together for easier management and analytics for a group as well as individual links.\",\"image\":\"images\\/landing\\/add-file.svg\"}],\"secondaryFeatures\":[{\"title\":\"The only link you\'ll ever need.\",\"subtitle\":\"Link in bio\",\"description\":\"Biolink is the launchpad to your latest video,  song, article, recipe, tour, store, website, social post - everywhere you are online.\",\"image\":\"images\\/landing\\/biolink.png\"},{\"title\":\"Monitor your link performance.\",\"subtitle\":\"ADVANCED ANALYTICS\",\"description\":\"Full analytics for individual links and link groups, including geo and device information, referrers, browser, ip and more.\",\"image\":\"images\\/landing\\/stats.png\"},{\"title\":\"Manage your links.\",\"subtitle\":\"FULLY-FEATURED DASHBOARD\",\"description\":\"Control everything from the dashboard. Manage your URLs, groups, custom pages, pixels, custom domains and more.\",\"image\":\"images\\/landing\\/dashboard.png\"}]}', '2023-03-08 19:52:45', '2023-03-09 21:51:26', 0),
(44, 'homepage.type', 'landingPage', '2023-03-08 19:52:45', '2023-03-08 20:03:49', 0),
(45, 'menus', '[{\"name\":\"User Dashboard\",\"id\":\"5vpqoa\",\"positions\":[\"dashboard-sidebar\"],\"items\":[{\"type\":\"route\",\"label\":\"Dashboard\",\"action\":\"\\/dashboard\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"m12 5.69 5 4.5V18h-2v-6H9v6H7v-7.81l5-4.5M12 3 2 12h3v8h6v-6h2v6h6v-8h3L12 3z\"}}],\"id\":318},{\"type\":\"route\",\"label\":\"Links\",\"action\":\"\\/dashboard\\/links\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M17 7h-4v2h4c1.65 0 3 1.35 3 3s-1.35 3-3 3h-4v2h4c2.76 0 5-2.24 5-5s-2.24-5-5-5zm-6 8H7c-1.65 0-3-1.35-3-3s1.35-3 3-3h4V7H7c-2.76 0-5 2.24-5 5s2.24 5 5 5h4v-2zm-3-4h8v2H8z\"}}],\"id\":723},{\"type\":\"route\",\"label\":\"Biolinks\",\"action\":\"\\/dashboard\\/biolinks\",\"id\":239,\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M20 5h-3.2L15 3H9L7.2 5H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V7c0-1.1-.9-2-2-2zm0 14h-8v-1c-2.8 0-5-2.2-5-5s2.2-5 5-5V7h8v12zm-3-6c0-2.8-2.2-5-5-5v1.8c1.8 0 3.2 1.4 3.2 3.2s-1.4 3.2-3.2 3.2V18c2.8 0 5-2.2 5-5zm-8.2 0c0 1.8 1.4 3.2 3.2 3.2V9.8c-1.8 0-3.2 1.4-3.2 3.2z\"}}]},{\"type\":\"route\",\"order\":1,\"position\":2,\"label\":\"Link Groups\",\"action\":\"\\/dashboard\\/link-groups\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M19 5v2h-4V5h4M9 5v6H5V5h4m10 8v6h-4v-6h4M9 17v2H5v-2h4M21 3h-8v6h8V3zM11 3H3v10h8V3zm10 8h-8v10h8V11zm-10 4H3v6h8v-6z\"}}],\"id\":586},{\"type\":\"route\",\"label\":\"Branded Domains\",\"action\":\"\\/dashboard\\/custom-domains\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M11.99 2C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zm6.93 6h-2.95c-.32-1.25-.78-2.45-1.38-3.56 1.84.63 3.37 1.91 4.33 3.56zM12 4.04c.83 1.2 1.48 2.53 1.91 3.96h-3.82c.43-1.43 1.08-2.76 1.91-3.96zM4.26 14C4.1 13.36 4 12.69 4 12s.1-1.36.26-2h3.38c-.08.66-.14 1.32-.14 2s.06 1.34.14 2H4.26zm.82 2h2.95c.32 1.25.78 2.45 1.38 3.56-1.84-.63-3.37-1.9-4.33-3.56zm2.95-8H5.08c.96-1.66 2.49-2.93 4.33-3.56C8.81 5.55 8.35 6.75 8.03 8zM12 19.96c-.83-1.2-1.48-2.53-1.91-3.96h3.82c-.43 1.43-1.08 2.76-1.91 3.96zM14.34 14H9.66c-.09-.66-.16-1.32-.16-2s.07-1.35.16-2h4.68c.09.65.16 1.32.16 2s-.07 1.34-.16 2zm.25 5.56c.6-1.11 1.06-2.31 1.38-3.56h2.95c-.96 1.65-2.49 2.93-4.33 3.56zM16.36 14c.08-.66.14-1.32.14-2s-.06-1.34-.14-2h3.38c.16.64.26 1.31.26 2s-.1 1.36-.26 2h-3.38z\"}}],\"id\":444},{\"type\":\"route\",\"label\":\"CTA Overlays\",\"action\":\"\\/dashboard\\/link-overlays\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M21.99 4c0-1.1-.89-2-1.99-2H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h14l4 4-.01-18zM20 4v13.17L18.83 16H4V4h16zM6 12h12v2H6zm0-3h12v2H6zm0-3h12v2H6z\"}}],\"id\":184},{\"type\":\"route\",\"label\":\"Tracking Pixels\",\"action\":\"\\/dashboard\\/pixels\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M13.02 19.93v2.02c2.01-.2 3.84-1 5.32-2.21l-1.42-1.43c-1.11.86-2.44 1.44-3.9 1.62zM4.03 12c0-4.05 3.03-7.41 6.95-7.93V2.05C5.95 2.58 2.03 6.84 2.03 12c0 5.16 3.92 9.42 8.95 9.95v-2.02c-3.92-.52-6.95-3.88-6.95-7.93zm15.92-1h2.02c-.2-2.01-1-3.84-2.21-5.32l-1.43 1.43c.86 1.1 1.44 2.43 1.62 3.89zm-1.61-6.74c-1.48-1.21-3.32-2.01-5.32-2.21v2.02c1.46.18 2.79.76 3.9 1.62l1.42-1.43zm-.01 12.64 1.43 1.42c1.21-1.48 2.01-3.31 2.21-5.32h-2.02c-.18 1.46-.76 2.79-1.62 3.9z\"}},{\"tag\":\"path\",\"attr\":{\"d\":\"M16 11.1C16 8.61 14.1 7 12 7s-4 1.61-4 4.1c0 1.66 1.33 3.63 4 5.9 2.67-2.27 4-4.24 4-5.9zm-4 .9c-.59 0-1.07-.48-1.07-1.07 0-.59.48-1.07 1.07-1.07s1.07.48 1.07 1.07c0 .59-.48 1.07-1.07 1.07z\"}}],\"id\":303},{\"type\":\"route\",\"label\":\"Link Pages\",\"action\":\"\\/dashboard\\/link-pages\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"m22 3-1.67 1.67L18.67 3 17 4.67 15.33 3l-1.66 1.67L12 3l-1.67 1.67L8.67 3 7 4.67 5.33 3 3.67 4.67 2 3v16c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V3zM11 19H4v-6h7v6zm9 0h-7v-2h7v2zm0-4h-7v-2h7v2zm0-4H4V8h16v3z\"}}],\"id\":637}]},{\"name\":\"Footer\",\"id\":\"4tbwog\",\"positions\":[\"footer\"],\"items\":[{\"type\":\"route\",\"id\":\"c1sf2g\",\"position\":1,\"label\":\"Developers\",\"action\":\"\\/api-docs\",\"condition\":\"auth\",\"permissions\":[\"api.access\"]},{\"type\":\"route\",\"id\":\"rlz27v\",\"position\":2,\"label\":\"Privacy Policy\",\"action\":\"\\/pages\\/privacy-policy\"},{\"type\":\"route\",\"id\":\"p80pvk\",\"position\":3,\"label\":\"Terms of Service\",\"action\":\"\\/pages\\/terms-of-service\"},{\"type\":\"route\",\"id\":\"q8dtht\",\"position\":4,\"label\":\"Contact Us\",\"action\":\"\\/contact\"}]},{\"name\":\"Footer Social\",\"id\":\"odw4ah\",\"positions\":[\"footer-secondary\"],\"items\":[{\"type\":\"link\",\"id\":\"6j747e\",\"position\":1,\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M19 3H5a2 2 0 00-2 2v14a2 2 0 002 2h7.621v-6.961h-2.343v-2.725h2.343V9.309c0-2.324 1.421-3.591 3.495-3.591.699-.002 1.397.034 2.092.105v2.43H16.78c-1.13 0-1.35.534-1.35 1.322v1.735h2.7l-.351 2.725h-2.365V21H19a2 2 0 002-2V5a2 2 0 00-2-2z\"}}],\"action\":\"https:\\/\\/facebook.com\"},{\"type\":\"link\",\"id\":\"jo96zw\",\"position\":2,\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M24 4.3c-.898.4-1.8.7-2.8.802 1-.602 1.8-1.602 2.198-2.704-1 .602-2 1-3.097 1.204C19.3 2.602 18 2 16.6 2a4.907 4.907 0 00-4.9 4.898c0 .403 0 .801.102 1.102C7.7 7.8 4.102 5.898 1.7 2.898c-.5.704-.7 1.602-.7 2.5 0 1.704.898 3.204 2.2 4.102-.802-.102-1.598-.3-2.2-.602V9c0 2.398 1.7 4.398 3.898 4.8-.398.098-.796.2-1.296.2-.301 0-.602 0-.903-.102.602 2 2.403 3.403 4.602 3.403-1.7 1.3-3.801 2.097-6.102 2.097-.398 0-.8 0-1.199-.097C2.2 20.699 4.8 21.5 7.5 21.5c9.102 0 14-7.5 14-14v-.602c1-.699 1.8-1.597 2.5-2.597\"}}],\"action\":\"https:\\/\\/twitter.com\"},{\"type\":\"link\",\"id\":\"57dsea\",\"position\":3,\"action\":\"https:\\/\\/instagram.com\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M12 0C8.74 0 8.333.015 7.053.072 5.775.132 4.905.333 4.14.63c-.789.306-1.459.717-2.126 1.384S.935 3.35.63 4.14C.333 4.905.131 5.775.072 7.053.012 8.333 0 8.74 0 12s.015 3.667.072 4.947c.06 1.277.261 2.148.558 2.913a5.885 5.885 0 001.384 2.126A5.868 5.868 0 004.14 23.37c.766.296 1.636.499 2.913.558C8.333 23.988 8.74 24 12 24s3.667-.015 4.947-.072c1.277-.06 2.148-.262 2.913-.558a5.898 5.898 0 002.126-1.384 5.86 5.86 0 001.384-2.126c.296-.765.499-1.636.558-2.913.06-1.28.072-1.687.072-4.947s-.015-3.667-.072-4.947c-.06-1.277-.262-2.149-.558-2.913a5.89 5.89 0 00-1.384-2.126A5.847 5.847 0 0019.86.63c-.765-.297-1.636-.499-2.913-.558C15.667.012 15.26 0 12 0zm0 2.16c3.203 0 3.585.016 4.85.071 1.17.055 1.805.249 2.227.415.562.217.96.477 1.382.896.419.42.679.819.896 1.381.164.422.36 1.057.413 2.227.057 1.266.07 1.646.07 4.85s-.015 3.585-.074 4.85c-.061 1.17-.256 1.805-.421 2.227a3.81 3.81 0 01-.899 1.382 3.744 3.744 0 01-1.38.896c-.42.164-1.065.36-2.235.413-1.274.057-1.649.07-4.859.07-3.211 0-3.586-.015-4.859-.074-1.171-.061-1.816-.256-2.236-.421a3.716 3.716 0 01-1.379-.899 3.644 3.644 0 01-.9-1.38c-.165-.42-.359-1.065-.42-2.235-.045-1.26-.061-1.649-.061-4.844 0-3.196.016-3.586.061-4.861.061-1.17.255-1.814.42-2.234.21-.57.479-.96.9-1.381.419-.419.81-.689 1.379-.898.42-.166 1.051-.361 2.221-.421 1.275-.045 1.65-.06 4.859-.06l.045.03zm0 3.678a6.162 6.162 0 100 12.324 6.162 6.162 0 100-12.324zM12 16c-2.21 0-4-1.79-4-4s1.79-4 4-4 4 1.79 4 4-1.79 4-4 4zm7.846-10.405a1.441 1.441 0 01-2.88 0 1.44 1.44 0 012.88 0z\"}}]},{\"type\":\"link\",\"id\":\"lzntr2\",\"position\":4,\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M5.68 2l1.478 5.344v2.562H8.44V7.344L9.937 2h-1.29l-.538 2.432a27.21 27.21 0 00-.29 1.515h-.04c-.063-.42-.159-.93-.29-1.525L6.97 2H5.68zm5.752 2.018c-.434 0-.784.084-1.051.257-.267.172-.464.448-.59.825-.125.377-.187.876-.187 1.498v.84c0 .615.054 1.107.164 1.478.11.371.295.644.556.82.261.176.62.264 1.078.264.446 0 .8-.087 1.06-.26.26-.173.45-.444.565-.818.116-.374.174-.869.174-1.485v-.84c0-.62-.059-1.118-.178-1.492-.119-.373-.308-.648-.566-.824-.258-.176-.598-.263-1.025-.263zm2.447.113v4.314c0 .534.09.927.271 1.178.182.251.465.377.848.377.552 0 .968-.267 1.244-.8h.028l.113.706H17.4V4.131h-1.298v4.588a.635.635 0 01-.23.263.569.569 0 01-.325.104c-.132 0-.226-.054-.283-.164-.057-.11-.086-.295-.086-.553V4.131h-1.3zm-2.477.781c.182 0 .311.095.383.287.072.191.108.495.108.91v1.8c0 .426-.036.735-.108.923-.072.188-.2.282-.38.283-.183 0-.309-.095-.378-.283-.07-.188-.103-.497-.103-.924V6.11c0-.414.035-.718.107-.91.072-.19.195-.287.371-.287zM5 11c-1.1 0-2 .9-2 2v7c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2v-7c0-1.1-.9-2-2-2H5zm7.049 2h1.056v2.568h.008c.095-.186.232-.335.407-.449.175-.114.364-.17.566-.17.26 0 .463.07.611.207.148.138.257.361.323.668.066.308.097.735.097 1.281v.772h.002c0 .727-.089 1.26-.264 1.602-.175.342-.447.513-.818.513-.207 0-.394-.047-.564-.142a.93.93 0 01-.383-.391h-.024l-.11.46h-.907V13zm-6.563.246h3.252v.885h-1.09v5.789H6.576v-5.79h-1.09v-.884zm11.612 1.705c.376 0 .665.07.867.207.2.138.343.354.426.645.082.292.123.695.123 1.209v.836h-1.836v.248c0 .313.008.547.027.703.02.156.057.27.115.342.058.072.148.107.27.107.164 0 .277-.064.338-.191.06-.127.094-.338.1-.635l.947.055a1.6 1.6 0 01.007.175c0 .451-.124.788-.37 1.01-.248.223-.595.334-1.046.334-.54 0-.92-.17-1.138-.51-.218-.339-.326-.863-.326-1.574v-.851c0-.732.112-1.267.337-1.604.225-.337.613-.506 1.159-.506zm-8.688.094h1.1v3.58c0 .217.024.373.072.465.048.093.126.139.238.139a.486.486 0 00.276-.088.538.538 0 00.193-.223v-3.873h1.1v4.875h-.862l-.093-.598h-.026c-.234.452-.584.678-1.05.678-.325 0-.561-.106-.715-.318-.154-.212-.233-.544-.233-.994v-3.643zm8.664.648c-.117 0-.204.036-.26.104-.056.069-.093.182-.11.338a6.504 6.504 0 00-.028.71v.35h.803v-.35c0-.312-.01-.548-.032-.71-.02-.162-.059-.276-.115-.342-.056-.066-.14-.1-.258-.1zm-3.482.036a.418.418 0 00-.293.126.699.699 0 00-.192.327v2.767a.487.487 0 00.438.256.337.337 0 00.277-.127c.07-.085.12-.228.149-.43.029-.2.043-.48.043-.835v-.627c0-.382-.011-.676-.035-.883-.024-.207-.067-.357-.127-.444a.299.299 0 00-.26-.13z\"}}],\"action\":\"https:\\/\\/youtube.com\"}]},{\"name\":\"Auth Dropdown\",\"id\":\"h8r6vg\",\"items\":[{\"label\":\"Admin Area\",\"id\":\"upm1rv\",\"action\":\"\\/admin\",\"type\":\"route\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M19 5v2h-4V5h4M9 5v6H5V5h4m10 8v6h-4v-6h4M9 17v2H5v-2h4M21 3h-8v6h8V3zM11 3H3v10h8V3zm10 8h-8v10h8V11zm-10 4H3v6h8v-6z\"}}],\"permissions\":[\"admin.access\"]},{\"label\":\"Dashboard\",\"id\":\"ehj0uk\",\"action\":\"\\/dashboard\",\"type\":\"route\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M17 7h-4v2h4c1.65 0 3 1.35 3 3s-1.35 3-3 3h-4v2h4c2.76 0 5-2.24 5-5s-2.24-5-5-5zm-6 8H7c-1.65 0-3-1.35-3-3s1.35-3 3-3h4V7H7c-2.76 0-5 2.24-5 5s2.24 5 5 5h4v-2zm-3-4h8v2H8z\"}}]},{\"label\":\"Account Settings\",\"id\":\"6a89z5\",\"action\":\"\\/account-settings\",\"type\":\"route\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M19.43 12.98c.04-.32.07-.64.07-.98 0-.34-.03-.66-.07-.98l2.11-1.65c.19-.15.24-.42.12-.64l-2-3.46c-.09-.16-.26-.25-.44-.25-.06 0-.12.01-.17.03l-2.49 1c-.52-.4-1.08-.73-1.69-.98l-.38-2.65C14.46 2.18 14.25 2 14 2h-4c-.25 0-.46.18-.49.42l-.38 2.65c-.61.25-1.17.59-1.69.98l-2.49-1c-.06-.02-.12-.03-.18-.03-.17 0-.34.09-.43.25l-2 3.46c-.13.22-.07.49.12.64l2.11 1.65c-.04.32-.07.65-.07.98 0 .33.03.66.07.98l-2.11 1.65c-.19.15-.24.42-.12.64l2 3.46c.09.16.26.25.44.25.06 0 .12-.01.17-.03l2.49-1c.52.4 1.08.73 1.69.98l.38 2.65c.03.24.24.42.49.42h4c.25 0 .46-.18.49-.42l.38-2.65c.61-.25 1.17-.59 1.69-.98l2.49 1c.06.02.12.03.18.03.17 0 .34-.09.43-.25l2-3.46c.12-.22.07-.49-.12-.64l-2.11-1.65zm-1.98-1.71c.04.31.05.52.05.73 0 .21-.02.43-.05.73l-.14 1.13.89.7 1.08.84-.7 1.21-1.27-.51-1.04-.42-.9.68c-.43.32-.84.56-1.25.73l-1.06.43-.16 1.13-.2 1.35h-1.4l-.19-1.35-.16-1.13-1.06-.43c-.43-.18-.83-.41-1.23-.71l-.91-.7-1.06.43-1.27.51-.7-1.21 1.08-.84.89-.7-.14-1.13c-.03-.31-.05-.54-.05-.74s.02-.43.05-.73l.14-1.13-.89-.7-1.08-.84.7-1.21 1.27.51 1.04.42.9-.68c.43-.32.84-.56 1.25-.73l1.06-.43.16-1.13.2-1.35h1.39l.19 1.35.16 1.13 1.06.43c.43.18.83.41 1.23.71l.91.7 1.06-.43 1.27-.51.7 1.21-1.07.85-.89.7.14 1.13zM12 8c-2.21 0-4 1.79-4 4s1.79 4 4 4 4-1.79 4-4-1.79-4-4-4zm0 6c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2z\"}}]}],\"positions\":[\"auth-dropdown\"]},{\"name\":\"Admin Sidebar\",\"id\":\"2d43u1\",\"items\":[{\"label\":\"Analytics\",\"id\":\"886nz4\",\"action\":\"\\/admin\",\"type\":\"route\",\"condition\":\"admin\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm0 16H5V5h14v14z\"}},{\"tag\":\"path\",\"attr\":{\"d\":\"M7 12h2v5H7zm8-5h2v10h-2zm-4 7h2v3h-2zm0-4h2v2h-2z\"}}],\"role\":1,\"permissions\":[\"admin.access\"],\"roles\":[]},{\"label\":\"Appearance\",\"id\":\"slcqm0\",\"action\":\"\\/admin\\/appearance\",\"type\":\"route\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"m2.53 19.65 1.34.56v-9.03l-2.43 5.86c-.41 1.02.08 2.19 1.09 2.61zm19.5-3.7L17.07 3.98c-.31-.75-1.04-1.21-1.81-1.23-.26 0-.53.04-.79.15L7.1 5.95c-.75.31-1.21 1.03-1.23 1.8-.01.27.04.54.15.8l4.96 11.97c.31.76 1.05 1.22 1.83 1.23.26 0 .52-.05.77-.15l7.36-3.05c1.02-.42 1.51-1.59 1.09-2.6zm-9.2 3.8L7.87 7.79l7.35-3.04h.01l4.95 11.95-7.35 3.05z\"}},{\"tag\":\"circle\",\"attr\":{\"cx\":\"11\",\"cy\":\"9\",\"r\":\"1\"}},{\"tag\":\"path\",\"attr\":{\"d\":\"M5.88 19.75c0 1.1.9 2 2 2h1.45l-3.45-8.34v6.34z\"}}],\"permissions\":[\"appearance.update\"]},{\"label\":\"Settings\",\"id\":\"x5k484\",\"action\":\"\\/admin\\/settings\",\"type\":\"route\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M19.43 12.98c.04-.32.07-.64.07-.98 0-.34-.03-.66-.07-.98l2.11-1.65c.19-.15.24-.42.12-.64l-2-3.46c-.09-.16-.26-.25-.44-.25-.06 0-.12.01-.17.03l-2.49 1c-.52-.4-1.08-.73-1.69-.98l-.38-2.65C14.46 2.18 14.25 2 14 2h-4c-.25 0-.46.18-.49.42l-.38 2.65c-.61.25-1.17.59-1.69.98l-2.49-1c-.06-.02-.12-.03-.18-.03-.17 0-.34.09-.43.25l-2 3.46c-.13.22-.07.49.12.64l2.11 1.65c-.04.32-.07.65-.07.98 0 .33.03.66.07.98l-2.11 1.65c-.19.15-.24.42-.12.64l2 3.46c.09.16.26.25.44.25.06 0 .12-.01.17-.03l2.49-1c.52.4 1.08.73 1.69.98l.38 2.65c.03.24.24.42.49.42h4c.25 0 .46-.18.49-.42l.38-2.65c.61-.25 1.17-.59 1.69-.98l2.49 1c.06.02.12.03.18.03.17 0 .34-.09.43-.25l2-3.46c.12-.22.07-.49-.12-.64l-2.11-1.65zm-1.98-1.71c.04.31.05.52.05.73 0 .21-.02.43-.05.73l-.14 1.13.89.7 1.08.84-.7 1.21-1.27-.51-1.04-.42-.9.68c-.43.32-.84.56-1.25.73l-1.06.43-.16 1.13-.2 1.35h-1.4l-.19-1.35-.16-1.13-1.06-.43c-.43-.18-.83-.41-1.23-.71l-.91-.7-1.06.43-1.27.51-.7-1.21 1.08-.84.89-.7-.14-1.13c-.03-.31-.05-.54-.05-.74s.02-.43.05-.73l.14-1.13-.89-.7-1.08-.84.7-1.21 1.27.51 1.04.42.9-.68c.43-.32.84-.56 1.25-.73l1.06-.43.16-1.13.2-1.35h1.39l.19 1.35.16 1.13 1.06.43c.43.18.83.41 1.23.71l.91.7 1.06-.43 1.27-.51.7 1.21-1.07.85-.89.7.14 1.13zM12 8c-2.21 0-4 1.79-4 4s1.79 4 4 4 4-1.79 4-4-1.79-4-4-4zm0 6c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2z\"}}],\"permissions\":[\"settings.update\"]},{\"label\":\"Plans\",\"id\":\"7o42rt\",\"action\":\"\\/admin\\/plans\",\"type\":\"route\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M7 15h7v2H7zm0-4h10v2H7zm0-4h10v2H7zm12-4h-4.18C14.4 1.84 13.3 1 12 1c-1.3 0-2.4.84-2.82 2H5c-.14 0-.27.01-.4.04-.39.08-.74.28-1.01.55-.18.18-.33.4-.43.64-.1.23-.16.49-.16.77v14c0 .27.06.54.16.78s.25.45.43.64c.27.27.62.47 1.01.55.13.02.26.03.4.03h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-7-.25c.41 0 .75.34.75.75s-.34.75-.75.75-.75-.34-.75-.75.34-.75.75-.75zM19 19H5V5h14v14z\"}}],\"permissions\":[\"plans.update\"]},{\"label\":\"Subscriptions\",\"action\":\"\\/admin\\/subscriptions\",\"type\":\"route\",\"id\":\"sdcb5a\",\"condition\":\"admin\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M4 6h16v2H4zm2-4h12v2H6zm14 8H4c-1.1 0-2 .9-2 2v8c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2v-8c0-1.1-.9-2-2-2zm0 10H4v-8h16v8zm-10-7.27v6.53L16 16z\"}}],\"permissions\":[\"subscriptions.update\"]},{\"label\":\"Users\",\"action\":\"\\/admin\\/users\",\"type\":\"route\",\"id\":\"fzfb45\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M12 6c1.1 0 2 .9 2 2s-.9 2-2 2-2-.9-2-2 .9-2 2-2m0 10c2.7 0 5.8 1.29 6 2H6c.23-.72 3.31-2 6-2m0-12C9.79 4 8 5.79 8 8s1.79 4 4 4 4-1.79 4-4-1.79-4-4-4zm0 10c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z\"}}],\"permissions\":[\"users.update\"]},{\"label\":\"Roles\",\"action\":\"\\/admin\\/roles\",\"type\":\"route\",\"id\":\"mwdkf0\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M9 13.75c-2.34 0-7 1.17-7 3.5V19h14v-1.75c0-2.33-4.66-3.5-7-3.5zM4.34 17c.84-.58 2.87-1.25 4.66-1.25s3.82.67 4.66 1.25H4.34zM9 12c1.93 0 3.5-1.57 3.5-3.5S10.93 5 9 5 5.5 6.57 5.5 8.5 7.07 12 9 12zm0-5c.83 0 1.5.67 1.5 1.5S9.83 10 9 10s-1.5-.67-1.5-1.5S8.17 7 9 7zm7.04 6.81c1.16.84 1.96 1.96 1.96 3.44V19h4v-1.75c0-2.02-3.5-3.17-5.96-3.44zM15 12c1.93 0 3.5-1.57 3.5-3.5S16.93 5 15 5c-.54 0-1.04.13-1.5.35.63.89 1 1.98 1 3.15s-.37 2.26-1 3.15c.46.22.96.35 1.5.35z\"}}],\"permissions\":[\"roles.update\"]},{\"type\":\"route\",\"label\":\"Links\",\"action\":\"\\/admin\\/links\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M17 7h-4v2h4c1.65 0 3 1.35 3 3s-1.35 3-3 3h-4v2h4c2.76 0 5-2.24 5-5s-2.24-5-5-5zm-6 8H7c-1.65 0-3-1.35-3-3s1.35-3 3-3h4V7H7c-2.76 0-5 2.24-5 5s2.24 5 5 5h4v-2zm-3-4h8v2H8z\"}}],\"id\":7234},{\"type\":\"route\",\"label\":\"Biolinks\",\"action\":\"\\/admin\\/biolinks\",\"id\":2394,\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M20 5h-3.2L15 3H9L7.2 5H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V7c0-1.1-.9-2-2-2zm0 14h-8v-1c-2.8 0-5-2.2-5-5s2.2-5 5-5V7h8v12zm-3-6c0-2.8-2.2-5-5-5v1.8c1.8 0 3.2 1.4 3.2 3.2s-1.4 3.2-3.2 3.2V18c2.8 0 5-2.2 5-5zm-8.2 0c0 1.8 1.4 3.2 3.2 3.2V9.8c-1.8 0-3.2 1.4-3.2 3.2z\"}}]},{\"type\":\"route\",\"label\":\"Link Groups\",\"action\":\"\\/admin\\/link-groups\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M19 5v2h-4V5h4M9 5v6H5V5h4m10 8v6h-4v-6h4M9 17v2H5v-2h4M21 3h-8v6h8V3zM11 3H3v10h8V3zm10 8h-8v10h8V11zm-10 4H3v6h8v-6z\"}}],\"id\":5864},{\"type\":\"route\",\"label\":\"Branded Domains\",\"action\":\"\\/admin\\/custom-domains\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M11.99 2C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zm6.93 6h-2.95c-.32-1.25-.78-2.45-1.38-3.56 1.84.63 3.37 1.91 4.33 3.56zM12 4.04c.83 1.2 1.48 2.53 1.91 3.96h-3.82c.43-1.43 1.08-2.76 1.91-3.96zM4.26 14C4.1 13.36 4 12.69 4 12s.1-1.36.26-2h3.38c-.08.66-.14 1.32-.14 2s.06 1.34.14 2H4.26zm.82 2h2.95c.32 1.25.78 2.45 1.38 3.56-1.84-.63-3.37-1.9-4.33-3.56zm2.95-8H5.08c.96-1.66 2.49-2.93 4.33-3.56C8.81 5.55 8.35 6.75 8.03 8zM12 19.96c-.83-1.2-1.48-2.53-1.91-3.96h3.82c-.43 1.43-1.08 2.76-1.91 3.96zM14.34 14H9.66c-.09-.66-.16-1.32-.16-2s.07-1.35.16-2h4.68c.09.65.16 1.32.16 2s-.07 1.34-.16 2zm.25 5.56c.6-1.11 1.06-2.31 1.38-3.56h2.95c-.96 1.65-2.49 2.93-4.33 3.56zM16.36 14c.08-.66.14-1.32.14-2s-.06-1.34-.14-2h3.38c.16.64.26 1.31.26 2s-.1 1.36-.26 2h-3.38z\"}}],\"id\":4441},{\"type\":\"route\",\"label\":\"CTA Overlays\",\"action\":\"\\/admin\\/link-overlays\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M21.99 4c0-1.1-.89-2-1.99-2H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h14l4 4-.01-18zM20 4v13.17L18.83 16H4V4h16zM6 12h12v2H6zm0-3h12v2H6zm0-3h12v2H6z\"}}],\"id\":18411},{\"type\":\"route\",\"label\":\"Tracking Pixels\",\"action\":\"\\/admin\\/pixels\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M13.02 19.93v2.02c2.01-.2 3.84-1 5.32-2.21l-1.42-1.43c-1.11.86-2.44 1.44-3.9 1.62zM4.03 12c0-4.05 3.03-7.41 6.95-7.93V2.05C5.95 2.58 2.03 6.84 2.03 12c0 5.16 3.92 9.42 8.95 9.95v-2.02c-3.92-.52-6.95-3.88-6.95-7.93zm15.92-1h2.02c-.2-2.01-1-3.84-2.21-5.32l-1.43 1.43c.86 1.1 1.44 2.43 1.62 3.89zm-1.61-6.74c-1.48-1.21-3.32-2.01-5.32-2.21v2.02c1.46.18 2.79.76 3.9 1.62l1.42-1.43zm-.01 12.64 1.43 1.42c1.21-1.48 2.01-3.31 2.21-5.32h-2.02c-.18 1.46-.76 2.79-1.62 3.9z\"}},{\"tag\":\"path\",\"attr\":{\"d\":\"M16 11.1C16 8.61 14.1 7 12 7s-4 1.61-4 4.1c0 1.66 1.33 3.63 4 5.9 2.67-2.27 4-4.24 4-5.9zm-4 .9c-.59 0-1.07-.48-1.07-1.07 0-.59.48-1.07 1.07-1.07s1.07.48 1.07 1.07c0 .59-.48 1.07-1.07 1.07z\"}}],\"id\":303113},{\"label\":\"Pages\",\"action\":\"\\/admin\\/custom-pages\",\"type\":\"route\",\"id\":\"63bwv9\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M19 5v14H5V5h14m0-2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2z\"}},{\"tag\":\"path\",\"attr\":{\"d\":\"M14 17H7v-2h7v2zm3-4H7v-2h10v2zm0-4H7V7h10v2z\"}}],\"permissions\":[\"custom_pages.update\"]},{\"label\":\"Tags\",\"action\":\"\\/admin\\/tags\",\"type\":\"route\",\"id\":\"2x0pzq\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M17.63 5.84C17.27 5.33 16.67 5 16 5L5 5.01C3.9 5.01 3 5.9 3 7v10c0 1.1.9 1.99 2 1.99L16 19c.67 0 1.27-.33 1.63-.84L22 12l-4.37-6.16zM16 17H5V7h11l3.55 5L16 17z\"}}],\"permissions\":[\"tags.update\"]},{\"label\":\"Files\",\"action\":\"\\/admin\\/files\",\"type\":\"route\",\"id\":\"vguvti\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M16 1H4c-1.1 0-2 .9-2 2v14h2V3h12V1zm-1 4H8c-1.1 0-1.99.9-1.99 2L6 21c0 1.1.89 2 1.99 2H19c1.1 0 2-.9 2-2V11l-6-6zM8 21V7h6v5h5v9H8z\"}}],\"permissions\":[\"files.update\"]},{\"label\":\"Localizations\",\"action\":\"\\/admin\\/localizations\",\"type\":\"route\",\"id\":\"w91yql\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"m12.87 15.07-2.54-2.51.03-.03c1.74-1.94 2.98-4.17 3.71-6.53H17V4h-7V2H8v2H1v1.99h11.17C11.5 7.92 10.44 9.75 9 11.35 8.07 10.32 7.3 9.19 6.69 8h-2c.73 1.63 1.73 3.17 2.98 4.56l-5.09 5.02L4 19l5-5 3.11 3.11.76-2.04zM18.5 10h-2L12 22h2l1.12-3h4.75L21 22h2l-4.5-12zm-2.62 7 1.62-4.33L19.12 17h-3.24z\"}}],\"permissions\":[\"localizations.update\"]},{\"label\":\"Ads\",\"action\":\"\\/admin\\/ads\",\"type\":\"route\",\"id\":\"ohj4qk\",\"icon\":[{\"tag\":\"path\",\"attr\":{\"d\":\"M17 1H7c-1.1 0-2 .9-2 2v18c0 1.1.9 2 2 2h10c1.1 0 2-.9 2-2V3c0-1.1-.9-2-2-2zM7 4V3h10v1H7zm0 14V6h10v12H7zm0 3v-1h10v1H7z\"}},{\"tag\":\"path\",\"attr\":{\"d\":\"M16 7H8v2h8V7z\"}}],\"permissions\":[\"settings.update\"]}],\"positions\":[\"admin-sidebar\"]},{\"name\":\"Homepage navbar\",\"id\":\"5vgq1a\",\"positions\":[\"homepage-navbar\"],\"items\":[{\"type\":\"link\",\"label\":\"Features\",\"action\":\"https:\\/\\/shortenk.com\\/#features\",\"id\":19041},{\"type\":\"link\",\"label\":\"Pricing\",\"action\":\"https:\\/\\/shortenk.com\\/#pricing\",\"id\":190456}]}]', '2023-03-08 19:52:45', '2023-03-13 13:58:24', 0),
(46, 'custom_domains.allow_select', 'true', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(47, 'branding.favicon', 'favicon/icon-144x144.png', '2023-03-08 19:52:45', '2023-03-08 19:52:45', 0),
(48, 'seo.home.show.og:title', 'Shortenk - URL Shortener.', '2023-03-08 20:03:49', '2023-04-29 05:00:27', 0),
(49, 'seo.home.show.og:description', 'Shorten, create and share trusted, powerful links for your business. Try linkdz for free.', '2023-03-08 20:03:49', '2023-03-08 20:03:49', 0),
(50, 'seo.home.show.keywords', 'url shortener, link shortener', '2023-03-08 20:03:49', '2023-03-08 20:03:49', 0),
(51, 'seo.linkeable.show.og:title', '{{linkeable.name}}', '2023-03-08 20:03:49', '2023-03-08 20:03:49', 0),
(52, 'seo.linkeable.show.og:description', '{{linkeable.description}}', '2023-03-08 20:03:49', '2023-03-08 20:03:49', 0),
(53, 'seo.custom-page.show.og:title', '{{page.title}} - {{site_name}}', '2023-03-08 20:03:49', '2023-03-08 20:03:49', 0),
(54, 'seo.custom-page.show.og:description', '{{page.body}}', '2023-03-08 20:03:49', '2023-03-08 20:03:49', 0),
(55, 'mail.contact_page_address', 'support@itsshortlink.com', '2023-03-09 12:23:39', '2023-03-09 12:23:39', 0),
(56, 'require_email_confirmation', 'true', '2023-03-09 12:28:11', '2023-03-09 12:28:11', 0),
(57, 'links.homepage_pricing', 'true', '2023-03-09 21:49:28', '2023-03-09 21:49:28', 0);

-- --------------------------------------------------------

--
-- Table structure for table `social_profiles`
--

CREATE TABLE `social_profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_name` varchar(20) NOT NULL,
  `user_service_id` varchar(191) NOT NULL,
  `username` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `access_token` varchar(250) DEFAULT NULL,
  `refresh_token` varchar(250) DEFAULT NULL,
  `access_expires_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `price_id` varchar(191) NOT NULL,
  `gateway_name` varchar(191) NOT NULL DEFAULT 'none',
  `gateway_id` varchar(191) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `renews_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `user_id`, `price_id`, `gateway_name`, `gateway_id`, `quantity`, `description`, `trial_ends_at`, `ends_at`, `renews_at`, `created_at`, `updated_at`, `product_id`) VALUES
(1, 2, '1', 'stripe', 'sub_1MjW7qABwYyaue17VfMdDZ0d', 1, NULL, NULL, NULL, '2023-04-09 03:11:33', '2023-03-09 04:11:33', '2023-03-09 04:11:33', 1);

-- --------------------------------------------------------

--
-- Table structure for table `taggables`
--

CREATE TABLE `taggables` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `taggable_id` int(10) UNSIGNED NOT NULL,
  `taggable_type` varchar(80) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `display_name` varchar(191) DEFAULT NULL,
  `type` varchar(30) NOT NULL DEFAULT 'custom',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tracking_pixels`
--

CREATE TABLE `tracking_pixels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(80) NOT NULL,
  `type` varchar(40) NOT NULL,
  `pixel_id` varchar(191) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `head_code` text DEFAULT NULL,
  `body_code` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `workspace_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `avatar_url` varchar(191) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `legacy_permissions` text DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(60) DEFAULT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `card_brand` varchar(30) DEFAULT NULL,
  `card_last_four` varchar(4) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `language` varchar(6) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `timezone` varchar(30) DEFAULT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `stripe_id` varchar(191) DEFAULT NULL,
  `available_space` bigint(20) UNSIGNED DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `card_expires` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `first_name`, `last_name`, `avatar_url`, `gender`, `legacy_permissions`, `email`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `card_brand`, `card_last_four`, `remember_token`, `created_at`, `updated_at`, `language`, `country`, `timezone`, `avatar`, `stripe_id`, `available_space`, `email_verified_at`, `card_expires`) VALUES
(1, 'admin', NULL, NULL, NULL, NULL, NULL, 'admin@shortenk.com', '$2y$10$tXe9/h2HhMpsoJ2vplnwLePvIJthgIFy6.6cX/SIlakV9SBBnSmky', NULL, NULL, NULL, NULL, 'N3QflF0V7qeF5k8G32RN7e6TRcjqBMMN5njJzZI4rzWCA6PPcxZ7UtIlPGXV', '2023-03-08 19:52:45', '2023-03-10 03:49:04', 'en', NULL, NULL, 'https://www.gravatar.com/avatar/64e1b8d34f425d19e1ee2ea7236d3028?s=&d=retro', 'cus_NUWZvf0Tg2teet', NULL, '2023-03-09 04:48:16', NULL),
(2, NULL, NULL, NULL, NULL, NULL, NULL, 'themeguide19@gmail.com', '$2y$10$HER6ESd6jwN20PAihKVHee4uvnGYpkLmp8.jaFXlxdDL4gqkfp3oq', NULL, NULL, NULL, NULL, NULL, '2023-03-09 04:10:02', '2023-03-09 04:10:25', 'en', NULL, NULL, NULL, 'cus_NUV8KK7mQ7zeKn', NULL, '2023-03-09 04:10:02', NULL),
(3, NULL, NULL, NULL, NULL, NULL, NULL, 'clevercastelar@gmail.com', '$2y$10$RS1raWqAUNEOCAfWIAEzMOH6HQopVryuZwuQfZehOLomMZbJXRLYK', NULL, NULL, NULL, NULL, 'j1d3PwpzquBoaq0KDzsofQKp0NIdAA6hHvwVywG8CgSMqju4VOyhaN5Er639', '2023-03-09 12:24:29', '2023-03-09 12:29:23', 'en', NULL, NULL, NULL, NULL, NULL, '2023-03-09 12:24:29', NULL),
(4, NULL, NULL, NULL, NULL, NULL, NULL, 'cubeyygaming+urlshrt@gmail.com', '$2y$10$g98SFMKUSKfsftVrvsiLt.ZUOApVmeLEx4htYD3x2dY2rFFlzz/ea', NULL, NULL, NULL, NULL, NULL, '2023-03-16 19:17:36', '2023-03-16 19:17:36', 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, NULL, NULL, NULL, NULL, NULL, NULL, 'cubeyygaming@gmail.com', '$2y$10$o4g5waeuUXi2lpMLeAK9NOsjdg96kpo0xldbLQpSD8qGyhFPzJhj2', NULL, NULL, NULL, NULL, NULL, '2023-03-16 19:17:52', '2023-03-16 19:17:52', 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, NULL, NULL, NULL, NULL, NULL, NULL, 'payffers@gmail.com', '$2y$10$7nRhmsrl7mQFOnw.t6SzE.ND3UhQ5f4g0y5PrRZ9s3Wa9ds9RMZUO', NULL, NULL, NULL, NULL, 'fSbPrgdLkXcNfYB33nvFNSPW5Z0JeXC3assItYNskNpSzK1tM6sEpIpq7zDk', '2023-03-16 22:18:12', '2023-03-16 22:18:12', 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, NULL, NULL, NULL, NULL, NULL, NULL, 'jarvis.iphone.alpha@gmail.com', '$2y$10$YWwYFfTnjLBDzh6zPuDxN.FHMLDyvCKeJSicUwFoyzDW8Yv2QEwwy', NULL, NULL, NULL, NULL, NULL, '2023-03-17 21:18:04', '2023-03-17 21:18:04', 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, NULL, NULL, NULL, NULL, NULL, NULL, 'tylerfeil@live.com', '$2y$10$3PkSOB9ucBe3l2eu/BT.7e1BpCAAz.JHr84lo0u8xzkn2MILIzhuu', NULL, NULL, NULL, NULL, 'aOZEUw3PxiwXXgs1olgvHQUAKhUrwqIQ4TOyE44ts1OubeqZz6pYVzQTXCmk', '2023-03-24 21:40:47', '2023-03-24 21:40:47', 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, NULL, NULL, NULL, NULL, NULL, NULL, 'synialnet@gmail.com', '$2y$10$E.Ef1LjmN6ZsPRF3jUsm.e7tlZKmVPV2NeE22hHsavXfqm5X.znZW', NULL, NULL, NULL, NULL, NULL, '2023-03-31 01:27:40', '2023-03-31 01:27:40', 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, NULL, NULL, NULL, NULL, NULL, NULL, 'sikkacurke@gufum.com', '$2y$10$IU4g53WdXgabPfslmnbKFe.aFKuyhEK2WVuxsxM5LOBRKLrsOncFe', NULL, NULL, NULL, NULL, 'F91M6sHQTD5bvm8GmnUBKETU7LBaBdV16941WAGFm1FN5wtbUjYiyFXmfYCq', '2023-04-09 04:14:13', '2023-04-09 04:14:13', 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, NULL, NULL, NULL, NULL, NULL, NULL, 'shs007solutions@gmail.com', '$2y$10$2IRHPfvaOT574thKvg3Q.uB9r99gviI8.C4SIu9VLUQa9sOblmU3O', NULL, NULL, NULL, NULL, 'UMwCgpLed27lGqI6RVO1vApoJ5NTYWf8qPxnSRqiVnLmzUwWB9JRXlnHPx8u', '2023-04-22 22:41:30', '2023-04-22 22:41:30', 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, NULL, NULL, NULL, NULL, NULL, NULL, 'suchaitgaurav@gmail.com', '$2y$10$w2wtG3twZbEXmeLmsEAtYu75EDi3sbX0FcogU2IXPhu.HT60gEXka', NULL, NULL, NULL, NULL, NULL, '2023-04-22 22:41:55', '2023-04-22 22:41:55', 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, NULL, NULL, NULL, NULL, NULL, NULL, 'ahmeddjemai24@gmail.com', '$2y$10$N9fZTPPW7mrVL/YcTY3qIuJIsS3OFhBSyhBVSjWde1sja3mX7Ypj2', NULL, NULL, NULL, NULL, NULL, '2023-04-23 16:31:59', '2023-04-23 16:32:40', 'en', NULL, NULL, NULL, NULL, NULL, '2023-04-23 16:32:40', NULL),
(15, NULL, NULL, NULL, NULL, NULL, NULL, 'nathan@nathanagage.com', '$2y$10$D.L.4PD6A0e6Q5WqdJzLkuaT8JtJgy.MUFExWWPcVJzlGX0RY8UnC', NULL, NULL, NULL, NULL, NULL, '2023-05-07 17:52:26', '2023-05-07 17:52:55', 'en', NULL, NULL, NULL, NULL, NULL, '2023-05-07 17:52:55', NULL),
(16, NULL, NULL, NULL, NULL, NULL, NULL, 'gadhiarohit@gmail.com', '$2y$10$pLd0w9PieUam.GJbeETpVuuYvBpYM7v0EDRshi6l0pXKZlyHD79ai', NULL, NULL, NULL, NULL, NULL, '2023-05-08 20:29:22', '2023-05-08 20:29:50', 'en', NULL, NULL, NULL, NULL, NULL, '2023-05-08 20:29:50', NULL),
(17, NULL, NULL, NULL, NULL, NULL, NULL, 'meevagroup@gmail.com', '$2y$10$JBYD1g6JSECrxy5Sl/GgwOcETDsVCb1xHX3SCz3hNisU.PGN/1kNO', NULL, NULL, NULL, NULL, 'Q3iJqdJEBTyKEE1nE8aFaTKk8LfdabrvDNFG53HCez1toblmVxNqc22sT470', '2023-05-10 07:09:22', '2023-05-10 07:11:12', 'en', NULL, NULL, NULL, NULL, NULL, '2023-05-10 07:11:12', NULL),
(18, NULL, NULL, NULL, NULL, NULL, NULL, 'pattersonl23@student.newton.k12.in.us', '$2y$10$3cuyQRvuByEyEZ7kscTcte.YdJmqxla4PwHDpGs7FoCW5h6DgLExu', NULL, NULL, NULL, NULL, 'zKnrXT7p4xyhcDQZXmdgvoys0JEtIWWrWCjRvY1n6sMP0ChzuiBd1HnEyazS', '2023-05-10 22:08:19', '2023-05-10 22:09:00', 'en', NULL, NULL, NULL, NULL, NULL, '2023-05-10 22:09:00', NULL),
(19, NULL, NULL, NULL, NULL, NULL, NULL, 'adalid.bori@gmail.com', '$2y$10$PDBuuOh.z6ruChqJDq5Kiu7MeC8Rd95G2KCQ/yEGRY7apnm5Chof6', NULL, NULL, NULL, NULL, 'VeMaRgiPUamSqWXqUChqJbxesOGjrMWF8DFYt9lTjHonNl3F2oI01J23OHNI', '2023-05-14 03:12:23', '2023-05-14 16:52:51', 'en', NULL, NULL, NULL, NULL, NULL, '2023-05-14 03:12:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_oauth`
--

CREATE TABLE `users_oauth` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `service` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `created_at`) VALUES
(1, 1, 1, '2023-03-08 19:52:45'),
(2, 2, 1, NULL),
(3, 3, 1, NULL),
(4, 4, 1, NULL),
(5, 5, 1, NULL),
(6, 6, 1, NULL),
(7, 7, 1, NULL),
(8, 8, 1, NULL),
(9, 9, 1, NULL),
(10, 10, 1, NULL),
(11, 11, 1, NULL),
(12, 12, 1, NULL),
(14, 14, 1, NULL),
(15, 15, 1, NULL),
(16, 16, 1, NULL),
(17, 17, 1, NULL),
(18, 18, 1, NULL),
(19, 19, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `workspaces`
--

CREATE TABLE `workspaces` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `owner_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workspace_invites`
--

CREATE TABLE `workspace_invites` (
  `id` char(36) NOT NULL,
  `avatar` varchar(80) DEFAULT NULL,
  `workspace_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `email` varchar(80) NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workspace_user`
--

CREATE TABLE `workspace_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `workspace_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `is_owner` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billing_plans`
--
ALTER TABLE `billing_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `billing_plans_hidden_index` (`hidden`);

--
-- Indexes for table `biolink_appearances`
--
ALTER TABLE `biolink_appearances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `biolink_appearances_biolink_id_index` (`biolink_id`);

--
-- Indexes for table `biolink_widgets`
--
ALTER TABLE `biolink_widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `biolink_widgets_biolink_id_index` (`biolink_id`),
  ADD KEY `biolink_widgets_pinned_index` (`pinned`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_parent_id_index` (`parent_id`),
  ADD KEY `comments_path_index` (`path`),
  ADD KEY `comments_user_id_index` (`user_id`),
  ADD KEY `comments_commentable_id_index` (`commentable_id`),
  ADD KEY `comments_commentable_type_index` (`commentable_type`),
  ADD KEY `comments_deleted_index` (`deleted`);

--
-- Indexes for table `css_themes`
--
ALTER TABLE `css_themes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `css_themes_name_unique` (`name`),
  ADD KEY `css_themes_default_light_index` (`default_light`),
  ADD KEY `css_themes_default_dark_index` (`default_dark`),
  ADD KEY `css_themes_user_id_index` (`user_id`);

--
-- Indexes for table `csv_exports`
--
ALTER TABLE `csv_exports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `csv_exports_cache_name_unique` (`cache_name`),
  ADD KEY `csv_exports_user_id_index` (`user_id`);

--
-- Indexes for table `custom_domains`
--
ALTER TABLE `custom_domains`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `custom_domains_host_unique` (`host`),
  ADD KEY `custom_domains_user_id_index` (`user_id`),
  ADD KEY `custom_domains_created_at_index` (`created_at`),
  ADD KEY `custom_domains_updated_at_index` (`updated_at`),
  ADD KEY `custom_domains_global_index` (`global`),
  ADD KEY `custom_domains_resource_id_index` (`resource_id`),
  ADD KEY `custom_domains_resource_type_index` (`resource_type`),
  ADD KEY `custom_domains_workspace_id_index` (`workspace_id`);

--
-- Indexes for table `custom_pages`
--
ALTER TABLE `custom_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`),
  ADD KEY `pages_type_index` (`type`),
  ADD KEY `pages_user_id_index` (`user_id`),
  ADD KEY `custom_pages_workspace_id_index` (`workspace_id`);

--
-- Indexes for table `file_entries`
--
ALTER TABLE `file_entries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uploads_file_name_unique` (`file_name`),
  ADD KEY `uploads_name_index` (`name`),
  ADD KEY `uploads_user_id_index` (`user_id`),
  ADD KEY `uploads_public_index` (`public`),
  ADD KEY `file_entries_updated_at_index` (`updated_at`),
  ADD KEY `file_entries_parent_id_index` (`parent_id`),
  ADD KEY `file_entries_type_index` (`type`),
  ADD KEY `file_entries_deleted_at_index` (`deleted_at`),
  ADD KEY `file_entries_user_id_index` (`user_id`),
  ADD KEY `file_entries_path_index` (`path`),
  ADD KEY `file_entries_description_index` (`description`),
  ADD KEY `file_entries_workspace_id_index` (`workspace_id`),
  ADD KEY `file_entries_owner_id_index` (`owner_id`);

--
-- Indexes for table `file_entry_models`
--
ALTER TABLE `file_entry_models`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uploadable_unique` (`file_entry_id`,`model_id`,`model_type`),
  ADD KEY `file_entry_models_owner_index` (`owner`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_subscription_id_index` (`subscription_id`),
  ADD KEY `invoices_uuid_index` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Indexes for table `linkeable_rules`
--
ALTER TABLE `linkeable_rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_rules_type_index` (`type`),
  ADD KEY `link_rules_link_id_index` (`linkeable_id`),
  ADD KEY `linkeable_rules_linkeable_type_index` (`linkeable_type`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `links_hash_unique` (`hash`),
  ADD KEY `links_alias_index` (`alias`),
  ADD KEY `links_user_id_index` (`user_id`),
  ADD KEY `links_domain_id_index` (`domain_id`),
  ADD KEY `links_password_index` (`password`),
  ADD KEY `links_disabled_index` (`active`),
  ADD KEY `links_expires_at_index` (`expires_at`),
  ADD KEY `links_type_index` (`type`),
  ADD KEY `links_type_id_index` (`type_id`),
  ADD KEY `links_created_at_index` (`created_at`),
  ADD KEY `links_updated_at_index` (`updated_at`),
  ADD KEY `links_workspace_id_index` (`workspace_id`),
  ADD KEY `links_clicked_at_index` (`clicked_at`),
  ADD KEY `links_clicks_count_index` (`clicks_count`),
  ADD KEY `links_activates_at_index` (`activates_at`);

--
-- Indexes for table `link_clicks`
--
ALTER TABLE `link_clicks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_clicks_link_id_index` (`linkeable_id`),
  ADD KEY `link_clicks_city_index` (`city`),
  ADD KEY `link_clicks_state_index` (`state`),
  ADD KEY `platform_index` (`owner_id`,`created_at`,`platform`,`crawler`),
  ADD KEY `device_index` (`owner_id`,`created_at`,`device`,`crawler`),
  ADD KEY `browser_index` (`owner_id`,`created_at`,`browser`,`crawler`),
  ADD KEY `location_index` (`owner_id`,`created_at`,`location`,`crawler`),
  ADD KEY `referrer_index` (`owner_id`,`created_at`,`referrer`,`crawler`),
  ADD KEY `link_clicks_linkeable_type_index` (`linkeable_type`);

--
-- Indexes for table `link_groups`
--
ALTER TABLE `link_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link_groups_slug_unique` (`hash`),
  ADD KEY `link_groups_user_id_index` (`user_id`),
  ADD KEY `link_groups_created_at_index` (`created_at`),
  ADD KEY `link_groups_updated_at_index` (`updated_at`),
  ADD KEY `link_groups_public_index` (`active`),
  ADD KEY `link_groups_workspace_id_index` (`workspace_id`),
  ADD KEY `link_groups_rotator_index` (`rotator`),
  ADD KEY `link_groups_domain_id_index` (`domain_id`),
  ADD KEY `link_groups_password_index` (`password`),
  ADD KEY `link_groups_expires_at_index` (`expires_at`),
  ADD KEY `link_groups_clicked_at_index` (`clicked_at`),
  ADD KEY `link_groups_deleted_at_index` (`deleted_at`),
  ADD KEY `link_groups_clicks_count_index` (`clicks_count`),
  ADD KEY `link_groups_type_index` (`type`),
  ADD KEY `link_groups_activates_at_index` (`activates_at`),
  ADD KEY `link_groups_hash_index` (`hash`);

--
-- Indexes for table `link_group_link`
--
ALTER TABLE `link_group_link`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link_group_link_link_id_link_group_id_unique` (`link_id`,`link_group_id`),
  ADD KEY `link_group_link_link_id_index` (`link_id`),
  ADD KEY `link_group_link_link_group_id_index` (`link_group_id`),
  ADD KEY `link_group_link_position_index` (`position`);

--
-- Indexes for table `link_overlays`
--
ALTER TABLE `link_overlays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_overlays_user_id_index` (`user_id`),
  ADD KEY `link_overlays_created_at_index` (`created_at`),
  ADD KEY `link_overlays_updated_at_index` (`updated_at`),
  ADD KEY `link_overlays_workspace_id_index` (`workspace_id`),
  ADD KEY `link_overlays_theme_index` (`theme`);

--
-- Indexes for table `link_tracking_pixel`
--
ALTER TABLE `link_tracking_pixel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `linkeable_pixel_unique` (`linkeable_id`,`linkeable_type`,`tracking_pixel_id`),
  ADD KEY `link_tracking_pixel_link_id_index` (`linkeable_id`),
  ADD KEY `link_tracking_pixel_tracking_pixel_id_index` (`tracking_pixel_id`),
  ADD KEY `link_tracking_pixel_linkeable_type_index` (`linkeable_type`);

--
-- Indexes for table `localizations`
--
ALTER TABLE `localizations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `localizations_name_index` (`name`),
  ADD KEY `localizations_language_index` (`language`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `notification_subscriptions`
--
ALTER TABLE `notification_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_subscriptions_notif_id_index` (`notif_id`),
  ADD KEY `notification_subscriptions_user_id_index` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissionables`
--
ALTER TABLE `permissionables`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissionable_unique` (`permission_id`,`permissionable_id`,`permissionable_type`),
  ADD KEY `permissionables_permission_id_index` (`permission_id`),
  ADD KEY `permissionables_permissionable_id_index` (`permissionable_id`),
  ADD KEY `permissionables_permissionable_type_index` (`permissionable_type`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`),
  ADD KEY `permissions_advanced_index` (`advanced`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prices_product_id_index` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_position_index` (`position`),
  ADD KEY `products_free_index` (`free`),
  ADD KEY `products_hidden_index` (`hidden`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `groups_name_unique` (`name`),
  ADD KEY `groups_default_index` (`default`),
  ADD KEY `groups_guests_index` (`guests`),
  ADD KEY `roles_internal_index` (`internal`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_name_unique` (`name`),
  ADD KEY `settings_private_index` (`private`);

--
-- Indexes for table `social_profiles`
--
ALTER TABLE `social_profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `social_profiles_user_id_service_name_unique` (`user_id`,`service_name`),
  ADD UNIQUE KEY `social_profiles_service_name_user_service_id_unique` (`service_name`,`user_service_id`),
  ADD KEY `social_profiles_user_id_index` (`user_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_gateway_id_unique` (`gateway_id`),
  ADD KEY `subscriptions_user_id_index` (`user_id`),
  ADD KEY `subscriptions_plan_id_index` (`price_id`),
  ADD KEY `subscriptions_gateway_index` (`gateway_name`),
  ADD KEY `subscriptions_product_id_index` (`product_id`);

--
-- Indexes for table `taggables`
--
ALTER TABLE `taggables`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taggable_unique` (`tag_id`,`taggable_id`,`user_id`,`taggable_type`),
  ADD KEY `taggables_tag_id_index` (`tag_id`),
  ADD KEY `taggables_taggable_id_index` (`taggable_id`),
  ADD KEY `taggables_taggable_type_index` (`taggable_type`),
  ADD KEY `taggables_user_id_index` (`user_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_name_type_unique` (`name`,`type`),
  ADD KEY `tags_type_index` (`type`),
  ADD KEY `tags_created_at_index` (`created_at`),
  ADD KEY `tags_updated_at_index` (`updated_at`);

--
-- Indexes for table `tracking_pixels`
--
ALTER TABLE `tracking_pixels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tracking_pixels_name_user_id_unique` (`name`,`user_id`),
  ADD KEY `tracking_pixels_type_index` (`type`),
  ADD KEY `tracking_pixels_user_id_index` (`user_id`),
  ADD KEY `tracking_pixels_created_at_index` (`created_at`),
  ADD KEY `tracking_pixels_updated_at_index` (`updated_at`),
  ADD KEY `tracking_pixels_workspace_id_index` (`workspace_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_created_at_index` (`created_at`),
  ADD KEY `users_updated_at_index` (`updated_at`),
  ADD KEY `users_username_index` (`username`);

--
-- Indexes for table `users_oauth`
--
ALTER TABLE `users_oauth`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_oauth_user_id_service_unique` (`user_id`,`service`),
  ADD UNIQUE KEY `users_oauth_token_unique` (`token`),
  ADD KEY `users_oauth_user_id_index` (`user_id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_group_user_id_group_id_unique` (`user_id`,`role_id`);

--
-- Indexes for table `workspaces`
--
ALTER TABLE `workspaces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workspaces_owner_id_index` (`owner_id`),
  ADD KEY `workspaces_created_at_index` (`created_at`),
  ADD KEY `workspaces_updated_at_index` (`updated_at`);

--
-- Indexes for table `workspace_invites`
--
ALTER TABLE `workspace_invites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workspace_invites_workspace_id_index` (`workspace_id`),
  ADD KEY `workspace_invites_user_id_index` (`user_id`),
  ADD KEY `workspace_invites_email_index` (`email`),
  ADD KEY `workspace_invites_role_id_index` (`role_id`);

--
-- Indexes for table `workspace_user`
--
ALTER TABLE `workspace_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `workspace_user_workspace_id_user_id_unique` (`workspace_id`,`user_id`),
  ADD KEY `workspace_user_user_id_index` (`user_id`),
  ADD KEY `workspace_user_workspace_id_index` (`workspace_id`),
  ADD KEY `workspace_user_role_id_index` (`role_id`),
  ADD KEY `workspace_user_is_owner_index` (`is_owner`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billing_plans`
--
ALTER TABLE `billing_plans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `biolink_appearances`
--
ALTER TABLE `biolink_appearances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `biolink_widgets`
--
ALTER TABLE `biolink_widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `css_themes`
--
ALTER TABLE `css_themes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `csv_exports`
--
ALTER TABLE `csv_exports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_domains`
--
ALTER TABLE `custom_domains`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_pages`
--
ALTER TABLE `custom_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `file_entries`
--
ALTER TABLE `file_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `file_entry_models`
--
ALTER TABLE `file_entry_models`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `linkeable_rules`
--
ALTER TABLE `linkeable_rules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `link_clicks`
--
ALTER TABLE `link_clicks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `link_groups`
--
ALTER TABLE `link_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `link_group_link`
--
ALTER TABLE `link_group_link`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `link_overlays`
--
ALTER TABLE `link_overlays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `link_tracking_pixel`
--
ALTER TABLE `link_tracking_pixel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `localizations`
--
ALTER TABLE `localizations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissionables`
--
ALTER TABLE `permissionables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prices`
--
ALTER TABLE `prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `social_profiles`
--
ALTER TABLE `social_profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `taggables`
--
ALTER TABLE `taggables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tracking_pixels`
--
ALTER TABLE `tracking_pixels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users_oauth`
--
ALTER TABLE `users_oauth`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `workspaces`
--
ALTER TABLE `workspaces`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workspace_user`
--
ALTER TABLE `workspace_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
