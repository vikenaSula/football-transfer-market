CREATE DATABASE  IF NOT EXISTS `footballtransfers` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `footballtransfers`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: footballtransfers
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `owners`
--

DROP TABLE IF EXISTS `owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owners` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK57etajxuwl1com1sb8q3r3sgn` (`user_id`),
  CONSTRAINT `FK57etajxuwl1com1sb8q3r3sgn` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners`
--

LOCK TABLES `owners` WRITE;
/*!40000 ALTER TABLE `owners` DISABLE KEYS */;
INSERT INTO `owners` VALUES (1,'Fc Barcelona President',1),(2,'PSG president',4),(3,'Real Madrid President',11);
/*!40000 ALTER TABLE `owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dob` datetime(6) DEFAULT NULL,
  `market_value` int NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `skills` varchar(255) DEFAULT NULL,
  `team_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5nglidr00c4dyybl171v6kask` (`team_id`),
  KEY `FK3rfv9832bif6rea5edetib8it` (`user_id`),
  CONSTRAINT `FK3rfv9832bif6rea5edetib8it` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK5nglidr00c4dyybl171v6kask` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (2,'1989-03-21 00:00:00.000000',17,'LB','97 PAC 98 DRI 90 SHO 74 DEF 99 PAS 99 PHY',NULL,2),(3,NULL,120,'ST','99 PAC 98 DRI 90 SHO 99 DEF 99 PAS 99 PHY',3,3),(5,'1986-03-30 00:00:00.000000',40,'CB','97 PAC 98 DRI 90 SHO 99 DEF 99 PAS 99 PHY',NULL,5),(6,'1998-12-20 00:00:00.000000',130,'ST','97 PAC 98 DRI 99 SHO 99 DEF 99 PAS 99 PHY',2,6),(7,NULL,200,'ST','99 PAC 99 DRI 99 SHO 99 DEF 99 PAS 99 PHY',3,7),(8,NULL,120,'FW','97 PAC 98 DRI 98 SHO 99 DEF 99 PAS 99 PHY',3,8),(9,'1997-05-12 00:00:00.000000',75,'MD','97 PAC 98 DRI 88 SHO 99 DEF 99 PAS 99 PHY',2,9),(10,'1997-05-15 00:00:00.000000',30,'CO','89 PAC 95 DRI 90 SHO 30 DEF 90 PAS 65 PHY',NULL,10);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requests` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `answer` bit(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `is_seen` bit(1) DEFAULT NULL,
  `sender` bit(1) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `player_id` bigint DEFAULT NULL,
  `team_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKq936b9lg8n30wxvaumx5hcm4w` (`player_id`),
  KEY `FKbrpwkki5gk5b7khysoajmulfx` (`team_id`),
  CONSTRAINT `FKbrpwkki5gk5b7khysoajmulfx` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `FKq936b9lg8n30wxvaumx5hcm4w` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES (1,_binary '','2022-09-09 12:13:06.447000',_binary '',_binary '\0','2022-09-09 19:56:58.985000',2,1),(2,_binary '\0','2022-09-09 12:13:07.919000',_binary '',_binary '\0','2022-09-09 15:26:34.808000',3,1),(3,_binary '','2022-09-09 12:18:28.212000',_binary '',_binary '','2022-09-09 13:13:34.742000',3,1),(4,_binary '','2022-09-09 12:20:54.573000',_binary '',_binary '\0','2022-09-09 15:26:35.574000',3,1),(5,_binary '','2022-09-09 12:51:53.502000',_binary '',_binary '','2022-09-09 16:19:27.317000',3,1),(6,_binary '','2022-09-09 13:06:36.760000',_binary '\0',_binary '\0','2022-09-09 13:14:05.467000',3,2),(7,NULL,'2022-09-09 13:06:38.583000',NULL,_binary '\0',NULL,2,2),(8,_binary '','2022-09-09 13:31:12.717000',_binary '\0',_binary '','2022-09-09 16:22:42.908000',5,2),(9,_binary '','2022-09-09 13:33:55.527000',_binary '\0',_binary '','2022-09-09 15:35:36.223000',6,2),(10,_binary '','2022-09-09 13:33:58.193000',_binary '\0',_binary '','2022-09-09 15:26:28.029000',6,1),(11,_binary '','2022-09-09 13:35:31.094000',_binary '\0',_binary '','2022-09-09 15:26:29.263000',7,1),(12,_binary '','2022-09-09 13:35:32.740000',_binary '\0',_binary '','2022-09-09 16:22:43.913000',7,2),(13,_binary '','2022-09-09 13:36:28.132000',_binary '',_binary '\0','2022-09-09 19:56:59.967000',5,1),(14,_binary '','2022-09-09 15:25:37.984000',_binary '',_binary '','2022-09-09 16:19:28.146000',3,2),(15,_binary '','2022-09-09 15:34:33.774000',_binary '\0',_binary '','2022-09-09 15:35:34.636000',8,2),(16,_binary '','2022-09-09 15:34:36.035000',_binary '\0',_binary '','2022-09-09 15:46:18.528000',8,1),(17,_binary '','2022-09-09 15:40:32.138000',_binary '\0',_binary '','2022-09-09 16:22:45.370000',9,2),(18,_binary '','2022-09-09 15:40:37.534000',_binary '\0',_binary '','2022-09-09 15:46:17.240000',9,1),(19,_binary '\0','2022-09-09 15:45:20.277000',_binary '\0',_binary '','2022-09-09 16:35:03.240000',10,2),(20,_binary '','2022-09-09 15:45:24.868000',_binary '\0',_binary '','2022-09-09 15:46:15.830000',10,1),(21,_binary '','2022-09-09 15:46:23.061000',_binary '\0',_binary '\0','2022-09-09 16:19:24.412000',3,1),(22,NULL,'2022-09-09 15:46:27.922000',NULL,_binary '\0',NULL,6,1),(23,_binary '','2022-09-09 16:02:44.164000',_binary '\0',_binary '\0','2022-09-09 19:42:58.883000',7,3),(24,_binary '','2022-09-09 16:19:50.121000',_binary '',_binary '','2022-09-09 16:37:58.458000',3,3),(25,_binary '\0','2022-09-09 16:19:51.901000',_binary '',_binary '','2022-09-09 16:35:58.574000',3,2),(26,NULL,'2022-09-09 16:20:45.076000',NULL,_binary '\0',NULL,5,3),(27,NULL,'2022-09-09 16:20:45.125000',NULL,_binary '\0',NULL,5,3),(28,NULL,'2022-09-09 16:20:47.363000',NULL,_binary '\0',NULL,6,3),(29,_binary '','2022-09-09 16:21:16.621000',_binary '\0',_binary '\0','2022-09-09 16:52:35.896000',8,1),(30,_binary '','2022-09-09 16:34:39.215000',_binary '',_binary '\0','2022-09-09 19:22:05.288000',8,2),(31,_binary '','2022-09-09 16:38:00.868000',_binary '',_binary '','2022-09-09 16:39:01.119000',3,3),(32,_binary '\0','2022-09-09 16:40:04.175000',_binary '',_binary '','2022-09-09 16:41:18.287000',3,3),(33,_binary '','2022-09-09 16:41:41.286000',_binary '\0',_binary '\0','2022-09-09 16:42:21.644000',3,1),(34,NULL,'2022-09-09 16:51:13.018000',NULL,_binary '',NULL,3,2),(35,_binary '','2022-09-09 17:05:09.211000',_binary '\0',_binary '\0','2022-09-09 17:06:09.895000',3,1),(36,_binary '','2022-09-09 17:05:21.628000',_binary '\0',_binary '\0','2022-09-09 18:44:49.509000',8,1),(37,NULL,'2022-09-09 17:05:28.859000',NULL,_binary '\0',NULL,5,1),(38,_binary '','2022-09-09 17:06:57.411000',_binary '',_binary '','2022-09-09 19:44:49.650000',3,1),(39,_binary '','2022-09-09 18:40:57.172000',_binary '\0',_binary '','2022-09-09 18:48:25.333000',3,3),(40,_binary '','2022-09-09 18:43:08.431000',_binary '',_binary '\0','2022-09-09 18:49:35.879000',8,3),(41,NULL,'2022-09-09 18:44:01.948000',NULL,_binary '\0',NULL,10,3),(42,_binary '','2022-09-09 18:48:28.090000',_binary '',_binary '\0','2022-09-10 12:40:17.505000',2,3),(43,_binary '\0','2022-09-09 19:10:00.819000',_binary '\0',_binary '\0','2022-09-09 19:19:30.391000',3,3),(44,NULL,'2022-09-09 19:15:39.213000',NULL,_binary '',NULL,3,1),(45,_binary '\0','2022-09-09 19:16:37.739000',_binary '\0',_binary '','2022-09-09 22:44:15.678000',8,3),(46,_binary '\0','2022-09-09 19:16:41.740000',_binary '\0',_binary '','2022-09-09 19:22:19.326000',8,2),(47,NULL,'2022-09-09 19:16:44.880000',NULL,_binary '',NULL,8,1),(48,NULL,'2022-09-09 19:18:25.482000',NULL,_binary '',NULL,7,1),(49,_binary '','2022-09-09 19:22:31.993000',_binary '\0',_binary '\0','2022-09-09 22:45:50.425000',8,2),(50,NULL,'2022-09-09 19:22:34.430000',NULL,_binary '\0',NULL,10,2),(51,_binary '','2022-09-09 19:45:05.433000',_binary '\0',_binary '','2022-09-09 19:47:03.491000',3,3),(52,NULL,'2022-09-09 19:52:39.770000',NULL,_binary '',NULL,7,2),(53,_binary '','2022-09-09 22:43:39.911000',_binary '\0',_binary '\0','2022-09-10 17:15:12.446000',7,3),(54,NULL,'2022-09-09 22:43:43.670000',NULL,_binary '\0',NULL,9,3),(55,_binary '','2022-09-09 22:43:55.087000',_binary '\0',_binary '\0','2022-09-10 12:41:57.068000',3,3),(56,NULL,'2022-09-09 22:43:59.083000',NULL,_binary '\0',NULL,2,3),(57,_binary '','2022-09-09 22:45:00.526000',_binary '\0',_binary '','2022-09-09 22:51:39.877000',8,3),(58,_binary '','2022-09-11 11:32:25.363000',_binary '\0',_binary '\0','2022-09-11 11:34:29.759000',8,3),(59,_binary '','2022-09-11 11:33:55.178000',_binary '\0',_binary '','2022-09-11 11:35:09.950000',7,3);
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_USER'),(2,'ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `year` int NOT NULL,
  `owner_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK67wng1ms79txvvtny81f5456h` (`owner_id`),
  CONSTRAINT `FK67wng1ms79txvvtny81f5456h` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,NULL,'Best Club in the world','Fc Barcelona','uploads\\FcBarcelona.png',NULL,1899,1),(2,NULL,'LEAGUE 1 Team','PSGermain','uploads\\PSG.png',NULL,1970,2),(3,NULL,'Real Madrid','Real Madrid','uploads\\RM.png',NULL,1902,3);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2022-09-09 12:01:16.485000','joanlaporta@gmail.com','Joan','Laporta','$2a$10$eKREWBiNAK7IQNoxsTfLMei1lA49sT7STKZ/VPF9GfyrvVxWcId/.','uploads\\Laporta.jpg',NULL),(2,'2022-09-09 12:11:15.885000','jordialba11@gmail.com','Jordi','Alba','$2a$10$/7sQWmqYn23MoOoYCIByA.E5Dv9jcf526olvNyHoWeS8l2QIiQl/q','uploads\\JordiAlba.png',NULL),(3,'2022-09-09 12:12:31.957000','lionelmessi@gmail.com','Lionel','Messi','$2a$10$WiYSsirxnJfHyFNfAN8nxeH7XsMB.lx0F.x4fap8A2.EG5LDdubpq','uploads\\messipsg.png','2022-09-09 18:40:45.550000'),(4,'2022-09-09 12:58:58.101000','nasseralhelaifi@gmail.com','Nasser','Al khelaifi','$2a$10$/Mlns3RAeBEiC4ly/YVQAeTOpDQ19lBt5GxaA3soz5rbSQcD4qw/a','uploads\\Al-Khelaifi.jpg',NULL),(5,'2022-09-09 13:31:03.137000','sergioramos@gmail.com','Sergio','Ramos','$2a$10$kY4aIqVy3F1LNqX1nv6VM.vKkfuSisijTFHl4aQBQjmUrgMkQabbm','uploads\\SergioRamos.png',NULL),(6,'2022-09-09 13:33:48.465000','kylian@gmail.com','Kylian','Mbappe','$2a$10$QKiW5mj2q1Oce0chJJd7p.QfCVlnNRfQpqw5Jivur0SJgyWWvWuiS','uploads\\mbappe.png',NULL),(7,'2022-09-09 13:35:21.979000','cristianoronaldo@gmail.com','Cristiano','Ronaldo','$2a$10$WXLxCb/qq7ZDitjXPKwkvutim4ystxxV6wwCEgAAlpxEdk5JjoybG','uploads\\Ronaldo7.png','2022-09-10 17:14:57.934000'),(8,'2022-09-09 15:33:41.225000','neymarjunior@gmail.com','Neymar','Junior','$2a$10$hqMl3K5S5O1tDICuWtXlUekmSO64SyWyYf/8RENBT9fTD9x6mufcu','uploads\\NeymarJr1.png','2022-09-09 15:34:24.271000'),(9,'2022-09-09 15:40:19.481000','jules@gmail.com','Jules','Kounde','$2a$10$3awbKW8HEm4NWdaHO0fpuOv0VtMoMyCT5bElIpfVo0pJQp3NdUJIC','uploads\\jules-kounde.png',NULL),(10,'2022-09-09 15:45:01.671000','ousmane@gmail.com','Ousmane','Dembele','$2a$10$mwz7JxCrisTUg9vFniUNyeNQr6puabwTdty/xkLSdIJuAEbib1.Ty','uploads\\ousmane-dembele-21.png',NULL),(11,'2022-09-09 15:52:36.237000','fiorentino@gmail.com','Fiorentino','Perez','$2a$10$.wvIowQauO0K19UcmHI4NO3gG2GJtuosviWNBnHqv.ADrBEQoXFwq','uploads\\florentino.png',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  KEY `FKj6m8fwv7oqv74fcehir1a9ffy` (`role_id`),
  KEY `FK2o0jvgh89lemvvo17cbqvdxaa` (`user_id`),
  CONSTRAINT `FK2o0jvgh89lemvvo17cbqvdxaa` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKj6m8fwv7oqv74fcehir1a9ffy` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,2),(2,1),(3,1),(4,2),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,2);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-11 20:36:10
