-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: privateblog
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

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
-- Table structure for table `access_permission`
--

DROP TABLE IF EXISTS `access_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `access_permission_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`),
  CONSTRAINT `access_permission_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_permission`
--

LOCK TABLES `access_permission` WRITE;
/*!40000 ALTER TABLE `access_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(63) NOT NULL,
  `small_text` varchar(255) DEFAULT NULL,
  `blog_id` int(11) NOT NULL,
  `release_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_id`),
  CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'Séjour en Italie',NULL,1,NULL),(2,'Photos de vacances à Nice',NULL,2,NULL),(3,'Petite virée à Amsterdam.',NULL,1,NULL),(4,'\"Petite virée à Amsterdam.\"',NULL,1,NULL),(5,'Virée à Amsterdam.',NULL,1,NULL),(6,'Virée à bredaaaaaaaaaa.',NULL,2,NULL),(7,'A MAdrid',NULL,1,NULL),(8,'A MAdrid',NULL,1,NULL),(9,'A Marseille',NULL,2,NULL),(10,'A Marseille',NULL,2,NULL),(11,'Coupvray',NULL,2,NULL),(12,'Coupvray effefeffe',NULL,3,NULL),(13,'Coup 157',NULL,3,NULL),(14,'Coup 2000',NULL,3,NULL),(15,'- 1 -',NULL,3,NULL),(16,'- 2 -',NULL,3,NULL),(17,'- 2 -',NULL,3,NULL),(18,'2323',NULL,3,NULL),(19,'987',NULL,3,NULL),(20,'987',NULL,3,NULL),(21,'3297',NULL,3,NULL),(22,'3297',NULL,3,NULL),(23,'3297',NULL,3,NULL),(24,'3297',NULL,3,NULL),(25,'3297',NULL,3,NULL),(26,'3297',NULL,3,NULL),(27,'3297',NULL,3,NULL),(28,'huj 3297',NULL,3,NULL),(29,'huj 3297',NULL,3,NULL),(30,'333',NULL,3,NULL),(31,'333',NULL,3,NULL),(32,'333',NULL,3,NULL),(33,'333-1',NULL,3,NULL),(34,'333-1',NULL,3,NULL),(35,'333-1',NULL,3,NULL),(36,'333-1',NULL,3,NULL),(37,'333-1',NULL,3,NULL),(38,'333-1',NULL,3,NULL),(39,'333-1ffff',NULL,3,NULL),(40,'333-1ffffthth',NULL,3,NULL),(41,'333654',NULL,3,NULL),(42,'333654',NULL,3,NULL),(43,'399954',NULL,3,NULL),(44,'399rttr954',NULL,3,NULL),(45,'399rttr954',NULL,3,NULL),(46,'399rttr954',NULL,3,NULL),(47,'399rttr954',NULL,3,NULL),(48,'399rttr954',NULL,3,NULL),(49,'399rttr954',NULL,3,NULL),(50,'399rttr95477777777',NULL,3,NULL);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocks`
--

DROP TABLE IF EXISTS `blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(63) DEFAULT NULL,
  `text` varchar(511) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`),
  CONSTRAINT `blocks_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocks`
--

LOCK TABLES `blocks` WRITE;
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
INSERT INTO `blocks` VALUES (4,'L\'hotêl','L\'hôtel était trés bien, avec un open bar et un super pizzaiolo.',1),(5,NULL,NULL,1),(6,NULL,NULL,1),(7,NULL,NULL,2),(8,NULL,NULL,2),(9,NULL,NULL,2),(11,'L\'abus d\'alcool est dangereux pour la santé!',NULL,2),(12,'Sur la croisette',NULL,2),(13,'Chaude ambiance!',NULL,2),(15,'La chambre:',NULL,1),(16,'\"La chambre:\"',NULL,1),(17,'Jolie photo !',NULL,50),(18,'petit tour d(horizon',NULL,50);
/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(127) DEFAULT NULL,
  `owner_id` int(11) NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `blogs_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (1,'Mes voyages',3,1),(2,'Mes voyages',2,1),(3,'Blog sur les travaux de ma maison',1,1),(4,'Mon blog',1,1),(5,'Mon blog de photos (privé)',2,1),(6,'Vacance sen famille',2,1),(7,'Blog Actualité Football',3,1),(8,'Mes veilles technos.',3,1),(9,'Visite au musée du Louvre',1,1),(10,'Visite dans les catacombes de Paris.',1,1),(16,'Visite dans Pariissssssssss,   3',1,1),(17,'Visite dans Pariissssssssss,   3',1,1),(20,'Mon Blog Publique.',1,0),(21,'Ma Galerie de photos Publique.',2,0),(26,'esssaaaiiiisss 5',3,1),(27,'esssaaaiiiisss  privé  5',3,0),(28,'esssaaaiiiisss  privé  6',3,0),(29,'esssaaaiiiisss  privé  7',3,0),(30,'esssaaaiiiisss  privé  8',3,0),(31,'esssaaaiiiisss  privé  9',3,0),(32,'essaisss',3,1),(33,'essaisss',3,1),(34,'essaisss',3,1),(35,'essaisss',3,1),(36,'essaisss',3,1),(37,'essaisss',3,1),(38,'essaisss',3,1),(39,'essaisss',3,1),(40,'essaisss',3,1),(41,'essaisss',3,1),(42,'essaisss',3,1),(43,'essaisss',3,1);
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pictures`
--

DROP TABLE IF EXISTS `pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(63) DEFAULT NULL,
  `file_type` varchar(63) DEFAULT NULL,
  `block_id` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `block_id` (`block_id`),
  CONSTRAINT `pictures_ibfk_1` FOREIGN KEY (`block_id`) REFERENCES `blocks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pictures`
--

LOCK TABLES `pictures` WRITE;
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationships`
--

DROP TABLE IF EXISTS `relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationships` (
  `user_id_1` int(11) NOT NULL,
  `user_id_2` int(11) NOT NULL,
  KEY `user_id_1` (`user_id_1`),
  KEY `user_id_2` (`user_id_2`),
  CONSTRAINT `relationships_ibfk_1` FOREIGN KEY (`user_id_1`) REFERENCES `users` (`id`),
  CONSTRAINT `relationships_ibfk_2` FOREIGN KEY (`user_id_2`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationships`
--

LOCK TABLES `relationships` WRITE;
/*!40000 ALTER TABLE `relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(63) DEFAULT NULL,
  `password` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL,
  `password` varchar(63) NOT NULL,
  `firstname` varchar(63) DEFAULT NULL,
  `lastname` varchar(63) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'exemple@mail.com','pass',NULL,NULL),(2,'bobby@hotmail.com','bobby*77',NULL,NULL),(3,'franck@email.com','franck*77',NULL,NULL),(4,'francis@mail.com','francis','Francis','Dupont'),(5,'essai@mail.com','essai',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_name` varchar(63) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `block_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `block_id` (`block_id`),
  CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`block_id`) REFERENCES `blocks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-27 19:28:19
