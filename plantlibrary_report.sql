-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: plantlibrary
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
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `r_no` int NOT NULL AUTO_INCREMENT,
  `b_no` int DEFAULT NULL,
  `c_no` int DEFAULT NULL,
  `u_id` varchar(50) NOT NULL,
  `report_user` varchar(50) NOT NULL,
  `rc_content` varchar(50) DEFAULT NULL,
  `r_content` varchar(3000) DEFAULT NULL,
  `r_file` varchar(45) DEFAULT NULL,
  `r_state` int DEFAULT NULL,
  PRIMARY KEY (`r_no`),
  KEY `r_u_id_idx` (`u_id`),
  KEY `r_report_user_idx` (`report_user`),
  CONSTRAINT `r_report_user` FOREIGN KEY (`report_user`) REFERENCES `board` (`u_id`),
  CONSTRAINT `r_u_id` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (22,947,0,'root','boardtest','이거봐 짱이지','sss',NULL,0),(23,936,0,'adminboard','boardtest','게시글 테스트 [490]','ㅇㅇㅇㅇㅇㅇㅇ',NULL,0),(24,64,0,'adminboard','root','aaaaaaaaaaaaa','ㅇㅇㅇ',NULL,0),(25,0,64,'adminboard','root','aaaaaaaaaaaaa','ㅇㅇ',NULL,0),(26,0,64,'adminboard','root','aaaaaaaaaaaaa','ㅇㅇㅇ',NULL,0),(27,0,64,'adminboard','root','aaaaaaaaaaaaa','ㅇㅇㅇ',NULL,0),(28,0,64,'adminboard','root','aaaaaaaaaaaaa','ㅍ',NULL,0),(29,947,0,'adminboard','boardtest','이거봐 짱이지','ㅣㅣ',NULL,0),(30,947,0,'adminboard','boardtest','이거봐 짱이지','ㅇㅇㅇ',NULL,0),(31,947,64,'adminboard','root','aaaaaaaaaaaaa','받았어?',NULL,0),(32,947,67,'root','adminboard','ㅊㅊㅊ[   ㅊㅌㅌ]','내가 뭘 하고 있는걸까..',NULL,0),(33,947,0,'root','boardtest','이거봐 짱이지','ㅍㅍ','20221010-235614171_245.jpg',0),(34,947,0,'root','boardtest','이거봐 짱이지','ㅍㅍ','20221010-235617636_842.jpg',0),(35,947,0,'root','boardtest','이거봐 짱이지','ㅍㅍ','20221010-235619668_652.jpg',0),(36,947,0,'root','boardtest','이거봐 짱이지','ㅋㅋ','20221010-235650971_958.mwb',0),(37,947,67,'root','adminboard','ㅊㅊㅊ[   ㅊㅌㅌ]','데이터 타입 빼니까 뙤네~~!!',NULL,0);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-11  0:32:28
