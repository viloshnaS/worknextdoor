-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2018 at 04:18 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `number_of_spaces` int(11) NOT NULL,
  `booking_status_type` int(11) NOT NULL,
  `booking_length` int(11) NOT NULL,
  `pricing_type` int(11) NOT NULL,
  `unit_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `user_id`, `space_id`, `booking_date`, `booking_date_start`, `booking_date_end`, `number_of_spaces`, `booking_status_type`, `booking_length`, `pricing_type`, `unit_price`) VALUES
(1, 2, 1, '2018-05-24 06:00:00', '2018-05-25 04:00:00', '2018-05-25 08:00:00', 1, 1, 2, 2, 10);

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
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hubs`
--

INSERT INTO `hubs` (`hub_id`, `name`, `description`, `user_id`, `latitude`, `longitude`, `address`, `category_id`, `parking`, `kitchen`, `printer_scanner`, `heater`, `air_con`, `wifi`, `active`) VALUES
(1, 'Modern co-working hypercentre', '', 1, 43.6447, 1.54421, '', 1, 1, 0, 1, 1, 1, 1, 1),
(2, 'Spacious Conference Room', '', 4, 43.6019, 1.43862, '18 Place de la Daurade', 1, 20, 1, 2, 1, 1, 1, 1),
(3, 'bright studio St Michel', '', 5, 43.5943, 1.45091, '37 Allées Jules Guesde, 31400 Toulouse', 3, 0, 0, 1, 1, 0, 1, 1),
(4, 'Fully Equipped Meeting Room', '', 2, 43.6283, 1.3798, '7 Avenue Didier Daurat, 31702 Blagnac', 1, 6, 1, 1, 1, 1, 1, 1),
(5, 'quiet bistro for co-working', '', 3, 43.6067, 1.39694, '7 Rue Georges Vedel, 31300 Toulouse', 3, 0, 0, 0, 1, 1, 1, 1);

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
(1, 1, 2, 4, 'Polite', '2018-05-25 09:48:20');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `number_spaces` int(11) NOT NULL,
  `total_amount` float NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `payment_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `projector` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spaces`
--

INSERT INTO `spaces` (`space_id`, `hub_id`, `space_type`, `number_of_guests`, `number_of_spaces`, `size`, `whiteboard`, `screen`, `projector`) VALUES
(1, 1, 1, 15, 15, NULL, 1, 1, 1),
(2, 1, 2, 6, 6, NULL, 1, 1, 1),
(3, 2, 1, 30, 30, NULL, 4, 2, 1),
(4, 2, 2, 10, 10, NULL, 2, 2, 1),
(5, 2, 2, 4, 4, NULL, 1, 1, 0),
(6, 3, 1, 8, 8, NULL, 1, 0, 0),
(7, 4, 1, 5, 5, NULL, 0, 0, 0),
(8, 5, 1, 4, 4, NULL, 0, 0, 0);

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
(1, 1, 1),
(1, 2, 10),
(1, 3, 40),
(2, 1, 5),
(2, 2, 10),
(2, 3, 20),
(3, 1, 8),
(3, 2, 20),
(3, 3, 35),
(4, 1, 4),
(4, 2, 15),
(4, 3, 28),
(5, 1, 7),
(5, 2, 23),
(5, 3, 35);

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
(1, 'Individual'),
(2, 'Meeting');

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
  `zipCode` varchar(10) NOT NULL,
  `city` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `profession_id` int(11) DEFAULT NULL,
  `host` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `Gender`, `email`, `zipCode`, `city`, `country`, `profession_id`, `host`) VALUES
(1, 'Viloshna', 'Sonoo', 'F', 'viloshna.sonoo@gmail.com', '31000', 'Toulouse', 'France', 1, 0),
(2, 'Shujun', 'Hou', 'F', 'shujunhou99@gmail.com', '31300', 'Toulouse', 'France', 1, 0),
(3, 'Oluchi', 'Onuorah', 'F', 'oluuchii@gmail.com', '31300', 'Toulouse', 'France', 1, 0),
(4, 'Dieu', 'Vu Dinh', 'M', 'dieuvd.it2@gmail.com', '31300', 'Toulouse', 'France', 1, 0),
(5, 'Xutong', 'Jin', 'F', 'rosa.jin.cueb@hotmail.com', '31300', 'Toulouse', 'France', 1, 0),
(6, 'Kaichi', 'Cong', 'M', 'congkaichi@gmail.com', '31300', 'Toulouse', 'France', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_reviews`
--

CREATE TABLE `user_reviews` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_posted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_reviews`
--

INSERT INTO `user_reviews` (`review_id`, `user_id`, `host_id`, `rating`, `comment`, `date_posted`) VALUES
(1, 2, 1, 4, 'good', '2018-05-25 08:09:35');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_booking`
--
CREATE TABLE `v_booking` (
`booking_id` int(11)
,`user_id` int(11)
,`space_id` int(11)
,`booking_date` timestamp
,`start_date_and_time` timestamp
,`booking_length` int(11)
,`end_date_and_time` timestamp
,`number_of_spaces` int(11)
,`status_id` int(11)
,`status` varchar(20)
,`hub_id` int(11)
,`hub_description` text
,`address` varchar(50)
,`space_type_id` int(11)
,`space_type_description` varchar(30)
,`pricing_type` int(11)
,`pricing_description` varchar(10)
,`unit_price` float
,`total` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_space`
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
);

-- --------------------------------------------------------

--
-- Structure for view `v_booking`
--
DROP TABLE IF EXISTS `v_booking`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_booking`  AS  select `b`.`booking_id` AS `booking_id`,`b`.`user_id` AS `user_id`,`b`.`space_id` AS `space_id`,`b`.`booking_date` AS `booking_date`,`b`.`booking_date_start` AS `start_date_and_time`,`b`.`booking_length` AS `booking_length`,`b`.`booking_date_end` AS `end_date_and_time`,`b`.`number_of_spaces` AS `number_of_spaces`,`b`.`booking_status_type` AS `status_id`,`st`.`description` AS `status`,`h`.`hub_id` AS `hub_id`,`h`.`description` AS `hub_description`,`h`.`address` AS `address`,`t`.`space_type_id` AS `space_type_id`,`t`.`space_type_description` AS `space_type_description`,`b`.`pricing_type` AS `pricing_type`,`pp`.`description` AS `pricing_description`,`b`.`unit_price` AS `unit_price`,(`b`.`unit_price` * `b`.`booking_length`) AS `total` from ((((((`booking` `b` join `status` `st`) join `spaces` `s`) join `hubs` `h`) join `space_type` `t`) join `space_pricing` `p`) join `pricing_package` `pp`) where ((`b`.`space_id` = `s`.`space_id`) and (`b`.`booking_status_type` = `st`.`status_type_id`) and (`s`.`hub_id` = `h`.`hub_id`) and (`s`.`space_type` = `t`.`space_type_id`) and (`b`.`pricing_type` = `p`.`price_package_id`) and (`b`.`pricing_type` = `pp`.`package_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_space`
--
DROP TABLE IF EXISTS `v_space`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_space`  AS  select `u`.`user_id` AS `user_id`,`u`.`firstname` AS `firstname`,`u`.`lastname` AS `lastname`,`u`.`Gender` AS `Gender`,`u`.`email` AS `email`,`s`.`space_id` AS `space_id`,`s`.`size` AS `size`,`t`.`space_type_id` AS `space_type_id`,`t`.`space_type_description` AS `space_type_description`,`h`.`hub_id` AS `hub_id`,`h`.`name` AS `name`,`h`.`description` AS `hub_description`,`c`.`category_id` AS `category_id`,`c`.`description` AS `category_description`,`h`.`latitude` AS `latitude`,`h`.`longitude` AS `longitude`,`h`.`parking` AS `parking`,`h`.`kitchen` AS `kitchen`,`h`.`printer_scanner` AS `printer_scanner`,`h`.`air_con` AS `air_con`,`h`.`heater` AS `heater`,`h`.`wifi` AS `wifi`,`s`.`screen` AS `screen`,`s`.`projector` AS `projector`,`s`.`whiteboard` AS `whiteboard`,`s`.`number_of_guests` AS `number_of_guests`,`s`.`number_of_spaces` AS `number_of_spaces` from ((((`users` `u` join `spaces` `s`) join `hubs` `h`) join `space_type` `t`) join `hub_category` `c`) where ((`s`.`hub_id` = `h`.`hub_id`) and (`h`.`user_id` = `u`.`user_id`) and (`t`.`space_type_id` = `s`.`space_type`) and (`c`.`category_id` = `h`.`category_id`)) ;

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
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `FOREIGN_KEY_PAYMENT_STATUS` (`payment_status`),
  ADD KEY `FOREIGN_KEY_PAYMENT_BOOKING` (`booking_id`);

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
-- Indexes for table `user_reviews`
--
ALTER TABLE `user_reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `FOREIGN_KEY_REVIEW_HOST` (`host_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hubs`
--
ALTER TABLE `hubs`
  MODIFY `hub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `hub_reviews`
--
ALTER TABLE `hub_reviews`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;
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
-- AUTO_INCREMENT for table `user_reviews`
--
ALTER TABLE `user_reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FOREIGN_KEY_PAYMENT_BOOKING` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FOREIGN_KEY_PAYMENT_STATUS` FOREIGN KEY (`payment_status`) REFERENCES `status` (`status_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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

--
-- Constraints for table `user_reviews`
--
ALTER TABLE `user_reviews`
  ADD CONSTRAINT `FOREIGN_KEY_REVIEW_HOST` FOREIGN KEY (`host_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
