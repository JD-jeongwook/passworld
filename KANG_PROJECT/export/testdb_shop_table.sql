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
-- Table structure for table `shop_table`
--

DROP TABLE IF EXISTS `shop_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_table` (
  `no` int NOT NULL AUTO_INCREMENT,
  `market` varchar(20) DEFAULT NULL,
  `item` varchar(20) DEFAULT NULL,
  `frame` varchar(20) DEFAULT NULL,
  `img` varchar(50) DEFAULT NULL,
  `price` int DEFAULT '0',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_table`
--

LOCK TABLES `shop_table` WRITE;
/*!40000 ALTER TABLE `shop_table` DISABLE KEYS */;
INSERT INTO `shop_table` VALUES (1,'스타벅스','아이스 카라멜마끼야또 Tall','커피 / 아이스크림','star12.jpg',5600),(2,'CU','모바일 5천원권','마트 / 편의점','cu1.jpg',5000),(4,'이마트24','빙그레 바나나우유','마트 / 편의점','bmilk.jpg',1300),(5,'CU','모바일 1만원권','마트 / 편의점','cu11.jpg',10000),(12,'CU','모바일 3천원권','마트 / 편의점','cu18.jpg',3000),(13,'GS25','모바일 1만원권','마트 / 편의점','gs11.jpg',10000),(14,'GS25','모바일 5천원권','마트 / 편의점','gs12.jpg',5000),(15,'GS25','모바일 3천원권','마트 / 편의점','gs13.jpg',3000),(17,'버거킹','트러플 머쉬룸 와퍼 세트','햄버거 / 피자 / 치킨','burgerking11.png',8000),(19,'버거킹','콰트로치즈 와퍼 세트','햄버거 / 피자 / 치킨','burgerking21.png',9500),(20,'버거킹','기네스 와퍼 세트','햄버거 / 피자 / 치킨','bergerking3.png',9500),(21,'버거킹','몬스터 와퍼 세트','햄버거 / 피자 / 치킨','bergerking4.png',8900),(22,'버거킹','치즈 와퍼 세트','햄버거 / 피자 / 치킨','bergerking5.png',8500),(23,'메가박스','메가박스 1인 일반관람권','영화 / 레저','mega1.jpg',10000),(24,'메가박스','메가박스 2인 패키지','영화 / 레저','mega2.jpg',28500),(25,'메가박스','메가박스 1인 패키지','영화 / 레저','mega3.jpg',16700),(26,'파리바게뜨','모바일 3천원권','베이커리','parisb1.jpg',3000),(27,'파리바게트','모바일 5천원권','베이커리','parisb2.jpg',5000),(28,'뚜레쥬르','모바일 3천원권','베이커리','tous1.jpg',3000),(29,'뚜레쥬르','모바일 5천원권','베이커리','tous2.jpg',5000),(30,'PASS WORLD','크루즈 여행권','영화 / 레저','trip_picture_20.jpg',3000000),(31,'CU','오렌지쥬스','마트 / 편의점','orange.jpg',4500),(32,'GS25','오렌지쥬스','마트 / 편의점','orange1.jpg',4500);
/*!40000 ALTER TABLE `shop_table` ENABLE KEYS */;
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
