-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 19. Dez 2019 um 21:56
-- Server-Version: 10.4.10-MariaDB
-- PHP-Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr05_markus_gehmayer_carrental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `account`
--

CREATE TABLE `account` (
  `acount_id` int(11) NOT NULL,
  `fk_usr_id` int(11) DEFAULT NULL,
  `fk_payment_id` int(11) DEFAULT NULL,
  `fk_admin_id` int(11) DEFAULT NULL,
  `account_created` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `account`
--

INSERT INTO `account` (`acount_id`, `fk_usr_id`, `fk_payment_id`, `fk_admin_id`, `account_created`) VALUES
(1, 1, 3, 2, '2019-01-07'),
(2, 2, 2, 1, '2019-02-07'),
(3, 3, 2, 4, '2019-03-07'),
(4, 4, 3, 5, '2019-04-07');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `admin_car`
--

CREATE TABLE `admin_car` (
  `admin_id` int(11) NOT NULL,
  `admin_first_name` varchar(55) DEFAULT NULL,
  `admin_last_name` varchar(55) DEFAULT NULL,
  `admin_phone` int(11) DEFAULT NULL,
  `admin_email` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `admin_car`
--

INSERT INTO `admin_car` (`admin_id`, `admin_first_name`, `admin_last_name`, `admin_phone`, `admin_email`) VALUES
(1, 'Mex', 'Power', 1234567, 'mexpower@email.com'),
(2, 'John', 'Mohn', 7654321, 'mohn@gmail.com'),
(3, 'Max', 'Maximum', 1234567, 'maximum@gmx.com'),
(4, 'Lina', 'Grundberger', 7654321, 'linag@gmx.at'),
(5, 'The', 'Rock', 1234567, 'therock@smashes.uu');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car_park`
--

CREATE TABLE `car_park` (
  `car_id` int(11) NOT NULL,
  `car_mod` varchar(55) DEFAULT NULL,
  `car_type` varchar(55) DEFAULT NULL,
  `car_HP` int(11) DEFAULT NULL,
  `init_milage` int(11) DEFAULT NULL,
  `car_year` year(4) DEFAULT NULL,
  `year_bought` year(4) DEFAULT NULL,
  `available` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `car_park`
--

INSERT INTO `car_park` (`car_id`, `car_mod`, `car_type`, `car_HP`, `init_milage`, `car_year`, `year_bought`, `available`) VALUES
(1, 'Audi', 'A3', 124, 45688, 2008, 2012, 0),
(2, 'BMW', '3er', 133, 33000, 2009, 2014, 1),
(3, 'Volvo', 'E300', 88, 199000, 2001, 2017, 1),
(4, 'Ford', 'Focus', 100, 90000, 2010, 2017, 1),
(5, 'Porsche', '911', 240, 12000, 2019, 2019, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `contract`
--

CREATE TABLE `contract` (
  `contract_id` int(11) NOT NULL,
  `fk_inq_id` int(11) DEFAULT NULL,
  `fk_admin_id` int(11) DEFAULT NULL,
  `contract_date` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `contract`
--

INSERT INTO `contract` (`contract_id`, `fk_inq_id`, `fk_admin_id`, `contract_date`) VALUES
(1, 1, 1, '2019-12-19'),
(2, 2, 2, '2019-12-19'),
(3, 3, 4, '2019-12-19'),
(4, 4, 5, '2019-12-19');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `end_loc`
--

CREATE TABLE `end_loc` (
  `end_loc_id` int(11) NOT NULL,
  `address_el` varchar(55) DEFAULT NULL,
  `pick_up_date` date DEFAULT NULL,
  `milage_end` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `end_loc`
--

INSERT INTO `end_loc` (`end_loc_id`, `address_el`, `pick_up_date`, `milage_end`) VALUES
(1, 'DROPOFF1', '0000-00-00', 999999),
(2, 'DROPOFF2', '2020-01-20', 999999),
(3, 'DROPOFF3', '2020-02-20', 888888),
(4, 'DROPOFF4', '2020-03-20', 777777);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `inquiry`
--

CREATE TABLE `inquiry` (
  `inq_id` int(11) NOT NULL,
  `fk_account_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `usr_pick_up_date` date DEFAULT NULL,
  `usr_drop_off_date` date DEFAULT NULL,
  `fk_start_loc_id` int(11) DEFAULT NULL,
  `fk_end_loc_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `inquiry`
--

INSERT INTO `inquiry` (`inq_id`, `fk_account_id`, `fk_car_id`, `usr_pick_up_date`, `usr_drop_off_date`, `fk_start_loc_id`, `fk_end_loc_id`) VALUES
(1, 1, 2, '2019-03-23', '2019-03-30', 1, 2),
(2, 2, 3, '2019-02-23', '2019-02-25', 2, 1),
(3, 3, 3, '2019-05-18', '2019-05-22', 1, 2),
(4, 4, 5, '2019-06-07', '2019-06-13', 2, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `fk_report_id` int(11) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `invoice_amount` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `fk_report_id`, `invoice_date`, `invoice_amount`) VALUES
(1, 1, '2018-05-23', 899),
(2, 2, '2016-02-23', 233),
(3, 3, '2015-03-23', 1189),
(4, 4, '2017-02-23', 678);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `locations`
--

CREATE TABLE `locations` (
  `loc_id` int(11) NOT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_start_loc_id` int(11) DEFAULT NULL,
  `fk_end_loc_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `locations`
--

INSERT INTO `locations` (`loc_id`, `fk_car_id`, `fk_start_loc_id`, `fk_end_loc_id`) VALUES
(1, 1, 2, 4),
(2, 2, 1, 3),
(3, 5, 3, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `fk_invoice_id` int(11) DEFAULT NULL,
  `first_payment` date DEFAULT NULL,
  `last_payment` date DEFAULT NULL,
  `first_payment_amount` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `payment`
--

INSERT INTO `payment` (`payment_id`, `fk_invoice_id`, `first_payment`, `last_payment`, `first_payment_amount`) VALUES
(1, 1, '2016-01-11', '2016-02-20', 600),
(2, 2, '2017-02-14', '2017-02-20', 123),
(3, 3, '2019-01-24', '2019-01-25', 40),
(4, 4, '2019-05-22', '2019-06-28', 987);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `report`
--

CREATE TABLE `report` (
  `report_id` int(11) NOT NULL,
  `fk_contract_id` int(11) DEFAULT NULL,
  `fk_loc_id` int(11) DEFAULT NULL,
  `milage_total` int(11) DEFAULT NULL,
  `milage_driven` int(11) DEFAULT NULL,
  `date_returned` date DEFAULT NULL,
  `demage` tinyint(1) DEFAULT NULL,
  `demage_name` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `report`
--

INSERT INTO `report` (`report_id`, `fk_contract_id`, `fk_loc_id`, `milage_total`, `milage_driven`, `date_returned`, `demage`, `demage_name`) VALUES
(1, 2, 3, 22000, 456, '2019-05-06', 0, 'none'),
(2, 1, 4, 23000, 200, '2019-02-21', 1, 'little crash'),
(3, 3, 1, 27000, 999, '2019-06-30', 0, 'none');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `start_loc`
--

CREATE TABLE `start_loc` (
  `start_loc_id` int(11) NOT NULL,
  `address_sl` varchar(55) DEFAULT NULL,
  `pick_up_date` date DEFAULT NULL,
  `milage_start` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `start_loc`
--

INSERT INTO `start_loc` (`start_loc_id`, `address_sl`, `pick_up_date`, `milage_start`) VALUES
(1, 'Kettenbrückengasse', '2019-05-16', 13456),
(2, 'Karlsplatz', '2019-06-13', 48098),
(3, 'Kagran', '2019-07-23', 31356),
(4, 'Hernals', '2019-08-20', 16689);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `usr_id` int(11) NOT NULL,
  `usr_first_name` varchar(55) DEFAULT NULL,
  `usr_last_name` varchar(55) DEFAULT NULL,
  `usr_birth_date` date DEFAULT NULL,
  `usr_address` varchar(55) DEFAULT NULL,
  `usr_country` varchar(55) DEFAULT NULL,
  `usr_email` varchar(55) DEFAULT NULL,
  `usr_phone` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`usr_id`, `usr_first_name`, `usr_last_name`, `usr_birth_date`, `usr_address`, `usr_country`, `usr_email`, `usr_phone`) VALUES
(1, 'Mex', 'Power', '1990-11-11', 'Somewhere 34', 'Austria', 'mexpower@gmail.com', 2147483647),
(2, 'Lina', 'Bauer', '1967-11-21', 'Somewhere 34', 'Austria', 'lina@gmail.com', 2147483647),
(3, 'Alex', 'Dummy', '1969-05-01', 'Somewhere 12', 'Germany', 'alexdummy@email.com', 676234567),
(4, 'Gustav', 'Gans', '1930-01-01', 'Disneyland', 'Space', 'gustav@gans.com', 680987654),
(5, 'Hermine', 'Granger', '1989-03-01', 'London', 'Great Britain', 'hermine@granger.mail.com', 0);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`acount_id`),
  ADD KEY `fk_usr_id` (`fk_usr_id`),
  ADD KEY `fk_payment_id` (`fk_payment_id`),
  ADD KEY `fk_admin_id` (`fk_admin_id`);

--
-- Indizes für die Tabelle `admin_car`
--
ALTER TABLE `admin_car`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indizes für die Tabelle `car_park`
--
ALTER TABLE `car_park`
  ADD PRIMARY KEY (`car_id`);

--
-- Indizes für die Tabelle `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`contract_id`),
  ADD KEY `fk_inq_id` (`fk_inq_id`),
  ADD KEY `fk_admin_id` (`fk_admin_id`);

--
-- Indizes für die Tabelle `end_loc`
--
ALTER TABLE `end_loc`
  ADD PRIMARY KEY (`end_loc_id`);

--
-- Indizes für die Tabelle `inquiry`
--
ALTER TABLE `inquiry`
  ADD PRIMARY KEY (`inq_id`),
  ADD KEY `fk_account_id` (`fk_account_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_start_loc_id` (`fk_start_loc_id`),
  ADD KEY `fk_end_loc_id` (`fk_end_loc_id`);

--
-- Indizes für die Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_report_id` (`fk_report_id`);

--
-- Indizes für die Tabelle `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`loc_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_start_loc_id` (`fk_start_loc_id`),
  ADD KEY `fk_end_loc_id` (`fk_end_loc_id`);

--
-- Indizes für die Tabelle `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `fk_invoice_id` (`fk_invoice_id`);

--
-- Indizes für die Tabelle `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `fk_contract_id` (`fk_contract_id`),
  ADD KEY `fk_loc_id` (`fk_loc_id`);

--
-- Indizes für die Tabelle `start_loc`
--
ALTER TABLE `start_loc`
  ADD PRIMARY KEY (`start_loc_id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`usr_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `account`
--
ALTER TABLE `account`
  MODIFY `acount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
