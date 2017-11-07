-- MySQL dump 10.13  Distrib 5.5.13, for Win64 (x86)
--
-- Host: localhost    Database: linlin
-- ------------------------------------------------------
-- Server version	5.5.13

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
-- Table structure for table `ll_activity`
--

DROP TABLE IF EXISTS `ll_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area` tinyint(4) NOT NULL,
  `atten_number` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pics` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` tinyint(4) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK822846EED19929D0` (`shop_id`),
  CONSTRAINT `FK822846EED19929D0` FOREIGN KEY (`shop_id`) REFERENCES `ll_shop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_activity`
--

LOCK TABLES `ll_activity` WRITE;
/*!40000 ALTER TABLE `ll_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_activity_item`
--

DROP TABLE IF EXISTS `ll_activity_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_activity_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sellcount` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA5A111C4EECBAC30` (`activity_id`),
  KEY `FKA5A111C43966DBC4` (`product_id`),
  CONSTRAINT `FKA5A111C43966DBC4` FOREIGN KEY (`product_id`) REFERENCES `ll_product` (`id`),
  CONSTRAINT `FKA5A111C4EECBAC30` FOREIGN KEY (`activity_id`) REFERENCES `ll_activity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_activity_item`
--

LOCK TABLES `ll_activity_item` WRITE;
/*!40000 ALTER TABLE `ll_activity_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_activity_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_admin`
--

DROP TABLE IF EXISTS `ll_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creatTime` datetime DEFAULT NULL,
  `is_advertisement` tinyint(4) NOT NULL,
  `lastLoginTime` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thisLoginTime` datetime DEFAULT NULL,
  `type` tinyint(4) NOT NULL,
  `updateTime` datetime DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_admin`
--

LOCK TABLES `ll_admin` WRITE;
/*!40000 ALTER TABLE `ll_admin` DISABLE KEYS */;
INSERT INTO `ll_admin` VALUES (1,'2015-02-28 00:00:00',1,'2015-02-28 00:00:00',NULL,'2015-02-28 00:00:00',1,NULL,NULL);
/*!40000 ALTER TABLE `ll_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_blacklist`
--

DROP TABLE IF EXISTS `ll_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_blacklist`
--

LOCK TABLES `ll_blacklist` WRITE;
/*!40000 ALTER TABLE `ll_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_dispatche_record`
--

DROP TABLE IF EXISTS `ll_dispatche_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_dispatche_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deliveriedtime` datetime DEFAULT NULL,
  `dispatcher_evaluation` int(11) NOT NULL,
  `estimatetime` datetime DEFAULT NULL,
  `deliver_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE4154CC4425FFD56` (`deliver_id`),
  KEY `FKE4154CC4BF79DDE4` (`order_id`),
  CONSTRAINT `FKE4154CC4425FFD56` FOREIGN KEY (`deliver_id`) REFERENCES `ll_shop_employee` (`id`),
  CONSTRAINT `FKE4154CC4BF79DDE4` FOREIGN KEY (`order_id`) REFERENCES `ll_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_dispatche_record`
--

LOCK TABLES `ll_dispatche_record` WRITE;
/*!40000 ALTER TABLE `ll_dispatche_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_dispatche_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_employee_grade`
--

DROP TABLE IF EXISTS `ll_employee_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_employee_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ratio` int(11) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE4F77FA5D19929D0` (`shop_id`),
  CONSTRAINT `FKE4F77FA5D19929D0` FOREIGN KEY (`shop_id`) REFERENCES `ll_shop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_employee_grade`
--

LOCK TABLES `ll_employee_grade` WRITE;
/*!40000 ALTER TABLE `ll_employee_grade` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_employee_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_employee_trend`
--

DROP TABLE IF EXISTS `ll_employee_trend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_employee_trend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creattime` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordernumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` tinyint(4) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE5AEC16BD19929D0` (`shop_id`),
  KEY `FKE5AEC16B4D9FFDB0` (`user_id`),
  CONSTRAINT `FKE5AEC16B4D9FFDB0` FOREIGN KEY (`user_id`) REFERENCES `ll_user` (`id`),
  CONSTRAINT `FKE5AEC16BD19929D0` FOREIGN KEY (`shop_id`) REFERENCES `ll_shop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_employee_trend`
--

LOCK TABLES `ll_employee_trend` WRITE;
/*!40000 ALTER TABLE `ll_employee_trend` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_employee_trend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_employee_type`
--

DROP TABLE IF EXISTS `ll_employee_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_employee_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_employee_type`
--

LOCK TABLES `ll_employee_type` WRITE;
/*!40000 ALTER TABLE `ll_employee_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_employee_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_employee_type_power`
--

DROP TABLE IF EXISTS `ll_employee_type_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_employee_type_power` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2B4298B2258F7EE4` (`employee_type_id`),
  CONSTRAINT `FK2B4298B2258F7EE4` FOREIGN KEY (`employee_type_id`) REFERENCES `ll_employee_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_employee_type_power`
--

LOCK TABLES `ll_employee_type_power` WRITE;
/*!40000 ALTER TABLE `ll_employee_type_power` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_employee_type_power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_industry`
--

DROP TABLE IF EXISTS `ll_industry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_industry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_industry`
--

LOCK TABLES `ll_industry` WRITE;
/*!40000 ALTER TABLE `ll_industry` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_industry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_invite_cooperater_request`
--

DROP TABLE IF EXISTS `ll_invite_cooperater_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_invite_cooperater_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creat_time` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `response` tinyint(4) NOT NULL,
  `response_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `receive_request_shop_id` int(11) DEFAULT NULL,
  `send_request_shop_id` int(11) DEFAULT NULL,
  `shop_cooperater_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC7076E21D4B6D969` (`send_request_shop_id`),
  KEY `FKC7076E21399AAD64` (`shop_cooperater_id`),
  KEY `FKC7076E21D1BF66C4` (`receive_request_shop_id`),
  CONSTRAINT `FKC7076E21399AAD64` FOREIGN KEY (`shop_cooperater_id`) REFERENCES `ll_shop_cooperater` (`id`),
  CONSTRAINT `FKC7076E21D1BF66C4` FOREIGN KEY (`receive_request_shop_id`) REFERENCES `ll_shop` (`id`),
  CONSTRAINT `FKC7076E21D4B6D969` FOREIGN KEY (`send_request_shop_id`) REFERENCES `ll_shop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_invite_cooperater_request`
--

LOCK TABLES `ll_invite_cooperater_request` WRITE;
/*!40000 ALTER TABLE `ll_invite_cooperater_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_invite_cooperater_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_notice`
--

DROP TABLE IF EXISTS `ll_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creattime` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag` tinyint(4) NOT NULL,
  `is_read` tinyint(4) NOT NULL,
  `type` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_medicine_check_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC3555677BF79DDE4` (`order_id`),
  KEY `FKC355567772150B30` (`product_medicine_check_id`),
  CONSTRAINT `FKC355567772150B30` FOREIGN KEY (`product_medicine_check_id`) REFERENCES `ll_product_medicine_check` (`id`),
  CONSTRAINT `FKC3555677BF79DDE4` FOREIGN KEY (`order_id`) REFERENCES `ll_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_notice`
--

LOCK TABLES `ll_notice` WRITE;
/*!40000 ALTER TABLE `ll_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_notice_setting`
--

DROP TABLE IF EXISTS `ll_notice_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_notice_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `f_user_id` int(11) DEFAULT NULL,
  `is_ban` tinyint(4) NOT NULL,
  `is_top` tinyint(4) NOT NULL,
  `tips` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_notice_setting`
--

LOCK TABLES `ll_notice_setting` WRITE;
/*!40000 ALTER TABLE `ll_notice_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_notice_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_order`
--

DROP TABLE IF EXISTS `ll_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_attitude_evaluation` int(11) NOT NULL,
  `buyer_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `buyer_pics_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creattime` datetime DEFAULT NULL,
  `delivetime` datetime DEFAULT NULL,
  `description_similarity_evaluation` int(11) NOT NULL,
  `finishtime` datetime DEFAULT NULL,
  `ordernumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pay_flag` tinyint(4) NOT NULL,
  `pay_ratio` int(11) NOT NULL,
  `pay_type` tinyint(4) NOT NULL,
  `paytime` datetime DEFAULT NULL,
  `receipttime` datetime DEFAULT NULL,
  `send_speed_evaluation` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `totalprice` double DEFAULT NULL,
  `employee_user_id` int(11) DEFAULT NULL,
  `receipt_address_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCC8DD7CFD19929D0` (`shop_id`),
  KEY `FKCC8DD7CF4D9FFDB0` (`user_id`),
  KEY `FKCC8DD7CFA10280E4` (`receipt_address_id`),
  KEY `FKCC8DD7CF218FFD1F` (`employee_user_id`),
  CONSTRAINT `FKCC8DD7CF218FFD1F` FOREIGN KEY (`employee_user_id`) REFERENCES `ll_user` (`id`),
  CONSTRAINT `FKCC8DD7CF4D9FFDB0` FOREIGN KEY (`user_id`) REFERENCES `ll_user` (`id`),
  CONSTRAINT `FKCC8DD7CFA10280E4` FOREIGN KEY (`receipt_address_id`) REFERENCES `ll_receipt_address` (`id`),
  CONSTRAINT `FKCC8DD7CFD19929D0` FOREIGN KEY (`shop_id`) REFERENCES `ll_shop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_order`
--

LOCK TABLES `ll_order` WRITE;
/*!40000 ALTER TABLE `ll_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_order_item`
--

DROP TABLE IF EXISTS `ll_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buyer_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `buyer_pics_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_anonymous` tinyint(4) NOT NULL,
  `number` int(11) NOT NULL,
  `unitprice` double DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4C27E583BF79DDE4` (`order_id`),
  KEY `FK4C27E5833966DBC4` (`product_id`),
  CONSTRAINT `FK4C27E5833966DBC4` FOREIGN KEY (`product_id`) REFERENCES `ll_product` (`id`),
  CONSTRAINT `FK4C27E583BF79DDE4` FOREIGN KEY (`order_id`) REFERENCES `ll_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_order_item`
--

LOCK TABLES `ll_order_item` WRITE;
/*!40000 ALTER TABLE `ll_order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_product`
--

DROP TABLE IF EXISTS `ll_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collect_num` int(11) NOT NULL,
  `creattime` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `downtime` datetime DEFAULT NULL,
  `exchange_score` int(11) DEFAULT NULL,
  `f_id` int(11) DEFAULT NULL,
  `f_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_attend_activity` tinyint(4) NOT NULL,
  `is_discount` tinyint(4) NOT NULL,
  `is_invoice` tinyint(4) NOT NULL,
  `is_redommend` tinyint(4) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pay_mode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `source_type` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `tradenumber` int(11) NOT NULL,
  `uptime` datetime DEFAULT NULL,
  `product_grade_id` int(11) DEFAULT NULL,
  `shop_custom_category_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK15F80130D19929D0` (`shop_id`),
  KEY `FK15F80130F021AD24` (`product_grade_id`),
  KEY `FK15F80130717B2AB0` (`shop_custom_category_id`),
  CONSTRAINT `FK15F80130717B2AB0` FOREIGN KEY (`shop_custom_category_id`) REFERENCES `ll_shop_custom_category` (`id`),
  CONSTRAINT `FK15F80130D19929D0` FOREIGN KEY (`shop_id`) REFERENCES `ll_shop` (`id`),
  CONSTRAINT `FK15F80130F021AD24` FOREIGN KEY (`product_grade_id`) REFERENCES `ll_product_grade` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_product`
--

LOCK TABLES `ll_product` WRITE;
/*!40000 ALTER TABLE `ll_product` DISABLE KEYS */;
INSERT INTO `ll_product` VALUES (1,0,'2015-03-12 11:41:21','电视广告',NULL,NULL,0,'','llmsProductImages/preview1.png,llmsProductImages/preview1.png,',0,0,0,0,'dgfdfg打手犯规','124',15,1,1,12,0,NULL,NULL,NULL,1),(2,0,'2015-03-12 11:35:42','电视广告1',NULL,NULL,0,'0','llmsProductImages/preview1.png,llmsProductImages/preview1.png,',0,0,0,0,'dgfdfg打手犯规1','124',15,1,2,123,0,NULL,NULL,NULL,1),(3,0,'2015-03-12 11:35:42','电视广告2',NULL,NULL,0,'0','llmsProductImages/preview1.png,llmsProductImages/preview1.png,',0,0,0,0,'dgfdfg打手犯规2','124',15,1,2,11,0,NULL,NULL,NULL,1),(4,0,'2015-03-12 11:35:42','电视广告3',NULL,NULL,0,'0','llmsProductImages/preview1.png,llmsProductImages/preview1.png,',0,0,0,0,'dgfdfg打手犯规3','124',15,1,2,1,0,NULL,NULL,NULL,1),(5,0,'2015-03-12 11:35:42','电视广告3',NULL,NULL,0,'0','llmsProductImages/preview1.png,llmsProductImages/preview1.png,',0,0,0,0,'dgfdfg打手犯规3','124',15,1,2,1,0,NULL,NULL,NULL,1),(6,0,'2015-03-12 11:35:42','电视广告3',NULL,NULL,0,'0','llmsProductImages/preview1.png,llmsProductImages/preview1.png,',0,0,0,0,'dgfdfg打手犯规3','124',15,1,2,123,0,NULL,NULL,NULL,1),(7,0,'2015-03-12 11:35:42','电视广告3',NULL,NULL,0,'0','llmsProductImages/preview1.png,llmsProductImages/preview1.png,',0,0,0,0,'dgfdfg打手犯规3','124',15,1,2,4,0,NULL,NULL,NULL,1),(8,0,'2015-03-12 11:35:42','电视广告3',NULL,NULL,0,'0','llmsProductImages/preview1.png,llmsProductImages/preview1.png,',0,0,0,0,'dgfdfg打手犯规3','124',15,1,2,54,0,NULL,NULL,NULL,1),(9,0,'2015-03-12 11:35:42','电视广告3',NULL,NULL,0,'0','llmsProductImages/preview1.png,llmsProductImages/preview1.png,',0,0,0,0,'dgfdfg打手犯规3','124',15,1,2,44,0,NULL,NULL,NULL,1),(10,0,'2015-03-12 11:35:42','电视广告3',NULL,NULL,0,'0','llmsProductImages/preview1.png,llmsProductImages/preview1.png,',0,0,0,0,'dgfdfg打手犯规3','124',15,1,2,23,0,NULL,NULL,NULL,1),(11,0,'2015-03-12 11:35:42','电视广告3',NULL,NULL,0,'0','llmsProductImages/preview1.png,llmsProductImages/preview1.png,',0,0,0,0,'dgfdfg打手犯规3','124',15,1,2,34,0,NULL,NULL,NULL,1),(12,0,'2015-03-12 11:35:42','电视广告3',NULL,NULL,0,'0','llmsProductImages/preview1.png,llmsProductImages/preview1.png,',0,0,0,0,'dgfdfg打手犯规3','124',15,1,2,543,0,NULL,NULL,NULL,1),(13,0,'2015-03-12 11:35:42','电视广告3',NULL,NULL,0,'0','llmsProductImages/preview1.png,llmsProductImages/preview1.png,',0,0,0,0,'dgfdfg打手犯规3','124',15,1,2,3453,0,NULL,NULL,NULL,1),(14,0,'2015-03-12 11:35:42','电视广告3',NULL,NULL,0,'0','llmsProductImages/preview1.png,llmsProductImages/preview1.png,',0,0,0,0,'dgfdfg打手犯规3','124',15,1,2,3333,0,NULL,NULL,NULL,1),(15,0,'2015-03-12 11:35:42','电视广告3',NULL,NULL,0,'0','llmsProductImages/preview1.png,llmsProductImages/preview1.png,',0,0,0,0,'dgfdfg打手犯规3','124',15,1,2,56,0,NULL,NULL,NULL,1),(16,0,'2015-03-12 11:35:42','电视广告3',NULL,NULL,1,'ll_product_healthcare','llmsProductImages/preview1.png,llmsProductImages/preview1.png,',0,0,0,0,'dgfdfg打手犯规3','124',15,1,2,445,0,NULL,NULL,NULL,1),(17,0,'2015-03-12 11:35:42','电视广告3',NULL,NULL,2,'ll_product_healthcare','llmsProductImages/preview1.png,llmsProductImages/preview1.png,',0,0,0,0,'dgfdfg打手犯规3','124',15,0,2,445,0,NULL,NULL,NULL,1),(18,0,'2015-03-12 11:35:42','电视广告3',NULL,NULL,3,'ll_product_healthcare','llmsProductImages/preview1.png,llmsProductImages/preview1.png,',0,0,0,0,'dgfdfg打手犯规3','124',15,0,2,445,0,NULL,NULL,NULL,1),(19,0,'2015-03-12 11:35:42','电视广告3',NULL,NULL,4,'ll_product_healthcare','llmsProductImages/preview1.png,llmsProductImages/preview1.png,',0,0,0,0,'dgfdfg打手犯规3','124',15,1,2,445,0,NULL,NULL,NULL,1),(20,0,'2015-03-12 11:35:42','电视广告3',NULL,NULL,5,'ll_product_healthcare','llmsProductImages/preview1.png,llmsProductImages/preview1.png,',0,0,0,0,'dgfdfg打手犯规3','124',15,1,2,445,0,NULL,NULL,NULL,1),(21,0,'2015-03-12 11:35:42','电视广告3',NULL,NULL,0,'','llmsProductImages/preview1.png,llmsProductImages/preview1.png,',0,0,0,0,'dgfdfg打手犯规3','124',15,1,1,445,0,NULL,NULL,NULL,1),(22,0,'2015-03-12 11:35:42','电视广告3',NULL,NULL,7,'ll_product_healthcare','llmsProductImages/preview1.png,llmsProductImages/preview1.png,',0,0,0,0,'dgfdfg打手犯规3','124',15,0,0,445,0,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `ll_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_product_category`
--

DROP TABLE IF EXISTS `ll_product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` bigint(20) DEFAULT NULL,
  `flag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_product_category`
--

LOCK TABLES `ll_product_category` WRITE;
/*!40000 ALTER TABLE `ll_product_category` DISABLE KEYS */;
INSERT INTO `ll_product_category` VALUES (1,'医疗药品',17,1),(2,'保健食品',2,2),(3,'医疗服务',0,0),(4,'保健理疗',0,0),(5,'预约门诊',0,0),(6,'健康体检',0,0),(7,'其它商品',0,0),(8,'邻存通',0,0);
/*!40000 ALTER TABLE `ll_product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_product_category_second`
--

DROP TABLE IF EXISTS `ll_product_category_second`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_product_category_second` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` bigint(20) NOT NULL,
  `product_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK755881C6BEC79DF0` (`product_category_id`),
  CONSTRAINT `FK755881C6BEC79DF0` FOREIGN KEY (`product_category_id`) REFERENCES `ll_product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_product_category_second`
--

LOCK TABLES `ll_product_category_second` WRITE;
/*!40000 ALTER TABLE `ll_product_category_second` DISABLE KEYS */;
INSERT INTO `ll_product_category_second` VALUES (1,'内分泌',12,1),(2,'呼吸道疾病1',4,1),(3,'滋补调养',1,1),(4,'消化系统疾病',0,1),(5,'肝病科',0,1),(6,'妇科疾病',0,1),(7,'营养补充品',-3,2),(8,'植物提取物11',4,2),(9,'钙剂1',0,1),(10,'矿物质',1,2),(11,'123123111',0,1);
/*!40000 ALTER TABLE `ll_product_category_second` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_product_category_three`
--

DROP TABLE IF EXISTS `ll_product_category_three`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_product_category_three` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` bigint(20) NOT NULL,
  `product_category_second_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE2D0760C7F055C04` (`product_category_second_id`),
  CONSTRAINT `FKE2D0760C7F055C04` FOREIGN KEY (`product_category_second_id`) REFERENCES `ll_product_category_second` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_product_category_three`
--

LOCK TABLES `ll_product_category_three` WRITE;
/*!40000 ALTER TABLE `ll_product_category_three` DISABLE KEYS */;
INSERT INTO `ll_product_category_three` VALUES (1,'抗病毒药',5,1),(2,'糖尿病药',5,1),(3,'甲状腺疾病',2,1),(4,'甲状腺疾病1',3,2),(5,'甲状腺疾病2',1,2),(6,'甲状腺疾病3',1,3),(7,'甲状腺疾病4',0,3),(8,'甲状腺疾病6',0,4),(9,'甲状腺疾病7',0,4),(10,'甲状腺疾病8',0,4),(11,'甲状腺疾病83',0,5),(12,'甲状腺疾病82',0,5),(13,'甲状腺疾病81',0,5),(14,'甲状腺疾病811',0,6),(15,'甲状腺疾病811',0,6),(16,'甲状腺疾病811',0,6),(17,'甲状腺疾病811',0,6),(18,'甲状腺疾病8112',0,7),(19,'甲状腺疾病8112',0,7),(20,'甲状腺疾病8112',-3,7),(21,'甲状腺疾病8112',0,7),(22,'甲状腺疾病8112111',1,8),(23,'甲状腺疾病88881',16,10),(24,'甲状腺疾病8112111',0,8),(25,'甲状腺11',0,9),(26,'12311111',0,11),(27,'11111111',3,8);
/*!40000 ALTER TABLE `ll_product_category_three` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_product_clinic`
--

DROP TABLE IF EXISTS `ll_product_clinic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_product_clinic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `allnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_category_id` int(11) DEFAULT NULL,
  `shop_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6EF05AD731B1BF64` (`shop_employee_id`),
  KEY `FK6EF05AD7BEC79DF0` (`product_category_id`),
  CONSTRAINT `FK6EF05AD731B1BF64` FOREIGN KEY (`shop_employee_id`) REFERENCES `ll_shop_employee` (`id`),
  CONSTRAINT `FK6EF05AD7BEC79DF0` FOREIGN KEY (`product_category_id`) REFERENCES `ll_product_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_product_clinic`
--

LOCK TABLES `ll_product_clinic` WRITE;
/*!40000 ALTER TABLE `ll_product_clinic` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_product_clinic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_product_clinic_ordertime`
--

DROP TABLE IF EXISTS `ll_product_clinic_ordertime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_product_clinic_ordertime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `allnumber` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `lastnumber` int(11) NOT NULL,
  `time` tinyint(4) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `week` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `product_clinic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK85D277B3272E279A` (`parent_id`),
  KEY `FK85D277B35136330` (`product_clinic_id`),
  CONSTRAINT `FK85D277B3272E279A` FOREIGN KEY (`parent_id`) REFERENCES `ll_product_clinic_ordertime` (`id`),
  CONSTRAINT `FK85D277B35136330` FOREIGN KEY (`product_clinic_id`) REFERENCES `ll_product_clinic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_product_clinic_ordertime`
--

LOCK TABLES `ll_product_clinic_ordertime` WRITE;
/*!40000 ALTER TABLE `ll_product_clinic_ordertime` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_product_clinic_ordertime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_product_collect`
--

DROP TABLE IF EXISTS `ll_product_collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_product_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7462D91B4D9FFDB0` (`user_id`),
  KEY `FK7462D91B3966DBC4` (`product_id`),
  CONSTRAINT `FK7462D91B3966DBC4` FOREIGN KEY (`product_id`) REFERENCES `ll_product` (`id`),
  CONSTRAINT `FK7462D91B4D9FFDB0` FOREIGN KEY (`user_id`) REFERENCES `ll_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_product_collect`
--

LOCK TABLES `ll_product_collect` WRITE;
/*!40000 ALTER TABLE `ll_product_collect` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_product_collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_product_examination`
--

DROP TABLE IF EXISTS `ll_product_examination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_product_examination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adaptperson` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characteristic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disease` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lasttime` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `real_price` double DEFAULT NULL,
  `product_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK15A26B62BEC79DF0` (`product_category_id`),
  CONSTRAINT `FK15A26B62BEC79DF0` FOREIGN KEY (`product_category_id`) REFERENCES `ll_product_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_product_examination`
--

LOCK TABLES `ll_product_examination` WRITE;
/*!40000 ALTER TABLE `ll_product_examination` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_product_examination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_product_general_params`
--

DROP TABLE IF EXISTS `ll_product_general_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_product_general_params` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `specification` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_product_general_params`
--

LOCK TABLES `ll_product_general_params` WRITE;
/*!40000 ALTER TABLE `ll_product_general_params` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_product_general_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_product_grade`
--

DROP TABLE IF EXISTS `ll_product_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_product_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` int(11) NOT NULL,
  `ratio` int(11) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK355B8008D19929D0` (`shop_id`),
  CONSTRAINT `FK355B8008D19929D0` FOREIGN KEY (`shop_id`) REFERENCES `ll_shop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_product_grade`
--

LOCK TABLES `ll_product_grade` WRITE;
/*!40000 ALTER TABLE `ll_product_grade` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_product_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_product_healthcare`
--

DROP TABLE IF EXISTS `ll_product_healthcare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_product_healthcare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addtype` tinyint(4) NOT NULL,
  `creattime` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_category_three_id` int(11) DEFAULT NULL,
  `product_healthcare_params` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK98FDA5DCD12F74F0` (`product_category_three_id`),
  KEY `FK98FDA5DC92D1607A` (`product_healthcare_params`),
  CONSTRAINT `FK98FDA5DC92D1607A` FOREIGN KEY (`product_healthcare_params`) REFERENCES `ll_product_healthcare_params` (`id`),
  CONSTRAINT `FK98FDA5DCD12F74F0` FOREIGN KEY (`product_category_three_id`) REFERENCES `ll_product_category_three` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_product_healthcare`
--

LOCK TABLES `ll_product_healthcare` WRITE;
/*!40000 ALTER TABLE `ll_product_healthcare` DISABLE KEYS */;
INSERT INTO `ll_product_healthcare` VALUES (1,0,'2015-03-18 14:32:15','司法所大富大贵','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','1231',18,1),(2,0,'2015-03-18 14:32:15','司法所大富大贵','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','1231',19,2),(3,0,'2015-03-18 14:32:15','司法所大富大贵','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','1231',20,3),(4,1,'2015-03-18 14:32:15','司法所大富大贵','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','123122',20,4),(5,1,'2015-03-18 14:32:15','司法所大富大贵','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','123122',20,5),(7,1,'2015-03-18 14:32:15','司法所大富大贵','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','123122ssss',20,27),(8,1,'2015-03-18 14:32:15','司法所大富大贵','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','123122',20,8),(9,0,'2015-03-18 14:32:15','司法所大富大贵','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','123122',20,9),(10,1,'2015-03-18 14:32:15','司法所大富大贵','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','123122',20,10),(11,0,'2015-03-18 14:32:15','司法所大富大贵','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','123122',20,11),(12,1,'2015-03-18 14:32:15','司法所大富大贵','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','123122',20,12),(13,1,'2015-03-18 14:32:15','司法所大富大贵','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','123122',20,13),(14,0,'2015-03-18 15:37:13','最新添加保健品描述','llmsHealthcareImages/60d7e5ab-c128-415c-b757-5de3d4e5734f.png,llmsHealthcareImages/c8ea934a-48cf-4494-aa64-fed95d564d65.png,llmsHealthcareImages/f796f597-7f34-45d5-90e2-38ecc92bfd14.png,','最新添加保健品',22,17),(15,0,'2015-03-18 16:36:55','12311','llmsHealthcareImages/d75cf248-14e8-4189-a477-0cf1ddf98724.png,llmsHealthcareImages/f064cb36-9678-4648-8678-0ce7b1f01826.png,','123311',27,23),(16,0,'2015-03-18 17:04:07','222','llmsHealthcareImages/d798e543-97e0-4189-bce2-ce3880a4fe27.png,llmsHealthcareImages/6ba91d1d-0832-47c7-9fab-920b42f1d49a.png,llmsHealthcareImages/180d010e-6597-4449-b053-117b10dcaf60.png,llmsHealthcareImages/ada34d9a-d23d-4884-a5d7-75debe8ca77e.png,,','1211222222',23,25);
/*!40000 ALTER TABLE `ll_product_healthcare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_product_healthcare_params`
--

DROP TABLE IF EXISTS `ll_product_healthcare_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_product_healthcare_params` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `approval_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacturer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pack` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `precautions` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `producer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `specification` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `store` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_product_healthcare_params`
--

LOCK TABLES `ll_product_healthcare_params` WRITE;
/*!40000 ALTER TABLE `ll_product_healthcare_params` DISABLE KEYS */;
INSERT INTO `ll_product_healthcare_params` VALUES (1,'蔷薇','蔷薇','前往企鹅','驱蚊器','为而为','二厅二','蔷薇','额外太热','玩儿玩儿','为而为热额'),(2,'蔷薇','蔷薇','前往企鹅','驱蚊器','为而为','二厅二','蔷薇','额外太热','玩儿玩儿','为而为热额'),(3,'蔷薇','蔷薇','前往企鹅','驱蚊器','为而为','二厅二','蔷薇','额外太热','玩儿玩儿','为而为热额'),(4,'蔷薇','蔷薇','前往企鹅','驱蚊器','为而为','二厅二','蔷薇','额外太热','玩儿玩儿','为而为热额'),(5,'蔷薇','蔷薇','前往企鹅','驱蚊器','为而为','二厅二','蔷薇','额外太热','玩儿玩儿','为而为热额'),(8,'蔷薇','蔷薇','前往企鹅','驱蚊器','为而为','二厅二','蔷薇','额外太热','玩儿玩儿','为而为热额'),(9,'蔷薇','蔷薇','前往企鹅','驱蚊器','为而为','二厅二','蔷薇','额外太热','玩儿玩儿','为而为热额'),(10,'蔷薇','蔷薇','前往企鹅','驱蚊器','为而为','二厅二','蔷薇','额外太热','玩儿玩儿','为而为热额'),(11,'蔷薇','蔷薇','前往企鹅','驱蚊器','为而为','二厅二','蔷薇','额外太热','玩儿玩儿','为而为热额'),(12,'蔷薇','蔷薇','前往企鹅','驱蚊器','为而为','二厅二','蔷薇','额外太热','玩儿玩儿','为而为热额'),(13,'蔷薇','蔷薇','前往企鹅','驱蚊器','为而为','二厅二','蔷薇','额外太热','玩儿玩儿','为而为热额'),(14,'蔷薇','蔷薇','前往企鹅','驱蚊器','为而为','二厅二','蔷薇','额外太热','玩儿玩儿','为而为热额'),(15,'蔷薇','蔷薇','前往企鹅','驱蚊器','为而为','二厅二','蔷薇','额外太热','玩儿玩儿','为而为热额'),(16,'蔷薇','蔷薇','前往企鹅','驱蚊器','为而为','二厅二','蔷薇','额外太热','玩儿玩儿','为而为热额'),(17,'批准文号','最新添加保健品品牌','生产企业','最新添加保健品名称详细','包装','注意事项','生产地','最新添加保健品规格','储藏','保质期'),(18,'123','123','123','123','123','123','123','123','123','123'),(19,'123','1231','123','1231','123','123','123','1231','123','123'),(20,'123','1231','123','1231','123','123','123','1231','123','123'),(21,'1231','12311','1231','12311','1231','1231','1231','12311','1231','1231'),(22,'1231','12311','1231','12311','1231','1231','1231','12311','1231','1231'),(23,'1231','12311','1231','12311','1231','1231','1231','12311','1231','1231'),(24,'2','2','2','2','2','2','2','2','2','2'),(25,'2','2','2','2','2','2','2','2','2','2'),(27,'2','2','2','2','2','2','2','2','2','2'),(28,'2','2','2','2','2','2','2','2','2','2');
/*!40000 ALTER TABLE `ll_product_healthcare_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_product_healthcareservice`
--

DROP TABLE IF EXISTS `ll_product_healthcareservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_product_healthcareservice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_area` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_area_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_category_id` int(11) DEFAULT NULL,
  `product_service_params` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK14DA939BEC79DF0` (`product_category_id`),
  KEY `FK14DA939E55DB1D6` (`product_service_params`),
  CONSTRAINT `FK14DA939BEC79DF0` FOREIGN KEY (`product_category_id`) REFERENCES `ll_product_category` (`id`),
  CONSTRAINT `FK14DA939E55DB1D6` FOREIGN KEY (`product_service_params`) REFERENCES `ll_product_service_params` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_product_healthcareservice`
--

LOCK TABLES `ll_product_healthcareservice` WRITE;
/*!40000 ALTER TABLE `ll_product_healthcareservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_product_healthcareservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_product_lincun`
--

DROP TABLE IF EXISTS `ll_product_lincun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_product_lincun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `real_price` double DEFAULT NULL,
  `product_category_id` int(11) DEFAULT NULL,
  `shop_member_grade_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7E23CFFA2EE704E3` (`shop_member_grade_id`),
  KEY `FK7E23CFFABEC79DF0` (`product_category_id`),
  CONSTRAINT `FK7E23CFFA2EE704E3` FOREIGN KEY (`shop_member_grade_id`) REFERENCES `ll_shop_member_grade` (`id`),
  CONSTRAINT `FK7E23CFFABEC79DF0` FOREIGN KEY (`product_category_id`) REFERENCES `ll_product_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_product_lincun`
--

LOCK TABLES `ll_product_lincun` WRITE;
/*!40000 ALTER TABLE `ll_product_lincun` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_product_lincun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_product_medicalservice`
--

DROP TABLE IF EXISTS `ll_product_medicalservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_product_medicalservice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_area` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_area_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_category_id` int(11) DEFAULT NULL,
  `product_service_params` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1BCE55D3BEC79DF0` (`product_category_id`),
  KEY `FK1BCE55D3E55DB1D6` (`product_service_params`),
  CONSTRAINT `FK1BCE55D3BEC79DF0` FOREIGN KEY (`product_category_id`) REFERENCES `ll_product_category` (`id`),
  CONSTRAINT `FK1BCE55D3E55DB1D6` FOREIGN KEY (`product_service_params`) REFERENCES `ll_product_service_params` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_product_medicalservice`
--

LOCK TABLES `ll_product_medicalservice` WRITE;
/*!40000 ALTER TABLE `ll_product_medicalservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_product_medicalservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_product_medicine`
--

DROP TABLE IF EXISTS `ll_product_medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_product_medicine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addtype` tinyint(4) NOT NULL,
  `bar_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checktime` datetime DEFAULT NULL,
  `creattime` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_category_three_id` int(11) DEFAULT NULL,
  `product_medicine_params` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7F3DC696C0B420` (`product_medicine_params`),
  KEY `FK7F3DC69D12F74F0` (`product_category_three_id`),
  CONSTRAINT `FK7F3DC696C0B420` FOREIGN KEY (`product_medicine_params`) REFERENCES `ll_product_medicine_params` (`id`),
  CONSTRAINT `FK7F3DC69D12F74F0` FOREIGN KEY (`product_category_three_id`) REFERENCES `ll_product_category_three` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_product_medicine`
--

LOCK TABLES `ll_product_medicine` WRITE;
/*!40000 ALTER TABLE `ll_product_medicine` DISABLE KEYS */;
INSERT INTO `ll_product_medicine` VALUES (9,0,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsMedicineImages/866a8b77-b051-4565-ad33-b45691875c98.pngllmsMedicineImages/65fcab2e-4016-4979-b804-fe372cf40b2f.pngllmsMedicineImages/284720df-3b0c-4116-99d0-aaa35e2ca643.pngllmsMedicineImages/616c44ff-d57a-403b-aead-354340e97c27.png','dgfdfg打手犯规',1,5),(10,1,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',1,6),(11,1,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',2,7),(12,1,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',1,8),(13,0,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',1,9),(14,0,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',1,9),(15,0,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',3,11),(16,1,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',1,10),(17,0,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',1,17),(18,1,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',3,18),(19,1,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',1,19),(20,1,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',3,20),(21,1,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',1,21),(22,1,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',1,22),(23,1,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',3,23),(24,1,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',3,24),(25,1,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',3,25),(26,0,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',3,26),(27,1,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',3,27),(28,1,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',3,28),(29,1,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',2,29),(30,1,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',2,31),(31,0,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',2,30),(32,1,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',2,32),(33,0,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,llmsMedicineImages/e762cb7b-a0ed-4a16-b786-210234da95fd.png,','dgfdfg打手犯规',2,33),(34,1,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',2,34),(35,0,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',1,35),(36,0,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',1,36),(37,0,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',1,37),(38,0,'13214545','2015-03-12 13:35:50','2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png,','dgfdfg打手犯规',1,38),(39,0,'123123','2015-03-13 16:51:54','2015-03-13 16:51:54','sfdsfsd','llmsMedicineImages/e7b06894-ae42-4449-aa39-5418716e9d75.png,llmsMedicineImages/901526db-a664-4368-b332-e327e024e2c9.png,','123123',1,13),(40,0,'12312312321','2015-03-13 16:57:35','2015-03-13 16:57:35','saw的sad阿萨德','llmsMedicineImages/8e3c2858-d361-4e06-acc4-0fac794c0995.png,llmsMedicineImages/e95db1c7-d8d9-453a-b0d9-70520f272ee4.png,llmsMedicineImages/8fbef4c5-7d00-4814-9eec-3f601983d771.png,','121222阿萨德',4,14),(41,0,'123123','2015-03-13 21:48:39','2015-03-13 21:48:39','12313','llmsMedicineImages/f3021b83-5b6d-4b48-8b09-8d51288da71e.png,llmsMedicineImages/e2046bf0-18b9-4635-b532-ec4a64269843.png,llmsMedicineImages/737ed9b7-6b1d-420e-b7ec-8ae71b1a0e7f.png,llmsMedicineImages/4183354a-1be9-4906-9d2f-7da9965ae711.png,','1231121 112',2,15),(42,0,'dfgdfg12','2015-03-13 21:52:46','2015-03-13 21:52:46','sdadsf112','llmsMedicineImages/d9eee294-5f5a-458e-955e-eab0449bfcfd.png,llmsMedicineImages/a4af58bf-692e-4291-b378-b224c3225115.png,','dsfgf12',11,16),(43,0,'123123','2015-03-18 17:03:33','2015-03-18 17:03:33','1231','llmsMedicineImages/956d4237-ca7f-4313-96d8-7024c21d87de.png,llmsMedicineImages/34f3e647-ff81-459d-83ba-5957e2d3647c.png,','1112313',3,39),(44,0,'11111111','2015-03-19 14:13:54','2015-03-19 14:13:54','1111111','llmsMedicineImages/84462236-e495-423e-a5cd-133b21cbde3f.jpg,llmsMedicineImages/a16ec1ad-417e-483b-8281-7ccdba480328.jpg,llmsMedicineImages/5e8c6eff-aa84-47ae-8d92-2269f13f8dd5.jpg,llmsMedicineImages/32ab5b2c-f47b-4bee-836f-44ee30f5a293.jpg,','testcompressImage',4,40),(46,0,'123123123123','2015-03-19 14:30:42','2015-03-19 14:30:42','123123','llmsMedicineImages/ec1100e1-55f9-4148-bc84-4c26b9dada4e.jpg,llmsMedicineImages/1a75fe9d-9a00-4ede-b146-90afa0a78ccf.jpg,','12313123 12312',1,42),(47,0,'121213123','2015-03-19 14:53:58','2015-03-19 14:53:58','123123','llmsMedicineImages/98078e25-ebb2-49b8-aa36-dd8046fa322d.jpg,llmsMedicineImages/e206e408-8fe8-4c8f-a01d-c794c55eab3e.jpg,','12312312122222222',2,43),(48,0,'111111','2015-03-19 15:00:25','2015-03-19 15:00:25','123','llmsMedicineImages/9fc032f5-a464-4fe9-b6fc-f688afa136cb.jpg,llmsMedicineImages/6ad28e95-51c5-421b-b55a-8bd653169890.jpg,','12312312312',5,44),(49,0,'2323232','2015-03-19 15:05:24','2015-03-19 15:05:24','23','llmsMedicineImages/87395a69-3cbe-4ad3-9ea1-19787df793eb.jpg,llmsMedicineImages/a6d57155-224b-40b7-baf9-430ac743afae.jpg,','1232232',1,45),(50,0,'234234','2015-03-19 15:11:11','2015-03-19 15:11:11','234','llmsMedicineImages/1f81a5fc-79e8-4f62-bed4-b7433f4cf9ee.jpg,llmsMedicineImages/64493ec0-902f-4d56-8202-72cceb4eefa3.jpg,','23423',1,46),(51,0,'123123','2015-03-19 15:12:57','2015-03-19 15:12:57','123','llmsMedicineImages/6e895fe4-cfab-47c5-afea-c96c261ed0b0.jpg,llmsMedicineImages/ddd40b1b-6549-4b06-b509-b25f2be0819e.jpg,','1231231231212',6,47),(52,0,'213123','2015-03-19 15:13:50','2015-03-19 15:13:50','123','llmsMedicineImages/8fcdaa60-1081-4273-b3a8-e9eaf7d8ab4a.jpg,llmsMedicineImages/d92a554c-25fb-4aa9-8003-9adef98a6799.jpg,','12312312312121',2,48),(53,0,'23423423','2015-03-19 15:24:30','2015-03-19 15:24:30','234aqw','llmsMedicineImages/62ad940e-77a1-4fbb-9cf4-06d1393fc3c7.jpg,llmsMedicineImages/d6206c9c-b89c-452a-a69f-3dcf3cc25f1a.jpg,','werwewe',2,49),(54,0,'qwqqq','2015-03-19 15:29:42','2015-03-19 15:29:42','qwe','llmsMedicineImages/5e58e1b8-e8fe-478d-8f5b-42988346e784.jpg,llmsMedicineImages/03f6997d-5225-436a-8fda-64ca1c535790.jpg,','qweqwe',2,50),(55,0,'sfddsf','2015-03-19 15:43:52','2015-03-19 15:43:52','sadsf','llmsMedicineImages/594bc89b-560e-46be-aee2-8c797501e347.jpg,llmsMedicineImages/07acd87b-4be6-436b-ad53-b1010998d927.jpg,','ssdfd',3,51);
/*!40000 ALTER TABLE `ll_product_medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_product_medicine_check`
--

DROP TABLE IF EXISTS `ll_product_medicine_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_product_medicine_check` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bar_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `check_status` tinyint(4) NOT NULL,
  `checktime` datetime DEFAULT NULL,
  `creattime` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_category_three_id` int(11) DEFAULT NULL,
  `product_medicine_params` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3ACD71B26C0B420` (`product_medicine_params`),
  KEY `FK3ACD71B2D12F74F0` (`product_category_three_id`),
  KEY `FK3ACD71B23966DBC4` (`product_id`),
  CONSTRAINT `FK3ACD71B23966DBC4` FOREIGN KEY (`product_id`) REFERENCES `ll_product` (`id`),
  CONSTRAINT `FK3ACD71B26C0B420` FOREIGN KEY (`product_medicine_params`) REFERENCES `ll_product_medicine_params` (`id`),
  CONSTRAINT `FK3ACD71B2D12F74F0` FOREIGN KEY (`product_category_three_id`) REFERENCES `ll_product_category_three` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_product_medicine_check`
--

LOCK TABLES `ll_product_medicine_check` WRITE;
/*!40000 ALTER TABLE `ll_product_medicine_check` DISABLE KEYS */;
INSERT INTO `ll_product_medicine_check` VALUES (5,'132145454',0,NULL,'2015-03-12 11:41:21','dgfdfg打手犯规11','llmsProductImages/preview1.png,llmsProductImages/preview1.png','dgfdfg打手犯规4',6,5,5);
/*!40000 ALTER TABLE `ll_product_medicine_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_product_medicine_params`
--

DROP TABLE IF EXISTS `ll_product_medicine_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_product_medicine_params` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adverse` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approval_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avoid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `characters` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `composition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dosage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `drug_interactions` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `indications` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacturer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pack` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pharmacological_effects` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `precautions` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `specification` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `store` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_product_medicine_params`
--

LOCK TABLES `ll_product_medicine_params` WRITE;
/*!40000 ALTER TABLE `ll_product_medicine_params` DISABLE KEYS */;
INSERT INTO `ll_product_medicine_params` VALUES (1,'不良反应不良反应不良反应不良反应不良反应','批准文号批准文号批准文号','禁忌禁忌禁忌禁忌','性状性状性状性状','成分成分成分成分成分成分成分','用法用量用法用量用法用量用法用量用法用量','药物相互作用药物相互作用药物相互作用药物相互作用','功能主治功能主治功能主治功能主治','生产企业生产企业生产企业','药瓶名称详细','包装包装包装','药理作用药理作用药理作用','注意事项注意事项注意事项','规格规格规格规格规格','储藏储藏储藏','有效期有效期有效期'),(3,'不良反应不良反应不良反应不良反应不良反应','批准文号批准文号批准文号','禁忌禁忌禁忌禁忌','性状性状性状性状','成分成分成分成分成分成分成分','用法用量用法用量用法用量用法用量用法用量','药物相互作用药物相互作用药物相互作用药物相互作用','功能主治功能主治功能主治功能主治','生产企业生产企业生产企业','药瓶名称详细','包装包装包装','药理作用药理作用药理作用','注意事项注意事项注意事项','规格规格规格规格规格','储藏储藏储藏','有效期有效期有效期'),(4,'不良反应不良反应不良反应不良反应不良反应','批准文号批准文号批准文号','禁忌禁忌禁忌禁忌','性状性状性状性状','成分成分成分成分成分成分成分','用法用量用法用量用法用量用法用量用法用量','药物相互作用药物相互作用药物相互作用药物相互作用','功能主治功能主治功能主治功能主治','生产企业生产企业生产企业','药瓶名称详细','包装包装包装','药理作用药理作用药理作用','注意事项注意事项注意事项','规格规格规格规格规格','储藏储藏储藏','有效期有效期有效期'),(5,'不良反应不良反应不良反应不良反应不良反应','批准文号批准文号批准文号','禁忌禁忌禁忌禁忌','性状性状性状性状','成分成分成分成分成分成分成分','用法用量用法用量用法用量用法用量用法用量','药物相互作用药物相互作用药物相互作用药物相互作用','功能主治功能主治功能主治功能主治','生产企业生产企业生产企业','药瓶名称详细','包装包装包装','药理作用药理作用药理作用','注意事项注意事项注意事项','规格规格规格规格规格','储藏储藏储藏','有效期有效期有效期'),(6,'不良反应不良反应不良反应不良反应不良反应','批准文号批准文号批准文号','禁忌禁忌禁忌禁忌','性状性状性状性状','成分成分成分成分成分成分成分','用法用量用法用量用法用量用法用量用法用量','药物相互作用药物相互作用药物相互作用药物相互作用','功能主治功能主治功能主治功能主治','生产企业生产企业生产企业','药瓶名称详细','包装包装包装','药理作用药理作用药理作用','注意事项注意事项注意事项','规格规格规格规格规格','储藏储藏储藏','有效期有效期有效期'),(7,'不良反应不良反应不良反应不良反应不良反应','批准文号批准文号批准文号','禁忌禁忌禁忌禁忌','性状性状性状性状','成分成分成分成分成分成分成分','用法用量用法用量用法用量用法用量用法用量','药物相互作用药物相互作用药物相互作用药物相互作用','功能主治功能主治功能主治功能主治','生产企业生产企业生产企业','药瓶名称详细','包装包装包装','药理作用药理作用药理作用','注意事项注意事项注意事项','规格规格规格规格规格','储藏储藏储藏','有效期有效期有效期'),(8,'不良反应不良反应不良反应不良反应不良反应','批准文号批准文号批准文号','禁忌禁忌禁忌禁忌','性状性状性状性状','成分成分成分成分成分成分成分','用法用量用法用量用法用量用法用量用法用量','药物相互作用药物相互作用药物相互作用药物相互作用','功能主治功能主治功能主治功能主治','生产企业生产企业生产企业','药瓶名称详细','包装包装包装','药理作用药理作用药理作用','注意事项注意事项注意事项','规格规格规格规格规格','储藏储藏储藏','有效期有效期有效期'),(9,'不良反应不良反应不良反应不良反应不良反应','批准文号批准文号批准文号','禁忌禁忌禁忌禁忌','性状性状性状性状','成分成分成分成分成分成分成分','用法用量用法用量用法用量用法用量用法用量','药物相互作用药物相互作用药物相互作用药物相互作用','功能主治功能主治功能主治功能主治','生产企业生产企业生产企业','药瓶名称详细','包装包装包装','药理作用药理作用药理作用','注意事项注意事项注意事项','规格规格规格规格规格','储藏储藏储藏','有效期有效期有效期'),(10,'不良反应不良反应不良反应不良反应不良反应','批准文号批准文号批准文号','禁忌禁忌禁忌禁忌','性状性状性状性状','成分成分成分成分成分成分成分','用法用量用法用量用法用量用法用量用法用量','药物相互作用药物相互作用药物相互作用药物相互作用','功能主治功能主治功能主治功能主治','生产企业生产企业生产企业','药瓶名称详细','包装包装包装','药理作用药理作用药理作用','注意事项注意事项注意事项','规格规格规格规格规格','储藏储藏储藏','有效期有效期有效期'),(11,'不良反应不良反应不良反应不良反应不良反应','批准文号批准文号批准文号','禁忌禁忌禁忌禁忌','性状性状性状性状','成分成分成分成分成分成分成分','用法用量用法用量用法用量用法用量用法用量','药物相互作用药物相互作用药物相互作用药物相互作用','功能主治功能主治功能主治功能主治','生产企业生产企业生产企业','药瓶名称详细','包装包装包装','药理作用药理作用药理作用','注意事项注意事项注意事项','规格规格规格规格规格','储藏储藏储藏','有效期有效期有效期'),(13,'','','','','sad\r\nasdasdas\r\n阿斯达斯大苏打撒旦','','','阿斯达斯大\r\n             阿斯达斯达斯\r\n                                阿斯达斯的','','qwe\r\ndsf\r\n饿死的态度','','','','','',''),(14,'','','','','撒打算','','','','','阿斯达斯','','','','','',''),(15,'','','','','swqe','','','qwe','','123','','','','','',''),(16,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),(17,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),(18,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),(19,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),(20,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),(21,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),(22,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),(23,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),(24,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),(25,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),(26,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),(27,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),(28,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),(29,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),(30,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),(31,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),(32,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),(33,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),(34,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),(35,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),(36,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),(37,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),(38,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),(39,'','','123123','123123','231','1231','','23123','','1231','','','','123123','',''),(40,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),(41,'','','','','','','','','','123','','','','','',''),(42,'','','','','','','','','','1231','','','','','',''),(43,'','','','','','','','','','123','','','','','',''),(44,'','','','','','','','','','123','','','','','',''),(45,'','','','','','','','','','','','','','','',''),(46,'','','','','','','','','','','','','','','',''),(47,'','','','','','','','','','','','','','','',''),(48,'','','','','','','','','','','','','','','',''),(49,'','','','','','','','','','','','','','','',''),(50,'','','','','','','','','','','','','','','',''),(51,'','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `ll_product_medicine_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_product_service_params`
--

DROP TABLE IF EXISTS `ll_product_service_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_product_service_params` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag` tinyint(4) NOT NULL,
  `params` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_product_service_params`
--

LOCK TABLES `ll_product_service_params` WRITE;
/*!40000 ALTER TABLE `ll_product_service_params` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_product_service_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_province`
--

DROP TABLE IF EXISTS `ll_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cityname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provincename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_province`
--

LOCK TABLES `ll_province` WRITE;
/*!40000 ALTER TABLE `ll_province` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_receipt_address`
--

DROP TABLE IF EXISTS `ll_receipt_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_receipt_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` tinyint(4) NOT NULL,
  `person_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7966602E4D9FFDB0` (`user_id`),
  CONSTRAINT `FK7966602E4D9FFDB0` FOREIGN KEY (`user_id`) REFERENCES `ll_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_receipt_address`
--

LOCK TABLES `ll_receipt_address` WRITE;
/*!40000 ALTER TABLE `ll_receipt_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_receipt_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_score`
--

DROP TABLE IF EXISTS `ll_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creattime` datetime DEFAULT NULL,
  `f_type_id` int(11) DEFAULT NULL,
  `type` tinyint(4) NOT NULL,
  `use_score` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCCBF8F134D9FFDB0` (`user_id`),
  CONSTRAINT `FKCCBF8F134D9FFDB0` FOREIGN KEY (`user_id`) REFERENCES `ll_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_score`
--

LOCK TABLES `ll_score` WRITE;
/*!40000 ALTER TABLE `ll_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_shop`
--

DROP TABLE IF EXISTS `ll_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `backgroundpath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `closetime` datetime DEFAULT NULL,
  `creattime` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logopath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `score` int(11) NOT NULL,
  `shop_category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEDCF65512BE5D64` (`shop_category_id`),
  KEY `FKEDCF6554D9FFDB0` (`user_id`),
  CONSTRAINT `FKEDCF65512BE5D64` FOREIGN KEY (`shop_category_id`) REFERENCES `ll_shop_category` (`id`),
  CONSTRAINT `FKEDCF6554D9FFDB0` FOREIGN KEY (`user_id`) REFERENCES `ll_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_shop`
--

LOCK TABLES `ll_shop` WRITE;
/*!40000 ALTER TABLE `ll_shop` DISABLE KEYS */;
INSERT INTO `ll_shop` VALUES (1,'第三个傻瓜',NULL,NULL,NULL,NULL,NULL,'打手犯规','234234',0,1,1);
/*!40000 ALTER TABLE `ll_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_shop_bonus`
--

DROP TABLE IF EXISTS `ll_shop_bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_shop_bonus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creattime` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_shop_id` int(11) DEFAULT NULL,
  `f_user_id` int(11) DEFAULT NULL,
  `money` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_shop_bonus`
--

LOCK TABLES `ll_shop_bonus` WRITE;
/*!40000 ALTER TABLE `ll_shop_bonus` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_shop_bonus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_shop_car`
--

DROP TABLE IF EXISTS `ll_shop_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_shop_car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creattime` datetime DEFAULT NULL,
  `number` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD04C72EAD19929D0` (`shop_id`),
  KEY `FKD04C72EA4D9FFDB0` (`user_id`),
  KEY `FKD04C72EA3966DBC4` (`product_id`),
  CONSTRAINT `FKD04C72EA3966DBC4` FOREIGN KEY (`product_id`) REFERENCES `ll_product` (`id`),
  CONSTRAINT `FKD04C72EA4D9FFDB0` FOREIGN KEY (`user_id`) REFERENCES `ll_user` (`id`),
  CONSTRAINT `FKD04C72EAD19929D0` FOREIGN KEY (`shop_id`) REFERENCES `ll_shop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_shop_car`
--

LOCK TABLES `ll_shop_car` WRITE;
/*!40000 ALTER TABLE `ll_shop_car` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_shop_car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_shop_category`
--

DROP TABLE IF EXISTS `ll_shop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_shop_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shop_category_parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA02247A8A3A41E50` (`shop_category_parent_id`),
  CONSTRAINT `FKA02247A8A3A41E50` FOREIGN KEY (`shop_category_parent_id`) REFERENCES `ll_shop_category_parent` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_shop_category`
--

LOCK TABLES `ll_shop_category` WRITE;
/*!40000 ALTER TABLE `ll_shop_category` DISABLE KEYS */;
INSERT INTO `ll_shop_category` VALUES (1,'名称',1),(2,'名称222',1),(3,'名称32132',1),(4,'名称4',1),(5,'名称5',1),(6,'名称6',1),(7,'名称15sad',1),(8,'名参禅称15',2),(9,'名参禅称15',2),(10,'名参禅称15',2),(11,'名参禅称15',2),(12,'名参禅称15',2),(13,'名参禅称15',2),(14,'名参禅称15',2),(15,'名参禅称15',2),(16,'名参禅称15',2),(17,'名参禅称15',2),(18,'名参禅称15',2),(19,'名参禅称15',2),(20,'名参禅称15',2),(21,'名参禅称15',2),(22,'名参禅称15',2),(23,'名参禅称15',2),(24,'名参禅称15',2),(25,'经销商二级2',3),(26,'经销商二级2',3),(27,'经销商二级2',3),(28,'经销商二级2',3),(29,'经销商二级2',3),(30,'经销商二级2',3),(31,'经销商二级2',3),(32,'经销商二级2',3),(33,'经销商二级2',3),(34,'经销商二级2',3),(35,'经销商二级2',3),(36,'经销商二级2',3),(37,'经销商二级2',3),(38,'经销商二级2',3),(39,'经销商二级2',3),(40,'经销商二级2',3),(41,'经销商二级2',3),(42,'零售2',4),(43,'零售3',4),(44,'零售3',4),(45,'零售3',4),(46,'零售3',4),(47,'零售3',4),(48,'零售3',4),(49,'零售3',4),(50,'零售3',4),(51,'零售3',4),(52,'零售3',4),(53,'零售3',4),(54,'零售3',4),(55,'零售3',4),(56,'零售3',4),(57,'零售3',4),(60,'12312',1),(61,'22222',2),(62,'44',4);
/*!40000 ALTER TABLE `ll_shop_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_shop_category_parent`
--

DROP TABLE IF EXISTS `ll_shop_category_parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_shop_category_parent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_shop_category_parent`
--

LOCK TABLES `ll_shop_category_parent` WRITE;
/*!40000 ALTER TABLE `ll_shop_category_parent` DISABLE KEYS */;
INSERT INTO `ll_shop_category_parent` VALUES (1,'原材料',1),(2,'生产企业',2),(3,'经销商',3),(4,'零售',4);
/*!40000 ALTER TABLE `ll_shop_category_parent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_shop_cooperater`
--

DROP TABLE IF EXISTS `ll_shop_cooperater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_shop_cooperater` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alldiscount` float NOT NULL,
  `bond` int(11) NOT NULL,
  `coorperation_area` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `power` int(11) NOT NULL,
  `prepay` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `cooperation_role_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `user_shop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK77A49004D19929D0` (`shop_id`),
  KEY `FK77A490042C88C15C` (`user_shop_id`),
  KEY `FK77A4900444AF0608` (`cooperation_role_id`),
  CONSTRAINT `FK77A490042C88C15C` FOREIGN KEY (`user_shop_id`) REFERENCES `ll_shop` (`id`),
  CONSTRAINT `FK77A4900444AF0608` FOREIGN KEY (`cooperation_role_id`) REFERENCES `ll_shop_cooperater_role` (`id`),
  CONSTRAINT `FK77A49004D19929D0` FOREIGN KEY (`shop_id`) REFERENCES `ll_shop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_shop_cooperater`
--

LOCK TABLES `ll_shop_cooperater` WRITE;
/*!40000 ALTER TABLE `ll_shop_cooperater` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_shop_cooperater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_shop_cooperater_role`
--

DROP TABLE IF EXISTS `ll_shop_cooperater_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_shop_cooperater_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alldiscount` float NOT NULL,
  `bond` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `power` int(11) NOT NULL,
  `prepay` int(11) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK74F90BD1D19929D0` (`shop_id`),
  CONSTRAINT `FK74F90BD1D19929D0` FOREIGN KEY (`shop_id`) REFERENCES `ll_shop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_shop_cooperater_role`
--

LOCK TABLES `ll_shop_cooperater_role` WRITE;
/*!40000 ALTER TABLE `ll_shop_cooperater_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_shop_cooperater_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_shop_cooperation_role_product_info`
--

DROP TABLE IF EXISTS `ll_shop_cooperation_role_product_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_shop_cooperation_role_product_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discount` float NOT NULL,
  `cooperater_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6FD8EDF9378466ED` (`cooperater_id`),
  KEY `FK6FD8EDF93966DBC4` (`product_id`),
  CONSTRAINT `FK6FD8EDF9378466ED` FOREIGN KEY (`cooperater_id`) REFERENCES `ll_shop_cooperater` (`id`),
  CONSTRAINT `FK6FD8EDF93966DBC4` FOREIGN KEY (`product_id`) REFERENCES `ll_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_shop_cooperation_role_product_info`
--

LOCK TABLES `ll_shop_cooperation_role_product_info` WRITE;
/*!40000 ALTER TABLE `ll_shop_cooperation_role_product_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_shop_cooperation_role_product_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_shop_custom_category`
--

DROP TABLE IF EXISTS `ll_shop_custom_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_shop_custom_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC621B422D19929D0` (`shop_id`),
  CONSTRAINT `FKC621B422D19929D0` FOREIGN KEY (`shop_id`) REFERENCES `ll_shop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_shop_custom_category`
--

LOCK TABLES `ll_shop_custom_category` WRITE;
/*!40000 ALTER TABLE `ll_shop_custom_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_shop_custom_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_shop_employee`
--

DROP TABLE IF EXISTS `ll_shop_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_shop_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creattime` datetime DEFAULT NULL,
  `is_cut_price` tinyint(4) NOT NULL,
  `employee_grede_id` int(11) DEFAULT NULL,
  `employee_type_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE4427158258F7EE4` (`employee_type_id`),
  KEY `FKE4427158D19929D0` (`shop_id`),
  KEY `FKE44271584D9FFDB0` (`user_id`),
  KEY `FKE4427158C01A0EAC` (`employee_grede_id`),
  CONSTRAINT `FKE4427158258F7EE4` FOREIGN KEY (`employee_type_id`) REFERENCES `ll_employee_type` (`id`),
  CONSTRAINT `FKE44271584D9FFDB0` FOREIGN KEY (`user_id`) REFERENCES `ll_user` (`id`),
  CONSTRAINT `FKE4427158C01A0EAC` FOREIGN KEY (`employee_grede_id`) REFERENCES `ll_employee_grade` (`id`),
  CONSTRAINT `FKE4427158D19929D0` FOREIGN KEY (`shop_id`) REFERENCES `ll_shop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_shop_employee`
--

LOCK TABLES `ll_shop_employee` WRITE;
/*!40000 ALTER TABLE `ll_shop_employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_shop_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_shop_join_request`
--

DROP TABLE IF EXISTS `ll_shop_join_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_shop_join_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checktime` datetime DEFAULT NULL,
  `creattime` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `request_type` tinyint(4) NOT NULL,
  `response_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `employee_type_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBC3D224258F7EE4` (`employee_type_id`),
  KEY `FKBC3D224D19929D0` (`shop_id`),
  KEY `FKBC3D2244D9FFDB0` (`user_id`),
  CONSTRAINT `FKBC3D224258F7EE4` FOREIGN KEY (`employee_type_id`) REFERENCES `ll_employee_type` (`id`),
  CONSTRAINT `FKBC3D2244D9FFDB0` FOREIGN KEY (`user_id`) REFERENCES `ll_user` (`id`),
  CONSTRAINT `FKBC3D224D19929D0` FOREIGN KEY (`shop_id`) REFERENCES `ll_shop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_shop_join_request`
--

LOCK TABLES `ll_shop_join_request` WRITE;
/*!40000 ALTER TABLE `ll_shop_join_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_shop_join_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_shop_join_response`
--

DROP TABLE IF EXISTS `ll_shop_join_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_shop_join_response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creattime` datetime DEFAULT NULL,
  `shop_join_request_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6FDE274C2FD0AEC4` (`shop_join_request_id`),
  CONSTRAINT `FK6FDE274C2FD0AEC4` FOREIGN KEY (`shop_join_request_id`) REFERENCES `ll_shop_join_request` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_shop_join_response`
--

LOCK TABLES `ll_shop_join_response` WRITE;
/*!40000 ALTER TABLE `ll_shop_join_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_shop_join_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_shop_member`
--

DROP TABLE IF EXISTS `ll_shop_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_shop_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consume_amount` double DEFAULT NULL,
  `is_lct` tinyint(4) NOT NULL,
  `last_trade_time` datetime DEFAULT NULL,
  `tradenumber` int(11) NOT NULL,
  `menber_grade_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1B8B7C4D19929D0` (`shop_id`),
  KEY `FK1B8B7C447CB86AD` (`menber_grade_id`),
  CONSTRAINT `FK1B8B7C447CB86AD` FOREIGN KEY (`menber_grade_id`) REFERENCES `ll_shop_member_grade` (`id`),
  CONSTRAINT `FK1B8B7C4D19929D0` FOREIGN KEY (`shop_id`) REFERENCES `ll_shop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_shop_member`
--

LOCK TABLES `ll_shop_member` WRITE;
/*!40000 ALTER TABLE `ll_shop_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_shop_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_shop_member_grade`
--

DROP TABLE IF EXISTS `ll_shop_member_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_shop_member_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_percent` int(11) NOT NULL,
  `grade_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grade_requirement` int(11) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9455F79CD19929D0` (`shop_id`),
  CONSTRAINT `FK9455F79CD19929D0` FOREIGN KEY (`shop_id`) REFERENCES `ll_shop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_shop_member_grade`
--

LOCK TABLES `ll_shop_member_grade` WRITE;
/*!40000 ALTER TABLE `ll_shop_member_grade` DISABLE KEYS */;
/*!40000 ALTER TABLE `ll_shop_member_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_user`
--

DROP TABLE IF EXISTS `ll_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `balance` int(11) NOT NULL,
  `chat_background` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_job_authentication` tinyint(4) NOT NULL,
  `is_realname_authentication` tinyint(4) NOT NULL,
  `is_shop_authentication` tinyint(4) NOT NULL,
  `job` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linlinaccount` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logopath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nikename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oftenappear` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pay_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_mac` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phonenum` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `school` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` tinyint(4) NOT NULL,
  `shop_status` tinyint(4) NOT NULL,
  `shopname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `signature` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `industry` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_proxy` tinyint(4) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `birthtime` datetime DEFAULT NULL,
  `creattime` datetime DEFAULT NULL,
  `lastlogintime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEDE072A3B58D244` (`admin_id`),
  CONSTRAINT `FKEDE072A3B58D244` FOREIGN KEY (`admin_id`) REFERENCES `ll_admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_user`
--

LOCK TABLES `ll_user` WRITE;
/*!40000 ALTER TABLE `ll_user` DISABLE KEYS */;
INSERT INTO `ll_user` VALUES (1,123,'null',1,0,0,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-04-28 15:21:46','2015-02-28 05:21:48',NULL),(2,123,'null',1,0,0,'斯蒂芬','爱上,aas,撒旦','100012454','1','dsf斯蒂芬','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:52','2015-02-28 15:22:11','2015-02-28 15:22:26','2015-02-28 15:22:28'),(3,123,'null',0,0,0,'斯蒂芬','爱上,aas,撒旦','10001223','1','dsf斯蒂芬','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:53','2015-02-28 15:22:13','2015-02-28 15:22:27','2015-02-28 15:22:29'),(4,123,'null',0,1,0,'斯蒂芬','爱上,aas,撒旦','1000121454','1','dsf斯蒂芬','第三方，阿萨德','1243214','123','12312','12312312','123',1,2,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:54','2015-02-28 15:22:14','2015-02-28 15:22:34','2015-02-28 15:22:30'),(5,123,'null',0,0,0,'斯蒂芬','爱上,aas,撒旦','24234','1','dsf斯蒂芬','第三方，阿萨德','1243214','123','12312','12312312','123',1,0,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:55','2015-02-28 15:22:15','2015-02-28 15:22:33','2015-02-28 15:22:31'),(6,123,'null',0,0,0,'斯蒂芬','爱上,aas,撒旦','5464545','1','dsf斯蒂芬','第三方，阿萨德','1243214','123','12312','12312312','123',1,0,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:56','2015-02-28 15:22:16','2015-02-28 15:22:33','2015-02-28 15:22:32'),(7,123,'null',1,1,0,'斯蒂芬','爱上,aas,撒旦','87874534','1','dsf斯蒂芬','第三方，阿萨德','1243214','123','12312','12312312','123',1,2,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:57','2015-02-28 15:22:17','2015-02-28 15:22:37','2015-02-28 15:22:43'),(8,123,'null',0,0,0,'斯蒂芬','爱上,aas,撒旦','214345','1','dsf斯蒂芬','第三方，阿萨德','1243214','123','12312','12312312','123',1,0,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:58','2015-02-28 15:22:18','2015-02-28 15:22:38','2015-02-28 15:22:42'),(9,123,'null',0,0,0,'斯蒂芬','爱上,aas,撒旦','456424214','1','dsf斯蒂芬','第三方，阿萨德','1243214','123','12312','12312312','123',1,0,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:59','2015-02-28 15:22:19','2015-02-28 15:22:38','2015-02-28 15:22:41'),(10,123,'null',1,1,0,'斯蒂芬','爱上,aas,撒旦','7871451','1','dsf斯蒂芬','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:22:00','2015-02-28 15:22:45','2015-02-28 15:22:54','2015-02-28 15:23:04'),(11,123,'null',0,0,0,'斯蒂芬','爱上,aas,撒旦','4531541','1','dsf斯蒂芬','第三方，阿萨德','1243214','123','12312','12312312','123',1,0,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:22:01','2015-02-28 15:22:46','2015-02-28 15:22:55','2015-02-28 15:23:05'),(12,7,'null',0,0,0,'斯蒂芬','爱上,aas,撒旦','45544554','1','dsf斯蒂芬','第三方，阿萨德','1243214','123','12312','12312312','123',1,0,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:22:02','2015-02-28 15:22:47','2015-02-28 15:22:56','2015-02-28 15:23:06'),(13,6,'null',0,0,0,'斯蒂芬','爱上,aas,撒旦','1045454','1','dsf斯蒂芬','第三方，阿萨德','1243214','123','12312','12312312','123',1,0,'撒旦','司法所地方','爱上,阿萨德',0,NULL,'2015-02-28 15:22:03','2015-02-28 15:22:48','2015-02-28 15:22:57','2015-02-28 15:23:07'),(14,5,'null',1,0,0,'斯蒂芬','爱上,aas,撒旦','5445444','1','dsf斯蒂芬','第三方，阿萨德','1243214','123','12312','12312312','123',1,0,'撒旦','司法所地方','爱上,阿萨德',0,NULL,'2015-02-28 15:22:04','2015-02-28 15:22:49','2015-02-28 15:22:58','2015-02-28 15:23:08'),(15,4,'null',0,0,0,'斯蒂芬','爱上,aas,撒旦','555555','1','dsf斯蒂芬','第三方，阿萨德','1243214','123','12312','12312312','123',1,0,'撒旦','司法所地方','爱上,阿萨德',0,NULL,'2015-02-28 15:22:05','2015-02-28 15:22:49','2015-02-28 15:23:00','2015-02-28 15:23:08'),(16,3,'null',0,1,0,'斯蒂芬','爱上,aas,撒旦','1111111','1','dsf斯蒂芬','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,NULL,'2015-02-28 15:22:07','2015-02-28 15:22:50','2015-02-28 15:23:01','2015-02-28 15:23:09'),(17,2,'null',1,1,0,'斯蒂芬','爱上,aas,撒旦','100000454','1','dsf斯蒂芬','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,NULL,'2015-02-28 15:22:07','2015-02-28 15:22:51','2015-02-28 15:23:02','2015-02-28 15:23:10'),(18,1,'null',0,1,0,'斯蒂芬','爱上,aas,撒旦','0000000','1','dsf斯蒂芬','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,NULL,'2015-02-28 15:22:08','2015-02-28 15:22:52','2015-02-28 15:23:03','2015-02-28 15:23:11'),(19,123,'null',0,1,1,'斯蒂芬','爱上,aas,撒旦','0000001','1','dsf斯蒂芬','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,NULL,'2015-02-28 15:22:09','2015-02-28 15:22:53','2015-02-28 15:23:03','2015-02-28 15:23:12'),(20,123,'null',1,0,0,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-03-28 15:21:46','2015-02-28 05:21:48',NULL),(21,123,'null',1,0,0,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-03-28 15:21:46','2015-02-28 05:21:48',NULL),(22,123,'null',1,0,0,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-03-28 15:21:46','2015-02-28 05:21:48',NULL),(23,123,'null',1,0,0,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-03-28 15:21:46','2015-02-28 05:21:48',NULL),(24,123,'null',1,0,0,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-03-28 15:21:46','2015-02-28 05:21:48',NULL),(25,123,'null',1,0,0,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-03-28 15:21:46','2015-02-28 05:21:48',NULL),(26,123,'null',1,0,1,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-04-28 15:21:46','2015-02-28 05:21:48',NULL),(27,123,'null',1,0,1,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-03-28 15:21:46','2015-02-28 05:21:48',NULL),(28,123,'null',1,0,1,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-03-28 15:21:46','2015-02-28 05:21:48',NULL),(29,123,'null',1,0,1,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-03-28 15:21:46','2015-02-28 05:21:48',NULL),(30,123,'null',1,0,1,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-03-28 15:21:46','2015-02-28 05:21:48',NULL),(31,123,'null',1,0,1,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-03-28 15:21:46','2015-02-28 05:21:48',NULL),(32,123,'null',1,0,0,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,0,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-03-28 15:21:46','2015-02-28 05:21:48',NULL),(33,123,'null',1,0,0,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,0,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-04-28 15:21:46','2015-02-28 05:21:48',NULL),(34,123,'null',1,0,0,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,0,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-03-28 15:21:46','2015-02-28 05:21:48',NULL),(35,123,'null',1,0,0,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,0,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-03-28 15:21:46','2015-02-28 05:21:48',NULL),(36,123,'null',1,0,0,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,0,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-03-28 15:21:46','2015-02-28 05:21:48',NULL),(37,123,'null',1,0,0,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,0,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-04-28 15:21:46','2015-02-28 05:21:48',NULL),(38,123,'null',1,0,0,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,0,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-04-28 15:21:46','2015-02-28 05:21:48',NULL),(39,123,'null',1,0,0,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,0,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-04-28 15:21:46','2015-02-28 05:21:48',NULL),(40,123,'null',1,0,0,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,0,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-04-28 15:21:46','2015-02-28 05:21:48',NULL),(41,123,'null',1,0,0,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,0,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-04-28 15:21:46','2015-02-28 05:21:48',NULL),(42,123,'null',1,0,0,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,0,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-04-28 15:21:46','2015-02-28 05:21:48',NULL),(43,123,'null',1,0,0,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,0,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-04-28 15:21:46','2015-02-28 05:21:48',NULL),(44,123,'null',1,0,0,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,0,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-04-28 15:21:46','2015-02-28 05:21:48',NULL),(45,123,'null',1,0,0,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,0,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-04-28 15:21:46','2015-02-28 05:21:48',NULL),(46,123,'null',1,0,1,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-04-28 15:21:46','2015-02-28 05:21:48',NULL),(47,123,'null',1,0,1,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-04-28 15:21:46','2015-02-28 05:21:48',NULL),(48,123,'null',1,0,1,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-04-28 15:21:46','2015-02-28 05:21:48',NULL),(49,123,'null',1,0,1,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-04-28 15:21:46','2015-02-28 05:21:48',NULL),(50,123,'null',1,0,1,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-04-28 15:21:46','2015-02-28 05:21:48',NULL),(51,123,'null',1,0,1,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-04-28 15:21:46','2015-02-28 05:21:48',NULL),(52,123,'null',1,0,1,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-04-28 15:21:46','2015-02-28 05:21:48',NULL),(53,123,'null',1,0,1,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-04-28 15:21:46','2015-02-28 05:21:48',NULL),(54,123,'null',1,0,1,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-04-28 15:21:46','2015-02-28 05:21:48',NULL),(55,123,'null',1,0,1,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-04-28 15:21:46','2015-02-28 05:21:48',NULL),(56,123,'null',1,0,1,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-04-28 15:21:46','2015-02-28 05:21:48',NULL),(57,123,'null',1,0,0,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-04-28 15:21:46','2015-02-28 05:21:48',NULL),(58,123,'null',1,0,0,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-04-28 15:21:46','2015-02-28 05:21:48',NULL),(59,123,'null',1,0,0,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-04-28 15:21:46','2015-02-28 05:21:48',NULL),(60,123,'null',1,0,0,'斯蒂芬','爱上,aas,撒旦','100012456','1','dsf斯蒂芬1','第三方，阿萨德','1243214','123','12312','12312312','123',1,1,'撒旦','司法所地方','爱上,阿萨德',0,1,'2015-02-28 15:21:45','2014-04-28 15:21:46','2015-02-28 05:21:48',NULL);
/*!40000 ALTER TABLE `ll_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_user_realname_authentication`
--

DROP TABLE IF EXISTS `ll_user_realname_authentication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_user_realname_authentication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IDcard` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IDcard_pics` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `checktime` datetime DEFAULT NULL,
  `creattime` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK99FF12394D9FFDB0` (`user_id`),
  CONSTRAINT `FK99FF12394D9FFDB0` FOREIGN KEY (`user_id`) REFERENCES `ll_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_user_realname_authentication`
--

LOCK TABLES `ll_user_realname_authentication` WRITE;
/*!40000 ALTER TABLE `ll_user_realname_authentication` DISABLE KEYS */;
INSERT INTO `ll_user_realname_authentication` VALUES (1,'510182199108070635','llmsProductImages/preview1.png,llmsProductImages/preview1.png','边明周1',1,'2015-03-06 16:07:43','2015-03-06 14:46:44',1),(2,'510182199108070636','llmsProductImages/preview1.png,llmsProductImages/preview1.png','边明周2',2,'2015-03-06 16:08:42','2015-03-06 14:46:44',2),(3,'510182199108070637','llmsProductImages/preview1.png,llmsProductImages/preview1.png','边明周3',0,NULL,'2015-03-06 14:46:44',3),(4,'510182199108070638','llmsProductImages/preview1.png,llmsProductImages/preview1.png','边明周4',0,NULL,'2015-03-06 14:46:44',4),(5,'510182199108070639','llmsProductImages/preview1.png,llmsProductImages/preview1.png','边明周5',0,NULL,'2015-03-06 14:46:44',5);
/*!40000 ALTER TABLE `ll_user_realname_authentication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_user_shop_authentication`
--

DROP TABLE IF EXISTS `ll_user_shop_authentication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_user_shop_authentication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enterprise_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `legal_person` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license_pics` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `checktime` datetime DEFAULT NULL,
  `creattime` datetime DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8315C64CD19929D0` (`shop_id`),
  CONSTRAINT `FK8315C64CD19929D0` FOREIGN KEY (`shop_id`) REFERENCES `ll_shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_user_shop_authentication`
--

LOCK TABLES `ll_user_shop_authentication` WRITE;
/*!40000 ALTER TABLE `ll_user_shop_authentication` DISABLE KEYS */;
INSERT INTO `ll_user_shop_authentication` VALUES (1,'成都','邻邻科技','黄秋','123456789','llmsProductImages/preview1.png,llmsProductImages/preview1.png',1,1,'2015-03-09 18:06:00','2015-03-09 16:01:27',1),(2,'成都1','邻邻科技1','黄秋1','123456789','llmsProductImages/preview1.png,llmsProductImages/preview1.png',2,1,'2015-03-09 18:06:45','2015-03-09 16:01:27',1),(3,'成都1','邻邻科技1','黄秋1','123456789','llmsProductImages/preview1.png,llmsProductImages/preview1.png',0,2,NULL,'2015-03-09 16:01:27',1),(4,'成都1','邻邻科技1','黄秋1','123456789','llmsProductImages/preview1.png,llmsProductImages/preview1.png',0,2,NULL,'2015-03-09 16:01:27',1),(5,'成都1','邻邻科技1','黄秋1','123456789','llmsProductImages/preview1.png,llmsProductImages/preview1.png',0,1,NULL,'2015-03-09 16:01:27',1),(6,'成都1','邻邻科技1','黄秋1','123456789','llmsProductImages/preview1.png,llmsProductImages/preview1.png',0,1,NULL,'2015-03-09 16:01:27',1),(7,'成都1','邻邻科技1','黄秋1','123456789','llmsProductImages/preview1.png,llmsProductImages/preview1.png',0,2,NULL,'2015-03-09 16:01:27',1),(8,'成都1','邻邻科技1','黄秋1','123456789','llmsProductImages/preview1.png,llmsProductImages/preview1.png',0,1,NULL,'2015-03-09 16:01:27',1),(9,'成都1','邻邻科技1','黄秋1','123456789','llmsProductImages/preview1.png,llmsProductImages/preview1.png',0,1,NULL,'2015-03-09 16:01:27',1);
/*!40000 ALTER TABLE `ll_user_shop_authentication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ll_user_title_authentication`
--

DROP TABLE IF EXISTS `ll_user_title_authentication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ll_user_title_authentication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `certificate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `certificate_pics` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job_titile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `checktime` datetime DEFAULT NULL,
  `creattime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC94C45344D9FFDB0` (`user_id`),
  CONSTRAINT `FKC94C45344D9FFDB0` FOREIGN KEY (`user_id`) REFERENCES `ll_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ll_user_title_authentication`
--

LOCK TABLES `ll_user_title_authentication` WRITE;
/*!40000 ALTER TABLE `ll_user_title_authentication` DISABLE KEYS */;
INSERT INTO `ll_user_title_authentication` VALUES (1,'123456789','llmsProductImages/preview1.png,llmsProductImages/preview1.png','软件工程师',1,1,'2015-03-08 11:23:36','2015-03-08 10:18:38'),(2,'1234567289','llmsProductImages/preview1.png,llmsProductImages/preview1.png','软件工程师1',2,1,'2015-03-08 11:24:50','2015-03-08 10:18:38'),(3,'1234567289','llmsProductImages/preview1.png,llmsProductImages/preview1.png','软件工程师3',0,1,NULL,'2015-03-08 10:18:38'),(4,'1234567289','llmsProductImages/preview1.png,llmsProductImages/preview1.png','软件工程师2',0,1,NULL,'2015-03-08 10:18:38');
/*!40000 ALTER TABLE `ll_user_title_authentication` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-20 10:45:38
