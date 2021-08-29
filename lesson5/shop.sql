-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: shop
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
-- Table structure for table `catalogs`
--

DROP TABLE IF EXISTS `catalogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'название раздела',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `unique_name` (`name`(10))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='разделы интернет-магазина';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs`
--

LOCK TABLES `catalogs` WRITE;
/*!40000 ALTER TABLE `catalogs` DISABLE KEYS */;
INSERT INTO `catalogs` VALUES (1,'Процессоры (Intel)'),(2,'Мат.платы'),(3,'Видеокарты');
/*!40000 ALTER TABLE `catalogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `discount` float unsigned DEFAULT NULL COMMENT 'Величина скидки от 0.0 до 1.0',
  `started_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `index_of_user_id` (`user_id`),
  KEY `index_of_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Скидки';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integers`
--

DROP TABLE IF EXISTS `integers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integers` (
  `value` bigint unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`value`),
  UNIQUE KEY `value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integers`
--

LOCK TABLES `integers` WRITE;
/*!40000 ALTER TABLE `integers` DISABLE KEYS */;
INSERT INTO `integers` VALUES (1),(2),(3),(4),(5),(6);
/*!40000 ALTER TABLE `integers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int unsigned DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Заказы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_products` (
  `id` int unsigned DEFAULT NULL,
  `order_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `total` int unsigned DEFAULT '1' COMMENT 'Колличество заказанных товарных позиций'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Состав заказа';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products`
--

LOCK TABLES `orders_products` WRITE;
/*!40000 ALTER TABLE `orders_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'название',
  `description` text COMMENT 'описание',
  `price` decimal(11,2) DEFAULT NULL COMMENT 'цена',
  `catalog_id` int unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='товарные позиции';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storehouses`
--

DROP TABLE IF EXISTS `storehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storehouses` (
  `id` int unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT 'Название',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Склады';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouses`
--

LOCK TABLES `storehouses` WRITE;
/*!40000 ALTER TABLE `storehouses` DISABLE KEYS */;
/*!40000 ALTER TABLE `storehouses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storehouses_products`
--

DROP TABLE IF EXISTS `storehouses_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storehouses_products` (
  `id` int unsigned NOT NULL,
  `storehouse_id` int unsigned DEFAULT NULL,
  `value` int unsigned DEFAULT NULL COMMENT 'Запас товарной позиции на складе',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Запасы на складе';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouses_products`
--

LOCK TABLES `storehouses_products` WRITE;
/*!40000 ALTER TABLE `storehouses_products` DISABLE KEYS */;
INSERT INTO `storehouses_products` VALUES (1,1,59,'2021-01-02 14:26:03','2020-10-16 22:01:15'),(2,2,50,'2020-09-24 19:32:53','2021-03-03 14:08:14'),(3,3,59,'2020-12-26 03:35:50','2021-06-15 12:51:11'),(4,4,49,'2021-08-06 02:54:35','2020-11-26 15:09:10'),(5,5,27,'2020-10-10 00:29:09','2020-12-22 01:53:41'),(6,6,39,'2021-07-24 06:44:49','2021-07-28 00:43:38'),(7,7,55,'2021-06-07 13:46:23','2021-03-05 16:49:34'),(8,8,52,'2021-02-02 10:34:37','2021-07-15 01:44:35'),(9,9,2,'2021-04-06 17:10:25','2020-11-05 04:15:41'),(10,10,98,'2021-06-11 23:50:39','2021-07-28 00:19:10'),(11,11,24,'2021-03-31 07:21:32','2021-03-19 19:06:45'),(12,12,0,'2020-10-02 18:26:58','2021-01-09 15:33:28'),(13,13,22,'2020-09-23 16:22:01','2021-03-19 08:34:21'),(14,14,54,'2021-02-01 08:55:41','2021-01-31 21:53:13'),(15,15,76,'2020-12-24 11:31:53','2021-07-05 15:48:57'),(16,16,46,'2021-01-28 05:50:47','2021-07-31 02:13:12'),(17,17,42,'2021-04-18 02:29:54','2020-09-09 15:40:23'),(18,18,92,'2021-02-20 11:24:14','2021-07-24 10:46:02'),(19,19,10,'2020-12-29 11:40:34','2021-08-12 05:56:08'),(20,20,52,'2021-02-21 07:25:17','2021-07-28 02:13:29'),(21,21,3,'2021-06-04 21:05:55','2020-10-28 11:43:17'),(22,22,0,'2021-04-10 10:25:20','2021-05-23 08:03:07'),(23,23,10,'2021-01-16 07:46:27','2020-09-03 07:34:36'),(24,24,31,'2020-09-26 18:46:45','2021-04-07 23:28:24'),(25,25,59,'2021-04-03 14:30:18','2021-03-09 05:08:52'),(26,26,19,'2021-04-28 09:02:00','2021-06-07 04:58:24'),(27,27,28,'2020-12-27 12:06:29','2021-07-31 13:16:52'),(28,28,97,'2021-05-21 13:46:01','2021-07-07 04:20:20'),(29,29,20,'2021-02-05 23:46:05','2020-11-26 10:34:20'),(30,30,54,'2021-03-05 19:56:25','2021-07-31 20:26:48'),(31,31,74,'2021-07-21 08:27:58','2021-07-12 15:52:55'),(32,32,87,'2020-08-31 07:45:52','2021-06-29 10:54:32'),(33,33,3,'2021-07-17 14:31:37','2021-07-14 09:41:38'),(34,34,20,'2020-11-26 04:09:44','2021-03-14 07:03:01'),(35,35,36,'2021-05-18 00:42:47','2021-01-18 14:37:56'),(36,36,29,'2021-01-24 09:16:31','2021-04-23 17:25:24'),(37,37,54,'2021-02-10 15:35:03','2021-04-24 05:22:43'),(38,38,36,'2021-02-01 13:37:37','2020-10-23 06:20:14'),(39,39,6,'2021-02-07 00:55:34','2020-09-24 07:06:47'),(40,40,2,'2020-09-29 01:11:17','2020-12-20 22:18:21'),(41,41,77,'2021-05-29 23:24:06','2021-03-20 22:15:58'),(42,42,82,'2021-01-22 01:35:46','2020-12-07 21:33:35'),(43,43,46,'2020-09-17 23:10:23','2021-01-27 16:31:35'),(44,44,40,'2021-06-26 16:25:10','2021-05-15 02:49:52'),(45,45,69,'2021-07-27 00:51:56','2020-12-26 23:52:02'),(46,46,6,'2021-03-22 09:05:20','2021-01-30 17:46:09'),(47,47,67,'2021-08-22 08:03:33','2021-05-19 03:07:46'),(48,48,53,'2021-04-02 20:46:33','2021-01-25 23:48:59'),(49,49,58,'2020-11-04 06:42:46','2020-10-26 18:01:13'),(50,50,2,'2020-12-20 02:25:49','2021-03-31 21:30:08'),(51,51,52,'2021-04-09 21:44:30','2021-07-10 01:29:34'),(52,52,0,'2020-12-05 04:55:26','2021-08-08 13:45:42'),(53,53,30,'2021-01-28 14:45:02','2020-09-04 20:44:03'),(54,54,22,'2021-01-22 22:57:39','2021-05-09 09:24:30'),(55,55,59,'2021-04-02 19:37:09','2020-09-09 20:51:44'),(56,56,64,'2021-05-29 10:47:14','2020-12-01 21:15:23'),(57,57,28,'2021-01-30 04:37:03','2021-07-08 03:58:11'),(58,58,0,'2020-11-23 13:42:38','2020-10-29 12:00:22'),(59,59,2,'2020-12-16 18:24:58','2021-03-30 10:26:31'),(60,60,61,'2020-11-23 22:12:39','2020-12-27 16:45:32'),(61,61,54,'2021-02-12 18:49:46','2021-01-09 04:21:36'),(62,62,83,'2021-01-15 11:16:22','2020-11-25 19:58:00'),(63,63,32,'2021-03-19 21:36:32','2021-06-12 14:15:13'),(64,64,14,'2020-09-11 16:38:46','2021-04-15 02:35:48'),(65,65,91,'2020-09-26 10:13:12','2021-07-12 14:48:50'),(66,66,98,'2020-12-04 21:03:32','2021-08-24 08:53:16'),(67,67,16,'2021-03-07 22:15:25','2020-10-07 06:20:29'),(68,68,0,'2020-09-10 06:58:57','2021-02-28 21:15:22'),(69,69,73,'2021-02-10 18:39:50','2020-08-28 23:07:46'),(70,70,19,'2021-06-11 22:21:33','2020-10-25 16:00:09'),(71,71,66,'2021-05-28 19:59:24','2021-03-28 02:28:37'),(72,72,69,'2021-03-02 08:48:49','2020-12-24 19:23:10'),(73,73,89,'2021-04-20 19:18:06','2021-03-08 07:10:56'),(74,74,22,'2020-11-19 16:46:59','2021-05-05 08:38:20'),(75,75,0,'2021-01-02 17:47:55','2020-11-18 18:28:53'),(76,76,5,'2021-05-27 21:15:02','2020-12-13 11:25:26'),(77,77,27,'2021-07-05 20:06:35','2021-02-20 12:18:56'),(78,78,33,'2021-05-15 16:55:44','2021-08-01 07:07:01'),(79,79,0,'2020-11-02 02:54:18','2021-07-12 08:05:18'),(80,80,4,'2021-07-18 05:05:16','2021-06-22 09:57:50'),(81,81,86,'2020-10-04 04:52:28','2021-05-06 02:05:30'),(82,82,1,'2021-08-06 17:25:52','2021-01-12 18:33:51'),(83,83,31,'2021-07-14 23:09:57','2021-07-05 05:04:53'),(84,84,94,'2021-06-16 05:21:01','2021-02-06 02:24:53'),(85,85,96,'2021-03-31 07:11:07','2021-03-14 17:31:45'),(86,86,70,'2021-01-23 11:17:30','2021-06-12 06:02:21'),(87,87,71,'2021-06-24 08:02:39','2020-11-05 13:37:40'),(88,88,71,'2021-03-15 17:25:55','2020-09-02 05:40:04'),(89,89,8,'2021-01-09 15:46:48','2021-06-09 17:43:11'),(90,90,98,'2021-01-17 01:39:26','2020-10-08 17:58:26'),(91,91,91,'2020-11-01 20:12:13','2020-12-24 08:38:54'),(92,92,23,'2021-04-17 05:21:55','2021-03-28 12:00:54'),(93,93,57,'2021-01-03 19:58:52','2020-11-20 19:47:00'),(94,94,54,'2020-12-27 05:24:22','2021-04-18 13:56:58'),(95,95,26,'2021-05-20 02:12:48','2020-11-27 22:54:02'),(96,96,17,'2021-06-11 03:55:00','2021-02-14 00:39:42'),(97,97,35,'2021-05-30 05:51:47','2021-07-07 20:45:15'),(98,98,30,'2021-07-01 02:33:35','2020-10-27 05:41:54'),(99,99,12,'2021-08-01 01:04:23','2020-11-23 18:49:10'),(100,100,70,'2021-07-27 18:09:06','2020-09-28 17:01:48');
/*!40000 ALTER TABLE `storehouses_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl`
--

DROP TABLE IF EXISTS `tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl` (
  `name` char(10) DEFAULT 'anonymous',
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl`
--

LOCK TABLES `tbl` WRITE;
/*!40000 ALTER TABLE `tbl` DISABLE KEYS */;
INSERT INTO `tbl` VALUES ('anonymous','Новый пользователь'),('anonymous','Новый пользователь');
/*!40000 ALTER TABLE `tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT 'имя покупателя',
  `birthday_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='покупатели';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'hello','1979-01-27 00:00:00','2021-08-13 23:39:38'),(1,'Clayton Ballston','1975-07-06 08:19:31','2021-02-04 10:29:36'),(2,'Bink McClurg','1994-11-11 16:13:38','2020-10-08 06:09:43'),(3,'Chevy Petkov','1995-02-27 13:41:21','2021-01-02 16:08:59'),(4,'Hal Yitzowitz','1996-12-04 04:41:46','2021-06-23 03:23:05'),(5,'Francoise Lidgard','1966-03-26 09:46:26','2021-06-14 17:01:43'),(6,'Camellia Van Rembrandt','1982-01-27 09:51:05','2021-08-10 02:29:04'),(7,'Anallise Lonergan','1999-03-20 18:14:07','2020-12-21 00:29:31'),(8,'Reese Saffle','1995-01-27 23:07:41','2021-08-25 14:33:45'),(9,'Skippy Woodington','1988-10-29 13:56:04','2021-03-15 18:58:40'),(10,'Sharai Goomes','2000-08-16 07:00:20','2021-07-03 06:29:23'),(11,'Benjie Parsand','2004-01-12 22:53:30','2021-01-07 08:40:22'),(12,'Opalina Songist','2001-08-09 19:52:45','2021-02-18 01:51:20'),(13,'Chan Bassindale','2005-01-27 10:58:23','2021-06-15 03:34:40'),(14,'Nellie Exter','1975-04-08 19:55:15','2020-09-13 00:12:13'),(15,'Dolf Souza','1978-04-19 12:30:05','2021-07-10 11:29:01'),(16,'Sal Tustin','1981-05-04 02:46:24','2020-08-30 12:16:22'),(17,'Hali Manoelli','1992-02-19 16:42:54','2020-09-01 16:03:22'),(18,'Erroll Dwyr','1989-01-28 02:53:07','2021-04-04 03:35:03'),(19,'Myrwyn Bridden','1991-04-10 18:35:21','2021-08-08 00:34:34'),(20,'Gabie Wehden','1974-09-09 20:37:20','2021-06-29 21:03:30'),(21,'Artemas Brittain','1972-10-10 13:01:19','2021-05-28 23:38:05'),(22,'Marlin Linck','1999-09-18 08:16:18','2020-12-24 23:36:42'),(23,'Lonnie Knill','2000-06-20 10:40:25','2020-11-10 17:44:40'),(24,'Kelli Yanov','1980-07-18 06:00:20','2021-02-16 00:00:42'),(25,'Angil Gallandre','1972-01-14 23:10:29','2021-06-13 05:23:13'),(26,'Gwyn Abram','2002-02-13 19:18:29','2021-07-16 03:18:22'),(27,'June Isbell','1974-01-27 17:16:59','2021-01-02 17:42:13'),(28,'Shelagh Emmot','1980-05-07 15:47:27','2021-08-06 04:43:24'),(29,'Kala Giacobillo','1966-02-17 07:43:18','2021-05-07 22:35:29'),(30,'Karin Rablin','1975-02-09 21:14:02','2021-02-27 12:47:59'),(31,'Che Pessolt','1991-07-16 06:20:19','2020-11-19 04:03:22'),(32,'Phil Raymond','1970-11-26 02:33:11','2020-09-30 00:19:47'),(33,'Earl Scedall','1977-01-04 01:25:13','2021-04-19 08:03:39'),(34,'Evonne Pepperill','1973-08-29 16:16:37','2021-01-30 22:57:57'),(35,'Chloette Simion','1973-04-07 23:11:38','2021-08-21 10:20:44'),(36,'Flynn Fenkel','2004-02-14 14:19:55','2021-07-07 20:29:34'),(37,'Lezley Dyble','1991-02-10 00:17:31','2020-09-02 01:42:47'),(38,'Mallory Gozzard','1980-10-17 17:40:12','2021-02-16 04:59:35'),(39,'Gabriellia Pischof','2004-08-20 04:01:49','2020-10-24 14:34:30'),(40,'Sly Redler','1991-09-01 10:43:03','2021-01-15 01:07:34'),(41,'Tabbitha Blackborn','1970-05-11 03:58:17','2020-10-07 21:03:18'),(42,'Idaline Hurworth','1968-11-18 04:13:59','2021-02-16 17:00:18'),(43,'Kiley Meecher','1969-11-24 16:52:10','2021-04-13 14:18:38'),(44,'Trefor Castle','1999-09-05 07:54:17','2021-08-13 22:48:33'),(45,'Gwenni Maydway','1987-03-16 06:44:25','2020-09-09 00:59:00'),(46,'Abagail Coonan','1997-01-27 15:24:22','2021-08-13 01:33:51'),(47,'Joceline Edelston','2005-08-22 08:34:44','2021-04-07 23:32:26'),(48,'Remington Tuckett','1996-03-15 13:34:20','2020-12-13 18:59:33'),(49,'Nicky Iveagh','1998-11-30 02:07:56','2020-11-10 04:59:27'),(50,'Claudius Amorine','1998-01-03 15:32:10','2021-07-05 10:55:45'),(51,'Heath Peebles','1992-10-21 17:46:58','2021-04-05 09:41:52'),(52,'Clay Blackey','1990-01-09 01:37:40','2021-05-20 09:24:19'),(53,'Murvyn Biernacki','1971-05-12 12:27:53','2021-02-20 04:27:29'),(54,'Lorianne Lealle','1976-12-10 21:59:54','2021-06-18 03:33:05'),(55,'Roy Formby','1973-11-24 22:12:59','2020-10-31 23:36:09'),(56,'Milo Jennery','1967-03-13 02:26:57','2021-08-06 15:13:21'),(57,'Marcille Lassell','1976-11-21 10:21:35','2020-12-31 07:17:33'),(58,'Graeme Courtman','2005-07-03 15:34:01','2021-03-28 17:17:54'),(59,'Bernetta Spurdens','1983-01-27 18:43:16','2021-02-07 03:40:10'),(60,'Nicolle Easen','1994-08-11 05:12:35','2021-02-22 06:31:06'),(61,'Virge Stitwell','1966-10-09 04:45:11','2020-09-04 06:37:43'),(62,'Lion Mc Harg','1999-08-17 03:49:51','2021-04-29 05:27:58'),(63,'Perceval Lownie','1999-11-27 22:42:41','2020-11-26 12:57:13'),(64,'Claiborne Marks','1966-06-12 14:53:06','2021-06-18 19:26:33'),(65,'Burt Alway','1982-08-04 08:55:19','2020-11-04 19:18:04'),(66,'Haskel Dougher','1970-07-11 19:37:58','2020-11-22 20:13:08'),(67,'Palm Trousdell','1968-02-17 14:37:06','2021-08-20 02:20:56'),(68,'Teddie Nardi','1969-11-29 01:20:13','2021-07-21 20:35:54'),(69,'Bald Marchant','1982-11-29 01:23:19','2021-01-06 07:33:27'),(70,'Erasmus Flute','1981-06-04 10:14:35','2020-10-01 19:36:06'),(71,'Marsh Ecclestone','1989-04-09 22:47:39','2021-03-23 17:25:43'),(72,'Eleanore McNickle','1993-09-17 05:17:44','2021-08-25 18:40:30'),(73,'Willdon Lowin','1967-07-27 06:51:49','2020-09-03 04:30:00'),(74,'Monah Pannaman','2000-06-26 23:37:13','2021-07-23 13:37:46'),(75,'Lana Ellcome','1981-10-28 01:47:52','2021-03-08 10:19:38'),(76,'Corly Arnecke','1995-09-15 09:04:26','2020-09-10 14:40:57'),(77,'Lilith Denness','1995-04-30 07:33:28','2021-01-05 05:57:20'),(78,'Celinda Benam','1981-02-10 03:48:31','2020-12-28 21:34:33'),(79,'Martie Aneley','1983-09-13 15:27:36','2020-12-06 13:58:53'),(80,'Kathy Wakenshaw','1996-08-01 01:34:06','2021-06-08 09:27:11'),(81,'Dore Caisley','1975-01-25 14:49:43','2021-05-29 12:17:38'),(82,'Ginni Fosserd','1998-07-14 03:16:07','2021-01-10 02:27:19'),(83,'Guillermo Unwins','1966-12-09 12:50:25','2020-12-26 03:20:18'),(84,'Meta Wolver','1982-02-13 23:51:51','2021-07-22 03:53:09'),(85,'Vinson Purnell','1993-12-25 19:26:50','2020-12-24 06:32:02'),(86,'Jessamine Kapiloff','1991-05-06 22:02:54','2021-01-28 15:38:44'),(87,'Penny Glasman','1986-01-06 17:48:09','2020-09-19 21:50:09'),(88,'Courtney Le Marquis','1977-06-08 11:41:12','2021-02-28 16:49:42'),(89,'Damiano Yakunin','1967-01-21 23:49:16','2021-04-01 11:07:51'),(90,'Hesther Snufflebottom','1970-12-05 13:36:15','2021-01-13 14:38:05'),(91,'Tony Haggidon','1990-08-23 05:08:37','2020-12-07 06:47:13'),(92,'Donall Linscott','1990-03-31 21:39:41','2021-05-24 20:21:27'),(93,'Brien Baldam','1982-10-27 12:28:47','2021-03-21 02:38:00'),(94,'Grace Potzold','1968-08-09 10:57:31','2021-06-30 10:00:02'),(95,'Derby McFater','1965-10-14 15:04:17','2021-07-31 19:07:22'),(96,'Adelheid Wooffitt','2002-08-16 01:46:41','2021-03-21 16:22:26'),(97,'Bard Cotte','1997-01-26 15:12:01','2020-09-25 11:17:50'),(98,'Dev Cescon','1997-03-27 02:40:34','2021-04-01 10:20:07'),(99,'Reeva Moorman','1973-07-25 20:24:07','2021-06-11 07:42:35'),(100,'Merl Morgen','1992-02-24 04:31:00','2020-12-01 18:02:49');
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

-- Dump completed on 2021-08-29  0:12:04
