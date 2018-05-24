-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2018 at 02:58 PM
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
  `number_of_spaces` int(11) NOT NULL,
  `booking_status_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `hub_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `parking` tinyint(1) NOT NULL,
  `kitchen` tinyint(1) NOT NULL,
  `printer_scanner` tinyint(1) NOT NULL,
  `heater` tinyint(1) NOT NULL,
  `air_con` tinyint(1) NOT NULL,
  `wifi` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hub_category`
--

CREATE TABLE `hub_category` (
  `category_id` int(11) NOT NULL,
  `description` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `pricing_type` int(11) NOT NULL,
  `price` float NOT NULL,
  `number_spaces` int(11) NOT NULL,
  `discount` double NOT NULL,
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
(1, 'IT CONSULTANT');

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

-- --------------------------------------------------------

--
-- Table structure for table `space_pricing`
--

CREATE TABLE `space_pricing` (
  `space_id` int(11) NOT NULL,
  `price_package_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `discount` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `space_type`
--

CREATE TABLE `space_type` (
  `space_type_id` int(11) NOT NULL,
  `space_type_description` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status_type_id` int(11) NOT NULL,
  `description` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 'Viloshna', 'Sonoo', 'F', 'viloshna.sonoo@gmail.com', '31000', 'Toulouse', 'France', 1, 0);

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
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `FOREIGN_KEY_BOOKING_USER` (`user_id`),
  ADD KEY `FOREIGN_KEY_BOOKING_STATUS` (`booking_status_type`),
  ADD KEY `FOREIGN_KEY_BOOKING_ROOM` (`space_id`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`hub_id`,`user_id`),
  ADD KEY `FOREIGN_KEY_FAVOURITE_USER` (`user_id`);

--
-- Indexes for table `hubs`
--
ALTER TABLE `hubs`
  ADD PRIMARY KEY (`hub_id`),
  ADD KEY `FOREIGN_KEY_HUB_USER` (`user_id`),
  ADD KEY `FOREIGN_KEY_HUB_CATEGORY` (`category_id`);

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
  ADD KEY `FOREIGN_KEY_SPACE_REVIEW` (`hub_id`),
  ADD KEY `FOREIGN_KEY_REVIEW_USER` (`user_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `FOREIGN_KEY_PAYMENT_BOOKING` (`booking_id`),
  ADD KEY `FOREIGN_KEY_PAYMENT_PRICE_PACKAGE` (`pricing_type`),
  ADD KEY `FOREIGN_KEY_PAYMENT_STATUS` (`payment_status`);

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
  ADD KEY `FOREIGN_KEY_ROOM_SPACE` (`hub_id`),
  ADD KEY `FOREIGN_KEY_ROOM_TYPE` (`space_type`);

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
  ADD KEY `FOREIGN_KEY_USER_REVIEW` (`user_id`),
  ADD KEY `FOREIGN_KEY_HOST_REVIEW` (`host_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `FOREIGN_KEY_BOOKING_ROOM` FOREIGN KEY (`space_id`) REFERENCES `spaces` (`space_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FOREIGN_KEY_BOOKING_STATUS` FOREIGN KEY (`booking_status_type`) REFERENCES `status` (`status_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FOREIGN_KEY_BOOKING_USER` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favourites`
--
ALTER TABLE `favourites`
  ADD CONSTRAINT `FOREIGN_KEY_FAVOURITE_SPACE` FOREIGN KEY (`hub_id`) REFERENCES `hubs` (`hub_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FOREIGN_KEY_FAVOURITE_USER` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hubs`
--
ALTER TABLE `hubs`
  ADD CONSTRAINT `FOREIGN_KEY_HUB_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `hub_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FOREIGN_KEY_HUB_USER` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hub_reviews`
--
ALTER TABLE `hub_reviews`
  ADD CONSTRAINT `FOREIGN_KEY_REVIEW_USER` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FOREIGN_KEY_SPACE_REVIEW` FOREIGN KEY (`hub_id`) REFERENCES `hubs` (`hub_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FOREIGN_KEY_PAYMENT_BOOKING` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FOREIGN_KEY_PAYMENT_PRICE_PACKAGE` FOREIGN KEY (`pricing_type`) REFERENCES `pricing_package` (`package_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FOREIGN_KEY_PAYMENT_STATUS` FOREIGN KEY (`payment_status`) REFERENCES `status` (`status_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `spaces`
--
ALTER TABLE `spaces`
  ADD CONSTRAINT `FOREIGN_KEY_ROOM_SPACE` FOREIGN KEY (`hub_id`) REFERENCES `hubs` (`hub_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FOREIGN_KEY_ROOM_TYPE` FOREIGN KEY (`space_type`) REFERENCES `space_type` (`space_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `space_pricing`
--
ALTER TABLE `space_pricing`
  ADD CONSTRAINT `FOREIGN_KEY_PRICING_PACKAGE` FOREIGN KEY (`price_package_id`) REFERENCES `pricing_package` (`package_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FOREIGN_KEY_PRICING_ROOM` FOREIGN KEY (`space_id`) REFERENCES `spaces` (`space_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FOREIGN_KEY_USER_PROFESSION` FOREIGN KEY (`profession_id`) REFERENCES `profession_category` (`profession_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_reviews`
--
ALTER TABLE `user_reviews`
  ADD CONSTRAINT `FOREIGN_KEY_HOST_REVIEW` FOREIGN KEY (`host_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FOREIGN_KEY_USER_REVIEW` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
