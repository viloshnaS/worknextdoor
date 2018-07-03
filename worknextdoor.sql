-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 03, 2018 at 04:45 PM
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
(54, 3, 2, '2018-06-20 12:53:31', '2018-06-25 05:00:00', '2018-06-27 21:00:00', 3, 2, 30),
(58, 2, 11, '2018-06-20 21:18:50', '2018-06-21 10:00:00', '2018-06-21 14:00:00', 3, 1, 50),
(59, 7, 5, '2018-06-21 07:49:48', '2018-06-26 05:00:00', '2018-07-26 21:00:00', 3, 3, 300),
(60, 7, 10, '2018-06-21 07:53:07', '2018-06-23 05:00:00', '2018-06-24 21:00:00', 3, 2, 30),
(61, 7, 10, '2018-06-21 07:53:09', '2018-06-23 05:00:00', '2018-06-24 21:00:00', 3, 2, 30),
(62, 7, 3, '2018-06-21 07:54:33', '2018-06-22 09:00:00', '2018-06-22 10:00:00', 3, 1, 7),
(63, 7, 3, '2018-06-21 07:54:35', '2018-06-22 09:00:00', '2018-06-22 10:00:00', 3, 1, 7),
(64, 7, 3, '2018-06-21 07:58:08', '2018-06-24 07:00:00', '2018-06-24 09:00:00', 3, 1, 7),
(65, 7, 2, '2018-06-21 08:13:07', '2018-07-03 05:00:00', '2018-07-04 21:00:00', 3, 2, 50),
(66, 7, 3, '2018-06-21 08:14:08', '2018-06-24 11:00:00', '2018-06-24 17:00:00', 3, 1, 7),
(67, 7, 1, '2018-06-21 09:19:34', '2018-06-27 05:00:00', '2018-09-27 21:00:00', 3, 3, 400),
(68, 7, 11, '2018-06-21 09:24:12', '2018-07-04 05:00:00', '2018-07-06 21:00:00', 3, 2, 250),
(69, 7, 9, '2018-06-21 10:11:04', '2018-06-29 05:00:00', '2018-06-30 21:00:00', 3, 2, 100),
(70, 7, 9, '2018-06-21 10:11:06', '2018-06-29 05:00:00', '2018-06-30 21:00:00', 3, 2, 100),
(71, 7, 2, '2018-06-21 10:13:19', '2018-07-01 08:00:00', '2018-07-01 11:00:00', 3, 1, 7),
(72, 7, 3, '2018-07-02 08:31:43', '2018-07-04 05:00:00', '2018-07-05 21:00:00', 3, 2, 30);

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
  `date_posted` date NOT NULL,
  `last_booked` date NOT NULL,
  `weekends` tinyint(1) NOT NULL,
  `public_holidays` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hubs`
--

INSERT INTO `hubs` (`hub_id`, `name`, `description`, `user_id`, `latitude`, `longitude`, `address`, `parking`, `kitchen`, `printer_scanner`, `heater`, `air_con`, `wifi`, `picture`, `date_posted`, `last_booked`, `weekends`, `public_holidays`, `active`) VALUES
(1, 'Squadra CoWorking', 'Located in the heart of Toulouse, 2 minutes from Jean Jaures Metro(line A and B). There are several restaurants and shops nearby. The space was founded in 2013 and offers the best facilities.', 1, 43.6058, 1.4473, '2 Rue Victor Hugo, 31000 Toulouse', 0, 1, 1, 1, 1, 1, '[\"hub_1/space1.jpeg\",\"hub_1/space2.jpeg\",\"hub_1/space3.jpeg\"]', '0000-00-00', '0000-00-00', 0, 0, 1),
(2, 'Harry Cow', 'Harry Cow offers short term furnished, low cost, office rentals at and affordable price. Free access to beautiful conference room, free printing, receptionist to meet & greet your clients, wifi access, an more much.', 2, 43.6023, 1.44169, 'Rue Sainte-Ursule, Toulouse', 1, 1, 1, 1, 1, 1, '[\"hub_2/space1.jpg\",\"hub_2/space2.jpg\",\"hub_2/space3.jpg\"]', '0000-00-00', '0000-00-00', 0, 0, 1),
(3, 'Atelier at Colomiers', 'Located in a calm and soothing suburb, The atelier targets engineers. Modern tools available for building and testing prototypes.', 3, 43.5885, 1.35367, '45 Boulevard Vincent Auriol, 31170 Tournefeuille', 0, 1, 1, 1, 1, 1, '[\"hub_3/atelier1.jpg\",\"hub_3/atelier2.jpg\",\"hub_3/atelier4.jpg\",\"hub_3/atelier3.jpg\"]', '0000-00-00', '0000-00-00', 0, 0, 1),
(4, 'Sopra Steria', 'Spacious Conference Room to rent at Sopra Steria Rue des ramassiers site. Modern and high security building with all facilities.', 4, 43.6004, 1.35331, 'Esplanade des Ramassiers, Colomiers', 1, 1, 1, 1, 1, 1, '[\"hub_4/conference.jpeg\",\"hub_4/meeting_room.jpeg\",\"hub_4/meeting2.jpeg\"]', '0000-00-00', '0000-00-00', 0, 0, 1),
(5, 'Share Hub', 'Join Toulouse\'s most engaged community of designers, developers, social change agents, artists and entrepreneurs that have converged to share ideas, innovate and learn in a collaborative and nurturing environment. Located in the heart of the industrial zone of Labege.', 1, 43.5399, 1.5115, 'Avenue la Meridienne, 31670 Labege', 1, 1, 0, 1, 0, 1, '[\"hub_5/hub1.jpg\",\"hub_5/hub2.jpg\",\"hub_5/hub3.jpg\"]', '0000-00-00', '0000-00-00', 0, 0, 1),
(6, 'Bright Studio', 'The studio is located near the centre of Toulouse (next to the metro station Saint Michel)in a very nice building built in the 19th century. Cozy studio of 20m2 with desks, chair, a sofa bed and good internet connection', 2, 43.5859, 1.44715, '29 Grande Rue Saint-Michel, 31400 Toulouse, France', 0, 0, 1, 1, 0, 1, '[\"hub_6/bright_studio.jpg\",\"hub_6/bright_studio2.jpg\",\"hub_6/bright_studio3.jpg\"]', '0000-00-00', '0000-00-00', 0, 0, 1),
(7, 'Tau Co-working', 'Tau Co working spaces provides private, furnished, equipped and staffed temporary office space. All configurations from executive layouts to team rooms to conference rooms by the hour. It is close to Airbus', 3, 43.6108, 1.37384, '15 Chemin de la Crabe, 31300 Toulouse', 1, 1, 1, 1, 0, 1, '[\"hub_7/tau1.jpg\",\"hub_7/tau2.jpg\",\"hub_7/tau3.jpg\",\"hub_7/tau4.jpg\"]', '0000-00-00', '0000-00-00', 0, 0, 1),
(8, 'Open Hall', 'Big Hall in Ramonville near Public transport. Ideal for meetings with large number of people(100). Can be rented for dance and yoga classes', 4, 43.5428, 1.47801, '76 Avenue Tolosane, 31520 Ramonville-Saint-Agne', 1, 1, 0, 1, 1, 0, '[\"hub_8/hall1.jpg\",\"hub_8/hall2.jpg\"]', '0000-00-00', '0000-00-00', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hub_availability`
--

CREATE TABLE `hub_availability` (
  `hub_id` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL
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

--
-- Dumping data for table `hub_reviews`
--

INSERT INTO `hub_reviews` (`comment_id`, `hub_id`, `user_id`, `rating`, `comment`, `date_posted`) VALUES
(1, 1, 2, 4, 'Perfect Location. Host is friendly and helpful', '2018-05-25 09:48:20'),
(2, 1, 6, 5, 'Very happy with the service offered. Will surely come again.', '2018-02-11 23:00:00'),
(3, 1, 4, 2, 'The wifi connection was very poor but the host is very friendly and helpful', '2018-03-21 23:00:00'),
(5, 2, 2, 3, 'non architecto est omnis minus quasi saepe.', '2018-01-26 19:34:11'),
(6, 2, 4, 1, 'eum magni consectetur.', '2018-03-08 12:49:08'),
(7, 2, 5, 1, 'ut vitae illum sed necessitatibus.', '2018-04-04 07:41:24'),
(8, 2, 9, 5, 'dolores sed et tempore voluptas ducimus similique.', '2018-01-19 10:36:08'),
(9, 2, 10, 3, 'expedita nulla nesciunt ut reiciendis.', '2018-03-30 10:48:51'),
(10, 2, 15, 3, 'sed tenetur necessitatibus similique rerum.', '2018-04-24 09:21:12'),
(11, 2, 16, 1, 'eos nobis nisi ex natus.', '2018-03-14 22:56:11'),
(12, 2, 18, 3, 'quo enim quos consequatur similique deserunt!', '2018-02-04 22:00:59'),
(13, 2, 19, 2, 'dolores repellat hic dolorem iste.', '2018-02-25 21:44:43'),
(14, 2, 21, 2, 'impedit odit explicabo in officia impedit sint.', '2018-04-21 15:31:55'),
(15, 2, 22, 5, 'temporibus reprehenderit quasi voluptatibus aut eius repellat!', '2018-04-09 05:44:31'),
(16, 2, 23, 3, 'dolor ratione doloribus deserunt et.', '2018-01-16 20:18:39'),
(17, 2, 25, 4, 'vero dolorem et architecto.', '2018-04-10 12:18:25'),
(18, 2, 26, 5, 'deleniti sint repellendus dolores enim consectetur labore at!', '2018-03-16 06:31:52'),
(19, 3, 2, 4, 'qui vel blanditiis!', '2018-03-16 14:19:06'),
(20, 3, 3, 2, 'facilis omnis et consequatur omnis qui dolor!', '2018-02-07 09:18:21'),
(21, 3, 4, 2, 'dolores molestiae et.', '2018-01-06 23:10:24'),
(22, 3, 5, 2, 'voluptatem et inventore omnis consequatur dolorem et odit.', '2018-02-05 21:37:59'),
(23, 3, 6, 2, 'expedita error consectetur praesentium aut!', '2018-03-20 22:27:37'),
(24, 3, 8, 4, 'rerum ut iusto eaque quo eos distinctio labore repellendus.', '2018-01-27 10:10:55'),
(25, 3, 10, 4, 'sed doloribus aspernatur unde placeat et illum.', '2018-02-01 13:36:59'),
(26, 3, 12, 4, 'ipsum non et et.', '2018-02-03 22:13:08'),
(27, 3, 14, 5, 'quibusdam quo nobis nostrum voluptatibus.', '2018-03-28 00:45:43'),
(28, 3, 17, 4, 'ullam et sint consequatur laudantium repudiandae minima et.', '2018-02-21 15:36:57'),
(29, 3, 18, 3, 'vitae magni et qui quasi.', '2018-04-26 18:43:52'),
(30, 3, 19, 3, 'incidunt aut soluta ut!', '2018-01-13 12:59:40'),
(31, 3, 22, 2, 'deleniti omnis libero laborum dolorem quidem.', '2018-03-19 06:07:21'),
(32, 3, 24, 1, 'occaecati necessitatibus eos quasi.', '2018-02-07 17:37:48'),
(33, 3, 25, 1, 'minus pariatur velit quaerat aut neque.', '2018-03-21 21:09:39'),
(34, 3, 27, 2, 'repellat est corrupti non.', '2018-03-28 08:17:02'),
(35, 4, 1, 3, 'tenetur expedita nostrum qui illum necessitatibus.', '2018-01-17 05:56:04'),
(36, 4, 6, 2, 'voluptatem officiis suscipit autem illo in!', '2018-03-17 08:35:29'),
(37, 4, 7, 1, 'recusandae dolorem tempora omnis.', '2018-02-26 17:59:48'),
(38, 4, 10, 3, 'ipsa porro in et voluptates earum.', '2018-02-08 07:49:03'),
(39, 4, 11, 1, 'ea explicabo ut perferendis optio.', '2018-03-26 19:38:49'),
(40, 4, 16, 5, 'sed odit inventore praesentium.', '2018-03-29 04:58:22'),
(41, 4, 21, 2, 'unde in ab consectetur repudiandae enim!', '2018-04-11 11:12:10'),
(42, 4, 23, 2, 'esse aperiam aperiam deserunt dignissimos eligendi quis!', '2018-03-03 13:02:31'),
(43, 4, 26, 2, 'suscipit fugiat accusantium omnis dolores.', '2018-02-23 09:21:40'),
(44, 5, 1, 3, 'in nihil optio suscipit accusantium alias saepe quibusdam aliquid.', '2018-04-16 12:33:56'),
(45, 5, 3, 3, 'nostrum amet voluptatibus voluptatibus vitae modi architecto et.', '2018-03-01 04:21:24'),
(46, 5, 7, 2, 'voluptatem molestiae ducimus quasi earum laborum commodi.', '2018-02-04 11:44:57'),
(47, 5, 10, 3, 'eos odit facere exercitationem sed.', '2018-02-07 15:14:04'),
(48, 5, 12, 5, 'necessitatibus et maiores ex fuga et officiis atque.', '2018-04-24 22:36:26'),
(49, 5, 13, 1, 'fuga qui magnam illo suscipit est quae.', '2018-04-09 11:16:29'),
(50, 5, 19, 1, 'ut vel et facere amet ipsum.', '2018-02-17 20:20:50'),
(51, 5, 21, 4, 'nam sunt magnam est.', '2018-01-29 22:18:00'),
(52, 5, 23, 1, 'animi laudantium unde in exercitationem.', '2018-01-08 02:10:40'),
(53, 6, 1, 1, 'esse eligendi quae et aut quis.', '2018-04-16 17:54:25'),
(54, 6, 2, 3, 'maiores dignissimos dolores tenetur.', '2018-01-06 21:58:33'),
(55, 6, 5, 4, 'exercitationem voluptatem eveniet omnis rem.', '2018-02-22 22:25:35'),
(56, 6, 6, 5, 'quo ut ullam distinctio.', '2018-01-10 01:32:31'),
(57, 6, 9, 2, 'dolores laudantium alias occaecati rerum quam!', '2018-01-24 15:59:27'),
(58, 6, 10, 3, 'aliquid vitae minus maiores iure doloribus dignissimos!', '2018-01-29 14:04:02'),
(59, 6, 15, 1, 'rem autem dolores et quis nulla eum.', '2018-03-28 02:15:00'),
(60, 6, 18, 1, 'vel pariatur est aut voluptas quae.', '2018-02-09 10:51:55'),
(61, 6, 19, 5, 'enim sint reprehenderit saepe vero quas.', '2018-02-11 02:11:14'),
(62, 6, 22, 2, 'mollitia assumenda aut asperiores.', '2018-01-05 19:57:32'),
(63, 6, 24, 4, 'magnam ut at dolorem sapiente perspiciatis et.', '2018-02-01 07:21:54'),
(64, 6, 27, 1, 'et quia illo quasi.', '2018-02-22 04:48:07'),
(65, 7, 2, 3, 'labore earum sit.', '2018-01-28 07:48:48'),
(66, 7, 5, 1, 'commodi et delectus totam tempora reiciendis.', '2018-03-16 17:17:27'),
(67, 7, 8, 5, 'minima mollitia cupiditate voluptate mollitia praesentium.', '2018-04-18 10:14:25'),
(68, 7, 9, 4, 'soluta laudantium cupiditate et illo nisi voluptatem illum.', '2018-04-13 17:08:48'),
(69, 7, 11, 5, 'id eius temporibus quam quod mollitia vitae ea eos natus.', '2018-04-28 12:41:07'),
(70, 7, 13, 2, 'eum earum velit quidem rerum.', '2018-03-31 12:17:17'),
(71, 7, 15, 3, 'asperiores cumque dicta repudiandae suscipit.', '2018-04-05 01:16:29'),
(72, 7, 20, 3, 'ex quis illum dolor repudiandae ut natus incidunt.', '2018-02-03 15:56:41'),
(73, 7, 21, 2, 'dolorum et voluptate blanditiis est.', '2018-01-14 17:58:13'),
(74, 7, 23, 4, 'inventore hic et iusto accusantium est.', '2018-03-18 06:17:41'),
(75, 8, 3, 5, 'quisquam consequuntur est quam tempore dolor facilis voluptate.', '2018-03-07 22:59:27'),
(76, 8, 5, 3, 'error blanditiis iusto.', '2018-03-24 08:15:43'),
(77, 8, 7, 4, 'et veritatis libero quaerat enim iure rem saepe.', '2018-01-27 03:05:37'),
(78, 8, 8, 4, 'consectetur earum reprehenderit rerum a consectetur neque.', '2018-04-17 05:24:44'),
(79, 8, 12, 2, 'dicta non nulla explicabo.', '2018-02-12 00:08:01'),
(80, 8, 14, 2, 'sequi enim blanditiis consequatur.', '2018-04-24 07:10:24'),
(81, 8, 20, 5, 'necessitatibus accusantium omnis qui sit autem quas unde qui.', '2018-01-14 05:53:34'),
(82, 8, 21, 1, 'aspernatur cum quas quia sit.', '2018-04-08 13:43:27'),
(83, 8, 24, 3, 'nulla architecto rem.', '2018-01-07 00:42:29'),
(84, 8, 25, 2, 'quaerat minus non molestiae quo.', '2018-03-22 02:07:13'),
(85, 8, 26, 1, 'ratione magni et possimus deleniti exercitationem ut blanditiis porro omnis pariatur.', '2018-04-10 08:29:24');

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
-- Table structure for table `public_holidays`
--

CREATE TABLE `public_holidays` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `public_holidays`
--

INSERT INTO `public_holidays` (`id`, `date`, `description`) VALUES
(1, '2018-07-14', 'National Day'),
(2, '2018-11-11', 'Armistice Day');

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
(2, 1, 7),
(2, 2, 50),
(2, 3, 600),
(3, 1, 7),
(3, 2, 30),
(3, 3, 350),
(4, 1, 5),
(4, 2, 20),
(4, 3, 500),
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
(9, 3, 600),
(10, 1, 6),
(10, 2, 30),
(10, 3, 350),
(11, 1, 50),
(11, 2, 250),
(11, 3, 3000);

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
(7, 'Jane', 'Doe', 'M', 'viloshna.sonoo@gmail.com', '1234567890', 43.6052, 1.432664, '', 1, 0),
(8, 'Brandon', 'Ferguson', 'M', 'dolore_nihil_tempora@Oyoloo.mil', '1-030-692-85-59', 43.5967, 1.4917, 'messi.jpg', 12, 1),
(9, 'Keith', 'Gardner', 'F', 'sFox@Rhycero.gov', '3-965-802-90-26', 43.57, 1.4194, 'ian.jpg', 7, 1),
(10, 'Joshua', 'Simmons', 'F', 'xFord@Babbleopia.name', '3-896-020-64-38', 43.5105, 1.3819, 'kaka.jpg', 5, 1),
(11, 'Janet', 'Larson', 'F', 'optio@Jabberbean.org', '9-043-621-03-68', 43.5481, 1.4321, 'deepika.jpg', 3, 1),
(12, 'Martha', 'Sanders', 'F', 'AmandaGray@Shuffledrive.mil', '340-18-24', 43.5343, 1.4133, 'nina.jpg', 5, 1),
(13, 'Jimmy', 'Carter', 'F', 'consequuntur@Twitterbeat.net', '672-53-62', 43.575, 1.3996, '', 6, 1),
(14, 'Denise', 'Baker', 'F', 'eius@Feedspan.edu', '6-705-549-88-81', 43.6087, 1.3906, 'blake.jpg', 12, 1),
(15, 'Marie', 'Kennedy', 'F', 'vAdams@Ntag.info', '9-218-594-58-75', 43.5577, 1.4399, 'priyanka.jpg', 11, 1),
(16, 'Evelyn', 'Baker', 'M', 'DianeRoberts@Youopia.com', '910-90-34', 43.5469, 1.4016, 'beckham.jpg', 3, 1),
(17, 'Kelly', 'Boyd', 'M', 'AlicePatterson@Ozu.com', '616-68-06', 43.5331, 1.4811, 'megan.jpg', 4, 1),
(18, 'Ernest', 'Ramos', 'M', 'tempore@Ainyx.gov', '6-012-300-96-49', 43.5838, 1.364, '', 12, 1),
(19, 'John', 'Hicks', 'F', 'jRodriguez@Einti.org', '2-661-261-34-09', 43.5972, 1.4965, '', 9, 1),
(20, 'Jerry', 'Arnold', 'M', 'qCampbell@Linktype.net', '773-07-09', 43.5952, 1.3683, '', 10, 1),
(21, 'Charles', 'Webb', 'M', 'LoisWright@Oloo.mil', '1-365-337-06-84', 43.5482, 1.3843, '', 11, 1),
(22, 'Charles', 'Myers', 'M', 'id_velit@Fivechat.edu', '048-50-28', 43.5871, 1.399, '', 2, 1),
(23, 'Kenneth', 'Olson', 'F', 'dolore_voluptatibus@Wordify.net', '086-24-48', 43.5849, 1.3955, 'victoria.jpg', 5, 1),
(24, 'Johnny', 'Peters', 'M', 'WandaJohnson@Meemm.org', '556-96-48', 43.6262, 1.4107, 'ed.jpg', 10, 1),
(25, 'Timothy', 'Torres', 'M', 'VirginiaOlson@Jamia.net', '1-469-387-37-44', 43.5475, 1.4852, '', 4, 1),
(26, 'Howard', 'Garrett', 'M', 'tWagner@Rhyzio.org', '063-95-17', 43.6563, 1.3704, '', 9, 1),
(27, 'Kenneth', 'Ross', 'M', 'nihil@Kanoodle.mil', '8-894-572-56-38', 43.609, 1.3938, '', 12, 1);

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
-- Indexes for table `hub_availability`
--
ALTER TABLE `hub_availability`
  ADD PRIMARY KEY (`hub_id`,`startDate`,`endDate`);

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
-- Indexes for table `public_holidays`
--
ALTER TABLE `public_holidays`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `hubs`
--
ALTER TABLE `hubs`
  MODIFY `hub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `hub_reviews`
--
ALTER TABLE `hub_reviews`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `public_holidays`
--
ALTER TABLE `public_holidays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `spaces`
--
ALTER TABLE `spaces`
  MODIFY `space_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
-- Constraints for table `hub_availability`
--
ALTER TABLE `hub_availability`
  ADD CONSTRAINT `FOREIGN_KEY_HUB_AVAILABILITY` FOREIGN KEY (`hub_id`) REFERENCES `hubs` (`hub_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
