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
  `card_number` int unsigned NOT NULL,
  `card_date_valid` date NOT NULL,
  `card_username` varchar(255) NOT NULL,
  `card_pin` int unsigned NOT NULL,
  `balance` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `card_pay_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_pay`
--

LOCK TABLES `card_pay` WRITE;
/*!40000 ALTER TABLE `card_pay` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'Number1','I am number one',1),(2,'Number2','I am number two',1);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities_users`
--

DROP TABLE IF EXISTS `communities_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities_users` (
  `communities_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`communities_id`,`user_id`),
  KEY `communities_id` (`communities_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `communities_users_ibfk_1` FOREIGN KEY (`communities_id`) REFERENCES `communities` (`id`),
  CONSTRAINT `communities_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities_users`
--

LOCK TABLES `communities_users` WRITE;
/*!40000 ALTER TABLE `communities_users` DISABLE KEYS */;
INSERT INTO `communities_users` VALUES (1,4,'2021-08-18 14:05:52');
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
INSERT INTO `friend_requests` VALUES (1,4,1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games_users`
--

LOCK TABLES `games_users` WRITE;
/*!40000 ALTER TABLE `games_users` DISABLE KEYS */;
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
  `work_experience` text NOT NULL,
  `speciality` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `job_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_users`
--

LOCK TABLES `job_users` WRITE;
/*!40000 ALTER TABLE `job_users` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,1,'im.jpg',100,'2021-08-18 14:10:23'),(2,1,1,'im1.png',78,'2021-08-18 14:10:25'),(3,4,3,'doc.docx',1024,'2021-08-18 14:10:27');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (3,'документ'),(1,'изображение'),(2,'музыка');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (2,1,4,'Hi!',1,'2021-08-18 14:05:00','2021-08-18 14:05:00'),(3,1,4,'Vasya!',1,'2021-08-18 14:05:02','2021-08-18 14:05:02'),(4,4,1,'Hi, Petya',1,'2021-08-18 14:05:04','2021-08-18 14:05:04');
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
  PRIMARY KEY (`user_id`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Petya','Petukhov','petya@mail.com','89212223334',NULL,'2021-08-18 13:59:12'),(2,'Sean','Dykas','sdykas1@wiley.com','8022592304','45a3022abf64a0e9935b6489857d86ad','2021-06-24 07:44:43'),(3,'Montgomery','Spykings','mspykings2@aboutads.info','2755986788','af1aba03c96266acf34795708527f44b','2021-07-02 18:45:01'),(4,'Vasya','Vasilkov','vasya@mail.com','89212023334',NULL,'2021-08-18 14:00:03'),(5,'Margot','Elmer','melmer4@icq.com','4847806926','2f03c0a8b60fc1e1f6425b67b38668d2','2021-04-07 20:27:22'),(6,'Myca','Kepp','mkepp5@un.org','2224052306','997dfd8d2829aa40d8da2636b74c29d8','2021-04-06 20:57:11'),(7,'Carlie','Dorro','cdorro6@google.it','3976227272','2ac8cd75d463946d07f088dc6ef4e8d8','2021-03-05 01:09:00'),(8,'Myles','Carous','mcarous7@dell.com','1134858750','271119f5592ca563b7aa559bb90c6714','2020-10-05 12:42:37'),(9,'Susy','Senn','ssenn8@archive.org','8036489731','5247d35a137789431efbd274f7e12bf9','2021-03-17 17:02:02'),(10,'Loydie','Simonin','lsimonin9@uol.com.br','4751294004','76e59b5acfa4b2506d6425d5f3f82aa3','2021-02-15 16:51:19'),(11,'Iain','Brushfield','ibrushfielda@goo.ne.jp','4991305448','71df817fcb7583bde5877fd1df7b5914','2021-02-02 02:35:59'),(12,'Onfroi','Charnick','ocharnickb@yahoo.co.jp','2842582399','db55049d9bdf9a67da7f5b034dba314a','2021-04-09 05:02:10'),(13,'Vinnie','Barcke','vbarckec@google.pl','7291739746','7bc378ba73af63f30ca7f5857138ff7c','2020-11-25 21:29:35'),(14,'Hardy','Millan','hmilland@google.co.jp','1798895015','3f9f0a58820dd9f1b785df1dfd85e7ea','2021-03-07 02:54:02'),(15,'Kyle','Larroway','klarrowaye@cbc.ca','4264601331','818366799a0b7172fb113885d709d277','2020-12-24 01:42:47'),(16,'Archibold','Hintze','ahintzef@imageshack.us','3693928936','7d0c7d3d8d7d7d989481dccdc3c70fa3','2021-05-13 18:52:01'),(17,'Sidonnie','O\'Caine','socaineg@discovery.com','9805832236','881d210d0939a66703a246ec5f8a6db7','2021-03-24 04:22:48'),(18,'Mimi','Fearn','mfearnh@ifeng.com','3261218953','fc710a8d54a36dc05fac1e14b0dda090','2020-12-17 20:49:03'),(19,'Donica','Karpychev','dkarpychevi@squarespace.com','9346050825','9bdcf12f0fceed708447c286706c2c0d','2021-08-05 18:08:45'),(20,'Andris','Sadler','asadlerj@psu.edu','8807132426','1ee8fa1e3d711eb1de71506640b6734a','2021-05-18 18:59:34'),(21,'Freeman','Gavini','fgavinik@multiply.com','6257471789','376060258bc5830dc82bed73570ea2f0','2021-07-15 17:28:22'),(22,'Maible','Tribble','mtribblel@loc.gov','2377403700','8a869c1145299db0d82ddf913ae89891','2021-01-01 18:26:48'),(23,'Marie','Brunsen','mbrunsenm@soundcloud.com','1584326626','71cf9de9aed1ca002076f5395d701218','2021-03-01 00:21:42'),(24,'Barclay','Browell','bbrowelln@buzzfeed.com','5681120813','9c270de8545560abcbc3670f4b0fa992','2021-05-11 08:33:23'),(25,'Prince','Hardway','phardwayo@cbc.ca','6835567673','8e3f78904ab96c9e9871f427507504f7','2021-02-08 14:50:19'),(26,'Phylis','Blackborow','pblackborowp@sourceforge.net','8435617980','268d20abb7881b442a62d8ef264a8887','2021-05-04 06:20:09'),(27,'Dyana','Glader','dgladerq@ning.com','9082805466','12ba63ad33bbcdfbcec9e9066f30e467','2021-01-18 18:07:02'),(28,'Karel','Brundell','kbrundellr@vimeo.com','5424274557','6f551781a3cb907725e0c0dbc65cfdec','2021-08-07 19:09:46'),(29,'Fania','Carratt','fcarratts@salon.com','2937001171','2c56856525e45249de2c05c087d0d9fe','2020-11-18 22:54:31'),(30,'Lacey','Stansbie','lstansbiet@github.com','1588008349','42a2ace2c39d692b3fd850a1e41c39d7','2020-12-27 17:50:34'),(31,'Gearard','Ruppertz','gruppertzu@nytimes.com','2105451303','f75a8f13a70a6e015dbcbfe9bf3a8e06','2021-02-03 22:34:32'),(32,'Eziechiele','Loddy','eloddyv@cam.ac.uk','6158547438','a998fa1dbc1971deb9ff822653779876','2020-12-20 09:53:37'),(33,'Violet','Bampkin','vbampkinw@twitpic.com','3295915333','60002f3f6dbfe350296f0f59142fdbe1','2020-12-07 03:18:03'),(34,'Sherlock','Gabe','sgabex@github.com','8976241513','f650f2e65be9924a5fe16d87f1af6d6e','2021-06-13 02:02:08'),(35,'Esma','Danett','edanetty@wunderground.com','6193284249','c410eb9f6c1cdc76d4c7963b2af21ceb','2021-01-04 01:05:45'),(36,'Harlie','Selby','hselbyz@state.tx.us','1153729980','6dd99d8f9739685f316bf85a6b03c794','2020-11-16 00:38:47'),(37,'Findlay','Shetliff','fshetliff10@unicef.org','7852265319','16a3ec23d72af44ed7d67818c0f15299','2020-12-25 22:22:38'),(38,'Scarlett','Pentony','spentony11@free.fr','4979369065','9e23e6d9f13d7540b6d23dbb2f6728fc','2021-01-31 19:52:53'),(39,'Cindi','Ramsdell','cramsdell12@ehow.com','3454813968','40932677042baa6dd02d89f7f00ed540','2020-09-29 04:30:26'),(40,'Amelina','Burnes','aburnes13@macromedia.com','1754605966','91068dae17e442c01717858e230f629d','2021-01-23 02:12:13'),(41,'Barbra','Wilbud','bwilbud14@sun.com','3091712272','e9fc4a2a93e1adb114b035647130fb24','2020-11-26 06:34:38'),(42,'Amelia','Mowbury','amowbury15@de.vu','7917304868','00b7c774961ca5d25ad0ef230de5706a','2021-05-01 04:24:16'),(43,'Annamaria','McGlue','amcglue16@dmoz.org','6051571428','d59c9efeae944c8999f8ac7ac1ac308e','2021-03-28 09:54:26'),(44,'Corabel','Culter','cculter17@wikia.com','2239281187','b2f68b787c3da9bbabb110da2fd80ce1','2021-03-01 14:52:29'),(45,'Elga','Malley','emalley18@shop-pro.jp','7936361556','1e320e5d5eef29184eec4b736eadd943','2021-04-22 19:47:15'),(46,'Gae','Wooles','gwooles19@nyu.edu','3926978058','62ab343ea23264c26ccae0cdce7dceb9','2021-07-05 04:26:31'),(47,'Emyle','Lacaze','elacaze1a@jalbum.net','3403919866','c4b2f4d6e81b51ad012e85d98dfe7dc2','2021-07-19 20:10:14'),(48,'Max','Stoner','mstoner1b@usa.gov','2322183215','4f942b4d3ea8135d1bd65d979b1a69e4','2021-03-16 02:13:58'),(49,'Jorgan','Sweynson','jsweynson1c@weibo.com','3063118611','9673146721527be3e20344f343a2e3e2','2021-06-25 06:34:57'),(50,'Bartholemy','Swatridge','bswatridge1d@archive.org','4135243669','3590c8202c37be1172fd16b0b0e04578','2021-01-24 02:25:09'),(51,'Ivory','Tossell','itossell1e@ask.com','5325033466','453e6faa50de5c38b6ad6e1ec073f225','2021-01-14 03:56:06'),(52,'Birgit','Dabels','bdabels1f@netvibes.com','3725163697','700e474f87b97b5f03c7202447f21022','2020-12-15 11:54:39'),(53,'Courtnay','Dummigan','cdummigan1g@rambler.ru','8354539547','ae8848e68eb2de7e240fbfac7c6060ac','2021-07-16 02:07:28'),(54,'Rebekah','Gaddas','rgaddas1h@wufoo.com','1815906281','7744e19166e8895c059bda0debf0f8d8','2020-11-17 01:49:53'),(55,'Wylie','Mancer','wmancer1i@github.com','2546098101','59213cd36dc41c105afc5a43759f7890','2021-05-25 12:04:01'),(56,'Evvie','Tellett','etellett1j@mit.edu','4454005585','420c73b13ec70048fa83db6afd1fc103','2020-12-30 14:47:35'),(57,'Vin','Holtham','vholtham1k@omniture.com','9921123012','57e66ffff139fd713d488bcf9cb80c2a','2021-04-03 14:12:42'),(58,'Linell','Taill','ltaill1l@adobe.com','7884171029','c47d194285a5f95b251adbc2b515ec77','2021-08-06 08:26:51'),(59,'Cacilie','Fury','cfury1m@over-blog.com','3853428032','a59bc4381d1a4c4f18c4da9007164b5c','2021-03-04 20:01:58'),(60,'Nita','Dockrey','ndockrey1n@homestead.com','5333431568','f02ac0a942917ed4b4596024027bb89e','2021-05-02 16:42:04'),(61,'Maxine','Frise','mfrise1o@hao123.com','6869361000','e9deba2f641394fe38876741b8a3f641','2020-08-28 07:06:12'),(62,'Regan','Corrao','rcorrao1p@jalbum.net','1618193663','5f616de343f2ecc8ce3db60e22165e7e','2021-01-05 21:36:39'),(63,'Shaine','Jukes','sjukes1q@ehow.com','8596457525','7af7d2fc5f025f6ed94bf44ec3451f7b','2021-02-01 17:03:25'),(64,'Bonnee','Frankish','bfrankish1r@hp.com','6035781170','30e5316eafac40ef4d53cac2e19763b5','2020-10-28 09:48:48'),(65,'Willamina','Wisdish','wwisdish1s@surveymonkey.com','5841887278','b7e40899513c570baebadc1f79bcb37c','2020-10-25 08:10:25'),(66,'Eadmund','Iashvili','eiashvili1t@arizona.edu','7792849436','91a7b7329a57ed9856bed9c4e57def0c','2021-04-10 20:05:16'),(67,'Victoria','Cummings','vcummings1u@is.gd','1292359231','37e0a2d6bcd7970dc2a80db7c4b659bb','2021-08-13 07:23:30'),(68,'Alayne','Jantzen','ajantzen1v@tripod.com','6723190936','246de457afccdfb2bc95a612998d3e21','2020-08-23 17:40:48'),(69,'Maribeth','Askem','maskem1w@blogger.com','4402449134','2b1d9b3f1a73a77e57c635967c51eb97','2021-05-14 20:57:46'),(70,'Enrica','Boadby','eboadby1x@symantec.com','3515951471','ee5328aea0e0ea342ae633af1e84a4a7','2020-10-29 00:11:09'),(71,'Ula','Davers','udavers1y@tripadvisor.com','6701700001','9193067f9c7841dc96552acbc8695d7f','2020-12-05 09:12:50'),(72,'Hymie','Steljes','hsteljes1z@biblegateway.com','4024282432','e466d7b8bb934ea9817d844cc2c70e61','2020-12-08 02:11:12'),(73,'Laird','MacClancey','lmacclancey20@arizona.edu','5789845583','f023a37bda19c4eebe23473e9746eaaa','2021-08-01 17:41:41'),(74,'Lew','Pengelly','lpengelly21@oaic.gov.au','5723208776','afbafbe3f6a0536f18ca122914cee588','2021-02-24 06:06:25'),(75,'Dotty','Eastbury','deastbury22@ow.ly','7501136927','787533b66a9c2f57607ea43c1a970a9e','2020-09-29 03:58:56'),(76,'Marci','Tolchar','mtolchar23@amazon.co.jp','5928877255','dd6d4731f7586790689266f97bfd8f5e','2021-07-18 00:44:44'),(77,'Jillayne','Mallows','jmallows24@flavors.me','8056461095','db0dea6d9cb9e4be1fbb9e84dd341c31','2021-02-05 10:39:07'),(78,'Silvana','Mishaw','smishaw25@archive.org','3967363012','69941cf7c2183d6916de731b85b1bf9c','2020-10-10 09:09:38'),(79,'Emeline','Sylvester','esylvester26@biglobe.ne.jp','5425160025','e6710cd09b80ded0e037b2d5c7ae17c7','2021-01-14 21:54:37'),(80,'Davidde','Dyet','ddyet27@icq.com','7594552634','29903e4155c6664113e45e1a8fb6cd89','2021-08-11 02:59:15'),(81,'Briana','Arents','barents28@livejournal.com','7926486576','590b2a20f01cdbc043fb8abcd12aa69f','2020-10-31 23:57:58'),(82,'Cheryl','Duggen','cduggen29@slate.com','9457239531','4e88157f84184a020c72eeeab5f4deae','2020-09-28 11:54:42'),(83,'Thomasin','Lambshine','tlambshine2a@1688.com','6165390489','0ab147dafb0dcdd8b2cc9982ef294730','2020-09-10 05:10:01'),(84,'Heriberto','Holleworth','hholleworth2b@linkedin.com','2453737525','c114e87555256a12e3699e0e72e04c40','2021-04-10 22:34:32'),(85,'Leesa','Baitman','lbaitman2c@bandcamp.com','7204784634','411f51c175266106abc2941c5d4db239','2021-01-12 18:22:35'),(86,'Michail','Lude','mlude2d@huffingtonpost.com','4002983231','cd94c04bd2aa8c1b0aed704f83b3604b','2021-06-07 16:28:34'),(87,'Fan','Gibbins','fgibbins2e@wordpress.org','6483953024','bca19a5590356f4a7126d37283fdefef','2021-01-11 23:54:16'),(88,'Roland','Domengue','rdomengue2f@ucoz.ru','4412754121','ee553d075a74205fc895f958708c4121','2021-05-26 01:48:00'),(89,'Gabriell','Andriolli','gandriolli2g@aboutads.info','8774243389','1baafeec983b6b799078e467983b6327','2021-08-17 04:08:19'),(90,'Burch','Tracey','btracey2h@typepad.com','9453294326','9747c17380ed375f04faa37675925af6','2021-05-11 08:43:03'),(91,'Tull','Dirkin','tdirkin2i@google.com.hk','2136075048','9234e5bffe47156cad2ed8b9f21d149c','2021-03-15 15:50:57'),(92,'Stefa','Brideau','sbrideau2j@shinystat.com','2377178037','435c6eeee251b24f110e4003238269e9','2020-09-30 04:26:38'),(93,'Solly','Sherbrooke','ssherbrooke2k@booking.com','4045058648','30f13fe4094ed279ba584f8c1fbe9d0a','2021-05-06 08:03:19'),(94,'Markus','Durie','mdurie2l@pagesperso-orange.fr','6537381173','0fcee6a684ffc0414bda1a663051d2c5','2021-01-11 06:10:35'),(95,'Albina','Cuell','acuell2m@webmd.com','4685219393','978e61a887de82f441411fe4797263b4','2021-04-26 19:33:45'),(96,'Wendell','Rimer','wrimer2n@statcounter.com','3944692507','6cb8eed9c49eb22e29c15575e6e5e6fd','2021-01-04 12:19:48'),(97,'Gwyneth','Antill','gantill2o@blinklist.com','2045169428','fbb45abc7d4ece8f574bc40b0bf54f2a','2021-02-01 23:38:59'),(98,'Frayda','Kohen','fkohen2p@marriott.com','6903684386','768218008337cb6063c0ac62d41c1513','2020-09-08 15:20:53'),(99,'Orren','Pearl','opearl2q@mlb.com','6872130619','617d9cf7354032c6058fc643de0e8485','2021-02-07 11:27:52'),(100,'Doris','Dickey','ddickey2r@unc.edu','5201976946','400cc2edafff1596aff4dd4219eadd3c','2020-12-07 17:47:50');
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

-- Dump completed on 2021-08-18 19:19:41
