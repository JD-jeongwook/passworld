-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: testdb
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `user_coupon`
--

DROP TABLE IF EXISTS `user_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_coupon` (
  `no` int NOT NULL AUTO_INCREMENT,
  `id` varchar(20) DEFAULT NULL,
  `market` varchar(20) DEFAULT NULL,
  `item` varchar(20) DEFAULT NULL,
  `img` varchar(50) DEFAULT NULL,
  `start` datetime DEFAULT CURRENT_TIMESTAMP,
  `end` datetime DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `user_coupon_id` (`id`),
  CONSTRAINT `user_coupon_id` FOREIGN KEY (`id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_coupon`
--

LOCK TABLES `user_coupon` WRITE;
/*!40000 ALTER TABLE `user_coupon` DISABLE KEYS */;
INSERT INTO `user_coupon` VALUES (1,'male_id','뚜레쥬르','모바일 3천원권','tous1.jpg','2020-11-18 15:05:21','2020-12-18 15:05:21'),(2,'male_id','메가박스','메가박스 2인 패키지','mega2.jpg','2020-11-18 15:10:48','2020-12-18 15:10:48'),(3,'male_id','메가박스','메가박스 2인 패키지','mega2.jpg','2020-11-18 16:35:35','2020-12-18 16:35:35'),(4,'eoen446','이마트24','빙그레 바나나우유','bmilk.jpg','2020-11-18 16:56:16','2020-12-18 16:56:16'),(5,'male_id','뚜레쥬르','모바일 5천원권','tous2.jpg','2020-11-18 18:20:35','2020-12-18 18:20:35'),(6,'male_id','스타벅스','아이스 카라멜마끼야또 Tall','star12.jpg','2020-11-18 18:20:39','2020-12-18 18:20:39'),(7,'male_id','GS25','모바일 5천원권','gs12.jpg','2020-11-30 15:10:42','2020-12-30 15:10:42'),(8,'eoen446','이마트24','빙그레 바나나우유','bmilk.jpg','2020-12-10 19:03:37','2021-01-10 19:03:37');
/*!40000 ALTER TABLE `user_coupon` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-23 16:34:28
