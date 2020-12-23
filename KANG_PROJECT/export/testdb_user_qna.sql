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
-- Table structure for table `user_qna`
--

DROP TABLE IF EXISTS `user_qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_qna` (
  `id` varchar(20) DEFAULT NULL,
  `wTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(100) DEFAULT NULL,
  `contents` text,
  `frame` varchar(60) DEFAULT NULL,
  `complete` varchar(10) DEFAULT 'no',
  `admin` int DEFAULT '0',
  `no` int NOT NULL AUTO_INCREMENT,
  `hit` int DEFAULT '0',
  PRIMARY KEY (`no`),
  KEY `user_qna_id` (`id`),
  CONSTRAINT `user_qna_id` FOREIGN KEY (`id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_qna`
--

LOCK TABLES `user_qna` WRITE;
/*!40000 ALTER TABLE `user_qna` DISABLE KEYS */;
INSERT INTO `user_qna` VALUES ('male_id','2020-11-28 17:15:05','test','etst','포인트 사용처','yes',0,4,0),('eoen446','2020-11-30 02:54:29','항공편 관련질문드립니다.','문의드려요','항공편 관련 질문','yes',0,7,0),('eoen446','2020-11-30 02:54:50','게시글 질문이요','게시글','게시글 관련 질문','yes',0,8,0),('eoen446','2020-11-30 02:54:59','포인트는 어디다 쓰나요?','질문드려요','포인트 사용처','yes',0,9,0),('male_id','2020-12-10 19:02:15','이벤트는 어디서보나요?','이벤트는 어디서 봐야하나요','게시글 관련 질문','no',0,10,0),('male_id','2020-12-10 19:02:29','포인트는 어디서 사용하는지 궁금합니다.','알려주세요. 궁금해요.','포인트 사용처','no',0,11,0);
/*!40000 ALTER TABLE `user_qna` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-23 16:34:29
