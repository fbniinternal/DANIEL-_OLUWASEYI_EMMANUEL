-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 15, 2021 at 06:12 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `banking_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_products`
--

DROP TABLE IF EXISTS `account_products`;
CREATE TABLE IF NOT EXISTS `account_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_products`
--

INSERT INTO `account_products` (`id`, `name`) VALUES
(1, 'EasySave'),
(2, 'FlexiCash'),
(3, 'FlexiEdu'),
(4, 'FlexiSave');

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

DROP TABLE IF EXISTS `account_transactions`;
CREATE TABLE IF NOT EXISTS `account_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dob` date NOT NULL,
  `phone` varchar(11) NOT NULL,
  `amount_paid` double NOT NULL,
  `date_of_payment` date NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_transactions_customer_id_5ee4653e_fk_auth_user_id` (`customer_id`),
  KEY `account_transactions_product_id_294ed622_fk_account_products_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_transactions`
--

INSERT INTO `account_transactions` (`id`, `dob`, `phone`, `amount_paid`, `date_of_payment`, `customer_id`, `product_id`) VALUES
(1, '2020-04-15', '08020202020', 30000, '2021-04-04', 2, 4),
(2, '2020-04-15', '08020202020', 30000, '2021-02-02', 2, 4),
(3, '2020-04-15', '02002020229', 40000, '2021-01-06', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add products', 1, 'add_products'),
(2, 'Can change products', 1, 'change_products'),
(3, 'Can delete products', 1, 'delete_products'),
(4, 'Can view products', 1, 'view_products'),
(5, 'Can add transactions', 2, 'add_transactions'),
(6, 'Can change transactions', 2, 'change_transactions'),
(7, 'Can delete transactions', 2, 'delete_transactions'),
(8, 'Can view transactions', 2, 'view_transactions'),
(9, 'Can add log entry', 3, 'add_logentry'),
(10, 'Can change log entry', 3, 'change_logentry'),
(11, 'Can delete log entry', 3, 'delete_logentry'),
(12, 'Can view log entry', 3, 'view_logentry'),
(13, 'Can add permission', 4, 'add_permission'),
(14, 'Can change permission', 4, 'change_permission'),
(15, 'Can delete permission', 4, 'delete_permission'),
(16, 'Can view permission', 4, 'view_permission'),
(17, 'Can add group', 5, 'add_group'),
(18, 'Can change group', 5, 'change_group'),
(19, 'Can delete group', 5, 'delete_group'),
(20, 'Can view group', 5, 'view_group'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add content type', 7, 'add_contenttype'),
(26, 'Can change content type', 7, 'change_contenttype'),
(27, 'Can delete content type', 7, 'delete_contenttype'),
(28, 'Can view content type', 7, 'view_contenttype'),
(29, 'Can add session', 8, 'add_session'),
(30, 'Can change session', 8, 'change_session'),
(31, 'Can delete session', 8, 'delete_session'),
(32, 'Can view session', 8, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$NttItwtrAjcF$7XcKcVnMq2aT7zaIK9fK/IS9s2ojeJlrckcBNI51JIM=', '2021-04-15 12:16:14.818993', 1, 'Dexter', '', '', 'dexterdaniel@gmail.com', 1, 1, '2021-04-15 12:15:31.471289'),
(2, 'pbkdf2_sha256$216000$P6SE4OEW8USo$7fm+g2FBuKri1YdseHiPuV0dtsrMGuOjhqwhFDfmmpE=', '2021-04-15 17:07:09.514658', 0, 'Customer1', '', '', '', 0, 1, '2021-04-15 12:16:32.312512'),
(3, 'pbkdf2_sha256$216000$0S9EFNGQo3v0$b2g8ebdGgVtyGVABcA+GX/1BDuAYeXwJgKt6r1Y3i4E=', NULL, 0, 'Customer2', '', '', '', 0, 1, '2021-04-15 12:17:11.984383');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-04-15 12:16:33.115383', '2', 'Customer1', 1, '[{\"added\": {}}]', 6, 1),
(2, '2021-04-15 12:17:12.840393', '3', 'Customer2', 1, '[{\"added\": {}}]', 6, 1),
(3, '2021-04-15 12:17:58.460477', '1', 'EasySave', 1, '[{\"added\": {}}]', 1, 1),
(4, '2021-04-15 12:18:10.926119', '2', 'FlexiCash', 1, '[{\"added\": {}}]', 1, 1),
(5, '2021-04-15 12:18:19.161351', '3', 'FlexiEdu', 1, '[{\"added\": {}}]', 1, 1),
(6, '2021-04-15 12:18:33.090152', '4', 'FlexiSave', 1, '[{\"added\": {}}]', 1, 1),
(7, '2021-04-15 12:20:51.902043', '4', 'Transactions object (4)', 1, '[{\"added\": {}}]', 2, 1),
(8, '2021-04-15 12:21:08.989938', '4', 'Transactions object (4)', 3, '', 2, 1),
(9, '2021-04-15 12:21:28.374514', '2', 'Transactions object (2)', 2, '[{\"changed\": {\"fields\": [\"Date of payment\"]}}]', 2, 1),
(10, '2021-04-15 12:21:58.250133', '3', 'Transactions object (3)', 2, '[{\"changed\": {\"fields\": [\"Product\", \"Amount paid\", \"Date of payment\"]}}]', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'account', 'products'),
(2, 'account', 'transactions'),
(3, 'admin', 'logentry'),
(4, 'auth', 'permission'),
(5, 'auth', 'group'),
(6, 'auth', 'user'),
(7, 'contenttypes', 'contenttype'),
(8, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-04-15 12:14:45.505431'),
(2, 'auth', '0001_initial', '2021-04-15 12:14:45.906819'),
(3, 'account', '0001_initial', '2021-04-15 12:14:47.226895'),
(4, 'admin', '0001_initial', '2021-04-15 12:14:47.512284'),
(5, 'admin', '0002_logentry_remove_auto_add', '2021-04-15 12:14:47.828875'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2021-04-15 12:14:47.866850'),
(7, 'contenttypes', '0002_remove_content_type_name', '2021-04-15 12:14:48.051779'),
(8, 'auth', '0002_alter_permission_name_max_length', '2021-04-15 12:14:48.167813'),
(9, 'auth', '0003_alter_user_email_max_length', '2021-04-15 12:14:48.268156'),
(10, 'auth', '0004_alter_user_username_opts', '2021-04-15 12:14:48.299412'),
(11, 'auth', '0005_alter_user_last_login_null', '2021-04-15 12:14:48.415433'),
(12, 'auth', '0006_require_contenttypes_0002', '2021-04-15 12:14:48.415433'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2021-04-15 12:14:48.468906'),
(14, 'auth', '0008_alter_user_username_max_length', '2021-04-15 12:14:48.569243'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2021-04-15 12:14:48.685195'),
(16, 'auth', '0010_alter_group_name_max_length', '2021-04-15 12:14:48.785526'),
(17, 'auth', '0011_update_proxy_permissions', '2021-04-15 12:14:48.816794'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2021-04-15 12:14:48.932780'),
(19, 'sessions', '0001_initial', '2021-04-15 12:14:49.001871');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ek9mp0n3ni742bhu0d97wcwycsa6mhxv', 'e30:1lX4On:eqwmczwSvgKzuCAlYZeWWy2k3XNlNrPKmvpp4y404JI', '2021-04-29 15:59:21.211601'),
('mxnrypre23xoe55l4j8nbdgt207s4e17', 'e30:1lX4PD:MB82NGjbjtpMbI2TdBquQ7ZHoYE8YQ_MZ1Qd8A6UR5w', '2021-04-29 15:59:47.589377'),
('t67mkolyxvh391da48tyxmh2zzlanplz', 'e30:1lX57X:bdAwTYm2QpUxe8CGBICFVNNqZaR7ZjegBStWNm8lyGI', '2021-04-29 16:45:35.781761');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
