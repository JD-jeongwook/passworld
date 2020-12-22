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
-- Dumping data for table `event_table`
--

LOCK TABLES `event_table` WRITE;
/*!40000 ALTER TABLE `event_table` DISABLE KEYS */;
INSERT INTO `event_table` VALUES (1,'포인트 이벤트','로그인하는 모든유저 10000포인트 지급!','point.jpg','event1.jpg','event2.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,63,'2020-11-13 00:00:00','2020-11-26 00:00:00','done'),(2,'핑핑이벤트','핑핑이벤트','g5u4AUPT_400x400.jpg','g5u4AUPT_400x4001.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,'2020-11-17 00:00:00','2020-12-03 00:00:00','done'),(3,'test','test이벤트','Image-1.jpg','alev-takil-x2Or94kjaqo-unsplash.jpg','Image-11.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,'2020-11-05 00:00:00','2020-11-24 00:00:00','done'),(4,'123','123','alev-takil-x2Or94kjaqo-unsplash5.jpg','alev-takil-x2Or94kjaqo-unsplash6.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,'2020-11-10 00:00:00','2020-11-12 00:00:00','done'),(5,'44444444','4444','g5u4AUPT_400x4002.jpg','Image-12.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,'2020-11-12 00:00:00','2020-12-10 00:00:00','done'),(6,'paging','123','alev-takil-x2Or94kjaqo-unsplash7.jpg','alev-takil-x2Or94kjaqo-unsplash8.jpg','Image-13.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,'2020-11-06 00:00:00','2020-12-05 00:00:00','done'),(7,'paging','paging','alev-takil-x2Or94kjaqo-unsplash9.jpg','alev-takil-x2Or94kjaqo-unsplash10.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,'2020-11-13 00:00:00','2020-11-19 00:00:00','done'),(8,'paging','paging','alev-takil-x2Or94kjaqo-unsplash11.jpg','alev-takil-x2Or94kjaqo-unsplash12.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,55,'2020-11-13 00:00:00','2020-11-19 00:00:00','done'),(9,'paging','paging','alev-takil-x2Or94kjaqo-unsplash13.jpg','alev-takil-x2Or94kjaqo-unsplash14.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,'2020-11-13 00:00:00','2020-11-14 00:00:00','done'),(10,'이벤트 테스트','이벤트 테스트를 합니다','다운로드.jpg','다운로드1.jpg','다운로드2.jpg','다운로드3.jpg','다운로드4.jpg','다운로드5.jpg',NULL,NULL,NULL,NULL,17,'2020-11-10 00:00:00','2020-11-30 00:00:00','done'),(11,'삼성카드 결제 시 최대 1만원 할인 혜택','삼성카드 이용시 1만원 할인해드려요','thumbnail1.png','img11.png','img21.png','img31.png',NULL,NULL,NULL,NULL,NULL,NULL,24,'2020-11-18 00:00:00','2020-12-02 00:00:00','done'),(12,'Test Event','test event','alev-takil-x2Or94kjaqo-unsplash23.jpg','Image-15.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,'2020-11-12 00:00:00','2020-11-30 00:00:00','done'),(13,'결제시한 연장 서비스','항공권 24시간 보장 이벤트','twaythumbnail1.jpg','tway11.jpg','tway21.jpg','tway31.jpg',NULL,NULL,NULL,NULL,NULL,NULL,4,'2020-11-30 00:00:00','2022-12-31 00:00:00','doing'),(14,'항공권 스마일페이 예매이벤트','즉시 5%할인,최대 7.3% 캐쉬백','12.jpg','12.PNG','21.jpg','31.PNG',NULL,NULL,NULL,NULL,NULL,NULL,2,'2020-12-10 00:00:00','2020-12-31 00:00:00','doing');
/*!40000 ALTER TABLE `event_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-22 21:34:06
