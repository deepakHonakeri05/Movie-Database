-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: Project1
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add person',1,'add_person'),(2,'Can change person',1,'change_person'),(3,'Can delete person',1,'delete_person'),(4,'Can view person',1,'view_person'),(5,'Can add log entry',2,'add_logentry'),(6,'Can change log entry',2,'change_logentry'),(7,'Can delete log entry',2,'delete_logentry'),(8,'Can view log entry',2,'view_logentry'),(9,'Can add permission',3,'add_permission'),(10,'Can change permission',3,'change_permission'),(11,'Can delete permission',3,'delete_permission'),(12,'Can view permission',3,'view_permission'),(13,'Can add group',4,'add_group'),(14,'Can change group',4,'change_group'),(15,'Can delete group',4,'delete_group'),(16,'Can view group',4,'view_group'),(17,'Can add user',5,'add_user'),(18,'Can change user',5,'change_user'),(19,'Can delete user',5,'delete_user'),(20,'Can view user',5,'view_user'),(21,'Can add content type',6,'add_contenttype'),(22,'Can change content type',6,'change_contenttype'),(23,'Can delete content type',6,'delete_contenttype'),(24,'Can view content type',6,'view_contenttype'),(25,'Can add session',7,'add_session'),(26,'Can change session',7,'change_session'),(27,'Can delete session',7,'delete_session'),(28,'Can view session',7,'view_session'),(29,'Can add actor',8,'add_actor'),(30,'Can change actor',8,'change_actor'),(31,'Can delete actor',8,'delete_actor'),(32,'Can view actor',8,'view_actor'),(33,'Can add director',9,'add_director'),(34,'Can change director',9,'change_director'),(35,'Can delete director',9,'delete_director'),(36,'Can view director',9,'view_director'),(37,'Can add movie_directedby',10,'add_movie_directedby'),(38,'Can change movie_directedby',10,'change_movie_directedby'),(39,'Can delete movie_directedby',10,'delete_movie_directedby'),(40,'Can view movie_directedby',10,'view_movie_directedby'),(41,'Can add movieactor_awards',11,'add_movieactor_awards'),(42,'Can change movieactor_awards',11,'change_movieactor_awards'),(43,'Can delete movieactor_awards',11,'delete_movieactor_awards'),(44,'Can view movieactor_awards',11,'view_movieactor_awards'),(45,'Can add moviecast',12,'add_moviecast'),(46,'Can change moviecast',12,'change_moviecast'),(47,'Can delete moviecast',12,'delete_moviecast'),(48,'Can view moviecast',12,'view_moviecast'),(49,'Can add moviedirector_awards',13,'add_moviedirector_awards'),(50,'Can change moviedirector_awards',13,'change_moviedirector_awards'),(51,'Can delete moviedirector_awards',13,'delete_moviedirector_awards'),(52,'Can view moviedirector_awards',13,'view_moviedirector_awards'),(53,'Can add movies',14,'add_movies'),(54,'Can change movies',14,'change_movies'),(55,'Can delete movies',14,'delete_movies'),(56,'Can view movies',14,'view_movies'),(57,'Can add rating',15,'add_rating'),(58,'Can change rating',15,'change_rating'),(59,'Can delete rating',15,'delete_rating'),(60,'Can view rating',15,'view_rating'),(61,'Can add userinfo',16,'add_userinfo'),(62,'Can change userinfo',16,'change_userinfo'),(63,'Can delete userinfo',16,'delete_userinfo'),(64,'Can view userinfo',16,'view_userinfo');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$ha2E8ANwM6gO$MHSJ6dt3BmcIlmecAF+ZN7LYcuPRL8XHeX9v8f/IuDg=',NULL,1,'admin','','','qwerty@gmail.com',1,1,'2019-10-12 11:32:16.015685'),(2,'pbkdf2_sha256$150000$77i5uoq4r5EV$bBwk7jmWsR2aAY5zWldZG+KHy8JDEQOTHamOel2h4bg=','2019-10-12 11:53:16.688918',1,'root','','','qwert@gmail.com',1,1,'2019-10-12 11:33:25.029431');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-10-12 11:37:09.515069','101','avengers',1,'[{\"added\": {}}]',14,2),(2,'2019-10-12 12:04:38.919851','62','Rajamouli',1,'[{\"added\": {}}]',9,2),(3,'2019-10-12 12:04:42.601561','1','movie_directedby object (1)',1,'[{\"added\": {}}]',10,2),(4,'2019-10-12 12:05:17.231206','66','bhavesh',1,'[{\"added\": {}}]',9,2),(5,'2019-10-12 12:05:20.996707','2','movie_directedby object (2)',1,'[{\"added\": {}}]',10,2),(6,'2019-10-13 04:33:35.380464','1','DiCaprio',1,'[{\"added\": {}}]',8,2),(7,'2019-10-13 05:08:25.749464','62','Rajamouli',2,'[{\"changed\": {\"fields\": [\"dir_picURL\"]}}]',9,2),(8,'2019-10-13 06:00:22.728741','62','Rajamouli',2,'[{\"changed\": {\"fields\": [\"dir_picURL\"]}}]',9,2),(9,'2019-10-13 06:01:10.148811','62','Rajamouli',2,'[{\"changed\": {\"fields\": [\"dir_picURL\"]}}]',9,2),(10,'2019-10-13 06:03:10.504493','62','Rajamouli',2,'[{\"changed\": {\"fields\": [\"dir_picURL\"]}}]',9,2),(11,'2019-10-13 06:03:28.287836','62','Rajamouli',2,'[{\"changed\": {\"fields\": [\"dir_picURL\"]}}]',9,2),(12,'2019-10-13 06:07:13.990110','101','avengers',2,'[{\"changed\": {\"fields\": [\"movie_picurl\"]}}]',14,2),(13,'2019-10-13 06:08:49.159814','1','DiCaprio',2,'[{\"changed\": {\"fields\": [\"act_picURL\"]}}]',8,2),(14,'2019-10-13 06:09:33.644667','1','DiCaprio',2,'[{\"changed\": {\"fields\": [\"act_picURL\"]}}]',8,2),(15,'2019-10-13 06:10:58.034949','1','DiCaprio',2,'[{\"changed\": {\"fields\": [\"act_picURL\"]}}]',8,2),(16,'2019-10-13 06:11:31.249562','1','DiCaprio',2,'[{\"changed\": {\"fields\": [\"act_picURL\"]}}]',8,2),(17,'2019-10-13 06:13:56.467949','1','DiCaprio',2,'[{\"changed\": {\"fields\": [\"act_picURL\"]}}]',8,2),(18,'2019-10-13 06:16:26.459725','1','DiCaprio',2,'[{\"changed\": {\"fields\": [\"act_picURL\"]}}]',8,2),(19,'2019-10-13 06:16:43.178980','1','DiCaprio',2,'[{\"changed\": {\"fields\": [\"act_picURL\"]}}]',8,2),(20,'2019-10-13 06:33:43.925953','101','Avengers',2,'[{\"changed\": {\"fields\": [\"mov_title\"]}}]',14,2),(21,'2019-10-13 06:34:04.814865','101','Avengers : End Game',2,'[{\"changed\": {\"fields\": [\"mov_title\"]}}]',14,2),(22,'2019-10-13 06:42:47.046343','101','Avengers : End Game',2,'[]',14,2),(23,'2019-10-13 07:09:19.238515','102','The Dark Knight',1,'[{\"added\": {}}]',14,2),(24,'2019-10-13 07:18:26.173491','103','Titanic',1,'[{\"added\": {}}]',14,2),(25,'2019-10-13 07:19:55.816311','104','Avatar',1,'[{\"added\": {}}]',14,2),(26,'2019-10-13 07:21:07.916755','105','The Avengers',1,'[{\"added\": {}}]',14,2),(27,'2019-10-13 07:22:15.662847','106','Joker',1,'[{\"added\": {}}]',14,2),(28,'2019-10-13 07:23:26.630084','107','Star Wars: Episode IV - A New Hope',1,'[{\"added\": {}}]',14,2),(29,'2019-10-13 07:25:45.191531','108','Inception',1,'[{\"added\": {}}]',14,2),(30,'2019-10-13 07:27:19.732680','109','The Lion King',1,'[{\"added\": {}}]',14,2),(31,'2019-10-13 07:37:16.434216','1','DiCaprio',2,'[{\"changed\": {\"fields\": [\"act_bio\", \"act_picURL\"]}}]',8,2),(32,'2019-10-13 07:39:31.016791','1','DiCaprio',2,'[{\"changed\": {\"fields\": [\"act_bio\"]}}]',8,2),(33,'2019-10-13 07:41:52.772244','2','Ellen Page',1,'[{\"added\": {}}]',8,2),(34,'2019-10-13 07:44:44.481378','3','Joaquin Phoenix',1,'[{\"added\": {}}]',8,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (2,'admin','logentry'),(4,'auth','group'),(3,'auth','permission'),(5,'auth','user'),(6,'contenttypes','contenttype'),(8,'movie','actor'),(9,'movie','director'),(11,'movie','movieactor_awards'),(12,'movie','moviecast'),(13,'movie','moviedirector_awards'),(14,'movie','movies'),(10,'movie','movie_directedby'),(1,'movie','person'),(15,'movie','rating'),(16,'movie','userinfo'),(7,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-10-12 11:24:40.981066'),(2,'auth','0001_initial','2019-10-12 11:24:41.082334'),(3,'admin','0001_initial','2019-10-12 11:24:41.297807'),(4,'admin','0002_logentry_remove_auto_add','2019-10-12 11:24:41.354114'),(5,'admin','0003_logentry_add_action_flag_choices','2019-10-12 11:24:41.364221'),(6,'contenttypes','0002_remove_content_type_name','2019-10-12 11:24:41.445011'),(7,'auth','0002_alter_permission_name_max_length','2019-10-12 11:24:41.475961'),(8,'auth','0003_alter_user_email_max_length','2019-10-12 11:24:41.503290'),(9,'auth','0004_alter_user_username_opts','2019-10-12 11:24:41.515034'),(10,'auth','0005_alter_user_last_login_null','2019-10-12 11:24:41.549582'),(11,'auth','0006_require_contenttypes_0002','2019-10-12 11:24:41.552277'),(12,'auth','0007_alter_validators_add_error_messages','2019-10-12 11:24:41.562369'),(13,'auth','0008_alter_user_username_max_length','2019-10-12 11:24:41.600613'),(14,'auth','0009_alter_user_last_name_max_length','2019-10-12 11:24:41.638104'),(15,'auth','0010_alter_group_name_max_length','2019-10-12 11:24:41.657773'),(16,'auth','0011_update_proxy_permissions','2019-10-12 11:24:41.668088'),(17,'movie','0001_initial','2019-10-12 11:24:41.683150'),(18,'movie','0002_blogs','2019-10-12 11:24:41.697383'),(19,'movie','0003_details','2019-10-12 11:24:41.711172'),(20,'movie','0004_auto_20190909_1645','2019-10-12 11:24:41.730883'),(21,'movie','0005_blogs_details_junk_person','2019-10-12 11:24:41.777967'),(22,'movie','0006_auto_20190909_1646','2019-10-12 11:24:41.801226'),(23,'movie','0007_person','2019-10-12 11:24:41.817956'),(24,'movie','0008_blogs','2019-10-12 11:24:41.831528'),(25,'movie','0009_auto_20190909_1652','2019-10-12 11:24:41.844008'),(26,'movie','0010_person','2019-10-12 11:24:41.862775'),(27,'sessions','0001_initial','2019-10-12 11:24:41.880327'),(28,'movie','0011_auto_20191012_1128','2019-10-12 11:28:54.639384'),(29,'movie','0012_auto_20191012_1152','2019-10-12 11:52:51.445244'),(30,'movie','0013_auto_20191012_1158','2019-10-12 11:58:44.641626'),(31,'movie','0014_auto_20191013_0453','2019-10-13 04:53:45.579021'),(32,'movie','0015_auto_20191013_0738','2019-10-13 07:38:10.077027');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_actor`
--

DROP TABLE IF EXISTS `movie_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_actor` (
  `act_id` int(11) NOT NULL,
  `act_name` varchar(50) NOT NULL,
  `act_gender` varchar(1) NOT NULL,
  `act_bio` varchar(10000) NOT NULL,
  `act_picURL` varchar(500) NOT NULL,
  PRIMARY KEY (`act_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_actor`
--

LOCK TABLES `movie_actor` WRITE;
/*!40000 ALTER TABLE `movie_actor` DISABLE KEYS */;
INSERT INTO `movie_actor` VALUES (1,'DiCaprio','m','Leonardo Wilhelm DiCaprio (/dɪˈkæprioʊ/, Italian: [diˈkaːprjo]; born November 11, 1974) is an American actor, film producer, and environmentalist. His accolades include an Academy Award and three Golden Globe Awards. Born in Los Angeles, DiCaprio began his career by appearing in television commercials in the late 1980s. In the early 1990s, he played recurring roles in various television series, such as the soap opera Parenthood. He had his first major film role in This Boy\'s Life, and received acclaim for the supporting role of a developmentally disabled boy in What\'s Eating Gilbert Grape (both 1993), which earned him an Academy Award nomination. He achieved international fame as a star in the epic romance Titanic (1997), which became the highest-grossing film to that point. After a brief setback, DiCaprio starred in two critically acclaimed films in 2002—the biographical crime drama Catch Me If You Can and the historical drama Gangs of New York, which marked his first of many collaborations with director Martin Scorsese. DiCaprio subsequently earned nominations for the Academy Award for Best Actor for the roles of Howard Hughes in The Aviator (2004) and a mercenary in the political thriller Blood Diamond (2006), and also received acclaim for his roles in the crime drama The Departed (2006) and the romantic drama Revolutionary Road (2008). In the 2010s, he starred in the science fiction thriller Inception (2010), the western Django Unchained (2012), the biopic The Wolf of Wall Street, the survival drama The Revenant—for which he earned an Academy Award and a BAFTA Award for Best Actor in a Leading Role—and the comedy-drama Once Upon a Time in Hollywood (2019). DiCaprio is the founder of the production company, Appian Way Productions, which has produced some of his own films, including The Aviator and The Wolf of Wall Street, and the television show, Greensburg (2008–2010).','http://www.gstatic.com/tv/thumb/persons/435/435_v9_bb.jpg'),(2,'Ellen Page','f','Ellen Grace Philpotts-Page[1] (born February 21, 1987)[2][3] is a Canadian actress and producer. Her career began with roles in television shows such as Pit Pony, Trailer Park Boys and ReGenesis. She starred in the 2005 drama Hard Candy, for which she won the Austin Film Critics. Association\'s Award for Best Actress. Her breakthrough role was the title role in Jason Reitman\'s film Juno (2007), for which she received nominations for an Academy Award, a BAFTA, a Golden Globe and a Screen Actors Guild Award for Best Actress and won the Independent Spirit Award, an MTV Movie Award and a Teen Choice Award. Page played Kitty Pryde in the X-Men films (2006, 2014). She also appeared in An American Crime (2007), The Tracey Fragments (2007) – a role that won her the Vancouver Film Critics Award for Best Actress – Smart People (2008), Whip It (2009), Super (2010) and Inception (2010). She provided the voice, motion capture and likeness of Jodie Holmes in the video game Beyond: Two Souls (2013). In 2017, she was cast as Vanya Hargreeves in the Netflix series The Umbrella Academy.','http://www.gstatic.com/tv/thumb/persons/261958/261958_v9_ba.jpg'),(3,'Joaquin Phoenix','m','Joaquin Rafael Phoenix (/hwɑːˈkiːn/; né Bottom; born October 28, 1974)[a][3] is an American actor, producer, and activist, who has received several accolades, including a Grammy Award, a Golden Globe Award and nominations for three Academy Awards. Phoenix started acting in television series with his brother River Phoenix and sister Summer Phoenix. His first major film role was in SpaceCamp (1986). During this period he was credited as Leaf Phoenix, his self-given name. He later went back to his birth name, Joaquin, and received positive reviews for his supporting work in several films, including To Die For (1995) and the period film Quills (2000). He received wider attention for his portrayal of Commodus in the 2000 historical epic film Gladiator, which earned him a nomination for the Academy Award for Best Supporting Actor. He has subsequently earned Best Actor nominations for portraying musician Johnny Cash in the biopic Walk the Line (2005) and for his role as a sex-obsessed alcoholic in the drama The Master (2012), which also won him the Volpi Cup for Best Actor. Phoenix\'s other films include the horror films Signs (2002) and The Village (2004), the historical drama Hotel Rwanda (2004), the romantic drama Her (2013), and the crime satire Inherent Vice (2014). He gained further acclaim for playing an assassin in You Were Never Really Here (2017), for which he won the Cannes Film Festival Award for Best Actor, and the titular character in Joker (2019). Phoenix has also ventured into directing music videos, as well as producing films and television shows. For recording the soundtrack to Walk the Line, he won the Grammy Award for Best Compilation Soundtrack for Visual Media. Phoenix is a social activist, lending his support to a number of charities and humanitarian organizations. He is on the board of directors for The Lunchbox Fund, a non-profit organization which provides daily meals to students of township schools in Soweto of South Africa. Phoenix is also known for his animal rights advocacy. He has been a vegan since the age of three and campaigns for PETA and In Defense of Animals.[4][5]','https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Joaquin_Phoenix_at_the_2018_Berlin_Film_Festival.jpg/440px-Joaquin_Phoenix_at_the_2018_Berlin_Film_Festival.jpg');
/*!40000 ALTER TABLE `movie_actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_director`
--

DROP TABLE IF EXISTS `movie_director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_director` (
  `dir_id` int(11) NOT NULL,
  `dir_name` varchar(50) NOT NULL,
  `dir_phone` int(11) NOT NULL,
  `dir_bio` varchar(500) NOT NULL,
  `dir_picURL` varchar(500) NOT NULL,
  PRIMARY KEY (`dir_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_director`
--

LOCK TABLES `movie_director` WRITE;
/*!40000 ALTER TABLE `movie_director` DISABLE KEYS */;
INSERT INTO `movie_director` VALUES (62,'Rajamouli',12345,'he did bahubali','http://www.forbesindia.com/media/images/2015/Dec/topimg_29083_ss_rajamouli.jpg'),(66,'bhavesh',123345,'sdfsgfrgrd','http://icons.iconarchive.com/icons/dtafalonso/android-lollipop/512/Movie-Studio-icon.png'),(70,'Robert',121,'Nice man','http://somethingfgssdgja.png');
/*!40000 ALTER TABLE `movie_director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_movie_directedby`
--

DROP TABLE IF EXISTS `movie_movie_directedby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_movie_directedby` (
  `dir_id` int(11) NOT NULL,
  `mov_id` int(11) NOT NULL,
  PRIMARY KEY (`dir_id`,`mov_id`),
  KEY `mov_id` (`mov_id`),
  CONSTRAINT `movie_movie_directedby_ibfk_1` FOREIGN KEY (`dir_id`) REFERENCES `movie_director` (`dir_id`),
  CONSTRAINT `movie_movie_directedby_ibfk_2` FOREIGN KEY (`mov_id`) REFERENCES `movie_movies` (`mov_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_movie_directedby`
--

LOCK TABLES `movie_movie_directedby` WRITE;
/*!40000 ALTER TABLE `movie_movie_directedby` DISABLE KEYS */;
INSERT INTO `movie_movie_directedby` VALUES (62,101),(66,101),(66,109);
/*!40000 ALTER TABLE `movie_movie_directedby` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Not_more_than3
AFTER INSERT ON movie_movie_directedby 
FOR EACH ROW
BEGIN
IF (EXISTS(select mov_id, count(mov_id) from movie_movie_directedby GROUP BY mov_id having count(mov_id) > 2)) THEN
CALL Display_Text;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `movie_movieactor_awards`
--

DROP TABLE IF EXISTS `movie_movieactor_awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_movieactor_awards` (
  `awards` varchar(50) NOT NULL,
  `act_id` int(11) NOT NULL,
  PRIMARY KEY (`awards`,`act_id`),
  KEY `act_id` (`act_id`),
  CONSTRAINT `movie_movieactor_awards_ibfk_1` FOREIGN KEY (`act_id`) REFERENCES `movie_actor` (`act_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_movieactor_awards`
--

LOCK TABLES `movie_movieactor_awards` WRITE;
/*!40000 ALTER TABLE `movie_movieactor_awards` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_movieactor_awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_moviecast`
--

DROP TABLE IF EXISTS `movie_moviecast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_moviecast` (
  `role` varchar(30) DEFAULT NULL,
  `act_id` int(11) NOT NULL,
  `mov_id` int(11) NOT NULL,
  PRIMARY KEY (`act_id`,`mov_id`),
  KEY `mov_id` (`mov_id`),
  CONSTRAINT `movie_moviecast_ibfk_1` FOREIGN KEY (`act_id`) REFERENCES `movie_actor` (`act_id`),
  CONSTRAINT `movie_moviecast_ibfk_2` FOREIGN KEY (`mov_id`) REFERENCES `movie_movies` (`mov_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_moviecast`
--

LOCK TABLES `movie_moviecast` WRITE;
/*!40000 ALTER TABLE `movie_moviecast` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_moviecast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_moviedirector_awards`
--

DROP TABLE IF EXISTS `movie_moviedirector_awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_moviedirector_awards` (
  `awards` varchar(50) NOT NULL,
  `dir_id` int(11) NOT NULL,
  PRIMARY KEY (`awards`,`dir_id`),
  KEY `dir_id` (`dir_id`),
  CONSTRAINT `movie_moviedirector_awards_ibfk_1` FOREIGN KEY (`dir_id`) REFERENCES `movie_director` (`dir_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_moviedirector_awards`
--

LOCK TABLES `movie_moviedirector_awards` WRITE;
/*!40000 ALTER TABLE `movie_moviedirector_awards` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_moviedirector_awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_movies`
--

DROP TABLE IF EXISTS `movie_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_movies` (
  `mov_id` int(11) NOT NULL,
  `mov_title` varchar(50) NOT NULL,
  `mov_year` int(11) NOT NULL,
  `mov_lang` varchar(30) NOT NULL,
  `description` varchar(300) NOT NULL,
  `movie_picurl` varchar(100) NOT NULL,
  PRIMARY KEY (`mov_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_movies`
--

LOCK TABLES `movie_movies` WRITE;
/*!40000 ALTER TABLE `movie_movies` DISABLE KEYS */;
INSERT INTO `movie_movies` VALUES (101,'Avengers : End Game',2019,'eng','tony stark is a jerk','https://img01.mgo-images.com/image/thumbnail/v2/content/MMVAF76018A477C2826A4EC8747C40B7BE27.jpeg'),(102,'The Dark Knight',2008,'English','With the help of allies Lt. Jim Gordon (Gary Oldman) and DA Harvey Dent (Aaron Eckhart), Batman (Christian Bale) has been able to keep a tight lid on crime in Gotham City. But when a vile young criminal calling himself the Joker (Heath Ledger) suddenly throws the town into chaos, the caped Crusader','https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg'),(103,'Titanic',1997,'English','Seventeen-year-old Rose hails from an aristocratic family and is set to be married. When she boards the Titanic, she meets Jack Dawson, an artist, and falls in love with him.','http://cdn.shopify.com/s/files/1/1148/8924/products/MPW-115495-a_1024x1024.jpg?v=1556255572'),(104,'Avatar',2009,'English','Jake, a paraplegic marine, replaces his brother on the Na\'vi inhabited Pandora for a corporate mission. He is accepted by the natives as one of their own but he must decide where his loyalties lie.','http://www.gstatic.com/tv/thumb/v22vodart/3542039/p3542039_v_v8_ac.jpg'),(105,'The Avengers',2012,'English','When Thor\'s evil brother, Loki (Tom Hiddleston), gains access to the unlimited power of the energy cube called the Tesseract, Nick Fury (Samuel L. Jackson), director of S.H.I.E.L.D., initiates a superhero recruitment effort to defeat the unprecedented threat to Earth. Joining Fury\'s \"dream team\" are','http://www.movienewsletters.net/photos/130835R1.jpg'),(106,'Joker',2019,'English','DescriptionForever alone in a crowd, failed comedian Arthur Fleck seeks connection as he walks the streets of Gotham City. Arthur wears two masks -- the one he paints for his day job as a clown, and the guise he projects in a futile attempt to feel like he\'s part of the world around him. Isolated, b','http://t0.gstatic.com/images?q=tbn:ANd9GcSJKLiEyyz1Q9RC8EBYl3ijr3nuGeyO2ETmwy6Kdq0AQtD0elWD'),(107,'Star Wars: Episode IV - A New Hope',1977,'English','After Princess Leia, the leader of the Rebel Alliance, is held hostage by Darth Vader, Luke and Han Solo must free her and destroy the powerful weapon created by the Galactic Empire.','http://www.gstatic.com/tv/thumb/v22vodart/4407/p4407_v_v8_ah.jpg'),(108,'Inception',2010,'English','Cobb steals information from his targets by entering their dreams. He is wanted for his alleged role in his wife\'s murder and his only chance at redemption is to perform the impossible, an inception.','http://t2.gstatic.com/images?q=tbn:ANd9GcRo9vfJCM6dzPkZHIHBVCtlJnAnew9Ai26kEdrli0-tfmatmciD'),(109,'The Lion King',1994,'English','DescriptionAs a cub, Simba is forced to leave the Pride Lands after his father Mufasa is murdered by his wicked uncle, Scar. Years later, he returns as a young lion to reclaim his throne.','http://t0.gstatic.com/images?q=tbn:ANd9GcSy2iMzH39dcj9KZeoulk18_LyeeoNIm5a26-2F80NY7rlVofiz');
/*!40000 ALTER TABLE `movie_movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_rating`
--

DROP TABLE IF EXISTS `movie_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_rating` (
  `stars` int(11) DEFAULT NULL,
  `reviews` varchar(100) DEFAULT NULL,
  `mov_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`mov_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `movie_rating_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `movie_userinfo` (`user_id`),
  CONSTRAINT `movie_rating_ibfk_2` FOREIGN KEY (`mov_id`) REFERENCES `movie_movies` (`mov_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_rating`
--

LOCK TABLES `movie_rating` WRITE;
/*!40000 ALTER TABLE `movie_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_userinfo`
--

DROP TABLE IF EXISTS `movie_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_userinfo` (
  `user_id` int(11) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_userinfo`
--

LOCK TABLES `movie_userinfo` WRITE;
/*!40000 ALTER TABLE `movie_userinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-23 22:45:36
