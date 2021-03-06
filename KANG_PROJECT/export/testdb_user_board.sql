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
-- Table structure for table `user_board`
--

DROP TABLE IF EXISTS `user_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_board` (
  `no` int NOT NULL AUTO_INCREMENT,
  `title` varchar(60) DEFAULT NULL,
  `id` varchar(30) DEFAULT NULL,
  `recommend` int DEFAULT '0',
  `hit` int DEFAULT '0',
  `contents` text,
  `img` varchar(100) DEFAULT NULL,
  `wTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `comment` int DEFAULT NULL,
  `admin` int DEFAULT '0',
  PRIMARY KEY (`no`),
  KEY `board_id_fk` (`id`),
  CONSTRAINT `board_id_fk` FOREIGN KEY (`id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_board`
--

LOCK TABLES `user_board` WRITE;
/*!40000 ALTER TABLE `user_board` DISABLE KEYS */;
INSERT INTO `user_board` VALUES (1,'스페인 마드리드에 다녀왔어요!','male_id',0,2,'14박 15일 다녀왔습니다~ 또 가고싶네요','photo-1605136260265-6752c5441a47.jpg','2020-12-10 16:53:23',0,0),(2,'오페라하우스 보고왔어요','eoen446',8,19,'사진이 너무 잘나와서 글 올려봐요!','sydney.jpg','2020-12-10 16:55:50',1,0),(3,'부산 여행','kjwi8319',0,4,'코시국이라.. 멀리는 못가고 부산여행 다녀왔습니다!','busan.jpg','2020-12-10 16:59:50',1,0),(4,'우유니 소금사막! 인생여행지에요','female_id',0,2,'별 기대없이 갔는데 너무 좋았습니다!','uyuni.jpg','2020-12-10 17:02:16',0,0),(5,'옥토버페스트 맥주축제','newbie',0,3,'맥주를 너무 좋아해서 결국 독일까지 가서\r\n맥주축제 즐기고왔네요! 완전 재밌었어요','beer.jpg','2020-12-10 17:09:07',1,0),(6,'푸켓에 다녀왔습니다','dayday',0,0,'아쉽게 사진은 없지만.. 글 올려봐요\r\n4박5일 짧게 다녀왔는데 또 가고싶네요',NULL,'2020-12-10 17:11:31',0,0),(7,'홍콩여행 후기','kingkong',0,1,'밀랍박물관, 심포니 오브 라이트 등 볼거는 정말많아요!\r\n하지만 음식은 호불호가 많이 갈릴거같네요.','hongkong.jpg','2020-12-10 17:18:09',0,0),(8,'사이트 추천으로 베네치아다녀왔어요','testst',0,0,'예전부터 가고싶었는데 사이트 추천여행지에 베네치아 있어서\r\n바로 예약하고 다녀왔습니다! 생각했던거보다 더 좋았네요!','venezia.jpg','2020-12-10 17:20:51',0,0),(9,'몰디브 여행','male_id',0,2,'스쿠버 다이빙도 하고 정말 잘 놀다왔네요','Maldives.jpg','2020-12-10 17:22:28',0,0),(10,'오사카 도톤보리','hong123',0,1,'도톤보리 근처에서 숙소잡고 3박4일 여행다녀왔어요\r\n숙소옆에있는 텐동집이 아주 맛있었고\r\n전체적으로 음식들이 다 입에 맞았네요','osaka.jpg','2020-12-10 17:28:44',0,0),(11,'로마 꼭 가보세요','dayday',0,1,'사진 한장으로 모든게 설명되네요 너무 멋있어요','roma.jpg','2020-12-10 17:31:27',0,0),(12,'러시아 여행 다녀오신분 있나요?','eoen446',0,0,'다음달에 러시아 여행가는데 많이 추울까요?','russia.jpg','2020-12-10 17:34:32',0,0),(13,'추운겨울엔 따뜻한나라로!','eoen446',1,5,'어제 베트남에서 돌아왔어요.\r\n또 가고싶네요 !','vietnam.jpg','2020-12-10 17:37:56',1,0),(14,'이태원 많이 놀러오세요','park_bird',0,1,'물론 코로나 잠잠해지면요..\r\n이태원 맛집은 꿀밤!','Itaewon.jpg','2020-12-10 17:50:00',0,0),(15,'다시가고싶은 상해','bbangji1994',0,6,'다른사람들꺼 후기엔 중화권이없어서 내가 처음 쓴 중국여행기!\r\n상해는 진짜좋다 많은사람들이 중국에대해 안좋은 인식을 갖고있지만, 적어도 나는 너무 좋은 인상이였다. 비행기에서 내리면 대륙의 스케일답게 넓은 공항에 입이 딱 벌어졌었다.\r\n상해는 일단 진짜 넓고,,사람도 많다ㅎㅎㅎ...사람이 무지많다\r\n낮에보는 동방명주는 매력도 없고 이상한 건물인데\r\n밤에보는 동방명주는 매력이 철철 넘친다. 밤에 와이탄 거리를 가면\r\n유럽에 온것같은 착각이들고 황푸강 너머의 낮과다른 동방명주를 보면 현실을 잊게해준다. 야경러버인 나는 와이탄도, 동방명주도 너무너무 맘에들었다. 게다가 중국은 한국대비 물가가 저렴하다\r\n1일1버블티를 할수있고 노점상에서 꼬치구이도 먹을수있다ㅋㅋㅋ\r\n처음으로 간 여행지라 기억에 너무 남고 다음엔 남자친구랑 가고싶다','sanghai.jpg','2020-12-10 17:50:48',1,0),(16,'스위스 가보셨나요?','kingkong',0,1,'안가보신분 있으면 꼭 가보셨음해요\r\n사진만 보고있어도 답답한게 뻥 뚫리는 기분이네요','Switzerland.jpg','2020-12-10 17:54:28',0,0),(17,'캠핑카타고 뉴질랜드여행','kjwi8319',0,1,'매번 대중교통이용해서 여행하다가 처음으로 캠핑카빌려서\r\n여행했습니다! 앞으로는 쭉 캠핑카를 빌릴거같네요 ! 너무 좋았어요\r\n뉴질랜드 좋아!','New Zealand2.jpg','2020-12-10 17:56:47',0,0),(18,'세계 3대 미식여행지 터키!','newbie',0,1,'터키가 세계 3대 미식여행지라는걸 아시나요?\r\n이번에 가보니까 왜 그렇게 불리는지 알거같네요!','Turkey.jpg','2020-12-10 18:01:31',0,0),(19,'프랑스여행후기','bbangji1994',5,16,'프랑스 여행하면? 낭만이 떠오르지 않나요\r\n사이트 찾아보면서 어디를 갈까 생각을하다 메인화면의 \r\n프랑스 이미지를 보고 프랑스여행을 계획했어요\r\n처음가는 유럽이라서 두근두근x2 \r\n프랑스 사실,,양식하면 딱 유명한 곳이잖아여? 요리를 했던 사람이였고 음식에서의 기대가 제일 크긴했어요 \r\n일단 가면 마카롱은 꼭 먹어야해요 한국에서 쉽게 맛볼수 있긴 한대\r\n프랑스 현지에서 먹는건 또 차원이 다릅니다...저는 피스타치오 , 장미 향을 먹었어요 또 빵... 빵 도 맛있습니다 제가 빵덕후인데 왜 우리나라 파리바게트가 파리인지 알게되었답니다.ㅋㅋㅋ달팽이요리는 징그러워서 안먹었어요..ㅠㅠ또 몽블랑도 먹었고 저는 디저트가 유독 생각이나네요ㅋㅋㅋㅋ아아 ! 푸아그라 먹어보세요..꽤 가격대도 다양하고 와인이랑 먹으면 좋아요 \r\n낭만의나라답게 몽마르뜨 언덕에서 테이크아웃한 커피를 마시면서 시내를 바라보면,,,이야 또 가고싶네요ㅋㅋㅋㅋ여행뽐뿌오게하는 이 후기글..다른사람도 느꼈으면 좋겠어요ㅠㅠ','france.jpg','2020-12-10 18:02:36',2,0),(20,'시드니 다녀왔습니다!','hong123',0,1,'다른분이 올린 사진보고 너무 가고싶어했는데\r\n이번에 기회가 되서 다녀왔어요! 예상대로 너무 좋았고 또 가고싶네요!','sydney2.jpg','2020-12-10 18:04:54',0,0),(21,'보라카이는 꼭 가봐야해','hong123',0,1,'해외여행 경험이 많지는 않지만 그 중 제일 좋았던곳을 꼽아보라면\r\n보라카이라고 고민없이 말할수있을것 같네요\r\n꼭 가보세요 두번 가보세요','Boracay.jpg','2020-12-10 18:12:00',0,0),(22,'이집트를 가서 낙타타고왔어요','eoen446',2,6,'생각보다 타기는 힘들었는데.. 특별한 경험이었어요\r\n날씨는 습기가 없어서 그런지 너무 덥다는 느낌은 안들었습니다!','Egypt.jpg','2020-12-10 18:16:32',1,0),(23,'누구나 가봤을 서울','hong11',2,12,'혹시 안가보셨다면 이번주 주말에 가보는건 어떨까요?\r\n코로나 조심하세요~','seoul.jpg','2020-12-10 18:58:39',3,0),(25,'안녕하세요 관리자입니다.','admin',0,2,'매번 이용해주시는 유저여러분 감사합니다.',NULL,'2020-12-10 19:14:05',0,1);
/*!40000 ALTER TABLE `user_board` ENABLE KEYS */;
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
