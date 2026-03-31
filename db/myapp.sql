-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: myapp
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_emailaddress_user_id_email_987c8728_uniq` (`user_id`,`email`),
  KEY `account_emailaddress_email_03be32b2` (`email`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (1,'lozytunaty@mailinator.com',0,1,2);
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'Editors'),(1,'Moderators');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (2,1,1),(7,1,102),(8,1,103),(6,1,104),(10,1,105),(14,1,106),(15,1,107),(16,1,108),(18,1,109),(1,2,1),(4,2,102),(5,2,103),(3,2,104),(9,2,105),(11,2,106),(12,2,107),(13,2,108),(17,2,109);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can access Wagtail admin',3,'access_admin'),(2,'Can add locale',5,'add_locale'),(3,'Can change locale',5,'change_locale'),(4,'Can delete locale',5,'delete_locale'),(5,'Can view locale',5,'view_locale'),(6,'Can add site',6,'add_site'),(7,'Can change site',6,'change_site'),(8,'Can delete site',6,'delete_site'),(9,'Can view site',6,'view_site'),(10,'Can add model log entry',7,'add_modellogentry'),(11,'Can change model log entry',7,'change_modellogentry'),(12,'Can delete model log entry',7,'delete_modellogentry'),(13,'Can view model log entry',7,'view_modellogentry'),(14,'Can add collection view restriction',8,'add_collectionviewrestriction'),(15,'Can change collection view restriction',8,'change_collectionviewrestriction'),(16,'Can delete collection view restriction',8,'delete_collectionviewrestriction'),(17,'Can view collection view restriction',8,'view_collectionviewrestriction'),(18,'Can add collection',9,'add_collection'),(19,'Can change collection',9,'change_collection'),(20,'Can delete collection',9,'delete_collection'),(21,'Can view collection',9,'view_collection'),(22,'Can add group collection permission',10,'add_groupcollectionpermission'),(23,'Can change group collection permission',10,'change_groupcollectionpermission'),(24,'Can delete group collection permission',10,'delete_groupcollectionpermission'),(25,'Can view group collection permission',10,'view_groupcollectionpermission'),(26,'Can add uploaded file',11,'add_uploadedfile'),(27,'Can change uploaded file',11,'change_uploadedfile'),(28,'Can delete uploaded file',11,'delete_uploadedfile'),(29,'Can view uploaded file',11,'view_uploadedfile'),(30,'Can add reference index',12,'add_referenceindex'),(31,'Can change reference index',12,'change_referenceindex'),(32,'Can delete reference index',12,'delete_referenceindex'),(33,'Can view reference index',12,'view_referenceindex'),(34,'Can add page',1,'add_page'),(35,'Can change page',1,'change_page'),(36,'Can delete page',1,'delete_page'),(37,'Can view page',1,'view_page'),(38,'Delete pages with children',1,'bulk_delete_page'),(39,'Lock/unlock pages you\'ve locked',1,'lock_page'),(40,'Publish any page',1,'publish_page'),(41,'Unlock any page',1,'unlock_page'),(42,'Can add revision',13,'add_revision'),(43,'Can change revision',13,'change_revision'),(44,'Can delete revision',13,'delete_revision'),(45,'Can view revision',13,'view_revision'),(46,'Can add group page permission',14,'add_grouppagepermission'),(47,'Can change group page permission',14,'change_grouppagepermission'),(48,'Can delete group page permission',14,'delete_grouppagepermission'),(49,'Can view group page permission',14,'view_grouppagepermission'),(50,'Can add page view restriction',15,'add_pageviewrestriction'),(51,'Can change page view restriction',15,'change_pageviewrestriction'),(52,'Can delete page view restriction',15,'delete_pageviewrestriction'),(53,'Can view page view restriction',15,'view_pageviewrestriction'),(54,'Can add workflow page',16,'add_workflowpage'),(55,'Can change workflow page',16,'change_workflowpage'),(56,'Can delete workflow page',16,'delete_workflowpage'),(57,'Can view workflow page',16,'view_workflowpage'),(58,'Can add workflow content type',17,'add_workflowcontenttype'),(59,'Can change workflow content type',17,'change_workflowcontenttype'),(60,'Can delete workflow content type',17,'delete_workflowcontenttype'),(61,'Can view workflow content type',17,'view_workflowcontenttype'),(62,'Can add workflow task order',18,'add_workflowtask'),(63,'Can change workflow task order',18,'change_workflowtask'),(64,'Can delete workflow task order',18,'delete_workflowtask'),(65,'Can view workflow task order',18,'view_workflowtask'),(66,'Can add task',19,'add_task'),(67,'Can change task',19,'change_task'),(68,'Can delete task',19,'delete_task'),(69,'Can view task',19,'view_task'),(70,'Can add workflow',20,'add_workflow'),(71,'Can change workflow',20,'change_workflow'),(72,'Can delete workflow',20,'delete_workflow'),(73,'Can view workflow',20,'view_workflow'),(74,'Can add Group approval task',4,'add_groupapprovaltask'),(75,'Can change Group approval task',4,'change_groupapprovaltask'),(76,'Can delete Group approval task',4,'delete_groupapprovaltask'),(77,'Can view Group approval task',4,'view_groupapprovaltask'),(78,'Can add Workflow state',21,'add_workflowstate'),(79,'Can change Workflow state',21,'change_workflowstate'),(80,'Can delete Workflow state',21,'delete_workflowstate'),(81,'Can view Workflow state',21,'view_workflowstate'),(82,'Can add Task state',22,'add_taskstate'),(83,'Can change Task state',22,'change_taskstate'),(84,'Can delete Task state',22,'delete_taskstate'),(85,'Can view Task state',22,'view_taskstate'),(86,'Can add page log entry',23,'add_pagelogentry'),(87,'Can change page log entry',23,'change_pagelogentry'),(88,'Can delete page log entry',23,'delete_pagelogentry'),(89,'Can view page log entry',23,'view_pagelogentry'),(90,'Can add comment',24,'add_comment'),(91,'Can change comment',24,'change_comment'),(92,'Can delete comment',24,'delete_comment'),(93,'Can view comment',24,'view_comment'),(94,'Can add comment reply',25,'add_commentreply'),(95,'Can change comment reply',25,'change_commentreply'),(96,'Can delete comment reply',25,'delete_commentreply'),(97,'Can view comment reply',25,'view_commentreply'),(98,'Can add page subscription',26,'add_pagesubscription'),(99,'Can change page subscription',26,'change_pagesubscription'),(100,'Can delete page subscription',26,'delete_pagesubscription'),(101,'Can view page subscription',26,'view_pagesubscription'),(102,'Can add document',27,'add_document'),(103,'Can change document',27,'change_document'),(104,'Can delete document',27,'delete_document'),(105,'Can choose document',27,'choose_document'),(106,'Can add image',28,'add_image'),(107,'Can change image',28,'change_image'),(108,'Can delete image',28,'delete_image'),(109,'Can choose image',28,'choose_image'),(110,'Can add home page',2,'add_homepage'),(111,'Can change home page',2,'change_homepage'),(112,'Can delete home page',2,'delete_homepage'),(113,'Can view home page',2,'view_homepage'),(114,'Can add form submission',29,'add_formsubmission'),(115,'Can change form submission',29,'change_formsubmission'),(116,'Can delete form submission',29,'delete_formsubmission'),(117,'Can view form submission',29,'view_formsubmission'),(118,'Can add redirect',30,'add_redirect'),(119,'Can change redirect',30,'change_redirect'),(120,'Can delete redirect',30,'delete_redirect'),(121,'Can view redirect',30,'view_redirect'),(122,'Can add embed',31,'add_embed'),(123,'Can change embed',31,'change_embed'),(124,'Can delete embed',31,'delete_embed'),(125,'Can view embed',31,'view_embed'),(126,'Can add user profile',32,'add_userprofile'),(127,'Can change user profile',32,'change_userprofile'),(128,'Can delete user profile',32,'delete_userprofile'),(129,'Can view user profile',32,'view_userprofile'),(130,'Can view document',27,'view_document'),(131,'Can view image',28,'view_image'),(132,'Can add rendition',33,'add_rendition'),(133,'Can change rendition',33,'change_rendition'),(134,'Can delete rendition',33,'delete_rendition'),(135,'Can view rendition',33,'view_rendition'),(136,'Can add index entry',34,'add_indexentry'),(137,'Can change index entry',34,'change_indexentry'),(138,'Can delete index entry',34,'delete_indexentry'),(139,'Can view index entry',34,'view_indexentry'),(140,'Can add editing session',35,'add_editingsession'),(141,'Can change editing session',35,'change_editingsession'),(142,'Can delete editing session',35,'delete_editingsession'),(143,'Can view editing session',35,'view_editingsession'),(144,'Can add tag',36,'add_tag'),(145,'Can change tag',36,'change_tag'),(146,'Can delete tag',36,'delete_tag'),(147,'Can view tag',36,'view_tag'),(148,'Can add tagged item',37,'add_taggeditem'),(149,'Can change tagged item',37,'change_taggeditem'),(150,'Can delete tagged item',37,'delete_taggeditem'),(151,'Can view tagged item',37,'view_taggeditem'),(152,'Can add log entry',38,'add_logentry'),(153,'Can change log entry',38,'change_logentry'),(154,'Can delete log entry',38,'delete_logentry'),(155,'Can view log entry',38,'view_logentry'),(156,'Can add permission',39,'add_permission'),(157,'Can change permission',39,'change_permission'),(158,'Can delete permission',39,'delete_permission'),(159,'Can view permission',39,'view_permission'),(160,'Can add group',40,'add_group'),(161,'Can change group',40,'change_group'),(162,'Can delete group',40,'delete_group'),(163,'Can view group',40,'view_group'),(164,'Can add user',41,'add_user'),(165,'Can change user',41,'change_user'),(166,'Can delete user',41,'delete_user'),(167,'Can view user',41,'view_user'),(168,'Can add content type',42,'add_contenttype'),(169,'Can change content type',42,'change_contenttype'),(170,'Can delete content type',42,'delete_contenttype'),(171,'Can view content type',42,'view_contenttype'),(172,'Can add session',43,'add_session'),(173,'Can change session',43,'change_session'),(174,'Can delete session',43,'delete_session'),(175,'Can view session',43,'view_session'),(176,'Can add Flex Page',44,'add_flexpage'),(177,'Can change Flex Page',44,'change_flexpage'),(178,'Can delete Flex Page',44,'delete_flexpage'),(179,'Can view Flex Page',44,'view_flexpage'),(180,'Can add home page carousel images',45,'add_homepagecarouselimages'),(181,'Can change home page carousel images',45,'change_homepagecarouselimages'),(182,'Can delete home page carousel images',45,'delete_homepagecarouselimages'),(183,'Can view home page carousel images',45,'view_homepagecarouselimages'),(184,'Can add social media settings',46,'add_socialmediasettings'),(185,'Can change social media settings',46,'change_socialmediasettings'),(186,'Can delete social media settings',46,'delete_socialmediasettings'),(187,'Can view social media settings',46,'view_socialmediasettings'),(188,'Can add subscribers',47,'add_subscribers'),(189,'Can change subscribers',47,'change_subscribers'),(190,'Can delete subscribers',47,'delete_subscribers'),(191,'Can view subscribers',47,'view_subscribers'),(192,'Can add subscriber',47,'add_subscriber'),(193,'Can change subscriber',47,'change_subscriber'),(194,'Can delete subscriber',47,'delete_subscriber'),(195,'Can view subscriber',47,'view_subscriber'),(196,'Can add blog listing page',48,'add_bloglistingpage'),(197,'Can change blog listing page',48,'change_bloglistingpage'),(198,'Can delete blog listing page',48,'delete_bloglistingpage'),(199,'Can view blog listing page',48,'view_bloglistingpage'),(200,'Can add blog detail page',49,'add_blogdetailpage'),(201,'Can change blog detail page',49,'change_blogdetailpage'),(202,'Can delete blog detail page',49,'delete_blogdetailpage'),(203,'Can view blog detail page',49,'view_blogdetailpage'),(204,'Can add Blog Author',50,'add_blogauthor'),(205,'Can change Blog Author',50,'change_blogauthor'),(206,'Can delete Blog Author',50,'delete_blogauthor'),(207,'Can view Blog Author',50,'view_blogauthor'),(208,'Can add blog author orderable',51,'add_blogauthororderable'),(209,'Can change blog author orderable',51,'change_blogauthororderable'),(210,'Can delete blog author orderable',51,'delete_blogauthororderable'),(211,'Can view blog author orderable',51,'view_blogauthororderable'),(212,'Can add Blog Category',52,'add_blogcategory'),(213,'Can change Blog Category',52,'change_blogcategory'),(214,'Can delete Blog Category',52,'delete_blogcategory'),(215,'Can view Blog Category',52,'view_blogcategory'),(216,'Can add article blog page',53,'add_articleblogpage'),(217,'Can change article blog page',53,'change_articleblogpage'),(218,'Can delete article blog page',53,'delete_articleblogpage'),(219,'Can view article blog page',53,'view_articleblogpage'),(220,'Can add video blog page',54,'add_videoblogpage'),(221,'Can change video blog page',54,'change_videoblogpage'),(222,'Can delete video blog page',54,'delete_videoblogpage'),(223,'Can view video blog page',54,'view_videoblogpage'),(224,'Can add menu',55,'add_menu'),(225,'Can change menu',55,'change_menu'),(226,'Can delete menu',55,'delete_menu'),(227,'Can view menu',55,'view_menu'),(228,'Can add menu item',56,'add_menuitem'),(229,'Can change menu item',56,'change_menuitem'),(230,'Can delete menu item',56,'delete_menuitem'),(231,'Can view menu item',56,'view_menuitem'),(232,'Can add form field',58,'add_formfield'),(233,'Can change form field',58,'change_formfield'),(234,'Can delete form field',58,'delete_formfield'),(235,'Can view form field',58,'view_formfield'),(236,'Can add contact page',57,'add_contactpage'),(237,'Can change contact page',57,'change_contactpage'),(238,'Can delete contact page',57,'delete_contactpage'),(239,'Can view contact page',57,'view_contactpage'),(240,'Can add blog page tags',59,'add_blogpagetags'),(241,'Can change blog page tags',59,'change_blogpagetags'),(242,'Can delete blog page tags',59,'delete_blogpagetags'),(243,'Can view blog page tags',59,'view_blogpagetags'),(244,'Can add email address',60,'add_emailaddress'),(245,'Can change email address',60,'change_emailaddress'),(246,'Can delete email address',60,'delete_emailaddress'),(247,'Can view email address',60,'view_emailaddress'),(248,'Can add email confirmation',61,'add_emailconfirmation'),(249,'Can change email confirmation',61,'change_emailconfirmation'),(250,'Can delete email confirmation',61,'delete_emailconfirmation'),(251,'Can view email confirmation',61,'view_emailconfirmation'),(252,'Can add social account',62,'add_socialaccount'),(253,'Can change social account',62,'change_socialaccount'),(254,'Can delete social account',62,'delete_socialaccount'),(255,'Can view social account',62,'view_socialaccount'),(256,'Can add social application',63,'add_socialapp'),(257,'Can change social application',63,'change_socialapp'),(258,'Can delete social application',63,'delete_socialapp'),(259,'Can view social application',63,'view_socialapp'),(260,'Can add social application token',64,'add_socialtoken'),(261,'Can change social application token',64,'change_socialtoken'),(262,'Can delete social application token',64,'delete_socialtoken'),(263,'Can view social application token',64,'view_socialtoken');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$vt4P2ClH4B6Vv3FOe5xAh8$8UFEFGVC2oWqbp/W86YG9VWV6DpAYL56Lyp9t1nPft8=','2026-03-07 15:53:08.918871',1,'omen','','','shefat.global@gmail.com',1,1,'2026-02-17 19:35:54.993306'),(2,'pbkdf2_sha256$870000$AGakXqQTDiLoqdaEuhhI4T$ZPKDa956lYXDr06PDuN7Z1rygksxDa2Fe0qaa74bKIQ=','2026-03-06 17:07:22.279517',0,'dekylin','','','lozytunaty@mailinator.com',0,1,'2026-03-06 16:49:12.501895');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_articleblogpage`
--

DROP TABLE IF EXISTS `blog_articleblogpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_articleblogpage` (
  `blogdetailpage_ptr_id` int NOT NULL,
  `subtitle` varchar(100) DEFAULT NULL,
  `intro_image_id` int DEFAULT NULL,
  PRIMARY KEY (`blogdetailpage_ptr_id`),
  KEY `blog_articleblogpage_intro_image_id_93b37b2c_fk_wagtailim` (`intro_image_id`),
  CONSTRAINT `blog_articleblogpage_blogdetailpage_ptr_i_a6d91f38_fk_blog_blog` FOREIGN KEY (`blogdetailpage_ptr_id`) REFERENCES `blog_blogdetailpage` (`page_ptr_id`),
  CONSTRAINT `blog_articleblogpage_intro_image_id_93b37b2c_fk_wagtailim` FOREIGN KEY (`intro_image_id`) REFERENCES `wagtailimages_image` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_articleblogpage`
--

LOCK TABLES `blog_articleblogpage` WRITE;
/*!40000 ALTER TABLE `blog_articleblogpage` DISABLE KEYS */;
INSERT INTO `blog_articleblogpage` VALUES (8,'Welcome to my subtitle',9);
/*!40000 ALTER TABLE `blog_articleblogpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogauthor`
--

DROP TABLE IF EXISTS `blog_blogauthor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_blogauthor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `website` varchar(200) DEFAULT NULL,
  `image_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_blogauthor_image_id_39c7af32_fk_wagtailimages_image_id` (`image_id`),
  CONSTRAINT `blog_blogauthor_image_id_39c7af32_fk_wagtailimages_image_id` FOREIGN KEY (`image_id`) REFERENCES `wagtailimages_image` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogauthor`
--

LOCK TABLES `blog_blogauthor` WRITE;
/*!40000 ALTER TABLE `blog_blogauthor` DISABLE KEYS */;
INSERT INTO `blog_blogauthor` VALUES (1,'Shefat','https://shefat.dataceil.com/',10),(2,'Engr Robin','https://dataceil.com/',10);
/*!40000 ALTER TABLE `blog_blogauthor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogauthororderable`
--

DROP TABLE IF EXISTS `blog_blogauthororderable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_blogauthororderable` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sort_order` int DEFAULT NULL,
  `author_id` bigint NOT NULL,
  `page_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_blogauthororder_author_id_90b431b1_fk_blog_blog` (`author_id`),
  KEY `blog_blogauthororderable_page_id_49f1b5af` (`page_id`),
  CONSTRAINT `blog_blogauthororder_author_id_90b431b1_fk_blog_blog` FOREIGN KEY (`author_id`) REFERENCES `blog_blogauthor` (`id`),
  CONSTRAINT `blog_blogauthororder_page_id_49f1b5af_fk_blog_blog` FOREIGN KEY (`page_id`) REFERENCES `blog_blogdetailpage` (`page_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogauthororderable`
--

LOCK TABLES `blog_blogauthororderable` WRITE;
/*!40000 ALTER TABLE `blog_blogauthororderable` DISABLE KEYS */;
INSERT INTO `blog_blogauthororderable` VALUES (1,1,1,6),(2,0,2,6),(3,0,1,7),(4,0,1,8),(5,0,1,9);
/*!40000 ALTER TABLE `blog_blogauthororderable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogcategory`
--

DROP TABLE IF EXISTS `blog_blogcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_blogcategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_blogcategory_slug_7996de7a` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogcategory`
--

LOCK TABLES `blog_blogcategory` WRITE;
/*!40000 ALTER TABLE `blog_blogcategory` DISABLE KEYS */;
INSERT INTO `blog_blogcategory` VALUES (1,'Coding','coding'),(2,'Website','website'),(3,'Apps','apps');
/*!40000 ALTER TABLE `blog_blogcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogdetailpage`
--

DROP TABLE IF EXISTS `blog_blogdetailpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_blogdetailpage` (
  `page_ptr_id` int NOT NULL,
  `custom_title` varchar(100) NOT NULL,
  `content` json DEFAULT NULL,
  `banner_image_id` int DEFAULT NULL,
  PRIMARY KEY (`page_ptr_id`),
  KEY `blog_blogdetailpage_banner_image_id_5378dbf6_fk_wagtailim` (`banner_image_id`),
  CONSTRAINT `blog_blogdetailpage_banner_image_id_5378dbf6_fk_wagtailim` FOREIGN KEY (`banner_image_id`) REFERENCES `wagtailimages_image` (`id`),
  CONSTRAINT `blog_blogdetailpage_page_ptr_id_fb1104b9_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogdetailpage`
--

LOCK TABLES `blog_blogdetailpage` WRITE;
/*!40000 ALTER TABLE `blog_blogdetailpage` DISABLE KEYS */;
INSERT INTO `blog_blogdetailpage` VALUES (6,'Blog Post #1 - Custom','[{\"id\": \"9356bfc4-3dbc-436e-b837-34b683aed6a8\", \"type\": \"full_richtext\", \"value\": \"<h2 data-block-key=\\\"8vumk\\\">Hello World</h2><p data-block-key=\\\"4817b\\\">This is a simple bloc post from a full rich text himself</p>\"}, {\"id\": \"da16431e-d11c-4255-83e0-db61822645ac\", \"type\": \"cta\", \"value\": {\"text\": \"<p data-block-key=\\\"u6p3y\\\">Find out more </p>\", \"title\": \"Learn more\", \"button_url\": \"https://dataceil.com\", \"button_page\": null, \"button_text\": \"Learn More\"}}]',1),(7,'Blog Post #2 - Custom','[{\"id\": \"9356bfc4-3dbc-436e-b837-34b683aed6a8\", \"type\": \"full_richtext\", \"value\": \"<h2 data-block-key=\\\"8vumk\\\">Hello World2</h2><p data-block-key=\\\"4817b\\\">This is a simple bloc post from a full rich text himself</p>\"}]',2),(8,'Custom Article Blog Page','[{\"id\": \"0579c429-8383-4495-9fd1-2294edfe6159\", \"type\": \"title_and_text\", \"value\": {\"text\": \"text in here\", \"title\": \"title in here\"}}, {\"id\": \"14e8b794-905e-45c2-b09d-04ee81daf019\", \"type\": \"full_richtext\", \"value\": \"<p data-block-key=\\\"6nhdn\\\"><div class=\\\"d-block text-center\\\"><code>ddd</code></div></p>\"}]',8),(9,'Custom Video title','[{\"id\": \"55afe792-a7d7-429a-bb22-925c4661a549\", \"type\": \"title_and_text\", \"value\": {\"text\": \"Text here\", \"title\": \"Title here\"}}]',NULL);
/*!40000 ALTER TABLE `blog_blogdetailpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogdetailpage_categories`
--

DROP TABLE IF EXISTS `blog_blogdetailpage_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_blogdetailpage_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `blogdetailpage_id` int NOT NULL,
  `blogcategory_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_blogdetailpage_cate_blogdetailpage_id_blogca_ed683f86_uniq` (`blogdetailpage_id`,`blogcategory_id`),
  KEY `blog_blogdetailpage__blogcategory_id_eb7048cc_fk_blog_blog` (`blogcategory_id`),
  CONSTRAINT `blog_blogdetailpage__blogcategory_id_eb7048cc_fk_blog_blog` FOREIGN KEY (`blogcategory_id`) REFERENCES `blog_blogcategory` (`id`),
  CONSTRAINT `blog_blogdetailpage__blogdetailpage_id_a268be0c_fk_blog_blog` FOREIGN KEY (`blogdetailpage_id`) REFERENCES `blog_blogdetailpage` (`page_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogdetailpage_categories`
--

LOCK TABLES `blog_blogdetailpage_categories` WRITE;
/*!40000 ALTER TABLE `blog_blogdetailpage_categories` DISABLE KEYS */;
INSERT INTO `blog_blogdetailpage_categories` VALUES (1,6,1),(2,7,3),(3,8,1);
/*!40000 ALTER TABLE `blog_blogdetailpage_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_bloglistingpage`
--

DROP TABLE IF EXISTS `blog_bloglistingpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_bloglistingpage` (
  `page_ptr_id` int NOT NULL,
  `custom_title` varchar(100) NOT NULL,
  PRIMARY KEY (`page_ptr_id`),
  CONSTRAINT `blog_bloglistingpage_page_ptr_id_7666e38e_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_bloglistingpage`
--

LOCK TABLES `blog_bloglistingpage` WRITE;
/*!40000 ALTER TABLE `blog_bloglistingpage` DISABLE KEYS */;
INSERT INTO `blog_bloglistingpage` VALUES (5,'Startuplife Blog');
/*!40000 ALTER TABLE `blog_bloglistingpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogpagetags`
--

DROP TABLE IF EXISTS `blog_blogpagetags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_blogpagetags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content_object_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_blogpagetags_tag_id_9c11402e_fk_taggit_tag_id` (`tag_id`),
  KEY `blog_blogpagetags_content_object_id_8feaf6b8` (`content_object_id`),
  CONSTRAINT `blog_blogpagetags_content_object_id_8feaf6b8_fk_blog_blog` FOREIGN KEY (`content_object_id`) REFERENCES `blog_blogdetailpage` (`page_ptr_id`),
  CONSTRAINT `blog_blogpagetags_tag_id_9c11402e_fk_taggit_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `taggit_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogpagetags`
--

LOCK TABLES `blog_blogpagetags` WRITE;
/*!40000 ALTER TABLE `blog_blogpagetags` DISABLE KEYS */;
INSERT INTO `blog_blogpagetags` VALUES (8,9,5),(9,8,5),(10,6,5);
/*!40000 ALTER TABLE `blog_blogpagetags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_videoblogpage`
--

DROP TABLE IF EXISTS `blog_videoblogpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_videoblogpage` (
  `blogdetailpage_ptr_id` int NOT NULL,
  `youtube_video_id` varchar(30) NOT NULL,
  PRIMARY KEY (`blogdetailpage_ptr_id`),
  CONSTRAINT `blog_videoblogpage_blogdetailpage_ptr_i_4977d929_fk_blog_blog` FOREIGN KEY (`blogdetailpage_ptr_id`) REFERENCES `blog_blogdetailpage` (`page_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_videoblogpage`
--

LOCK TABLES `blog_videoblogpage` WRITE;
/*!40000 ALTER TABLE `blog_videoblogpage` DISABLE KEYS */;
INSERT INTO `blog_videoblogpage` VALUES (9,'0Tg0wAvr7U4?si=4WA177hb117jwzR');
/*!40000 ALTER TABLE `blog_videoblogpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_contactpage`
--

DROP TABLE IF EXISTS `contact_contactpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_contactpage` (
  `page_ptr_id` int NOT NULL,
  `to_address` varchar(255) NOT NULL,
  `from_address` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `intro` longtext NOT NULL,
  `thank_you_text` longtext NOT NULL,
  PRIMARY KEY (`page_ptr_id`),
  CONSTRAINT `contact_contactpage_page_ptr_id_143c93c1_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_contactpage`
--

LOCK TABLES `contact_contactpage` WRITE;
/*!40000 ALTER TABLE `contact_contactpage` DISABLE KEYS */;
INSERT INTO `contact_contactpage` VALUES (10,'ishefat@gmail.com','shefat@dataceil.com','Contact From Submission','<p data-block-key=\"o19o2\">Hello this is intro text </p>','<p data-block-key=\"4zl8n\">Thank you for submitting this for. We\'ll be in touch shortly</p>');
/*!40000 ALTER TABLE `contact_contactpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_formfield`
--

DROP TABLE IF EXISTS `contact_formfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_formfield` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sort_order` int DEFAULT NULL,
  `clean_name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `field_type` varchar(16) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `choices` longtext NOT NULL,
  `default_value` longtext NOT NULL,
  `help_text` varchar(255) NOT NULL,
  `page_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_formfield_page_id_3ee48e6d` (`page_id`),
  CONSTRAINT `contact_formfield_page_id_3ee48e6d_fk_contact_c` FOREIGN KEY (`page_id`) REFERENCES `contact_contactpage` (`page_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_formfield`
--

LOCK TABLES `contact_formfield` WRITE;
/*!40000 ALTER TABLE `contact_formfield` DISABLE KEYS */;
INSERT INTO `contact_formfield` VALUES (1,0,'name','Name','singleline',1,'','','Enter your full name',10),(2,1,'email','Email','email',1,'','','Enter your email address',10),(3,2,'message','Message','multiline',1,'','','Enter your message',10);
/*!40000 ALTER TABLE `contact_formfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (60,'account','emailaddress'),(61,'account','emailconfirmation'),(38,'admin','logentry'),(40,'auth','group'),(39,'auth','permission'),(41,'auth','user'),(53,'blog','articleblogpage'),(50,'blog','blogauthor'),(51,'blog','blogauthororderable'),(52,'blog','blogcategory'),(49,'blog','blogdetailpage'),(48,'blog','bloglistingpage'),(59,'blog','blogpagetags'),(54,'blog','videoblogpage'),(57,'contact','contactpage'),(58,'contact','formfield'),(42,'contenttypes','contenttype'),(44,'flex','flexpage'),(2,'home','homepage'),(45,'home','homepagecarouselimages'),(55,'menus','menu'),(56,'menus','menuitem'),(43,'sessions','session'),(46,'site_settings','socialmediasettings'),(62,'socialaccount','socialaccount'),(63,'socialaccount','socialapp'),(64,'socialaccount','socialtoken'),(47,'subscribers','subscriber'),(36,'taggit','tag'),(37,'taggit','taggeditem'),(3,'wagtailadmin','admin'),(35,'wagtailadmin','editingsession'),(9,'wagtailcore','collection'),(8,'wagtailcore','collectionviewrestriction'),(24,'wagtailcore','comment'),(25,'wagtailcore','commentreply'),(4,'wagtailcore','groupapprovaltask'),(10,'wagtailcore','groupcollectionpermission'),(14,'wagtailcore','grouppagepermission'),(5,'wagtailcore','locale'),(7,'wagtailcore','modellogentry'),(1,'wagtailcore','page'),(23,'wagtailcore','pagelogentry'),(26,'wagtailcore','pagesubscription'),(15,'wagtailcore','pageviewrestriction'),(12,'wagtailcore','referenceindex'),(13,'wagtailcore','revision'),(6,'wagtailcore','site'),(19,'wagtailcore','task'),(22,'wagtailcore','taskstate'),(11,'wagtailcore','uploadedfile'),(20,'wagtailcore','workflow'),(17,'wagtailcore','workflowcontenttype'),(16,'wagtailcore','workflowpage'),(21,'wagtailcore','workflowstate'),(18,'wagtailcore','workflowtask'),(27,'wagtaildocs','document'),(31,'wagtailembeds','embed'),(29,'wagtailforms','formsubmission'),(28,'wagtailimages','image'),(33,'wagtailimages','rendition'),(30,'wagtailredirects','redirect'),(34,'wagtailsearch','indexentry'),(32,'wagtailusers','userprofile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-02-17 19:30:32.637885'),(2,'auth','0001_initial','2026-02-17 19:30:33.644504'),(3,'admin','0001_initial','2026-02-17 19:30:33.849572'),(4,'admin','0002_logentry_remove_auto_add','2026-02-17 19:30:33.865536'),(5,'admin','0003_logentry_add_action_flag_choices','2026-02-17 19:30:33.865536'),(6,'contenttypes','0002_remove_content_type_name','2026-02-17 19:30:34.008011'),(7,'auth','0002_alter_permission_name_max_length','2026-02-17 19:30:34.087280'),(8,'auth','0003_alter_user_email_max_length','2026-02-17 19:30:34.119335'),(9,'auth','0004_alter_user_username_opts','2026-02-17 19:30:34.119335'),(10,'auth','0005_alter_user_last_login_null','2026-02-17 19:30:34.182880'),(11,'auth','0006_require_contenttypes_0002','2026-02-17 19:30:34.203004'),(12,'auth','0007_alter_validators_add_error_messages','2026-02-17 19:30:34.210768'),(13,'auth','0008_alter_user_username_max_length','2026-02-17 19:30:34.293690'),(14,'auth','0009_alter_user_last_name_max_length','2026-02-17 19:30:34.389272'),(15,'auth','0010_alter_group_name_max_length','2026-02-17 19:30:34.406526'),(16,'auth','0011_update_proxy_permissions','2026-02-17 19:30:34.422584'),(17,'auth','0012_alter_user_first_name_max_length','2026-02-17 19:30:34.503294'),(18,'wagtailcore','0001_initial','2026-02-17 19:30:35.566846'),(19,'wagtailcore','0002_initial_data','2026-02-17 19:30:35.582550'),(20,'wagtailcore','0003_add_uniqueness_constraint_on_group_page_permission','2026-02-17 19:30:35.582550'),(21,'wagtailcore','0004_page_locked','2026-02-17 19:30:35.582550'),(22,'wagtailcore','0005_add_page_lock_permission_to_moderators','2026-02-17 19:30:35.598267'),(23,'wagtailcore','0006_add_lock_page_permission','2026-02-17 19:30:35.598267'),(24,'wagtailcore','0007_page_latest_revision_created_at','2026-02-17 19:30:35.598267'),(25,'wagtailcore','0008_populate_latest_revision_created_at','2026-02-17 19:30:35.614059'),(26,'wagtailcore','0009_remove_auto_now_add_from_pagerevision_created_at','2026-02-17 19:30:35.614059'),(27,'wagtailcore','0010_change_page_owner_to_null_on_delete','2026-02-17 19:30:35.614059'),(28,'wagtailcore','0011_page_first_published_at','2026-02-17 19:30:35.630115'),(29,'wagtailcore','0012_extend_page_slug_field','2026-02-17 19:30:35.630115'),(30,'wagtailcore','0013_update_golive_expire_help_text','2026-02-17 19:30:35.630115'),(31,'wagtailcore','0014_add_verbose_name','2026-02-17 19:30:35.646082'),(32,'wagtailcore','0015_add_more_verbose_names','2026-02-17 19:30:35.646082'),(33,'wagtailcore','0016_change_page_url_path_to_text_field','2026-02-17 19:30:35.646082'),(34,'wagtailcore','0017_change_edit_page_permission_description','2026-02-17 19:30:35.661957'),(35,'wagtailcore','0018_pagerevision_submitted_for_moderation_index','2026-02-17 19:30:35.693854'),(36,'wagtailcore','0019_verbose_names_cleanup','2026-02-17 19:30:35.709578'),(37,'wagtailcore','0020_add_index_on_page_first_published_at','2026-02-17 19:30:35.772776'),(38,'wagtailcore','0021_capitalizeverbose','2026-02-17 19:30:35.916252'),(39,'wagtailcore','0022_add_site_name','2026-02-17 19:30:35.948133'),(40,'wagtailcore','0023_alter_page_revision_on_delete_behaviour','2026-02-17 19:30:35.964170'),(41,'wagtailcore','0024_collection','2026-02-17 19:30:36.011864'),(42,'wagtailcore','0025_collection_initial_data','2026-02-17 19:30:36.027538'),(43,'wagtailcore','0026_group_collection_permission','2026-02-17 19:30:36.337028'),(44,'wagtailcore','0027_fix_collection_path_collation','2026-02-17 19:30:36.349142'),(45,'wagtailcore','0024_alter_page_content_type_on_delete_behaviour','2026-02-17 19:30:36.349142'),(46,'wagtailcore','0028_merge','2026-02-17 19:30:36.361734'),(47,'wagtailcore','0029_unicode_slugfield_dj19','2026-02-17 19:30:36.367139'),(48,'wagtailcore','0030_index_on_pagerevision_created_at','2026-02-17 19:30:36.393692'),(49,'wagtailcore','0031_add_page_view_restriction_types','2026-02-17 19:30:36.695310'),(50,'wagtailcore','0032_add_bulk_delete_page_permission','2026-02-17 19:30:36.711288'),(51,'wagtailcore','0033_remove_golive_expiry_help_text','2026-02-17 19:30:36.727096'),(52,'wagtailcore','0034_page_live_revision','2026-02-17 19:30:36.845562'),(53,'wagtailcore','0035_page_last_published_at','2026-02-17 19:30:36.885833'),(54,'wagtailcore','0036_populate_page_last_published_at','2026-02-17 19:30:36.885833'),(55,'wagtailcore','0037_set_page_owner_editable','2026-02-17 19:30:36.905333'),(56,'wagtailcore','0038_make_first_published_at_editable','2026-02-17 19:30:36.917422'),(57,'wagtailcore','0039_collectionviewrestriction','2026-02-17 19:30:37.267507'),(58,'wagtailcore','0040_page_draft_title','2026-02-17 19:30:37.330998'),(59,'home','0001_initial','2026-02-17 19:30:37.438354'),(60,'home','0002_create_homepage','2026-02-17 19:30:37.457746'),(61,'sessions','0001_initial','2026-02-17 19:30:37.505627'),(62,'taggit','0001_initial','2026-02-17 19:30:37.775672'),(63,'taggit','0002_auto_20150616_2121','2026-02-17 19:30:37.807657'),(64,'taggit','0003_taggeditem_add_unique_index','2026-02-17 19:30:37.823630'),(65,'taggit','0004_alter_taggeditem_content_type_alter_taggeditem_tag','2026-02-17 19:30:37.855719'),(66,'taggit','0005_auto_20220424_2025','2026-02-17 19:30:37.855719'),(67,'taggit','0006_rename_taggeditem_content_type_object_id_taggit_tagg_content_8fc721_idx','2026-02-17 19:30:37.903244'),(68,'wagtailadmin','0001_create_admin_access_permissions','2026-02-17 19:30:37.950671'),(69,'wagtailadmin','0002_admin','2026-02-17 19:30:37.950671'),(70,'wagtailadmin','0003_admin_managed','2026-02-17 19:30:37.981979'),(71,'wagtailadmin','0004_editingsession','2026-02-17 19:30:38.204095'),(72,'wagtailadmin','0005_editingsession_is_editing','2026-02-17 19:30:38.299667'),(73,'wagtailcore','0041_group_collection_permissions_verbose_name_plural','2026-02-17 19:30:38.299667'),(74,'wagtailcore','0042_index_on_pagerevision_approved_go_live_at','2026-02-17 19:30:38.347234'),(75,'wagtailcore','0043_lock_fields','2026-02-17 19:30:38.506186'),(76,'wagtailcore','0044_add_unlock_grouppagepermission','2026-02-17 19:30:38.516518'),(77,'wagtailcore','0045_assign_unlock_grouppagepermission','2026-02-17 19:30:38.538055'),(78,'wagtailcore','0046_site_name_remove_null','2026-02-17 19:30:38.665828'),(79,'wagtailcore','0047_add_workflow_models','2026-02-17 19:30:40.507072'),(80,'wagtailcore','0048_add_default_workflows','2026-02-17 19:30:40.536221'),(81,'wagtailcore','0049_taskstate_finished_by','2026-02-17 19:30:40.663246'),(82,'wagtailcore','0050_workflow_rejected_to_needs_changes','2026-02-17 19:30:40.679089'),(83,'wagtailcore','0051_taskstate_comment','2026-02-17 19:30:40.781772'),(84,'wagtailcore','0052_pagelogentry','2026-02-17 19:30:41.030347'),(85,'wagtailcore','0053_locale_model','2026-02-17 19:30:41.062355'),(86,'wagtailcore','0054_initial_locale','2026-02-17 19:30:41.094221'),(87,'wagtailcore','0055_page_locale_fields','2026-02-17 19:30:41.332960'),(88,'wagtailcore','0056_page_locale_fields_populate','2026-02-17 19:30:41.348659'),(89,'wagtailcore','0057_page_locale_fields_notnull','2026-02-17 19:30:41.948488'),(90,'wagtailcore','0058_page_alias_of','2026-02-17 19:30:42.111841'),(91,'wagtailcore','0059_apply_collection_ordering','2026-02-17 19:30:42.126959'),(92,'wagtailcore','0060_fix_workflow_unique_constraint','2026-02-17 19:30:42.158485'),(93,'wagtailcore','0061_change_promote_tab_helpt_text_and_verbose_names','2026-02-17 19:30:42.174350'),(94,'wagtailcore','0062_comment_models_and_pagesubscription','2026-02-17 19:30:43.048560'),(95,'wagtailcore','0063_modellogentry','2026-02-17 19:30:43.285866'),(96,'wagtailcore','0064_log_timestamp_indexes','2026-02-17 19:30:43.347732'),(97,'wagtailcore','0065_log_entry_uuid','2026-02-17 19:30:43.571254'),(98,'wagtailcore','0066_collection_management_permissions','2026-02-17 19:30:43.587237'),(99,'wagtailcore','0067_alter_pagerevision_content_json','2026-02-17 19:30:43.778607'),(100,'wagtailcore','0068_log_entry_empty_object','2026-02-17 19:30:43.793764'),(101,'wagtailcore','0069_log_entry_jsonfield','2026-02-17 19:30:44.158258'),(102,'wagtailcore','0070_rename_pagerevision_revision','2026-02-17 19:30:45.238634'),(103,'wagtailcore','0071_populate_revision_content_type','2026-02-17 19:30:45.254386'),(104,'wagtailcore','0072_alter_revision_content_type_notnull','2026-02-17 19:30:45.761822'),(105,'wagtailcore','0073_page_latest_revision','2026-02-17 19:30:46.000574'),(106,'wagtailcore','0074_revision_object_str','2026-02-17 19:30:46.143129'),(107,'wagtailcore','0075_populate_latest_revision_and_revision_object_str','2026-02-17 19:30:46.174531'),(108,'wagtailcore','0076_modellogentry_revision','2026-02-17 19:30:46.317328'),(109,'wagtailcore','0077_alter_revision_user','2026-02-17 19:30:46.335373'),(110,'wagtailcore','0078_referenceindex','2026-02-17 19:30:46.650274'),(111,'wagtailcore','0079_rename_taskstate_page_revision','2026-02-17 19:30:46.808443'),(112,'wagtailcore','0080_generic_workflowstate','2026-02-17 19:30:47.443062'),(113,'wagtailcore','0081_populate_workflowstate_content_type','2026-02-17 19:30:47.459060'),(114,'wagtailcore','0082_alter_workflowstate_content_type_notnull','2026-02-17 19:30:47.902754'),(115,'wagtailcore','0083_workflowcontenttype','2026-02-17 19:30:48.156115'),(116,'wagtailcore','0084_add_default_page_permissions','2026-02-17 19:30:48.172957'),(117,'wagtailcore','0085_add_grouppagepermission_permission','2026-02-17 19:30:48.392772'),(118,'wagtailcore','0086_populate_grouppagepermission_permission','2026-02-17 19:30:48.456778'),(119,'wagtailcore','0087_alter_grouppagepermission_unique_together_and_more','2026-02-17 19:30:48.726247'),(120,'wagtailcore','0088_fix_log_entry_json_timestamps','2026-02-17 19:30:48.758044'),(121,'wagtailcore','0089_log_entry_data_json_null_to_object','2026-02-17 19:30:48.773923'),(122,'wagtailcore','0090_remove_grouppagepermission_permission_type','2026-02-17 19:30:49.185890'),(123,'wagtailcore','0091_remove_revision_submitted_for_moderation','2026-02-17 19:30:49.299777'),(124,'wagtailcore','0092_alter_collectionviewrestriction_password_and_more','2026-02-17 19:30:49.330314'),(125,'wagtailcore','0093_uploadedfile','2026-02-17 19:30:49.534336'),(126,'wagtailcore','0094_alter_page_locale','2026-02-17 19:30:49.555700'),(127,'wagtaildocs','0001_initial','2026-02-17 19:30:49.681512'),(128,'wagtaildocs','0002_initial_data','2026-02-17 19:30:49.708502'),(129,'wagtaildocs','0003_add_verbose_names','2026-02-17 19:30:49.748516'),(130,'wagtaildocs','0004_capitalizeverbose','2026-02-17 19:30:49.817611'),(131,'wagtaildocs','0005_document_collection','2026-02-17 19:30:49.929682'),(132,'wagtaildocs','0006_copy_document_permissions_to_collections','2026-02-17 19:30:49.961213'),(133,'wagtaildocs','0005_alter_uploaded_by_user_on_delete_action','2026-02-17 19:30:49.980911'),(134,'wagtaildocs','0007_merge','2026-02-17 19:30:49.982915'),(135,'wagtaildocs','0008_document_file_size','2026-02-17 19:30:50.135651'),(136,'wagtaildocs','0009_document_verbose_name_plural','2026-02-17 19:30:50.164832'),(137,'wagtaildocs','0010_document_file_hash','2026-02-17 19:30:50.293569'),(138,'wagtaildocs','0011_add_choose_permissions','2026-02-17 19:30:50.356805'),(139,'wagtaildocs','0012_uploadeddocument','2026-02-17 19:30:50.470174'),(140,'wagtaildocs','0013_delete_uploadeddocument','2026-02-17 19:30:50.501015'),(141,'wagtaildocs','0014_alter_document_file_size','2026-02-17 19:30:50.594600'),(142,'wagtailembeds','0001_initial','2026-02-17 19:30:50.658052'),(143,'wagtailembeds','0002_add_verbose_names','2026-02-17 19:30:50.664854'),(144,'wagtailembeds','0003_capitalizeverbose','2026-02-17 19:30:50.664854'),(145,'wagtailembeds','0004_embed_verbose_name_plural','2026-02-17 19:30:50.676172'),(146,'wagtailembeds','0005_specify_thumbnail_url_max_length','2026-02-17 19:30:50.689974'),(147,'wagtailembeds','0006_add_embed_hash','2026-02-17 19:30:50.753417'),(148,'wagtailembeds','0007_populate_hash','2026-02-17 19:30:50.785422'),(149,'wagtailembeds','0008_allow_long_urls','2026-02-17 19:30:51.309663'),(150,'wagtailembeds','0009_embed_cache_until','2026-02-17 19:30:51.407882'),(151,'wagtailforms','0001_initial','2026-02-17 19:30:51.534010'),(152,'wagtailforms','0002_add_verbose_names','2026-02-17 19:30:51.553465'),(153,'wagtailforms','0003_capitalizeverbose','2026-02-17 19:30:51.567399'),(154,'wagtailforms','0004_add_verbose_name_plural','2026-02-17 19:30:51.583818'),(155,'wagtailforms','0005_alter_formsubmission_form_data','2026-02-17 19:30:51.658045'),(156,'wagtailimages','0001_initial','2026-02-17 19:30:52.213972'),(157,'wagtailimages','0002_initial_data','2026-02-17 19:30:52.229652'),(158,'wagtailimages','0003_fix_focal_point_fields','2026-02-17 19:30:52.229652'),(159,'wagtailimages','0004_make_focal_point_key_not_nullable','2026-02-17 19:30:52.229652'),(160,'wagtailimages','0005_make_filter_spec_unique','2026-02-17 19:30:52.245347'),(161,'wagtailimages','0006_add_verbose_names','2026-02-17 19:30:52.245347'),(162,'wagtailimages','0007_image_file_size','2026-02-17 19:30:52.261128'),(163,'wagtailimages','0008_image_created_at_index','2026-02-17 19:30:52.261128'),(164,'wagtailimages','0009_capitalizeverbose','2026-02-17 19:30:52.261128'),(165,'wagtailimages','0010_change_on_delete_behaviour','2026-02-17 19:30:52.276807'),(166,'wagtailimages','0011_image_collection','2026-02-17 19:30:52.276807'),(167,'wagtailimages','0012_copy_image_permissions_to_collections','2026-02-17 19:30:52.276807'),(168,'wagtailimages','0013_make_rendition_upload_callable','2026-02-17 19:30:52.292890'),(169,'wagtailimages','0014_add_filter_spec_field','2026-02-17 19:30:52.292890'),(170,'wagtailimages','0015_fill_filter_spec_field','2026-02-17 19:30:52.308589'),(171,'wagtailimages','0016_deprecate_rendition_filter_relation','2026-02-17 19:30:52.308589'),(172,'wagtailimages','0017_reduce_focal_point_key_max_length','2026-02-17 19:30:52.308589'),(173,'wagtailimages','0018_remove_rendition_filter','2026-02-17 19:30:52.324326'),(174,'wagtailimages','0019_delete_filter','2026-02-17 19:30:52.324326'),(175,'wagtailimages','0020_add-verbose-name','2026-02-17 19:30:52.340038'),(176,'wagtailimages','0021_image_file_hash','2026-02-17 19:30:52.340038'),(177,'wagtailimages','0022_uploadedimage','2026-02-17 19:30:52.466433'),(178,'wagtailimages','0023_add_choose_permissions','2026-02-17 19:30:52.568684'),(179,'wagtailimages','0024_index_image_file_hash','2026-02-17 19:30:52.610444'),(180,'wagtailimages','0025_alter_image_file_alter_rendition_file','2026-02-17 19:30:52.631934'),(181,'wagtailimages','0026_delete_uploadedimage','2026-02-17 19:30:52.641985'),(182,'wagtailimages','0027_image_description','2026-02-17 19:30:52.759181'),(183,'wagtailredirects','0001_initial','2026-02-17 19:30:52.990929'),(184,'wagtailredirects','0002_add_verbose_names','2026-02-17 19:30:53.032483'),(185,'wagtailredirects','0003_make_site_field_editable','2026-02-17 19:30:53.054458'),(186,'wagtailredirects','0004_set_unique_on_path_and_site','2026-02-17 19:30:53.180791'),(187,'wagtailredirects','0005_capitalizeverbose','2026-02-17 19:30:53.244778'),(188,'wagtailredirects','0006_redirect_increase_max_length','2026-02-17 19:30:53.260495'),(189,'wagtailredirects','0007_add_autocreate_fields','2026-02-17 19:30:53.548589'),(190,'wagtailredirects','0008_add_verbose_name_plural','2026-02-17 19:30:53.566892'),(191,'wagtailsearch','0001_initial','2026-02-17 19:30:53.942551'),(192,'wagtailsearch','0002_add_verbose_names','2026-02-17 19:30:54.028178'),(193,'wagtailsearch','0003_remove_editors_pick','2026-02-17 19:30:54.037714'),(194,'wagtailsearch','0004_querydailyhits_verbose_name_plural','2026-02-17 19:30:54.037714'),(195,'wagtailsearch','0005_create_indexentry','2026-02-17 19:30:54.213940'),(196,'wagtailsearch','0006_customise_indexentry','2026-02-17 19:30:54.986203'),(197,'wagtailsearch','0007_delete_editorspick','2026-02-17 19:30:55.017692'),(198,'wagtailsearch','0008_remove_query_and_querydailyhits_models','2026-02-17 19:30:55.224010'),(199,'wagtailusers','0001_initial','2026-02-17 19:30:55.356922'),(200,'wagtailusers','0002_add_verbose_name_on_userprofile','2026-02-17 19:30:55.390191'),(201,'wagtailusers','0003_add_verbose_names','2026-02-17 19:30:55.400122'),(202,'wagtailusers','0004_capitalizeverbose','2026-02-17 19:30:55.443727'),(203,'wagtailusers','0005_make_related_name_wagtail_specific','2026-02-17 19:30:55.465445'),(204,'wagtailusers','0006_userprofile_prefered_language','2026-02-17 19:30:55.546268'),(205,'wagtailusers','0007_userprofile_current_time_zone','2026-02-17 19:30:55.618963'),(206,'wagtailusers','0008_userprofile_avatar','2026-02-17 19:30:55.700562'),(207,'wagtailusers','0009_userprofile_verbose_name_plural','2026-02-17 19:30:55.721621'),(208,'wagtailusers','0010_userprofile_updated_comments_notifications','2026-02-17 19:30:55.797435'),(209,'wagtailusers','0011_userprofile_dismissibles','2026-02-17 19:30:55.889069'),(210,'wagtailusers','0012_userprofile_theme','2026-02-17 19:30:55.967458'),(211,'wagtailusers','0013_userprofile_density','2026-02-17 19:30:56.093962'),(212,'wagtailusers','0014_userprofile_contrast','2026-02-17 19:30:56.173482'),(213,'wagtailimages','0001_squashed_0021','2026-02-17 19:30:56.173482'),(214,'wagtailcore','0001_squashed_0016_change_page_url_path_to_text_field','2026-02-17 19:30:56.189231'),(215,'home','0003_homepage_banner_title','2026-02-18 19:04:15.587244'),(216,'home','0004_homepage_banner_cta_homepage_banner_image_and_more','2026-02-18 20:21:51.207185'),(217,'home','0005_alter_homepage_banner_subtitle','2026-02-18 20:23:59.990140'),(218,'home','0006_alter_homepage_banner_cta_and_more','2026-02-18 20:48:42.916765'),(219,'flex','0001_initial','2026-02-19 16:01:02.334428'),(220,'flex','0002_flexpage_content','2026-02-19 17:14:48.469854'),(221,'flex','0003_alter_flexpage_content','2026-02-20 08:52:01.760630'),(222,'home','0007_alter_homepage_options_homepage_content','2026-02-20 08:52:01.833878'),(223,'home','0008_homepagecarouselimages','2026-02-20 17:17:36.798781'),(224,'home','0009_alter_homepagecarouselimages_page','2026-02-20 18:39:21.203003'),(225,'site_settings','0001_initial','2026-02-20 18:39:21.366188'),(226,'subscribers','0001_initial','2026-02-20 19:06:35.397512'),(227,'subscribers','0002_rename_subscribers_subscriber','2026-02-20 20:46:31.038756'),(228,'blog','0001_initial','2026-02-21 09:32:50.664940'),(229,'blog','0002_blogauthor','2026-02-22 09:19:50.741110'),(230,'flex','0004_alter_flexpage_content','2026-02-22 09:19:50.756107'),(231,'blog','0003_blogauthororderable','2026-02-22 09:53:46.366654'),(232,'blog','0004_blogcategory','2026-02-22 10:21:58.592160'),(233,'blog','0005_blogdetailpage_categories','2026-02-22 10:32:30.594338'),(234,'blog','0006_rename_blog_image_blogdetailpage_banner_image','2026-02-23 06:47:18.629094'),(235,'blog','0007_articleblogpage','2026-02-23 08:47:09.594968'),(236,'blog','0008_videoblogpage','2026-02-23 10:30:06.088987'),(237,'menus','0001_initial','2026-02-24 08:41:29.207437'),(238,'contact','0001_initial','2026-02-24 17:40:02.927752'),(239,'blog','0009_blogpagetags_blogdetailpage_tags','2026-03-01 10:41:20.183511'),(240,'home','0010_alter_homepagecarouselimages_id','2026-03-01 10:41:20.372784'),(241,'account','0001_initial','2026-03-06 16:12:16.015421'),(242,'account','0002_email_max_length','2026-03-06 16:12:16.078368'),(243,'account','0003_alter_emailaddress_create_unique_verified_email','2026-03-06 16:12:16.164686'),(244,'account','0004_alter_emailaddress_drop_unique_email','2026-03-06 16:12:16.310409'),(245,'account','0005_emailaddress_idx_upper_email','2026-03-06 16:12:16.389345'),(246,'account','0006_emailaddress_lower','2026-03-06 16:12:16.449064'),(247,'account','0007_emailaddress_idx_email','2026-03-06 16:12:16.559952'),(248,'account','0008_emailaddress_unique_primary_email_fixup','2026-03-06 16:12:16.616674'),(249,'account','0009_emailaddress_unique_primary_email','2026-03-06 16:12:16.641072'),(250,'socialaccount','0001_initial','2026-03-06 16:12:17.330283'),(251,'socialaccount','0002_token_max_lengths','2026-03-06 16:12:17.419833'),(252,'socialaccount','0003_extra_data_default_dict','2026-03-06 16:12:17.444712'),(253,'socialaccount','0004_app_provider_id_settings','2026-03-06 16:12:17.805542'),(254,'socialaccount','0005_socialtoken_nullable_app','2026-03-06 16:12:18.180128'),(255,'socialaccount','0006_alter_socialaccount_extra_data','2026-03-06 16:12:18.331703');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0jywspp2ac5ywlt1awpnvybxzv1ynx5q','.eJxVjEEOwiAQRe_C2hBaEAaX7j0DGWDGooaa0iYa4921SRe6_e_99xIBl3kIS6MplCwOohO73y1iulJdQb5gPY8yjXWeSpSrIjfa5GnMdDtu7l9gwDZ830w-astsAVgDgo5kABki-MRAyhrem8RORzYKtcsebefQx9j3jpReo41aK2MN9LiX6SkO6v0BvNc_ww:1vtKSb:Bi6S_dOxD88yK9KPOiWmKeQyLiHQlCMZKLWdXwAy9BA','2026-03-06 06:57:57.452904'),('1hu9qrgn6bys6ac9bafhts5wjaanursq','.eJxVjEEOwiAQRe_C2hBaEAaX7j0DGWDGooaa0iYa4921SRe6_e_99xIBl3kIS6MplCwOohO73y1iulJdQb5gPY8yjXWeSpSrIjfa5GnMdDtu7l9gwDZ830w-astsAVgDgo5kABki-MRAyhrem8RORzYKtcsebefQx9j3jpReo41aK2MN9LiX6SkO6v0BvNc_ww:1vt6Ee:glngxfFpLvaDbV0bBFWMxsUIcTi2BqpoJkHwIJMPVlo','2026-03-05 15:46:36.499866'),('5cajzhgqnxcqf0bmn3nyu2h33bmvjeg3','.eJxVjEEOwiAQRe_C2hBaEAaX7j0DGWDGooaa0iYa4921SRe6_e_99xIBl3kIS6MplCwOohO73y1iulJdQb5gPY8yjXWeSpSrIjfa5GnMdDtu7l9gwDZ830w-astsAVgDgo5kABki-MRAyhrem8RORzYKtcsebefQx9j3jpReo41aK2MN9LiX6SkO6v0BvNc_ww:1vt0lV:CqYpK_lULKnKretK1iPpXqDlm2PigAjKi7M2ix9x5aU','2026-03-05 09:56:09.103132'),('6pexapzxxuzniefvp7vwqs48n6gddimu','.eJxVjEEOwiAQRe_C2hBaEAaX7j0DGWDGooaa0iYa4921SRe6_e_99xIBl3kIS6MplCwOohO73y1iulJdQb5gPY8yjXWeSpSrIjfa5GnMdDtu7l9gwDZ830w-astsAVgDgo5kABki-MRAyhrem8RORzYKtcsebefQx9j3jpReo41aK2MN9LiX6SkO6v0BvNc_ww:1vsl5o:XNR24bEKPr3oqafRySrxkzD263Sl_EueJhGYSUNvMHc','2026-03-04 17:12:04.663288'),('k9xrsj5xgrc9z9lbgq6olme5ksmgq25b','.eJxVjMsOwiAQRf-FtSG0IA-X7v0GMgMzFjXUlDbRGP9dm3Sh23vOPS8RYZmHuDSaYsniIDqx-90Q0pXqCvIF6nmUaazzVFCuitxok6cx0-24uX-BAdrwfTMF1JbZes_ag9dIxgN79CGxJ2UN701ip5GNAu1yANs5CIh970jpNdqotTLWSI97mZ7i0PUqWKXeHz4EQPU:1vytxk:1ydSPPSMr1NKpwNinqKxHb6VMM4xvFchXxTrU_u8Qhs','2026-03-21 15:53:08.942419'),('kyb42thzw93a1n2uggchwre6tat1nxec','.eJxVjEEOwiAQRe_C2hBaEAaX7j0DGWDGooaa0iYa4921SRe6_e_99xIBl3kIS6MplCwOohO73y1iulJdQb5gPY8yjXWeSpSrIjfa5GnMdDtu7l9gwDZ830w-astsAVgDgo5kABki-MRAyhrem8RORzYKtcsebefQx9j3jpReo41aK2MN9LiX6SkO6v0BvNc_ww:1vyneq:w7ub8FinpWN-KAXQ3LTQd9V0hiBR7IhI3mVSagcp-Ww','2026-03-21 09:09:12.762998'),('v97csdvsjalyec0f6rfciwz1gvdjbpap','.eJxVjMsOwiAQRf-FtSG0IA-X7v0GMgMzFjXUlDbRGP9dm3Sh23vOPS8RYZmHuDSaYsniIDqx-90Q0pXqCvIF6nmUaazzVFCuitxok6cx0-24uX-BAdrwfTMF1JbZes_ag9dIxgN79CGxJ2UN701ip5GNAu1yANs5CIh970jpNdqotTLWSI97mZ7i0PUqWKXeHz4EQPU:1vtVCR:GclzCIhv6chi7pg1sGr9Mr4M5J4O-0V9YZlag9iaX8c','2026-03-06 18:25:59.485649'),('xvm6fcmvdfcgunir3pgksci42wnp6uz6','.eJxVjEEOwiAQRe_C2hBaEAaX7j0DGWDGooaa0iYa4921SRe6_e_99xIBl3kIS6MplCwOohO73y1iulJdQb5gPY8yjXWeSpSrIjfa5GnMdDtu7l9gwDZ830w-astsAVgDgo5kABki-MRAyhrem8RORzYKtcsebefQx9j3jpReo41aK2MN9LiX6SkO6v0BvNc_ww:1vtU7S:t1zttQJxXHt57LkfGBy9YMWcHuCPYJmtCZ6zszj0ge0','2026-03-06 17:16:46.508917');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flex_flexpage`
--

DROP TABLE IF EXISTS `flex_flexpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flex_flexpage` (
  `page_ptr_id` int NOT NULL,
  `subtitle` varchar(100) DEFAULT NULL,
  `content` json DEFAULT NULL,
  PRIMARY KEY (`page_ptr_id`),
  CONSTRAINT `flex_flexpage_page_ptr_id_5e956af7_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flex_flexpage`
--

LOCK TABLES `flex_flexpage` WRITE;
/*!40000 ALTER TABLE `flex_flexpage` DISABLE KEYS */;
INSERT INTO `flex_flexpage` VALUES (4,'About Startup Life','[{\"id\": \"dbb72971-93cc-411e-9684-54ddfeea49c7\", \"type\": \"title_and_text\", \"value\": {\"text\": \"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\", \"title\": \"Third Title\"}}, {\"id\": \"a24f5edd-8fbd-413b-a76a-27d804c3aee2\", \"type\": \"title_and_text\", \"value\": {\"text\": \"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\", \"title\": \"Second title\"}}, {\"id\": \"d355620e-8fcf-4c57-a033-8cdf43a60f68\", \"type\": \"title_and_text\", \"value\": {\"text\": \"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\", \"title\": \"Welcome to startup Life\"}}, {\"id\": \"bc68489c-f935-4384-a8ba-d91c330b82b4\", \"type\": \"full_richtext\", \"value\": \"<h2 data-block-key=\\\"e8zzc\\\">Lorem</h2><p data-block-key=\\\"6vv3r\\\"><i>Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled</i> <a linktype=\\\"page\\\" id=\\\"3\\\"><i>it to</i></a></p>\"}, {\"id\": \"0ce0ec7d-501e-44f9-a892-1554981aec46\", \"type\": \"simple_richtext\", \"value\": \"<p data-block-key=\\\"99q9d\\\"><b><i>Simple text</i></b></p>\"}, {\"id\": \"272b174f-3a18-4daa-a676-9ac1a780eb2f\", \"type\": \"cards\", \"value\": {\"cards\": [{\"id\": \"50135788-a1c5-45df-8383-4871cc1d149a\", \"type\": \"item\", \"value\": {\"text\": \"Fahim Hussain Walid ( IELTS INS)\", \"image\": 3, \"title\": \"Fahim Hussain Walid ( IELTS INS)\", \"button_url\": \"\", \"button_page\": 3}}, {\"id\": \"93a4accc-3d34-44ef-9965-ab1b5c7e90b7\", \"type\": \"item\", \"value\": {\"text\": \"M. Monsur Islam (IELTS INS)\", \"image\": 4, \"title\": \"M. Monsur Islam (IELTS INS)\", \"button_url\": \"\", \"button_page\": 3}}, {\"id\": \"54993668-c47f-454e-b7a1-2efebefa74b1\", \"type\": \"item\", \"value\": {\"text\": \"Aminul islam_ (IELTS INS)\", \"image\": 5, \"title\": \"Aminul islam_ (IELTS INS)\", \"button_url\": \"\", \"button_page\": 3}}], \"title\": \"Staff Cards\"}}, {\"id\": \"9c0ae004-6c50-47d5-9331-3e2853b55061\", \"type\": \"cta\", \"value\": {\"text\": \"<p data-block-key=\\\"xjp37\\\"><i>Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled</i></p>\", \"title\": \"Call to Action Title\", \"button_url\": \"\", \"button_page\": 4, \"button_text\": \"Learn More\"}}, {\"id\": \"e69506df-a3bf-45b5-aad0-ffcb416a191b\", \"type\": \"button\", \"value\": {\"button_url\": \"http://127.0.0.1:8000/blog/\", \"button_page\": null}}, {\"id\": \"5c1d546b-1b31-468c-8b75-977d40f61a6a\", \"type\": \"char_block\", \"value\": \"welcome About page\"}]');
/*!40000 ALTER TABLE `flex_flexpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_homepage`
--

DROP TABLE IF EXISTS `home_homepage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_homepage` (
  `page_ptr_id` int NOT NULL,
  `banner_title` varchar(100) DEFAULT NULL,
  `banner_cta_id` int DEFAULT NULL,
  `banner_image_id` int DEFAULT NULL,
  `banner_subtitle` longtext NOT NULL DEFAULT (_utf8mb4'Banner Sub Title'),
  `content` json DEFAULT NULL,
  PRIMARY KEY (`page_ptr_id`),
  KEY `home_homepage_banner_cta_id_6cd33afc_fk_wagtailcore_page_id` (`banner_cta_id`),
  KEY `home_homepage_banner_image_id_ccdec6a2_fk_wagtailimages_image_id` (`banner_image_id`),
  CONSTRAINT `home_homepage_banner_cta_id_6cd33afc_fk_wagtailcore_page_id` FOREIGN KEY (`banner_cta_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `home_homepage_banner_image_id_ccdec6a2_fk_wagtailimages_image_id` FOREIGN KEY (`banner_image_id`) REFERENCES `wagtailimages_image` (`id`),
  CONSTRAINT `home_homepage_page_ptr_id_e5b77cf7_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_homepage`
--

LOCK TABLES `home_homepage` WRITE;
/*!40000 ALTER TABLE `home_homepage` DISABLE KEYS */;
INSERT INTO `home_homepage` VALUES (3,'AIMS Education, Education Consultancy Firm in Bangladesh',NULL,2,'<p data-block-key=\"nyvwg\"><b>Student Reviews From 10,000+ Successful Students Since 2017</b></p>','[{\"id\": \"c2b89da7-5688-400c-82c7-7c66e72ed10e\", \"type\": \"cta\", \"value\": {\"text\": \"<p data-block-key=\\\"tklrm\\\">cta</p>\", \"title\": \"call to action from home page\", \"button_url\": \"\", \"button_page\": 3, \"button_text\": \"Learn More\"}}]');
/*!40000 ALTER TABLE `home_homepage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_homepagecarouselimages`
--

DROP TABLE IF EXISTS `home_homepagecarouselimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_homepagecarouselimages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sort_order` int DEFAULT NULL,
  `carousel_image_id` int DEFAULT NULL,
  `page_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_homepagecarouse_carousel_image_id_ce202599_fk_wagtailim` (`carousel_image_id`),
  KEY `home_homepagecarouselimages_page_id_6bb2bf9f` (`page_id`),
  CONSTRAINT `home_homepagecarouse_carousel_image_id_ce202599_fk_wagtailim` FOREIGN KEY (`carousel_image_id`) REFERENCES `wagtailimages_image` (`id`),
  CONSTRAINT `home_homepagecarouse_page_id_6bb2bf9f_fk_home_home` FOREIGN KEY (`page_id`) REFERENCES `home_homepage` (`page_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_homepagecarouselimages`
--

LOCK TABLES `home_homepagecarouselimages` WRITE;
/*!40000 ALTER TABLE `home_homepagecarouselimages` DISABLE KEYS */;
INSERT INTO `home_homepagecarouselimages` VALUES (1,0,7,3),(2,1,8,3),(3,2,9,3),(4,3,6,3);
/*!40000 ALTER TABLE `home_homepagecarouselimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus_menu`
--

DROP TABLE IF EXISTS `menus_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus_menu`
--

LOCK TABLES `menus_menu` WRITE;
/*!40000 ALTER TABLE `menus_menu` DISABLE KEYS */;
INSERT INTO `menus_menu` VALUES (1,'Main','main');
/*!40000 ALTER TABLE `menus_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus_menuitem`
--

DROP TABLE IF EXISTS `menus_menuitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus_menuitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sort_order` int DEFAULT NULL,
  `link_title` varchar(50) DEFAULT NULL,
  `link_url` varchar(500) NOT NULL,
  `open_in_new_tab` tinyint(1) NOT NULL,
  `link_page_id` int DEFAULT NULL,
  `page_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menus_menuitem_link_page_id_90cc2971_fk_wagtailcore_page_id` (`link_page_id`),
  KEY `menus_menuitem_page_id_7ee57084` (`page_id`),
  CONSTRAINT `menus_menuitem_link_page_id_90cc2971_fk_wagtailcore_page_id` FOREIGN KEY (`link_page_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `menus_menuitem_page_id_7ee57084_fk_menus_menu_id` FOREIGN KEY (`page_id`) REFERENCES `menus_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus_menuitem`
--

LOCK TABLES `menus_menuitem` WRITE;
/*!40000 ALTER TABLE `menus_menuitem` DISABLE KEYS */;
INSERT INTO `menus_menuitem` VALUES (1,0,'Super Cool Blog','',0,5,1),(2,1,'Documentation','https://readthedocs.io/',1,NULL,1);
/*!40000 ALTER TABLE `menus_menuitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_settings_socialmediasettings`
--

DROP TABLE IF EXISTS `site_settings_socialmediasettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_settings_socialmediasettings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `facebook` varchar(200) DEFAULT NULL,
  `twitter` varchar(200) DEFAULT NULL,
  `youtube` varchar(200) DEFAULT NULL,
  `site_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_id` (`site_id`),
  CONSTRAINT `site_settings_social_site_id_59395f27_fk_wagtailco` FOREIGN KEY (`site_id`) REFERENCES `wagtailcore_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings_socialmediasettings`
--

LOCK TABLES `site_settings_socialmediasettings` WRITE;
/*!40000 ALTER TABLE `site_settings_socialmediasettings` DISABLE KEYS */;
INSERT INTO `site_settings_socialmediasettings` VALUES (1,'https://facebook.com','https://twitter.com','https://youtube.com',2);
/*!40000 ALTER TABLE `site_settings_socialmediasettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(200) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` json NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  `provider_id` varchar(200) NOT NULL,
  `settings` json NOT NULL DEFAULT (_utf8mb4'{}'),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int NOT NULL,
  `app_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribers_subscriber`
--

DROP TABLE IF EXISTS `subscribers_subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscribers_subscriber` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribers_subscriber`
--

LOCK TABLES `subscribers_subscriber` WRITE;
/*!40000 ALTER TABLE `subscribers_subscriber` DISABLE KEYS */;
INSERT INTO `subscribers_subscriber` VALUES (1,'ishefat@gmail.com','Shefat'),(2,'shefat@aimseducation.co.uk','Islam');
/*!40000 ALTER TABLE `subscribers_subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggit_tag`
--

DROP TABLE IF EXISTS `taggit_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggit_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_tag`
--

LOCK TABLES `taggit_tag` WRITE;
/*!40000 ALTER TABLE `taggit_tag` DISABLE KEYS */;
INSERT INTO `taggit_tag` VALUES (1,'promotion','promotion'),(2,'M. Monsur Islam  (IELTS INS)','m-monsur-islam-ielts-ins'),(3,'Aminul islam_ (IELTS INS)','aminul-islam_-ielts-ins'),(4,'slide two','slide-two'),(5,'tag1','tag1'),(6,'tag2','tag2');
/*!40000 ALTER TABLE `taggit_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggit_taggeditem`
--

DROP TABLE IF EXISTS `taggit_taggeditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggit_taggeditem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_id` int NOT NULL,
  `content_type_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taggit_taggeditem_content_type_id_object_id_tag_id_4bb97a8e_uniq` (`content_type_id`,`object_id`,`tag_id`),
  KEY `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` (`tag_id`),
  KEY `taggit_taggeditem_object_id_e2d7d1df` (`object_id`),
  KEY `taggit_tagg_content_8fc721_idx` (`content_type_id`,`object_id`),
  CONSTRAINT `taggit_taggeditem_content_type_id_9957a03c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `taggit_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_taggeditem`
--

LOCK TABLES `taggit_taggeditem` WRITE;
/*!40000 ALTER TABLE `taggit_taggeditem` DISABLE KEYS */;
INSERT INTO `taggit_taggeditem` VALUES (1,1,28,1),(2,3,28,2),(3,4,28,2),(4,5,28,3),(5,9,28,4);
/*!40000 ALTER TABLE `taggit_taggeditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailadmin_admin`
--

DROP TABLE IF EXISTS `wagtailadmin_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailadmin_admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailadmin_admin`
--

LOCK TABLES `wagtailadmin_admin` WRITE;
/*!40000 ALTER TABLE `wagtailadmin_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailadmin_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailadmin_editingsession`
--

DROP TABLE IF EXISTS `wagtailadmin_editingsession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailadmin_editingsession` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_id` varchar(255) NOT NULL,
  `last_seen_at` datetime(6) NOT NULL,
  `content_type_id` int NOT NULL,
  `user_id` int NOT NULL,
  `is_editing` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailadmin_editingsession_user_id_6e1a9b70_fk_auth_user_id` (`user_id`),
  KEY `wagtailadmi_content_717955_idx` (`content_type_id`,`object_id`),
  CONSTRAINT `wagtailadmin_editing_content_type_id_4df7730e_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailadmin_editingsession_user_id_6e1a9b70_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=378 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailadmin_editingsession`
--

LOCK TABLES `wagtailadmin_editingsession` WRITE;
/*!40000 ALTER TABLE `wagtailadmin_editingsession` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailadmin_editingsession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_collection`
--

DROP TABLE IF EXISTS `wagtailcore_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_collection` (
  `id` int NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `depth` int unsigned NOT NULL,
  `numchild` int unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`),
  CONSTRAINT `wagtailcore_collection_chk_1` CHECK ((`depth` >= 0)),
  CONSTRAINT `wagtailcore_collection_chk_2` CHECK ((`numchild` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_collection`
--

LOCK TABLES `wagtailcore_collection` WRITE;
/*!40000 ALTER TABLE `wagtailcore_collection` DISABLE KEYS */;
INSERT INTO `wagtailcore_collection` VALUES (1,'0001',1,0,'Root');
/*!40000 ALTER TABLE `wagtailcore_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_collectionviewrestriction`
--

DROP TABLE IF EXISTS `wagtailcore_collectionviewrestriction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_collectionviewrestriction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `restriction_type` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `collection_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_collecti_collection_id_761908ec_fk_wagtailco` (`collection_id`),
  CONSTRAINT `wagtailcore_collecti_collection_id_761908ec_fk_wagtailco` FOREIGN KEY (`collection_id`) REFERENCES `wagtailcore_collection` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_collectionviewrestriction`
--

LOCK TABLES `wagtailcore_collectionviewrestriction` WRITE;
/*!40000 ALTER TABLE `wagtailcore_collectionviewrestriction` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_collectionviewrestriction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_collectionviewrestriction_groups`
--

DROP TABLE IF EXISTS `wagtailcore_collectionviewrestriction_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_collectionviewrestriction_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `collectionviewrestriction_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_collectionvi_collectionviewrestrictio_988995ae_uniq` (`collectionviewrestriction_id`,`group_id`),
  KEY `wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou` (`group_id`),
  CONSTRAINT `wagtailcore_collecti_collectionviewrestri_47320efd_fk_wagtailco` FOREIGN KEY (`collectionviewrestriction_id`) REFERENCES `wagtailcore_collectionviewrestriction` (`id`),
  CONSTRAINT `wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_collectionviewrestriction_groups`
--

LOCK TABLES `wagtailcore_collectionviewrestriction_groups` WRITE;
/*!40000 ALTER TABLE `wagtailcore_collectionviewrestriction_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_collectionviewrestriction_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_comment`
--

DROP TABLE IF EXISTS `wagtailcore_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `contentpath` longtext NOT NULL,
  `position` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `resolved_at` datetime(6) DEFAULT NULL,
  `page_id` int NOT NULL,
  `resolved_by_id` int DEFAULT NULL,
  `revision_created_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_comment_resolved_by_id_a282aa0e_fk_auth_user_id` (`resolved_by_id`),
  KEY `wagtailcore_comment_user_id_0c577ca6_fk_auth_user_id` (`user_id`),
  KEY `wagtailcore_comment_page_id_108444b5` (`page_id`),
  KEY `wagtailcore_comment_revision_created_id_1d058279_fk_wagtailco` (`revision_created_id`),
  CONSTRAINT `wagtailcore_comment_page_id_108444b5_fk_wagtailcore_page_id` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `wagtailcore_comment_resolved_by_id_a282aa0e_fk_auth_user_id` FOREIGN KEY (`resolved_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `wagtailcore_comment_revision_created_id_1d058279_fk_wagtailco` FOREIGN KEY (`revision_created_id`) REFERENCES `wagtailcore_revision` (`id`),
  CONSTRAINT `wagtailcore_comment_user_id_0c577ca6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_comment`
--

LOCK TABLES `wagtailcore_comment` WRITE;
/*!40000 ALTER TABLE `wagtailcore_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_commentreply`
--

DROP TABLE IF EXISTS `wagtailcore_commentreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_commentreply` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `comment_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_commentreply_user_id_d0b3b9c3_fk_auth_user_id` (`user_id`),
  KEY `wagtailcore_commentreply_comment_id_afc7e027` (`comment_id`),
  CONSTRAINT `wagtailcore_commentr_comment_id_afc7e027_fk_wagtailco` FOREIGN KEY (`comment_id`) REFERENCES `wagtailcore_comment` (`id`),
  CONSTRAINT `wagtailcore_commentreply_user_id_d0b3b9c3_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_commentreply`
--

LOCK TABLES `wagtailcore_commentreply` WRITE;
/*!40000 ALTER TABLE `wagtailcore_commentreply` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_commentreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_groupapprovaltask`
--

DROP TABLE IF EXISTS `wagtailcore_groupapprovaltask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_groupapprovaltask` (
  `task_ptr_id` int NOT NULL,
  PRIMARY KEY (`task_ptr_id`),
  CONSTRAINT `wagtailcore_groupapp_task_ptr_id_cfe58781_fk_wagtailco` FOREIGN KEY (`task_ptr_id`) REFERENCES `wagtailcore_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_groupapprovaltask`
--

LOCK TABLES `wagtailcore_groupapprovaltask` WRITE;
/*!40000 ALTER TABLE `wagtailcore_groupapprovaltask` DISABLE KEYS */;
INSERT INTO `wagtailcore_groupapprovaltask` VALUES (1);
/*!40000 ALTER TABLE `wagtailcore_groupapprovaltask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_groupapprovaltask_groups`
--

DROP TABLE IF EXISTS `wagtailcore_groupapprovaltask_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_groupapprovaltask_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupapprovaltask_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_groupapprova_groupapprovaltask_id_gro_bb5ee7eb_uniq` (`groupapprovaltask_id`,`group_id`),
  KEY `wagtailcore_groupapp_group_id_2e64b61f_fk_auth_grou` (`group_id`),
  CONSTRAINT `wagtailcore_groupapp_group_id_2e64b61f_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `wagtailcore_groupapp_groupapprovaltask_id_9a9255ea_fk_wagtailco` FOREIGN KEY (`groupapprovaltask_id`) REFERENCES `wagtailcore_groupapprovaltask` (`task_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_groupapprovaltask_groups`
--

LOCK TABLES `wagtailcore_groupapprovaltask_groups` WRITE;
/*!40000 ALTER TABLE `wagtailcore_groupapprovaltask_groups` DISABLE KEYS */;
INSERT INTO `wagtailcore_groupapprovaltask_groups` VALUES (1,1,1);
/*!40000 ALTER TABLE `wagtailcore_groupapprovaltask_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_groupcollectionpermission`
--

DROP TABLE IF EXISTS `wagtailcore_groupcollectionpermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_groupcollectionpermission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `collection_id` int NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_groupcollect_group_id_collection_id_p_a21cefe9_uniq` (`group_id`,`collection_id`,`permission_id`),
  KEY `wagtailcore_groupcol_collection_id_5423575a_fk_wagtailco` (`collection_id`),
  KEY `wagtailcore_groupcol_permission_id_1b626275_fk_auth_perm` (`permission_id`),
  CONSTRAINT `wagtailcore_groupcol_collection_id_5423575a_fk_wagtailco` FOREIGN KEY (`collection_id`) REFERENCES `wagtailcore_collection` (`id`),
  CONSTRAINT `wagtailcore_groupcol_group_id_05d61460_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `wagtailcore_groupcol_permission_id_1b626275_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_groupcollectionpermission`
--

LOCK TABLES `wagtailcore_groupcollectionpermission` WRITE;
/*!40000 ALTER TABLE `wagtailcore_groupcollectionpermission` DISABLE KEYS */;
INSERT INTO `wagtailcore_groupcollectionpermission` VALUES (2,1,1,102),(4,1,1,103),(6,1,1,105),(8,1,1,106),(10,1,1,107),(12,1,1,109),(1,1,2,102),(3,1,2,103),(5,1,2,105),(7,1,2,106),(9,1,2,107),(11,1,2,109);
/*!40000 ALTER TABLE `wagtailcore_groupcollectionpermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_grouppagepermission`
--

DROP TABLE IF EXISTS `wagtailcore_grouppagepermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_grouppagepermission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `page_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_permission` (`group_id`,`page_id`,`permission_id`),
  KEY `wagtailcore_grouppag_page_id_710b114a_fk_wagtailco` (`page_id`),
  KEY `wagtailcore_grouppagepermission_group_id_fc07e671` (`group_id`),
  KEY `wagtailcore_grouppag_permission_id_05acb22e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `wagtailcore_grouppag_group_id_fc07e671_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `wagtailcore_grouppag_page_id_710b114a_fk_wagtailco` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `wagtailcore_grouppag_permission_id_05acb22e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_grouppagepermission`
--

LOCK TABLES `wagtailcore_grouppagepermission` WRITE;
/*!40000 ALTER TABLE `wagtailcore_grouppagepermission` DISABLE KEYS */;
INSERT INTO `wagtailcore_grouppagepermission` VALUES (1,1,1,34),(2,1,1,35),(6,1,1,39),(3,1,1,40),(7,1,1,41),(4,2,1,34),(5,2,1,35);
/*!40000 ALTER TABLE `wagtailcore_grouppagepermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_locale`
--

DROP TABLE IF EXISTS `wagtailcore_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_locale` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language_code` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `language_code` (`language_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_locale`
--

LOCK TABLES `wagtailcore_locale` WRITE;
/*!40000 ALTER TABLE `wagtailcore_locale` DISABLE KEYS */;
INSERT INTO `wagtailcore_locale` VALUES (1,'en');
/*!40000 ALTER TABLE `wagtailcore_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_modellogentry`
--

DROP TABLE IF EXISTS `wagtailcore_modellogentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_modellogentry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` longtext NOT NULL,
  `action` varchar(255) NOT NULL,
  `data` json NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `content_changed` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `object_id` varchar(255) NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `uuid` char(32) DEFAULT NULL,
  `revision_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_modellog_content_type_id_68849e77_fk_django_co` (`content_type_id`),
  KEY `wagtailcore_modellogentry_action_d2d856ee` (`action`),
  KEY `wagtailcore_modellogentry_content_changed_8bc39742` (`content_changed`),
  KEY `wagtailcore_modellogentry_object_id_e0e7d4ef` (`object_id`),
  KEY `wagtailcore_modellogentry_user_id_0278d1bf` (`user_id`),
  KEY `wagtailcore_modellogentry_timestamp_9694521b` (`timestamp`),
  KEY `wagtailcore_modellogentry_revision_id_df6ca33a` (`revision_id`),
  CONSTRAINT `wagtailcore_modellog_content_type_id_68849e77_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_modellogentry`
--

LOCK TABLES `wagtailcore_modellogentry` WRITE;
/*!40000 ALTER TABLE `wagtailcore_modellogentry` DISABLE KEYS */;
INSERT INTO `wagtailcore_modellogentry` VALUES (1,'Fahim Hussain Walid ( IELTS INS)','wagtail.edit','{}','2026-02-20 07:02:29.287987',1,0,'3',28,1,'6387648d2b4444f8874dc20c780c6627',NULL),(2,'social media settings for localhost [default]','wagtail.edit','{}','2026-02-20 18:45:39.554428',1,0,'1',46,1,'4445fec17e4b4be39cb0b07e50a8a8fe',NULL),(3,'Shefat','wagtail.create','{}','2026-02-20 20:47:52.950965',1,0,'1',47,1,'c418f8437c744d65a8844e59ac540492',NULL),(4,'Islam','wagtail.create','{}','2026-02-20 20:48:17.939158',1,0,'2',47,1,'d24a14ad5abb4f8a92f7bcca9727ecc3',NULL),(5,'Shefat','wagtail.create','{}','2026-02-22 09:27:01.468186',1,0,'1',50,1,'2738c2e8d8754f799ce45da75874267b',NULL),(6,'Engr Robin','wagtail.create','{}','2026-02-22 09:27:38.020864',1,0,'2',50,1,'ae0a44281c0f40a68204a958bf1478f1',NULL),(7,'BlogCategory object (1)','wagtail.create','{}','2026-02-22 10:22:31.396766',1,0,'1',52,1,'d8642c364b954986a167092b691d332a',NULL),(8,'BlogCategory object (2)','wagtail.create','{}','2026-02-22 10:22:45.832621',1,0,'2',52,1,'19061cf6e70246a9941dd5619ec78620',NULL),(9,'BlogCategory object (3)','wagtail.create','{}','2026-02-22 10:22:56.781660',1,0,'3',52,1,'63c25a76d5f945f184f9445008bebed7',NULL),(10,'slide two','wagtail.edit','{}','2026-02-23 09:27:56.069022',1,0,'9',28,1,'2f3ba37f46dc44f8855545c51b195522',NULL),(11,'Main','wagtail.create','{}','2026-02-24 09:05:38.574959',1,0,'1',55,1,'903e0732ed904680836fffbf3e4aa241',NULL),(12,'Main','wagtail.edit','{}','2026-02-24 09:07:11.143749',1,0,'1',55,1,'1387d22bddd14933a48d04661e81e033',NULL),(13,'Main','wagtail.edit','{}','2026-02-24 09:07:21.904130',0,0,'1',55,1,'c62b6231ee2848ec9f7c5caf0d25f826',NULL),(14,'Main','wagtail.edit','{}','2026-02-24 09:07:28.539367',1,0,'1',55,1,'b6c36b2953074b90a9020b4fae0be4d5',NULL),(15,'Main','wagtail.edit','{}','2026-02-24 09:27:18.258067',0,0,'1',55,1,'065e6ceeeccb4e6e8fcfdee01e9c2862',NULL);
/*!40000 ALTER TABLE `wagtailcore_modellogentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_page`
--

DROP TABLE IF EXISTS `wagtailcore_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_page` (
  `id` int NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `depth` int unsigned NOT NULL,
  `numchild` int unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `live` tinyint(1) NOT NULL,
  `has_unpublished_changes` tinyint(1) NOT NULL,
  `url_path` longtext NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `show_in_menus` tinyint(1) NOT NULL,
  `search_description` longtext NOT NULL,
  `go_live_at` datetime(6) DEFAULT NULL,
  `expire_at` datetime(6) DEFAULT NULL,
  `expired` tinyint(1) NOT NULL,
  `content_type_id` int NOT NULL,
  `owner_id` int DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `latest_revision_created_at` datetime(6) DEFAULT NULL,
  `first_published_at` datetime(6) DEFAULT NULL,
  `live_revision_id` int DEFAULT NULL,
  `last_published_at` datetime(6) DEFAULT NULL,
  `draft_title` varchar(255) NOT NULL,
  `locked_at` datetime(6) DEFAULT NULL,
  `locked_by_id` int DEFAULT NULL,
  `translation_key` char(32) NOT NULL,
  `locale_id` int NOT NULL,
  `alias_of_id` int DEFAULT NULL,
  `latest_revision_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`),
  UNIQUE KEY `wagtailcore_page_translation_key_locale_id_9b041bad_uniq` (`translation_key`,`locale_id`),
  KEY `wagtailcore_page_content_type_id_c28424df_fk_django_co` (`content_type_id`),
  KEY `wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id` (`owner_id`),
  KEY `wagtailcore_page_slug_e7c11b8f` (`slug`),
  KEY `wagtailcore_page_first_published_at_2b5dd637` (`first_published_at`),
  KEY `wagtailcore_page_live_revision_id_930bd822_fk_wagtailco` (`live_revision_id`),
  KEY `wagtailcore_page_locked_by_id_bcb86245_fk_auth_user_id` (`locked_by_id`),
  KEY `wagtailcore_page_locale_id_3c7e30a6_fk_wagtailcore_locale_id` (`locale_id`),
  KEY `wagtailcore_page_alias_of_id_12945502_fk_wagtailcore_page_id` (`alias_of_id`),
  KEY `wagtailcore_page_latest_revision_id_e60fef51_fk_wagtailco` (`latest_revision_id`),
  CONSTRAINT `wagtailcore_page_alias_of_id_12945502_fk_wagtailcore_page_id` FOREIGN KEY (`alias_of_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `wagtailcore_page_content_type_id_c28424df_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailcore_page_latest_revision_id_e60fef51_fk_wagtailco` FOREIGN KEY (`latest_revision_id`) REFERENCES `wagtailcore_revision` (`id`),
  CONSTRAINT `wagtailcore_page_live_revision_id_930bd822_fk_wagtailco` FOREIGN KEY (`live_revision_id`) REFERENCES `wagtailcore_revision` (`id`),
  CONSTRAINT `wagtailcore_page_locale_id_3c7e30a6_fk_wagtailcore_locale_id` FOREIGN KEY (`locale_id`) REFERENCES `wagtailcore_locale` (`id`),
  CONSTRAINT `wagtailcore_page_locked_by_id_bcb86245_fk_auth_user_id` FOREIGN KEY (`locked_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `wagtailcore_page_chk_1` CHECK ((`depth` >= 0)),
  CONSTRAINT `wagtailcore_page_chk_2` CHECK ((`numchild` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_page`
--

LOCK TABLES `wagtailcore_page` WRITE;
/*!40000 ALTER TABLE `wagtailcore_page` DISABLE KEYS */;
INSERT INTO `wagtailcore_page` VALUES (1,'0001',1,1,'Root','root',1,0,'/','',0,'',NULL,NULL,0,1,NULL,0,NULL,NULL,NULL,NULL,'Root',NULL,NULL,'56fab4bf663c4ded85ef3938106c24b2',1,NULL,NULL),(3,'00010001',2,3,'Home','home',1,0,'/home/','',0,'',NULL,NULL,0,2,NULL,0,'2026-02-20 17:48:48.129664','2026-02-18 19:42:21.394512',24,'2026-02-20 17:48:48.189521','Home',NULL,NULL,'d83fcec9bc0e44c3b8c80c8cb11e9234',1,NULL,24),(4,'000100010001',3,0,'About','about',1,0,'/home/about/','',0,'',NULL,NULL,0,44,1,0,'2026-03-04 11:18:08.669045','2026-02-19 16:07:05.075552',54,'2026-03-04 11:18:08.788953','About',NULL,NULL,'ebffe46cca524e3e91f142d9268f733f',1,NULL,54),(5,'000100010002',3,4,'Blog','blog',1,0,'/home/blog/','',0,'',NULL,NULL,0,48,1,0,'2026-02-21 09:33:21.257609','2026-02-21 09:33:21.301982',25,'2026-02-21 09:33:21.301982','Blog',NULL,NULL,'880678adfa6d49e595876ca772031cb1',1,NULL,25),(6,'0001000100020001',4,0,'First Blog Post(test title)','blog-post-1',1,0,'/home/blog/blog-post-1/','',0,'',NULL,NULL,0,49,1,0,'2026-03-07 09:14:32.001885','2026-02-21 09:35:57.233406',59,'2026-03-07 09:14:32.068134','First Blog Post(test title)',NULL,NULL,'27cbfe3c6c964bbdb39456f9509fbc24',1,NULL,59),(7,'0001000100020002',4,0,'Blog Post #2','blog-post-2',1,0,'/home/blog/blog-post-2/','',0,'',NULL,NULL,0,49,1,0,'2026-03-04 18:12:44.365691','2026-02-21 09:40:11.137796',55,'2026-03-04 18:12:44.449614','Blog Post #2',NULL,NULL,'b846168346ca412ca4e074f97d527db6',1,NULL,55),(8,'0001000100020003',4,0,'Article Blog Page','article-blog-page',1,0,'/home/blog/article-blog-page/','',0,'',NULL,NULL,0,53,1,0,'2026-03-04 19:20:21.088893','2026-02-23 09:08:20.073423',58,'2026-03-04 19:20:21.145481','Article Blog Page',NULL,NULL,'3eea124e825343f4923a9b780040e133',1,NULL,58),(9,'0001000100020004',4,0,'Video Blog Article','video-blog-article',1,0,'/home/blog/video-blog-article/','',0,'',NULL,NULL,0,54,1,0,'2026-03-04 19:20:05.266771','2026-02-23 10:33:56.088422',57,'2026-03-04 19:20:05.319045','Video Blog Article',NULL,NULL,'3e430f9b38a54509a1cade980c2f5882',1,NULL,57),(10,'000100010003',3,0,'Contact Form','contact-form',1,0,'/home/contact-form/','',0,'',NULL,NULL,0,57,1,0,'2026-02-24 17:52:56.701255','2026-02-24 17:52:56.810101',45,'2026-02-24 17:52:56.810101','Contact Form',NULL,NULL,'e8bf841fd8c04b68ad0b4eed3cca74b7',1,NULL,45);
/*!40000 ALTER TABLE `wagtailcore_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_pagelogentry`
--

DROP TABLE IF EXISTS `wagtailcore_pagelogentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_pagelogentry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` longtext NOT NULL,
  `action` varchar(255) NOT NULL,
  `data` json NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `content_changed` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `page_id` int NOT NULL,
  `revision_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `uuid` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_pageloge_content_type_id_74e7708a_fk_django_co` (`content_type_id`),
  KEY `wagtailcore_pagelogentry_action_c2408198` (`action`),
  KEY `wagtailcore_pagelogentry_content_changed_99f27ade` (`content_changed`),
  KEY `wagtailcore_pagelogentry_page_id_8464e327` (`page_id`),
  KEY `wagtailcore_pagelogentry_revision_id_8043d103` (`revision_id`),
  KEY `wagtailcore_pagelogentry_user_id_604ccfd8` (`user_id`),
  KEY `wagtailcore_pagelogentry_timestamp_deb774c4` (`timestamp`),
  CONSTRAINT `wagtailcore_pageloge_content_type_id_74e7708a_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_pagelogentry`
--

LOCK TABLES `wagtailcore_pagelogentry` WRITE;
/*!40000 ALTER TABLE `wagtailcore_pagelogentry` DISABLE KEYS */;
INSERT INTO `wagtailcore_pagelogentry` VALUES (1,'Home','wagtail.edit','{}','2026-02-18 19:13:00.066243',1,0,2,3,1,1,'e6a6c38480fc4a0badd75389ec3f0cc8'),(2,'Home','wagtail.edit','{}','2026-02-18 19:42:18.828645',1,0,2,3,2,1,'1ce19aeb8ed243ff9b18139a2295e032'),(3,'Home','wagtail.edit','{}','2026-02-18 19:42:21.383435',1,0,2,3,3,1,'a8b94d342b9c416cab48820fbfba3f4b'),(4,'Home','wagtail.publish','{}','2026-02-18 19:42:21.416526',0,0,2,3,3,1,'a8b94d342b9c416cab48820fbfba3f4b'),(5,'Home','wagtail.edit','{}','2026-02-18 19:44:13.711327',1,0,2,3,4,1,'c25936257cff47e8af3e73e502044704'),(6,'Home','wagtail.publish','{}','2026-02-18 19:44:13.754914',1,0,2,3,4,1,'c25936257cff47e8af3e73e502044704'),(7,'Home','wagtail.edit','{}','2026-02-18 20:51:37.417642',1,0,2,3,5,1,'526ea777f2394dab871657a3588d2e7b'),(8,'Home','wagtail.publish','{}','2026-02-18 20:51:37.467254',1,0,2,3,5,1,'526ea777f2394dab871657a3588d2e7b'),(9,'Home','wagtail.edit','{}','2026-02-19 10:10:52.037359',1,0,2,3,6,1,'3a69e05e074645989c14fd9fe8dcd658'),(10,'Home','wagtail.publish','{}','2026-02-19 10:10:52.082055',1,0,2,3,6,1,'3a69e05e074645989c14fd9fe8dcd658'),(11,'About','wagtail.create','{}','2026-02-19 16:07:04.961710',1,0,44,4,NULL,1,'2dd934c06ecc4d2c8e2e723822b370a3'),(12,'About','wagtail.edit','{}','2026-02-19 16:07:05.034981',1,0,44,4,7,1,'2dd934c06ecc4d2c8e2e723822b370a3'),(13,'About','wagtail.publish','{}','2026-02-19 16:07:05.149662',1,0,44,4,7,1,'2dd934c06ecc4d2c8e2e723822b370a3'),(14,'About','wagtail.edit','{}','2026-02-19 16:11:14.431058',1,0,44,4,8,1,'785a25da36c041cda7ad0e73331b99bd'),(15,'About','wagtail.publish','{}','2026-02-19 16:11:14.551574',0,0,44,4,8,1,'785a25da36c041cda7ad0e73331b99bd'),(16,'About','wagtail.edit','{}','2026-02-19 16:16:16.033291',1,0,44,4,9,1,'af43c32f71b048b7b3dfbae4a991484e'),(17,'About','wagtail.edit','{}','2026-02-19 16:25:04.855481',1,0,44,4,10,1,'db060b1eadf0424087d8fba33619c640'),(18,'About','wagtail.publish','{}','2026-02-19 16:25:04.961345',0,0,44,4,10,1,'db060b1eadf0424087d8fba33619c640'),(19,'About','wagtail.move','{\"source\": {\"id\": 1, \"title\": \"Root\"}, \"destination\": {\"id\": 3, \"title\": \"Home\"}}','2026-02-19 16:33:16.488097',0,0,44,4,NULL,1,'d1f74c2c4d6044ab977beb7927387964'),(20,'About','wagtail.edit','{}','2026-02-19 16:41:16.514718',1,0,44,4,11,1,'eff1854463cf4cfbbdb31183bd45d6c0'),(21,'About','wagtail.publish','{}','2026-02-19 16:41:16.640889',0,0,44,4,11,1,'eff1854463cf4cfbbdb31183bd45d6c0'),(22,'About','wagtail.edit','{}','2026-02-19 17:16:58.000086',1,0,44,4,12,1,'ab6a43de980c486e91b0ea2943709be7'),(23,'About','wagtail.publish','{}','2026-02-19 17:16:58.283119',1,0,44,4,12,1,'ab6a43de980c486e91b0ea2943709be7'),(24,'About','wagtail.edit','{}','2026-02-19 17:27:04.057488',1,0,44,4,13,1,'a527d62b91134f248710795c8d478d73'),(25,'About','wagtail.publish','{}','2026-02-19 17:27:04.188885',1,0,44,4,13,1,'a527d62b91134f248710795c8d478d73'),(26,'About','wagtail.edit','{}','2026-02-19 17:28:15.702919',1,0,44,4,14,1,'6ed750e4293c40ea9779bb223cfd0b83'),(27,'About','wagtail.publish','{}','2026-02-19 17:28:15.854737',1,0,44,4,14,1,'6ed750e4293c40ea9779bb223cfd0b83'),(28,'About','wagtail.edit','{}','2026-02-19 17:31:21.021297',1,0,44,4,15,1,'439643c5c6aa4a52a808534f4bff1a8b'),(29,'About','wagtail.publish','{}','2026-02-19 17:31:21.077074',1,0,44,4,15,1,'439643c5c6aa4a52a808534f4bff1a8b'),(30,'About','wagtail.edit','{}','2026-02-19 17:31:35.461142',1,0,44,4,16,1,'79e6a97445d24abeb3171e49743a2067'),(31,'About','wagtail.publish','{}','2026-02-19 17:31:35.514704',0,0,44,4,16,1,'79e6a97445d24abeb3171e49743a2067'),(32,'About','wagtail.edit','{}','2026-02-19 17:38:59.787757',1,0,44,4,17,1,'0c2daa8a3f5544f1a5ace9c0fd877d2f'),(33,'About','wagtail.edit','{}','2026-02-19 17:39:04.675335',1,0,44,4,18,1,'368cbe1750124c469811f1ac01379381'),(34,'About','wagtail.publish','{}','2026-02-19 17:39:04.722391',1,0,44,4,18,1,'368cbe1750124c469811f1ac01379381'),(35,'About','wagtail.edit','{}','2026-02-19 17:41:58.699077',1,0,44,4,19,1,'599d45979242441e89813ae8bb26aa07'),(36,'About','wagtail.publish','{}','2026-02-19 17:41:58.754150',1,0,44,4,19,1,'599d45979242441e89813ae8bb26aa07'),(37,'About','wagtail.edit','{}','2026-02-19 17:55:37.812404',1,0,44,4,20,1,'2e6fe7e4fa994c0aa689088b198f20c9'),(38,'About','wagtail.publish','{}','2026-02-19 17:55:37.863830',1,0,44,4,20,1,'2e6fe7e4fa994c0aa689088b198f20c9'),(39,'About','wagtail.edit','{}','2026-02-20 07:03:15.259226',1,0,44,4,21,1,'d2a08b4865f14e189ff0d1919668a323'),(40,'About','wagtail.publish','{}','2026-02-20 07:03:15.312477',1,0,44,4,21,1,'d2a08b4865f14e189ff0d1919668a323'),(41,'About','wagtail.edit','{}','2026-02-20 08:33:24.003681',1,0,44,4,22,1,'b40ce22aa04a4a33807d94158150e80a'),(42,'About','wagtail.publish','{}','2026-02-20 08:33:24.062163',1,0,44,4,22,1,'b40ce22aa04a4a33807d94158150e80a'),(43,'Home','wagtail.edit','{}','2026-02-20 09:03:02.826946',1,0,2,3,23,1,'3bfb79da2f67436483e3b9e09c813ef0'),(44,'Home','wagtail.publish','{}','2026-02-20 09:03:02.880523',1,0,2,3,23,1,'3bfb79da2f67436483e3b9e09c813ef0'),(45,'Home','wagtail.edit','{}','2026-02-20 17:48:48.161836',1,0,2,3,24,1,'bc692c13b26b4c63a4e14d89da2aa7a7'),(46,'Home','wagtail.publish','{}','2026-02-20 17:48:48.246805',1,0,2,3,24,1,'bc692c13b26b4c63a4e14d89da2aa7a7'),(47,'Blog','wagtail.create','{}','2026-02-21 09:33:21.241476',1,0,48,5,NULL,1,'a2281b9ddb66408ca60121b0e0ffaf72'),(48,'Blog','wagtail.edit','{}','2026-02-21 09:33:21.278727',1,0,48,5,25,1,'a2281b9ddb66408ca60121b0e0ffaf72'),(49,'Blog','wagtail.publish','{}','2026-02-21 09:33:21.330396',1,0,48,5,25,1,'a2281b9ddb66408ca60121b0e0ffaf72'),(50,'Blog Post #1','wagtail.create','{}','2026-02-21 09:35:57.163234',1,0,49,6,NULL,1,'c2b95402963941c89421b01c7b2af80a'),(51,'Blog Post #1','wagtail.edit','{}','2026-02-21 09:35:57.208724',1,0,49,6,26,1,'c2b95402963941c89421b01c7b2af80a'),(52,'Blog Post #1','wagtail.publish','{}','2026-02-21 09:35:57.267831',1,0,49,6,26,1,'c2b95402963941c89421b01c7b2af80a'),(53,'Blog Post #1','wagtail.create','{}','2026-02-21 09:40:11.118677',1,0,49,7,NULL,1,'2c33ccca6be34af3a95c8edf57651b79'),(54,'Blog Post #2','wagtail.copy','{\"page\": {\"id\": 7, \"title\": \"Blog Post #2\", \"locale\": {\"id\": 1, \"language_code\": \"en\"}}, \"source\": {\"id\": 5, \"title\": \"Blog\"}, \"keep_live\": true, \"destination\": {\"id\": 5, \"title\": \"Blog\"}, \"source_locale\": {\"id\": 1, \"language_code\": \"en\"}}','2026-02-21 09:40:11.182245',0,0,49,7,NULL,1,'2c33ccca6be34af3a95c8edf57651b79'),(55,'Blog Post #2','wagtail.publish','{}','2026-02-21 09:40:11.190786',0,0,49,7,28,1,'2c33ccca6be34af3a95c8edf57651b79'),(56,'Blog Post #2','wagtail.edit','{}','2026-02-21 09:40:41.524969',1,0,49,7,29,1,'334b29afa3d04f9f962ebb5b255af54c'),(57,'Blog Post #2','wagtail.publish','{}','2026-02-21 09:40:41.586106',1,0,49,7,29,1,'334b29afa3d04f9f962ebb5b255af54c'),(58,'About','wagtail.edit','{}','2026-02-22 07:44:26.501337',1,0,44,4,30,1,'5db8bb7d6c6b48889ac71c22b982325d'),(59,'About','wagtail.publish','{}','2026-02-22 07:44:26.578831',1,0,44,4,30,1,'5db8bb7d6c6b48889ac71c22b982325d'),(60,'Blog Post #1','wagtail.edit','{}','2026-02-22 09:58:48.014191',1,0,49,6,31,1,'59372620e57b4f0d890f3afdac09b6e6'),(61,'Blog Post #1','wagtail.publish','{}','2026-02-22 09:58:48.099256',1,0,49,6,31,1,'59372620e57b4f0d890f3afdac09b6e6'),(62,'Blog Post #1','wagtail.edit','{}','2026-02-22 09:59:00.532014',1,0,49,6,32,1,'e2ea83449dfe411da7ada14db6c2c7a3'),(63,'Blog Post #1','wagtail.publish','{}','2026-02-22 09:59:00.624812',1,0,49,6,32,1,'e2ea83449dfe411da7ada14db6c2c7a3'),(64,'Blog Post #1','wagtail.edit','{}','2026-02-22 10:02:48.636418',1,0,49,6,33,1,'2645e49a93df460ea180c57314ea845a'),(65,'Blog Post #1','wagtail.publish','{}','2026-02-22 10:02:48.706210',1,0,49,6,33,1,'2645e49a93df460ea180c57314ea845a'),(66,'Blog Post #2','wagtail.edit','{}','2026-02-22 10:02:55.975308',1,0,49,7,34,1,'6256593716764bfea67a6d3f4b125b9d'),(67,'Blog Post #2','wagtail.publish','{}','2026-02-22 10:02:56.032711',1,0,49,7,34,1,'6256593716764bfea67a6d3f4b125b9d'),(68,'Blog Post #1','wagtail.edit','{}','2026-02-22 10:33:14.037248',1,0,49,6,35,1,'86d3a0c08c534b9ebd49aa24dc228466'),(69,'Blog Post #1','wagtail.publish','{}','2026-02-22 10:33:14.123382',1,0,49,6,35,1,'86d3a0c08c534b9ebd49aa24dc228466'),(70,'Blog Post #2','wagtail.edit','{}','2026-02-22 10:33:21.950746',1,0,49,7,36,1,'3f5139b720854262b4adfcd3ba12511a'),(71,'Blog Post #2','wagtail.publish','{}','2026-02-22 10:33:22.022143',1,0,49,7,36,1,'3f5139b720854262b4adfcd3ba12511a'),(72,'Blog Post #1','wagtail.edit','{}','2026-02-22 10:38:43.344771',1,0,49,6,37,1,'ae9f2cf1f2f346b797a9882a626507c9'),(73,'Blog Post #1','wagtail.publish','{}','2026-02-22 10:38:43.483642',0,0,49,6,37,1,'ae9f2cf1f2f346b797a9882a626507c9'),(74,'Article Blog Page','wagtail.create','{}','2026-02-23 09:08:19.996184',1,0,53,8,NULL,1,'6ee19d81d18c4e3884b7539dccd1373c'),(75,'Article Blog Page','wagtail.edit','{}','2026-02-23 09:08:20.045827',1,0,53,8,38,1,'6ee19d81d18c4e3884b7539dccd1373c'),(76,'Article Blog Page','wagtail.publish','{}','2026-02-23 09:08:20.114601',1,0,53,8,38,1,'6ee19d81d18c4e3884b7539dccd1373c'),(77,'Article Blog Page','wagtail.edit','{}','2026-02-23 09:28:04.074146',1,0,53,8,39,1,'03eea645e33d4d389cac6c067e1e136c'),(78,'Article Blog Page','wagtail.publish','{}','2026-02-23 09:28:04.158293',0,0,53,8,39,1,'03eea645e33d4d389cac6c067e1e136c'),(79,'Video Blog Article','wagtail.create','{}','2026-02-23 10:33:56.023283',1,0,54,9,NULL,1,'39204aaf20b4466f9a09ac3efbfba9de'),(80,'Video Blog Article','wagtail.edit','{}','2026-02-23 10:33:56.065526',1,0,54,9,40,1,'39204aaf20b4466f9a09ac3efbfba9de'),(81,'Video Blog Article','wagtail.publish','{}','2026-02-23 10:33:56.128629',1,0,54,9,40,1,'39204aaf20b4466f9a09ac3efbfba9de'),(82,'Video Blog Article','wagtail.edit','{}','2026-02-23 10:40:05.012521',1,0,54,9,41,1,'78ed634865064b0a8efb3e26f057f9c6'),(83,'Video Blog Article','wagtail.publish','{}','2026-02-23 10:40:05.077322',1,0,54,9,41,1,'78ed634865064b0a8efb3e26f057f9c6'),(84,'Video Blog Article','wagtail.move','{\"source\": {\"id\": 3, \"title\": \"Home\"}, \"destination\": {\"id\": 5, \"title\": \"Blog\"}}','2026-02-23 10:45:18.141531',0,0,54,9,NULL,1,'e56ee49e2a2d416eb91176ecfb54b3d3'),(85,'Article Blog Page','wagtail.edit','{}','2026-02-24 15:40:28.976913',1,0,53,8,42,1,'5077f4363b0e4e8eab638d22a0172782'),(86,'Article Blog Page','wagtail.publish','{}','2026-02-24 15:40:29.048918',1,0,53,8,42,1,'5077f4363b0e4e8eab638d22a0172782'),(87,'Article Blog Page','wagtail.edit','{}','2026-02-24 16:04:35.754908',1,0,53,8,43,1,'6bd47a5a206e491685bc9e7bf1ff5265'),(88,'Article Blog Page','wagtail.publish','{}','2026-02-24 16:04:35.891374',1,0,53,8,43,1,'6bd47a5a206e491685bc9e7bf1ff5265'),(89,'Article Blog Page','wagtail.edit','{}','2026-02-24 16:08:04.730653',1,0,53,8,44,1,'a24721d2f76a406792ccb88ea39d1e8a'),(90,'Article Blog Page','wagtail.publish','{}','2026-02-24 16:08:04.803004',1,0,53,8,44,1,'a24721d2f76a406792ccb88ea39d1e8a'),(91,'Contact Form','wagtail.create','{}','2026-02-24 17:52:56.652111',1,0,57,10,NULL,1,'062a5851107e49d8ab59c606993c2cf2'),(92,'Contact Form','wagtail.edit','{}','2026-02-24 17:52:56.750835',1,0,57,10,45,1,'062a5851107e49d8ab59c606993c2cf2'),(93,'Contact Form','wagtail.publish','{}','2026-02-24 17:52:56.902312',1,0,57,10,45,1,'062a5851107e49d8ab59c606993c2cf2'),(94,'Video Blog Article','wagtail.edit','{}','2026-02-25 17:02:35.659782',1,0,54,9,46,1,'beaf70de74ed4fd8bc35804f6cae0b9e'),(95,'Video Blog Article','wagtail.publish','{}','2026-02-25 17:02:35.724095',1,0,54,9,46,1,'beaf70de74ed4fd8bc35804f6cae0b9e'),(96,'fdf','wagtail.create','{}','2026-02-28 11:45:00.901458',1,0,57,11,NULL,1,'fa056958a3c641f4b6ca82a9df0baaa7'),(97,'fdf','wagtail.edit','{}','2026-02-28 11:45:00.955118',1,0,57,11,47,1,'fa056958a3c641f4b6ca82a9df0baaa7'),(98,'fdf','wagtail.delete','{}','2026-02-28 11:45:41.427545',0,1,57,11,NULL,1,'22c7a631968949cf8b1b883fb6279706'),(99,'fgyjhdgj','wagtail.create','{}','2026-02-28 11:45:53.038350',1,0,57,12,NULL,1,'2213b5e5ad434144bd93c54e4fc23023'),(100,'fgyjhdgj','wagtail.edit','{}','2026-02-28 11:45:53.078493',1,0,57,12,48,1,'2213b5e5ad434144bd93c54e4fc23023'),(101,'fgyjhdgj','wagtail.delete','{}','2026-02-28 11:46:02.362988',0,1,57,12,NULL,1,'70931fd6f93c40e18bbeade50d96bf50'),(102,'hfghg','wagtail.create','{}','2026-02-28 11:46:12.014249',1,0,44,13,NULL,1,'575fd03ad5cc4af09a8b0102248af5c7'),(103,'hfghg','wagtail.edit','{}','2026-02-28 11:46:12.051986',1,0,44,13,49,1,'575fd03ad5cc4af09a8b0102248af5c7'),(104,'hfghg','wagtail.delete','{}','2026-02-28 11:46:31.093749',0,1,44,13,NULL,1,'1c9e362999fa4781ab4262826bc3f400'),(105,'Article Blog Page','wagtail.edit','{}','2026-03-01 10:46:05.886456',1,0,53,8,50,1,'23c6c96dc3ac4b958d72966c9c33a6c6'),(106,'Article Blog Page','wagtail.publish','{}','2026-03-01 10:46:05.981715',1,0,53,8,50,1,'23c6c96dc3ac4b958d72966c9c33a6c6'),(107,'Article Blog Page','wagtail.edit','{}','2026-03-01 10:46:37.658072',1,0,53,8,51,1,'fa086750255d4ef9bd2fa1565d129b90'),(108,'Article Blog Page','wagtail.publish','{}','2026-03-01 10:46:37.740510',0,0,53,8,51,1,'fa086750255d4ef9bd2fa1565d129b90'),(109,'Blog Post #1','wagtail.edit','{}','2026-03-01 10:55:47.081988',1,0,49,6,52,1,'41f5be2dece4432aa61a85e3733467fd'),(110,'First Blog Post(test title)','wagtail.publish','{}','2026-03-01 10:55:47.178240',1,0,49,6,52,1,'41f5be2dece4432aa61a85e3733467fd'),(111,'Video Blog Article','wagtail.edit','{}','2026-03-01 11:04:36.725564',1,0,54,9,53,1,'eb1cfba201854b44968aef407147ea73'),(112,'Video Blog Article','wagtail.publish','{}','2026-03-01 11:04:36.786997',1,0,54,9,53,1,'eb1cfba201854b44968aef407147ea73'),(113,'About','wagtail.edit','{}','2026-03-04 11:18:08.748519',1,0,44,4,54,1,'6460dda48e054cd593475a4bece68aad'),(114,'About','wagtail.publish','{}','2026-03-04 11:18:08.881028',1,0,44,4,54,1,'6460dda48e054cd593475a4bece68aad'),(115,'Blog Post #2','wagtail.edit','{}','2026-03-04 18:12:44.420658',1,0,49,7,55,1,'340ebc72a1634f92b45f17d0ff95ce55'),(116,'Blog Post #2','wagtail.publish','{}','2026-03-04 18:12:44.504842',0,0,49,7,55,1,'340ebc72a1634f92b45f17d0ff95ce55'),(117,'First Blog Post(test title)','wagtail.edit','{}','2026-03-04 19:19:56.891716',1,0,49,6,56,1,'50cb51f5b818469a9f0c0875d579f6b2'),(118,'First Blog Post(test title)','wagtail.publish','{}','2026-03-04 19:19:56.972180',0,0,49,6,56,1,'50cb51f5b818469a9f0c0875d579f6b2'),(119,'Video Blog Article','wagtail.edit','{}','2026-03-04 19:20:05.293824',1,0,54,9,57,1,'acc2d6120d4b4ccaa552b655c0daeb3f'),(120,'Video Blog Article','wagtail.publish','{}','2026-03-04 19:20:05.360494',1,0,54,9,57,1,'acc2d6120d4b4ccaa552b655c0daeb3f'),(121,'Article Blog Page','wagtail.edit','{}','2026-03-04 19:20:21.118038',1,0,53,8,58,1,'8cb7b23bcb4a440cace0b4085e1eccf9'),(122,'Article Blog Page','wagtail.publish','{}','2026-03-04 19:20:21.199230',1,0,53,8,58,1,'8cb7b23bcb4a440cace0b4085e1eccf9'),(123,'First Blog Post(test title)','wagtail.edit','{}','2026-03-07 09:14:32.043867',1,0,49,6,59,1,'1676cd0cd04c408ba7017bd2c4f38766'),(124,'First Blog Post(test title)','wagtail.publish','{}','2026-03-07 09:14:32.122634',1,0,49,6,59,1,'1676cd0cd04c408ba7017bd2c4f38766');
/*!40000 ALTER TABLE `wagtailcore_pagelogentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_pagesubscription`
--

DROP TABLE IF EXISTS `wagtailcore_pagesubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_pagesubscription` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment_notifications` tinyint(1) NOT NULL,
  `page_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_pagesubscription_page_id_user_id_0cef73ed_uniq` (`page_id`,`user_id`),
  KEY `wagtailcore_pagesubscription_user_id_89d7def9_fk_auth_user_id` (`user_id`),
  CONSTRAINT `wagtailcore_pagesubs_page_id_a085e7a6_fk_wagtailco` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `wagtailcore_pagesubscription_user_id_89d7def9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_pagesubscription`
--

LOCK TABLES `wagtailcore_pagesubscription` WRITE;
/*!40000 ALTER TABLE `wagtailcore_pagesubscription` DISABLE KEYS */;
INSERT INTO `wagtailcore_pagesubscription` VALUES (1,0,3,1),(2,1,4,1),(3,1,5,1),(4,1,6,1),(5,0,7,1),(6,1,8,1),(7,1,9,1),(8,1,10,1);
/*!40000 ALTER TABLE `wagtailcore_pagesubscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_pageviewrestriction`
--

DROP TABLE IF EXISTS `wagtailcore_pageviewrestriction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_pageviewrestriction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  `page_id` int NOT NULL,
  `restriction_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_pageview_page_id_15a8bea6_fk_wagtailco` (`page_id`),
  CONSTRAINT `wagtailcore_pageview_page_id_15a8bea6_fk_wagtailco` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_pageviewrestriction`
--

LOCK TABLES `wagtailcore_pageviewrestriction` WRITE;
/*!40000 ALTER TABLE `wagtailcore_pageviewrestriction` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_pageviewrestriction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_pageviewrestriction_groups`
--

DROP TABLE IF EXISTS `wagtailcore_pageviewrestriction_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_pageviewrestriction_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pageviewrestriction_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_pageviewrest_pageviewrestriction_id_g_d23f80bb_uniq` (`pageviewrestriction_id`,`group_id`),
  KEY `wagtailcore_pageview_group_id_6460f223_fk_auth_grou` (`group_id`),
  CONSTRAINT `wagtailcore_pageview_group_id_6460f223_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `wagtailcore_pageview_pageviewrestriction__f147a99a_fk_wagtailco` FOREIGN KEY (`pageviewrestriction_id`) REFERENCES `wagtailcore_pageviewrestriction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_pageviewrestriction_groups`
--

LOCK TABLES `wagtailcore_pageviewrestriction_groups` WRITE;
/*!40000 ALTER TABLE `wagtailcore_pageviewrestriction_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_pageviewrestriction_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_referenceindex`
--

DROP TABLE IF EXISTS `wagtailcore_referenceindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_referenceindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_id` varchar(255) NOT NULL,
  `to_object_id` varchar(255) NOT NULL,
  `model_path` longtext NOT NULL,
  `content_path` longtext NOT NULL,
  `content_path_hash` char(32) NOT NULL,
  `base_content_type_id` int NOT NULL,
  `content_type_id` int NOT NULL,
  `to_content_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_referenceind_base_content_type_id_obj_9e6ccd6a_uniq` (`base_content_type_id`,`object_id`,`to_content_type_id`,`to_object_id`,`content_path_hash`),
  KEY `wagtailcore_referenc_content_type_id_766e0336_fk_django_co` (`content_type_id`),
  KEY `wagtailcore_referenc_to_content_type_id_93690bbd_fk_django_co` (`to_content_type_id`),
  CONSTRAINT `wagtailcore_referenc_base_content_type_id_313cf40f_fk_django_co` FOREIGN KEY (`base_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailcore_referenc_content_type_id_766e0336_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailcore_referenc_to_content_type_id_93690bbd_fk_django_co` FOREIGN KEY (`to_content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_referenceindex`
--

LOCK TABLES `wagtailcore_referenceindex` WRITE;
/*!40000 ALTER TABLE `wagtailcore_referenceindex` DISABLE KEYS */;
INSERT INTO `wagtailcore_referenceindex` VALUES (1,'1','1','collection','collection','b40b1263e92957f2a7f89dbce56b887b',28,28,9),(3,'2','1','collection','collection','b40b1263e92957f2a7f89dbce56b887b',28,28,9),(4,'3','2','banner_image','banner_image','fb3a495a0fce558cbc63b324b68ad8f5',1,2,28),(5,'4','3','content.full_richtext','content.bc68489c-f935-4384-a8ba-d91c330b82b4','6c5c38376b3756f0b6f163cad0b03fb3',1,44,1),(6,'3','1','collection','collection','b40b1263e92957f2a7f89dbce56b887b',28,28,9),(7,'4','1','collection','collection','b40b1263e92957f2a7f89dbce56b887b',28,28,9),(8,'5','1','collection','collection','b40b1263e92957f2a7f89dbce56b887b',28,28,9),(9,'4','3','content.cards.cards.item.button_page','content.272b174f-3a18-4daa-a676-9ac1a780eb2f.cards.93a4accc-3d34-44ef-9965-ab1b5c7e90b7.button_page','f4282da2fc9c54eebe67e8ddda05e82c',1,44,1),(10,'4','5','content.cards.cards.item.image','content.272b174f-3a18-4daa-a676-9ac1a780eb2f.cards.54993668-c47f-454e-b7a1-2efebefa74b1.image','47cf46ba8a9356feadcb250f22e5c008',1,44,28),(11,'4','4','content.cards.cards.item.image','content.272b174f-3a18-4daa-a676-9ac1a780eb2f.cards.93a4accc-3d34-44ef-9965-ab1b5c7e90b7.image','123ec877f0905117a5058f61993c9887',1,44,28),(12,'4','3','content.cards.cards.item.image','content.272b174f-3a18-4daa-a676-9ac1a780eb2f.cards.50135788-a1c5-45df-8383-4871cc1d149a.image','dafc35f7e727527d8be64f7611dfa2f0',1,44,28),(13,'4','3','content.cards.cards.item.button_page','content.272b174f-3a18-4daa-a676-9ac1a780eb2f.cards.50135788-a1c5-45df-8383-4871cc1d149a.button_page','ea32a9e685f554dcafcd3a35dd74c64c',1,44,1),(14,'4','3','content.cards.cards.item.button_page','content.272b174f-3a18-4daa-a676-9ac1a780eb2f.cards.54993668-c47f-454e-b7a1-2efebefa74b1.button_page','faf2727e932a574da9c2e82e50458075',1,44,1),(15,'4','4','content.cta.button_page','content.9c0ae004-6c50-47d5-9331-3e2853b55061.button_page','a580f7cf3e90556f96a7d7a60a66f591',1,44,1),(16,'3','3','content.cta.button_page','content.c2b89da7-5688-400c-82c7-7c66e72ed10e.button_page','3447026fa473542ba171bfdef1bf773d',1,2,1),(17,'6','1','collection','collection','b40b1263e92957f2a7f89dbce56b887b',28,28,9),(18,'7','1','collection','collection','b40b1263e92957f2a7f89dbce56b887b',28,28,9),(19,'8','1','collection','collection','b40b1263e92957f2a7f89dbce56b887b',28,28,9),(20,'9','1','collection','collection','b40b1263e92957f2a7f89dbce56b887b',28,28,9),(25,'3','7','carousel_images.item.carousel_image','carousel_images.1.carousel_image','1547baa7f2c352858b8fa86989fa0d7b',1,2,28),(26,'3','8','carousel_images.item.carousel_image','carousel_images.2.carousel_image','cab6e1b0dcce58828d7693c51af04d67',1,2,28),(27,'3','9','carousel_images.item.carousel_image','carousel_images.3.carousel_image','66b4773e01dc5b59899589ff04474df9',1,2,28),(28,'3','6','carousel_images.item.carousel_image','carousel_images.4.carousel_image','d1d660a8656454a58cd64a9715337578',1,2,28),(32,'10','1','collection','collection','b40b1263e92957f2a7f89dbce56b887b',28,28,9),(33,'1','10','image','image','3cb1a537a728548bb2078423b6010580',50,50,28),(34,'2','10','image','image','3cb1a537a728548bb2078423b6010580',50,50,28),(36,'6','1','blog_authors.item.author','blog_authors.1.author','a01321a0d0d757d197a71e62898bef66',1,49,50),(38,'6','2','blog_authors.item.author','blog_authors.2.author','f44fcd24826d5be9bf17bc9ddfd1cc42',1,49,50),(40,'7','1','blog_authors.item.author','blog_authors.3.author','1846b7d4cc035b7294fc295055867639',1,49,50),(42,'8','9','intro_image','intro_image','3ea683efaf81586c99b2f8aa16dd4c87',1,53,28),(43,'8','8','banner_image','banner_image','fb3a495a0fce558cbc63b324b68ad8f5',1,53,28),(44,'8','1','blog_authors.item.author','blog_authors.4.author','c51eb499a347582f908d90f2f4bef4f4',1,53,50),(46,'9','1','blog_authors.item.author','blog_authors.5.author','4ec068c899cb59d1b201a95e84e5eb53',1,54,50),(47,'1','5','menu_items.item.link_page','menu_items.1.link_page','8956539245d85313b0fefa69fdcfd6e3',55,55,1),(48,'8','5','tagged_items.item.tag','tagged_items.None.tag','ba6661ca69a85ae1a6aafb67dbf805eb',1,53,36),(50,'6','1','banner_image','banner_image','fb3a495a0fce558cbc63b324b68ad8f5',1,49,28),(51,'6','5','tagged_items.item.tag','tagged_items.None.tag','ba6661ca69a85ae1a6aafb67dbf805eb',1,49,36),(52,'9','5','tagged_items.item.tag','tagged_items.None.tag','ba6661ca69a85ae1a6aafb67dbf805eb',1,54,36),(53,'7','2','banner_image','banner_image','fb3a495a0fce558cbc63b324b68ad8f5',1,49,28);
/*!40000 ALTER TABLE `wagtailcore_referenceindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_revision`
--

DROP TABLE IF EXISTS `wagtailcore_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_revision` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `content` json NOT NULL,
  `approved_go_live_at` datetime(6) DEFAULT NULL,
  `object_id` varchar(255) NOT NULL,
  `user_id` int DEFAULT NULL,
  `content_type_id` int NOT NULL,
  `base_content_type_id` int NOT NULL,
  `object_str` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id` (`user_id`),
  KEY `wagtailcore_pagerevision_created_at_66954e3b` (`created_at`),
  KEY `wagtailcore_pagerevision_approved_go_live_at_e56afc67` (`approved_go_live_at`),
  KEY `content_object_idx` (`content_type_id`,`object_id`),
  KEY `base_content_object_idx` (`base_content_type_id`,`object_id`),
  CONSTRAINT `wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `wagtailcore_revision_base_content_type_id_5b4ef7bd_fk_django_co` FOREIGN KEY (`base_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailcore_revision_content_type_id_c8cb69c0_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_revision`
--

LOCK TABLES `wagtailcore_revision` WRITE;
/*!40000 ALTER TABLE `wagtailcore_revision` DISABLE KEYS */;
INSERT INTO `wagtailcore_revision` VALUES (1,'2026-02-18 19:13:00.032448','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"home\", \"depth\": 2, \"owner\": null, \"title\": \"Home\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"Home\", \"banner_title\": \"Education Consultancy Firm in Bangladesh\", \"content_type\": 2, \"live_revision\": null, \"show_in_menus\": false, \"latest_revision\": null, \"translation_key\": \"d83fcec9-bc0e-44c3-b8c8-0c8cb11e9234\", \"last_published_at\": null, \"first_published_at\": null, \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": null}',NULL,'3',1,2,1,'Home'),(2,'2026-02-18 19:42:18.806649','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"home\", \"depth\": 2, \"owner\": null, \"title\": \"Home\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"Home\", \"banner_title\": \"Education Consultancy Firm in Bangladesh\", \"content_type\": 2, \"live_revision\": null, \"show_in_menus\": false, \"latest_revision\": 1, \"translation_key\": \"d83fcec9-bc0e-44c3-b8c8-0c8cb11e9234\", \"last_published_at\": null, \"first_published_at\": null, \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": true, \"latest_revision_created_at\": \"2026-02-18T19:13:00.032Z\"}',NULL,'3',1,2,1,'Home'),(3,'2026-02-18 19:42:21.365122','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"home\", \"depth\": 2, \"owner\": null, \"title\": \"Home\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"Home\", \"banner_title\": \"Education Consultancy Firm in Bangladesh\", \"content_type\": 2, \"live_revision\": null, \"show_in_menus\": false, \"latest_revision\": 2, \"translation_key\": \"d83fcec9-bc0e-44c3-b8c8-0c8cb11e9234\", \"last_published_at\": null, \"first_published_at\": null, \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": true, \"latest_revision_created_at\": \"2026-02-18T19:42:18.806Z\"}',NULL,'3',1,2,1,'Home'),(4,'2026-02-18 19:44:13.681266','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"home\", \"depth\": 2, \"owner\": null, \"title\": \"Home\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"Home\", \"banner_title\": \"AIMS Education, Education Consultancy Firm in Bangladesh\", \"content_type\": 2, \"live_revision\": 3, \"show_in_menus\": false, \"latest_revision\": 3, \"translation_key\": \"d83fcec9-bc0e-44c3-b8c8-0c8cb11e9234\", \"last_published_at\": \"2026-02-18T19:42:21.394Z\", \"first_published_at\": \"2026-02-18T19:42:21.394Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-18T19:42:21.365Z\"}',NULL,'3',1,2,1,'Home'),(5,'2026-02-18 20:51:37.389456','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"home\", \"depth\": 2, \"owner\": null, \"title\": \"Home\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"banner_cta\": null, \"go_live_at\": null, \"draft_title\": \"Home\", \"banner_image\": 1, \"banner_title\": \"AIMS Education, Education Consultancy Firm in Bangladesh\", \"content_type\": 2, \"live_revision\": 4, \"show_in_menus\": false, \"banner_subtitle\": \"<p data-block-key=\\\"nyvwg\\\"> <b>Student Reviews From 10,000+ Successful Students Since 2017</b> </p>\", \"latest_revision\": 4, \"translation_key\": \"d83fcec9-bc0e-44c3-b8c8-0c8cb11e9234\", \"last_published_at\": \"2026-02-18T19:44:13.727Z\", \"first_published_at\": \"2026-02-18T19:42:21.394Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-18T19:44:13.681Z\"}',NULL,'3',1,2,1,'Home'),(6,'2026-02-19 10:10:52.014350','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"home\", \"depth\": 2, \"owner\": null, \"title\": \"Home\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"banner_cta\": null, \"go_live_at\": null, \"draft_title\": \"Home\", \"banner_image\": 2, \"banner_title\": \"AIMS Education, Education Consultancy Firm in Bangladesh\", \"content_type\": 2, \"live_revision\": 5, \"show_in_menus\": false, \"banner_subtitle\": \"<p data-block-key=\\\"nyvwg\\\"><b>Student Reviews From 10,000+ Successful Students Since 2017</b></p>\", \"latest_revision\": 5, \"translation_key\": \"d83fcec9-bc0e-44c3-b8c8-0c8cb11e9234\", \"last_published_at\": \"2026-02-18T20:51:37.437Z\", \"first_published_at\": \"2026-02-18T19:42:21.394Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-18T20:51:37.389Z\"}',NULL,'3',1,2,1,'Home'),(7,'2026-02-19 16:07:04.993994','{\"pk\": 4, \"live\": true, \"path\": \"00010002\", \"slug\": \"about\", \"depth\": 2, \"owner\": 1, \"title\": \"About\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"subtitle\": \"About Startup Life\", \"url_path\": \"/about/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"About\", \"content_type\": 44, \"live_revision\": null, \"show_in_menus\": false, \"latest_revision\": null, \"translation_key\": \"ebffe46c-ca52-4e3e-91f1-42d9268f733f\", \"last_published_at\": null, \"first_published_at\": null, \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": null}',NULL,'4',1,44,1,'About'),(8,'2026-02-19 16:11:14.374854','{\"pk\": 4, \"live\": true, \"path\": \"00010002\", \"slug\": \"about\", \"depth\": 2, \"owner\": 1, \"title\": \"About\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"subtitle\": \"About Startup Life\", \"url_path\": \"/about/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"About\", \"content_type\": 44, \"live_revision\": 7, \"show_in_menus\": false, \"latest_revision\": 7, \"translation_key\": \"ebffe46c-ca52-4e3e-91f1-42d9268f733f\", \"last_published_at\": \"2026-02-19T16:07:05.075Z\", \"first_published_at\": \"2026-02-19T16:07:05.075Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-19T16:07:04.993Z\"}',NULL,'4',1,44,1,'About'),(9,'2026-02-19 16:16:15.982945','{\"pk\": 4, \"live\": true, \"path\": \"00010002\", \"slug\": \"about\", \"depth\": 2, \"owner\": 1, \"title\": \"About\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"subtitle\": \"About Startup Life\", \"url_path\": \"/about/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"About\", \"content_type\": 44, \"live_revision\": 8, \"show_in_menus\": false, \"latest_revision\": 8, \"translation_key\": \"ebffe46c-ca52-4e3e-91f1-42d9268f733f\", \"last_published_at\": \"2026-02-19T16:11:14.480Z\", \"first_published_at\": \"2026-02-19T16:07:05.075Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-19T16:11:14.374Z\"}',NULL,'4',1,44,1,'About'),(10,'2026-02-19 16:25:04.812897','{\"pk\": 4, \"live\": true, \"path\": \"00010002\", \"slug\": \"about\", \"depth\": 2, \"owner\": 1, \"title\": \"About\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"subtitle\": \"About Startup Life\", \"url_path\": \"/about/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"About\", \"content_type\": 44, \"live_revision\": 8, \"show_in_menus\": false, \"latest_revision\": 9, \"translation_key\": \"ebffe46c-ca52-4e3e-91f1-42d9268f733f\", \"last_published_at\": \"2026-02-19T16:11:14.480Z\", \"first_published_at\": \"2026-02-19T16:07:05.075Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": true, \"latest_revision_created_at\": \"2026-02-19T16:16:15.982Z\"}',NULL,'4',1,44,1,'About'),(11,'2026-02-19 16:41:16.367243','{\"pk\": 4, \"live\": true, \"path\": \"000100010001\", \"slug\": \"about\", \"depth\": 3, \"owner\": 1, \"title\": \"About\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"subtitle\": \"About Startup Life\", \"url_path\": \"/home/about/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"About\", \"content_type\": 44, \"live_revision\": 10, \"show_in_menus\": false, \"latest_revision\": 10, \"translation_key\": \"ebffe46c-ca52-4e3e-91f1-42d9268f733f\", \"last_published_at\": \"2026-02-19T16:25:04.892Z\", \"first_published_at\": \"2026-02-19T16:07:05.075Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-19T16:25:04.812Z\"}',NULL,'4',1,44,1,'About'),(12,'2026-02-19 17:16:57.857735','{\"pk\": 4, \"live\": true, \"path\": \"000100010001\", \"slug\": \"about\", \"depth\": 3, \"owner\": 1, \"title\": \"About\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Welcome to startup Life\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"d355620e-8fcf-4c57-a033-8cdf43a60f68\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"subtitle\": \"About Startup Life\", \"url_path\": \"/home/about/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"About\", \"content_type\": 44, \"live_revision\": 11, \"show_in_menus\": false, \"latest_revision\": 11, \"translation_key\": \"ebffe46c-ca52-4e3e-91f1-42d9268f733f\", \"last_published_at\": \"2026-02-19T16:41:16.564Z\", \"first_published_at\": \"2026-02-19T16:07:05.075Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-19T16:41:16.367Z\"}',NULL,'4',1,44,1,'About'),(13,'2026-02-19 17:27:04.008330','{\"pk\": 4, \"live\": true, \"path\": \"000100010001\", \"slug\": \"about\", \"depth\": 3, \"owner\": 1, \"title\": \"About\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Welcome to startup Life\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"d355620e-8fcf-4c57-a033-8cdf43a60f68\\\"}, {\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"AIMS Education\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"a24f5edd-8fbd-413b-a76a-27d804c3aee2\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"subtitle\": \"About Startup Life\", \"url_path\": \"/home/about/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"About\", \"content_type\": 44, \"live_revision\": 12, \"show_in_menus\": false, \"latest_revision\": 12, \"translation_key\": \"ebffe46c-ca52-4e3e-91f1-42d9268f733f\", \"last_published_at\": \"2026-02-19T17:16:58.089Z\", \"first_published_at\": \"2026-02-19T16:07:05.075Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-19T17:16:57.857Z\"}',NULL,'4',1,44,1,'About'),(14,'2026-02-19 17:28:15.611195','{\"pk\": 4, \"live\": true, \"path\": \"000100010001\", \"slug\": \"about\", \"depth\": 3, \"owner\": 1, \"title\": \"About\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Welcome to startup Life\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"d355620e-8fcf-4c57-a033-8cdf43a60f68\\\"}, {\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Second title\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"a24f5edd-8fbd-413b-a76a-27d804c3aee2\\\"}, {\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Third Title\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"dbb72971-93cc-411e-9684-54ddfeea49c7\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"subtitle\": \"About Startup Life\", \"url_path\": \"/home/about/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"About\", \"content_type\": 44, \"live_revision\": 13, \"show_in_menus\": false, \"latest_revision\": 13, \"translation_key\": \"ebffe46c-ca52-4e3e-91f1-42d9268f733f\", \"last_published_at\": \"2026-02-19T17:27:04.099Z\", \"first_published_at\": \"2026-02-19T16:07:05.075Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-19T17:27:04.008Z\"}',NULL,'4',1,44,1,'About'),(15,'2026-02-19 17:31:20.994335','{\"pk\": 4, \"live\": true, \"path\": \"000100010001\", \"slug\": \"about\", \"depth\": 3, \"owner\": 1, \"title\": \"About\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Third Title\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"dbb72971-93cc-411e-9684-54ddfeea49c7\\\"}, {\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Second title\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"a24f5edd-8fbd-413b-a76a-27d804c3aee2\\\"}, {\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Welcome to startup Life\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"d355620e-8fcf-4c57-a033-8cdf43a60f68\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"subtitle\": \"About Startup Life\", \"url_path\": \"/home/about/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"About\", \"content_type\": 44, \"live_revision\": 14, \"show_in_menus\": false, \"latest_revision\": 14, \"translation_key\": \"ebffe46c-ca52-4e3e-91f1-42d9268f733f\", \"last_published_at\": \"2026-02-19T17:28:15.763Z\", \"first_published_at\": \"2026-02-19T16:07:05.075Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-19T17:28:15.611Z\"}',NULL,'4',1,44,1,'About'),(16,'2026-02-19 17:31:35.433232','{\"pk\": 4, \"live\": true, \"path\": \"000100010001\", \"slug\": \"about\", \"depth\": 3, \"owner\": 1, \"title\": \"About\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Third Title\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"dbb72971-93cc-411e-9684-54ddfeea49c7\\\"}, {\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Second title\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"a24f5edd-8fbd-413b-a76a-27d804c3aee2\\\"}, {\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Welcome to startup Life\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"d355620e-8fcf-4c57-a033-8cdf43a60f68\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"subtitle\": \"About Startup Life\", \"url_path\": \"/home/about/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"About\", \"content_type\": 44, \"live_revision\": 15, \"show_in_menus\": false, \"latest_revision\": 15, \"translation_key\": \"ebffe46c-ca52-4e3e-91f1-42d9268f733f\", \"last_published_at\": \"2026-02-19T17:31:21.039Z\", \"first_published_at\": \"2026-02-19T16:07:05.075Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-19T17:31:20.994Z\"}',NULL,'4',1,44,1,'About'),(17,'2026-02-19 17:38:59.748257','{\"pk\": 4, \"live\": true, \"path\": \"000100010001\", \"slug\": \"about\", \"depth\": 3, \"owner\": 1, \"title\": \"About\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Third Title\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"dbb72971-93cc-411e-9684-54ddfeea49c7\\\"}, {\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Second title\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"a24f5edd-8fbd-413b-a76a-27d804c3aee2\\\"}, {\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Welcome to startup Life\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"d355620e-8fcf-4c57-a033-8cdf43a60f68\\\"}, {\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<h2 data-block-key=\\\\\\\"e8zzc\\\\\\\">Lorem </h2><p data-block-key=\\\\\\\"6vv3r\\\\\\\"><i>Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to</i></p>\\\", \\\"id\\\": \\\"bc68489c-f935-4384-a8ba-d91c330b82b4\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"subtitle\": \"About Startup Life\", \"url_path\": \"/home/about/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"About\", \"content_type\": 44, \"live_revision\": 16, \"show_in_menus\": false, \"latest_revision\": 16, \"translation_key\": \"ebffe46c-ca52-4e3e-91f1-42d9268f733f\", \"last_published_at\": \"2026-02-19T17:31:35.482Z\", \"first_published_at\": \"2026-02-19T16:07:05.075Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-19T17:31:35.433Z\"}',NULL,'4',1,44,1,'About'),(18,'2026-02-19 17:39:04.646785','{\"pk\": 4, \"live\": true, \"path\": \"000100010001\", \"slug\": \"about\", \"depth\": 3, \"owner\": 1, \"title\": \"About\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Third Title\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"dbb72971-93cc-411e-9684-54ddfeea49c7\\\"}, {\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Second title\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"a24f5edd-8fbd-413b-a76a-27d804c3aee2\\\"}, {\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Welcome to startup Life\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"d355620e-8fcf-4c57-a033-8cdf43a60f68\\\"}, {\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<h2 data-block-key=\\\\\\\"e8zzc\\\\\\\">Lorem</h2><p data-block-key=\\\\\\\"6vv3r\\\\\\\"><i>Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to</i></p>\\\", \\\"id\\\": \\\"bc68489c-f935-4384-a8ba-d91c330b82b4\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"subtitle\": \"About Startup Life\", \"url_path\": \"/home/about/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"About\", \"content_type\": 44, \"live_revision\": 16, \"show_in_menus\": false, \"latest_revision\": 17, \"translation_key\": \"ebffe46c-ca52-4e3e-91f1-42d9268f733f\", \"last_published_at\": \"2026-02-19T17:31:35.482Z\", \"first_published_at\": \"2026-02-19T16:07:05.075Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": true, \"latest_revision_created_at\": \"2026-02-19T17:38:59.748Z\"}',NULL,'4',1,44,1,'About'),(19,'2026-02-19 17:41:58.672068','{\"pk\": 4, \"live\": true, \"path\": \"000100010001\", \"slug\": \"about\", \"depth\": 3, \"owner\": 1, \"title\": \"About\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Third Title\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"dbb72971-93cc-411e-9684-54ddfeea49c7\\\"}, {\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Second title\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"a24f5edd-8fbd-413b-a76a-27d804c3aee2\\\"}, {\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Welcome to startup Life\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"d355620e-8fcf-4c57-a033-8cdf43a60f68\\\"}, {\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<h2 data-block-key=\\\\\\\"e8zzc\\\\\\\">Lorem</h2><p data-block-key=\\\\\\\"6vv3r\\\\\\\"><i>Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled </i><a linktype=\\\\\\\"page\\\\\\\" id=\\\\\\\"3\\\\\\\"><i>it to</i></a></p>\\\", \\\"id\\\": \\\"bc68489c-f935-4384-a8ba-d91c330b82b4\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"subtitle\": \"About Startup Life\", \"url_path\": \"/home/about/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"About\", \"content_type\": 44, \"live_revision\": 18, \"show_in_menus\": false, \"latest_revision\": 18, \"translation_key\": \"ebffe46c-ca52-4e3e-91f1-42d9268f733f\", \"last_published_at\": \"2026-02-19T17:39:04.691Z\", \"first_published_at\": \"2026-02-19T16:07:05.075Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-19T17:39:04.646Z\"}',NULL,'4',1,44,1,'About'),(20,'2026-02-19 17:55:37.782899','{\"pk\": 4, \"live\": true, \"path\": \"000100010001\", \"slug\": \"about\", \"depth\": 3, \"owner\": 1, \"title\": \"About\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Third Title\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"dbb72971-93cc-411e-9684-54ddfeea49c7\\\"}, {\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Second title\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"a24f5edd-8fbd-413b-a76a-27d804c3aee2\\\"}, {\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Welcome to startup Life\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"d355620e-8fcf-4c57-a033-8cdf43a60f68\\\"}, {\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<h2 data-block-key=\\\\\\\"e8zzc\\\\\\\">Lorem</h2><p data-block-key=\\\\\\\"6vv3r\\\\\\\"><i>Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled</i> <a linktype=\\\\\\\"page\\\\\\\" id=\\\\\\\"3\\\\\\\"><i>it to</i></a></p>\\\", \\\"id\\\": \\\"bc68489c-f935-4384-a8ba-d91c330b82b4\\\"}, {\\\"type\\\": \\\"simple_richtext\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"99q9d\\\\\\\"><b><i>Simple text</i></b></p>\\\", \\\"id\\\": \\\"0ce0ec7d-501e-44f9-a892-1554981aec46\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"subtitle\": \"About Startup Life\", \"url_path\": \"/home/about/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"About\", \"content_type\": 44, \"live_revision\": 19, \"show_in_menus\": false, \"latest_revision\": 19, \"translation_key\": \"ebffe46c-ca52-4e3e-91f1-42d9268f733f\", \"last_published_at\": \"2026-02-19T17:41:58.718Z\", \"first_published_at\": \"2026-02-19T16:07:05.075Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-19T17:41:58.672Z\"}',NULL,'4',1,44,1,'About'),(21,'2026-02-20 07:03:15.226749','{\"pk\": 4, \"live\": true, \"path\": \"000100010001\", \"slug\": \"about\", \"depth\": 3, \"owner\": 1, \"title\": \"About\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Third Title\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"dbb72971-93cc-411e-9684-54ddfeea49c7\\\"}, {\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Second title\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"a24f5edd-8fbd-413b-a76a-27d804c3aee2\\\"}, {\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Welcome to startup Life\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"d355620e-8fcf-4c57-a033-8cdf43a60f68\\\"}, {\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<h2 data-block-key=\\\\\\\"e8zzc\\\\\\\">Lorem</h2><p data-block-key=\\\\\\\"6vv3r\\\\\\\"><i>Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled</i> <a linktype=\\\\\\\"page\\\\\\\" id=\\\\\\\"3\\\\\\\"><i>it to</i></a></p>\\\", \\\"id\\\": \\\"bc68489c-f935-4384-a8ba-d91c330b82b4\\\"}, {\\\"type\\\": \\\"simple_richtext\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"99q9d\\\\\\\"><b><i>Simple text</i></b></p>\\\", \\\"id\\\": \\\"0ce0ec7d-501e-44f9-a892-1554981aec46\\\"}, {\\\"type\\\": \\\"cards\\\", \\\"value\\\": {\\\"title\\\": \\\"Staff Cards\\\", \\\"cards\\\": [{\\\"type\\\": \\\"item\\\", \\\"value\\\": {\\\"image\\\": 3, \\\"title\\\": \\\"Fahim Hussain Walid ( IELTS INS)\\\", \\\"text\\\": \\\"Fahim Hussain Walid ( IELTS INS)\\\", \\\"button_page\\\": 3, \\\"button_url\\\": \\\"\\\"}, \\\"id\\\": \\\"50135788-a1c5-45df-8383-4871cc1d149a\\\"}, {\\\"type\\\": \\\"item\\\", \\\"value\\\": {\\\"image\\\": 4, \\\"title\\\": \\\"M. Monsur Islam (IELTS INS)\\\", \\\"text\\\": \\\"M. Monsur Islam (IELTS INS)\\\", \\\"button_page\\\": 3, \\\"button_url\\\": \\\"\\\"}, \\\"id\\\": \\\"93a4accc-3d34-44ef-9965-ab1b5c7e90b7\\\"}, {\\\"type\\\": \\\"item\\\", \\\"value\\\": {\\\"image\\\": 5, \\\"title\\\": \\\"Aminul islam_ (IELTS INS)\\\", \\\"text\\\": \\\"Aminul islam_ (IELTS INS)\\\", \\\"button_page\\\": 3, \\\"button_url\\\": \\\"\\\"}, \\\"id\\\": \\\"54993668-c47f-454e-b7a1-2efebefa74b1\\\"}]}, \\\"id\\\": \\\"272b174f-3a18-4daa-a676-9ac1a780eb2f\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"subtitle\": \"About Startup Life\", \"url_path\": \"/home/about/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"About\", \"content_type\": 44, \"live_revision\": 20, \"show_in_menus\": false, \"latest_revision\": 20, \"translation_key\": \"ebffe46c-ca52-4e3e-91f1-42d9268f733f\", \"last_published_at\": \"2026-02-19T17:55:37.833Z\", \"first_published_at\": \"2026-02-19T16:07:05.075Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-19T17:55:37.782Z\"}',NULL,'4',1,44,1,'About'),(22,'2026-02-20 08:33:23.970758','{\"pk\": 4, \"live\": true, \"path\": \"000100010001\", \"slug\": \"about\", \"depth\": 3, \"owner\": 1, \"title\": \"About\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Third Title\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"dbb72971-93cc-411e-9684-54ddfeea49c7\\\"}, {\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Second title\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"a24f5edd-8fbd-413b-a76a-27d804c3aee2\\\"}, {\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Welcome to startup Life\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"d355620e-8fcf-4c57-a033-8cdf43a60f68\\\"}, {\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<h2 data-block-key=\\\\\\\"e8zzc\\\\\\\">Lorem</h2><p data-block-key=\\\\\\\"6vv3r\\\\\\\"><i>Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled</i> <a linktype=\\\\\\\"page\\\\\\\" id=\\\\\\\"3\\\\\\\"><i>it to</i></a></p>\\\", \\\"id\\\": \\\"bc68489c-f935-4384-a8ba-d91c330b82b4\\\"}, {\\\"type\\\": \\\"simple_richtext\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"99q9d\\\\\\\"><b><i>Simple text</i></b></p>\\\", \\\"id\\\": \\\"0ce0ec7d-501e-44f9-a892-1554981aec46\\\"}, {\\\"type\\\": \\\"cards\\\", \\\"value\\\": {\\\"title\\\": \\\"Staff Cards\\\", \\\"cards\\\": [{\\\"type\\\": \\\"item\\\", \\\"value\\\": {\\\"image\\\": 3, \\\"title\\\": \\\"Fahim Hussain Walid ( IELTS INS)\\\", \\\"text\\\": \\\"Fahim Hussain Walid ( IELTS INS)\\\", \\\"button_page\\\": 3, \\\"button_url\\\": \\\"\\\"}, \\\"id\\\": \\\"50135788-a1c5-45df-8383-4871cc1d149a\\\"}, {\\\"type\\\": \\\"item\\\", \\\"value\\\": {\\\"image\\\": 4, \\\"title\\\": \\\"M. Monsur Islam (IELTS INS)\\\", \\\"text\\\": \\\"M. Monsur Islam (IELTS INS)\\\", \\\"button_page\\\": 3, \\\"button_url\\\": \\\"\\\"}, \\\"id\\\": \\\"93a4accc-3d34-44ef-9965-ab1b5c7e90b7\\\"}, {\\\"type\\\": \\\"item\\\", \\\"value\\\": {\\\"image\\\": 5, \\\"title\\\": \\\"Aminul islam_ (IELTS INS)\\\", \\\"text\\\": \\\"Aminul islam_ (IELTS INS)\\\", \\\"button_page\\\": 3, \\\"button_url\\\": \\\"\\\"}, \\\"id\\\": \\\"54993668-c47f-454e-b7a1-2efebefa74b1\\\"}]}, \\\"id\\\": \\\"272b174f-3a18-4daa-a676-9ac1a780eb2f\\\"}, {\\\"type\\\": \\\"cta\\\", \\\"value\\\": {\\\"title\\\": \\\"Call to Action Title\\\", \\\"text\\\": \\\"<p data-block-key=\\\\\\\"xjp37\\\\\\\"><i>Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled</i> </p>\\\", \\\"button_page\\\": 4, \\\"button_url\\\": \\\"\\\", \\\"button_text\\\": \\\"Learn More\\\"}, \\\"id\\\": \\\"9c0ae004-6c50-47d5-9331-3e2853b55061\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"subtitle\": \"About Startup Life\", \"url_path\": \"/home/about/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"About\", \"content_type\": 44, \"live_revision\": 21, \"show_in_menus\": false, \"latest_revision\": 21, \"translation_key\": \"ebffe46c-ca52-4e3e-91f1-42d9268f733f\", \"last_published_at\": \"2026-02-20T07:03:15.276Z\", \"first_published_at\": \"2026-02-19T16:07:05.075Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-20T07:03:15.226Z\"}',NULL,'4',1,44,1,'About'),(23,'2026-02-20 09:03:02.796562','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"home\", \"depth\": 2, \"owner\": null, \"title\": \"Home\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"cta\\\", \\\"value\\\": {\\\"title\\\": \\\"call to action from home page\\\", \\\"text\\\": \\\"<p data-block-key=\\\\\\\"tklrm\\\\\\\">cta</p>\\\", \\\"button_page\\\": 3, \\\"button_url\\\": \\\"\\\", \\\"button_text\\\": \\\"Learn More\\\"}, \\\"id\\\": \\\"c2b89da7-5688-400c-82c7-7c66e72ed10e\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 1, \"url_path\": \"/home/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"banner_cta\": null, \"go_live_at\": null, \"draft_title\": \"Home\", \"banner_image\": 2, \"banner_title\": \"AIMS Education, Education Consultancy Firm in Bangladesh\", \"content_type\": 2, \"live_revision\": 6, \"show_in_menus\": false, \"banner_subtitle\": \"<p data-block-key=\\\"nyvwg\\\"><b>Student Reviews From 10,000+ Successful Students Since 2017</b></p>\", \"latest_revision\": 6, \"translation_key\": \"d83fcec9-bc0e-44c3-b8c8-0c8cb11e9234\", \"last_published_at\": \"2026-02-19T10:10:52.052Z\", \"first_published_at\": \"2026-02-18T19:42:21.394Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-19T10:10:52.014Z\"}',NULL,'3',1,2,1,'Home'),(24,'2026-02-20 17:48:48.129664','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"home\", \"depth\": 2, \"owner\": null, \"title\": \"Home\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"cta\\\", \\\"value\\\": {\\\"title\\\": \\\"call to action from home page\\\", \\\"text\\\": \\\"<p data-block-key=\\\\\\\"tklrm\\\\\\\">cta</p>\\\", \\\"button_page\\\": 3, \\\"button_url\\\": \\\"\\\", \\\"button_text\\\": \\\"Learn More\\\"}, \\\"id\\\": \\\"c2b89da7-5688-400c-82c7-7c66e72ed10e\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 1, \"url_path\": \"/home/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"banner_cta\": null, \"go_live_at\": null, \"draft_title\": \"Home\", \"banner_image\": 2, \"banner_title\": \"AIMS Education, Education Consultancy Firm in Bangladesh\", \"content_type\": 2, \"live_revision\": 23, \"show_in_menus\": false, \"banner_subtitle\": \"<p data-block-key=\\\"nyvwg\\\"><b>Student Reviews From 10,000+ Successful Students Since 2017</b></p>\", \"carousel_images\": [{\"pk\": null, \"page\": 3, \"sort_order\": 0, \"carousel_image\": 7}, {\"pk\": null, \"page\": 3, \"sort_order\": 1, \"carousel_image\": 8}, {\"pk\": null, \"page\": 3, \"sort_order\": 2, \"carousel_image\": 9}, {\"pk\": null, \"page\": 3, \"sort_order\": 3, \"carousel_image\": 6}], \"latest_revision\": 23, \"translation_key\": \"d83fcec9-bc0e-44c3-b8c8-0c8cb11e9234\", \"last_published_at\": \"2026-02-20T09:03:02.845Z\", \"first_published_at\": \"2026-02-18T19:42:21.394Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-20T09:03:02.796Z\"}',NULL,'3',1,2,1,'Home'),(25,'2026-02-21 09:33:21.257609','{\"pk\": 5, \"live\": true, \"path\": \"000100010002\", \"slug\": \"blog\", \"depth\": 3, \"owner\": 1, \"title\": \"Blog\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/blog/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"Blog\", \"content_type\": 48, \"custom_title\": \"Startuplife Blog\", \"live_revision\": null, \"show_in_menus\": false, \"latest_revision\": null, \"translation_key\": \"880678ad-fa6d-49e5-9587-6ca772031cb1\", \"last_published_at\": null, \"first_published_at\": null, \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": null}',NULL,'5',1,48,1,'Blog'),(26,'2026-02-21 09:35:57.183558','{\"pk\": 6, \"live\": true, \"path\": \"0001000100020001\", \"slug\": \"blog-post-1\", \"depth\": 4, \"owner\": 1, \"title\": \"Blog Post #1\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<h2 data-block-key=\\\\\\\"8vumk\\\\\\\">Hello World </h2><p data-block-key=\\\\\\\"4817b\\\\\\\">This is a simple bloc post from a full rich text himself</p>\\\", \\\"id\\\": \\\"9356bfc4-3dbc-436e-b837-34b683aed6a8\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/blog/blog-post-1/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"blog_image\": 1, \"go_live_at\": null, \"draft_title\": \"Blog Post #1\", \"content_type\": 49, \"custom_title\": \"Blog Post #1 - Custom\", \"live_revision\": null, \"show_in_menus\": false, \"latest_revision\": null, \"translation_key\": \"27cbfe3c-6c96-4bbd-b394-56f9509fbc24\", \"last_published_at\": null, \"first_published_at\": null, \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": null}',NULL,'6',1,49,1,'Blog Post #1'),(27,'2026-02-21 09:35:57.183558','{\"pk\": 7, \"live\": true, \"path\": \"0001000100020001\", \"slug\": \"blog-post-1\", \"depth\": 4, \"owner\": 1, \"title\": \"Blog Post #1\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<h2 data-block-key=\\\\\\\"8vumk\\\\\\\">Hello World </h2><p data-block-key=\\\\\\\"4817b\\\\\\\">This is a simple bloc post from a full rich text himself</p>\\\", \\\"id\\\": \\\"9356bfc4-3dbc-436e-b837-34b683aed6a8\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/blog/blog-post-1/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"blog_image\": 1, \"go_live_at\": null, \"draft_title\": \"Blog Post #1\", \"content_type\": 49, \"custom_title\": \"Blog Post #1 - Custom\", \"live_revision\": null, \"show_in_menus\": false, \"latest_revision\": null, \"translation_key\": \"27cbfe3c-6c96-4bbd-b394-56f9509fbc24\", \"last_published_at\": null, \"first_published_at\": null, \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": null}',NULL,'7',1,49,1,'Blog Post #1'),(28,'2026-02-21 09:40:11.137796','{\"pk\": 7, \"live\": true, \"path\": \"0001000100020002\", \"slug\": \"blog-post-2\", \"depth\": 4, \"owner\": 1, \"title\": \"Blog Post #2\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<h2 data-block-key=\\\\\\\"8vumk\\\\\\\">Hello World </h2><p data-block-key=\\\\\\\"4817b\\\\\\\">This is a simple bloc post from a full rich text himself</p>\\\", \\\"id\\\": \\\"9356bfc4-3dbc-436e-b837-34b683aed6a8\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/blog/blog-post-2/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"blog_image\": 1, \"go_live_at\": null, \"draft_title\": \"Blog Post #1\", \"content_type\": 49, \"custom_title\": \"Blog Post #1 - Custom\", \"live_revision\": 26, \"show_in_menus\": false, \"latest_revision\": 27, \"translation_key\": \"b8461683-46ca-412c-a4e0-74f97d527db6\", \"last_published_at\": \"2026-02-21T09:35:57.233Z\", \"first_published_at\": \"2026-02-21T09:35:57.233Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-21T09:35:57.183Z\"}',NULL,'7',1,49,1,'Blog Post #2'),(29,'2026-02-21 09:40:41.489656','{\"pk\": 7, \"live\": true, \"path\": \"0001000100020002\", \"slug\": \"blog-post-2\", \"depth\": 4, \"owner\": 1, \"title\": \"Blog Post #2\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<h2 data-block-key=\\\\\\\"8vumk\\\\\\\">Hello World2</h2><p data-block-key=\\\\\\\"4817b\\\\\\\">This is a simple bloc post from a full rich text himself</p>\\\", \\\"id\\\": \\\"9356bfc4-3dbc-436e-b837-34b683aed6a8\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/blog/blog-post-2/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"blog_image\": 2, \"go_live_at\": null, \"draft_title\": \"Blog Post #2\", \"content_type\": 49, \"custom_title\": \"Blog Post #2 - Custom\", \"live_revision\": 28, \"show_in_menus\": false, \"latest_revision\": 28, \"translation_key\": \"b8461683-46ca-412c-a4e0-74f97d527db6\", \"last_published_at\": \"2026-02-21T09:40:11.137Z\", \"first_published_at\": \"2026-02-21T09:40:11.137Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-21T09:40:11.137Z\"}',NULL,'7',1,49,1,'Blog Post #2'),(30,'2026-02-22 07:44:26.415193','{\"pk\": 4, \"live\": true, \"path\": \"000100010001\", \"slug\": \"about\", \"depth\": 3, \"owner\": 1, \"title\": \"About\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Third Title\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"dbb72971-93cc-411e-9684-54ddfeea49c7\\\"}, {\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Second title\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"a24f5edd-8fbd-413b-a76a-27d804c3aee2\\\"}, {\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Welcome to startup Life\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"d355620e-8fcf-4c57-a033-8cdf43a60f68\\\"}, {\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<h2 data-block-key=\\\\\\\"e8zzc\\\\\\\">Lorem</h2><p data-block-key=\\\\\\\"6vv3r\\\\\\\"><i>Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled</i> <a linktype=\\\\\\\"page\\\\\\\" id=\\\\\\\"3\\\\\\\"><i>it to</i></a></p>\\\", \\\"id\\\": \\\"bc68489c-f935-4384-a8ba-d91c330b82b4\\\"}, {\\\"type\\\": \\\"simple_richtext\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"99q9d\\\\\\\"><b><i>Simple text</i></b></p>\\\", \\\"id\\\": \\\"0ce0ec7d-501e-44f9-a892-1554981aec46\\\"}, {\\\"type\\\": \\\"cards\\\", \\\"value\\\": {\\\"title\\\": \\\"Staff Cards\\\", \\\"cards\\\": [{\\\"type\\\": \\\"item\\\", \\\"value\\\": {\\\"image\\\": 3, \\\"title\\\": \\\"Fahim Hussain Walid ( IELTS INS)\\\", \\\"text\\\": \\\"Fahim Hussain Walid ( IELTS INS)\\\", \\\"button_page\\\": 3, \\\"button_url\\\": \\\"\\\"}, \\\"id\\\": \\\"50135788-a1c5-45df-8383-4871cc1d149a\\\"}, {\\\"type\\\": \\\"item\\\", \\\"value\\\": {\\\"image\\\": 4, \\\"title\\\": \\\"M. Monsur Islam (IELTS INS)\\\", \\\"text\\\": \\\"M. Monsur Islam (IELTS INS)\\\", \\\"button_page\\\": 3, \\\"button_url\\\": \\\"\\\"}, \\\"id\\\": \\\"93a4accc-3d34-44ef-9965-ab1b5c7e90b7\\\"}, {\\\"type\\\": \\\"item\\\", \\\"value\\\": {\\\"image\\\": 5, \\\"title\\\": \\\"Aminul islam_ (IELTS INS)\\\", \\\"text\\\": \\\"Aminul islam_ (IELTS INS)\\\", \\\"button_page\\\": 3, \\\"button_url\\\": \\\"\\\"}, \\\"id\\\": \\\"54993668-c47f-454e-b7a1-2efebefa74b1\\\"}]}, \\\"id\\\": \\\"272b174f-3a18-4daa-a676-9ac1a780eb2f\\\"}, {\\\"type\\\": \\\"cta\\\", \\\"value\\\": {\\\"title\\\": \\\"Call to Action Title\\\", \\\"text\\\": \\\"<p data-block-key=\\\\\\\"xjp37\\\\\\\"><i>Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled</i></p>\\\", \\\"button_page\\\": 4, \\\"button_url\\\": \\\"\\\", \\\"button_text\\\": \\\"Learn More\\\"}, \\\"id\\\": \\\"9c0ae004-6c50-47d5-9331-3e2853b55061\\\"}, {\\\"type\\\": \\\"button\\\", \\\"value\\\": {\\\"button_page\\\": null, \\\"button_url\\\": \\\"http://127.0.0.1:8000/blog/\\\"}, \\\"id\\\": \\\"e69506df-a3bf-45b5-aad0-ffcb416a191b\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"subtitle\": \"About Startup Life\", \"url_path\": \"/home/about/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"About\", \"content_type\": 44, \"live_revision\": 22, \"show_in_menus\": false, \"latest_revision\": 22, \"translation_key\": \"ebffe46c-ca52-4e3e-91f1-42d9268f733f\", \"last_published_at\": \"2026-02-20T08:33:24.024Z\", \"first_published_at\": \"2026-02-19T16:07:05.075Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-20T08:33:23.970Z\"}',NULL,'4',1,44,1,'About'),(31,'2026-02-22 09:58:47.972969','{\"pk\": 6, \"live\": true, \"path\": \"0001000100020001\", \"slug\": \"blog-post-1\", \"depth\": 4, \"owner\": 1, \"title\": \"Blog Post #1\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<h2 data-block-key=\\\\\\\"8vumk\\\\\\\">Hello World</h2><p data-block-key=\\\\\\\"4817b\\\\\\\">This is a simple bloc post from a full rich text himself</p>\\\", \\\"id\\\": \\\"9356bfc4-3dbc-436e-b837-34b683aed6a8\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/blog/blog-post-1/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"blog_image\": 1, \"go_live_at\": null, \"draft_title\": \"Blog Post #1\", \"blog_authors\": [{\"pk\": null, \"page\": 6, \"author\": 1, \"sort_order\": 0}], \"content_type\": 49, \"custom_title\": \"Blog Post #1 - Custom\", \"live_revision\": 26, \"show_in_menus\": false, \"latest_revision\": 26, \"translation_key\": \"27cbfe3c-6c96-4bbd-b394-56f9509fbc24\", \"last_published_at\": \"2026-02-21T09:35:57.233Z\", \"first_published_at\": \"2026-02-21T09:35:57.233Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-21T09:35:57.183Z\"}',NULL,'6',1,49,1,'Blog Post #1'),(32,'2026-02-22 09:59:00.492312','{\"pk\": 6, \"live\": true, \"path\": \"0001000100020001\", \"slug\": \"blog-post-1\", \"depth\": 4, \"owner\": 1, \"title\": \"Blog Post #1\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<h2 data-block-key=\\\\\\\"8vumk\\\\\\\">Hello World</h2><p data-block-key=\\\\\\\"4817b\\\\\\\">This is a simple bloc post from a full rich text himself</p>\\\", \\\"id\\\": \\\"9356bfc4-3dbc-436e-b837-34b683aed6a8\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/blog/blog-post-1/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"blog_image\": 1, \"go_live_at\": null, \"draft_title\": \"Blog Post #1\", \"blog_authors\": [{\"pk\": 1, \"page\": 6, \"author\": 1, \"sort_order\": 0}, {\"pk\": null, \"page\": 6, \"author\": 2, \"sort_order\": 1}], \"content_type\": 49, \"custom_title\": \"Blog Post #1 - Custom\", \"live_revision\": 31, \"show_in_menus\": false, \"latest_revision\": 31, \"translation_key\": \"27cbfe3c-6c96-4bbd-b394-56f9509fbc24\", \"last_published_at\": \"2026-02-22T09:58:48.035Z\", \"first_published_at\": \"2026-02-21T09:35:57.233Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-22T09:58:47.972Z\"}',NULL,'6',1,49,1,'Blog Post #1'),(33,'2026-02-22 10:02:48.610626','{\"pk\": 6, \"live\": true, \"path\": \"0001000100020001\", \"slug\": \"blog-post-1\", \"depth\": 4, \"owner\": 1, \"title\": \"Blog Post #1\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<h2 data-block-key=\\\\\\\"8vumk\\\\\\\">Hello World</h2><p data-block-key=\\\\\\\"4817b\\\\\\\">This is a simple bloc post from a full rich text himself</p>\\\", \\\"id\\\": \\\"9356bfc4-3dbc-436e-b837-34b683aed6a8\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/blog/blog-post-1/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"blog_image\": 1, \"go_live_at\": null, \"draft_title\": \"Blog Post #1\", \"blog_authors\": [{\"pk\": 2, \"page\": 6, \"author\": 2, \"sort_order\": 0}, {\"pk\": 1, \"page\": 6, \"author\": 1, \"sort_order\": 1}], \"content_type\": 49, \"custom_title\": \"Blog Post #1 - Custom\", \"live_revision\": 32, \"show_in_menus\": false, \"latest_revision\": 32, \"translation_key\": \"27cbfe3c-6c96-4bbd-b394-56f9509fbc24\", \"last_published_at\": \"2026-02-22T09:59:00.567Z\", \"first_published_at\": \"2026-02-21T09:35:57.233Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-22T09:59:00.492Z\"}',NULL,'6',1,49,1,'Blog Post #1'),(34,'2026-02-22 10:02:55.949910','{\"pk\": 7, \"live\": true, \"path\": \"0001000100020002\", \"slug\": \"blog-post-2\", \"depth\": 4, \"owner\": 1, \"title\": \"Blog Post #2\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<h2 data-block-key=\\\\\\\"8vumk\\\\\\\">Hello World2</h2><p data-block-key=\\\\\\\"4817b\\\\\\\">This is a simple bloc post from a full rich text himself</p>\\\", \\\"id\\\": \\\"9356bfc4-3dbc-436e-b837-34b683aed6a8\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/blog/blog-post-2/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"blog_image\": 2, \"go_live_at\": null, \"draft_title\": \"Blog Post #2\", \"blog_authors\": [{\"pk\": null, \"page\": 7, \"author\": 1, \"sort_order\": 0}], \"content_type\": 49, \"custom_title\": \"Blog Post #2 - Custom\", \"live_revision\": 29, \"show_in_menus\": false, \"latest_revision\": 29, \"translation_key\": \"b8461683-46ca-412c-a4e0-74f97d527db6\", \"last_published_at\": \"2026-02-21T09:40:41.547Z\", \"first_published_at\": \"2026-02-21T09:40:11.137Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-21T09:40:41.489Z\"}',NULL,'7',1,49,1,'Blog Post #2'),(35,'2026-02-22 10:33:13.981486','{\"pk\": 6, \"live\": true, \"path\": \"0001000100020001\", \"slug\": \"blog-post-1\", \"depth\": 4, \"owner\": 1, \"title\": \"Blog Post #1\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<h2 data-block-key=\\\\\\\"8vumk\\\\\\\">Hello World</h2><p data-block-key=\\\\\\\"4817b\\\\\\\">This is a simple bloc post from a full rich text himself</p>\\\", \\\"id\\\": \\\"9356bfc4-3dbc-436e-b837-34b683aed6a8\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/blog/blog-post-1/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"blog_image\": 1, \"categories\": [1], \"go_live_at\": null, \"draft_title\": \"Blog Post #1\", \"blog_authors\": [{\"pk\": 2, \"page\": 6, \"author\": 2, \"sort_order\": 0}, {\"pk\": 1, \"page\": 6, \"author\": 1, \"sort_order\": 1}], \"content_type\": 49, \"custom_title\": \"Blog Post #1 - Custom\", \"live_revision\": 33, \"show_in_menus\": false, \"latest_revision\": 33, \"translation_key\": \"27cbfe3c-6c96-4bbd-b394-56f9509fbc24\", \"last_published_at\": \"2026-02-22T10:02:48.661Z\", \"first_published_at\": \"2026-02-21T09:35:57.233Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-22T10:02:48.610Z\"}',NULL,'6',1,49,1,'Blog Post #1'),(36,'2026-02-22 10:33:21.920127','{\"pk\": 7, \"live\": true, \"path\": \"0001000100020002\", \"slug\": \"blog-post-2\", \"depth\": 4, \"owner\": 1, \"title\": \"Blog Post #2\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<h2 data-block-key=\\\\\\\"8vumk\\\\\\\">Hello World2</h2><p data-block-key=\\\\\\\"4817b\\\\\\\">This is a simple bloc post from a full rich text himself</p>\\\", \\\"id\\\": \\\"9356bfc4-3dbc-436e-b837-34b683aed6a8\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/blog/blog-post-2/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"blog_image\": 2, \"categories\": [3], \"go_live_at\": null, \"draft_title\": \"Blog Post #2\", \"blog_authors\": [{\"pk\": 3, \"page\": 7, \"author\": 1, \"sort_order\": 0}], \"content_type\": 49, \"custom_title\": \"Blog Post #2 - Custom\", \"live_revision\": 34, \"show_in_menus\": false, \"latest_revision\": 34, \"translation_key\": \"b8461683-46ca-412c-a4e0-74f97d527db6\", \"last_published_at\": \"2026-02-22T10:02:55.995Z\", \"first_published_at\": \"2026-02-21T09:40:11.137Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-22T10:02:55.949Z\"}',NULL,'7',1,49,1,'Blog Post #2'),(37,'2026-02-22 10:38:43.306974','{\"pk\": 6, \"live\": true, \"path\": \"0001000100020001\", \"slug\": \"blog-post-1\", \"depth\": 4, \"owner\": 1, \"title\": \"Blog Post #1\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<h2 data-block-key=\\\\\\\"8vumk\\\\\\\">Hello World</h2><p data-block-key=\\\\\\\"4817b\\\\\\\">This is a simple bloc post from a full rich text himself</p>\\\", \\\"id\\\": \\\"9356bfc4-3dbc-436e-b837-34b683aed6a8\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/blog/blog-post-1/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"blog_image\": 1, \"categories\": [1], \"go_live_at\": null, \"draft_title\": \"Blog Post #1\", \"blog_authors\": [{\"pk\": 2, \"page\": 6, \"author\": 2, \"sort_order\": 0}, {\"pk\": 1, \"page\": 6, \"author\": 1, \"sort_order\": 1}], \"content_type\": 49, \"custom_title\": \"Blog Post #1 - Custom\", \"live_revision\": 35, \"show_in_menus\": false, \"latest_revision\": 35, \"translation_key\": \"27cbfe3c-6c96-4bbd-b394-56f9509fbc24\", \"last_published_at\": \"2026-02-22T10:33:14.069Z\", \"first_published_at\": \"2026-02-21T09:35:57.233Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-22T10:33:13.981Z\"}',NULL,'6',1,49,1,'Blog Post #1'),(38,'2026-02-23 09:08:20.021274','{\"pk\": 8, \"live\": true, \"path\": \"0001000100020003\", \"slug\": \"article-blog-page\", \"depth\": 4, \"owner\": 1, \"title\": \"Article Blog Page\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"title in here\\\", \\\"text\\\": \\\"text in here\\\"}, \\\"id\\\": \\\"0579c429-8383-4495-9fd1-2294edfe6159\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"subtitle\": \"Welcome to my subtitle\", \"url_path\": \"/home/blog/article-blog-page/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"categories\": [1], \"go_live_at\": null, \"draft_title\": \"Article Blog Page\", \"intro_image\": 9, \"banner_image\": 8, \"blog_authors\": [{\"pk\": 4, \"page\": 8, \"author\": 1, \"sort_order\": 0}], \"content_type\": 53, \"custom_title\": \"Custom Article Blog Page\", \"live_revision\": null, \"show_in_menus\": false, \"latest_revision\": null, \"translation_key\": \"3eea124e-8253-43f4-923a-9b780040e133\", \"last_published_at\": null, \"first_published_at\": null, \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": null}',NULL,'8',1,53,1,'Article Blog Page'),(39,'2026-02-23 09:28:04.041734','{\"pk\": 8, \"live\": true, \"path\": \"0001000100020003\", \"slug\": \"article-blog-page\", \"depth\": 4, \"owner\": 1, \"title\": \"Article Blog Page\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"title in here\\\", \\\"text\\\": \\\"text in here\\\"}, \\\"id\\\": \\\"0579c429-8383-4495-9fd1-2294edfe6159\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"subtitle\": \"Welcome to my subtitle\", \"url_path\": \"/home/blog/article-blog-page/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"categories\": [1], \"go_live_at\": null, \"draft_title\": \"Article Blog Page\", \"intro_image\": 9, \"banner_image\": 8, \"blog_authors\": [{\"pk\": 4, \"page\": 8, \"author\": 1, \"sort_order\": 0}], \"content_type\": 53, \"custom_title\": \"Custom Article Blog Page\", \"live_revision\": 38, \"show_in_menus\": false, \"latest_revision\": 38, \"translation_key\": \"3eea124e-8253-43f4-923a-9b780040e133\", \"last_published_at\": \"2026-02-23T09:08:20.073Z\", \"first_published_at\": \"2026-02-23T09:08:20.073Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-23T09:08:20.021Z\"}',NULL,'8',1,53,1,'Article Blog Page'),(40,'2026-02-23 10:33:56.042430','{\"pk\": 9, \"live\": true, \"path\": \"000100010003\", \"slug\": \"video-blog-article\", \"depth\": 3, \"owner\": 1, \"title\": \"Video Blog Article\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Title here\\\", \\\"text\\\": \\\"Text here\\\"}, \\\"id\\\": \\\"55afe792-a7d7-429a-bb22-925c4661a549\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/video-blog-article/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"categories\": [3], \"go_live_at\": null, \"draft_title\": \"Video Blog Article\", \"banner_image\": null, \"blog_authors\": [{\"pk\": 5, \"page\": 9, \"author\": 1, \"sort_order\": 0}], \"content_type\": 54, \"custom_title\": \"Custom Video Title\", \"live_revision\": null, \"show_in_menus\": false, \"latest_revision\": null, \"translation_key\": \"3e430f9b-38a5-4509-a1ca-de980c2f5882\", \"youtube_video_id\": \"0Tg0wAvr7U4\", \"last_published_at\": null, \"first_published_at\": null, \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": null}',NULL,'9',1,54,1,'Video Blog Article'),(41,'2026-02-23 10:40:04.977479','{\"pk\": 9, \"live\": true, \"path\": \"000100010003\", \"slug\": \"video-blog-article\", \"depth\": 3, \"owner\": 1, \"title\": \"Video Blog Article\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Title here\\\", \\\"text\\\": \\\"Text here\\\"}, \\\"id\\\": \\\"55afe792-a7d7-429a-bb22-925c4661a549\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/video-blog-article/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"categories\": [3], \"go_live_at\": null, \"draft_title\": \"Video Blog Article\", \"banner_image\": null, \"blog_authors\": [{\"pk\": 5, \"page\": 9, \"author\": 1, \"sort_order\": 0}], \"content_type\": 54, \"custom_title\": \"Custom Video Title\", \"live_revision\": 40, \"show_in_menus\": false, \"latest_revision\": 40, \"translation_key\": \"3e430f9b-38a5-4509-a1ca-de980c2f5882\", \"youtube_video_id\": \"0Tg0wAvr7U4?si=4WA177hb117jwzR\", \"last_published_at\": \"2026-02-23T10:33:56.088Z\", \"first_published_at\": \"2026-02-23T10:33:56.088Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-23T10:33:56.042Z\"}',NULL,'9',1,54,1,'Video Blog Article'),(42,'2026-02-24 15:40:28.919308','{\"pk\": 8, \"live\": true, \"path\": \"0001000100020003\", \"slug\": \"article-blog-page\", \"depth\": 4, \"owner\": 1, \"title\": \"Article Blog Page\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"title in here\\\", \\\"text\\\": \\\"text in here\\\"}, \\\"id\\\": \\\"0579c429-8383-4495-9fd1-2294edfe6159\\\"}, {\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"6nhdn\\\\\\\"><code>ddd</code></p>\\\", \\\"id\\\": \\\"14e8b794-905e-45c2-b09d-04ee81daf019\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"subtitle\": \"Welcome to my subtitle\", \"url_path\": \"/home/blog/article-blog-page/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"categories\": [1], \"go_live_at\": null, \"draft_title\": \"Article Blog Page\", \"intro_image\": 9, \"banner_image\": 8, \"blog_authors\": [{\"pk\": 4, \"page\": 8, \"author\": 1, \"sort_order\": 0}], \"content_type\": 53, \"custom_title\": \"Custom Article Blog Page\", \"live_revision\": 39, \"show_in_menus\": false, \"latest_revision\": 39, \"translation_key\": \"3eea124e-8253-43f4-923a-9b780040e133\", \"last_published_at\": \"2026-02-23T09:28:04.103Z\", \"first_published_at\": \"2026-02-23T09:08:20.073Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-23T09:28:04.041Z\"}',NULL,'8',1,53,1,'Article Blog Page'),(43,'2026-02-24 16:04:35.715534','{\"pk\": 8, \"live\": true, \"path\": \"0001000100020003\", \"slug\": \"article-blog-page\", \"depth\": 4, \"owner\": 1, \"title\": \"Article Blog Page\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"title in here\\\", \\\"text\\\": \\\"text in here\\\"}, \\\"id\\\": \\\"0579c429-8383-4495-9fd1-2294edfe6159\\\"}, {\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"6nhdn\\\\\\\"><div style=\\\\\\\"display:block;text-align:center;\\\\\\\"><code>ddd</code></div></p>\\\", \\\"id\\\": \\\"14e8b794-905e-45c2-b09d-04ee81daf019\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"subtitle\": \"Welcome to my subtitle\", \"url_path\": \"/home/blog/article-blog-page/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"categories\": [1], \"go_live_at\": null, \"draft_title\": \"Article Blog Page\", \"intro_image\": 9, \"banner_image\": 8, \"blog_authors\": [{\"pk\": 4, \"page\": 8, \"author\": 1, \"sort_order\": 0}], \"content_type\": 53, \"custom_title\": \"Custom Article Blog Page\", \"live_revision\": 42, \"show_in_menus\": false, \"latest_revision\": 42, \"translation_key\": \"3eea124e-8253-43f4-923a-9b780040e133\", \"last_published_at\": \"2026-02-24T15:40:29.004Z\", \"first_published_at\": \"2026-02-23T09:08:20.073Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-24T15:40:28.919Z\"}',NULL,'8',1,53,1,'Article Blog Page'),(44,'2026-02-24 16:08:04.692285','{\"pk\": 8, \"live\": true, \"path\": \"0001000100020003\", \"slug\": \"article-blog-page\", \"depth\": 4, \"owner\": 1, \"title\": \"Article Blog Page\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"title in here\\\", \\\"text\\\": \\\"text in here\\\"}, \\\"id\\\": \\\"0579c429-8383-4495-9fd1-2294edfe6159\\\"}, {\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"6nhdn\\\\\\\"><div class=\\\\\\\"d-block text-center\\\\\\\"><code>ddd</code></div></p>\\\", \\\"id\\\": \\\"14e8b794-905e-45c2-b09d-04ee81daf019\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"subtitle\": \"Welcome to my subtitle\", \"url_path\": \"/home/blog/article-blog-page/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"categories\": [1], \"go_live_at\": null, \"draft_title\": \"Article Blog Page\", \"intro_image\": 9, \"banner_image\": 8, \"blog_authors\": [{\"pk\": 4, \"page\": 8, \"author\": 1, \"sort_order\": 0}], \"content_type\": 53, \"custom_title\": \"Custom Article Blog Page\", \"live_revision\": 43, \"show_in_menus\": false, \"latest_revision\": 43, \"translation_key\": \"3eea124e-8253-43f4-923a-9b780040e133\", \"last_published_at\": \"2026-02-24T16:04:35.780Z\", \"first_published_at\": \"2026-02-23T09:08:20.073Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-24T16:04:35.715Z\"}',NULL,'8',1,53,1,'Article Blog Page'),(45,'2026-02-24 17:52:56.701255','{\"pk\": 10, \"live\": true, \"path\": \"000100010003\", \"slug\": \"contact-form\", \"depth\": 3, \"intro\": \"<p data-block-key=\\\"o19o2\\\">Hello this is intro text </p>\", \"owner\": 1, \"title\": \"Contact Form\", \"locale\": 1, \"locked\": false, \"expired\": false, \"subject\": \"Contact From Submission\", \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/contact-form/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"to_address\": \"ishefat@gmail.com\", \"draft_title\": \"Contact Form\", \"form_fields\": [{\"pk\": 1, \"page\": 10, \"label\": \"Name\", \"choices\": \"\", \"required\": true, \"help_text\": \"Enter your full name\", \"clean_name\": \"name\", \"field_type\": \"singleline\", \"sort_order\": 0, \"default_value\": \"\"}, {\"pk\": 2, \"page\": 10, \"label\": \"Email\", \"choices\": \"\", \"required\": true, \"help_text\": \"Enter your email address\", \"clean_name\": \"email\", \"field_type\": \"email\", \"sort_order\": 1, \"default_value\": \"\"}, {\"pk\": 3, \"page\": 10, \"label\": \"Message\", \"choices\": \"\", \"required\": true, \"help_text\": \"Enter your message\", \"clean_name\": \"message\", \"field_type\": \"multiline\", \"sort_order\": 2, \"default_value\": \"\"}], \"content_type\": 57, \"from_address\": \"shefat@dataceil.com\", \"live_revision\": null, \"show_in_menus\": false, \"thank_you_text\": \"<p data-block-key=\\\"4zl8n\\\">Thank you for submitting this for. We\'ll be in touch shortly</p>\", \"latest_revision\": null, \"translation_key\": \"e8bf841f-d8c0-4b68-ad0b-4eed3cca74b7\", \"last_published_at\": null, \"first_published_at\": null, \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": null}',NULL,'10',1,57,1,'Contact Form'),(46,'2026-02-25 17:02:35.615917','{\"pk\": 9, \"live\": true, \"path\": \"0001000100020004\", \"slug\": \"video-blog-article\", \"depth\": 4, \"owner\": 1, \"title\": \"Video Blog Article\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Title here\\\", \\\"text\\\": \\\"Text here\\\"}, \\\"id\\\": \\\"55afe792-a7d7-429a-bb22-925c4661a549\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/blog/video-blog-article/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"categories\": [3], \"go_live_at\": null, \"draft_title\": \"Video Blog Article\", \"banner_image\": null, \"blog_authors\": [{\"pk\": 5, \"page\": 9, \"author\": 1, \"sort_order\": 0}], \"content_type\": 54, \"custom_title\": \"Custom Video title\", \"live_revision\": 41, \"show_in_menus\": false, \"latest_revision\": 41, \"translation_key\": \"3e430f9b-38a5-4509-a1ca-de980c2f5882\", \"youtube_video_id\": \"0Tg0wAvr7U4?si=4WA177hb117jwzR\", \"last_published_at\": \"2026-02-23T10:40:05.032Z\", \"first_published_at\": \"2026-02-23T10:33:56.088Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-23T10:40:04.977Z\"}',NULL,'9',1,54,1,'Video Blog Article'),(50,'2026-03-01 10:46:05.827126','{\"pk\": 8, \"live\": true, \"path\": \"0001000100020003\", \"slug\": \"article-blog-page\", \"depth\": 4, \"owner\": 1, \"title\": \"Article Blog Page\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"title in here\\\", \\\"text\\\": \\\"text in here\\\"}, \\\"id\\\": \\\"0579c429-8383-4495-9fd1-2294edfe6159\\\"}, {\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"6nhdn\\\\\\\"><div class=\\\\\\\"d-block text-center\\\\\\\"><code>ddd</code></div></p>\\\", \\\"id\\\": \\\"14e8b794-905e-45c2-b09d-04ee81daf019\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"subtitle\": \"Welcome to my subtitle\", \"url_path\": \"/home/blog/article-blog-page/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"categories\": [1], \"go_live_at\": null, \"draft_title\": \"Article Blog Page\", \"intro_image\": 9, \"banner_image\": 8, \"blog_authors\": [{\"pk\": 4, \"page\": 8, \"author\": 1, \"sort_order\": 0}], \"content_type\": 53, \"custom_title\": \"Custom Article Blog Page\", \"tagged_items\": [{\"pk\": null, \"tag\": 5, \"content_object\": 8}, {\"pk\": null, \"tag\": 6, \"content_object\": 8}], \"live_revision\": 44, \"show_in_menus\": false, \"latest_revision\": 44, \"translation_key\": \"3eea124e-8253-43f4-923a-9b780040e133\", \"last_published_at\": \"2026-02-24T16:08:04.756Z\", \"first_published_at\": \"2026-02-23T09:08:20.073Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-24T16:08:04.692Z\"}',NULL,'8',1,53,1,'Article Blog Page'),(51,'2026-03-01 10:46:37.630785','{\"pk\": 8, \"live\": true, \"path\": \"0001000100020003\", \"slug\": \"article-blog-page\", \"depth\": 4, \"owner\": 1, \"title\": \"Article Blog Page\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"title in here\\\", \\\"text\\\": \\\"text in here\\\"}, \\\"id\\\": \\\"0579c429-8383-4495-9fd1-2294edfe6159\\\"}, {\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"6nhdn\\\\\\\"><div class=\\\\\\\"d-block text-center\\\\\\\"><code>ddd</code></div></p>\\\", \\\"id\\\": \\\"14e8b794-905e-45c2-b09d-04ee81daf019\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"subtitle\": \"Welcome to my subtitle\", \"url_path\": \"/home/blog/article-blog-page/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"categories\": [1], \"go_live_at\": null, \"draft_title\": \"Article Blog Page\", \"intro_image\": 9, \"banner_image\": 8, \"blog_authors\": [{\"pk\": 4, \"page\": 8, \"author\": 1, \"sort_order\": 0}], \"content_type\": 53, \"custom_title\": \"Custom Article Blog Page\", \"tagged_items\": [{\"pk\": null, \"tag\": 5, \"content_object\": 8}, {\"pk\": null, \"tag\": 6, \"content_object\": 8}], \"live_revision\": 50, \"show_in_menus\": false, \"latest_revision\": 50, \"translation_key\": \"3eea124e-8253-43f4-923a-9b780040e133\", \"last_published_at\": \"2026-03-01T10:46:05.923Z\", \"first_published_at\": \"2026-02-23T09:08:20.073Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-03-01T10:46:05.827Z\"}',NULL,'8',1,53,1,'Article Blog Page'),(52,'2026-03-01 10:55:47.028924','{\"pk\": 6, \"live\": true, \"path\": \"0001000100020001\", \"slug\": \"blog-post-1\", \"depth\": 4, \"owner\": 1, \"title\": \"First Blog Post(test title)\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<h2 data-block-key=\\\\\\\"8vumk\\\\\\\">Hello World</h2><p data-block-key=\\\\\\\"4817b\\\\\\\">This is a simple bloc post from a full rich text himself</p>\\\", \\\"id\\\": \\\"9356bfc4-3dbc-436e-b837-34b683aed6a8\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/blog/blog-post-1/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"categories\": [1], \"go_live_at\": null, \"draft_title\": \"Blog Post #1\", \"banner_image\": 1, \"blog_authors\": [{\"pk\": 2, \"page\": 6, \"author\": 2, \"sort_order\": 0}, {\"pk\": 1, \"page\": 6, \"author\": 1, \"sort_order\": 1}], \"content_type\": 49, \"custom_title\": \"Blog Post #1 - Custom\", \"tagged_items\": [{\"pk\": null, \"tag\": 5, \"content_object\": 6}], \"live_revision\": 37, \"show_in_menus\": false, \"latest_revision\": 37, \"translation_key\": \"27cbfe3c-6c96-4bbd-b394-56f9509fbc24\", \"last_published_at\": \"2026-02-22T10:38:43.373Z\", \"first_published_at\": \"2026-02-21T09:35:57.233Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-22T10:38:43.306Z\"}',NULL,'6',1,49,1,'First Blog Post(test title)'),(53,'2026-03-01 11:04:36.689649','{\"pk\": 9, \"live\": true, \"path\": \"0001000100020004\", \"slug\": \"video-blog-article\", \"depth\": 4, \"owner\": 1, \"title\": \"Video Blog Article\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Title here\\\", \\\"text\\\": \\\"Text here\\\"}, \\\"id\\\": \\\"55afe792-a7d7-429a-bb22-925c4661a549\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/blog/video-blog-article/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"categories\": [3], \"go_live_at\": null, \"draft_title\": \"Video Blog Article\", \"banner_image\": null, \"blog_authors\": [{\"pk\": 5, \"page\": 9, \"author\": 1, \"sort_order\": 0}], \"content_type\": 54, \"custom_title\": \"Custom Video title\", \"tagged_items\": [{\"pk\": null, \"tag\": 5, \"content_object\": 9}], \"live_revision\": 46, \"show_in_menus\": false, \"latest_revision\": 46, \"translation_key\": \"3e430f9b-38a5-4509-a1ca-de980c2f5882\", \"youtube_video_id\": \"0Tg0wAvr7U4?si=4WA177hb117jwzR\", \"last_published_at\": \"2026-02-25T17:02:35.681Z\", \"first_published_at\": \"2026-02-23T10:33:56.088Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-25T17:02:35.615Z\"}',NULL,'9',1,54,1,'Video Blog Article'),(54,'2026-03-04 11:18:08.669045','{\"pk\": 4, \"live\": true, \"path\": \"000100010001\", \"slug\": \"about\", \"depth\": 3, \"owner\": 1, \"title\": \"About\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Third Title\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"dbb72971-93cc-411e-9684-54ddfeea49c7\\\"}, {\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Second title\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"a24f5edd-8fbd-413b-a76a-27d804c3aee2\\\"}, {\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Welcome to startup Life\\\", \\\"text\\\": \\\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m\\\"}, \\\"id\\\": \\\"d355620e-8fcf-4c57-a033-8cdf43a60f68\\\"}, {\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<h2 data-block-key=\\\\\\\"e8zzc\\\\\\\">Lorem</h2><p data-block-key=\\\\\\\"6vv3r\\\\\\\"><i>Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled</i> <a linktype=\\\\\\\"page\\\\\\\" id=\\\\\\\"3\\\\\\\"><i>it to</i></a></p>\\\", \\\"id\\\": \\\"bc68489c-f935-4384-a8ba-d91c330b82b4\\\"}, {\\\"type\\\": \\\"simple_richtext\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"99q9d\\\\\\\"><b><i>Simple text</i></b></p>\\\", \\\"id\\\": \\\"0ce0ec7d-501e-44f9-a892-1554981aec46\\\"}, {\\\"type\\\": \\\"cards\\\", \\\"value\\\": {\\\"title\\\": \\\"Staff Cards\\\", \\\"cards\\\": [{\\\"type\\\": \\\"item\\\", \\\"value\\\": {\\\"image\\\": 3, \\\"title\\\": \\\"Fahim Hussain Walid ( IELTS INS)\\\", \\\"text\\\": \\\"Fahim Hussain Walid ( IELTS INS)\\\", \\\"button_page\\\": 3, \\\"button_url\\\": \\\"\\\"}, \\\"id\\\": \\\"50135788-a1c5-45df-8383-4871cc1d149a\\\"}, {\\\"type\\\": \\\"item\\\", \\\"value\\\": {\\\"image\\\": 4, \\\"title\\\": \\\"M. Monsur Islam (IELTS INS)\\\", \\\"text\\\": \\\"M. Monsur Islam (IELTS INS)\\\", \\\"button_page\\\": 3, \\\"button_url\\\": \\\"\\\"}, \\\"id\\\": \\\"93a4accc-3d34-44ef-9965-ab1b5c7e90b7\\\"}, {\\\"type\\\": \\\"item\\\", \\\"value\\\": {\\\"image\\\": 5, \\\"title\\\": \\\"Aminul islam_ (IELTS INS)\\\", \\\"text\\\": \\\"Aminul islam_ (IELTS INS)\\\", \\\"button_page\\\": 3, \\\"button_url\\\": \\\"\\\"}, \\\"id\\\": \\\"54993668-c47f-454e-b7a1-2efebefa74b1\\\"}]}, \\\"id\\\": \\\"272b174f-3a18-4daa-a676-9ac1a780eb2f\\\"}, {\\\"type\\\": \\\"cta\\\", \\\"value\\\": {\\\"title\\\": \\\"Call to Action Title\\\", \\\"text\\\": \\\"<p data-block-key=\\\\\\\"xjp37\\\\\\\"><i>Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled</i></p>\\\", \\\"button_page\\\": 4, \\\"button_url\\\": \\\"\\\", \\\"button_text\\\": \\\"Learn More\\\"}, \\\"id\\\": \\\"9c0ae004-6c50-47d5-9331-3e2853b55061\\\"}, {\\\"type\\\": \\\"button\\\", \\\"value\\\": {\\\"button_page\\\": null, \\\"button_url\\\": \\\"http://127.0.0.1:8000/blog/\\\"}, \\\"id\\\": \\\"e69506df-a3bf-45b5-aad0-ffcb416a191b\\\"}, {\\\"type\\\": \\\"char_block\\\", \\\"value\\\": \\\"welcome About page\\\", \\\"id\\\": \\\"5c1d546b-1b31-468c-8b75-977d40f61a6a\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"subtitle\": \"About Startup Life\", \"url_path\": \"/home/about/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"About\", \"content_type\": 44, \"live_revision\": 30, \"show_in_menus\": false, \"latest_revision\": 30, \"translation_key\": \"ebffe46c-ca52-4e3e-91f1-42d9268f733f\", \"last_published_at\": \"2026-02-22T07:44:26.527Z\", \"first_published_at\": \"2026-02-19T16:07:05.075Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-22T07:44:26.415Z\"}',NULL,'4',1,44,1,'About'),(55,'2026-03-04 18:12:44.365691','{\"pk\": 7, \"live\": true, \"path\": \"0001000100020002\", \"slug\": \"blog-post-2\", \"depth\": 4, \"owner\": 1, \"title\": \"Blog Post #2\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<h2 data-block-key=\\\\\\\"8vumk\\\\\\\">Hello World2</h2><p data-block-key=\\\\\\\"4817b\\\\\\\">This is a simple bloc post from a full rich text himself</p>\\\", \\\"id\\\": \\\"9356bfc4-3dbc-436e-b837-34b683aed6a8\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/blog/blog-post-2/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"categories\": [3], \"go_live_at\": null, \"draft_title\": \"Blog Post #2\", \"banner_image\": 2, \"blog_authors\": [{\"pk\": 3, \"page\": 7, \"author\": 1, \"sort_order\": 0}], \"content_type\": 49, \"custom_title\": \"Blog Post #2 - Custom\", \"tagged_items\": [], \"live_revision\": 36, \"show_in_menus\": false, \"latest_revision\": 36, \"translation_key\": \"b8461683-46ca-412c-a4e0-74f97d527db6\", \"last_published_at\": \"2026-02-22T10:33:21.978Z\", \"first_published_at\": \"2026-02-21T09:40:11.137Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-02-22T10:33:21.920Z\"}',NULL,'7',1,49,1,'Blog Post #2'),(56,'2026-03-04 19:19:56.847022','{\"pk\": 6, \"live\": true, \"path\": \"0001000100020001\", \"slug\": \"blog-post-1\", \"depth\": 4, \"owner\": 1, \"title\": \"First Blog Post(test title)\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<h2 data-block-key=\\\\\\\"8vumk\\\\\\\">Hello World</h2><p data-block-key=\\\\\\\"4817b\\\\\\\">This is a simple bloc post from a full rich text himself</p>\\\", \\\"id\\\": \\\"9356bfc4-3dbc-436e-b837-34b683aed6a8\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/blog/blog-post-1/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"categories\": [1], \"go_live_at\": null, \"draft_title\": \"First Blog Post(test title)\", \"banner_image\": 1, \"blog_authors\": [{\"pk\": 2, \"page\": 6, \"author\": 2, \"sort_order\": 0}, {\"pk\": 1, \"page\": 6, \"author\": 1, \"sort_order\": 1}], \"content_type\": 49, \"custom_title\": \"Blog Post #1 - Custom\", \"tagged_items\": [{\"pk\": null, \"tag\": 5, \"content_object\": 6}], \"live_revision\": 52, \"show_in_menus\": false, \"latest_revision\": 52, \"translation_key\": \"27cbfe3c-6c96-4bbd-b394-56f9509fbc24\", \"last_published_at\": \"2026-03-01T10:55:47.116Z\", \"first_published_at\": \"2026-02-21T09:35:57.233Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-03-01T10:55:47.028Z\"}',NULL,'6',1,49,1,'First Blog Post(test title)'),(57,'2026-03-04 19:20:05.266771','{\"pk\": 9, \"live\": true, \"path\": \"0001000100020004\", \"slug\": \"video-blog-article\", \"depth\": 4, \"owner\": 1, \"title\": \"Video Blog Article\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"Title here\\\", \\\"text\\\": \\\"Text here\\\"}, \\\"id\\\": \\\"55afe792-a7d7-429a-bb22-925c4661a549\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/blog/video-blog-article/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"categories\": [], \"go_live_at\": null, \"draft_title\": \"Video Blog Article\", \"banner_image\": null, \"blog_authors\": [{\"pk\": 5, \"page\": 9, \"author\": 1, \"sort_order\": 0}], \"content_type\": 54, \"custom_title\": \"Custom Video title\", \"tagged_items\": [{\"pk\": null, \"tag\": 5, \"content_object\": 9}], \"live_revision\": 53, \"show_in_menus\": false, \"latest_revision\": 53, \"translation_key\": \"3e430f9b-38a5-4509-a1ca-de980c2f5882\", \"youtube_video_id\": \"0Tg0wAvr7U4?si=4WA177hb117jwzR\", \"last_published_at\": \"2026-03-01T11:04:36.746Z\", \"first_published_at\": \"2026-02-23T10:33:56.088Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-03-01T11:04:36.689Z\"}',NULL,'9',1,54,1,'Video Blog Article'),(58,'2026-03-04 19:20:21.088893','{\"pk\": 8, \"live\": true, \"path\": \"0001000100020003\", \"slug\": \"article-blog-page\", \"depth\": 4, \"owner\": 1, \"title\": \"Article Blog Page\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"title_and_text\\\", \\\"value\\\": {\\\"title\\\": \\\"title in here\\\", \\\"text\\\": \\\"text in here\\\"}, \\\"id\\\": \\\"0579c429-8383-4495-9fd1-2294edfe6159\\\"}, {\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"6nhdn\\\\\\\"><div class=\\\\\\\"d-block text-center\\\\\\\"><code>ddd</code></div></p>\\\", \\\"id\\\": \\\"14e8b794-905e-45c2-b09d-04ee81daf019\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"subtitle\": \"Welcome to my subtitle\", \"url_path\": \"/home/blog/article-blog-page/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"categories\": [1], \"go_live_at\": null, \"draft_title\": \"Article Blog Page\", \"intro_image\": 9, \"banner_image\": 8, \"blog_authors\": [{\"pk\": 4, \"page\": 8, \"author\": 1, \"sort_order\": 0}], \"content_type\": 53, \"custom_title\": \"Custom Article Blog Page\", \"tagged_items\": [{\"pk\": null, \"tag\": 5, \"content_object\": 8}], \"live_revision\": 51, \"show_in_menus\": false, \"latest_revision\": 51, \"translation_key\": \"3eea124e-8253-43f4-923a-9b780040e133\", \"last_published_at\": \"2026-03-01T10:46:37.689Z\", \"first_published_at\": \"2026-02-23T09:08:20.073Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-03-01T10:46:37.630Z\"}',NULL,'8',1,53,1,'Article Blog Page'),(59,'2026-03-07 09:14:32.001885','{\"pk\": 6, \"live\": true, \"path\": \"0001000100020001\", \"slug\": \"blog-post-1\", \"depth\": 4, \"owner\": 1, \"title\": \"First Blog Post(test title)\", \"locale\": 1, \"locked\": false, \"content\": \"[{\\\"type\\\": \\\"full_richtext\\\", \\\"value\\\": \\\"<h2 data-block-key=\\\\\\\"8vumk\\\\\\\">Hello World</h2><p data-block-key=\\\\\\\"4817b\\\\\\\">This is a simple bloc post from a full rich text himself</p>\\\", \\\"id\\\": \\\"9356bfc4-3dbc-436e-b837-34b683aed6a8\\\"}, {\\\"type\\\": \\\"cta\\\", \\\"value\\\": {\\\"title\\\": \\\"Learn more\\\", \\\"text\\\": \\\"<p data-block-key=\\\\\\\"u6p3y\\\\\\\">Find out more </p>\\\", \\\"button_page\\\": null, \\\"button_url\\\": \\\"https://dataceil.com\\\", \\\"button_text\\\": \\\"Learn More\\\"}, \\\"id\\\": \\\"da16431e-d11c-4255-83e0-db61822645ac\\\"}]\", \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/blog/blog-post-1/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"categories\": [1], \"go_live_at\": null, \"draft_title\": \"First Blog Post(test title)\", \"banner_image\": 1, \"blog_authors\": [{\"pk\": 2, \"page\": 6, \"author\": 2, \"sort_order\": 0}, {\"pk\": 1, \"page\": 6, \"author\": 1, \"sort_order\": 1}], \"content_type\": 49, \"custom_title\": \"Blog Post #1 - Custom\", \"tagged_items\": [{\"pk\": null, \"tag\": 5, \"content_object\": 6}], \"live_revision\": 56, \"show_in_menus\": false, \"latest_revision\": 56, \"translation_key\": \"27cbfe3c-6c96-4bbd-b394-56f9509fbc24\", \"last_published_at\": \"2026-03-04T19:19:56.920Z\", \"first_published_at\": \"2026-02-21T09:35:57.233Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-03-04T19:19:56.847Z\"}',NULL,'6',1,49,1,'First Blog Post(test title)');
/*!40000 ALTER TABLE `wagtailcore_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_site`
--

DROP TABLE IF EXISTS `wagtailcore_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) NOT NULL,
  `port` int NOT NULL,
  `is_default_site` tinyint(1) NOT NULL,
  `root_page_id` int NOT NULL,
  `site_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_site_hostname_port_2c626d70_uniq` (`hostname`,`port`),
  KEY `wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id` (`root_page_id`),
  KEY `wagtailcore_site_hostname_96b20b46` (`hostname`),
  CONSTRAINT `wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id` FOREIGN KEY (`root_page_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_site`
--

LOCK TABLES `wagtailcore_site` WRITE;
/*!40000 ALTER TABLE `wagtailcore_site` DISABLE KEYS */;
INSERT INTO `wagtailcore_site` VALUES (2,'localhost',80,1,3,'');
/*!40000 ALTER TABLE `wagtailcore_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_task`
--

DROP TABLE IF EXISTS `wagtailcore_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `content_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_task_content_type_id_249ab8ba_fk_django_co` (`content_type_id`),
  CONSTRAINT `wagtailcore_task_content_type_id_249ab8ba_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_task`
--

LOCK TABLES `wagtailcore_task` WRITE;
/*!40000 ALTER TABLE `wagtailcore_task` DISABLE KEYS */;
INSERT INTO `wagtailcore_task` VALUES (1,'Moderators approval',1,4);
/*!40000 ALTER TABLE `wagtailcore_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_taskstate`
--

DROP TABLE IF EXISTS `wagtailcore_taskstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_taskstate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `started_at` datetime(6) NOT NULL,
  `finished_at` datetime(6) DEFAULT NULL,
  `content_type_id` int NOT NULL,
  `revision_id` int NOT NULL,
  `task_id` int NOT NULL,
  `workflow_state_id` int NOT NULL,
  `finished_by_id` int DEFAULT NULL,
  `comment` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_taskstat_workflow_state_id_9239a775_fk_wagtailco` (`workflow_state_id`),
  KEY `wagtailcore_taskstat_content_type_id_0a758fdc_fk_django_co` (`content_type_id`),
  KEY `wagtailcore_taskstate_task_id_c3677c34_fk_wagtailcore_task_id` (`task_id`),
  KEY `wagtailcore_taskstate_finished_by_id_13f98229_fk_auth_user_id` (`finished_by_id`),
  KEY `wagtailcore_taskstat_revision_id_df25a499_fk_wagtailco` (`revision_id`),
  CONSTRAINT `wagtailcore_taskstat_content_type_id_0a758fdc_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailcore_taskstat_revision_id_df25a499_fk_wagtailco` FOREIGN KEY (`revision_id`) REFERENCES `wagtailcore_revision` (`id`),
  CONSTRAINT `wagtailcore_taskstat_workflow_state_id_9239a775_fk_wagtailco` FOREIGN KEY (`workflow_state_id`) REFERENCES `wagtailcore_workflowstate` (`id`),
  CONSTRAINT `wagtailcore_taskstate_finished_by_id_13f98229_fk_auth_user_id` FOREIGN KEY (`finished_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `wagtailcore_taskstate_task_id_c3677c34_fk_wagtailcore_task_id` FOREIGN KEY (`task_id`) REFERENCES `wagtailcore_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_taskstate`
--

LOCK TABLES `wagtailcore_taskstate` WRITE;
/*!40000 ALTER TABLE `wagtailcore_taskstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_taskstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_uploadedfile`
--

DROP TABLE IF EXISTS `wagtailcore_uploadedfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_uploadedfile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file` varchar(200) NOT NULL,
  `for_content_type_id` int DEFAULT NULL,
  `uploaded_by_user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_uploaded_for_content_type_id_b0fc87b2_fk_django_co` (`for_content_type_id`),
  KEY `wagtailcore_uploaded_uploaded_by_user_id_c7580fe8_fk_auth_user` (`uploaded_by_user_id`),
  CONSTRAINT `wagtailcore_uploaded_for_content_type_id_b0fc87b2_fk_django_co` FOREIGN KEY (`for_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailcore_uploaded_uploaded_by_user_id_c7580fe8_fk_auth_user` FOREIGN KEY (`uploaded_by_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_uploadedfile`
--

LOCK TABLES `wagtailcore_uploadedfile` WRITE;
/*!40000 ALTER TABLE `wagtailcore_uploadedfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_uploadedfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_workflow`
--

DROP TABLE IF EXISTS `wagtailcore_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_workflow` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_workflow`
--

LOCK TABLES `wagtailcore_workflow` WRITE;
/*!40000 ALTER TABLE `wagtailcore_workflow` DISABLE KEYS */;
INSERT INTO `wagtailcore_workflow` VALUES (1,'Moderators approval',1);
/*!40000 ALTER TABLE `wagtailcore_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_workflowcontenttype`
--

DROP TABLE IF EXISTS `wagtailcore_workflowcontenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_workflowcontenttype` (
  `content_type_id` int NOT NULL,
  `workflow_id` int NOT NULL,
  PRIMARY KEY (`content_type_id`),
  KEY `wagtailcore_workflow_workflow_id_9aad7cd2_fk_wagtailco` (`workflow_id`),
  CONSTRAINT `wagtailcore_workflow_content_type_id_b261bb37_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailcore_workflow_workflow_id_9aad7cd2_fk_wagtailco` FOREIGN KEY (`workflow_id`) REFERENCES `wagtailcore_workflow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_workflowcontenttype`
--

LOCK TABLES `wagtailcore_workflowcontenttype` WRITE;
/*!40000 ALTER TABLE `wagtailcore_workflowcontenttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_workflowcontenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_workflowpage`
--

DROP TABLE IF EXISTS `wagtailcore_workflowpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_workflowpage` (
  `page_id` int NOT NULL,
  `workflow_id` int NOT NULL,
  PRIMARY KEY (`page_id`),
  KEY `wagtailcore_workflow_workflow_id_56f56ff6_fk_wagtailco` (`workflow_id`),
  CONSTRAINT `wagtailcore_workflow_workflow_id_56f56ff6_fk_wagtailco` FOREIGN KEY (`workflow_id`) REFERENCES `wagtailcore_workflow` (`id`),
  CONSTRAINT `wagtailcore_workflowpage_page_id_81e7bab6_fk_wagtailcore_page_id` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_workflowpage`
--

LOCK TABLES `wagtailcore_workflowpage` WRITE;
/*!40000 ALTER TABLE `wagtailcore_workflowpage` DISABLE KEYS */;
INSERT INTO `wagtailcore_workflowpage` VALUES (1,1);
/*!40000 ALTER TABLE `wagtailcore_workflowpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_workflowstate`
--

DROP TABLE IF EXISTS `wagtailcore_workflowstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_workflowstate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `current_task_state_id` int DEFAULT NULL,
  `object_id` varchar(255) NOT NULL,
  `requested_by_id` int DEFAULT NULL,
  `workflow_id` int NOT NULL,
  `content_type_id` int NOT NULL,
  `base_content_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `current_task_state_id` (`current_task_state_id`),
  KEY `wagtailcore_workflow_requested_by_id_4090bca3_fk_auth_user` (`requested_by_id`),
  KEY `wagtailcore_workflow_workflow_id_1f18378f_fk_wagtailco` (`workflow_id`),
  KEY `workflowstate_ct_id_idx` (`content_type_id`,`object_id`),
  KEY `workflowstate_base_ct_id_idx` (`base_content_type_id`,`object_id`),
  CONSTRAINT `wagtailcore_workflow_base_content_type_id_a30dc576_fk_django_co` FOREIGN KEY (`base_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailcore_workflow_content_type_id_2bb78ce1_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailcore_workflow_current_task_state_i_3a1a0632_fk_wagtailco` FOREIGN KEY (`current_task_state_id`) REFERENCES `wagtailcore_taskstate` (`id`),
  CONSTRAINT `wagtailcore_workflow_requested_by_id_4090bca3_fk_auth_user` FOREIGN KEY (`requested_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `wagtailcore_workflow_workflow_id_1f18378f_fk_wagtailco` FOREIGN KEY (`workflow_id`) REFERENCES `wagtailcore_workflow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_workflowstate`
--

LOCK TABLES `wagtailcore_workflowstate` WRITE;
/*!40000 ALTER TABLE `wagtailcore_workflowstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_workflowstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_workflowtask`
--

DROP TABLE IF EXISTS `wagtailcore_workflowtask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_workflowtask` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sort_order` int DEFAULT NULL,
  `task_id` int NOT NULL,
  `workflow_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_workflowtask_workflow_id_task_id_4ec7a62b_uniq` (`workflow_id`,`task_id`),
  KEY `wagtailcore_workflowtask_task_id_ce7716fe_fk_wagtailcore_task_id` (`task_id`),
  KEY `wagtailcore_workflowtask_workflow_id_b9717175` (`workflow_id`),
  CONSTRAINT `wagtailcore_workflow_workflow_id_b9717175_fk_wagtailco` FOREIGN KEY (`workflow_id`) REFERENCES `wagtailcore_workflow` (`id`),
  CONSTRAINT `wagtailcore_workflowtask_task_id_ce7716fe_fk_wagtailcore_task_id` FOREIGN KEY (`task_id`) REFERENCES `wagtailcore_task` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_workflowtask`
--

LOCK TABLES `wagtailcore_workflowtask` WRITE;
/*!40000 ALTER TABLE `wagtailcore_workflowtask` DISABLE KEYS */;
INSERT INTO `wagtailcore_workflowtask` VALUES (1,0,1,1);
/*!40000 ALTER TABLE `wagtailcore_workflowtask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtaildocs_document`
--

DROP TABLE IF EXISTS `wagtaildocs_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtaildocs_document` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `file` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `uploaded_by_user_id` int DEFAULT NULL,
  `collection_id` int NOT NULL,
  `file_size` bigint unsigned DEFAULT NULL,
  `file_hash` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtaildocs_document_uploaded_by_user_id_17258b41_fk_auth_user` (`uploaded_by_user_id`),
  KEY `wagtaildocs_document_collection_id_23881625_fk_wagtailco` (`collection_id`),
  CONSTRAINT `wagtaildocs_document_collection_id_23881625_fk_wagtailco` FOREIGN KEY (`collection_id`) REFERENCES `wagtailcore_collection` (`id`),
  CONSTRAINT `wagtaildocs_document_uploaded_by_user_id_17258b41_fk_auth_user` FOREIGN KEY (`uploaded_by_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `wagtaildocs_document_chk_1` CHECK ((`file_size` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtaildocs_document`
--

LOCK TABLES `wagtaildocs_document` WRITE;
/*!40000 ALTER TABLE `wagtaildocs_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtaildocs_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailembeds_embed`
--

DROP TABLE IF EXISTS `wagtailembeds_embed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailembeds_embed` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` longtext NOT NULL,
  `max_width` smallint DEFAULT NULL,
  `type` varchar(10) NOT NULL,
  `html` longtext NOT NULL,
  `title` longtext NOT NULL,
  `author_name` longtext NOT NULL,
  `provider_name` longtext NOT NULL,
  `thumbnail_url` longtext NOT NULL,
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `last_updated` datetime(6) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `cache_until` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailembeds_embed_hash_c9bd8c9a_uniq` (`hash`),
  KEY `wagtailembeds_embed_cache_until_26c94bb0` (`cache_until`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailembeds_embed`
--

LOCK TABLES `wagtailembeds_embed` WRITE;
/*!40000 ALTER TABLE `wagtailembeds_embed` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailembeds_embed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailforms_formsubmission`
--

DROP TABLE IF EXISTS `wagtailforms_formsubmission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailforms_formsubmission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `form_data` json NOT NULL,
  `submit_time` datetime(6) NOT NULL,
  `page_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailforms_formsub_page_id_e48e93e7_fk_wagtailco` (`page_id`),
  CONSTRAINT `wagtailforms_formsub_page_id_e48e93e7_fk_wagtailco` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailforms_formsubmission`
--

LOCK TABLES `wagtailforms_formsubmission` WRITE;
/*!40000 ALTER TABLE `wagtailforms_formsubmission` DISABLE KEYS */;
INSERT INTO `wagtailforms_formsubmission` VALUES (1,'{\"name\": \"shefat\", \"email\": \"shefat.global@gmail.com\", \"message\": \"hello there can you write me back please\"}','2026-02-24 17:57:55.422050',10),(2,'{\"name\": \"shefat\", \"email\": \"shefat.global@gmail.com\", \"message\": \"hello there can you write me back please\"}','2026-02-24 17:59:31.796598',10);
/*!40000 ALTER TABLE `wagtailforms_formsubmission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailimages_image`
--

DROP TABLE IF EXISTS `wagtailimages_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailimages_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `file` varchar(100) NOT NULL,
  `width` int NOT NULL,
  `height` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `focal_point_x` int unsigned DEFAULT NULL,
  `focal_point_y` int unsigned DEFAULT NULL,
  `focal_point_width` int unsigned DEFAULT NULL,
  `focal_point_height` int unsigned DEFAULT NULL,
  `uploaded_by_user_id` int DEFAULT NULL,
  `file_size` int unsigned DEFAULT NULL,
  `collection_id` int NOT NULL,
  `file_hash` varchar(40) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailimages_image_uploaded_by_user_id_5d73dc75_fk_auth_user_id` (`uploaded_by_user_id`),
  KEY `wagtailimages_image_collection_id_c2f8af7e_fk_wagtailco` (`collection_id`),
  KEY `wagtailimages_image_created_at_86fa6cd4` (`created_at`),
  KEY `wagtailimages_image_file_hash_fb5bbb23` (`file_hash`),
  CONSTRAINT `wagtailimages_image_collection_id_c2f8af7e_fk_wagtailco` FOREIGN KEY (`collection_id`) REFERENCES `wagtailcore_collection` (`id`),
  CONSTRAINT `wagtailimages_image_uploaded_by_user_id_5d73dc75_fk_auth_user_id` FOREIGN KEY (`uploaded_by_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `wagtailimages_image_chk_1` CHECK ((`focal_point_x` >= 0)),
  CONSTRAINT `wagtailimages_image_chk_2` CHECK ((`focal_point_y` >= 0)),
  CONSTRAINT `wagtailimages_image_chk_3` CHECK ((`focal_point_width` >= 0)),
  CONSTRAINT `wagtailimages_image_chk_4` CHECK ((`focal_point_height` >= 0)),
  CONSTRAINT `wagtailimages_image_chk_5` CHECK ((`file_size` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailimages_image`
--

LOCK TABLES `wagtailimages_image` WRITE;
/*!40000 ALTER TABLE `wagtailimages_image` DISABLE KEYS */;
INSERT INTO `wagtailimages_image` VALUES (1,'promotion','original_images/scholarship-pop-up.jpg',500,500,'2026-02-18 20:51:27.670269',NULL,NULL,NULL,NULL,1,102339,1,'bf4d67d0991b17fdc2cefb232d23a5b0058cf574','promotion'),(2,'study-abroad-agency-in-bangladesh-desktop-banner-image','original_images/study-abroad-agency-in-bangladesh-desktop-banner-image.webp',1920,625,'2026-02-19 10:10:46.794379',NULL,NULL,NULL,NULL,1,84802,1,'ca7d3f7c59c7bffd056a65e1981762e294000a2e',''),(3,'Fahim Hussain Walid ( IELTS INS)','original_images/walid_pic_2_-_Fahim_Hussain_Walid__IELTS_INS.jpg',654,769,'2026-02-20 07:01:00.393172',NULL,NULL,NULL,NULL,1,92565,1,'5de050ceec3ae1013cb7f6ad7af4e21daaafc294','Fahim Hussain Walid ( IELTS INS)'),(4,'M. Monsur Islam  (IELTS INS)','original_images/M._Monsur_Islam__IELTS_INS.JPG',2637,3340,'2026-02-20 07:01:59.346807',NULL,NULL,NULL,NULL,1,3856507,1,'60383b48aeefa36564aae956e625292b213c2aff','M. Monsur Islam  (IELTS INS)'),(5,'Aminul islam_ (IELTS INS)','original_images/Aminul_islam__IELTS_INS.JPG',856,982,'2026-02-20 07:03:04.881373',NULL,NULL,NULL,NULL,1,76481,1,'53e3f91b07adbffda5576e93ab848d47fc3d82ba','Aminul islam_ (IELTS INS)'),(6,'desktop banner one','original_images/desktop_banner_one.jpg',1536,500,'2026-02-20 17:47:56.523294',NULL,NULL,NULL,NULL,1,278704,1,'dc15c55b19815ec6157f1dfb3c841f0278ed6fc7',''),(7,'desktop banner two','original_images/desktop_banner_two.jpg',1536,500,'2026-02-20 17:48:05.292504',NULL,NULL,NULL,NULL,1,301962,1,'79aceb197b888d92a0c930d7946495251a464d9d',''),(8,'slide one','original_images/slide_one.jpg',1536,500,'2026-02-20 17:48:26.865936',NULL,NULL,NULL,NULL,1,40846,1,'625c38c08d7d8ebd0eac1f7fdc8c514a8c9a5538',''),(9,'slide two','original_images/slide_two.jpg',1536,500,'2026-02-20 17:48:35.822003',NULL,NULL,NULL,NULL,1,42958,1,'901027848aaa4fe4f51b34263bffbed4aa6d6f08','slide two'),(10,'profile pic','original_images/profile_pic.jpeg',896,1600,'2026-02-22 09:26:19.311714',NULL,NULL,NULL,NULL,1,200552,1,'9483ec1a7077915c04b7f2d382f728f8e43e29bf','');
/*!40000 ALTER TABLE `wagtailimages_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailimages_rendition`
--

DROP TABLE IF EXISTS `wagtailimages_rendition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailimages_rendition` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file` varchar(100) NOT NULL,
  `width` int NOT NULL,
  `height` int NOT NULL,
  `focal_point_key` varchar(16) NOT NULL,
  `filter_spec` varchar(255) NOT NULL,
  `image_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailimages_rendition_image_id_filter_spec_foc_323c8fe0_uniq` (`image_id`,`filter_spec`,`focal_point_key`),
  KEY `wagtailimages_rendition_filter_spec_1cba3201` (`filter_spec`),
  CONSTRAINT `wagtailimages_rendit_image_id_3e1fd774_fk_wagtailim` FOREIGN KEY (`image_id`) REFERENCES `wagtailimages_image` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailimages_rendition`
--

LOCK TABLES `wagtailimages_rendition` WRITE;
/*!40000 ALTER TABLE `wagtailimages_rendition` DISABLE KEYS */;
INSERT INTO `wagtailimages_rendition` VALUES (1,'images/scholarship-pop-up.max-165x165.jpg',165,165,'','max-165x165',1),(2,'images/scholarship-pop-up.2e16d0ba.fill-900x400.jpg',500,224,'2e16d0ba','fill-900x400',1),(3,'images/study-abroad-agency-in-bangladesh-desktop-ba.max-165x165.png',165,53,'','max-165x165',2),(4,'images/study-abroad-agency-in-bangladesh-.2e16d0ba.fill-900x400.png',900,400,'2e16d0ba','fill-900x400',2),(5,'images/study-abroad-agency-in-bangladesh-desktop-ban.width-1500.png',1500,488,'','width-1500',2),(6,'images/walid_pic_2_-_Fahim_Hussain_Walid__IELTS_INS.max-165x165.jpg',140,165,'','max-165x165',3),(7,'images/M._Monsur_Islam__IELTS_INS.max-165x165.jpg',130,165,'','max-165x165',4),(8,'images/walid_pic_2_-_Fahim_Hussain_Walid__IELTS_INS.original.jpg',654,769,'','original',3),(9,'images/walid_pic_2_-_Fahim_Hussain_Walid__IELTS_INS.max-800x600.jpg',510,600,'','max-800x600',3),(10,'images/Aminul_islam__IELTS_INS.max-165x165.jpg',143,165,'','max-165x165',5),(11,'images/walid_pic_2_-_Fahim_Hussain_Walid_.2e16d0ba.fill-300x200.jpg',300,200,'2e16d0ba','fill-300x200',3),(12,'images/M._Monsur_Islam__IELTS_INS.2e16d0ba.fill-300x200.jpg',300,200,'2e16d0ba','fill-300x200',4),(13,'images/Aminul_islam__IELTS_INS.2e16d0ba.fill-300x200.jpg',300,200,'2e16d0ba','fill-300x200',5),(14,'images/walid_pic_2_-_Fahim_Hussain_Walid_.2e16d0ba.fill-300x300.jpg',300,300,'2e16d0ba','fill-300x300',3),(15,'images/M._Monsur_Islam__IELTS_INS.2e16d0ba.fill-300x300.jpg',300,300,'2e16d0ba','fill-300x300',4),(16,'images/Aminul_islam__IELTS_INS.2e16d0ba.fill-300x300.jpg',300,300,'2e16d0ba','fill-300x300',5),(17,'images/desktop_banner_one.max-165x165.jpg',165,53,'','max-165x165',6),(18,'images/desktop_banner_two.max-165x165.jpg',165,53,'','max-165x165',7),(19,'images/slide_one.max-165x165.jpg',165,53,'','max-165x165',8),(20,'images/slide_two.max-165x165.jpg',165,53,'','max-165x165',9),(21,'images/desktop_banner_two.2e16d0ba.fill-900x400.jpg',900,400,'2e16d0ba','fill-900x400',7),(22,'images/slide_one.2e16d0ba.fill-900x400.jpg',900,400,'2e16d0ba','fill-900x400',8),(23,'images/slide_two.2e16d0ba.fill-900x400.jpg',900,400,'2e16d0ba','fill-900x400',9),(24,'images/desktop_banner_one.2e16d0ba.fill-900x400.jpg',900,400,'2e16d0ba','fill-900x400',6),(25,'images/scholarship-pop-up.2e16d0ba.fill-250x250.jpg',250,250,'2e16d0ba','fill-250x250',1),(26,'images/study-abroad-agency-in-bangladesh-.2e16d0ba.fill-250x250.png',250,250,'2e16d0ba','fill-250x250',2),(27,'images/scholarship-pop-up.2e16d0ba.fill-400x400.jpg',400,400,'2e16d0ba','fill-400x400',1),(28,'images/study-abroad-agency-in-bangladesh-.2e16d0ba.fill-400x400.png',400,400,'2e16d0ba','fill-400x400',2),(29,'images/profile_pic.max-165x165.jpg',92,165,'','max-165x165',10),(30,'images/profile_pic.2e16d0ba.fill-50x50.jpg',50,50,'2e16d0ba','fill-50x50',10),(31,'images/slide_one.original.jpg',1536,500,'','original',8),(32,'images/slide_one.max-800x600.jpg',800,260,'','max-800x600',8),(33,'images/slide_two.original.jpg',1536,500,'','original',9),(34,'images/slide_two.max-800x600.jpg',800,260,'','max-800x600',9),(35,'images/slide_two.2e16d0ba.fill-1400x400.jpg',1400,400,'2e16d0ba','fill-1400x400',9),(36,'images/slide_one.2e16d0ba.fill-250x250.jpg',250,250,'2e16d0ba','fill-250x250',8),(37,'images/profile_pic.2e16d0ba.fill-100x100.jpg',100,100,'2e16d0ba','fill-100x100',10),(38,'images/profile_pic.2e16d0ba.fill-200x250.jpg',200,250,'2e16d0ba','fill-200x250',10);
/*!40000 ALTER TABLE `wagtailimages_rendition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailredirects_redirect`
--

DROP TABLE IF EXISTS `wagtailredirects_redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailredirects_redirect` (
  `id` int NOT NULL AUTO_INCREMENT,
  `old_path` varchar(255) NOT NULL,
  `is_permanent` tinyint(1) NOT NULL,
  `redirect_link` varchar(255) NOT NULL,
  `redirect_page_id` int DEFAULT NULL,
  `site_id` int DEFAULT NULL,
  `automatically_created` tinyint(1) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `redirect_page_route_path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailredirects_redirect_old_path_site_id_783622d7_uniq` (`old_path`,`site_id`),
  KEY `wagtailredirects_red_redirect_page_id_b5728a8f_fk_wagtailco` (`redirect_page_id`),
  KEY `wagtailredirects_red_site_id_780a0e1e_fk_wagtailco` (`site_id`),
  KEY `wagtailredirects_redirect_old_path_bb35247b` (`old_path`),
  CONSTRAINT `wagtailredirects_red_redirect_page_id_b5728a8f_fk_wagtailco` FOREIGN KEY (`redirect_page_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `wagtailredirects_red_site_id_780a0e1e_fk_wagtailco` FOREIGN KEY (`site_id`) REFERENCES `wagtailcore_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailredirects_redirect`
--

LOCK TABLES `wagtailredirects_redirect` WRITE;
/*!40000 ALTER TABLE `wagtailredirects_redirect` DISABLE KEYS */;
INSERT INTO `wagtailredirects_redirect` VALUES (1,'/video-blog-article',1,'',9,2,1,'2026-02-23 10:45:18.134403','');
/*!40000 ALTER TABLE `wagtailredirects_redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailsearch_indexentry`
--

DROP TABLE IF EXISTS `wagtailsearch_indexentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailsearch_indexentry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_id` varchar(50) NOT NULL,
  `title_norm` double NOT NULL,
  `content_type_id` int NOT NULL,
  `autocomplete` longtext,
  `body` longtext,
  `title` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailsearch_indexentry_content_type_id_object_id_bcd7ba73_uniq` (`content_type_id`,`object_id`),
  FULLTEXT KEY `fulltext_body` (`body`),
  FULLTEXT KEY `fulltext_title` (`title`),
  FULLTEXT KEY `fulltext_title_body` (`title`,`body`),
  FULLTEXT KEY `fulltext_autocomplete` (`autocomplete`) /*!50100 WITH PARSER `ngram` */ ,
  CONSTRAINT `wagtailsearch_indexe_content_type_id_62ed694f_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailsearch_indexentry`
--

LOCK TABLES `wagtailsearch_indexentry` WRITE;
/*!40000 ALTER TABLE `wagtailsearch_indexentry` DISABLE KEYS */;
INSERT INTO `wagtailsearch_indexentry` VALUES (1,'3',1.625,2,'Home','','Home'),(2,'1',0.7222222222222222,28,'promotion promotion','promotion','promotion'),(3,'2',0.41357962962962963,28,'study-abroad-agency-in-bangladesh-desktop-banner-image','','study-abroad-agency-in-bangladesh-desktop-banner-image'),(4,'4',3.6,44,'About','','About'),(5,'3',0.7142857142857143,28,'Fahim Hussain Walid ( IELTS INS) M. Monsur Islam  (IELTS INS)','M. Monsur Islam  (IELTS INS)','Fahim Hussain Walid ( IELTS INS)'),(6,'4',0.7619035714285715,28,'M. Monsur Islam  (IELTS INS) M. Monsur Islam  (IELTS INS)','M. Monsur Islam  (IELTS INS)','M. Monsur Islam  (IELTS INS)'),(7,'5',0.8971439999999999,28,'Aminul islam_ (IELTS INS) Aminul islam_ (IELTS INS)','Aminul islam_ (IELTS INS)','Aminul islam_ (IELTS INS)'),(8,'6',1.2152777777777777,28,'desktop banner one','','desktop banner one'),(9,'7',1.1913555555555557,28,'desktop banner two','','desktop banner two'),(10,'8',2.2444444444444445,28,'slide one','','slide one'),(11,'9',2.131311111111111,28,'slide two slide two','slide two','slide two'),(12,'5',4.479175,48,'Blog','','Blog'),(13,'6',1.455125,49,'First Blog Post(test title)','','First Blog Post(test title)'),(14,'7',1.4226166666666666,49,'Blog Post #2','','Blog Post #2'),(15,'10',1.5151545454545454,28,'profile pic','','profile pic'),(16,'8',1.036764705882353,53,'Article Blog Page','','Article Blog Page'),(17,'9',0.9803944444444443,54,'Video Blog Article','','Video Blog Article'),(18,'10',1.4444416666666668,57,'Contact Form','','Contact Form');
/*!40000 ALTER TABLE `wagtailsearch_indexentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailusers_userprofile`
--

DROP TABLE IF EXISTS `wagtailusers_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailusers_userprofile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `submitted_notifications` tinyint(1) NOT NULL,
  `approved_notifications` tinyint(1) NOT NULL,
  `rejected_notifications` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  `preferred_language` varchar(10) NOT NULL,
  `current_time_zone` varchar(40) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `updated_comments_notifications` tinyint(1) NOT NULL,
  `dismissibles` json NOT NULL DEFAULT (_utf8mb4'{}'),
  `theme` varchar(40) NOT NULL,
  `density` varchar(40) NOT NULL,
  `contrast` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `wagtailusers_userprofile_user_id_59c92331_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailusers_userprofile`
--

LOCK TABLES `wagtailusers_userprofile` WRITE;
/*!40000 ALTER TABLE `wagtailusers_userprofile` DISABLE KEYS */;
INSERT INTO `wagtailusers_userprofile` VALUES (1,1,1,1,1,'','','',1,'{\"help\": true, \"editor-guide\": true, \"last_upgrade_check\": \"7.3.1\", \"whats-new-in-wagtail-6.3\": true}','system','default','system');
/*!40000 ALTER TABLE `wagtailusers_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-01  0:36:21
