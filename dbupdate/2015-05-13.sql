CREATE DATABASE  IF NOT EXISTS `bfree` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bfree`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bfree
-- ------------------------------------------------------
-- Server version	5.5.39

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `Category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_Category_Category1_idx` (`Category_id`),
  CONSTRAINT `fk_Category_Category1` FOREIGN KEY (`Category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Здравоохранение',NULL,NULL),(2,'Магазины',NULL,NULL),(3,'Кафе и рестораны',NULL,NULL),(4,'Образование',NULL,NULL),(5,'Транспорт',NULL,NULL),(6,'Культура и религия',NULL,NULL),(7,'Огранизации',NULL,NULL),(8,'Спорт и отдых',NULL,NULL),(9,'Финансы и связь',NULL,NULL),(10,'Поликлиники',NULL,1),(11,'Больницы',NULL,1),(12,'Стоматологии',NULL,1),(13,'Детские учреждения',NULL,4),(14,'Частные учреждения',NULL,1),(15,'Ясли-сад',NULL,8),(16,'Школы',NULL,4),(17,'Учебные центры',NULL,4),(18,'Гимназии, лицеи',NULL,4),(19,'Специальные школы',NULL,4),(20,'Детские дома',NULL,4),(21,'Спортивные комплексы',NULL,8),(22,'Спортивные школы',NULL,8),(23,'Спортивные клубы',NULL,8),(24,'Тренажерные залы',NULL,8),(25,'Кинотеатры',NULL,8),(26,'Автозаправочные станции',NULL,5),(27,'Гостиницы',NULL,7),(28,'Автостоянки',NULL,5),(29,'Вокзалы',NULL,5),(30,'Банки',NULL,9),(31,'Отделения связи',NULL,9),(32,'ЖКХ',NULL,7),(33,'ВУЗы',NULL,4),(34,'СУЗы',NULL,4),(35,'Банно-прачечные комплесы',NULL,7),(36,'Магазины',NULL,2),(37,'Милиция',NULL,7),(38,'Налоговая',NULL,7),(39,'Общепит',NULL,3),(40,'Учреждения соцзащиты',NULL,7),(41,'Библиотеки',NULL,6),(42,'Школы искусств',NULL,6),(43,'Центры культуры',NULL,6),(44,'Храмы',NULL,6),(45,'Ночные клубы',NULL,8),(46,'Аптеки',NULL,1),(47,'Театры',NULL,8);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `Region_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_City_Region1_idx` (`Region_id`),
  CONSTRAINT `fk_City_Region1` FOREIGN KEY (`Region_id`) REFERENCES `region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Гродно',1);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext,
  `date` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idComment_UNIQUE` (`id`),
  KEY `fk_comment_user1_idx` (`user_id`),
  KEY `fk_comment_organization1_idx` (`organization_id`),
  CONSTRAINT `fk_comment_organization1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordinate`
--

DROP TABLE IF EXISTS `coordinate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coordinate` (
  `id` int(11) NOT NULL,
  `x` double DEFAULT NULL,
  `y` double DEFAULT NULL,
  `house` int(11) DEFAULT NULL,
  `Street_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idCoordinate_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordinate`
--

LOCK TABLES `coordinate` WRITE;
/*!40000 ALTER TABLE `coordinate` DISABLE KEYS */;
INSERT INTO `coordinate` VALUES (1,53.68520504539978,23.842024505138397,NULL,NULL),(2,53.67006492436137,23.80064070224762,NULL,NULL),(3,53.68337827537598,23.8364240527153,NULL,NULL),(4,53.674254676775675,23.84130835533142,NULL,NULL),(5,53.65803105435751,23.83555233478546,NULL,NULL),(6,53.68641607066461,23.85081946849823,NULL,NULL),(7,53.67835885633671,23.818729519844055,NULL,NULL),(8,53.670992909373,23.801477551460266,NULL,NULL),(9,53.67536560292562,23.82783830165863,NULL,NULL),(10,53.65815948471416,23.85208010673523,NULL,NULL),(11,53.66048514941254,23.834919333457947,NULL,NULL),(12,53.68489751841748,23.84009063243866,NULL,NULL),(13,53.64516188280913,23.84384036064148,NULL,NULL),(14,53.68347358726961,23.836783468723297,NULL,NULL),(15,53.676789172657394,23.83037030696869,NULL,NULL),(16,53.67956626620376,23.829908967018127,NULL,NULL),(17,53.675746285397906,23.850505650043488,NULL,NULL),(18,53.68621063,23.8274498,NULL,NULL),(19,53.67758179,23.82761002,NULL,NULL),(20,53.69195938,23.82551956,NULL,NULL),(21,53.68848038,23.84649086,NULL,NULL),(22,53.6787796,23.82592964,NULL,NULL),(23,53.67060089,23.82239914,NULL,NULL),(24,53.65829086,23.8354702,NULL,NULL),(25,53.67615891,23.84774017,NULL,NULL),(26,53.67615891,23.84774017,NULL,NULL),(27,53.69401932,23.82807922,NULL,NULL),(28,53.68518066,23.85399055,NULL,NULL),(29,53.67462921,23.86486053,NULL,NULL),(30,53.71022034,23.85049057,NULL,NULL);
/*!40000 ALTER TABLE `coordinate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Беларусь');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `element`
--

DROP TABLE IF EXISTS `element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` longtext,
  `image` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idElement_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element`
--

LOCK TABLES `element` WRITE;
/*!40000 ALTER TABLE `element` DISABLE KEYS */;
INSERT INTO `element` VALUES (1,'Пандус','Обеспечение подъезда инвалидных колясок к расположенному над цоколем здания парадному входу',NULL),(2,'Подъёмники для инвалидов','Предназначено для перемещения инвалида в кресле-коляске по лестничному маршу с большим уклоном',NULL),(3,'Окрашенные ступени',NULL,NULL),(4,'Специальный санитарный узел для инвалидов','Туалет',NULL),(5,'Широкие двери','Для колясок',NULL),(6,'Поручни',NULL,NULL);
/*!40000 ALTER TABLE `element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext,
  `description` longtext,
  `user_id` int(11) NOT NULL,
  `coordinate_id` int(11) NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  `Category_id` int(11) NOT NULL,
  `verified` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idObject_UNIQUE` (`id`),
  KEY `fk_organization_user1_idx` (`user_id`),
  KEY `fk_organization_coordinate1_idx` (`coordinate_id`),
  KEY `fk_organization_Category1_idx` (`Category_id`),
  CONSTRAINT `fk_organization_Category1` FOREIGN KEY (`Category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_organization_coordinate1` FOREIGN KEY (`coordinate_id`) REFERENCES `coordinate` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_organization_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (1,'Epolet','Place for family',4,1,NULL,45,0),(2,'Дежурная аптека аптека','Всегда открыта',4,2,NULL,46,0),(3,'Аптека №2','Редкие лекарства',4,3,NULL,46,0),(4,'Фитоаптека','Лекарства на растительных основах',4,4,NULL,46,0),(5,'Поликлиника №4','Самые добрые доктора',4,5,NULL,10,0),(6,'Ж/Д Вокзал','Беларуская Чыгунка',4,6,NULL,29,0),(7,'Каложская церковь','Старейший православный храм',4,7,NULL,44,0),(8,'Октябрь','3d',4,8,NULL,25,0),(9,'Драматический театр','Визитка города',4,9,NULL,47,0),(10,'Гимназия №1','Лучшая школа для вашего ребенка',4,10,NULL,18,0),(11,'Стоительный лицей','Можно выучиться на сварщика',4,11,NULL,34,0),(12,'ГрГУ','Крупнейший региональный ВУЗ',4,12,NULL,33,0),(13,'Iron','Фитнес для всех',5,13,NULL,24,0),(14,'Шахматно-шашечный клуб','Уверенный ход конем',5,14,NULL,23,0),(15,'Пивной ресторан Неман','Первый в городе',1,15,NULL,39,0),(16,'Lamberjack','Скидки бородачам',1,16,NULL,39,0),(17,'Чайкоффский','Никакого алкоголя',1,17,NULL,39,0),(18,'ГУЗ «Городская поликлиника № 1 г.Гродно»',NULL,1,18,NULL,10,0),(19,'Филиал ООО ЛОДЭ',NULL,1,19,NULL,14,0),(20,'ООО «Амфирея»',NULL,1,20,NULL,14,0),(21,'ООО «БьютиВY»',NULL,1,21,NULL,14,0),(22,'ООО «Межэлит»',NULL,1,22,NULL,14,0),(23,'Гродненская центральная городская поликлиника',NULL,1,23,NULL,10,0),(24,'ГУЗ «Городская поликлиника № 3 г.Гродно»',NULL,1,24,NULL,10,0),(25,'ОДО «Нарктер»',NULL,1,25,NULL,14,0),(26,'МОДО «Юлан»',NULL,1,26,NULL,14,0),(27,'ЧУП «СтилЛорИв»',NULL,1,27,NULL,14,1),(28,'ОДО «Колповид»',NULL,1,28,NULL,14,1),(29,'ГУЗ «Городская поликлиника №5 г.Гродно»',NULL,1,29,NULL,10,1),(30,'ГУЗ «Городская поликлиника №6 г.Гродно»',NULL,1,30,NULL,10,1);
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_has_element`
--

DROP TABLE IF EXISTS `organization_has_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_has_element` (
  `organization_id` int(11) NOT NULL,
  `element_id` int(11) NOT NULL,
  PRIMARY KEY (`organization_id`,`element_id`),
  KEY `fk_organization_has_element_element1_idx` (`element_id`),
  KEY `fk_organization_has_element_organization1_idx` (`organization_id`),
  CONSTRAINT `fk_organization_has_element_element1` FOREIGN KEY (`element_id`) REFERENCES `element` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_organization_has_element_organization1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_has_element`
--

LOCK TABLES `organization_has_element` WRITE;
/*!40000 ALTER TABLE `organization_has_element` DISABLE KEYS */;
INSERT INTO `organization_has_element` VALUES (5,1),(6,1),(8,1),(9,1),(10,1),(12,1),(6,2),(2,3),(4,3),(5,3),(6,3),(8,3),(9,3),(10,3),(12,3),(5,4),(6,4),(9,4),(12,4),(2,5),(4,5),(5,5),(6,5),(7,5),(8,5),(9,5),(10,5),(12,5),(5,6),(6,6),(12,6);
/*!40000 ALTER TABLE `organization_has_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `Country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Region_Country1_idx` (`Country_id`),
  CONSTRAINT `fk_Region_Country1` FOREIGN KEY (`Country_id`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'Гродненская область',1);
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idUserRole_UNIQUE` (`id`),
  UNIQUE KEY `Role_UNIQUE` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMIN'),(2,'ORGANIZATION'),(3,'PERSON');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `street`
--

DROP TABLE IF EXISTS `street`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `street` (
  `id` int(11) NOT NULL,
  `name` longtext,
  `City_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `street`
--

LOCK TABLES `street` WRITE;
/*!40000 ALTER TABLE `street` DISABLE KEYS */;
/*!40000 ALTER TABLE `street` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(129) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idUser_UNIQUE` (`id`),
  KEY `fk_user_role_idx` (`role_id`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Ivan','Ivanov','i@ya.ru','password',3),(2,'Petr','Petrov','p@ya.ru','password',3),(3,'Andrei','Andreev','a@ya.ru','password',3),(4,'D','d','dimafromgrodno@yandex.ru','4dff4ea340f0a823f15d3f4f01ab62eae0e5da579ccb851f8db9dfe84c58b2b37b89903a740e1ee172da793a6e79d560e5f7f9bd058a12a280433ed6fa46510a',2),(5,'bfree-grodno@yandex.ru','bfree-grodno@yandex.ru','bfree-grodno@yandex.ru','4dff4ea340f0a823f15d3f4f01ab62eae0e5da579ccb851f8db9dfe84c58b2b37b89903a740e1ee172da793a6e79d560e5f7f9bd058a12a280433ed6fa46510a',1);
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

-- Dump completed on 2015-05-13 17:36:16
