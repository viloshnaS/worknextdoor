-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2018 at 03:25 PM
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
-- Database: `worknextdoor1`
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
  `package_id` int(11) NOT NULL,
  `unit_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `user_id`, `space_id`, `booking_date`, `booking_date_start`, `booking_date_end`, `booking_status_type`, `package_id`, `unit_price`) VALUES
(1, 2, 1, '2018-05-24 06:00:00', '2018-05-25 04:00:00', '2018-05-25 08:00:00', 1, 2, 10),
(3, 1, 1, '2018-06-08 01:00:58', '2018-06-12 05:00:00', '2018-06-15 05:00:00', 3, 2, 30),
(4, 1, 1, '2018-06-08 01:02:13', '2018-06-22 05:00:00', '2018-06-23 21:00:00', 3, 2, 30),
(5, 1, 1, '2018-06-08 01:02:13', '2018-06-22 05:00:00', '2018-06-23 21:00:00', 3, 2, 30),
(6, 1, 1, '2018-06-08 01:07:32', '2018-06-09 11:00:00', '2018-06-09 13:00:00', 3, 1, 9),
(7, 1, 1, '2018-06-08 01:07:32', '2018-06-09 11:00:00', '2018-06-09 13:00:00', 3, 1, 9),
(8, 1, 1, '2018-06-10 21:15:45', '2018-06-13 09:00:00', '2018-06-13 16:00:00', 3, 1, 9),
(9, 1, 1, '2018-06-10 21:15:45', '2018-06-13 09:00:00', '2018-06-13 16:00:00', 3, 1, 9),
(10, 1, 1, '2018-06-10 21:25:17', '2018-06-10 21:25:17', '2018-06-10 21:25:17', 3, 2, 30),
(11, 1, 1, '2018-06-10 21:25:17', '2018-06-10 21:25:17', '2018-06-10 21:25:17', 3, 2, 30),
(12, 1, 1, '2018-06-10 21:25:40', '2018-06-10 21:25:40', '2018-06-10 21:25:40', 3, 2, 30),
(13, 1, 1, '2018-06-10 21:25:40', '2018-06-10 21:25:40', '2018-06-10 21:25:40', 3, 2, 30),
(14, 1, 1, '2018-06-10 21:28:51', '2018-06-13 05:00:00', '2018-06-13 10:00:00', 3, 1, 9),
(15, 1, 1, '2018-06-10 21:28:51', '2018-06-13 05:00:00', '2018-06-13 10:00:00', 3, 1, 9),
(16, 1, 1, '2018-06-10 21:52:16', '2018-06-13 05:00:00', '2018-06-13 08:00:00', 3, 1, 9),
(17, 1, 1, '2018-06-10 21:52:16', '2018-06-13 05:00:00', '2018-06-13 08:00:00', 3, 1, 9),
(18, 4, 4, '2018-06-18 09:14:06', '2018-06-14 07:00:00', '2018-06-21 10:00:00', 3, 1, 5),
(19, 4, 4, '2018-06-11 09:14:06', '2018-06-25 07:00:00', '2018-06-27 10:00:00', 3, 1, 5),
(20, 1, 1, '2018-06-11 09:16:37', '2018-06-12 07:00:00', '2018-06-12 10:00:00', 3, 1, 9),
(21, 1, 1, '2018-06-11 09:16:37', '2018-06-12 07:00:00', '2018-06-12 10:00:00', 3, 1, 9),
(22, 1, 1, '2018-06-11 09:17:21', '2018-06-12 07:00:00', '2018-06-12 10:00:00', 3, 1, 9),
(23, 1, 1, '2018-06-11 09:17:21', '2018-06-12 07:00:00', '2018-06-12 10:00:00', 3, 1, 9),
(24, 3, 1, '2018-06-11 09:36:25', '2018-06-12 07:00:00', '2018-06-12 10:00:00', 3, 1, 7),
(25, 3, 1, '2018-06-11 09:36:25', '2018-06-12 07:00:00', '2018-06-12 10:00:00', 3, 1, 7),
(26, 4, 1, '2018-06-11 10:00:51', '2018-06-14 05:00:00', '2018-06-15 21:00:00', 3, 2, 20),
(27, 4, 1, '2018-06-11 10:00:51', '2018-06-14 05:00:00', '2018-06-15 21:00:00', 3, 2, 20),
(28, 4, 1, '2018-06-16 00:17:30', '2018-06-18 05:00:00', '2018-06-18 15:00:00', 3, 1, 5),
(29, 4, 1, '2018-06-16 00:17:30', '2018-06-18 05:00:00', '2018-06-18 15:00:00', 3, 1, 5),
(30, 4, 1, '2018-06-16 00:21:56', '2018-06-19 05:00:00', '2018-06-19 12:00:00', 3, 1, 5),
(31, 4, 1, '2018-06-16 00:21:56', '2018-06-19 05:00:00', '2018-06-19 12:00:00', 3, 1, 5),
(32, 4, 1, '2018-06-16 01:39:28', '2018-06-18 05:00:00', '2018-06-20 21:00:00', 3, 2, 20),
(33, 4, 1, '2018-06-16 01:39:28', '2018-06-18 05:00:00', '2018-06-20 21:00:00', 3, 2, 20),
(34, 3, 1, '2018-06-16 01:43:49', '2018-06-19 05:00:00', '2018-06-19 09:00:00', 3, 1, 7),
(35, 3, 1, '2018-06-16 01:43:49', '2018-06-19 05:00:00', '2018-06-19 09:00:00', 3, 1, 7),
(36, 1, 1, '2018-06-16 01:56:31', '2018-06-19 05:00:00', '2018-06-19 09:00:00', 3, 1, 9),
(37, 1, 1, '2018-06-16 01:56:31', '2018-06-19 05:00:00', '2018-06-19 09:00:00', 3, 1, 9),
(38, 1, 1, '2018-06-16 12:24:34', '2018-06-29 09:00:00', '2018-06-29 12:00:00', 3, 1, 9),
(39, 1, 1, '2018-06-16 12:24:34', '2018-06-29 09:00:00', '2018-06-29 12:00:00', 3, 1, 9),
(40, 1, 1, '2018-06-16 12:31:31', '2018-07-10 05:00:00', '2018-07-11 21:00:00', 3, 2, 30),
(41, 1, 1, '2018-06-16 12:31:31', '2018-07-10 05:00:00', '2018-07-11 21:00:00', 3, 2, 30),
(42, 1, 1, '2018-06-16 14:00:37', '2018-06-18 08:00:00', '2018-06-18 10:00:00', 3, 1, 9),
(43, 1, 1, '2018-06-16 14:00:37', '2018-06-18 08:00:00', '2018-06-18 10:00:00', 3, 1, 9),
(44, 1, 2, '2018-06-16 14:09:16', '2018-06-20 05:00:00', '2018-06-21 21:00:00', 3, 2, 30),
(45, 1, 2, '2018-06-16 14:09:16', '2018-06-20 05:00:00', '2018-06-21 21:00:00', 3, 2, 30),
(46, 1, 2, '2018-06-19 23:07:44', '2018-06-19 23:07:44', '2018-06-19 23:07:44', 3, 2, 30),
(47, 1, 2, '2018-06-19 23:07:44', '2018-06-19 23:07:44', '2018-06-19 23:07:44', 3, 2, 30),
(48, 1, 2, '2018-06-19 23:10:12', '2018-06-19 23:10:12', '2018-06-19 23:10:12', 3, 2, 30),
(49, 1, 2, '2018-06-19 23:10:12', '2018-06-19 23:10:12', '2018-06-19 23:10:12', 3, 2, 30),
(50, 1, 2, '2018-06-19 23:12:33', '2018-06-28 05:00:00', '2018-06-30 21:00:00', 3, 2, 30),
(51, 1, 2, '2018-06-19 23:15:42', '2018-06-28 06:00:00', '2018-06-28 11:00:00', 3, 1, 9),
(52, 1, 2, '2018-06-19 23:16:29', '2018-06-28 06:00:00', '2018-06-28 11:00:00', 3, 1, 9),
(54, 3, 2, '2018-06-20 12:53:31', '2018-06-25 05:00:00', '2018-06-27 21:00:00', 3, 2, 30);

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

INSERT INTO `hubs` (`hub_id`, `name`, `description`, `user_id`, `latitude`, `longitude`, `address`, `parking`, `kitchen`, `printer_scanner`, `heater`, `air_con`, `wifi`, `picture`, `active`) VALUES
(1, 'Etincelle CoWorking', 'Located in the heart of Toulouse, 2 minutes from Jean Jaures Metro(line A and B). There are several restaurants and shops nearby. The space was founded in 2013 and offers the best facilities.', 1, 43.6058, 1.4473, '2 Rue Victor Hugo, 31000 Toulouse', 0, 1, 1, 1, 1, 1, '[\"hub_1/space1.jpeg\",\"hub_1/space2.jpeg\",\"hub_1/space3.jpeg\"]', 1),
(2, 'Harry Cow', 'Harry Cow offers short term furnished, low cost, office rentals at and affordable price. Free access to beautiful conference room, free printing, receptionist to meet & greet your clients, wifi access, an more much.', 2, 43.6023, 1.44169, 'Rue Sainte-Ursule, Toulouse', 1, 1, 1, 1, 1, 1, '[\"hub_2/space1.jpg\",\"hub_2/space2.jpg\",\"hub_2/space3.jpg\"]', 1),
(3, 'Atelier at Colomiers', 'Located in a calm and soothing suburb, The atelier targets engineers. Modern tools available for building and testing prototypes.', 3, 43.5885, 1.35367, '45 Boulevard Vincent Auriol, 31170 Tournefeuille', 0, 1, 1, 1, 1, 1, '[\"hub_3/atelier1.jpg\",\"hub_3/atelier2.jpg\",\"hub_3/atelier4.jpg\",\"hub_3/atelier3.jpg\"]', 1),
(4, 'Sopra Steria', 'Spacious Conference Room to rent at Sopra Steria Rue des ramassiers site. Modern and high security building with all facilities.', 4, 43.6004, 1.35331, 'Esplanade des Ramassiers, Colomiers', 1, 1, 1, 1, 1, 1, '[\"hub_4/conference.jpeg\",\"hub_4/meeting_room.jpeg\",\"hub_4/meeting2.jpeg\"]', 1),
(5, 'Hub in Labege', 'Join Toulouse\'s most engaged community of designers, developers, social change agents, artists and entrepreneurs that have converged to share ideas, innovate and learn in a collaborative and nurturing environment. Located in the heart of the industrial zone of Labege.', 1, 43.5399, 1.5115, 'Avenue la Meridienne, 31670 Labege', 1, 1, 0, 1, 0, 1, '[\"hub_5/hub1.jpg\",\"hub_5/hub2.jpg\",\"hub_5/hub3.jpg\"]', 1),
(6, 'Studio St Michel', 'The studio is located near the centre of Toulouse (next to the metro station Saint Michel)in a very nice building built in the 19th century. Cozy studio of 20m2 with desks, chair, a sofa bed and good internet connection', 2, 43.5859, 1.44715, '29 Grande Rue Saint-Michel, 31400 Toulouse, France', 0, 0, 1, 1, 0, 1, '[\"hub_6/bright_studio.jpg\",\"hub_6/bright_studio2.jpg\",\"hub_6/bright_studio3.jpg\"]', 1),
(7, 'Tau Co-working', 'Tau Co working spaces provides private, furnished, equipped and staffed temporary office space. All configurations from executive layouts to team rooms to conference rooms by the hour. It is close to Airbus', 3, 43.6108, 1.37384, '15 Chemin de la Crabe, 31300 Toulouse', 1, 1, 1, 1, 0, 1, '[\"hub_7/tau1.jpg\",\"hub_7/tau2.jpg\",\"hub_7/tau3.jpg\",\"hub_7/tau4.jpg\"]', 1),
(8, 'Open Hall Ramonville', 'Big Hall in Ramonville near Public transport. Ideal for meetings with large number of people(100). Can be rented for dance and yoga classes', 4, 43.5428, 1.47801, '76 Avenue Tolosane, 31520 Ramonville-Saint-Agne', 1, 1, 0, 1, 1, 0, '[\"hub_8/hall1.jpg\",\"hub_8/hall2.jpg\"]', 1);

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
-- Table structure for table `profession`
--

CREATE TABLE `profession` (
  `profession_id` int(11) NOT NULL,
  `description` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profession`
--

INSERT INTO `profession` (`profession_id`, `description`) VALUES
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
(1, 1, 1, 1, 1, NULL, 0, 0, 0, 'hub_1/space1.jpeg'),
(2, 1, 2, 6, 1, NULL, 1, 1, 1, 'hub_1/space3.jpeg'),
(3, 2, 2, 10, 1, NULL, 1, 1, 1, 'hub_2/space2.jpg'),
(4, 2, 1, 1, 1, NULL, 0, 0, 0, 'hub_2/space3.jpg'),
(5, 3, 1, 1, 1, NULL, 1, 0, 0, 'hub_3/atelier2.jpg'),
(6, 4, 2, 12, 1, NULL, 0, 1, 1, 'hub_4/meeting_room.jpeg'),
(7, 5, 1, 1, 1, NULL, 0, 0, 0, 'hub_5/hub1.jpg'),
(8, 6, 2, 8, 1, NULL, 1, 0, 0, 'hub_6/bright_studio.jpg'),
(9, 7, 2, 12, 1, 20, 1, 1, 1, 'hub_7/tau4.jpg'),
(10, 7, 1, 1, 1, NULL, 0, 0, 0, 'hub_7/tau2.jpg'),
(11, 8, 2, 100, 1, NULL, 1, 0, 0, 'hub_8/hall1.jpg');

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
(4, 2, 20),
(5, 1, 10),
(5, 2, 50),
(5, 3, 300),
(6, 1, 15),
(6, 2, 65),
(6, 3, 400),
(7, 1, 5),
(7, 2, 30),
(7, 3, 150),
(8, 1, 7),
(8, 2, 50),
(8, 3, 500),
(9, 1, 25),
(9, 2, 100),
(10, 1, 6),
(10, 2, 30),
(10, 3, 350),
(11, 1, 50),
(11, 2, 250);

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
  `latitude` float NOT NULL,
  `longitude` double NOT NULL,
  `picture` varchar(30) NOT NULL,
  `profession_id` int(11) DEFAULT NULL,
  `host` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `Gender`, `email`, `phone`, `latitude`, `longitude`, `picture`, `profession_id`, `host`) VALUES
(1, 'Viloshna', 'Sonoo', 'F', 'viloshna.sonoo@gmail.com', '0752415680', 31000, 0, 'viloshna.png', 1, 0),
(2, 'Shujun', 'Hou', 'F', 'shujunhou99@gmail.com', '0914873411', 31300, 0, 'shujun.jpg', 1, 0),
(3, 'Oluchi', 'Onuorah', 'F', 'oluuchii@gmail.com', '0789378436', 31300, 0, 'oluchi.jpg', 1, 0),
(4, 'Dieu', 'Vu Dinh', 'M', 'dieuvd.it2@gmail.com', '0634249853', 31300, 0, 'dieu.jpg', 1, 0),
(5, 'Xutong', 'Jin', 'F', 'rosa.jin.cueb@hotmail.com', '0573984309', 31300, 0, 'xutong.jpg', 1, 0),
(6, 'Kaichi', 'Cong', 'M', 'congkaichi@gmail.com', '0799878542', 31300, 0, 'kaichi.jpg', 1, 0),
(7, 'Jane', 'Doe', 'M', 'umberto.grandi@ut-capitole.fr', '1234567890', 43.6052, 1.432664, '', 1, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_space`
-- (See below for the actual view)
--
CREATE TABLE `v_space` (
`user_id` int(11)
,`firstname` varchar(100)
,`lastname` varchar(100)
,`user_picture` varchar(30)
,`Gender` char(1)
,`email` varchar(100)
,`space_id` int(11)
,`size` int(11)
,`space_type_id` int(11)
,`space_type_description` varchar(30)
,`hub_id` int(11)
,`name` varchar(30)
,`hub_description` text
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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_space`  AS  select `u`.`user_id` AS `user_id`,`u`.`firstname` AS `firstname`,`u`.`lastname` AS `lastname`,`u`.`picture` AS `user_picture`,`u`.`Gender` AS `Gender`,`u`.`email` AS `email`,`s`.`space_id` AS `space_id`,`s`.`size` AS `size`,`t`.`space_type_id` AS `space_type_id`,`t`.`space_type_description` AS `space_type_description`,`h`.`hub_id` AS `hub_id`,`h`.`name` AS `name`,`h`.`description` AS `hub_description`,`h`.`latitude` AS `latitude`,`h`.`longitude` AS `longitude`,`h`.`address` AS `address`,`h`.`parking` AS `parking`,`h`.`kitchen` AS `kitchen`,`h`.`printer_scanner` AS `printer_scanner`,`h`.`air_con` AS `air_con`,`h`.`heater` AS `heater`,`h`.`wifi` AS `wifi`,`s`.`screen` AS `screen`,`s`.`projector` AS `projector`,`s`.`whiteboard` AS `whiteboard`,`s`.`number_of_guests` AS `number_of_guests`,`s`.`number_of_spaces` AS `number_of_spaces`,`h`.`picture` AS `pictures`,`s`.`thumbnail_picture` AS `thumbnail` from (((`users` `u` join `spaces` `s`) join `hubs` `h`) join `space_type` `t`) where ((`s`.`hub_id` = `h`.`hub_id`) and (`h`.`user_id` = `u`.`user_id`) and (`t`.`space_type_id` = `s`.`space_type`)) ;

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
-- Indexes for table `hubs`
--
ALTER TABLE `hubs`
  ADD PRIMARY KEY (`hub_id`),
  ADD KEY `FOREIGN_KEY_HUBS_USER` (`user_id`);

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
-- Indexes for table `profession`
--
ALTER TABLE `profession`
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
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

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
  MODIFY `space_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- Constraints for table `hubs`
--
ALTER TABLE `hubs`
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
  ADD CONSTRAINT `FOREIGN_KEY_USER_PROFESSION` FOREIGN KEY (`profession_id`) REFERENCES `profession` (`profession_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
