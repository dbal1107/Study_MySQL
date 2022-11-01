-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: chloe
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `cart_tb`
--

DROP TABLE IF EXISTS `cart_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_tb` (
  `cart_id` bigint NOT NULL AUTO_INCREMENT,
  `user_tb_user_id` bigint NOT NULL,
  `item_tb_item_id` bigint NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `fk_cart_tb_user_tb1_idx` (`user_tb_user_id`),
  KEY `fk_cart_tb_item_tb1_idx` (`item_tb_item_id`),
  CONSTRAINT `fk_cart_tb_item_tb1` FOREIGN KEY (`item_tb_item_id`) REFERENCES `item_tb` (`item_id`),
  CONSTRAINT `fk_cart_tb_user_tb1` FOREIGN KEY (`user_tb_user_id`) REFERENCES `user_tb` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_tb`
--

LOCK TABLES `cart_tb` WRITE;
/*!40000 ALTER TABLE `cart_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_tb`
--

DROP TABLE IF EXISTS `category_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_tb` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_tb`
--

LOCK TABLES `category_tb` WRITE;
/*!40000 ALTER TABLE `category_tb` DISABLE KEYS */;
INSERT INTO `category_tb` VALUES (1,'의류'),(2,'잡화');
/*!40000 ALTER TABLE `category_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_list_tb`
--

DROP TABLE IF EXISTS `coupon_list_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_list_tb` (
  `coupon_list_id` bigint NOT NULL AUTO_INCREMENT,
  `coupon_tb_coupon_id` bigint NOT NULL,
  `user_tb_user_id` bigint NOT NULL,
  PRIMARY KEY (`coupon_list_id`),
  KEY `fk_coupon_list_tb_coupon_tb1_idx` (`coupon_tb_coupon_id`),
  KEY `fk_coupon_list_tb_user_tb1_idx` (`user_tb_user_id`),
  CONSTRAINT `fk_coupon_list_tb_coupon_tb1` FOREIGN KEY (`coupon_tb_coupon_id`) REFERENCES `coupon_tb` (`coupon_id`),
  CONSTRAINT `fk_coupon_list_tb_user_tb1` FOREIGN KEY (`user_tb_user_id`) REFERENCES `user_tb` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_list_tb`
--

LOCK TABLES `coupon_list_tb` WRITE;
/*!40000 ALTER TABLE `coupon_list_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_list_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_tb`
--

DROP TABLE IF EXISTS `coupon_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_tb` (
  `coupon_id` bigint NOT NULL AUTO_INCREMENT,
  `coupon_name` varchar(45) NOT NULL,
  `store_tb_store_id` bigint NOT NULL,
  PRIMARY KEY (`coupon_id`),
  KEY `fk_coupon_tb_store_tb1_idx` (`store_tb_store_id`),
  CONSTRAINT `fk_coupon_tb_store_tb1` FOREIGN KEY (`store_tb_store_id`) REFERENCES `store_tb` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_tb`
--

LOCK TABLES `coupon_tb` WRITE;
/*!40000 ALTER TABLE `coupon_tb` DISABLE KEYS */;
INSERT INTO `coupon_tb` VALUES (1,'생일축하합니다!',1),(2,'광복절 이벤트~',1),(3,'비가 추적추적 내려요.',2),(4,'핫 썸머! 여름엔 시원한 chloe!',3),(5,'11월 11일 11의 시간~',5);
/*!40000 ALTER TABLE `coupon_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_tb`
--

DROP TABLE IF EXISTS `item_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_tb` (
  `item_id` bigint NOT NULL AUTO_INCREMENT,
  `item_name` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `item_size` varchar(45) DEFAULT 'free',
  `item_color` varchar(45) NOT NULL,
  `store_tb_store_id` bigint NOT NULL,
  `category_tb_category_id` int NOT NULL,
  `sub_category_tb_sub_category_id` int NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `fk_item_tb_store_tb1_idx` (`store_tb_store_id`),
  KEY `fk_item_tb_category_tb1_idx` (`category_tb_category_id`),
  KEY `fk_item_tb_sub_category_tb1_idx` (`sub_category_tb_sub_category_id`),
  CONSTRAINT `fk_item_tb_category_tb1` FOREIGN KEY (`category_tb_category_id`) REFERENCES `category_tb` (`category_id`),
  CONSTRAINT `fk_item_tb_store_tb1` FOREIGN KEY (`store_tb_store_id`) REFERENCES `store_tb` (`store_id`),
  CONSTRAINT `fk_item_tb_sub_category_tb1` FOREIGN KEY (`sub_category_tb_sub_category_id`) REFERENCES `sub_category_tb` (`sub_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_tb`
--

LOCK TABLES `item_tb` WRITE;
/*!40000 ALTER TABLE `item_tb` DISABLE KEYS */;
INSERT INTO `item_tb` VALUES (1,'패치 테디 집업 코트',32000,'M','베이지',32,1,4),(2,'가든 니트 베스트',25000,'S','핑크',22,1,4),(3,'타이 크로셰 가디건',36000,'L','블루',11,1,4),(4,'올 오버 프린트 집업 자켓',18000,'S','올리브',44,1,4),(5,'퍼 패딩 자켓',89000,'M','화이트',21,1,4),(6,'레이스 러플 니트 가디건',41000,'L','베이지',42,1,4),(7,'레트로 솔리드 크롭 코트',36000,'S','브라운',17,1,4),(8,'오버사이즈 집업 후드',26000,'M','그레이',28,1,4),(9,'데님 트리거 재킷',22000,'L','블루',29,1,4),(10,'A라인 쇼츠 트렌치 코트',45000,'L','베이지',30,1,4),(11,'차가운 기능성 썸머레깅스',11690,'M','블랙',30,1,2),(12,'뒷밴딩 일자 통 와이드',21870,'S','스카이블루',16,1,2),(13,'로그 생지 숏 팬츠',24930,'S','베이지',17,1,2),(14,'샐러리 핀탁 쭈리 트레이닝 팬츠',14940,'L','그레이',48,1,2),(15,'비비드 오버 와이드 롱 밴딩팬츠',18620,'L','퍼플',42,1,2),(16,'하이웨이스트 언발 데미지 반바지',26640,'S','화이트',33,1,2),(17,'치트롱 나일론 스트링 와이드 밴딩팬츠',18620,'M','그레이',26,1,2),(18,'핏보장 트레이닝 반바지',13800,'S','그레이',11,1,2),(19,'크루 나일론 핀턱 롱 슬랙스',34200,'M','화이트',9,1,2),(20,'린넨 와이드 슬랙스',9940,'S','베이지',38,1,2),(21,'구름 파스텔 뚱카롱 슬리퍼',12000,'250','화이트',27,2,2),(22,'깔끔하게 스니커즈',27900,'240','블랙',2,2,2),(23,'방수가능 머쉬 스트랩 러버 슬리퍼',14900,'260','블랙',41,2,2),(24,'리버서블 꼬임 스트랩 샌들힐',38800,'230','그린',5,2,2),(25,'헤나 밴딩 스트랩 샌들',16110,'240','베이지',14,2,2),(26,'베이직 웨지 샌들',32900,'250','크림',36,2,2),(27,'선데이 러버 핏플랍 쪼리',11610,'240','올리브',50,2,2),(28,'통통리본 슬리퍼',19900,'230','그린',28,2,2),(29,'말랑말랑 착용감 좋은 페니로퍼',24500,'240','핑크',33,2,2),(30,'플립플랍 쪼리 슬리퍼',19900,'280','옐로우',13,2,2),(31,'베이직워싱 미니스커트',24600,'S','베이지',30,1,5),(32,'Which 벨트포함 플리츠스커트',18200,'M','블랙',29,1,5),(33,'Dizzy 셔링스커트',14900,'L','화이트',11,1,5),(34,'Owl 코르셋 데님스커트',24200,'S','미들블루',45,1,5),(35,'Mose 팬츠형 스커트',19200,'M','블랙',20,1,5),(36,'Case 체크스커트팬츠',22400,'L','블랙',16,1,5),(37,'Beware 멜빵미니스커트',24800,'S','핑크',17,1,5),(38,'Must 플리츠스커트 벨트포함',22800,'XL','베이지',22,1,5),(39,'Farrell 랩st 미니스커트',22400,'XL','화이트',1,1,5),(40,'Whendy 볼륨 밴딩스커트',32400,'M','화이트',10,1,5),(41,'홀리데이원피스',29500,'M','화이트',1,1,3),(42,'슬립원피스',16500,'S','블랙',2,1,3),(43,'썸머백리스원피스',48800,'M','그린',3,1,3),(44,'린넨롱원피스',39800,'S','차콜',5,1,3),(45,'핀턱스트랩원피스',30200,'L','옐로우',7,1,3),(46,'세이지백트임원피스',24500,'S','베이지',8,1,3),(47,'로나플레어원피스',49500,'M','스카이블루',9,1,3),(48,'라비앙쉬폰원피스',39000,'S','스카이블루',10,1,3),(49,'하늘셔츠',20000,'S','스카이블루',34,1,1),(50,'무지티셔츠',15000,'M','화이트',2,1,1),(51,'기본셔츠',30000,'L','블랙',30,1,1),(52,'셔링셔츠',20000,'S','블루',50,1,1),(53,'꽃무늬반팔',18000,'M','옐로우',34,1,1),(54,'체크셔츠',23000,'S','레드',12,1,1),(55,'스트라이프티',23000,'M','블루',45,1,1),(56,'레인보우티',15000,'L','화이트',7,1,1),(57,'린넨자켓',35000,'M','크림',27,1,1),(58,'무지긴팔',20000,'S','그레이',10,1,1),(59,'하트 패턴 스타킹',5000,'free','화이트',40,2,4),(60,'체리 & 플라워 양말',7000,'free','베이지',20,2,4),(61,'체크패턴 양말',3900,'free','그레이',45,2,4),(62,'스트라이프 양말',4000,'free','엘로우',7,2,4),(63,'플라워 패턴 양말',3800,'free','그린',40,2,4),(64,'3 메쉬 양말',9100,'free','블루',24,2,4),(65,'플라워 메쉬 양말',5200,'free','퍼플',10,2,4),(66,'별자리 양말',3500,'free','블랙',8,2,4),(67,'로맨틱무드 양말',4700,'free','핑크',46,2,4),(68,'2 블럭 양말',10000,'free','카키',32,2,4),(69,'에린백',40350,'free','그레이',45,1,7),(70,'로보에백',139000,'free','베이지',21,1,7),(71,'루시스퀘어크로스백',14900,'free','브라운',15,1,7),(72,'셔링솔더백',39000,'free','아이보리',12,1,7),(73,'보나백',79000,'free','블랙',33,1,7),(74,'크레마쇼퍼백',14500,'free','핑크',26,1,7),(75,'pulse bag',9600,'free','그린',25,1,7),(76,'cotton파우치',10800,'free','아이보리',37,1,7),(77,'벨트스트랩숄더백',128000,'free','블랙',32,1,7),(78,'camelbag',54690,'free','그레이',45,1,7),(79,'블링목걸이',20000,'free','실버',19,2,1),(80,'볼드목걸이',25000,'free','골드',28,2,1),(81,'진주목걸이',30000,'free','화이트',31,2,1),(82,'꼬임반지',20000,'free','실버',49,2,1),(83,'애끼반지',15000,'free','골드',16,2,1),(84,'비즈반지',18000,'free','그린',41,2,1),(85,'비즈목걸이',20000,'free','레드',17,2,1),(86,'코인목걸이',25000,'free','실버',32,2,1),(87,'드롭귀걸이',20000,'free','골드',10,2,1),(88,'볼드귀걸이',30000,'free','로즈골드',5,2,1),(89,'베이직한 스티치 포인트의 레터링 볼캡',18900,'free','화이트',18,2,5),(90,'더셀럽 여성 여름 코튼 린넨 와이어 벨크로 버킷햇',19900,'free','아이보리',29,2,5),(91,'버킷햇 여성 벙거지 모자',40000,'free','블랙',31,2,5),(92,'여름 밀짚 챙넓은 비치 승마 여자 모자 라피아햇',12800,'free','브라운',41,2,5),(93,'봄 여름 중년여성모자 벙거지 버킷햇 엄마 할머니 모자',19900,'free','핑크',8,2,5),(94,'아이유 천연 밀짚모자 여자 휴가 여행 라피아햇',21000,'free','블랙',6,2,5),(95,'바스락패치볼캡',14000,'free','그린',34,2,5),(96,'와펜자수볼캡',13000,'free','화이트',19,2,5),(97,'밤바볼캡',19900,'free','오렌지',20,2,5),(98,'코코트위드베레모',16210,'free','블랙',10,2,5),(99,'랩셔츠원피스',49800,'free','네이비',4,1,3),(100,'셔링원피스',28400,'free','블랙',6,1,3);
/*!40000 ALTER TABLE `item_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_tb`
--

DROP TABLE IF EXISTS `order_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_tb` (
  `order_id` bigint NOT NULL AUTO_INCREMENT,
  `order_qnt` int NOT NULL,
  `order_payment` int NOT NULL,
  `user_tb_user_id` bigint NOT NULL,
  `item_tb_item_id` bigint NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_order_tb_user_tb1_idx` (`user_tb_user_id`),
  KEY `fk_order_tb_item_tb1_idx` (`item_tb_item_id`),
  CONSTRAINT `fk_order_tb_item_tb1` FOREIGN KEY (`item_tb_item_id`) REFERENCES `item_tb` (`item_id`),
  CONSTRAINT `fk_order_tb_user_tb1` FOREIGN KEY (`user_tb_user_id`) REFERENCES `user_tb` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_tb`
--

LOCK TABLES `order_tb` WRITE;
/*!40000 ALTER TABLE `order_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_tb`
--

DROP TABLE IF EXISTS `store_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_tb` (
  `store_id` bigint NOT NULL AUTO_INCREMENT,
  `store_name` varchar(100) NOT NULL,
  `store_tel` varchar(45) NOT NULL,
  `store_address` varchar(100) NOT NULL,
  `store_grade` int NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_tb`
--

LOCK TABLES `store_tb` WRITE;
/*!40000 ALTER TABLE `store_tb` DISABLE KEYS */;
INSERT INTO `store_tb` VALUES (1,'순soon','010.9515.3512','서울 노원구 동일로',4),(2,'더디테일','010.9459.6215','경기도 남양주 진건읍',3),(3,'바이엘르','070.4645.6821','경기도 남양주 두물로',2),(4,'쉬즈미스','062.364.1525','광주 서구 무진대로 932',4),(5,'이오칠엔컴퍼니','010.6512.9845','서울 동대문구 안암로 28-1',5),(6,'로즈브리즈','070.6512.9514','서울 양천구 지양로7길 25',1),(7,'아이미마인','1533.0670','경상남도 김해 번화1로 82',4),(8,'유라타임','010.5123.9545','경기도 의정부 둔야로 50번길 10-5',2),(9,'YELLY ROOM','010.9546.8235','서울 도봉구 해등로 268-110',5),(10,'LUSIDA','02.1588.8151','서울 동대문구 무학로 20길 37',2),(11,'발리','010.4853.9572','해운대구 중동1-1',4),(12,'니노','010.8746.9472','성남시 분당구3-2',4),(13,'딩구','010.3872.3494','해운대구 우동2-1',5),(14,'트위스','010.8364.2733','해운대구 중동1-5',2),(15,'홀리릐','010.8362.1823','해운대구 우동3-5',1),(16,'스위트','010.0826.8462','해운대구 중동1-5',5),(17,'올라리','010.2737.0483','고양시 일산동구3-1',3),(18,'땡구','010.2763.0483','해운대구 중동5-3',4),(19,'스파이','051.387.4983','해운대구 중동1-9',3),(20,'호빗','010.9833.2973','해운대구 우동3-9',4),(21,'리얼코코','070.4866.1764','부산 연제구 해맞이로 71(거제동)',4),(22,'반하리마켓','1577.3472','서울 중구 소공로 70 (충무로1가)',5),(23,'앤드모어','1577.3352','서울 중구 소공로 70-1',1),(24,'완츄','070.5055.5643','부산 연제구 법원북로 33',3),(25,'메이드제이','1644.6289','서울 성동구 청계천로 458',4),(26,'티원글로벌','02.1661.8756','경기 이천시 대궐면 초지리 57',3),(27,'버튼나인','1577.3452','서울 중구 소공로 63',5),(28,'뮤토웨어','070.5224.1880','서울 종로구 창신동 328-18',3),(29,'샤인글램','010.5026.7930','대전 서구 청사로 281',5),(30,'트위','1522.9699','서울 서초구 양재동 225',2),(31,'리리앤코','051.123.4567','부산 해운대구 1길',3),(32,'슬로우앤드','051.256.7890','부산 연제구2길',4),(33,'라룸','051.956.7456','부산 부산진구 전포대로',3),(34,'메이비베이비','051.745.1267','부산 동래구5길',2),(35,'원로그','051.754.6521','부산 해운대구7길',5),(36,'메리어라운드','051.951.3244','부산 강서구8길',1),(37,'라이크유','051.381.6023','부산 동구10길',2),(38,'리린','051.591.6731','부산 사상구15길',3),(39,'퍼빗','051.301.7578','부산 연제구2길',4),(40,'언더비','051.256.8456','부산 중구5길',1),(41,'올드미키','1599.4556','경기 부천시 원미구 중3동 길주로319, 골든타워빌딩 9F 901호',5),(42,'아이홈','1588.6369','서울시 관악구 신사로 142',5),(43,'커먼유니크','1588.6369','서울시 동작구 대방동 CJ대한통운 대방대리점',4),(44,'시크릿라벨','1544.4182','인천 부평구 부평북로 246 (청천동)',4),(45,'디바걸','02.999.9993','서울시 성북구 숭인로14, 1층',3),(46,'미니뿅','1599.2321','충청북도 청주시 상당구 용암북로160번길 15 (용암동) 청주용암1동우체국 2층',3),(47,'가내스라','032.719.3598','인천광역시 계양구 경명대로 1049(계산동) 3층',2),(48,'WEEKLY BEST ITEMS','1833.8101','충청북도 청주시 서원구 산남로 71(산남동) 성지빌딩 4층',2),(49,'킥쇼잉','1644.6289','서울특별시 성동구 청계천로 458 (하왕십리동) 5층(하왕십리동, 우성빌딩)',1),(50,'러브앤드팝','1661.6346','서울시 구로구 구일로 110 해원리버파크 501호',1);
/*!40000 ALTER TABLE `store_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_category_tb`
--

DROP TABLE IF EXISTS `sub_category_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_category_tb` (
  `sub_category_id` int NOT NULL AUTO_INCREMENT,
  `sub_category_name` varchar(45) NOT NULL,
  `category_tb_category_id` int NOT NULL,
  PRIMARY KEY (`sub_category_id`),
  KEY `fk_sub_category_tb_category_tb1_idx` (`category_tb_category_id`),
  CONSTRAINT `fk_sub_category_tb_category_tb1` FOREIGN KEY (`category_tb_category_id`) REFERENCES `category_tb` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_category_tb`
--

LOCK TABLES `sub_category_tb` WRITE;
/*!40000 ALTER TABLE `sub_category_tb` DISABLE KEYS */;
INSERT INTO `sub_category_tb` VALUES (1,'상의',1),(2,'팬츠',1),(3,'원피스',1),(4,'아우터',1),(5,'스커트',1),(6,'악세서리',2),(7,'신발',2),(8,'가방',2),(9,'양말',2),(10,'모자',2);
/*!40000 ALTER TABLE `sub_category_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tb`
--

DROP TABLE IF EXISTS `user_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_tb` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `user_password` varchar(45) NOT NULL,
  `user_address` varchar(100) NOT NULL,
  `user_phone` varchar(45) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_birth` varchar(45) NOT NULL,
  `user_gender` tinyint NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tb`
--

LOCK TABLES `user_tb` WRITE;
/*!40000 ALTER TABLE `user_tb` DISABLE KEYS */;
INSERT INTO `user_tb` VALUES (1,'추성민','Auburn10399666','경기도 용인시 기흥구 학동로 909','010.2292.9087','jeon.hyunjun@gmail.com','94.12.13',0),(2,'조나루','Taurus14827741','경기도 고양시 일산서구 언주로 6334','010.5740.0792','naroo@ryu.org','99.11.15',0),(3,'변미라','suran76dd','경기도 안양시 동안구 도산대로 5108','010.3282.2811','suran76@son.kr','95.03.24',1),(4,'탁수정','Bilzensdf22','경기도 안산시 단원구 반포대로 114','010.1662.0204','kim.heewon@yahoo.com','93.10.23',1),(5,'육도윤','Tauru5ft3inchs','경기도 수원시 장안구 역삼로 706','010.7382.4520','sunghun91@nkdkd.net','90.12.04',0),(6,'왕은지','%hdeBt^Tdd','경기도 안양시 만안구 논현로 835','010.4986.4326','jdd.kseim@yoon.kr','82.11.02',1),(7,'진경주','bddanhe12e.shim','경기도 동두천시 학동로 2464','010.8065.4042','yewon.go@esdfle.com','83.10.23',1),(8,'왕기수','e?7!vQ?x23x0PRW','경기도 안산시 상록구 가락로 7299','010.3872.1155','bkang@hotmail.com','87.02.16',0),(9,'방정웅','V~f?k!E','경기도 남양주시 삼성로 7316','010.1801.1326','ka815on@yahoo.com','90.02.02',0),(10,'라이도','B654@%2','경상남도 창원시 진해구 123','010.2343.2533','kraraon@yahoo.com','98.11.21',1),(11,'마동석','domama22','부산 사하구 234','010.2343.4510','sudong31@rarara.net','81.12.01',0),(12,'안진수','%324^2dgs','부산 강서구 3421','010.2343.1358','jgesddm@yoon.kr','92.11.02',0),(13,'라라이','bsge^#@im','부산 금정구 624-123','010.8065.4042','232.go@esdfle.com','83.02.23',1),(14,'왕이수','e?7!vQ?x23x0PRW','경기도 안산시 상록구 가락로 719','010.2343.2533','didiwefek@hotmail.com','82.11.16',0),(15,'이아인','V2342!!','경기도 남양주시 삼성로 7316','010.1801.1326','kwefen@yahoo.com','90.02.02',0),(16,'박수지','SGG245346','경기도 용인시 기흥구 학동로 909','010.3567.3466','sdfefe@gmail.com','97.06.07',1),(17,'김사랑','sdht@%534466','경기도 고양시 일산서구 언주로 144','010.4783.4678','nawefo@ryu.org','99.11.15',1),(18,'이수란','asddd#%#','경기도 안양시 동안구 도산대로 51248','010.2345.2634','surwefn76@son.kr','95.05.24',1),(19,'황산','asdf314','경기도 안산시 단원구 반포대로 11244','010.2633.2354','kimwefewon@yahoo.com','97.10.08',0),(20,'정은지','RGREH2536','경상남도  706','010.4563.3264','suwef91@nkdkd.net','86.12.06',1),(21,'레귤러스 블랙','1234','화성시 봉은사로 152-1','063.6756.7054','minseok26@gmail.com','92.03.17',1),(22,'레스트레인지','1112','안양시 동안구 봉은사로 324','010.7211.3812','cho.moonyong@gang.info','93.03.17',1),(23,'그리젤라 마치뱅크','1113','용인시 기흥구 도산대로 95','054.8638.1043','minseo.gwon@yahoo.com','97.02.22',0),(24,'마볼로콘트','1114','수영시 양재천로 9758','053.3609.6267','song.hyoil@heo.com','92.05.15',0),(25,'마이클코너','1151','가평군 반포대로 45','070.0669.8909','junseo69@yahoo.com','95.05.08',1),(26,'나이젤월퍼트','1524','광주시 개포로 6954','042.6446.1978','kcheon@cheon.kr','90.12.10',0),(27,'님파도라통스','1664','연천군 영동대로 546','02.7768.8981','kwak.jina@yang.com','92.06.30',1),(28,'뉴트스캐맨더','9534','김포시 선릉로 60','066.7644.3950','minhwan.choi@kwak.org','92.12.17',0),(29,'델피디고리','1239','성남시 분당구 학동로 816','02.1077.8622','minseok2602@gmail.com','87.02.26',1),(30,'디덜러스다글','1884','오산시 잠실로 05-2','063.6756.7054','rgwon@yahoo.com','92.03.22',0),(31,'로완칸나','1266','수원시 영통구 학동로','02.5333.8060','doyoon01@gmail.com','92.03.30',1),(32,'루도배그먼','1248','안양시 만안구 언주로 139','063.6756.8020','sangsoo.go@son.biz','93.03.13',1),(33,'리조던','1554','안산시 상록구 서초중앙로 66','050.6163.3021','ahn.mina@hotmail.com','98.04.08',0),(34,'린프레드','1221','의왕시 서초대로 1250','1839.5798','seo.ganghee@jo.kr','97.11.04',0),(35,'버넌더리','1526','의정부시 양천대로 78','010-7876-8716','choi.wonhee@gmail.com','95.11.29',1),(36,'린터스키터','1111','의정부시 반포대로 986','02.4733.0269','shim.moonyong@shin.info','81.07.20',1),(37,'세라피나피커리','1211','여주시 서초대로 277','010.8615.8289','sangjun.gang@yahoo.com','89.04.03',0),(38,'메리리들','1287','구리시 개포로 52','070.0575.9003','changyoung54@gmail.com','92.04.27',1),(39,'메리리들','1295','안산시 단원구 선릉로 4052','070.2653.9559','hwang.jumi@gmail.com','87.03.05',1),(40,'버사조킨스','1695','남양주시 학동로 5652','010.0109.7175','hwang.jumi22@gmail.com','87.03.09',1),(41,'김나리','1234','안산시 상록구3-1','010.8364.9724','jiwon47@ahn.info','93.07.12',1),(42,'서유정','1266','2300 삼성로','010.8364.2632','jungwoong.cheon@hotmail.com','89.02.23',1),(43,'김주환','1225','539 석촌호수로','010.8374.2981','uno@hotmail.com','87.08.23',0),(44,'홍수화','1276','548 봉은사로','010.9284.7234','vnam@no.net','83.03.12',1),(45,'김주익','1223','6213 영동대로','010.2763.4083','gunwoo.jeon@gmail.com','88.11.18',0),(46,'김수환','1278','3857 개포로','010.2644.3084','kubum.ryu@hotmail.com','99.09.23',0),(47,'공주민','1212','002 역삼로','010.9387.0284','jiwoo.chang@hotmail.com','73.01.09',1),(48,'김장','1267','3654 역삼로','010.5234.4983','baek.hyunjong@gmail.com','98.09.08',0),(49,'나한진','1245','3992 삼성로','010.7623.0823','chang.kubum@bae.net','92.07.14',1),(50,'강주익','1264','201 압구정로','010.2984.3084','sungsoo.jang@park.kr','92.01.19',0),(51,'장지연','1223','583 논현로','010.8364.9724','jiwon47@ahn.info','98.09.19',1),(52,'박장춘','1289','601 오금로','010.2834.9823','jaehyun53@shin.biz','79.11.23',0),(53,'소현','1220','4725 학동로','010.5893.9723','zcho@yu.net','96.09.10',1),(54,'박주연','12089','8146 테헤란로','010.2873.9834','ha.sungho@hotmail.com','97.09.13',0),(55,'강진성','1265','1053 강남대로','010.2837.3972','jimin.yoon@yoon.net','90.10.17',0),(56,'송지영','1273','511 삼성로','010.3874.2983','no.jia@gmail.com','73.12.10',1),(57,'신지영','1209','9876 선릉로','010.8633.0829','jjung.bomin@hotmail.com','83.11.19',1),(58,'김석준','1245','262 선릉로','010.2836.0823','rheo@yahoo.com','96.09.11',0),(59,'강성준','1230','6837 언주로','010.2763.2765','ganghee33@choi.info','97.11.29',0),(60,'구석한','1083','0248 선릉로','010.2733.4981','mincheol.gang@yahoo.com','98.09.10',0),(61,'추연선','alerjais123','포천시 서초대로 4463','010.3691.6532','hong.juyeon@gmail.com','92.01.01',0),(62,'위재연','okssoa846','이천시 테헤란로 9372','010.1507.5299','lee.yewon@yahoo.com','99.08.27',0),(63,'신서영','qoaksja9954','양주시 압구정로 528','010.9525.0283','tyoon@hwang.net','98.08.22',0),(64,'유슬기','qlsisaj923874','용인시 논현로 0450','010.1068.4473','kchoi@gmail.com','93.07.26',0),(65,'한지후','alqoiwvkjs1244','군포시 서초대로 473','010.4974.4318','myungho64@hotmail.com','93.07.22',1),(66,'차채현','j1k2i3h5k111','구리시 서초대로 504','010.1816.6421','hhwang@jung.com','88.04.01',1),(67,'전예원','k91k999ja82','수원시 영통구 양재천로 9931','010.9777.8842','gwon.sungsoo@hotmail.com','91.08.07',0),(68,'함연희','kq99DJ7a8','안양시 동안구 테헤란로 542','010.7542.1355','minsung83@yahoo.com','84.09.30',0),(69,'차하나','kJDI19j92','포천시 역삼로 3274','010.2894.9858','sanghyun80@gmail.com','88.08.26',0),(70,'신지현','aKS18ksj','양평군 선릉로 1440','010.9733.7503','minji74@baek.com','85.07.08',1),(71,'함강은','KS9AJKSah','오산시 도산대로 955','010.1841.4061','wcheon@gmail.com','83.05.02',0),(72,'손호진','KSKU19kjs','안산시 단원구 개포로 171','010.1389.3044','klim@gmail.com','83.04.11',0),(73,'지민환','KSKkjdi323','부천시 오정구 봉은사로 587','010.1623.2437','hong.soyoung@hotmail.com','88.10.23',1),(74,'노성은','kdsi199dja','동두천시 삼성로 5271','010.1544.6976','iseo@yahoo.com','95.12.04',0),(75,'권영환','ackshxk1201','부천시 소사구 언주로 452','010.4484.7855','ssong@heo.org','90.10.16',1),(76,'허성민','lixk13SKSJ1','고양시 덕양구 백제고분로 3136','010.1405.3280','uahn@yahoo.com','98.08.05',1),(77,'서현종','sl112JSIAjsk','안산시 상록구 가락로 070','010.1849.4536','ono@yahoo.com','97.06.20',1),(78,'이미영','kkOALK1Ika','양주시 논현로 4802','010.5821.2964','youngin.kang@kwon.kr','95.06.03',1),(79,'조민희','akisj190sksj','고양시 일산서구 삼성로 260','010.7776.2552','nuhung@hong.kr','99.05.12',0),(80,'맹원진','kAO9j91','파주시 잠실로 176','010.1640.0345','jungmain63@jang.info','86.12.01',0),(81,'방수연','dfdf56','안양시 동안구 서초중앙로56','010.6547.4653','bss788@dell.com','97.05,05',1),(82,'유연희','tddfdfd74','부산시 연제구 중앙대로789','010.1594.4525','yyh1020@dell.com','95.07.07',1),(83,'장은희','hffefedf4e','고양시 일산동구 오금로382','010.1525.8276','jeh88@dell.com','89.10.20',1),(84,'홍건우','rsfg5d','부천시 오정구 압구정로123','010.0211.8963','hgw4g@dell.com','94.11.25',0),(85,'손승민','dafdf6g','성남시 중원구 석촌호수로96','010.1817.2961','ssm00@dell.com','97.77.07',0),(86,'허서윤','eefdfag33d','서울시 강남대로680','010.3981.8179','hsy3654@dell.com','90.01.01',1),(87,'나미영','eafefg8','의정부시 학동로706','010.1855.4561','nmy896@dell.com','89.06.03',1),(88,'권주영','pljdk5','서울시 강남대로023','010.6598.3216','kjy@dell.com','96.07.09',1),(89,'명지우','adfgr1','김포시 백제고분로160','010.1230.9546','mjw00@dell.com','98.12.12',1),(90,'강현성','gafaggeie3','부산시 동구 중앙로465','010.7456.9523','khs9@dell.com','95.05.05',0),(91,'장도연','raefef5','서울시 압구정로3607','010.4914.5832','jdy803@dell.com','90.12.19',1),(92,'박보검','pkhh8d','서울시 반포대로94','010.1503.9156','bbgde3@dell.com','91.05.08',0),(93,'전지현','tert99f','안산시 상록구 도산대로59','010.4512.9637','jjh899@dell.com','94.11.05',1),(94,'권지희','agver4r','평택시 가락로541','010.1459.8566','kjh1233@dell.com','99.08.04',1),(95,'현민준','sdg323','부천시 소사구 언수로321','010.4521.9875','dfdfde@dell.com','96.03.15',0),(96,'정현종','sdf1h44r','서울시 반포대로14','010.4569.6213','aterer89@dell.com','93.09.17',0),(97,'마재철','125dgsfh','서울시 강남대로19','010.7651.9632','ryjfgf22@dell.com','89.07.30',0),(98,'강유미','1346agsdgr','서울시 논현로96','010.5416.9321','odofka88@dell.com','90.10.04',1),(99,'류준열','1#%%#r4r','포천시 언주로35','010.1456.9566','adfkjldf888@dell.com','91.04.10',0),(100,'김지영','a2346sav3462r','부산시 연제구 중앙대로99','010.4589.0547','rtr5@dell.com','98.08.03',1);
/*!40000 ALTER TABLE `user_tb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-08  7:54:28
