-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Sep 11, 2023 at 09:36 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gp_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
CREATE TABLE IF NOT EXISTS `appointments` (
  `AppointmentID` varchar(10) NOT NULL,
  `PatientID` varchar(10) NOT NULL,
  `GMCNumber` varchar(10) NOT NULL,
  `AppointmentDateTime` datetime DEFAULT NULL,
  `DayOfApt` varchar(10) DEFAULT NULL,
  `IsPatientRegWithDoc` tinyint(1) DEFAULT NULL,
  `ReasonForVisit` varchar(350) DEFAULT NULL,
  PRIMARY KEY (`AppointmentID`,`PatientID`,`GMCNumber`),
  KEY `PatientID` (`PatientID`),
  KEY `GMCNumber` (`GMCNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`AppointmentID`, `PatientID`, `GMCNumber`, `AppointmentDateTime`, `DayOfApt`, `IsPatientRegWithDoc`, `ReasonForVisit`) VALUES
('APT48313', 'PD005678', 'DOC87657', '2023-03-03 10:00:00', 'Friday', 0, 'headache'),
('APT48314', 'PD005679', 'DOC87656', '2023-03-07 17:00:00', 'Tuesday', 1, 'fever, bodyaches and headaches\r\n'),
('APT48315', 'PD005680', 'DOC87657', '2023-03-07 17:00:00', 'Tuesday', 1, 'diabetics check\r\n'),
('APT48316', 'PD005681', 'DOC87657', '2023-03-04 10:00:00', 'Saturday', 1, 'skin allergy\r\n'),
('APT48317', 'PD005682', 'DOC87656', '2023-03-03 11:00:00', 'Friday', 1, 'dental infection\r\n'),
('APT48318', 'PD005683', 'DOC87654', '2021-03-03 14:00:00', 'Wednesday', 1, 'toothache\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis`
--

DROP TABLE IF EXISTS `diagnosis`;
CREATE TABLE IF NOT EXISTS `diagnosis` (
  `DiagnosisID` varchar(10) NOT NULL,
  `AppointmentID` varchar(10) NOT NULL,
  `CurrentMedication` varchar(150) DEFAULT NULL,
  `RecentCondition` varchar(200) DEFAULT NULL,
  `Allergies` varchar(200) DEFAULT NULL,
  `TreatmentPlan` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`DiagnosisID`,`AppointmentID`),
  KEY `AppointmentID` (`AppointmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `diagnosis`
--

INSERT INTO `diagnosis` (`DiagnosisID`, `AppointmentID`, `CurrentMedication`, `RecentCondition`, `Allergies`, `TreatmentPlan`) VALUES
('DID65436', 'APT48313', 'Codeine', 'Migraines', 'nuts, eggs', 'medication and  t-SNS'),
('DID65437', 'APT48314', NULL, NULL, NULL, NULL),
('DID65438', 'APT48315', NULL, NULL, 'shellfish', NULL),
('DID65439', 'APT48316', 'Hydrocortisone', 'contact dermatitis', 'penicillin', 'apply the emollient '),
('DID65440', 'APT48317', NULL, NULL, NULL, NULL),
('DID65441', 'APT48318', 'Co-codamol', 'Toothache', NULL, 'referred to dentist');

-- --------------------------------------------------------

--
-- Table structure for table `doctorrecords`
--

DROP TABLE IF EXISTS `doctorrecords`;
CREATE TABLE IF NOT EXISTS `doctorrecords` (
  `GMCNumber` varchar(10) NOT NULL,
  `DoctorName` varchar(100) NOT NULL,
  `Speciality` varchar(50) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `EmailAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`GMCNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doctorrecords`
--

INSERT INTO `doctorrecords` (`GMCNumber`, `DoctorName`, `Speciality`, `PhoneNumber`, `EmailAddress`) VALUES
('DOC87654', 'Dr Davids', 'General Practice', '0404-381-2981', 'drdavids@abc-reg.co.uk'),
('DOC87655', 'Dr King', 'Dermatology', '0278-999-9864', 'dr_king@hotmail.com'),
('DOC87656', 'Dr Jenkins', 'Palliative Medicine', '0477-184-9606', 'drjenkins@live.com'),
('DOC87657', 'Dr Jones', 'Diabetes management', '0961-240-6554', 'drjones@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `patientdoctorjoin`
--

DROP TABLE IF EXISTS `patientdoctorjoin`;
CREATE TABLE IF NOT EXISTS `patientdoctorjoin` (
  `PatientID` varchar(10) NOT NULL,
  `GMCNumber` varchar(10) NOT NULL,
  PRIMARY KEY (`PatientID`,`GMCNumber`),
  KEY `GMCNumber` (`GMCNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patientdoctorjoin`
--

INSERT INTO `patientdoctorjoin` (`PatientID`, `GMCNumber`) VALUES
('PD005678', 'DOC87654'),
('PD005680', 'DOC87654'),
('PD005683', 'DOC87654'),
('PD005678', 'DOC87655'),
('PD005679', 'DOC87655'),
('PD005682', 'DOC87655'),
('PD005683', 'DOC87655'),
('PD005679', 'DOC87656'),
('PD005681', 'DOC87656'),
('PD005682', 'DOC87656'),
('PD005680', 'DOC87657'),
('PD005681', 'DOC87657');

-- --------------------------------------------------------

--
-- Table structure for table `patientrecords`
--

DROP TABLE IF EXISTS `patientrecords`;
CREATE TABLE IF NOT EXISTS `patientrecords` (
  `PatientID` varchar(10) NOT NULL,
  `PatientName` varchar(100) NOT NULL,
  `PatientAddress` varchar(250) NOT NULL,
  `PatientDOB` date NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `EmailAddress` varchar(50) DEFAULT NULL,
  `RegisteredDate` date NOT NULL,
  PRIMARY KEY (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patientrecords`
--

INSERT INTO `patientrecords` (`PatientID`, `PatientName`, `PatientAddress`, `PatientDOB`, `PhoneNumber`, `EmailAddress`, `RegisteredDate`) VALUES
('PD005678', 'Jenna Smith', '23 Smart Lane, Newtown FK40 1DD', '1970-04-27', '01234 567890', 'jennasmith@cbs.com', '2004-01-31'),
('PD005679', 'Frank Jones', '73 Dunstable Road, Newtown FK40 4AW', '1980-12-06', '01234 976543', 'jonesfrank@wix.com', '2004-05-05'),
('PD005680', 'Tracy Nguyen', '1 Summer Crescent, Newtown FK40 7BS', '1973-07-08', '01234 876456', 'tracynguyen@nba.com', '2004-06-30'),
('PD005681', 'Joan Jett', '67 Black Street, Newtown FK40 7JK', '1972-01-06', '01234 566478', 'joan@slashdot.org', '2004-07-10'),
('PD005682', 'Frank Jones', '73 Dunstable Road, Newtown FK40 4AW', '2008-06-17', '01234 976543', 'frankjones1@wisc.edu', '2004-09-15'),
('PD005683', 'Karen Norman', '1 Hedge Road, Newtown FK40 3GT', '1989-12-31', '01234 334467', 'karen@live.com', '2005-11-30');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
CREATE TABLE IF NOT EXISTS `prescription` (
  `PrescriptionID` varchar(10) NOT NULL,
  `DiagnosisID` varchar(10) NOT NULL,
  `MedicationName` varchar(80) DEFAULT NULL,
  `Dosage` int(15) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  PRIMARY KEY (`PrescriptionID`,`DiagnosisID`),
  KEY `DiagnosisID` (`DiagnosisID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`PrescriptionID`, `DiagnosisID`, `MedicationName`, `Dosage`, `StartDate`, `EndDate`) VALUES
('P456', 'DID65436', 'Triptan, Ibuprofen', 40, '2023-03-03', '2023-03-08'),
('P457', 'DID65437', NULL, NULL, NULL, NULL),
('P458', 'DID65438', NULL, NULL, NULL, NULL),
('P459', 'DID65439', 'Benadryl, Zyrtec', 30, '2023-03-04', '2023-03-10'),
('P460', 'DID65440', NULL, NULL, NULL, NULL),
('P461', 'DID65441', 'anaesthetic gel, Hydrogen Peroxide Rinse', 60, '2023-03-03', '2023-03-08');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patientrecords` (`PatientID`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`GMCNumber`) REFERENCES `doctorrecords` (`GMCNumber`);

--
-- Constraints for table `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD CONSTRAINT `diagnosis_ibfk_1` FOREIGN KEY (`AppointmentID`) REFERENCES `appointments` (`AppointmentID`);

--
-- Constraints for table `patientdoctorjoin`
--
ALTER TABLE `patientdoctorjoin`
  ADD CONSTRAINT `patientdoctorjoin_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patientrecords` (`PatientID`),
  ADD CONSTRAINT `patientdoctorjoin_ibfk_2` FOREIGN KEY (`GMCNumber`) REFERENCES `doctorrecords` (`GMCNumber`);

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`DiagnosisID`) REFERENCES `diagnosis` (`DiagnosisID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
