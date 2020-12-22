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
-- Dumping data for table `notice_table`
--

LOCK TABLES `notice_table` WRITE;
/*!40000 ALTER TABLE `notice_table` DISABLE KEYS */;
INSERT INTO `notice_table` VALUES (1,'공지테스트','아아 공지테스트','2020-11-16 14:36:34',15),(2,'공지테스트2','공지를 두번째 테스트합니다.','2020-11-16 15:34:37',142),(3,'공지테스트3','테스트3 이제 삭제만들어야함.','2020-11-16 16:21:58',1),(4,'공지테스트4 수정테스트','수정 다만들었다 수정테스트를 해보자.','2020-11-16 16:22:18',6),(7,'공지 페이징 테스트 1','공지 페이징 테스트 1','2020-11-16 17:31:00',1),(8,'공지 페이징 테스트 2','공지 페이징 테스트 2','2020-11-16 17:31:06',0),(9,'공지 페이징 테스트 3','공지 페이징 테스트 3','2020-11-16 17:31:13',0),(10,'공지 페이징 테스트 4','공지 페이징 테스트 4','2020-11-16 17:31:18',0),(11,'공지 페이징 테스트 5','공지 페이징 테스트 5','2020-11-16 17:31:22',0),(12,'공지 페이징 테스트 6','공지 페이징 테스트 6','2020-11-16 17:31:26',1),(13,'공지 페이징 테스트 7','공지 페이징 테스트 7','2020-11-16 17:31:32',5),(14,'새로운 공지사항입니다.','게시글을 올릴때 깨끗한 언어 사용 부탁드립니다.','2020-12-10 19:18:11',1);
/*!40000 ALTER TABLE `notice_table` ENABLE KEYS */;
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
