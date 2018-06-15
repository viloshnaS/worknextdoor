-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2018 at 07:27 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `worknextdoor`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `space_id` int(11) NOT NULL,
  `booking_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `booking_date_start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `booking_date_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `booking_status_type` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `unit_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `user_id`, `space_id`, `booking_date`, `booking_date_start`, `booking_date_end`, `booking_status_type`, `duration`, `rate`, `unit_price`) VALUES
(1, 2, 1, '2018-05-24 06:00:00', '2018-05-25 04:00:00', '2018-05-25 08:00:00', 1, 2, 2, 10),
(3, 1, 1, '2018-06-08 01:00:58', '2018-06-12 05:00:00', '2018-06-15 05:00:00', 3, 3, 2, 30),
(4, 1, 1, '2018-06-08 01:02:13', '2018-06-22 05:00:00', '2018-06-23 21:00:00', 3, 1, 2, 30),
(5, 1, 1, '2018-06-08 01:02:13', '2018-06-22 05:00:00', '2018-06-23 21:00:00', 3, 1, 2, 30),
(6, 1, 1, '2018-06-08 01:07:32', '2018-06-09 11:00:00', '2018-06-09 13:00:00', 3, 2, 1, 9),
(7, 1, 1, '2018-06-08 01:07:32', '2018-06-09 11:00:00', '2018-06-09 13:00:00', 3, 2, 1, 9),
(8, 1, 1, '2018-06-10 21:15:45', '2018-06-13 09:00:00', '2018-06-13 16:00:00', 3, 7, 1, 9),
(9, 1, 1, '2018-06-10 21:15:45', '2018-06-13 09:00:00', '2018-06-13 16:00:00', 3, 7, 1, 9),
(10, 1, 1, '2018-06-10 21:25:17', '2018-06-10 21:25:17', '2018-06-10 21:25:17', 3, 1, 2, 30),
(11, 1, 1, '2018-06-10 21:25:17', '2018-06-10 21:25:17', '2018-06-10 21:25:17', 3, 1, 2, 30),
(12, 1, 1, '2018-06-10 21:25:40', '2018-06-10 21:25:40', '2018-06-10 21:25:40', 3, 1, 2, 30),
(13, 1, 1, '2018-06-10 21:25:40', '2018-06-10 21:25:40', '2018-06-10 21:25:40', 3, 1, 2, 30),
(14, 1, 1, '2018-06-10 21:28:51', '2018-06-13 05:00:00', '2018-06-13 10:00:00', 3, 5, 1, 9),
(15, 1, 1, '2018-06-10 21:28:51', '2018-06-13 05:00:00', '2018-06-13 10:00:00', 3, 5, 1, 9),
(16, 1, 1, '2018-06-10 21:52:16', '2018-06-13 05:00:00', '2018-06-13 08:00:00', 3, 3, 1, 9),
(17, 1, 1, '2018-06-10 21:52:16', '2018-06-13 05:00:00', '2018-06-13 08:00:00', 3, 3, 1, 9),
(18, 4, 1, '2018-06-11 09:14:06', '2018-06-14 07:00:00', '2018-06-14 10:00:00', 3, 3, 1, 5),
(19, 4, 1, '2018-06-11 09:14:06', '2018-06-14 07:00:00', '2018-06-14 10:00:00', 3, 3, 1, 5),
(20, 1, 1, '2018-06-11 09:16:37', '2018-06-12 07:00:00', '2018-06-12 10:00:00', 3, 3, 1, 9),
(21, 1, 1, '2018-06-11 09:16:37', '2018-06-12 07:00:00', '2018-06-12 10:00:00', 3, 3, 1, 9),
(22, 1, 1, '2018-06-11 09:17:21', '2018-06-12 07:00:00', '2018-06-12 10:00:00', 3, 3, 1, 9),
(23, 1, 1, '2018-06-11 09:17:21', '2018-06-12 07:00:00', '2018-06-12 10:00:00', 3, 3, 1, 9),
(24, 3, 1, '2018-06-11 09:36:25', '2018-06-12 07:00:00', '2018-06-12 10:00:00', 3, 3, 1, 7),
(25, 3, 1, '2018-06-11 09:36:25', '2018-06-12 07:00:00', '2018-06-12 10:00:00', 3, 3, 1, 7),
(26, 4, 1, '2018-06-11 10:00:51', '2018-06-14 05:00:00', '2018-06-15 21:00:00', 3, 1, 2, 20),
(27, 4, 1, '2018-06-11 10:00:51', '2018-06-14 05:00:00', '2018-06-15 21:00:00', 3, 1, 2, 20);

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `hub_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favourites`
--

INSERT INTO `favourites` (`hub_id`, `user_id`) VALUES
(1, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `hubs`
--

CREATE TABLE `hubs` (
  `hub_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `address` varchar(50) NOT NULL,
  `category_id` int(11) NOT NULL,
  `parking` tinyint(1) NOT NULL DEFAULT '0',
  `kitchen` tinyint(1) NOT NULL DEFAULT '0',
  `printer_scanner` tinyint(1) NOT NULL,
  `heater` tinyint(1) NOT NULL,
  `air_con` tinyint(1) NOT NULL,
  `wifi` tinyint(1) NOT NULL,
  `picture` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hubs`
--

INSERT INTO `hubs` (`hub_id`, `name`, `description`, `user_id`, `latitude`, `longitude`, `address`, `category_id`, `parking`, `kitchen`, `printer_scanner`, `heater`, `air_con`, `wifi`, `picture`, `active`) VALUES
(1, 'Luminuous Studio', 'Big Studio in the Centre of Toulouse', 1, 43.6447, 1.54421, '2 Boulevard, Armand Duportal, Toulouse', 1, 1, 0, 1, 1, 1, 1, '[\"hub_1/space1.jpeg\",\"hub_1/space2.jpeg\",\"hub_1/space3.jpeg\"]', 1),
(2, 'Spacious Conference Room', '', 4, 43.5647, 1.59421, '', 1, 1, 1, 1, 1, 1, 1, '[\"hub_2/conference.jpeg\",\"hub_2/meeting_room.jpeg\",\"hub_2/meeting2.jpeg\"]', 1),
(3, 'Studio', '', 5, 43.6047, 1.52421, '4 Place ', 3, 0, 0, 1, 1, 0, 1, '[\"hub_3/space1.jpg\",\"hub_3/space2.jpg\",\"hub_3/space3.jpg\"]', 1),
(4, 'Modern co-working hypercentre', '', 1, 43.6447, 1.54421, '', 1, 1, 0, 1, 1, 1, 1, 'hub_4', 1),
(5, 'Spacious Conference Room', '', 4, 43.6019, 1.43862, '18 Place de la Daurade', 1, 1, 1, 0, 1, 1, 1, 'hub_5', 1),
(6, 'bright studio St Michel', '', 5, 43.5943, 1.45091, '37 Allées Jules Guesde, 31400 Toulouse', 3, 0, 0, 1, 1, 0, 1, 'hub_6', 1),
(7, 'Fully Equipped Meeting Room', '', 2, 43.6283, 1.3798, '7 Avenue Didier Daurat, 31702 Blagnac', 1, 1, 1, 1, 1, 1, 1, 'hub_7', 1),
(8, 'quiet bistro for co-working', '', 3, 43.6067, 1.39694, '7 Rue Georges Vedel, 31300 Toulouse', 3, 0, 0, 0, 1, 1, 1, 'hub_8', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hub_category`
--

CREATE TABLE `hub_category` (
  `category_id` int(11) NOT NULL,
  `description` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hub_category`
--

INSERT INTO `hub_category` (`category_id`, `description`) VALUES
(1, 'IT'),
(2, 'Business'),
(3, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `hub_reviews`
--

CREATE TABLE `hub_reviews` (
  `comment_id` int(11) NOT NULL,
  `hub_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_posted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hub_reviews`
--

INSERT INTO `hub_reviews` (`comment_id`, `hub_id`, `user_id`, `rating`, `comment`, `date_posted`) VALUES
(1, 1, 2, 4, 'Perfect Location. Host is friendly and helpful', '2018-05-25 09:48:20'),
(2, 1, 6, 5, 'Very happy with the service offered. Will surely come again.', '2018-02-11 23:00:00'),
(3, 1, 4, 2, 'The wifi connection was very poor but the host is very friendly and helpful', '2018-03-21 23:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `pricing_package`
--

CREATE TABLE `pricing_package` (
  `package_id` int(11) NOT NULL,
  `description` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pricing_package`
--

INSERT INTO `pricing_package` (`package_id`, `description`) VALUES
(1, 'Hour'),
(2, 'Day'),
(3, 'Month'),
(4, 'Year');

-- --------------------------------------------------------

--
-- Table structure for table `profession_category`
--

CREATE TABLE `profession_category` (
  `profession_id` int(11) NOT NULL,
  `description` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profession_category`
--

INSERT INTO `profession_category` (`profession_id`, `description`) VALUES
(1, 'IT CONSULTANT'),
(2, 'Physician'),
(3, 'Nurse'),
(4, 'Lawyer'),
(5, 'Engineer'),
(6, 'Urbanist'),
(7, 'Certified Translator'),
(9, 'Architect'),
(10, 'Human Resource'),
(11, 'Accountant'),
(12, 'Business'),
(13, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `spaces`
--

CREATE TABLE `spaces` (
  `space_id` int(11) NOT NULL,
  `hub_id` int(11) NOT NULL,
  `space_type` int(11) NOT NULL,
  `number_of_guests` int(11) NOT NULL,
  `number_of_spaces` int(11) NOT NULL,
  `size` int(11) DEFAULT NULL,
  `whiteboard` tinyint(1) NOT NULL,
  `screen` tinyint(1) NOT NULL,
  `projector` tinyint(1) NOT NULL,
  `thumbnail_picture` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spaces`
--

INSERT INTO `spaces` (`space_id`, `hub_id`, `space_type`, `number_of_guests`, `number_of_spaces`, `size`, `whiteboard`, `screen`, `projector`, `thumbnail_picture`) VALUES
(1, 1, 1, 1, 15, NULL, 1, 1, 1, 'hub_1/space1.jpeg'),
(2, 1, 2, 6, 1, NULL, 1, 1, 1, 'hub_1/space3.jpeg'),
(3, 2, 2, 10, 1, NULL, 1, 1, 1, 'hub_2/conference.jpeg'),
(4, 3, 2, 10, 2, NULL, 1, 1, 1, 'hub_3/space1.jpg'),
(5, 2, 2, 4, 4, NULL, 1, 1, 0, ''),
(6, 3, 1, 8, 8, NULL, 1, 0, 0, ''),
(7, 4, 1, 5, 5, NULL, 0, 0, 0, ''),
(8, 5, 1, 4, 4, NULL, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `space_pricing`
--

CREATE TABLE `space_pricing` (
  `space_id` int(11) NOT NULL,
  `price_package_id` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `space_pricing`
--

INSERT INTO `space_pricing` (`space_id`, `price_package_id`, `price`) VALUES
(1, 1, 9),
(1, 2, 30),
(1, 3, 400),
(2, 2, 50),
(2, 3, 600),
(3, 1, 7),
(3, 2, 30),
(4, 1, 5),
(4, 2, 20);

-- --------------------------------------------------------

--
-- Table structure for table `space_type`
--

CREATE TABLE `space_type` (
  `space_type_id` int(11) NOT NULL,
  `space_type_description` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `space_type`
--

INSERT INTO `space_type` (`space_type_id`, `space_type_description`) VALUES
(1, 'WorkDesk'),
(2, 'Conference Room');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status_type_id` int(11) NOT NULL,
  `description` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_type_id`, `description`) VALUES
(1, 'PENDING'),
(2, 'CANCELLED'),
(3, 'APPROVED');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `Gender` char(1) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `zipCode` varchar(10) NOT NULL,
  `city` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `profession_id` int(11) DEFAULT NULL,
  `host` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `Gender`, `email`, `phone`, `zipCode`, `city`, `country`, `profession_id`, `host`) VALUES
(1, 'Viloshna', 'Sonoo', 'F', 'viloshna.sonoo@gmail.com', '0752415680', '31000', 'Toulouse', 'France', 1, 0),
(2, 'Shujun', 'Hou', 'F', 'shujunhou99@gmail.com', '0914873411', '31300', 'Toulouse', 'France', 1, 0),
(3, 'Oluchi', 'Onuorah', 'F', 'oluuchii@gmail.com', '0789378436', '31300', 'Toulouse', 'France', 1, 0),
(4, 'Dieu', 'Vu Dinh', 'M', 'dieuvd.it2@gmail.com', '0634249853', '31300', 'Toulouse', 'France', 1, 0),
(5, 'Xutong', 'Jin', 'F', 'rosa.jin.cueb@hotmail.com', '0573984309', '31300', 'Toulouse', 'France', 1, 0),
(6, 'Kaichi', 'Cong', 'M', 'congkaichi@gmail.com', '', '31300', 'Toulouse', 'France', 1, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_space`
-- (See below for the actual view)
--
CREATE TABLE `v_space` (
`user_id` int(11)
,`firstname` varchar(100)
,`lastname` varchar(100)
,`Gender` char(1)
,`email` varchar(100)
,`space_id` int(11)
,`size` int(11)
,`space_type_id` int(11)
,`space_type_description` varchar(30)
,`hub_id` int(11)
,`name` varchar(30)
,`hub_description` text
,`category_id` int(11)
,`category_description` varchar(20)
,`latitude` float
,`longitude` float
,`address` varchar(50)
,`parking` tinyint(1)
,`kitchen` tinyint(1)
,`printer_scanner` tinyint(1)
,`air_con` tinyint(1)
,`heater` tinyint(1)
,`wifi` tinyint(1)
,`screen` tinyint(1)
,`projector` tinyint(1)
,`whiteboard` tinyint(1)
,`number_of_guests` int(11)
,`number_of_spaces` int(11)
,`pictures` text
,`thumbnail` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_space_review`
-- (See below for the actual view)
--
CREATE TABLE `v_space_review` (
`hub_id` int(11)
,`reviews_count` bigint(21)
,`average_rating` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Structure for view `v_space`
--
DROP TABLE IF EXISTS `v_space`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_space`  AS  select `u`.`user_id` AS `user_id`,`u`.`firstname` AS `firstname`,`u`.`lastname` AS `lastname`,`u`.`Gender` AS `Gender`,`u`.`email` AS `email`,`s`.`space_id` AS `space_id`,`s`.`size` AS `size`,`t`.`space_type_id` AS `space_type_id`,`t`.`space_type_description` AS `space_type_description`,`h`.`hub_id` AS `hub_id`,`h`.`name` AS `name`,`h`.`description` AS `hub_description`,`c`.`category_id` AS `category_id`,`c`.`description` AS `category_description`,`h`.`latitude` AS `latitude`,`h`.`longitude` AS `longitude`,`h`.`address` AS `address`,`h`.`parking` AS `parking`,`h`.`kitchen` AS `kitchen`,`h`.`printer_scanner` AS `printer_scanner`,`h`.`air_con` AS `air_con`,`h`.`heater` AS `heater`,`h`.`wifi` AS `wifi`,`s`.`screen` AS `screen`,`s`.`projector` AS `projector`,`s`.`whiteboard` AS `whiteboard`,`s`.`number_of_guests` AS `number_of_guests`,`s`.`number_of_spaces` AS `number_of_spaces`,`h`.`picture` AS `pictures`,`s`.`thumbnail_picture` AS `thumbnail` from ((((`users` `u` join `spaces` `s`) join `hubs` `h`) join `space_type` `t`) join `hub_category` `c`) where ((`s`.`hub_id` = `h`.`hub_id`) and (`h`.`user_id` = `u`.`user_id`) and (`t`.`space_type_id` = `s`.`space_type`) and (`c`.`category_id` = `h`.`category_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_space_review`
--
DROP TABLE IF EXISTS `v_space_review`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_space_review`  AS  select `hub_reviews`.`hub_id` AS `hub_id`,count(0) AS `reviews_count`,avg(`hub_reviews`.`rating`) AS `average_rating` from `hub_reviews` group by `hub_reviews`.`hub_id` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `FOREIGN_KEY_BOOKING_STATUS` (`booking_status_type`),
  ADD KEY `FOREIGN_KEY_BOOKING_USER` (`user_id`),
  ADD KEY `FOREIGN_KEY_BOOKING_RROM` (`space_id`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`hub_id`,`user_id`),
  ADD KEY `FOREIGN_KEY_FAVOURITES_USER` (`user_id`);

--
-- Indexes for table `hubs`
--
ALTER TABLE `hubs`
  ADD PRIMARY KEY (`hub_id`),
  ADD KEY `FOREIGN_KEY_HUBS_USER` (`user_id`),
  ADD KEY `FOREIGN_KEY_HUB_CATEGORY` (`category_id`) USING BTREE;

--
-- Indexes for table `hub_category`
--
ALTER TABLE `hub_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `hub_reviews`
--
ALTER TABLE `hub_reviews`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `FOREIGN_KEY_REVIEW_USER` (`user_id`),
  ADD KEY `FOREIGN_KEY_REVIEW_HUBS` (`hub_id`);

--
-- Indexes for table `pricing_package`
--
ALTER TABLE `pricing_package`
  ADD PRIMARY KEY (`package_id`);

--
-- Indexes for table `profession_category`
--
ALTER TABLE `profession_category`
  ADD PRIMARY KEY (`profession_id`);

--
-- Indexes for table `spaces`
--
ALTER TABLE `spaces`
  ADD PRIMARY KEY (`space_id`),
  ADD KEY `	FOREIGN_KEY_SPACE_HUB` (`hub_id`),
  ADD KEY `	FOREIGN_KEY_SPACE_TYPE` (`space_type`);

--
-- Indexes for table `space_pricing`
--
ALTER TABLE `space_pricing`
  ADD PRIMARY KEY (`space_id`,`price_package_id`),
  ADD KEY `FOREIGN_KEY_PRICING_PACKAGE` (`price_package_id`);

--
-- Indexes for table `space_type`
--
ALTER TABLE `space_type`
  ADD PRIMARY KEY (`space_type_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_type_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `FOREIGN_KEY_USER_PROFESSION` (`profession_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `hubs`
--
ALTER TABLE `hubs`
  MODIFY `hub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `hub_reviews`
--
ALTER TABLE `hub_reviews`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `spaces`
--
ALTER TABLE `spaces`
  MODIFY `space_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `FOREIGN_KEY_BOOKING_RROM` FOREIGN KEY (`space_id`) REFERENCES `spaces` (`space_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FOREIGN_KEY_BOOKING_STATUS` FOREIGN KEY (`booking_status_type`) REFERENCES `status` (`status_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FOREIGN_KEY_BOOKING_USER` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favourites`
--
ALTER TABLE `favourites`
  ADD CONSTRAINT `FOREIGN_KEY_FAVOURITES_HUBS` FOREIGN KEY (`hub_id`) REFERENCES `hubs` (`hub_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FOREIGN_KEY_FAVOURITES_USER` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hubs`
--
ALTER TABLE `hubs`
  ADD CONSTRAINT `FOREIGN_KEY_HUBS_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `hub_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FOREIGN_KEY_HUBS_USER` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hub_reviews`
--
ALTER TABLE `hub_reviews`
  ADD CONSTRAINT `FOREIGN_KEY_REVIEW_HUBS` FOREIGN KEY (`hub_id`) REFERENCES `hubs` (`hub_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FOREIGN_KEY_REVIEW_USER` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `spaces`
--
ALTER TABLE `spaces`
  ADD CONSTRAINT `	FOREIGN_KEY_SPACE_HUB` FOREIGN KEY (`hub_id`) REFERENCES `hubs` (`hub_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `	FOREIGN_KEY_SPACE_TYPE` FOREIGN KEY (`space_type`) REFERENCES `space_type` (`space_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `space_pricing`
--
ALTER TABLE `space_pricing`
  ADD CONSTRAINT `FOREIGN_KEY_PRICING_PACKAGE` FOREIGN KEY (`price_package_id`) REFERENCES `pricing_package` (`package_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FOREIGN_KEY_PRICING_space` FOREIGN KEY (`space_id`) REFERENCES `spaces` (`space_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FOREIGN_KEY_USER_PROFESSION` FOREIGN KEY (`profession_id`) REFERENCES `profession_category` (`profession_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
