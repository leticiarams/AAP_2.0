-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: aaptercsem
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.35-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aaptercsem_curso`
--

DROP TABLE IF EXISTS `aaptercsem_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aaptercsem_curso` (
  `id_curso` int(11) NOT NULL AUTO_INCREMENT,
  `nome_curso` varchar(45) NOT NULL,
  `coordenador_curso` varchar(45) NOT NULL,
  PRIMARY KEY (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aaptercsem_curso`
--
-- ORDER BY:  `id_curso`

LOCK TABLES `aaptercsem_curso` WRITE;
/*!40000 ALTER TABLE `aaptercsem_curso` DISABLE KEYS */;
INSERT INTO `aaptercsem_curso` VALUES (1,'Eventos','Viviane Minati Panzeri'),(2,'Comércio Exterior - Noite','Sérgio Dias Teixeira Junior'),(3,'Comércio Exterior','Sérgio Dias Teixeira Junior'),(4,'Design de Mídias Digitais','Jadir Custósio mendonça Junior'),(5,'Gestão da Tecnologia da Informação','Oswaldo Soulé Junior'),(6,'Logistica','Prof. Me. Antonio Fernando Degobbi'),(7,'Transporte Terrestre','Dr. Eik Tenorio'),(8,'Gestão de Recursos Humanos - Manhã','Gilvan Aparecido Fortuoso Silva');
/*!40000 ALTER TABLE `aaptercsem_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aaptercsem_disponibilidade`
--

DROP TABLE IF EXISTS `aaptercsem_disponibilidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aaptercsem_disponibilidade` (
  `id_disponibilidade` int(11) NOT NULL AUTO_INCREMENT,
  `dia_sem_disponibilidade` varchar(1) NOT NULL,
  `hora_ini_disponibilidade` time(6) NOT NULL,
  `hora_fin_disponibilidade` time(6) NOT NULL,
  `id_professor_id` int(11) NOT NULL,
  PRIMARY KEY (`id_disponibilidade`),
  KEY `aaptercsem_disponibi_id_professor_id_b5ba8bfa_fk_aaptercse` (`id_professor_id`),
  CONSTRAINT `aaptercsem_disponibi_id_professor_id_b5ba8bfa_fk_aaptercse` FOREIGN KEY (`id_professor_id`) REFERENCES `aaptercsem_professor` (`id_professor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aaptercsem_disponibilidade`
--
-- ORDER BY:  `id_disponibilidade`

LOCK TABLES `aaptercsem_disponibilidade` WRITE;
/*!40000 ALTER TABLE `aaptercsem_disponibilidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `aaptercsem_disponibilidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aaptercsem_materia`
--

DROP TABLE IF EXISTS `aaptercsem_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aaptercsem_materia` (
  `id_materia` int(11) NOT NULL AUTO_INCREMENT,
  `nome_materia` varchar(45) NOT NULL,
  `sigla_materia` varchar(45) NOT NULL,
  `semestre_materia` varchar(5) NOT NULL,
  PRIMARY KEY (`id_materia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aaptercsem_materia`
--
-- ORDER BY:  `id_materia`

LOCK TABLES `aaptercsem_materia` WRITE;
/*!40000 ALTER TABLE `aaptercsem_materia` DISABLE KEYS */;
/*!40000 ALTER TABLE `aaptercsem_materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aaptercsem_materia_id_curso`
--

DROP TABLE IF EXISTS `aaptercsem_materia_id_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aaptercsem_materia_id_curso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `materia_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `aaptercsem_materia_id_curso_materia_id_curso_id_208a0a7d_uniq` (`materia_id`,`curso_id`),
  KEY `aaptercsem_materia_i_curso_id_115b0ef0_fk_aaptercse` (`curso_id`),
  CONSTRAINT `aaptercsem_materia_i_curso_id_115b0ef0_fk_aaptercse` FOREIGN KEY (`curso_id`) REFERENCES `aaptercsem_curso` (`id_curso`),
  CONSTRAINT `aaptercsem_materia_i_materia_id_dc90e893_fk_aaptercse` FOREIGN KEY (`materia_id`) REFERENCES `aaptercsem_materia` (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aaptercsem_materia_id_curso`
--
-- ORDER BY:  `id`

LOCK TABLES `aaptercsem_materia_id_curso` WRITE;
/*!40000 ALTER TABLE `aaptercsem_materia_id_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `aaptercsem_materia_id_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aaptercsem_materia_id_professor`
--

DROP TABLE IF EXISTS `aaptercsem_materia_id_professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aaptercsem_materia_id_professor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `materia_id` int(11) NOT NULL,
  `professor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `aaptercsem_materia_id_pr_materia_id_professor_id_90f3b8a8_uniq` (`materia_id`,`professor_id`),
  KEY `aaptercsem_materia_i_professor_id_249bf65e_fk_aaptercse` (`professor_id`),
  CONSTRAINT `aaptercsem_materia_i_materia_id_46d1f468_fk_aaptercse` FOREIGN KEY (`materia_id`) REFERENCES `aaptercsem_materia` (`id_materia`),
  CONSTRAINT `aaptercsem_materia_i_professor_id_249bf65e_fk_aaptercse` FOREIGN KEY (`professor_id`) REFERENCES `aaptercsem_professor` (`id_professor`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aaptercsem_materia_id_professor`
--
-- ORDER BY:  `id`

LOCK TABLES `aaptercsem_materia_id_professor` WRITE;
/*!40000 ALTER TABLE `aaptercsem_materia_id_professor` DISABLE KEYS */;
/*!40000 ALTER TABLE `aaptercsem_materia_id_professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aaptercsem_perfil`
--

DROP TABLE IF EXISTS `aaptercsem_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aaptercsem_perfil` (
  `id_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `nome_perfil` varchar(45) NOT NULL,
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aaptercsem_perfil`
--
-- ORDER BY:  `id_perfil`

LOCK TABLES `aaptercsem_perfil` WRITE;
/*!40000 ALTER TABLE `aaptercsem_perfil` DISABLE KEYS */;
INSERT INTO `aaptercsem_perfil` VALUES (8,'TESTEE'),(9,'TESTEE'),(10,'MUDEI O 8');
/*!40000 ALTER TABLE `aaptercsem_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aaptercsem_permissao`
--

DROP TABLE IF EXISTS `aaptercsem_permissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aaptercsem_permissao` (
  `chave_permissao` varchar(15) NOT NULL,
  `grupo_permissao` varchar(255) NOT NULL,
  `nome_permissao` varchar(255) NOT NULL,
  PRIMARY KEY (`chave_permissao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aaptercsem_permissao`
--
-- ORDER BY:  `chave_permissao`

LOCK TABLES `aaptercsem_permissao` WRITE;
/*!40000 ALTER TABLE `aaptercsem_permissao` DISABLE KEYS */;
/*!40000 ALTER TABLE `aaptercsem_permissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aaptercsem_permissaopefil`
--

DROP TABLE IF EXISTS `aaptercsem_permissaopefil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aaptercsem_permissaopefil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_permissao` varchar(3) NOT NULL,
  `chave_permissao_id` varchar(15) NOT NULL,
  `id_perfil_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aaptercsem_permissao_chave_permissao_id_9f2e13a8_fk_aaptercse` (`chave_permissao_id`),
  KEY `aaptercsem_permissao_id_perfil_id_40ed489c_fk_aaptercse` (`id_perfil_id`),
  CONSTRAINT `aaptercsem_permissao_chave_permissao_id_9f2e13a8_fk_aaptercse` FOREIGN KEY (`chave_permissao_id`) REFERENCES `aaptercsem_permissao` (`chave_permissao`),
  CONSTRAINT `aaptercsem_permissao_id_perfil_id_40ed489c_fk_aaptercse` FOREIGN KEY (`id_perfil_id`) REFERENCES `aaptercsem_perfil` (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aaptercsem_permissaopefil`
--
-- ORDER BY:  `id`

LOCK TABLES `aaptercsem_permissaopefil` WRITE;
/*!40000 ALTER TABLE `aaptercsem_permissaopefil` DISABLE KEYS */;
/*!40000 ALTER TABLE `aaptercsem_permissaopefil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aaptercsem_professor`
--

DROP TABLE IF EXISTS `aaptercsem_professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aaptercsem_professor` (
  `id_professor` int(11) NOT NULL AUTO_INCREMENT,
  `nome_professor` varchar(45) NOT NULL,
  `matricula_professor` varchar(45) NOT NULL,
  PRIMARY KEY (`id_professor`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aaptercsem_professor`
--
-- ORDER BY:  `id_professor`

LOCK TABLES `aaptercsem_professor` WRITE;
/*!40000 ALTER TABLE `aaptercsem_professor` DISABLE KEYS */;
INSERT INTO `aaptercsem_professor` VALUES (1,'Marcelo Eloy Fernandes','0000000000001'),(2,'Juliana Pellegrinelli Barbosa Costa','0000000000002'),(3,'Ernestina L. Cardoso Frigelg','0000000000003'),(4,'Beatriz Policarpo','0000000000004'),(5,'Uillicre Jaquison da Silva','0000000000005'),(6,'Sandro Francisco Detoni','0000000000006'),(7,'Lilian Marques Silva','0000000000007'),(8,'Cinira Gomes Lima Melo','0000000000008'),(9,'Evandro Cleber da Silva','0000000000009'),(10,'Paulo Jose Andre Pereira','0000000000010'),(11,'Eik Tenorio','0000000000011'),(12,'Sabrina Saito','0000000000012'),(13,'Vilma Moreira Ferreira','0000000000013'),(14,'Helena Damelio','0000000000014'),(15,'Rubens de Oliveira Passos','0000000000015'),(16,'Walter Aloisio Santana','0000000000016'),(17,'Marcelo Eloy Fernandes','0000000000017'),(18,'Alair Helena Ferreira','0000000000018'),(19,'Fatima Guarda Sardeiro','0000000000019'),(20,'Paula Valeria Chaves Pereira Correia','0000000000020'),(21,'Joao Gilberto Pinho','0000000000021'),(22,'Bianca Agarie','0000000000022'),(23,'Euclides Reame Junior','0000000000023'),(24,'Paulo Medeiros','0000000000024'),(25,'Oswaldo Soule Junior','0000000000025'),(26,'Jacinto Carlos Ascencio Cansado','0000000000026'),(27,'Margarete Bonaldi Ascencio Cansado','0000000000027'),(28,'Marcio Andre Ferreira Pereira','0000000000028'),(29,'Keila Rocha Reis de Carvalho','0000000000029'),(30,'Paulo Masys','0000000000030'),(31,'Ana Paula Rodrigues da Silva','0000000000031'),(32,'Rogerio Bardella','0000000000032'),(33,'Margibel Adriana de Oliveira','0000000000033'),(34,'Marcelo T Okano','0000000000034'),(35,'Josenilson Costa de Oliveira','0000000000035'),(36,'Viviane Veiga Shibaki','0000000000036'),(37,'fernanda castilho santana','0000000000037'),(38,'Marco Antonio  da Fonseca','0000000000038'),(39,'Helena Damêlio','0000000000039'),(40,'Carlota','0000000000040'),(41,'Tania','0000000000041'),(42,'Lilian','0000000000042'),(43,'Degobbi','0000000000043'),(44,'Rogerio','0000000000044'),(45,'Givan Aparecido Fortuoso Da Silva','0000000000045'),(46,'Maria Edna da Silva Gomes','0000000000046'),(47,'Meire Reis Clemente','0000000000047'),(48,'Miriam Lima Battistini','0000000000048'),(49,'Tadeu Zacarelli','0000000000049'),(50,'Aline','0000000000050'),(51,'Ana Paula Rodrigues','0000000000051'),(52,'Givan Aparecido','0000000000052'),(53,'Paula Valeria Chaves','0000000000053'),(54,'Maria Edna da Silva','0000000000054'),(55,'Mirian Lima Battistini','0000000000055'),(56,'Ernestina L. Cardoso','0000000000056'),(57,'Wander Assumpção','0000000000057');
/*!40000 ALTER TABLE `aaptercsem_professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aaptercsem_usuario`
--

DROP TABLE IF EXISTS `aaptercsem_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aaptercsem_usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome_usuario` varchar(45) NOT NULL,
  `id_perfil_id` int(11) NOT NULL,
  `id_professor` varchar(1) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `aaptercsem_usuario_id_perfil_id_65a3b15d_fk_aaptercse` (`id_perfil_id`),
  CONSTRAINT `aaptercsem_usuario_id_perfil_id_65a3b15d_fk_aaptercse` FOREIGN KEY (`id_perfil_id`) REFERENCES `aaptercsem_perfil` (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aaptercsem_usuario`
--
-- ORDER BY:  `id_usuario`

LOCK TABLES `aaptercsem_usuario` WRITE;
/*!40000 ALTER TABLE `aaptercsem_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `aaptercsem_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--
-- ORDER BY:  `id`

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--
-- ORDER BY:  `id`

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--
-- ORDER BY:  `id`

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add professor',1,'add_professor'),(2,'Can change professor',1,'change_professor'),(3,'Can delete professor',1,'delete_professor'),(4,'Can view professor',1,'view_professor'),(5,'Can add log entry',2,'add_logentry'),(6,'Can change log entry',2,'change_logentry'),(7,'Can delete log entry',2,'delete_logentry'),(8,'Can view log entry',2,'view_logentry'),(9,'Can add permission',3,'add_permission'),(10,'Can change permission',3,'change_permission'),(11,'Can delete permission',3,'delete_permission'),(12,'Can view permission',3,'view_permission'),(13,'Can add group',4,'add_group'),(14,'Can change group',4,'change_group'),(15,'Can delete group',4,'delete_group'),(16,'Can view group',4,'view_group'),(17,'Can add user',5,'add_user'),(18,'Can change user',5,'change_user'),(19,'Can delete user',5,'delete_user'),(20,'Can view user',5,'view_user'),(21,'Can add content type',6,'add_contenttype'),(22,'Can change content type',6,'change_contenttype'),(23,'Can delete content type',6,'delete_contenttype'),(24,'Can view content type',6,'view_contenttype'),(25,'Can add session',7,'add_session'),(26,'Can change session',7,'change_session'),(27,'Can delete session',7,'delete_session'),(28,'Can view session',7,'view_session'),(29,'Can add disponibilidade',8,'add_disponibilidade'),(30,'Can change disponibilidade',8,'change_disponibilidade'),(31,'Can delete disponibilidade',8,'delete_disponibilidade'),(32,'Can view disponibilidade',8,'view_disponibilidade'),(33,'Can add permissao',9,'add_permissao'),(34,'Can change permissao',9,'change_permissao'),(35,'Can delete permissao',9,'delete_permissao'),(36,'Can view permissao',9,'view_permissao'),(37,'Can add curso',10,'add_curso'),(38,'Can change curso',10,'change_curso'),(39,'Can delete curso',10,'delete_curso'),(40,'Can view curso',10,'view_curso'),(41,'Can add perfil',11,'add_perfil'),(42,'Can change perfil',11,'change_perfil'),(43,'Can delete perfil',11,'delete_perfil'),(44,'Can view perfil',11,'view_perfil'),(45,'Can add materia',12,'add_materia'),(46,'Can change materia',12,'change_materia'),(47,'Can delete materia',12,'delete_materia'),(48,'Can view materia',12,'view_materia'),(49,'Can add usuario',13,'add_usuario'),(50,'Can change usuario',13,'change_usuario'),(51,'Can delete usuario',13,'delete_usuario'),(52,'Can view usuario',13,'view_usuario'),(53,'Can add permissao pefil',14,'add_permissaopefil'),(54,'Can change permissao pefil',14,'change_permissaopefil'),(55,'Can delete permissao pefil',14,'delete_permissaopefil'),(56,'Can view permissao pefil',14,'view_permissaopefil');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--
-- ORDER BY:  `id`

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$wUk3adOsGWh1$aotEkiYjbpu4uMCmTBvgr9ET8EQ8QQBZuoZfICaEbFQ=','2018-12-05 23:33:58.381521',1,'admin','','','pedro.pita@outlook.com.br',1,1,'2018-11-18 19:23:17.899903');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--
-- ORDER BY:  `id`

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--
-- ORDER BY:  `id`

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--
-- ORDER BY:  `id`

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-11-18 19:34:29.498262','1','Perfil object (1)',1,'[{\"added\": {}}]',11,1),(2,'2018-11-18 21:16:50.651077','2','Perfil object (2)',3,'',11,1),(3,'2018-11-18 21:16:58.096343','7','Perfil object (7)',3,'',11,1),(4,'2018-11-18 21:16:58.148176','6','Perfil object (6)',3,'',11,1),(5,'2018-11-18 21:16:58.198272','5','Perfil object (5)',3,'',11,1),(6,'2018-11-18 21:16:58.249029','4','Perfil object (4)',3,'',11,1),(7,'2018-11-18 21:16:58.298917','3','Perfil object (3)',3,'',11,1),(8,'2018-11-18 21:16:58.356620','1','Perfil object (1)',3,'',11,1),(9,'2018-12-03 23:55:16.479091','1','Professor object (1)',1,'[{\"added\": {}}]',1,1),(10,'2018-12-03 23:55:25.046072','2','Professor object (2)',1,'[{\"added\": {}}]',1,1),(11,'2018-12-04 00:00:09.326707','2','Professor object (2)',3,'',1,1),(12,'2018-12-04 00:00:09.406495','1','Professor object (1)',3,'',1,1),(13,'2018-12-04 00:03:57.542723','1','Curso object (1)',1,'[{\"added\": {}}]',10,1),(14,'2018-12-04 00:04:22.737620','3','Professor object (3)',1,'[{\"added\": {}}]',1,1),(15,'2018-12-04 00:04:36.419939','4','Professor object (4)',1,'[{\"added\": {}}]',1,1),(16,'2018-12-04 00:04:49.735883','5','Professor object (5)',1,'[{\"added\": {}}]',1,1),(17,'2018-12-04 00:05:05.110593','6','Professor object (6)',1,'[{\"added\": {}}]',1,1),(18,'2018-12-04 00:05:17.630338','7','Professor object (7)',1,'[{\"added\": {}}]',1,1),(19,'2018-12-04 00:09:02.407529','8','Professor: Evandro/ Matricula: 00006',1,'[{\"added\": {}}]',1,1),(20,'2018-12-04 00:09:16.432710','9','Professor: Helena/ Matricula: 00007',1,'[{\"added\": {}}]',1,1),(21,'2018-12-04 00:09:25.701946','10','Professor: Jacinto/ Matricula: 00008',1,'[{\"added\": {}}]',1,1),(22,'2018-12-04 00:09:55.650379','11','Professor: João Pinho/ Matricula: 00009',1,'[{\"added\": {}}]',1,1),(23,'2018-12-04 00:10:11.449497','12','Professor: Juliana/ Matricula: 00010',1,'[{\"added\": {}}]',1,1),(24,'2018-12-04 00:10:25.056381','13','Professor: Keila/ Matricula: 00011',1,'[{\"added\": {}}]',1,1),(25,'2018-12-04 00:10:35.085901','14','Professor: Marcio/ Matricula: 00012',1,'[{\"added\": {}}]',1,1),(26,'2018-12-04 00:10:47.024848','15','Professor: Margarete/ Matricula: 00013',1,'[{\"added\": {}}]',1,1),(27,'2018-12-04 00:10:56.104650','16','Professor: Nailton/ Matricula: 00014',1,'[{\"added\": {}}]',1,1),(28,'2018-12-04 00:11:08.200091','17','Professor: Oswaldo/ Matricula: 00015',1,'[{\"added\": {}}]',1,1),(29,'2018-12-04 00:11:22.894659','18','Professor: Paula Vieira/ Matricula: 00016',1,'[{\"added\": {}}]',1,1),(30,'2018-12-04 00:11:39.259606','19','Professor: Paulo Masys/ Matricula: 00017',1,'[{\"added\": {}}]',1,1),(31,'2018-12-04 00:11:54.883740','20','Professor: Rogério/ Matricula: 00018',1,'[{\"added\": {}}]',1,1),(32,'2018-12-04 00:12:03.825842','21','Professor: Sabrina/ Matricula: 00019',1,'[{\"added\": {}}]',1,1),(33,'2018-12-04 00:16:18.934737','1','Materia: Inglês IV',1,'[{\"added\": {}}]',12,1),(34,'2018-12-04 00:16:59.288655','1','Materia: Inglês IV',2,'[{\"changed\": {\"fields\": [\"sigla_materia\"]}}]',12,1),(35,'2018-12-04 00:18:16.330520','2','Materia: Legislação Aplicada á TI/ Sigla: DDI-001',1,'[{\"added\": {}}]',12,1),(36,'2018-12-04 00:19:43.219577','3','Materia: Gestão de Pessoas/ Sigla: AGR-002',1,'[{\"added\": {}}]',12,1),(37,'2018-12-04 00:21:22.666754','4','Materia: Planejamento e Gestão Estratégica/ Sigla: AGE-001',1,'[{\"added\": {}}]',12,1),(38,'2018-12-04 00:21:43.245698','5','Materia: Algoritmos/ Sigla: IAL-001',1,'[{\"added\": {}}]',12,1),(39,'2018-12-04 00:22:08.677215','6','Materia: Linguagem de Programação/ Sigla: ILP-100',1,'[{\"added\": {}}]',12,1),(40,'2018-12-04 00:22:09.113459','7','Materia: Linguagem de Programação/ Sigla: ILP-100',1,'[{\"added\": {}}]',12,1),(41,'2018-12-04 00:22:41.777598','8','Materia: Banco de Dados/ Sigla: IBD-102',1,'[{\"added\": {}}]',12,1),(42,'2018-12-04 00:23:18.974669','9','Materia: Programação para Internet/ Sigla: ILP-104',1,'[{\"added\": {}}]',12,1),(43,'2018-12-04 00:23:43.520345','10','Materia: Gestão da Produção/ Sigla: AGP-001',1,'[{\"added\": {}}]',12,1),(44,'2018-12-04 00:25:54.756357','11','Materia: Sistemas Integrados de Gestão/ Sigla: ISI-101',1,'[{\"added\": {}}]',12,1),(45,'2018-12-04 00:26:53.133910','12','Materia: Gestão de Tecnologia da Informação/ Sigla: IGT-002',1,'[{\"added\": {}}]',12,1),(46,'2018-12-04 00:29:32.156355','13','Materia: AAP 5/ Sigla: AAP-005',1,'[{\"added\": {}}]',12,1),(47,'2018-12-04 00:30:02.641845','14','Materia: Estatística/ Sigla: MET-001',1,'[{\"added\": {}}]',12,1),(48,'2018-12-04 00:30:36.094898','15','Materia: Inglês/ Sigla: LIN-100',1,'[{\"added\": {}}]',12,1),(49,'2018-12-04 00:30:58.479042','16','Materia: Gestão de Sistemas Operacionais/ Sigla: IGS-001',1,'[{\"added\": {}}]',12,1),(50,'2018-12-04 00:32:33.799745','17','Materia: Inteligência de Negócios/ Sigla: IIN-001',1,'[{\"added\": {}}]',12,1),(51,'2018-12-04 00:32:56.875142','22','Professor: Jadir/ Matricula: 00020',1,'[{\"added\": {}}]',1,1),(52,'2018-12-04 00:33:24.425414','18','Materia: Engenharia de Software/ Sigla: IES-101',1,'[{\"added\": {}}]',12,1),(53,'2018-12-04 00:34:00.673289','19','Materia: AAP 4/ Sigla: AAP-004',1,'[{\"added\": {}}]',12,1),(54,'2018-12-04 00:34:31.596813','20','Materia: Redes de Compuatadores/ Sigla: IRC-008',1,'[{\"added\": {}}]',12,1),(55,'2018-12-04 00:35:08.422590','21','Materia: Projetos de Tecnologia da Informação I/ Sigla: IPT-001',1,'[{\"added\": {}}]',12,1),(56,'2018-12-04 00:35:30.401504','22','Materia: Projetos de Tecnologia da Informação II/ Sigla: IPT-101',1,'[{\"added\": {}}]',12,1),(57,'2018-12-04 00:38:33.504713','22','Materia: Projetos de Tecnologia da Informação II/ Sigla: IPT-101',2,'[{\"changed\": {\"fields\": [\"semestre_materia\"]}}]',12,1),(58,'2018-12-04 00:39:11.115396','21','Materia: Projetos de Tecnologia da Informação I/ Sigla: IPT-001/ Semestre: 5º',2,'[{\"changed\": {\"fields\": [\"semestre_materia\"]}}]',12,1),(59,'2018-12-04 00:39:15.950247','20','Materia: Redes de Compuatadores/ Sigla: IRC-008/ Semestre: 4º',2,'[{\"changed\": {\"fields\": [\"semestre_materia\"]}}]',12,1),(60,'2018-12-04 00:39:21.723582','19','Materia: AAP 4/ Sigla: AAP-004/ Semestre: 3º',2,'[{\"changed\": {\"fields\": [\"semestre_materia\"]}}]',12,1),(61,'2018-12-04 00:39:28.780624','18','Materia: Engenharia de Software/ Sigla: IES-101/ Semestre: 3º',2,'[{\"changed\": {\"fields\": [\"semestre_materia\"]}}]',12,1),(62,'2018-12-04 00:39:39.518573','17','Materia: Inteligência de Negócios/ Sigla: IIN-001/ Semestre: 6º',2,'[{\"changed\": {\"fields\": [\"semestre_materia\"]}}]',12,1),(63,'2018-12-04 00:39:44.737486','16','Materia: Gestão de Sistemas Operacionais/ Sigla: IGS-001/ Semestre: 2º',2,'[{\"changed\": {\"fields\": [\"semestre_materia\"]}}]',12,1),(64,'2018-12-04 00:39:55.987661','15','Materia: Inglês I/ Sigla: LIN-100/ Semestre: 1º',2,'[{\"changed\": {\"fields\": [\"semestre_materia\", \"nome_materia\"]}}]',12,1),(65,'2018-12-04 00:40:01.249555','14','Materia: Estatística/ Sigla: MET-001/ Semestre: 3º',2,'[{\"changed\": {\"fields\": [\"semestre_materia\"]}}]',12,1),(66,'2018-12-04 00:40:11.562542','13','Materia: AAP 5/ Sigla: AAP-005/ Semestre: 4º',2,'[{\"changed\": {\"fields\": [\"semestre_materia\"]}}]',12,1),(67,'2018-12-04 00:40:22.905819','12','Materia: Gestão de Tecnologia da Informação/ Sigla: IGT-002/ Semestre: 5º',2,'[{\"changed\": {\"fields\": [\"semestre_materia\"]}}]',12,1),(68,'2018-12-04 00:40:31.700254','11','Materia: Sistemas Integrados de Gestão/ Sigla: ISI-101/ Semestre: 5º',2,'[{\"changed\": {\"fields\": [\"semestre_materia\"]}}]',12,1),(69,'2018-12-04 00:40:45.827788','10','Materia: Gestão da Produção/ Sigla: AGP-001/ Semestre: 4º',2,'[{\"changed\": {\"fields\": [\"semestre_materia\"]}}]',12,1),(70,'2018-12-04 00:40:54.956133','9','Materia: Programação para Internet/ Sigla: ILP-104/ Semestre: 4º',2,'[{\"changed\": {\"fields\": [\"semestre_materia\"]}}]',12,1),(71,'2018-12-04 00:41:02.147607','8','Materia: Banco de Dados/ Sigla: IBD-102/ Semestre: 3º',2,'[{\"changed\": {\"fields\": [\"semestre_materia\"]}}]',12,1),(72,'2018-12-04 00:41:08.810481','7','Materia: Linguagem de Programação/ Sigla: ILP-100/ Semestre: 2º',2,'[{\"changed\": {\"fields\": [\"semestre_materia\"]}}]',12,1),(73,'2018-12-04 00:41:24.214187','6','Materia: Linguagem de Programação/ Sigla: ILP-100/ Semestre: 0º',3,'',12,1),(74,'2018-12-04 00:41:29.859824','5','Materia: Algoritmos/ Sigla: IAL-001/ Semestre: 1º',2,'[{\"changed\": {\"fields\": [\"semestre_materia\"]}}]',12,1),(75,'2018-12-04 00:41:42.156706','4','Materia: Planejamento e Gestão Estratégica/ Sigla: AGE-001/ Semestre: 5º',2,'[{\"changed\": {\"fields\": [\"semestre_materia\"]}}]',12,1),(76,'2018-12-04 00:41:46.895372','3','Materia: Gestão de Pessoas/ Sigla: AGR-002/ Semestre: 3º',2,'[{\"changed\": {\"fields\": [\"semestre_materia\"]}}]',12,1),(77,'2018-12-04 00:41:57.683449','2','Materia: Legislação Aplicada á TI/ Sigla: DDI-001/ Semestre: 6º',2,'[{\"changed\": {\"fields\": [\"semestre_materia\"]}}]',12,1),(78,'2018-12-04 00:42:08.959341','1','Materia: Inglês IV/ Sigla: LIN-400/ Semestre: 4º',2,'[{\"changed\": {\"fields\": [\"semestre_materia\"]}}]',12,1),(79,'2018-12-04 00:42:42.334516','23','Materia: Inglês II/ Sigla: LIN-200/ Semestre: 2º',1,'[{\"added\": {}}]',12,1),(80,'2018-12-04 00:43:01.518522','24','Materia: Inglês III/ Sigla: LIN-300/ Semestre: 3º',1,'[{\"added\": {}}]',12,1),(81,'2018-12-04 00:43:20.515819','25','Materia: AAP 2/ Sigla: AAP-002/ Semestre: 2º',1,'[{\"added\": {}}]',12,1),(82,'2018-12-04 00:43:59.528083','26','Materia: Gestão de Projetos/ Sigla: AGO-005/ Semestre: 5º',1,'[{\"added\": {}}]',12,1),(83,'2018-12-04 00:44:29.199163','27','Materia: Negócios Eletrônicos/ Sigla: ING-001/ Semestre: 6º',1,'[{\"added\": {}}]',12,1),(84,'2018-12-04 00:46:54.455422','28','Materia: Processos Gerenciais/ Sigla: AGO-006/ Semestre: 1º',1,'[{\"added\": {}}]',12,1),(85,'2018-12-04 00:47:38.441812','29','Materia: Fundamentos de Marketing/ Sigla: PMG-001/ Semestre: 4º',1,'[{\"added\": {}}]',12,1),(86,'2018-12-04 00:48:04.460166','30','Materia: Comunicação e Expressão/ Sigla: LPO-001/ Semestre: 1º',1,'[{\"added\": {}}]',12,1),(87,'2018-12-04 00:48:30.303110','31','Materia: Metodologia da Pesquisa Cientifica/ Sigla: TTG-001/ Semestre: 2º',1,'[{\"added\": {}}]',12,1),(88,'2018-12-04 00:49:44.544233','32','Materia: AAP 6/ Sigla: AAP-006/ Semestre: 6º',1,'[{\"added\": {}}]',12,1),(89,'2018-12-04 00:50:05.905677','33','Materia: Contabilidade/ Sigla: CCG-001/ Semestre: 3º',1,'[{\"added\": {}}]',12,1),(90,'2018-12-04 00:50:34.724521','34','Materia: Matemática Financeira/ Sigla: MMF-001/ Semestre: 2º',1,'[{\"added\": {}}]',12,1),(91,'2018-12-04 00:52:28.342276','35','Materia: Gestão Financeira/ Sigla: AGF-001/ Semestre: 4º',1,'[{\"added\": {}}]',12,1),(92,'2018-12-04 00:55:03.997747','36','Materia: Gestão Economica/ Sigla: AGE-003/ Semestre: 6º',1,'[{\"added\": {}}]',12,1),(93,'2018-12-04 00:56:16.968636','37','Materia: Fundamento da Tecnologia da Informação/ Sigla: TAI-001/ Semestre: 1º',1,'[{\"added\": {}}]',12,1),(94,'2018-12-04 00:56:38.696205','38','Materia: Matemática Discreta/ Sigla: MMD-001/ Semestre: 1º',1,'[{\"added\": {}}]',12,1),(95,'2018-12-05 23:27:51.503896','1','Curso: Gestão de Tecnologia da Informação',2,'[]',10,1),(96,'2018-12-05 23:29:05.056986','39','Materia: Matéria de Teste/ Sigla: MTE-001/ Semestre: 1º',1,'[{\"added\": {}}]',12,1),(97,'2018-12-05 23:29:17.906678','39','Materia: Matéria de Teste/ Sigla: MTE-001/ Semestre: 1º',3,'',12,1),(98,'2018-12-05 23:34:28.012767','2','Curso: Curso de Teste',1,'[{\"added\": {}}]',10,1),(99,'2018-12-05 23:34:42.973909','2','Curso: Curso de Teste',2,'[{\"changed\": {\"fields\": [\"coordenador_curso\"]}}]',10,1),(100,'2018-12-05 23:34:49.450678','2','Curso: Curso de Teste',3,'',10,1),(101,'2018-12-05 23:35:06.954339','3','Curso: Curso de Teste',1,'[{\"added\": {}}]',10,1),(102,'2018-12-05 23:35:21.400529','23','Professor: Pedro Pita/ Matricula: 123494',1,'[{\"added\": {}}]',1,1),(103,'2018-12-05 23:35:40.499662','40','Materia: Matéria de Teste/ Sigla: MET-001/ Semestre: 1º',1,'[{\"added\": {}}]',12,1),(104,'2018-12-05 23:35:58.456417','40','Materia: Matéria de Teste/ Sigla: MET-001/ Semestre: 1º',3,'',12,1),(105,'2018-12-05 23:36:27.354706','24','Professor: Alberto Limeira/ Matricula: 76178',1,'[{\"added\": {}}]',1,1),(106,'2018-12-05 23:36:42.811641','24','Professor: Alberto Limeira/ Matricula: 67464',2,'[{\"changed\": {\"fields\": [\"matricula_professor\"]}}]',1,1),(107,'2018-12-05 23:36:57.583920','24','Professor: Alberto Limeira/ Matricula: 67464',3,'',1,1),(108,'2018-12-05 23:36:57.644758','23','Professor: Pedro Pita/ Matricula: 123494',3,'',1,1),(109,'2018-12-05 23:40:44.969318','4','Disponibilidade object (4)',1,'[{\"added\": {}}]',8,1),(110,'2018-12-05 23:40:57.748566','4','Disponibilidade object (4)',3,'',8,1),(111,'2018-12-05 23:41:13.394756','5','Disponibilidade object (5)',1,'[{\"added\": {}}]',8,1),(112,'2018-12-05 23:41:26.669384','6','Disponibilidade object (6)',1,'[{\"added\": {}}]',8,1),(113,'2018-12-05 23:43:37.965292','3','Curso: Curso de Teste',3,'',10,1),(114,'2018-12-05 23:43:55.881765','4','Curso: Curso de Teste',1,'[{\"added\": {}}]',10,1),(115,'2018-12-05 23:44:05.026794','4','Curso: Curso de Teste',2,'[{\"changed\": {\"fields\": [\"coordenador_curso\"]}}]',10,1),(116,'2018-12-05 23:44:54.157580','41','Materia: Teste/ Sigla: TST-100/ Semestre: 1º',1,'[{\"added\": {}}]',12,1),(117,'2018-12-05 23:45:04.664251','41','Materia: Teste/ Sigla: TST-200/ Semestre: 1º',2,'[{\"changed\": {\"fields\": [\"sigla_materia\"]}}]',12,1),(118,'2018-12-05 23:45:32.728754','25','Professor: Aluberto Ferraz da Silva/ Matricula: 59348579',1,'[{\"added\": {}}]',1,1),(119,'2018-12-05 23:45:41.786917','25','Professor: Aluberto Ferraz da Silva/ Matricula: 768781',2,'[{\"changed\": {\"fields\": [\"matricula_professor\"]}}]',1,1),(120,'2018-12-05 23:46:14.434329','7','Disponibilidade object (7)',1,'[{\"added\": {}}]',8,1),(121,'2018-12-05 23:46:31.835917','8','Disponibilidade object (8)',1,'[{\"added\": {}}]',8,1),(122,'2018-12-05 23:46:44.474722','7','Disponibilidade object (7)',2,'[{\"changed\": {\"fields\": [\"hora_fin_disponibilidade\"]}}]',8,1),(123,'2018-12-06 02:53:54.447120','4','Curso: Curso de Teste',3,'',10,1),(124,'2018-12-06 04:31:16.653828','8','Disponibilidade object (8)',3,'',8,1),(125,'2018-12-06 04:31:16.745815','7','Disponibilidade object (7)',3,'',8,1),(126,'2018-12-06 04:31:16.934396','6','Disponibilidade object (6)',3,'',8,1),(127,'2018-12-06 04:31:17.070675','5','Disponibilidade object (5)',3,'',8,1),(128,'2018-12-06 04:31:33.203239','9','Disponibilidade object (9)',1,'[{\"added\": {}}]',8,1),(129,'2018-12-06 04:31:58.253873','10','Disponibilidade object (10)',1,'[{\"added\": {}}]',8,1),(130,'2018-12-06 04:32:11.785514','11','Disponibilidade object (11)',1,'[{\"added\": {}}]',8,1),(131,'2018-12-06 04:32:21.561414','12','Disponibilidade object (12)',1,'[{\"added\": {}}]',8,1),(132,'2018-12-06 04:32:31.334977','13','Disponibilidade object (13)',1,'[{\"added\": {}}]',8,1),(133,'2018-12-06 04:32:41.686800','14','Disponibilidade object (14)',1,'[{\"added\": {}}]',8,1),(134,'2018-12-06 04:32:52.247008','15','Disponibilidade object (15)',1,'[{\"added\": {}}]',8,1),(135,'2018-12-06 04:33:13.090487','16','Disponibilidade object (16)',1,'[{\"added\": {}}]',8,1),(136,'2018-12-06 04:33:43.502188','17','Disponibilidade object (17)',1,'[{\"added\": {}}]',8,1),(137,'2018-12-06 04:34:00.996542','18','Disponibilidade object (18)',1,'[{\"added\": {}}]',8,1),(138,'2018-12-06 04:34:24.119552','19','Disponibilidade object (19)',1,'[{\"added\": {}}]',8,1),(139,'2018-12-06 04:34:38.201983','20','Disponibilidade object (20)',1,'[{\"added\": {}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--
-- ORDER BY:  `id`

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'aaptercsem','professor'),(2,'admin','logentry'),(3,'auth','permission'),(4,'auth','group'),(5,'auth','user'),(6,'contenttypes','contenttype'),(7,'sessions','session'),(8,'aaptercsem','disponibilidade'),(9,'aaptercsem','permissao'),(10,'aaptercsem','curso'),(11,'aaptercsem','perfil'),(12,'aaptercsem','materia'),(13,'aaptercsem','usuario'),(14,'aaptercsem','permissaopefil');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--
-- ORDER BY:  `id`

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'aaptercsem','0001_initial','2018-11-04 18:47:30.423482'),(2,'contenttypes','0001_initial','2018-11-04 18:47:32.197861'),(3,'auth','0001_initial','2018-11-04 18:47:49.850209'),(4,'admin','0001_initial','2018-11-04 18:47:58.738761'),(5,'admin','0002_logentry_remove_auto_add','2018-11-04 18:47:58.843784'),(6,'admin','0003_logentry_add_action_flag_choices','2018-11-04 18:47:58.980758'),(7,'contenttypes','0002_remove_content_type_name','2018-11-04 18:48:00.374281'),(8,'auth','0002_alter_permission_name_max_length','2018-11-04 18:48:02.814851'),(9,'auth','0003_alter_user_email_max_length','2018-11-04 18:48:05.839005'),(10,'auth','0004_alter_user_username_opts','2018-11-04 18:48:06.211572'),(11,'auth','0005_alter_user_last_login_null','2018-11-04 18:48:08.691178'),(12,'auth','0006_require_contenttypes_0002','2018-11-04 18:48:08.817370'),(13,'auth','0007_alter_validators_add_error_messages','2018-11-04 18:48:08.905620'),(14,'auth','0008_alter_user_username_max_length','2018-11-04 18:48:11.462307'),(15,'auth','0009_alter_user_last_name_max_length','2018-11-04 18:48:13.549142'),(16,'sessions','0001_initial','2018-11-04 18:48:14.485219'),(17,'aaptercsem','0002_curso_disponibilidade_materia_perfil_permissao_permissaopefil_usuario','2018-11-04 19:30:17.586052'),(18,'aaptercsem','0003_auto_20181118_1735','2018-11-18 19:35:49.996765'),(19,'aaptercsem','0004_materia_id_professor','2018-12-02 16:49:23.130994'),(20,'aaptercsem','0005_remove_curso_id_professor','2018-12-04 00:03:10.660705'),(21,'aaptercsem','0006_materia_semestre_materia','2018-12-04 00:37:58.265864'),(22,'aaptercsem','0007_auto_20181206_0106','2018-12-06 03:06:42.710742');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--
-- ORDER BY:  `session_key`

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('t4xvlmlvz1nolj45x2ox5c4uzqj64oj7','MDM0YTQxZThlMDUxYWM4NTQ5N2QyZGMwY2EwZDA4YzBlNDIyZTJkNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhODhlNWFiODFmOTQ4MmEwYjQyY2Q4NmFkNWYxOTkzOWU4NTg5NmVjIn0=','2018-12-19 23:33:58.572733'),('x7u4bh79wiu9szfm271zehh2xwk7nfyp','MDM0YTQxZThlMDUxYWM4NTQ5N2QyZGMwY2EwZDA4YzBlNDIyZTJkNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhODhlNWFiODFmOTQ4MmEwYjQyY2Q4NmFkNWYxOTkzOWU4NTg5NmVjIn0=','2018-12-02 19:34:02.352690');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-14  9:52:11
