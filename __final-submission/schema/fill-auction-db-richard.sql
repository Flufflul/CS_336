-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: auction
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Dumping data for table `acoustic_electric_guitar`
--

LOCK TABLES `acoustic_electric_guitar` WRITE;
/*!40000 ALTER TABLE `acoustic_electric_guitar` DISABLE KEYS */;
INSERT INTO `acoustic_electric_guitar` VALUES (6,'SRT Piezo',0),(13,'SRT Something',1),(14,'STRTRSG something',0),(15,'STR GMIRMM G',0);
/*!40000 ALTER TABLE `acoustic_electric_guitar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `acoustic_guitar`
--

LOCK TABLES `acoustic_guitar` WRITE;
/*!40000 ALTER TABLE `acoustic_guitar` DISABLE KEYS */;
INSERT INTO `acoustic_guitar` VALUES (7,0),(8,0),(9,1);
/*!40000 ALTER TABLE `acoustic_guitar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `admin_staff`
--

LOCK TABLES `admin_staff` WRITE;
/*!40000 ALTER TABLE `admin_staff` DISABLE KEYS */;
INSERT INTO `admin_staff` VALUES ('admin1'),('CameronsAdminPower');
/*!40000 ALTER TABLE `admin_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auctions`
--

LOCK TABLES `auctions` WRITE;
/*!40000 ALTER TABLE `auctions` DISABLE KEYS */;
INSERT INTO `auctions` VALUES (1,'jerryCantrell',9,'2021-01-28 03:03:10','2021-04-28 14:00:00',500,600,800,10,43251,'admin1'),(2,'joeperry',3,'2021-01-28 03:03:10','2021-02-28 15:00:00',50000,45000,55000,100,55000,'Slash'),(3,'thief',7,'2021-04-10 03:03:10','2021-05-28 15:00:00',1000,950,1200,100,1234,'rep1'),(4,'jerryCantrell',8,'2021-03-20 03:01:00','2021-05-10 15:01:00',900,1500,2000,50,12344300,'rep1'),(5,'rep1',1,'2021-04-24 18:43:59','2021-04-30 00:00:00',0,NULL,NULL,1,0,NULL),(6,'rep1',2,'2021-04-24 18:44:27','2021-04-24 18:46:00',0,NULL,NULL,1,15,'admin1'),(7,'admin1',1,'2021-04-24 18:49:12','2021-04-24 00:00:00',0,NULL,NULL,1,0,'f'),(8,'rep1',1,'2021-04-24 23:10:21','2021-04-24 00:00:00',0,NULL,NULL,1,0,'f'),(9,'rep1',13,'2021-04-24 23:12:50','2021-04-24 23:15:00',100,500,2000,100,0,'f'),(10,'admin1',1,'2021-04-24 23:23:05','2021-05-06 00:00:00',0,NULL,NULL,1,200,NULL),(11,'rep1',7,'2021-04-24 23:23:52','2021-04-30 00:00:00',0,NULL,NULL,1,0,NULL),(12,'rep1',3,'2021-04-24 23:27:19','2021-04-25 00:00:00',0,NULL,NULL,1,1234,NULL),(13,'username',2,'2021-04-24 23:33:38','2021-04-24 00:00:00',0,NULL,NULL,1,0,'f'),(14,'admin1',14,'2021-04-24 23:36:31','2021-04-29 00:00:00',0,NULL,NULL,1,0,NULL),(15,'admin1',13,'2021-04-24 23:37:01','2021-04-24 23:38:00',0,NULL,NULL,1,0,'f'),(16,'admin1',1,'2021-04-24 23:45:51','2021-05-08 00:00:00',0,NULL,NULL,1,0,NULL),(17,'admin1',15,'2021-04-24 23:51:10','2021-04-24 23:53:00',0,NULL,NULL,1,550,'rep1'),(18,'rep1',10,'2021-04-24 23:54:13','2021-04-24 23:56:00',300,1000,5000,200,400,'f'),(19,'username',6,'2021-04-24 23:55:54','2021-04-24 23:57:00',0,NULL,12345,1,12345,'rep1');
/*!40000 ALTER TABLE `auctions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `buyer_alert`
--

LOCK TABLES `buyer_alert` WRITE;
/*!40000 ALTER TABLE `buyer_alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `buyer_alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `buyers`
--

LOCK TABLES `buyers` WRITE;
/*!40000 ALTER TABLE `buyers` DISABLE KEYS */;
INSERT INTO `buyers` VALUES ('admin1'),('asuza'),('NotCameron'),('rep1'),('Slash'),('thief'),('username'),('yui');
/*!40000 ALTER TABLE `buyers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer_rep`
--

LOCK TABLES `customer_rep` WRITE;
/*!40000 ALTER TABLE `customer_rep` DISABLE KEYS */;
INSERT INTO `customer_rep` VALUES ('rep1'),('secretHackerman');
/*!40000 ALTER TABLE `customer_rep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer_support`
--

LOCK TABLES `customer_support` WRITE;
/*!40000 ALTER TABLE `customer_support` DISABLE KEYS */;
INSERT INTO `customer_support` VALUES (1,'secretHackerman','Thief is selling a stolen acoustic guitar','Thank you for the report'),(2,'rep1','How do i default on a bid',''),(3,'rep1','How do I turn autobid off',''),(4,'rep1','My auction for my JF30 disappeared','I restored the auction. Someone accidentally removed it');
/*!40000 ALTER TABLE `customer_support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `electric_guitar`
--

LOCK TABLES `electric_guitar` WRITE;
/*!40000 ALTER TABLE `electric_guitar` DISABLE KEYS */;
INSERT INTO `electric_guitar` VALUES (1,'SSS'),(2,'HH'),(3,'HH'),(4,'HH'),(5,'HH'),(10,'HH'),(11,'HS'),(12,'HS');
/*!40000 ALTER TABLE `electric_guitar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Fender Squier 70s Classic Vibe','Fender',6),(2,'Kenny Hickey Signature','Schecter',6),(3,'1959 Les Paul','Gibson',6),(4,'Marty Friedman Signature','Jackson',6),(5,'RGA742FM','Ibanez',7),(6,'APX600','Yamaha',6),(7,'JF30','Guild',6),(8,'AWN100','Giannini',6),(9,'D50','Guild',6),(10,'Omen-4 Bass','Schecter',4),(11,'Johnny Christ 5 Bass','Schecter',5),(12,'Frank Bello J-4','ESP',4),(13,'newModel','newManu',7),(14,'newModelModel','newmANU',1234),(15,'newnewnew','manumanu',5);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `makes_bid`
--

LOCK TABLES `makes_bid` WRITE;
/*!40000 ALTER TABLE `makes_bid` DISABLE KEYS */;
INSERT INTO `makes_bid` VALUES ('admin1',1,'2021-04-24 19:01:42',43251,0,0,0),('admin1',3,'2021-04-24 19:01:51',1111,0,0,0),('admin1',4,'2021-04-24 19:02:03',1111,0,0,0),('admin1',6,'2021-04-24 18:45:14',15,0,0,0),('admin1',12,'2021-04-24 23:47:29',1234,0,0,0),('NotCameron',3,'2021-04-20 10:00:00',900,1,1000,100),('NotCameron',4,'2021-03-20 05:00:00',1100,1,1150,50),('rep1',3,'2021-04-24 19:02:28',1234,0,0,0),('rep1',4,'2021-04-24 19:02:35',12344300,0,0,0),('rep1',10,'2021-04-24 23:30:30',150,0,0,0),('rep1',17,'2021-04-24 23:52:14',550,0,0,0),('rep1',19,'2021-04-24 23:56:21',12345,0,0,0),('Slash',2,'2021-02-20 00:00:00',55000,0,0,0),('username',10,'2021-04-24 23:34:35',200,0,0,0),('username',17,'2021-04-24 23:51:42',500,0,0,0),('username',18,'2021-04-24 23:54:53',400,0,0,0);
/*!40000 ALTER TABLE `makes_bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` VALUES ('admin1'),('jerryCantrell'),('joeperry'),('NotCameron'),('rep1'),('thief'),('username');
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin1','adminpw','allpowerfuladmin@gmail.com',0),('asuza','1969mustang','asuzakon@gmail.com',0),('CameronsAdminPower','ImMorePowerfulThanAdmin1','cch1234@gmail.com',0),('fakeperson','abc123','badpass@mail.com',0),('iNeedHelp','helphelphelp','helpme@gmail.com',0),('jerryCantrell','nutshellInABox','jc@gmail.com',0),('joeperry','livinOnTheEdge','jp@gmail.com',0),('me','myself','i@gmail.com',0),('NotCameron','AlsoNotCameron','cch@gmail.com',0),('rep1','reppw','rep1@gmail.com',0),('secretHackerman','secretHackerman','noteliot@gmail.com',0),('Slash','notGNR','sh@gmail.com',0),('test','test','test@test',0),('thief','thiefPW','thief@gmail.com',0),('user','pass','up@fmail.com',0),('username','password','user@email.com',0),('yui','httc','yuihttc@gmail.com',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-25 16:25:23
