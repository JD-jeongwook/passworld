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
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info` (
  `id` varchar(20) NOT NULL,
  `pw` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `person_num` char(13) NOT NULL,
  `postcode` int DEFAULT NULL,
  `address_1` varchar(50) DEFAULT NULL,
  `address_2` varchar(50) DEFAULT NULL,
  `detail_address` varchar(50) DEFAULT NULL,
  `extra_address` varchar(30) DEFAULT NULL,
  `phone_company` char(3) DEFAULT NULL,
  `f_phone` int DEFAULT NULL,
  `s_phone` int NOT NULL,
  `t_phone` int NOT NULL,
  `mail` varchar(30) NOT NULL,
  `get_email` varchar(15) DEFAULT NULL,
  `get_sns` varchar(15) DEFAULT NULL,
  `gender` char(6) DEFAULT NULL,
  `point` int DEFAULT '0',
  `admin` int DEFAULT '0',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `profile` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES ('admin','admin1234','관리자','1234',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'1',NULL,NULL,'male',350,1,'2020-11-09 19:29:10','타노스2.png'),('admin_new','123123123','관리자','9610021111111',6112,'서울 강남구 논현로123길 4-1','서울 강남구 논현동 130-26','강남 논현',' (논현동)','skt',10,4312,1234,'admin@naver.com','email_no','phone_no','male',0,1,'2020-12-10 19:15:42',NULL),('admin1111','123123123','관리자','1111111111111',5315,'서울 강동구 양재대로123길 7','','123',' (천호동, 강동그랑시아)','skt',10,123,4412,'123@123','email_no','phone_no','male',0,1,'2020-11-30 15:12:03',NULL),('admin123','123123123','어드민','9901010000000',6112,'서울 강남구 논현로123길 4-1','서울 강남구 논현동 130-26','123',' (논현동)','skt',10,1234,1234,'1234@1234','email_no','phone_no','male',0,1,'2020-11-19 11:15:25',NULL),('admin입니다','123123123','어드민','9610021000000',37929,'경북 포항시 남구 호미곶면 호미로1111번길 2-15','경북 포항시 남구 호미곶면 강사리 763-1','123','','skt',10,8000,8000,'123@123','email_no','phone_no','male',0,1,'2020-11-09 19:29:10','타노스22.png'),('bbangji1994','123123123','김영지','9403302000000',21043,'인천 계양구 경명대로 942','인천 계양구 계산동 763-47','서해 그린아파트',' (계산동)','skt',10,8005,3528,'bbangji1994@naver.com','email_no','phone_no','female',400,0,'2020-12-10 17:40:46','yengji.jpg'),('dayday','123123123','123123','123',6112,'서울 강남구 논현로123길 4-1','서울 강남구 논현동 130-26','123',' (논현동)','skt',10,1234,1234,'1234@123','email_no','phone_agree','male',250,0,'2020-11-09 19:48:24',NULL),('eoen446','rkd@1149','강정욱','9610021157029',22835,'인천 서구 가정로 115','인천 서구 가좌동 147-33','디바인시티 1202호',' (가좌동)','skt',10,9061,8319,'rkdwjddnr11@naver.com','email_no','phone_no','male',400,0,'2020-11-09 19:29:10','다운로드.jpg'),('female_id','123123123','female','123',5315,'서울 강동구 양재대로123길 7','','333',' (천호동, 강동그랑시아)','skt',10,333,333,'123123@123','email_no','phone_no','female',150,0,'2020-11-09 19:29:10',NULL),('hello_','123123123','123@123','@123',6112,'서울 강남구 논현로123길 4-1','서울 강남구 논현동 130-26','123',' (논현동)','skt',10,1234,1234,'1234@1234','email_no','phone_no','male',0,0,'2020-11-09 19:29:10',NULL),('hong11','123123123','홍길동','9001011000000',53100,'경남 통영시 욕지면 조선길 3','','조선아파트 1101호','','skt',10,4321,1234,'hong123@naver.com','email_no','phone_no','male',1000,0,'2020-12-10 18:56:37','hong1.jpg'),('hong123','123123123','홍길동','9610021111111',53100,'경남 통영시 욕지면 조선길 3','','조선','','skt',10,0,0,'hong111@naver.com','email_no','phone_no','male',500,0,'2020-12-10 17:25:40','hong.jpg'),('kingkong','123123123','킹콩','123123123',6112,'서울 강남구 논현로123길 4-1','서울 강남구 논현동 130-26','123123',' (논현동)','skt',10,1234,4321,'1234@1234','email_no','phone_no','male',850,0,'2020-11-09 19:29:10','king.jpg'),('kjwi8319','123123123','강정욱','9610021111111',22835,'인천 서구 가정로 115','인천 서구 가좌동 147-33','123',' (가좌동)','skt',10,9061,8319,'rkdwjddnr11@naver.com','email_agree','phone_agree','male',310,0,'2020-11-10 14:56:38',NULL),('male_id','123123123','남성','123123123',5315,'서울 강동구 양재대로123길 7','','123123','    (천호동, 강동그랑시아)','skt',11,1231,1232,'rkdwjdnr123@123123','email_no','phone_no','male',406650,0,'2020-11-09 19:29:10','event2.jpg'),('newbie','123123123','홍길동','0001011000000',59000,'전남 해남군 화원면 조선소길 32','전남 해남군 화원면 마산리 691-4','주소','','skt',10,4315,4215,'hong123@naver.com','email_no','phone_no','male',300,0,'2020-12-10 17:03:59','Newbie-frog.png'),('park_bird','123123123','박새로이','9001011000000',4390,'서울 용산구 녹사평대로 132','서울 용산구 이태원동 34-158','이태원',' (이태원동)','skt',10,1231,1231,'parkpark123@naver.com','email_no','phone_no','male',150,0,'2020-12-10 17:48:09','park.jpg'),('rrrr1111','rkd@1149','강정욱','9610021157029',6112,'서울 강남구 논현로123길 4-1','서울 강남구 논현동 130-26','',' (논현동)','skt',10,9061,8319,'r@123','email_no','phone_no','male',0,0,'2020-11-12 15:45:54',NULL),('test_id','123123123','강정욱','9610020000000',6122,'서울 강남구 논현로111길 3','서울 강남구 논현동 192-15','123',' (논현동, 휴먼스페이스주상복합아파트)','skt',10,1231,1231,'123123@123123','email_no','phone_no','male',100,0,'2020-11-09 19:29:10','킹콩1.jpg'),('testst','123123123','1231231','123123123',7628,'서울 강서구 남부순환로11가길 8','서울 강서구 공항동 1337-6','3123',' (공항동)','skt',10,1231,1241,'1231@123','email_no','phone_no','male',150,0,'2020-11-09 19:29:10','타노스24.png'),('under_bar','123123123','123','123',5021,'서울 광진구 광나루로22가길 7','서울 광진구 화양동 498-5','123',' (화양동)','skt',10,123,123,'12312@3123','email_no','phone_no','male',7500,0,'2020-11-09 19:29:10',NULL),('yeongji1994','zxasqw@2','김영지','9403302149815',21051,'인천 계양구 주부토로501번길 26','인천 계양구 계산동 954-30','3동 305호','   (계산동, 서해그린아파트)','lg',10,8005,3528,'bbangji1994@naver.com','email_no','phone_no','female',12500,0,'2020-11-09 19:29:10','themeBoard_img_1.jpg'),('yeongjiAdmin','123123123','김영지','9403302222222',21051,'인천 계양구 주부토로501번길 26','인천 계양구 계산동 954-30','3동 305호',' (계산동, 서해그린아파트)','lg',10,8005,3528,'bbangji1994@naver.com','email_no','phone_no','female',0,1,'2020-11-10 18:36:40','kang1.jpg');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
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
