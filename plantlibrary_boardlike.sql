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
-- Table structure for table `boardlike`
--

DROP TABLE IF EXISTS `boardlike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boardlike` (
  `bl_no` int NOT NULL AUTO_INCREMENT,
  `b_no` int NOT NULL,
  `u_id` varchar(50) NOT NULL,
  `bl_content` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`bl_no`),
  KEY `b_no_idx` (`b_no`),
  KEY `u_id_idx` (`u_id`),
  CONSTRAINT `bl_b_no` FOREIGN KEY (`b_no`) REFERENCES `board` (`b_no`),
  CONSTRAINT `bl_u_id` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boardlike`
--

LOCK TABLES `boardlike` WRITE;
/*!40000 ALTER TABLE `boardlike` DISABLE KEYS */;
INSERT INTO `boardlike` VALUES (9,926,'boardtest','게시글 테스트 [480]'),(10,905,'boardtest','게시글 테스트 [459]'),(14,946,'boardtest','좋아요 완성'),(16,936,'boardtest','게시글 테스트 [490]'),(18,932,'boardtest','게시글 테스트 [486]'),(19,926,'adminboard','게시글 테스트 [480]'),(20,947,'adminboard','이거봐 짱이지'),(26,947,'root','이거봐 짱이지'),(27,947,'boardtest','이거봐 짱이지'),(29,936,'root','게시글 테스트 [490]');
/*!40000 ALTER TABLE `boardlike` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-11  0:32:29
