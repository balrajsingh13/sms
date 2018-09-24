-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: jwt
-- ------------------------------------------------------
-- Server version	5.7.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `courseMasters`
--

DROP TABLE IF EXISTS `courseMasters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseMasters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `fee` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseMasters`
--

LOCK TABLES `courseMasters` WRITE;
/*!40000 ALTER TABLE `courseMasters` DISABLE KEYS */;
INSERT INTO `courseMasters` VALUES (1,'full-stack',25000),(2,'bigdata',50000),(3,'machine-learning',65000),(4,'java',10000);
/*!40000 ALTER TABLE `courseMasters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleMasters`
--

DROP TABLE IF EXISTS `roleMasters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roleMasters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleMasters`
--

LOCK TABLES `roleMasters` WRITE;
/*!40000 ALTER TABLE `roleMasters` DISABLE KEYS */;
INSERT INTO `roleMasters` VALUES (1,'Student'),(2,'Admin');
/*!40000 ALTER TABLE `roleMasters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(555) NOT NULL,
  `course_id` int(11) NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courseMasters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (12,'Tan','tan29@gmail.com','$2y$10$dN0GdSJlG50R5BE0RDJcquyYJQEeXQ44B3znYCqxBaZvpOKZIrLhC',4,'2018-09-24 07:03:16','2018-09-24 07:03:16'),(13,'Gaurav','gaurav29@gmail.com','$2y$10$sZ0gCvE5IeXt6cvU7Fp35.vN1Jhj8qYvLcEFAmu/QxfPQg06GwCV.',4,'2018-09-24 10:55:03','2018-09-24 10:55:03');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(555) NOT NULL,
  `role_id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roleMasters` (`id`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courseMasters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Dashmeet','dashmeetkaur29@gmail.com','$2y$10$ftNrHoJjyV0iMk2Jp8e2qOOAOxGusacXmY8NbalugDnniBOgLUASi',2,2,'2018-09-24 12:18:45','2018-09-24 12:19:00'),(4,'Tan','tan29@gmail.com','$2y$10$dN0GdSJlG50R5BE0RDJcquyYJQEeXQ44B3znYCqxBaZvpOKZIrLhC',1,NULL,'2018-09-24 12:33:16','2018-09-24 12:33:16'),(5,'Gaurav','gaurav29@gmail.com','$2y$10$sZ0gCvE5IeXt6cvU7Fp35.vN1Jhj8qYvLcEFAmu/QxfPQg06GwCV.',1,NULL,'2018-09-24 16:25:03','2018-09-24 16:25:03');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-24 18:11:17
