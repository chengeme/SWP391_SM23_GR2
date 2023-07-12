-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: swp
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cartID` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `totalcost` float DEFAULT NULL,
  `productID` int DEFAULT NULL,
  `userID` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cartID`),
  KEY `ProductID_idx` (`productID`),
  KEY `userID_idx` (`userID`),
  CONSTRAINT `ProductID` FOREIGN KEY (`productID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `userID` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (24,'1',1,31,31,1,1,1),(25,'1',2.5,31,77.5,1,1,1),(31,'1',2.5,31,77.5,1,1,1),(36,'1',2,31,62,1,1,1),(38,'1',2,31,62,1,2,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `categoryID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'earphone',_binary ''),(2,'keyboard',_binary ''),(3,'mouse',_binary ''),(4,'phone',_binary '\0'),(5,'laptop',_binary '\0'),(6,'bat',_binary '\0');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `earphone`
--

DROP TABLE IF EXISTS `earphone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `earphone` (
  `earphoneID` int NOT NULL AUTO_INCREMENT,
  `type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `frequency` float DEFAULT NULL,
  `sensitive` float DEFAULT NULL,
  `impedance` float DEFAULT NULL,
  `meterial` varchar(100) DEFAULT NULL,
  `earphone_ProductID` int DEFAULT NULL,
  `size` varchar(45) DEFAULT NULL,
  `battery` varchar(45) DEFAULT NULL,
  `connection distance` varchar(45) DEFAULT NULL,
  `wire length` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`earphoneID`),
  KEY `ProductID_idx` (`earphone_ProductID`),
  CONSTRAINT `earphone_productID` FOREIGN KEY (`earphone_ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `earphone`
--

LOCK TABLES `earphone` WRITE;
/*!40000 ALTER TABLE `earphone` DISABLE KEYS */;
INSERT INTO `earphone` VALUES (1,'Wireless',20000,111,32000,'Khung kim loại, đệm tai xốp Foam',1,'	95*77*66 mm','7h','10m','Không'),(2,'Wireless',20000,87.5,36,'Khung kim loại',2,'	50*70*31 mm','5h','15m','Không'),(3,'Wired',28000,100,32,'Khung inox',3,'78*89*100 mm','Không','Không','1.2m'),(4,'Console',28000,109,32,'Khung kim loại',4,'	100*150*81 mm','Không','Không','1.5m'),(5,'Wired ',40000,40,32,'Khung kim loại',5,'	200*300*230 mm','Không','Không','2m'),(6,'Wired ',20000,112,32,'Khung inox',6,'	30*40*21 mm','Không','Không','1m'),(7,'Wired ',20000,114,32,'Khung kim loại',7,'	70*70*60 mm','Không','Không','1.2m');
/*!40000 ALTER TABLE `earphone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `FeedbackID` int NOT NULL AUTO_INCREMENT,
  `FeedbackID_ProductID` int DEFAULT NULL,
  `feedbackID_userID` int DEFAULT NULL,
  `information` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `orderdetailID` int DEFAULT NULL,
  PRIMARY KEY (`FeedbackID`),
  KEY `ProductID_idx` (`FeedbackID_ProductID`),
  KEY `feedback_userID_idx` (`feedbackID_userID`),
  CONSTRAINT `feedback_productID` FOREIGN KEY (`FeedbackID_ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `feedback_userID` FOREIGN KEY (`feedbackID_userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,1,7,'ok',1,'2023-05-16 12:12:12',9),(46,1,10,'ea',1,'2023-06-30 13:42:51',13),(47,1,10,'oke ddaays',1,'2023-07-01 00:23:51',24);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `messageID` int NOT NULL AUTO_INCREMENT,
  `message_userID` int DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`messageID`),
  KEY `message_userID_idx` (`message_userID`),
  CONSTRAINT `message_userID` FOREIGN KEY (`message_userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,5,_binary '','Cant see shit'),(2,7,_binary '','i want to creat acc'),(3,4,_binary '','No product');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `orderID` int NOT NULL AUTO_INCREMENT,
  `order_userID` int DEFAULT NULL,
  `order_salecodeID` int DEFAULT NULL,
  `note` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  KEY `order_userID_idx` (`order_userID`),
  KEY `order_salecodeID_idx` (`order_salecodeID`),
  CONSTRAINT `order_salecodeID` FOREIGN KEY (`order_salecodeID`) REFERENCES `salecode` (`salecodeID`),
  CONSTRAINT `order_userID` FOREIGN KEY (`order_userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,6,1,NULL,'2023-05-30 00:00:00','Pending'),(2,6,NULL,NULL,'2023-05-30 00:00:00','Cancelled'),(3,6,NULL,NULL,'2023-05-30 00:00:00','Completed'),(4,7,NULL,NULL,'2023-06-30 00:00:00','Completed'),(5,8,NULL,NULL,'2023-05-30 00:00:00','Completed'),(6,9,NULL,NULL,'2023-05-30 00:00:00','Completed'),(7,9,NULL,NULL,'2023-05-30 00:00:00','Completed'),(8,10,NULL,NULL,'2023-05-30 00:00:00','Completed'),(9,7,NULL,NULL,'2023-07-30 00:00:00','Completed'),(11,7,NULL,NULL,'2023-07-30 00:00:00','Completed'),(20,10,NULL,NULL,'2023-06-30 00:00:00','Shipping'),(21,6,1,NULL,'2023-06-29 15:10:20','Pending'),(22,6,1,NULL,'2023-06-30 15:10:20','Pending'),(23,6,2,NULL,'2023-06-29 21:43:52','Completed'),(24,10,2,NULL,'2023-06-30 00:21:34','Pending'),(25,10,2,NULL,'2023-06-30 00:45:14','Pending'),(26,10,2,NULL,'2023-06-30 01:09:34','Pending'),(27,10,NULL,NULL,'2023-06-30 08:48:02','Pending'),(28,10,NULL,NULL,'2023-06-30 08:49:03','Pending'),(29,10,NULL,NULL,'2023-06-30 08:52:29','Pending'),(30,10,NULL,NULL,'2023-06-30 08:53:30','Pending'),(31,10,NULL,NULL,'2023-06-30 08:54:31','Pending'),(32,10,2,NULL,'2023-06-30 11:17:32','Pending'),(33,10,2,NULL,'2023-06-30 11:19:32','Pending'),(34,10,2,NULL,'2023-06-30 11:20:11','Pending'),(35,10,2,NULL,'2023-06-30 12:56:58','Pending'),(36,10,2,NULL,'2023-06-30 13:14:32','Pending'),(37,10,NULL,NULL,'2023-06-30 13:27:07','Pending'),(38,10,NULL,NULL,'2023-06-30 13:43:35','Pending'),(39,10,2,NULL,'2023-06-30 13:49:14','Pending'),(40,10,NULL,NULL,'2023-06-30 14:13:57','Pending'),(41,10,NULL,NULL,'2023-06-30 14:16:02','Pending'),(42,10,NULL,NULL,'2023-06-30 14:17:11','Pending'),(43,10,NULL,NULL,'2023-06-30 14:18:50','Pending'),(44,10,NULL,NULL,'2023-06-30 17:26:12','Pending'),(45,10,NULL,NULL,'2023-06-30 17:37:14','Pending'),(46,10,NULL,NULL,'2023-06-30 17:39:20','Pending'),(47,10,NULL,NULL,'2023-06-30 17:42:06','Pending'),(48,10,2,NULL,'2023-06-30 17:45:49','Pending'),(49,10,2,NULL,'2023-06-30 17:49:24','Pending'),(50,10,2,NULL,'2023-06-30 23:37:26','Pending'),(51,10,2,NULL,'2023-06-30 23:48:27','Pending'),(52,10,2,NULL,'2023-06-30 23:49:33','Pending'),(53,10,2,NULL,'2023-06-30 23:50:37','Pending'),(54,10,NULL,NULL,'2023-06-30 23:55:15','Pending'),(55,10,NULL,NULL,'2023-06-30 23:56:20','Pending'),(56,10,NULL,NULL,'2023-06-30 23:57:24','Pending'),(57,10,NULL,NULL,'2023-06-30 23:58:29','Pending'),(58,10,NULL,NULL,'2023-06-30 23:59:34','Pending'),(59,10,NULL,NULL,'2023-07-01 00:00:38','Pending'),(60,10,NULL,NULL,'2023-07-01 00:01:42','Pending'),(61,10,NULL,NULL,'2023-07-01 00:02:46','Pending'),(62,10,NULL,NULL,'2023-07-01 00:03:51','Pending'),(63,10,NULL,NULL,'2023-07-01 00:04:55','Pending'),(64,10,2,NULL,'2023-07-01 00:20:27','Pending'),(65,10,2,NULL,'2023-07-01 00:21:33','Pending'),(66,10,2,NULL,'2023-07-01 00:22:37','Pending'),(67,10,NULL,NULL,'2023-07-01 07:13:01','Pending'),(68,10,2,NULL,'2023-07-01 07:13:56','Pending'),(69,10,2,NULL,'2023-07-01 07:14:42','Pending'),(70,10,2,NULL,'2023-07-01 07:15:48','Pending'),(71,10,2,NULL,'2023-07-01 07:16:52','Pending'),(72,10,NULL,NULL,'2023-07-01 07:17:39','Pending'),(73,10,NULL,NULL,'2023-07-01 07:17:56','Pending'),(74,10,NULL,NULL,'2023-07-01 07:18:30','Pending'),(75,10,NULL,NULL,'2023-07-01 07:19:35','Pending'),(76,10,NULL,NULL,'2023-07-01 07:20:38','Pending'),(77,10,NULL,NULL,'2023-07-01 07:21:42','Completed');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetail` (
  `orderdetailID` int NOT NULL AUTO_INCREMENT,
  `orderdetail_orderID` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` float DEFAULT NULL,
  `orderdetail_productID` int DEFAULT NULL,
  `product_rate` float DEFAULT NULL,
  PRIMARY KEY (`orderdetailID`),
  KEY `orderdetial_orderID_idx` (`orderdetail_orderID`),
  KEY `orderdetail_productID_idx` (`orderdetail_productID`),
  CONSTRAINT `orderdetail_productID` FOREIGN KEY (`orderdetail_productID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `orderdetial_orderID` FOREIGN KEY (`orderdetail_orderID`) REFERENCES `order` (`orderID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
INSERT INTO `orderdetail` VALUES (1,1,2,NULL,1,5),(2,2,4,NULL,1,5),(3,3,1,NULL,1,5),(4,4,1,NULL,2,4),(5,5,4,NULL,2,4),(6,6,2,NULL,3,3),(7,7,2,NULL,4,2),(8,8,5,NULL,5,3),(9,4,4,NULL,1,5),(10,8,5,NULL,1,5),(11,8,3,NULL,4,2),(12,9,4,NULL,1,5),(13,20,NULL,NULL,1,1),(14,20,1,100,1,NULL),(15,49,3,100,1,NULL),(16,49,2,101,2,NULL),(17,55,1,101,2,NULL),(18,63,4,6444000,1,NULL),(19,63,4,8670000,2,NULL),(20,64,4,6444000,1,NULL),(21,64,4,8670000,2,NULL),(22,65,4,6444000,1,NULL),(23,65,4,8670000,2,NULL),(24,66,4,6444000,1,5),(25,66,4,8670000,2,NULL),(26,67,1,2167500,2,NULL),(27,68,3,6502500,2,NULL),(28,69,16,34680000,2,NULL),(29,70,16,34680000,2,NULL),(30,71,16,34680000,2,NULL),(31,72,2,4335000,2,NULL),(32,73,2,4335000,2,NULL),(33,74,3,6502500,2,NULL),(34,75,3,6502500,2,NULL),(35,76,3,6502500,2,NULL),(36,77,3,6502500,2,NULL);
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `product_categoryID` int DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `desciption` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `picture` varchar(255) DEFAULT NULL,
  `picture2` varchar(255) DEFAULT NULL,
  `picture3` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `sale` float DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `product_categoryID_idx` (`product_categoryID`),
  CONSTRAINT `product_categoryID` FOREIGN KEY (`product_categoryID`) REFERENCES `category` (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'Corsair HS70',' Corsair HS70 Pro Wireless Carbon là dòng tai nghe máy tính có phần đệm tai mềm mại, dày dặn, độ sâu lớn, trùm kín tai hạn chế âm thanh từ bên ngoài lọt vào, cùng với độ bền cao, độ đàn hồi lớn ít bị biến dạng và khó rách. ','https://product.hstatic.net/200000722513/product/thumbtainghe_43854b38b58545be8683a4e1cbcf1d67_1898e6f48b834e80a6249d87d9839073_master.png','https://product.hstatic.net/200000722513/product/he-corsair-hs70-pro-wireless-carbon-2_3855186e6a3e4f74bf4f15d9dc36990d_c3bff6691ab24c7cbb963acfbe1e4cb0_master.jpg','https://product.hstatic.net/200000722513/product/he-corsair-hs70-pro-wireless-carbon-3_ba19343bfeb746f5b9c4e4f486971ea2_fee978ad3a344dccbd22e56923d397fb_master.jpg',1790000,438,1,10,'2022-01-10'),(2,1,'Logitech G535 LIGHTSPEED','Tai nghe Logitech G535 LIGHTSPEED Wireless Black sở hữu thiết kế không dây tiện lợi, hiệu suất hoạt động tốt với độ trễ thấp. Hứa hẹn sẽ là một trong những chiếc tai nghe gaming tuyệt vời đồng hành cùng bạn trong những lần tham chiến căng thẳng. ','https://product.hstatic.net/200000722513/product/tech-g535-lightspeed-wireless-black-1_4185ee7505e341c3a8ad51b2c87009b1_5190e6a3ab164f1cbdc92e83d9f7d68e_master.png','https://product.hstatic.net/200000722513/product/tech-g535-lightspeed-wireless-black-1_4185ee7505e341c3a8ad51b2c87009b1_5190e6a3ab164f1cbdc92e83d9f7d68e_master.png','https://product.hstatic.net/200000722513/product/tech-g535-lightspeed-wireless-black-2_f158e8d3772e49dea388076a834a1382_1c0edcdd27f84c4aac914ba0414d1af3_master.jpg',2550000,222,1,15,'2022-01-10'),(3,1,'Razer BlackShark V2 X White','Razer BlackShark V2 X dòng tai nghe máy tính chơi game sở hữu âm thanh mạnh mẽ, chống ồn giúp người chơi chìm đắm trong không gian chơi game đa sắc màu. Đồng thời với thiết kế ấn tượng, độc đáo cùng tông màu sang trọng giúp chiếc tai nghe thêm phần nổi bật.','https://product.hstatic.net/200000722513/product/thumbtainghe_fdcc3585b0a249d492068ddbd434f69c_2da37c337c20423f983e3e34eb93252d_master.gif','https://product.hstatic.net/200000722513/product/adset_trang_rz04_03240700_r3m1_0003_4_4f0ef110cc8a4fad853f485823615b74_52a43736985944a88cd84dc0ff000db3_master.jpg','https://product.hstatic.net/200000722513/product/adset_trang_rz04_03240700_r3m1_0002_3_b01c2e278fd14347a2556cca1fd1d18e_025d9ef5d2e845f590449bbf196aaee1_master.jpg',1190000,155,1,20,'2022-01-10'),(4,1,'Razer Kraken X','Tai nghe chụp tai Razer Kraken X for Console hứa hẹn mang đến những trải nghiệm nghe thoải mái cho người dùng. Thiết kế kiểu dáng đẹp mắt, âm thanh chất lượng đáp ứng mọi nhu cầu chơi game hằng ngày. ','https://product.hstatic.net/200000722513/product/tai-nghe-razer-kraken-x-for-console-1_762ca5861e534168804c620c290c0b2f_a0e64c7634b14c699789c6bd48b0e6ec_master.png','https://product.hstatic.net/200000722513/product/tai-nghe-razer-kraken-x-for-console-2_1ed9103813b04bbf9002c3a072311fa0_d2f5727ffacc4514833a338f12063021_master.png','https://product.hstatic.net/200000722513/product/tai-nghe-razer-kraken-x-for-console-3_1c136bb6e9c04ae5aa551384a8ddc031_b697017a07704d7ca4fbb582c23f6cd5_master.png',699000,278,1,5,'2022-01-10'),(5,1,'Asus ROG Delta S Animate','Tai nghe Asus ROG Delta S Animate là một trong những siêu phẩm tai nghe máy tính đình đám của ông hoàng Asus. Thiết kế tai nghe chụp tai đẹp mắt, chất lượng âm thanh sống động cùng hệ thống đèn LED hiện đại đã tạo nên một Asus ROG Delta S Animate vô cùng ấn tượng và là một gaming gear đáng sở hữu.','https://product.hstatic.net/200000722513/product/h732__2__46d3cb8ea64749379d6357f6d4316199_dae399921c2343de97cd91a919396e8f_master.png','https://product.hstatic.net/200000722513/product/h732__4__b668521ba96d41e182fdb3e2bb0d7d30_f334f205a3d6401585a33e09fe5f6a1f_master.png','https://product.hstatic.net/200000722513/product/h732__3__a2104aaca6754c64b48f0439191942b5_553ed7b93b0d43879083d9e41fae7449_master.png',5690000,1,1,7,'2022-01-10'),(6,1,'Zidli FCore FH11L RGB 7.1','Tai nghe máy tính Zidli FCore FH11L RGB 7.1 Black được thiết kế với phong cách khá đơn giản toát lên sự thanh lịch quý phái, sang trọng. Các đường nét của tai nghe được làm vô cùng chỉnh chu, cùng hiệu ứng đèn LED 2 bên tai nghe vô cùng bắt mắt.','https://product.hstatic.net/200000722513/product/-nghe-zidli-fcore-fh11l-rgb-7-1-black_33fed4046b8540fbbc771759a417f176_2293f33c23c448b4888108dfd11027c7_master.jpg','https://product.hstatic.net/200000722513/product/ghe-zidli-fcore-fh11l-rgb-7-1-black-1_013abbf66ae84e968c6c594457691bd6_44378cfeebd34bdf9d92a27b48ecf069_master.jpg','https://product.hstatic.net/200000722513/product/ghe-zidli-fcore-fh11l-rgb-7-1-black-2_5f72199fe5c84735ac405dd666808766_08eff286a3314d118738a9408b9033a9_master.jpg',370000,-6,1,NULL,'2022-01-10'),(7,1,'Corsair HS55 Stereo White','Corsair được biết đến là một trong những hãng chuyên sản xuất các dòng sản phẩm gaming gear chất lượng được người dùng tiêu dùng đánh giá cao về hiệu năng lẫn thiết kế từ bàn phím, chuột máy tính, tai nghe cho đến ghế gaming. ','https://product.hstatic.net/200000722513/product/thumbtainghe-recovered_2_eb58c6226a844396bf19ace0cadaf6f7_67f61c83cada49c38fd5aee5db18cf66_master.png','https://product.hstatic.net/200000722513/product/9273_7781da931be979772c11c38ded18cf28_cdedc81b58c74084b166484c877ebcc8_f5540e83e0dc46eeb381d7ab7b404688_master.jpg','https://product.hstatic.net/200000722513/product/9259_8e2e145b94705b7065632d71f619f149_e89ecdecf3a8405aa2c2bd7d01b73514_e7716af71d8742958f487c0ac11d0019_master.jpg',1250000,34,1,NULL,'2022-01-10'),(8,2,'Bàn phím cơ AKKO 5075B Plus Dragon Ball Super Goku','Nổi tiếng với những chiếc gaming gear chất lượng, Akko là thương hiệu rất nhiều người dùng đặt niềm tin nhờ vào những thành phẩm chất lượng, đặc biệt là bàn phím cơ. Bao phủ gần như mọi phân khúc trong ngành hàng này, những chiếc bàn phím từ Akko sở hữu độ cứng cáp và hoàn thiện ở cấp độ cao. Và hôm nay GEARVN sẽ mang tới model AKKO 5075B Plus Dragon Ball Super Goku đặc biệt từ chính thương hiệu Trung Quốc.','https://product.hstatic.net/1000026716/product/thumbphim_d829ff88d74d4ababb105793cd37dd09.gif','https://product.hstatic.net/1000026716/product/gearvn-ban-phim-co-akko-5075b-plus-dragon-ball-super-goku-1_2048c56edbd24f07ace36a79135aa009.jpg','https://product.hstatic.net/1000026716/product/gearvn-ban-phim-co-akko-5075b-plus-dragon-ball-super-goku-2_11825f3c2fea4bd089daeacb211757de.jpg',2799000,13,1,NULL,'2022-01-10'),(9,2,'Leopold FC900RBT Bluetooth Coral Blue Limited Edition','Một trong những thương hiệu bàn phím cơ đáng sở hữu trên thị trường không thể không nhắc đến là Leopold. Các sản phẩm được sản xuất từ Hàn Quốc theo đuổi phong cách cổ điển cùng cảm giác bấm mới lạ đã làm nên sự thành công của thương hiệu, Leopold FC900RBT Bluetooth Coral Blue Limited Edition là một trong số đó.','https://product.hstatic.net/1000026716/product/thumbphim_a8bc25480bde444ab5837e6fb1b19dbb.png','https://product.hstatic.net/1000026716/product/earvn-ban-phim-leopold-fc900rbt-bluetooth-coral-blue-limited-edition-1_d6754d5ffe5442678a4850726ec992ee.jpg','https://product.hstatic.net/1000026716/product/earvn-ban-phim-leopold-fc900rbt-bluetooth-coral-blue-limited-edition-2_1250db5bc70444d284bb3bb3991afe00.jpg',3490000,2,1,NULL,'2022-01-10'),(10,2,'Bàn Phím Cơ Vortex PC66 (68 Key)','Vortex PC66 (68%) là dòng bàn phím máy tính mang đậm màu sắc của “hoài cổ” với tông màu chủ đạo trắng ngọc trai và xám tạo nên tổng thể vô cùng hài hòa, độc đáo. Tính năng kết nối đa dạng, dễ dàng tương thích trên nhiều thiết bị,.','https://product.hstatic.net/1000026716/product/kbtre68-1_1080x_ee6240bd27594632b3996bd1913f302b.png','https://product.hstatic.net/1000026716/product/gearvn-ban-phim-co-vortex-kbt-re-68-retro-1_50d242422ab8410eb6f0b238ea4d9e22.jpg','https://product.hstatic.net/1000026716/product/gearvn-ban-phim-co-vortex-kbt-re-68-retro-2_9b47d48570144967b43bdd12467c158f.jpg',2790000,11,1,NULL,'2022-01-10'),(11,2,'IKBC CD87HR','IKBC CD87HR là chiếc bàn phím cơ vừa ra mắt vào tháng 8/2022 từ nhà IKBC. Mang đến cho người dùng công cụ hỗ trợ công việc với thao tác nhấn phím nhanh và thoải mái. Cùng với đó là mức giá hợp lý đáp ứng nhiều nhu cầu sử dụng. ','https://product.hstatic.net/1000026716/product/hinh-1-white_3d772a2c05a140e1818e8e387c420dd3.gif','https://product.hstatic.net/1000026716/product/hinh-1-white_3d772a2c05a140e1818e8e387c420dd3.gif','https://product.hstatic.net/1000026716/product/gearvn-ban-phim-ikbc-cd87hr-3_35826c24c1e84f64ae31c006f43ed3cb.png',1750000,1,1,NULL,'2022-01-10'),(12,2,'Bàn phím Mistel X8 Nimitz','Mistel được xem là một trong những hãng chuyên mang đến các dòng bàn phím cơ chất lượng với giá thành vô cùng hợp lý phù hợp với người dùng phổ thông và dân văn phòng. Các dòng bàn phím đến từ hãng luôn sở hữu thiết kế đơn giản nhưng vô cùng sang trọng và đẳng cấp.','https://product.hstatic.net/1000026716/product/sdfgsdfsd_944433d08d544b0c972ee8888213e777.png','https://product.hstatic.net/1000026716/product/carousel_1_1651638273_d93081e7cbfc42d98e639adcbf935d5c.png','https://product.hstatic.net/1000026716/product/carousel_2_1651638273_fc5de2a5961d40a8a83578869296ade5.png',2100000,3,1,NULL,'2022-01-10'),(31,3,'Chuột Gaming Havit MS878','Havit MS878 là dòng chuột chơi game sở hữu thiết kế ấn tượng, độc đáo mang đến những trải nghiệm chơi game tuyệt vời. Ngoài ra, MS878 còn là một trong những dòng chuột Havit có thể điều chỉnh DPI, led RGB và nhiều tính năng hỗ trợ cho mọi nhu cầu sử dụng một cách dễ dàng. ','https://product.hstatic.net/200000722513/product/b8a10-95ac-4e6d-9e50-2808c2959505__1__15430e9a7a954cd9a4427309477cb0df_e869da53af56496c9c74617366a28e2b_master.png','https://product.hstatic.net/200000722513/product/19ecd-e9eb-409d-adb6-cee76439d730__1__0ef927efcb6e4388903bb7e14c743c5e_ecba058454c540debdba47d49b6ca88c_master.jpg','https://product.hstatic.net/200000722513/product/-6858fd8e-556f-470b-809f-7e5563c76a68_22ab56e0f2d14d7688fd127ed1f98e5b_7ca01b2f26014dbaa31813d7828fdb93_master.jpg',250000,3,1,NULL,'2022-01-10'),(32,3,'Chuột Logitech G502 Hero','Ngoài hiệu suất cốt lõi và các tính năng cá nhân, nhiều chi tiết được thiết kế và chế tạo với sự tận tâm. Logitech G502 Hero là một trong những dòng chuột gaming giá rẻ so với các sản phẩm ở cùng phân khúc với dây bện với nút buộc dây có khóa nhám, phần cầm nắm bên có viền cao su, cửa từ vào khoang để khối nặng và nhiều hơn nữa.','https://product.hstatic.net/1000026716/product/avatar_84b7b3e44966416897cc4a9179da4596.png','https://product.hstatic.net/1000026716/product/gearvn_logitech_g502hero.png','https://product.hstatic.net/1000026716/product/high_resolution_logitech-g502-hero-left-profile-edited-100770385-large.jpg',899000,67,1,NULL,'2022-01-10'),(33,3,'Chuột Logitech G502 X Plus LightSpeed White','Chuột Logitech G502 X PLUS White là sản phẩm mới nhất của series G502 đình đám. Được thiết kế lại và cải tiến với công nghệ chơi game hiện đại, bao gồm công tắc Lightforce lai quang học - cơ học đầu tiên, Lightspeed không dây, LIGHT SYNC RGB và cảm biến quang học Hero 25K, Logitech G502 X PLUS chắc chắn là một trong những gaming gear đáng mua nhất cho game thủ thời gian sắp tới.','https://product.hstatic.net/1000026716/product/gearvn-chuot-logitech-g502-x-plus-lightspeed-white-1_283944b0723544baa411b497814f5043.jpg','https://product.hstatic.net/1000026716/product/gearvn-chuot-logitech-g502-x-plus-lightspeed-white-2_090a6410c89c4d26badc50edaa35ec0a.jpg','https://product.hstatic.net/1000026716/product/gearvn-chuot-logitech-g502-x-plus-lightspeed-white-3_a86f524774564f479085f04c0f2d1aa8.jpg',1200000,24,1,NULL,'2022-01-10'),(34,3,'Chuột chơi game ZOWIE EC3-C','Chuột và bàn phím Zowie luôn là sự lựa chọn hàng đầu của nhiều game thủ khi tìm cho mình những dòng sản phẩm chất lượng chiến được mọi tựa game.','https://product.hstatic.net/1000026716/product/thumbchuot_bf5d10e6f7924debb4401b7ee7cf5ba5.png','https://product.hstatic.net/1000026716/product/z3119259393470_39677ee7f7e1fe87f6f0f2e70ab622b2_724ab9df923844a983a39c823dd88022.jpg','https://product.hstatic.net/1000026716/product/z3119259386719_2a6349c1b67a9cf65eca3ba7a4232e2c_af08cd0b0ee44dd382c1fa0014883f84.jpg',1590000,15,1,NULL,'2022-01-10'),(35,3,'Chuột Logitech G705 Off White','Những dòng chuột Logitech luôn là sự lựa chọn số 1 của hàng triệu người dùng từ các dòng chuột văn phòng đến chuột Gaming với nhiều tính năng nổi bật. Trong đó, Logitech G705 là một trong những sản phẩm chuột máy tính không dây thiết kế nhỏ gọn nhưng vẫn đáp ứng tốt mọi nhu cầu từ người tiêu dùng.','https://product.hstatic.net/1000026716/product/g705-gallery-3_de00421261634884ae13a5b56cd374ff.png','https://product.hstatic.net/1000026716/product/g705-gallery-3_de00421261634884ae13a5b56cd374ff.png','https://product.hstatic.net/1000026716/product/gearvn-chuot-logitech-g705-off-white-2_9806d37de98440ad990cfa77e5320a18.jpg',2190000,24,1,NULL,'2022-01-10'),(36,3,'Chuột Logitech MX Anywhere 3 for Business Pale Grey','Logitech MX Anywhere dòng chuột văn phòng không dây tiện lợi, dễ dàng mang đi và sử dụng ở bất kỳ đâu. Sở hữu kiểu dáng đối xứng ôm sát lòng bàn tay giúp mọi thao tác sử dụng chuột thêm phần tiện lợi.','https://product.hstatic.net/1000026716/product/mx-anywhere-3-portable-business-mouse-gallery-pale-gray-6_2d988f438eee43998dc855d3ea7b4a36.png','https://product.hstatic.net/1000026716/product/mx-anywhere-3-portable-business-mouse-gallery-pale-gray-5_da8d2dd55e094a5ea61b80f2b4a663b9.png','https://product.hstatic.net/1000026716/product/mx-anywhere-3-portable-business-mouse-gallery-pale-gray-4_83c666c299b646febcbaa51f7922454a.png',1999000,21,1,NULL,'2022-01-10'),(38,2,'Bàn phím AKKO ACR Pro 68','Hoàn thiện với thiết kế 68 phím, bàn phím AKKO ACR Pro 68 mang đến vóc dáng nhỏ gọn nhưng vẫn mang đến sự cứng cáp cần thiết dành cho bàn phím cơ, thích hợp dành cho mọi không gian bàn làm việc và thuận tiện trong setup, quá trình sử dụng. Lớp vỏ ngoài của AKKO ACR Pro 68 được làm trắng đục nhằm tăng thêm sự huyền ảo mà dãy đèn LED RGB bên trong mang tới.','https://akkogear.com.vn/wp-content/uploads/2022/04/ban-phim-akko-acr68-pro-06.jpg','https://akkogear.com.vn/wp-content/uploads/2022/04/ban-phim-akko-acr68-pro-09.jpg','https://akkogear.com.vn/wp-content/uploads/2022/04/ban-phim-akko-acr68-pro-05.jpg',2899000,50,1,15,'2022-01-10'),(39,2,'Bàn phím AKKO 3098 RF Dracula Castle','AKKO 3098 RF Dracula Castle với layout 98 phím là phiên bản rút gọn của bàn phím Full-size. Bàn phím này vẫn có cụm phím điều hướng và dãy numpad nhưng được thiết kế sát gần nhau; phím mũi tên được đặt nằm ngày dưới nút Enter và nút Numpad ép sát vào cụm phím mũi tên. Điều này đã tạo nên một mẫu bàn phím có vẻ ngoài độc đáo, đầy đủ phím nhưng chiếm ít diện tích hơn.','https://akkogear.com.vn/wp-content/uploads/2023/06/ban-phim-akko-3098-rf-dracula-castle-01.jpg','https://akkogear.com.vn/wp-content/uploads/2021/12/ban-phim-co-akko-3098n-multi-modes-dracula-castle-04.jpg','https://akkogear.com.vn/wp-content/uploads/2021/12/ban-phim-co-akko-3098n-multi-modes-dracula-castle-03.jpg',1699000,78,1,20,'2022-01-10'),(40,2,'Bàn Phím  Rapoo E9550G','Bàn Phím Không Dây Bluetooth Rapoo E9550G sở hữu kiểu dáng gọn chắc, gam màu thanh lịch, phản hồi nhanh chóng, dễ dàng mang theo và không chiếm quá nhiều diện tích cho bàn làm việc của bạn.','//cdn.tgdd.vn/Products/Images/4547/307846/ban-phim-khong-day-bluetooth-rapoo-e9550g-den-1.jpg','//cdn.tgdd.vn/Products/Images/4547/307846/ban-phim-khong-day-bluetooth-rapoo-e9550g-den-5.jpg','//cdn.tgdd.vn/Products/Images/4547/307846/ban-phim-khong-day-bluetooth-rapoo-e9550g-den-6.jpg',990000,100,1,7,'2022-01-10'),(41,2,'Bàn Phím Cơ Gaming Razer Huntsman Tournament Edition','Razer Huntsman Tournament Edition thiết kế lược giản đi vùng phím số, sử dụng tổng cộng 87 phím cơ bản để bàn làm việc của bạn trở nên gọn gàng hơn, mà vẫn đảm bảo sự tiện lợi tối đa nhất cho soạn thảo, chiến game.','https://cdn.tgdd.vn/Products/Images/4547/243200/co-co-day-gaming-razer-huntsman-tournament-edition-2-org.jpg','//cdn.tgdd.vn/Products/Images/4547/243200/co-co-day-gaming-razer-huntsman-tournament-edition-4-org.jpg','//cdn.tgdd.vn/Products/Images/4547/243200/co-co-day-gaming-razer-huntsman-tournament-edition-14-org.jpg',2310000,70,1,8,'2022-01-10'),(42,3,'Chuột Gaming Rapoo VT960s','Chuột không dây Gaming Rapoo VT960s với kiểu dáng mang đậm chất gaming, thiết kế gọn chắc, chất liệu bền bỉ, mang đến cho các bạn game thủ những trải nghiệm tuyệt vời nhất.','//cdn.tgdd.vn/Products/Images/86/308679/chuot-khong-day-gaming-rapoo-vt960s-1.jpg','//cdn.tgdd.vn/Products/Images/86/308679/chuot-khong-day-gaming-rapoo-vt960s-2.jpg','//cdn.tgdd.vn/Products/Images/86/308679/chuot-khong-day-gaming-rapoo-vt960s-3.jpg',1690000,87,1,5,'2022-01-10'),(43,3,'Chuột Silent Logitech Signature M650 ','Chuột Không dây Bluetooth Silent Logitech Signature M650 sở hữu cách thiết kế gọn gàng, khối lượng cực kỳ nhẹ cùng độ phân giải lớn, hứa hẹn cùng chiếc máy tính của bạn chinh phục mọi tác vụ từ học tập đến làm việc đều vô cùng mượt mà.','//cdn.tgdd.vn/Products/Images/86/299931/chuot-khong-day-logitech-signature-m650-den-size-m-1.jpg','//cdn.tgdd.vn/Products/Images/86/299931/chuot-khong-day-logitech-signature-m650-den-size-m-2.jpg','//cdn.tgdd.vn/Products/Images/86/299931/chuot-khong-day-logitech-signature-m650-den-size-m-4.jpg',660000,121,1,6,'2022-01-10'),(44,3,'Chuột Gaming Asus TUF M4 WL','Chuột không dây Gaming Asus TUF M4 WL có nắp vỏ bằng PBT và các nút bên cạnh được xử lý bằng lớp ion bạc kháng khuẩn, đảm bảo cảm giác cầm chắc chắn và an toàn, cho phép bạn làm sạch bề mặt chuột một cách dễ dàng.','//cdn.tgdd.vn/Products/Images/86/279454/chuot-khong-day-gaming-asus-tuf-m4-wl-1-1.jpg','//cdn.tgdd.vn/Products/Images/86/279454/chuot-khong-day-gaming-asus-tuf-m4-wl-2-1.jpg','//cdn.tgdd.vn/Products/Images/86/279454/chuot-khong-day-gaming-asus-tuf-m4-wl-7.jpg',1070000,34,1,NULL,'2022-01-10'),(45,3,'Chuột Bluetooth Apple MK2E3 ','Chuột Bluetooth Apple MK2E3 thiết kế sang trọng với tông màu trắng bạc, bề mặt trơn láng, kiểu dáng thon gọn vừa tay cầm','//cdn.tgdd.vn/Products/Images/86/251787/chuot-bluetooth-apple-mk2e3-trang-1.jpg','//cdn.tgdd.vn/Products/Images/86/251787/chuot-bluetooth-apple-mk2e3-trang-2.jpg','//cdn.tgdd.vn/Products/Images/86/251787/chuot-bluetooth-apple-mk2e3-trang-3.jpg',2490000,87,1,NULL,'2022-01-10');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `roleID` int NOT NULL,
  `roleName` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin'),(2,'Manager'),(3,'User');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salecode`
--

DROP TABLE IF EXISTS `salecode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salecode` (
  `salecodeID` int NOT NULL AUTO_INCREMENT,
  `code` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `salecodeRate` float DEFAULT '0',
  PRIMARY KEY (`salecodeID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salecode`
--

LOCK TABLES `salecode` WRITE;
/*!40000 ALTER TABLE `salecode` DISABLE KEYS */;
INSERT INTO `salecode` VALUES (1,'jjijfidsj',5,'2023-05-30',12),(2,'12bjbqbwe',-2,'2023-07-30',10),(3,'e21fqw',69,'2023-07-23',5),(4,'1313da',60,'2023-08-04',5),(5,'fwqeq',42,'2023-09-30',20);
/*!40000 ALTER TABLE `salecode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saler`
--

DROP TABLE IF EXISTS `saler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saler` (
  `salerID` int NOT NULL,
  `shift` varchar(45) DEFAULT NULL,
  `saler_userID` int DEFAULT NULL,
  PRIMARY KEY (`salerID`),
  KEY `saler_userID_idx` (`saler_userID`),
  CONSTRAINT `saler_userID` FOREIGN KEY (`saler_userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saler`
--

LOCK TABLES `saler` WRITE;
/*!40000 ALTER TABLE `saler` DISABLE KEYS */;
/*!40000 ALTER TABLE `saler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sex`
--

DROP TABLE IF EXISTS `sex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sex` (
  `sexID` int NOT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`sexID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sex`
--

LOCK TABLES `sex` WRITE;
/*!40000 ALTER TABLE `sex` DISABLE KEYS */;
INSERT INTO `sex` VALUES (1,'Male'),(2,'Female'),(3,'L'),(4,'G'),(5,'B'),(6,'T'),(7,'Q'),(8,'+');
/*!40000 ALTER TABLE `sex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping`
--

DROP TABLE IF EXISTS `shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping` (
  `shippingID` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`shippingID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping`
--

LOCK TABLES `shipping` WRITE;
/*!40000 ALTER TABLE `shipping` DISABLE KEYS */;
INSERT INTO `shipping` VALUES (1,NULL,'1.1.3.4040'),(2,NULL,'19.2.3.444'),(3,NULL,'wall street'),(4,NULL,'nebraska'),(5,NULL,'thanh hoa');
/*!40000 ALTER TABLE `shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `user_roleID` int DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `user_sexID` int DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `register_code` varchar(150) DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  KEY `user_roleID_idx` (`user_roleID`),
  KEY `user_sexID_idx` (`user_sexID`),
  CONSTRAINT `user_roleID` FOREIGN KEY (`user_roleID`) REFERENCES `role` (`roleID`),
  CONSTRAINT `user_sexID` FOREIGN KEY (`user_sexID`) REFERENCES `sex` (`sexID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'hoang@fu','1',1,'hoang',17,2,NULL,'0932233424','',NULL,'a@gmail.com',_binary ''),(2,'ha','1',1,'ha',20,3,NULL,'0784888822',NULL,NULL,'ha@gmail.com',_binary '\0'),(3,'dang2012','1',2,'dang',22,2,NULL,'0293929994',NULL,NULL,'dang@gmail.com',_binary ''),(4,'tri2k8','1',2,'tri',18,1,NULL,'0299402888',NULL,NULL,'tri@gmail.com',_binary '\0'),(5,'bestFlo','1',2,'dan',19,1,NULL,'0485003032',NULL,NULL,'dan@gmail.com',_binary ''),(6,'trancalli','1',3,'tran',NULL,3,NULL,'0912827474',NULL,NULL,'tran@gmail.com',_binary ''),(7,'momo','1',3,'dao',NULL,4,NULL,'0288899444',NULL,NULL,'dao@gmail.com',_binary ''),(8,'hunggay','1',3,'hung',NULL,5,NULL,'0494777364',NULL,NULL,'hung@gmail.com',_binary '\0'),(9,'dangnguyen','1',3,'dang',NULL,6,NULL,'0487563344',NULL,NULL,'dangtr@gmail.com',_binary ''),(10,'sirducdz2','Sirducdz7a@123',3,'NGUYEN VAN DUC',21,1,'Hà Nội - Việt Nam','0862702611',NULL,NULL,'ducnvhe160331@fpt.edu.vn',_binary ''),(11,'sirducdz123','Sirducdz7a@@',3,'Ducnguyen',21,1,NULL,'0862702611',NULL,NULL,'ccvnphu0001@gmail.com',_binary ''),(12,'sirducdz123','Sirducdz7a@@',3,'Ducnguyen',21,1,NULL,'0862702611',NULL,NULL,'ccvnphu0001@gmail.com',_binary ''),(13,'sirducdz123','Sirducdz7a@@',3,'Ducnguyen',21,1,NULL,'0862702611',NULL,NULL,'ccvnphu0001@gmail.com',_binary ''),(14,'sirducdz123','Sirducdz7a@@',3,'Ducnguyen',21,1,NULL,'0862702611',NULL,NULL,'ccvnphu0001@gmail.com',_binary ''),(15,'sirducdz123','Sirducdz7a@@',3,'Ducnguyen',21,1,NULL,'0862702611',NULL,NULL,'ccvnphu0001@gmail.com',_binary ''),(16,'sirducdz123','Sirducdz7a@@',3,'Ducnguyen',21,1,NULL,'0862702611',NULL,NULL,'ccvnphu0001@gmail.com',_binary ''),(17,'sirducdz123','Sirducdz7a@@',3,'Ducnguyen',21,1,NULL,'0862702611',NULL,NULL,'ccvnphu0001@gmail.com',_binary ''),(18,'sirducdz123','Sirducdz7a@@',3,'Ducnguyen',21,1,NULL,'0862702611',NULL,NULL,'ccvnphu0001@gmail.com',_binary ''),(19,'sirducdz123','Sirducdz7a@@',3,'Ducnguyen',21,1,NULL,'0862702611',NULL,NULL,'ccvnphu0001@gmail.com',_binary ''),(20,'sirducdz123','Sirducdz7a@@',3,'Ducnguyen',21,1,NULL,'0862702611',NULL,NULL,'ccvnphu0001@gmail.com',_binary ''),(21,'sirducdz123','Sirducdz7a@@',3,'Ducnguyen',21,1,NULL,'0862702611',NULL,NULL,'ccvnphu0001@gmail.com',_binary ''),(22,'sirducdz123','Sirducdz7a@@',3,'Ducnguyen',21,1,NULL,'0862702611',NULL,NULL,'ccvnphu0001@gmail.com',_binary ''),(23,'sirducdz123','Sirducdz7a@@',3,'Ducnguyen',21,1,NULL,'0862702611',NULL,NULL,'ccvnphu0001@gmail.com',_binary ''),(24,'sirducdz123','Sirducdz7a@@',3,'Ducnguyen',21,1,NULL,'0862702611',NULL,NULL,'ccvnphu0001@gmail.com',_binary ''),(25,'sirducdz123','Sirducdz7a@@',3,'Ducnguyen',21,1,NULL,'0862702611',NULL,NULL,'ccvnphu0001@gmail.com',_binary ''),(26,'sirducdz123','Sirducdz7a@@',3,'Ducnguyen',21,1,NULL,'0862702611',NULL,NULL,'ccvnphu0001@gmail.com',_binary ''),(27,'sirducdz123','Sirducdz7a@@',3,'Ducnguyen',21,1,NULL,'0862702611',NULL,NULL,'ccvnphu0001@gmail.com',_binary ''),(28,'sirducdz123','Sirducdz7a@@',3,'Ducnguyen',21,1,NULL,'0862702611',NULL,NULL,'ccvnphu0001@gmail.com',_binary ''),(29,'sirducdz123','Sirducdz7a@@',3,'Ducnguyen',21,1,NULL,'0862702611',NULL,NULL,'ccvnphu0001@gmail.com',_binary ''),(30,'sirducdz123','Sirducdz7a@@',3,'Ducnguyen',21,1,NULL,'0862702611',NULL,NULL,'ccvnphu0001@gmail.com',_binary ''),(31,'sirducdz123','Sirducdz7a@@',3,'Ducnguyen',21,1,NULL,'0862702611',NULL,NULL,'ccvnphu0001@gmail.com',_binary ''),(32,'sirducdz123','Sirducdz7a@@',3,'Ducnguyen',21,1,NULL,'0862702611',NULL,NULL,'ccvnphu0001@gmail.com',_binary ''),(33,'sirducdz123','Sirducdz7a@@',3,'Ducnguyen',21,1,NULL,'0862702611',NULL,NULL,'ccvnphu0001@gmail.com',_binary ''),(34,'sirducdz123','Sirducdz7a@@',3,'Ducnguyen',21,1,NULL,'0862702611',NULL,NULL,'ccvnphu0001@gmail.com',_binary ''),(35,'sirducdz123','Sirducdz7a@@',3,'Ducnguyen',21,1,NULL,'0862702611',NULL,NULL,'ccvnphu0001@gmail.com',_binary '');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-08  0:26:50
