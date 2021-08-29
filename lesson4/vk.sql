-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: vk
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `card_pay`
--

DROP TABLE IF EXISTS `card_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card_pay` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `card_number` bigint unsigned NOT NULL,
  `card_date_valid` date NOT NULL,
  `card_username` varchar(255) NOT NULL,
  `card_pin` int unsigned NOT NULL,
  `balance` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `card_pay_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_pay`
--

LOCK TABLES `card_pay` WRITE;
/*!40000 ALTER TABLE `card_pay` DISABLE KEYS */;
INSERT INTO `card_pay` VALUES (1,1,4026575166998420,'2022-05-30','Corrianne Fullagar',2595,14),(2,2,5602229673721533872,'2022-11-12','Ranique Casey',5951,60),(3,3,6333519411846078,'2022-11-16','Victoir Tippler',2364,58),(4,4,3536899276048370,'2023-11-04','Ginger Newlin',9611,70),(5,5,3535288757303549,'2022-05-28','April Obispo',1547,11),(6,6,3583785727384054,'2022-11-10','Bobette Sainthill',1850,41),(7,7,3544642310314196,'2023-08-14','Shirleen De Moreno',1877,89),(8,8,4917961398870482,'2023-04-20','Ferris Whitwham',4251,28),(9,9,3531391340103410,'2021-01-07','Jennee Metherell',2757,58),(10,10,374283746446608,'2021-07-23','Austin Cohane',3982,10),(11,11,3582556035068411,'2024-05-14','Gabriel Larive',1709,45),(12,12,3581299125292549,'2024-12-26','Hal Boston',3071,17),(13,13,3564523019300535,'2020-10-04','Tristam Starkey',7962,90),(14,14,3567008046517647,'2024-03-31','Alyda Giacobilio',3750,55),(15,15,374283222310344,'2024-08-15','Nellie Cotgrave',2391,57),(16,16,30461902004728,'2021-08-04','Alyssa Marcam',3226,33),(17,17,6334948340347917,'2025-04-11','Allayne Dunsmore',3579,87),(18,18,3578409006548472,'2025-02-16','Jacki Ragge',3066,25),(19,19,3578939759830271,'2025-03-01','Cody Elflain',9775,44),(20,20,3583149295840973,'2021-03-29','Bronson Leadbeatter',1753,96);
/*!40000 ALTER TABLE `card_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `admin_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'De-engineered client-driven emulation','moderator',5),(2,'Operative attitude-oriented model','migration',18),(3,'Re-engineered optimizing artificial intelligence','next generation',3),(4,'Expanded zero tolerance moratorium','Virtual',15),(5,'Multi-tiered cohesive matrices','support',20),(6,'Open-source hybrid hardware','firmware',17),(7,'Universal radical solution','clear-thinking',17),(8,'De-engineered solution-oriented solution','multi-state',19),(9,'Business-focused upward-trending software','flexibility',17),(10,'Streamlined leading edge array','initiative',3),(11,'Cross-platform bandwidth-monitored definition','adapter',17),(12,'Focused 6th generation benchmark','composite',17),(13,'Centralized intermediate contingency','high-level',11),(14,'Re-engineered tangible implementation','fresh-thinking',20),(15,'Decentralized incremental strategy','initiative',1),(16,'Pre-emptive 4th generation definition','Business-focused',4),(17,'Centralized 4th generation intranet','6th generation',17),(18,'Customer-focused systemic hierarchy','approach',20),(19,'Horizontal 4th generation matrices','structure',19),(20,'Diverse incremental projection','local',18);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities_users`
--

DROP TABLE IF EXISTS `communities_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities_users` (
  `community_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`community_id`,`user_id`),
  KEY `community_id` (`community_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `communities_users_ibfk_1` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`),
  CONSTRAINT `communities_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities_users`
--

LOCK TABLES `communities_users` WRITE;
/*!40000 ALTER TABLE `communities_users` DISABLE KEYS */;
INSERT INTO `communities_users` VALUES (1,17,'2021-04-11 04:16:15'),(2,14,'2020-12-21 08:09:18'),(3,8,'2021-06-25 16:29:12'),(4,19,'2020-12-17 16:39:32'),(5,14,'2021-05-12 02:37:14'),(6,17,'2021-05-15 00:11:49'),(7,20,'2021-08-09 02:01:17'),(8,19,'2021-02-19 07:11:52'),(9,16,'2020-10-24 03:19:15'),(10,13,'2021-07-09 04:35:06'),(11,18,'2020-09-06 02:39:07'),(12,10,'2021-02-19 10:00:56'),(13,20,'2020-12-09 04:05:51'),(14,12,'2021-04-25 00:38:20'),(15,17,'2021-08-22 01:33:23'),(16,9,'2021-02-23 04:30:52'),(17,13,'2021-08-11 09:54:35'),(18,7,'2021-05-20 01:57:04'),(19,4,'2021-05-26 02:50:00'),(20,1,'2020-12-07 14:01:16');
/*!40000 ALTER TABLE `communities_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_requests` (
  `from_user_id` bigint unsigned NOT NULL,
  `to_user_id` bigint unsigned NOT NULL,
  `accepted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`from_user_id`,`to_user_id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (1,10,1),(2,8,0),(3,20,1),(4,17,1),(5,6,1),(6,14,1),(7,14,0),(8,9,0),(9,6,0),(10,17,1),(11,6,0),(12,20,0),(13,4,0),(14,10,0),(15,10,0),(16,17,1),(17,15,0),(18,12,1),(19,19,1),(20,10,0);
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games_users`
--

DROP TABLE IF EXISTS `games_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `game_user` varchar(255) NOT NULL,
  `game_level` int unsigned DEFAULT NULL,
  `game_date_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `game_balance` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `games_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games_users`
--

LOCK TABLES `games_users` WRITE;
/*!40000 ALTER TABLE `games_users` DISABLE KEYS */;
INSERT INTO `games_users` VALUES (1,1,'Eugenie Bugden',781,'2021-03-24 17:12:00',243397),(2,2,'Travis Renoden',575,'2021-01-01 09:06:47',813739),(3,3,'Matelda Renshell',802,'2021-07-21 09:04:29',712419),(4,4,'Kira Ondrak',67,'2021-02-27 16:11:41',961233),(5,5,'Whitman Hasell',426,'2021-04-22 10:55:05',169975),(6,6,'Audie Dunster',942,'2021-04-30 00:53:55',657404),(7,7,'Ami Duffer',732,'2021-01-21 18:28:48',101482),(8,8,'Laurene Mathys',202,'2020-10-26 22:31:41',314988),(9,9,'Bridie De Blasio',836,'2021-06-15 07:46:55',7178),(10,10,'Piper Cake',447,'2020-09-28 13:04:36',233595),(11,11,'Philippa Ros',514,'2020-11-18 13:24:27',498563),(12,12,'Stanfield Worsham',625,'2021-04-21 01:50:41',778956),(13,13,'Agatha Deveraux',892,'2021-05-07 20:25:08',494381),(14,14,'Artemas Hoston',536,'2021-03-31 01:54:29',169925),(15,15,'Jojo Rawsthorne',137,'2021-06-23 02:11:48',252653),(16,16,'Amelie Swiffen',65,'2021-07-07 04:02:54',183356),(17,17,'Zaccaria Rawlin',528,'2021-08-11 17:25:16',96306),(18,18,'Hermia Prose',298,'2021-02-14 19:45:00',482434),(19,19,'Denver Espinoza',70,'2021-07-30 00:31:21',745515),(20,20,'Whitney Tappor',435,'2021-03-07 11:48:56',428518);
/*!40000 ALTER TABLE `games_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_users`
--

DROP TABLE IF EXISTS `job_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `work_experience` varchar(255) NOT NULL,
  `speciality` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `job_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_users`
--

LOCK TABLES `job_users` WRITE;
/*!40000 ALTER TABLE `job_users` DISABLE KEYS */;
INSERT INTO `job_users` VALUES (1,1,'Support','Chief Design Engineer'),(2,2,'Training','Research Nurse'),(3,3,'Services','Senior Cost Accountant'),(4,4,'Business Development','Accountant IV'),(5,5,'Accounting','Chief Design Engineer'),(6,6,'Training','Senior Cost Accountant'),(7,7,'Services','Sales Associate'),(8,8,'Engineering','Senior Developer'),(9,9,'Product Management','Senior Sales Associate'),(10,10,'Legal','Associate Professor'),(11,11,'Legal','Desktop Support Technician'),(12,12,'Training','Compensation Analyst'),(13,13,'Human Resources','Web Developer III'),(14,14,'Services','Senior Editor'),(15,15,'Training','Biostatistician IV'),(16,16,'Training','GIS Technical Architect'),(17,17,'Support','Social Worker'),(18,18,'Accounting','Biostatistician III'),(19,19,'Training','Cost Accountant'),(20,20,'Engineering','Registered Nurse');
/*!40000 ALTER TABLE `job_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `media_types_id` int unsigned NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` bigint unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `media_types_id` (`media_types_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`media_types_id`) REFERENCES `media_types` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,3,'LectusPellentesque.avi',5975978,'2021-07-29 04:17:10'),(2,2,4,'IdLobortis.jpeg',2722951,'2021-06-28 10:40:07'),(3,3,4,'Cras.mpeg',3343533,'2021-07-20 14:17:00'),(4,4,8,'VolutpatErat.xls',1423002,'2020-11-30 01:08:13'),(5,5,8,'Fermentum.tiff',5276053,'2021-03-29 19:46:07'),(6,6,6,'ScelerisqueMaurisSit.mp3',3633133,'2021-05-12 23:37:15'),(7,7,4,'Primis.mp3',9368790,'2020-11-08 04:13:10'),(8,8,7,'PurusPhasellusIn.gif',8439167,'2020-12-02 05:02:24'),(9,9,5,'PosuereCubiliaCurae.jpeg',8362980,'2021-06-27 15:59:10'),(10,10,6,'A.ppt',2211966,'2021-07-12 15:10:32'),(11,11,7,'SemperInterdumMauris.mp3',7847655,'2021-05-17 03:08:48'),(12,12,1,'ElementumNullamVarius.xls',3519348,'2020-12-17 03:41:18'),(13,13,7,'EleifendDonec.doc',7356845,'2020-09-07 11:02:13'),(14,14,8,'LobortisSapien.ppt',2058966,'2021-04-14 06:01:25'),(15,15,2,'RutrumNulla.tiff',4506954,'2021-03-10 03:50:49'),(16,16,1,'CubiliaCuraeDuis.mp3',1265541,'2020-12-24 20:08:03'),(17,17,1,'SodalesScelerisqueMauris.mp3',9675830,'2021-02-05 20:47:50'),(18,18,4,'VelSem.tiff',579851,'2021-06-12 19:51:36'),(19,19,1,'Ut.tiff',5243126,'2020-09-17 01:12:33'),(20,20,2,'MiIntegerAc.mpeg',9253676,'2020-09-25 08:09:32');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'application/mspowerpoint'),(6,'application/msword'),(10,'application/vnd.ms-excel'),(3,'application/x-mspowerpoint'),(5,'audio/mpeg3'),(2,'image/jpeg'),(4,'image/png'),(8,'video/avi'),(7,'video/mpeg'),(9,'video/mpg');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint unsigned NOT NULL,
  `to_user_id` bigint unsigned NOT NULL,
  `txt` text NOT NULL,
  `is_delivered` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `messages_from_user_id_idx` (`from_user_id`),
  KEY `messages_to_user_id_idx` (`to_user_id`),
  CONSTRAINT `fk_messages_from_user_id` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_messages_to_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,4,10,'In congue.',1,'2021-09-06 08:14:12','2021-03-11 23:05:35'),(2,8,12,'Praesent id massa id nisl venenatis lacinia.',1,'2020-12-21 02:43:11','2021-08-09 08:51:57'),(3,13,5,'Nullam molestie nibh in lectus.',0,'2021-04-28 02:19:22','2020-12-16 01:24:32'),(4,7,13,'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.',1,'2022-01-31 06:34:24','2020-12-07 01:00:29'),(5,11,16,'Phasellus in felis.',0,'2022-03-04 13:02:16','2021-04-11 16:37:52'),(6,13,4,'Proin risus.',1,'2020-10-25 04:54:02','2021-01-24 19:41:05'),(7,4,10,'Nullam sit amet turpis elementum ligula vehicula consequat.',1,'2020-09-08 07:28:04','2020-08-28 05:08:15'),(8,12,6,'Morbi porttitor lorem id ligula.',1,'2022-04-07 15:23:35','2021-04-01 05:05:27'),(9,14,11,'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.',0,'2022-02-16 15:01:16','2020-09-16 12:46:39'),(10,19,11,'Morbi vel lectus in quam fringilla rhoncus.',1,'2020-09-03 15:09:36','2020-11-25 09:20:12'),(11,12,1,'Vivamus tortor.',0,'2022-03-25 16:09:46','2020-11-05 04:20:44'),(12,1,10,'Quisque ut erat.',0,'2021-04-13 18:11:36','2020-12-27 22:43:18'),(13,16,1,'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.',1,'2021-04-28 21:13:52','2020-12-18 10:23:54'),(14,12,3,'In congue.',1,'2021-03-02 05:33:01','2021-08-07 02:24:55'),(15,14,10,'Vivamus vestibulum sagittis sapien.',0,'2022-04-11 21:53:32','2021-04-24 09:35:02'),(16,1,13,'Nulla tempus.',1,'2022-02-03 13:22:01','2020-11-30 10:14:46'),(17,10,14,'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.',0,'2022-08-11 03:11:20','2021-08-14 21:58:01'),(18,17,20,'Integer non velit.',0,'2022-02-11 10:37:20','2020-09-12 14:10:50'),(19,4,14,'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.',1,'2021-08-18 10:53:01','2021-02-05 11:06:30'),(20,14,7,'Proin at turpis a pede posuere nonummy.',0,'2021-03-31 17:12:56','2021-07-30 09:47:17'),(21,9,20,'In hac habitasse platea dictumst.',0,'2020-11-02 21:58:22','2021-08-12 12:14:27'),(22,8,19,'Curabitur gravida nisi at nibh.',1,'2020-09-21 09:37:49','2021-03-23 08:49:27'),(23,2,9,'Aenean lectus.',1,'2020-09-17 14:18:36','2020-11-28 04:27:23'),(24,3,20,'In hac habitasse platea dictumst.',0,'2022-07-28 19:53:01','2021-02-23 17:36:07'),(25,20,11,'Curabitur at ipsum ac tellus semper interdum.',0,'2021-11-16 11:20:52','2021-01-13 09:44:30'),(26,13,14,'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.',0,'2020-12-30 12:41:01','2021-08-19 17:01:29'),(27,5,14,'Nam tristique tortor eu pede.',1,'2021-09-22 03:16:47','2021-04-12 12:41:27'),(28,9,8,'Nam nulla.',1,'2021-04-14 19:15:25','2021-04-26 23:37:29'),(29,11,10,'Nulla facilisi.',1,'2021-01-19 20:13:52','2021-01-01 03:37:51'),(30,16,9,'Nulla ut erat id mauris vulputate elementum.',1,'2020-09-03 01:53:47','2021-05-27 11:24:57'),(31,6,13,'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.',0,'2022-03-03 14:23:54','2021-04-08 00:58:17'),(32,16,20,'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.',0,'2022-01-30 06:05:44','2021-04-25 02:29:43'),(33,19,4,'Integer tincidunt ante vel ipsum.',0,'2022-03-11 23:25:20','2020-10-25 21:18:18'),(34,7,2,'Vivamus vel nulla eget eros elementum pellentesque.',1,'2020-11-27 00:32:58','2021-05-13 01:49:39'),(35,1,20,'Aenean auctor gravida sem.',1,'2021-12-02 20:58:28','2021-03-03 11:02:23'),(36,6,18,'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',1,'2021-07-02 02:12:37','2020-12-14 11:13:37'),(37,16,6,'Donec posuere metus vitae ipsum.',0,'2022-03-12 10:18:18','2021-05-24 20:26:21'),(38,1,2,'Sed sagittis.',1,'2022-05-08 15:16:30','2021-03-29 16:35:53'),(39,15,10,'Vivamus in felis eu sapien cursus vestibulum.',0,'2022-05-16 11:03:49','2021-04-15 17:47:29'),(40,17,12,'Nulla tempus.',0,'2021-01-09 21:53:59','2021-07-19 10:53:42'),(41,18,16,'Nam nulla.',0,'2022-03-18 14:33:26','2021-01-28 07:57:12'),(42,8,12,'Praesent blandit.',0,'2022-08-18 18:25:38','2020-12-07 11:37:02'),(43,5,14,'In quis justo.',1,'2021-05-09 00:43:06','2021-01-29 22:50:05'),(44,15,17,'In blandit ultrices enim.',1,'2021-06-22 18:22:28','2021-05-31 19:19:24'),(45,13,5,'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.',1,'2021-11-09 18:26:57','2021-04-03 00:31:30'),(46,15,2,'Nunc nisl.',1,'2020-12-31 03:22:56','2020-10-13 01:47:42'),(47,20,19,'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.',0,'2021-10-20 22:04:52','2021-02-27 02:55:57'),(48,17,18,'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.',0,'2021-05-24 12:18:14','2020-11-23 10:46:56'),(49,11,6,'Donec dapibus.',1,'2022-02-17 06:05:01','2020-12-22 23:36:30'),(50,1,12,'Mauris sit amet eros.',0,'2021-07-02 17:39:46','2021-02-27 22:18:28'),(51,6,2,'Donec ut mauris eget massa tempor convallis.',0,'2022-03-20 21:12:15','2021-04-30 14:50:44'),(52,19,1,'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.',1,'2020-10-13 02:06:55','2021-05-16 10:41:53'),(53,6,13,'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.',1,'2022-06-24 23:06:53','2020-10-06 11:33:30'),(54,17,12,'Nulla facilisi.',0,'2020-12-22 07:00:55','2020-12-25 21:01:33'),(55,7,7,'In est risus, auctor sed, tristique in, tempus sit amet, sem.',1,'2021-08-24 16:02:46','2020-10-01 07:01:37'),(56,11,9,'Morbi ut odio.',0,'2021-11-22 23:52:49','2020-12-31 16:04:11'),(57,13,15,'Morbi porttitor lorem id ligula.',1,'2021-09-14 18:13:17','2021-05-09 17:46:03'),(58,17,11,'Proin eu mi.',1,'2022-01-28 08:08:21','2020-09-30 20:03:40'),(59,8,18,'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.',0,'2021-08-10 10:59:15','2021-02-16 22:46:07'),(60,3,12,'Phasellus in felis.',0,'2021-02-06 02:03:33','2021-06-18 12:34:12'),(61,19,16,'Integer ac leo.',1,'2022-02-25 21:16:26','2021-06-26 03:01:44'),(62,13,14,'Pellentesque at nulla.',0,'2021-10-27 08:12:10','2020-11-26 15:00:35'),(63,15,16,'Donec quis orci eget orci vehicula condimentum.',1,'2021-07-02 01:34:02','2021-05-07 20:12:03'),(64,13,15,'Donec posuere metus vitae ipsum.',0,'2020-12-26 03:02:25','2020-12-14 05:57:41'),(65,10,8,'Integer a nibh.',0,'2021-05-11 08:38:36','2020-12-24 15:57:00'),(66,7,11,'Ut tellus.',1,'2022-05-18 16:50:45','2021-07-16 15:31:39'),(67,2,11,'Aenean sit amet justo.',0,'2021-08-28 11:06:00','2020-12-14 14:15:18'),(68,18,1,'Proin at turpis a pede posuere nonummy.',0,'2020-09-24 12:34:13','2020-12-25 13:34:35'),(69,1,1,'Nam nulla.',0,'2020-10-18 15:51:54','2020-08-27 19:05:21'),(70,9,11,'Maecenas ut massa quis augue luctus tincidunt.',1,'2021-09-21 18:35:39','2020-11-30 18:43:48'),(71,12,4,'Integer ac leo.',1,'2021-12-02 23:58:00','2020-10-07 13:35:04'),(72,17,13,'In hac habitasse platea dictumst.',1,'2020-12-05 13:12:19','2021-02-08 18:29:15'),(73,4,17,'Nulla mollis molestie lorem.',1,'2021-05-18 17:31:37','2020-11-06 15:21:40'),(74,1,16,'Aenean fermentum.',0,'2020-12-21 11:54:03','2021-02-08 07:55:02'),(75,6,16,'Proin eu mi.',1,'2022-01-16 17:45:01','2020-10-12 06:54:26'),(76,1,8,'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.',0,'2021-11-20 04:25:53','2021-03-18 06:52:19'),(77,19,1,'Phasellus id sapien in sapien iaculis congue.',0,'2022-08-03 10:28:35','2020-11-29 03:42:05'),(78,17,1,'Sed ante.',0,'2021-12-30 08:25:36','2021-05-15 06:33:08'),(79,14,3,'Duis mattis egestas metus.',0,'2020-08-27 05:34:11','2021-07-02 14:56:17'),(80,14,11,'Praesent blandit lacinia erat.',0,'2020-10-14 06:30:04','2021-03-14 22:54:08'),(81,13,1,'Duis mattis egestas metus.',1,'2022-05-24 20:09:58','2021-07-17 14:19:31'),(82,8,10,'Pellentesque ultrices mattis odio.',1,'2022-04-25 06:02:49','2021-04-04 19:09:40'),(83,17,8,'Proin interdum mauris non ligula pellentesque ultrices.',1,'2021-11-27 01:12:32','2020-11-14 18:31:38'),(84,18,13,'Ut at dolor quis odio consequat varius.',1,'2021-03-10 03:33:45','2020-09-19 02:05:35'),(85,19,9,'In hac habitasse platea dictumst.',0,'2021-06-24 11:02:08','2020-09-12 13:27:22'),(86,19,6,'Mauris ullamcorper purus sit amet nulla.',0,'2022-05-01 04:12:07','2021-08-14 22:13:26'),(87,2,4,'Duis ac nibh.',1,'2021-08-08 16:10:53','2020-10-21 21:39:20'),(88,2,8,'Cras non velit nec nisi vulputate nonummy.',1,'2021-08-21 18:54:17','2021-07-25 04:35:01'),(89,3,5,'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.',1,'2021-09-14 06:31:47','2021-03-22 13:41:52'),(90,10,13,'Maecenas tincidunt lacus at velit.',0,'2022-04-27 15:17:35','2021-03-17 19:28:58'),(91,2,11,'Nulla tellus.',1,'2021-05-27 10:09:21','2021-06-26 06:19:51'),(92,5,15,'Nullam molestie nibh in lectus.',1,'2021-05-12 18:19:34','2020-11-09 10:35:59'),(93,19,20,'In hac habitasse platea dictumst.',1,'2021-12-30 00:15:22','2020-09-28 17:38:42'),(94,12,19,'Sed ante.',0,'2021-05-12 07:53:41','2020-11-27 12:11:22'),(95,17,13,'Nulla justo.',0,'2021-05-19 01:51:56','2020-09-17 04:20:52'),(96,4,14,'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.',1,'2020-11-03 02:14:52','2021-07-14 11:59:56'),(97,11,3,'Cras non velit nec nisi vulputate nonummy.',1,'2021-08-17 02:23:00','2021-06-01 22:02:40'),(98,20,3,'Duis aliquam convallis nunc.',1,'2021-11-14 22:10:58','2020-09-17 17:55:09'),(99,5,10,'Nunc rhoncus dui vel sem.',0,'2021-05-17 08:58:59','2021-07-15 10:38:10'),(100,19,6,'Aliquam quis turpis eget elit sodales scelerisque.',0,'2022-03-15 01:04:15','2021-03-26 21:30:09');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `user_id` bigint unsigned NOT NULL,
  `gender` enum('f','m','x') NOT NULL,
  `birthday` date NOT NULL,
  `photo_id` bigint unsigned DEFAULT NULL,
  `city` varchar(130) DEFAULT NULL,
  `country` varchar(130) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'m','1984-02-03',NULL,'Uritsk','Russia',1),(2,'x','1973-08-18',NULL,'Vyborg','Russia',1),(3,'f','1973-06-20',NULL,'Gimry','Russia',1),(4,'x','2000-08-29',NULL,'Segezha','Russia',1),(5,'x','1987-07-25',NULL,'Medvedovskaya','Russia',1),(6,'m','1998-05-10',NULL,'Chupa','Russia',1),(7,'x','1974-02-21',NULL,'Tsementnozavodskiy','Russia',1),(8,'f','2002-06-24',NULL,'Komsomolsk-on-Amur','Russia',1),(9,'m','2008-11-22',NULL,'Orlovskiy','Russia',0),(10,'f','1993-01-30',NULL,'Tayzhina','Russia',1),(11,'x','1980-06-14',NULL,'Yessentuki','Russia',1),(12,'x','1989-11-23',NULL,'Dmitriyevskaya','Russia',1),(13,'x','1996-03-01',NULL,'Yantal’','Russia',1),(14,'f','1993-03-23',NULL,'Sukhinichi','Russia',1),(15,'x','1991-07-16',NULL,'Yelizavetinsk','Russia',1),(16,'m','1992-06-24',NULL,'Kaz','Russia',1),(17,'f','1999-10-06',NULL,'Rodnikovskaya','Russia',1),(18,'f','2013-05-08',NULL,'Gaptsakh','Russia',0),(19,'m','2007-07-08',NULL,'Polazna','Russia',0),(20,'m','1987-03-01',NULL,'Североморск-3','Russia',1);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` char(11) NOT NULL,
  `password_hash` char(65) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `phone` (`phone`),
  KEY `email_2` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Randa','Perton','rperton0@sakura.ne.jp','3245650466','37994863b40426480a93eac298d8e4e8','2021-06-06 00:50:53'),(2,'Zondra','Bradder','zbradder1@washington.edu','8337153610','2ba4bc532285b570674ffb3418b67131','2021-08-02 19:51:32'),(3,'Merl','Daoust','mdaoust2@techcrunch.com','6539560160','f4dc4a3811587db2ee07883b0912a2c2','2021-07-15 07:45:42'),(4,'Zachariah','Probets','zprobets3@exblog.jp','7094869020','5ae845d4e7bf4bf819d21f26241496c1','2021-04-08 20:56:38'),(5,'Shandee','Meriel','smeriel4@imdb.com','9423190857','d005cd61ac6ee427daaba99bb98c845c','2021-07-15 02:00:06'),(6,'Washington','Jachimiak','wjachimiak5@upenn.edu','3605493804','f71d67370bfa1253ebf98671d0d9ebda','2021-05-31 12:50:53'),(7,'Trudie','Vesco','tvesco6@wufoo.com','3485993257','1ff60f2f7e9b94445ad2bd92cf707ea6','2021-04-04 02:32:10'),(8,'Eli','Howard - Gater','ehowardgater7@theglobeandmail.com','8604373482','29ed32600587723992a886cb08d60270','2021-05-15 23:39:54'),(9,'Gretta','Condy','gcondy8@chronoengine.com','4564069529','0218f4e80e6302b0b6a94beaeb716370','2020-09-19 23:35:50'),(10,'Bartel','Brick','bbrick9@alibaba.com','3861109322','6009ce67851fdcac3e3928857747b3d4','2021-08-15 23:40:42'),(11,'Mahalia','Garnsey','mgarnseya@taobao.com','3116464037','ebef273262d2ae14c0cc53d90acb92ac','2021-02-27 02:44:19'),(12,'Brianna','Bradnam','bbradnamb@webmd.com','3445136065','94e88c99cb2483f5920f4c4a20e5974c','2021-03-25 23:53:41'),(13,'Auberon','Snaden','asnadenc@pbs.org','7095768197','a00426e93f537ed9d6c60aa1152b34de','2021-05-06 13:28:55'),(14,'Charmain','Vanetti','cvanettid@yolasite.com','9975247649','2f68d92d26cbbc6e777a71787f6f1ef7','2021-03-01 12:31:44'),(15,'Sibylle','Pymer','spymere@youtu.be','2659520145','47d19b56710816f95577e7d781670602','2021-06-26 11:40:22'),(16,'Iver','Archanbault','iarchanbaultf@pagesperso-orange.fr','5909116234','284837772a68e4054f3ae13266fe9842','2021-04-01 21:44:21'),(17,'Cherida','Hardaker','chardakerg@berkeley.edu','7606646026','5a030d5ff32f3832d2d6b1c2cbb4cd2a','2021-01-05 14:51:54'),(18,'Missie','Peltz','mpeltzh@uol.com.br','4403935312','cfda020e2e4c4b97d9f5f6a1c5e70201','2021-03-15 05:20:01'),(19,'Marcel','Balshaw','mbalshawi@plala.or.jp','9154268242','ecd40083259e37a238505f6a279d981a','2020-11-08 11:29:44'),(20,'Werner','McGrah','wmcgrahj@apache.org','3723904671','4d8fdca31b90a23218d14dca8bab8605','2021-07-30 18:18:10');
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

-- Dump completed on 2021-08-28 19:37:41
