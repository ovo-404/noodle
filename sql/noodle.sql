-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 10, 2020 at 10:26 AM
-- Server version: 8.0.20
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `noodle`
--

-- --------------------------------------------------------

--
-- Table structure for table `Admin`
--

CREATE TABLE `Admin` (
  `id` int NOT NULL,
  `admin_id` varchar(256) NOT NULL,
  `name` varchar(256) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(256) NOT NULL,
  `mobile` int NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `image_url` varchar(256) DEFAULT NULL,
  `start_date` timestamp NOT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `last_login` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Course`
--

CREATE TABLE `Course` (
  `id` int NOT NULL,
  `course_id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `credit` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Programme`
--

CREATE TABLE `Programme` (
  `id` int NOT NULL,
  `programme_id` varchar(256) NOT NULL,
  `name` varchar(256) NOT NULL,
  `credit` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ProgrammeCourse`
--

CREATE TABLE `ProgrammeCourse` (
  `Courseid` int NOT NULL,
  `Programmeid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE `Student` (
  `id` int NOT NULL,
  `student_id` int NOT NULL,
  `name` varchar(256) NOT NULL,
  `gender` varchar(10) NOT NULL DEFAULT 'male',
  `address` varchar(256) NOT NULL,
  `mobile` int NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `image_url` varchar(256) DEFAULT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `Programmeid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `StudentCourse`
--

CREATE TABLE `StudentCourse` (
  `Studentid` int NOT NULL,
  `Courseid` int NOT NULL,
  `start_date` timestamp NOT NULL,
  `end_date` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Teacher`
--

CREATE TABLE `Teacher` (
  `id` int NOT NULL,
  `teacher_id` varchar(256) NOT NULL,
  `name` varchar(256) NOT NULL,
  `gender` varchar(10) NOT NULL DEFAULT 'male',
  `address` varchar(256) NOT NULL,
  `mobile` int NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `image_url` varchar(256) DEFAULT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `TeacherCourse`
--

CREATE TABLE `TeacherCourse` (
  `Teacherid` int NOT NULL,
  `Courseid` int NOT NULL,
  `end_date` timestamp NOT NULL,
  `start_date` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_id` (`admin_id`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `Course`
--
ALTER TABLE `Course`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `course_id` (`course_id`);

--
-- Indexes for table `Programme`
--
ALTER TABLE `Programme`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `programme_id` (`programme_id`);

--
-- Indexes for table `ProgrammeCourse`
--
ALTER TABLE `ProgrammeCourse`
  ADD PRIMARY KEY (`Courseid`,`Programmeid`),
  ADD KEY `FKProgrammeC413302` (`Programmeid`);

--
-- Indexes for table `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_id` (`student_id`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `FKStudent92946` (`Programmeid`);

--
-- Indexes for table `StudentCourse`
--
ALTER TABLE `StudentCourse`
  ADD PRIMARY KEY (`Studentid`,`Courseid`),
  ADD KEY `FKStudentCou18286` (`Courseid`);

--
-- Indexes for table `Teacher`
--
ALTER TABLE `Teacher`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teacher_id` (`teacher_id`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `TeacherCourse`
--
ALTER TABLE `TeacherCourse`
  ADD PRIMARY KEY (`Teacherid`,`Courseid`),
  ADD KEY `FKTeacherCou652336` (`Courseid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Admin`
--
ALTER TABLE `Admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Course`
--
ALTER TABLE `Course`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Programme`
--
ALTER TABLE `Programme`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Student`
--
ALTER TABLE `Student`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Teacher`
--
ALTER TABLE `Teacher`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ProgrammeCourse`
--
ALTER TABLE `ProgrammeCourse`
  ADD CONSTRAINT `FKProgrammeC413302` FOREIGN KEY (`Programmeid`) REFERENCES `Programme` (`id`),
  ADD CONSTRAINT `FKProgrammeC741956` FOREIGN KEY (`Courseid`) REFERENCES `Course` (`id`);

--
-- Constraints for table `Student`
--
ALTER TABLE `Student`
  ADD CONSTRAINT `FKStudent92946` FOREIGN KEY (`Programmeid`) REFERENCES `Programme` (`id`);

--
-- Constraints for table `StudentCourse`
--
ALTER TABLE `StudentCourse`
  ADD CONSTRAINT `FKStudentCou18286` FOREIGN KEY (`Courseid`) REFERENCES `Course` (`id`),
  ADD CONSTRAINT `FKStudentCou24642` FOREIGN KEY (`Studentid`) REFERENCES `Student` (`id`);

--
-- Constraints for table `TeacherCourse`
--
ALTER TABLE `TeacherCourse`
  ADD CONSTRAINT `FKTeacherCou295980` FOREIGN KEY (`Teacherid`) REFERENCES `Teacher` (`id`),
  ADD CONSTRAINT `FKTeacherCou652336` FOREIGN KEY (`Courseid`) REFERENCES `Course` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
