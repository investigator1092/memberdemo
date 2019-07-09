-- MySQL dump 10.17  Distrib 10.3.15-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: sample_db_spring
-- ------------------------------------------------------
-- Server version	10.3.15-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `height` smallint(6) DEFAULT NULL,
  `blood` varchar(2) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `birthplace_id` smallint(6) DEFAULT NULL,
  `update_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id`),
  KEY `FK4spx7yh6v5jcqq4ysa4e9kxgp` (`birthplace_id`),
  CONSTRAINT `FK4spx7yh6v5jcqq4ysa4e9kxgp` FOREIGN KEY (`birthplace_id`) REFERENCES `prefecture` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` VALUES (3,'加藤剛',173,NULL,'1938-02-04',22,'2019-05-29 07:59:41.102946'),(4,'島田陽子',171,'O','1953-05-17',43,'2019-05-29 07:59:41.102946'),(6,'佐分利信',NULL,NULL,'1909-02-12',1,'2019-05-29 07:59:41.102946'),(7,'緒形拳',173,'B','1937-07-20',13,'2019-05-29 07:59:41.102946'),(8,'松山政路',167,'A','1947-05-21',13,'2019-05-29 07:59:41.102946'),(9,'加藤嘉',NULL,NULL,'1913-01-12',13,'2019-05-29 07:59:41.102946'),(10,'菅井きん',155,'B','1926-02-28',13,'2019-05-29 07:59:41.102946'),(11,'笠智衆',NULL,NULL,'1904-05-13',43,'2019-05-29 07:59:41.102946'),(12,'殿山泰司',NULL,NULL,'1915-10-17',28,'2019-05-29 07:59:41.102946'),(14,'山田太郎',180,'O','2000-01-01',13,'2019-06-19 14:37:39.083000'),(16,'あああ',180,'O','2000-01-01',8,'2019-06-19 16:50:05.813000'),(18,'田中一郎',160,'A','2000-01-10',5,'2019-06-20 10:28:52.160000'),(19,'シャア・アズナブル',180,'AB','0059-05-07',47,'2019-06-20 10:32:30.908000'),(21,'テスト',190,'A','2000-01-10',9,'2019-06-20 10:58:54.084000'),(23,'鈴木一郎',172,'A','1992-02-02',29,'2019-06-24 12:20:13.968000'),(26,'渡辺美樹',170,'O','2000-01-01',8,'2019-06-25 10:19:12.820000'),(31,'斉藤',NULL,NULL,NULL,NULL,'2019-06-25 22:39:32.807000'),(34,'田中一郎',160,'O','2000-01-01',8,'2019-06-26 00:35:28.207000'),(35,'デューク更家',220,'A','1992-02-02',13,'2019-06-26 04:46:32.591000'),(36,'恐怖の大王',140,'B','2038-01-19',48,'2019-06-26 09:07:33.188000'),(37,'鳥肌実',160,'AB','1966-02-02',13,'2019-06-26 09:08:49.283000'),(39,'南原竜樹',180,'O','1968-06-05',23,'2019-06-27 10:32:12.486000'),(40,'剛田武',19,'O','1965-07-10',13,'2019-06-28 14:59:28.635000'),(41,'柴田勝家',180,'B','1520-07-23',23,'2019-06-29 03:15:33.566000'),(42,'織田信長',190,'A','1520-03-30',23,'2019-06-29 18:13:37.400000');
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prefecture`
--

DROP TABLE IF EXISTS `prefecture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prefecture` (
  `id` smallint(6) NOT NULL,
  `name` varchar(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prefecture`
--

LOCK TABLES `prefecture` WRITE;
/*!40000 ALTER TABLE `prefecture` DISABLE KEYS */;
INSERT INTO `prefecture` VALUES (1,'北海道'),(2,'青森県'),(3,'岩手県'),(4,'宮城県'),(5,'秋田県'),(6,'山形県'),(7,'福島県'),(8,'茨城県'),(9,'栃木県'),(10,'群馬県'),(11,'埼玉県'),(12,'千葉県'),(13,'東京都'),(14,'神奈川県'),(15,'新潟県'),(16,'富山県'),(17,'石川県'),(18,'福井県'),(19,'山梨県'),(20,'長野県'),(21,'岐阜県'),(22,'静岡県'),(23,'愛知県'),(24,'三重県'),(25,'滋賀県'),(26,'京都府'),(27,'大阪府'),(28,'兵庫県'),(29,'奈良県'),(30,'和歌山県'),(31,'鳥取県'),(32,'島根県'),(33,'岡山県'),(34,'広島県'),(35,'山口県'),(36,'徳島県'),(37,'香川県'),(38,'愛媛県'),(39,'高知県'),(40,'福岡県'),(41,'佐賀県'),(42,'長崎県'),(43,'熊本県'),(44,'大分県'),(45,'宮崎県'),(46,'鹿児島県'),(47,'沖縄県'),(48,'海外');
/*!40000 ALTER TABLE `prefecture` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-09 19:09:24
