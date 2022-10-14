CREATE DATABASE  IF NOT EXISTS `plantlibrary` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `plantlibrary`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: plantlibrary
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
-- Table structure for table `pest`
--

DROP TABLE IF EXISTS `pest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pest` (
  `pe_id` int NOT NULL AUTO_INCREMENT COMMENT 'pest_id',
  `ec_id` int NOT NULL,
  `pe_name` varchar(50) NOT NULL,
  `pe_image` varchar(500) DEFAULT NULL,
  `pe_cause` varchar(300) DEFAULT NULL,
  `pe_method` varchar(300) DEFAULT NULL,
  `pe_biologicalControl` varchar(300) DEFAULT NULL,
  `pe_naturalEnemy` varchar(100) DEFAULT NULL,
  `pe_carefulPlant` varchar(100) DEFAULT NULL,
  `pe_description` varchar(1000) DEFAULT NULL,
  `pe_hits` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`pe_id`),
  KEY `pe_ec_id_idx` (`ec_id`),
  CONSTRAINT `pe_ec_id` FOREIGN KEY (`ec_id`) REFERENCES `encyclopedia_category` (`ec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pest`
--

LOCK TABLES `pest` WRITE;
/*!40000 ALTER TABLE `pest` DISABLE KEYS */;
INSERT INTO `pest` VALUES (1,30,'루비깍지벌레','1-1.jpg,1-2.jpg','','','','','','',9),(2,30,'진딧물','2.jpg','','','','','','',3),(3,30,'응애','3-1.png,3-2.jpg,3-3.jpg,3-4.jpg','새로 들인 식물에 응애가 붙어와 다른 식물로 옮겨붙는 경우가 대다수이다.','잎맥 사이, 잎자루 뒷면 등 굴곡이 있는 곳에 거미줄처럼 생긴 흰가루가 묻어나온다. 잎 표면의 마름, 흰색, 황색, 갈색의 반점이 생긴다.','새로운 식물을 들이는 경우에, 처음부터 같은 공간에 두지않고 격리기간을 두어 해충의 유무 상태를 확인한다.\r\n이미 응애에 피해를 입은 경우에는 가지치기한 잎, 낙엽 등의 잔재물을 깨끗이 청소하여 발생원을 없앤다. \r\n주기적으로 물을 뿌려주면 발생이 억제된다. 또 발생 초기에 농약 등의 약제를 사용하면 효과가 매우 좋다.','잎응애의 경우: 칠레이리응애','모든 식물','점박이, 차, 차먼지 응애 등을 포함한 대다수의 응애들이 식물 줄기나 잎에 침을 꽂아 세포액을 빨아먹어 식물의 생육을 방해하기 때문에 익충인 거미와는 다르게 명백한 해충에 속한다.\r\n생김새는 대체적으로 거미와 비슷하며, 감각기능을 가진 털이 나있다. 거미와 마찬가지로 줄을 치지만 이동 능력이 떨어지기에, 주로 흡즙하는 서식지 주변이나 인근 가지에다 그물처럼 쳐 식물에서 떨어지지 않으면서도 건너편으로 가기 위한 안전 로프 용도로 쓴다. 그리고 때때로 바람이 불면 줄을 길게 뿜어 건너편 가지나 다른 숙주 식물로 건너가기도 한다. 사람이나 짐승에게 들러붙어 이동하는 경우도 있다.\r\n주로 먼지가 많고 햇빛이 강한 고온건조한 환경에서 창궐하며 습기를 굉장히 싫어한다. 그렇기 때문에 주로 잎 뒷면과 어린 줄기에서 자주 발생한다.',40),(4,30,'온실가루이','4.jpg','','','','','','',2),(5,30,'흰가루이','5.jpg','','','','','','',2),(6,30,'방패벌레','6-1.jpg,6-2.jpg','','','','','','',2),(7,30,'총채벌레','7-1.jpg,7-2.jpg','','','','','','',7),(8,30,'작은뿌리파리','8.jpg','','','','','','',2),(9,30,'굴파리','9.jpg','','','','','','',3),(10,30,'귤가루깍지벌레','10.jpg','','','','','','',3),(11,30,'고자리파리','11.jpg','','','','','','',1),(12,30,'큰이십팔점박이무당벌레','12.jpg','','','','','','',2),(13,30,'민달팽이','13.jpg','','','','','','',8);
/*!40000 ALTER TABLE `pest` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-14 11:26:34
