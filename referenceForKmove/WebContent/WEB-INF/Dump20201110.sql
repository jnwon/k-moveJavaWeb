-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: jsp_model2
-- ------------------------------------------------------
-- Server version	5.7.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board` (
  `board_num` int(11) NOT NULL AUTO_INCREMENT,
  `board_name` varchar(20) NOT NULL,
  `board_pass` varchar(15) NOT NULL,
  `board_subject` varchar(50) NOT NULL,
  `board_content` varchar(2000) NOT NULL,
  `board_file` varchar(50) NOT NULL,
  `board_re_ref` int(11) NOT NULL,
  `board_re_lev` int(11) NOT NULL,
  `board_re_seq` int(11) NOT NULL,
  `board_readcount` int(11) DEFAULT '0',
  `board_date` date DEFAULT NULL,
  PRIMARY KEY (`board_num`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'dd','dd','ddd','ddd','82264172_148482469910504_4490275822774517760_o.jpg',1,0,0,0,'2020-02-01'),(2,'??','??','??','??','82264172_148482469910504_4490275822774517760_o.jpg',2,0,0,0,'2020-02-01'),(3,'ii','ii','ii','ii','82264172_148482469910504_4490275822774517760_o.jpg',3,0,0,0,'2020-02-01'),(4,']]',']]',']]',']]','82264172_148482469910504_4490275822774517760_o.jpg',4,0,0,0,'2020-02-01'),(5,'pp','pp','pp','pp','82264172_148482469910504_4490275822774517760_o.jpg',5,0,0,0,'2020-02-01'),(6,'oo','oo','ooo','oo','82264172_148482469910504_4490275822774517760_o.jpg',6,0,0,0,'2020-02-01'),(7,'uu','uu','uu','uu','82264172_148482469910504_4490275822774517760_o.jpg',7,0,0,0,'2020-02-01'),(8,'lk','lk','lk','lk','82264172_148482469910504_4490275822774517760_o.jpg',8,0,0,0,'2020-02-01'),(9,'asdf','asdf','asdf','asdf','82264172_148482469910504_4490275822774517760_o.jpg',9,0,0,0,'2020-02-01'),(10,'zxcv','zxcv','zxcv','zxcv','82264172_148482469910504_4490275822774517760_o.jpg',10,0,0,0,'2020-02-01'),(11,'qwerasdf','qwerasfd','qwerasdf','qwerasdf','82264172_148482469910504_4490275822774517760_o.jpg',11,0,0,0,'2020-02-01'),(12,'00','00','00','00','82264172_148482469910504_4490275822774517760_o.jpg',12,0,0,0,'2020-02-01'),(13,'dd','dd','dd','dd','82264172_148482469910504_4490275822774517760_o.jpg',13,0,0,0,'2020-02-01'),(14,'ww','ww','ww','ww','82264172_148482469910504_4490275822774517760_o.jpg',14,0,0,0,'2020-02-01'),(15,'rrr','rrr','rrr','rrr','82264172_148482469910504_4490275822774517760_o.jpg',15,0,0,0,'2020-02-02'),(16,'ttt','ttt','ttt','ttt','82264172_148482469910504_4490275822774517760_o.jpg',16,0,0,0,'2020-02-02'),(17,'ttt','ttt','ttt','ttt','82264172_148482469910504_4490275822774517760_o.jpg',17,0,0,0,'2020-02-02'),(18,'pb','pb','pb','pb','Screen Shot 2020-02-02 at 11.19.33 PM.png',18,0,0,0,'2020-02-03'),(19,'ff','ff','ff','ff','VSC keyboard-shortcuts-macos.pdf',19,0,0,0,'2020-02-03'),(20,'==','===','==','==','VSC keyboard-shortcuts-macos.pdf',20,0,0,0,'2020-02-03'),(21,'dd','dd','dd','ddd','VSC keyboard-shortcuts-macos.pdf',21,0,0,0,'2020-02-03'),(22,'dd','dd','dd','dddDD','VSC keyboard-shortcuts-macos.pdf',22,0,0,6,'2020-02-03'),(23,'dd','dd','dd','ddd','VSC keyboard-shortcuts-macos.pdf',23,0,0,0,'2020-02-03'),(24,'\'\'','\'\'','\'\'','\'\'','VSC keyboard-shortcuts-macos.pdf',24,0,0,0,'2020-02-03'),(25,'--','--','--','--','VSC keyboard-shortcuts-macos.pdf',25,0,0,0,'2020-02-03'),(26,'99','99','99','99','VSC keyboard-shortcuts-macos.pdf',26,0,0,0,'2020-02-03'),(27,'99','99','99','99','VSC keyboard-shortcuts-macos.pdf',27,0,0,0,'2020-02-04'),(28,'cc','cc','cc','cc','VSC keyboard-shortcuts-macos.pdf',28,0,0,0,'2020-02-04'),(29,'getListCount','getListCount','getListCount','getListCount','VSC keyboard-shortcuts-macos.pdf',29,0,0,28,'2020-02-04'),(30,'kate','kate','kate','kate','Screen Shot 2020-02-04 at 9.42.09 PM.png',30,0,0,8,'2020-02-04'),(31,'123','123','123','123','Screen Shot 2020-02-04 at 9.42.09 PM.png',31,0,0,3,'2020-02-04'),(32,'kate','kate','kate','kate\'s ','Screen Shot 2020-02-04 at 9.42.09 PM.png',32,0,0,1,'2020-02-06'),(33,'asdf','asdf','asdf','asdfasdfasdfasdfasdfasdfasdfasD','Screen Shot 2020-02-04 at 9.42.09 PM.png',33,0,0,24,'2020-02-06'),(34,'???','???','???','???Good','95_ACE.png',34,0,0,12,'2020-02-07'),(35,'kate','kate','kate','kate','',34,1,3,3,'2020-02-08'),(37,'1234','1234','1234','1234','',34,1,1,2,'2020-02-08'),(38,'11','11','11','11','',32,1,1,0,'2020-02-08'),(39,'11111111111','11111111111','11111111111','11111111111','62_AC.png',39,0,0,18,'2020-02-08'),(40,'kate','kate','kate','kate','',39,1,4,0,'2020-02-08'),(41,'evy','evy','evy','evy','',39,1,1,2,'2020-02-08'),(42,'hanny','hanny','hanny','hanny','',39,2,3,1,'2020-02-08'),(43,'ua','ua','ua','ua','',39,2,2,1,'2020-02-08'),(46,'kate','kate','kate','kate','31_CD.png',46,0,0,4,'2020-02-09'),(48,'kate','kate','kate','kate','cut.png',48,0,0,4,'2020-09-12'),(49,'katy','katy','katydd','katydd','',48,1,1,2,'2020-09-12'),(50,'ddd','ddd','ddd','dddsss','css.htm',50,0,0,2,'2020-11-10'),(52,'aaa','aaa','aaa','aaa','Screen Shot 2020-11-08 at 3.38.18 PM.png',52,0,0,4,'2020-11-10');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dog`
--

DROP TABLE IF EXISTS `dog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind` varchar(12) NOT NULL,
  `price` int(11) NOT NULL,
  `img` varchar(20) NOT NULL,
  `country` varchar(12) NOT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `content` varchar(400) NOT NULL,
  `readcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dog`
--

LOCK TABLES `dog` WRITE;
/*!40000 ALTER TABLE `dog` DISABLE KEYS */;
INSERT INTO `dog` VALUES (6,'dog',11,'bird.png','uk',11,11,'dog uk 11',5),(7,'cat',111,'duck.jpg','us',111,111,'cat us 111',14),(8,'duck',1111,'dogwindow.jpg','eu',1111,1111,'duck eu 1111',7),(9,'etc',11111,'flamingo.jpg','ca',11111,11111,'etc ca 11111',13),(10,'qwer',123,'iicon-19.png','hk',123,123,'123qwehk',4),(11,'???????',800000,'cut1.png','???',20,1,'cut',0),(12,'???????',800000,'cut2.png','???',20,1,'cute',0),(13,'???????',800000,'cut3.png','???',20,1,'cute',0),(14,'???????',800000,'cut.png','???',20,1,'cute',0),(15,'???????',800000,'cut1.png','???',20,11,'cut',0),(16,'MiniBichon',800000,'cut3.png','France',20,1,'cute',0);
/*!40000 ALTER TABLE `dog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `name` varchar(10) NOT NULL,
  `id` varchar(12) NOT NULL,
  `pass` varchar(16) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('joinMember','joinMember','joinMember','joinMember@nate.com'),('kate','kate','kate','kate@kate.com'),('kateS','kateS','KateShim625_','kate@kates.com'),('katy','katy','Kateshim625@','katy@gmail.com');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-10 14:48:30
