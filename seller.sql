-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (arm64)
--
-- Host: 127.0.0.1    Database: message_management_system_db
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_tab`
--

DROP TABLE IF EXISTS `admin_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_tab` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `admin_name` varchar(10) NOT NULL COMMENT '姓名',
  `admin_username` varchar(50) NOT NULL COMMENT '用户名',
  `admin_pasword` varchar(50) NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_tab`
--

LOCK TABLES `admin_tab` WRITE;
/*!40000 ALTER TABLE `admin_tab` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_tab`
--

DROP TABLE IF EXISTS `comment_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_tab` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `c_content` varchar(100) DEFAULT NULL COMMENT '评论内容',
  `msg_id` int NOT NULL COMMENT '信息id',
  `user_id` int NOT NULL COMMENT '评论者Id',
  `comment_time` timestamp NOT NULL COMMENT '评论时间',
  `pid` int NOT NULL DEFAULT '-1' COMMENT '父级评论id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_tab`
--

LOCK TABLES `comment_tab` WRITE;
/*!40000 ALTER TABLE `comment_tab` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_tab`
--

DROP TABLE IF EXISTS `message_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_tab` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '发布者id',
  `author_id` int NOT NULL COMMENT '发布者id',
  `type_id` int NOT NULL COMMENT '类型Id',
  `msg` varchar(100) NOT NULL COMMENT '消息内容',
  `ctime` timestamp NOT NULL COMMENT '创建时间',
  `msg_status` tinyint NOT NULL DEFAULT '1' COMMENT '状态,构建索引',
  `mtime` timestamp NOT NULL COMMENT '修改',
  PRIMARY KEY (`id`),
  KEY `idx_msg_status_ctime` (`msg_status`,`ctime`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_tab`
--

LOCK TABLES `message_tab` WRITE;
/*!40000 ALTER TABLE `message_tab` DISABLE KEYS */;
INSERT INTO `message_tab` VALUES (1,1,1,'xixixix','2023-03-12 10:44:33',1,'2023-02-12 16:00:00'),(2,1,1,'hahaha','2023-03-12 10:44:33',1,'2023-02-13 16:00:00'),(3,1,1,'didididi','2023-03-12 10:44:33',1,'2023-02-14 16:00:00'),(4,1,1,'嘿嘿嘿','2023-03-12 10:44:33',1,'2023-02-15 16:00:00');
/*!40000 ALTER TABLE `message_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_msg_tab`
--

DROP TABLE IF EXISTS `tag_msg_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_msg_tab` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tag_id` int DEFAULT NULL COMMENT 'tag主鍵',
  `msg_id` int NOT NULL COMMENT '消息id',
  PRIMARY KEY (`id`),
  KEY `idx_msg_id` (`msg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='消息標簽標';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_msg_tab`
--

LOCK TABLES `tag_msg_tab` WRITE;
/*!40000 ALTER TABLE `tag_msg_tab` DISABLE KEYS */;
INSERT INTO `tag_msg_tab` VALUES (1,1,1),(2,2,1),(3,3,1);
/*!40000 ALTER TABLE `tag_msg_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_tab`
--

DROP TABLE IF EXISTS `tag_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_tab` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主鍵',
  `tag_name` varchar(20) DEFAULT NULL COMMENT '標籤名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_tab`
--

LOCK TABLES `tag_tab` WRITE;
/*!40000 ALTER TABLE `tag_tab` DISABLE KEYS */;
INSERT INTO `tag_tab` VALUES (1,'青春有你'),(2,'天天向上'),(3,'快快乐乐');
/*!40000 ALTER TABLE `tag_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_tab`
--

DROP TABLE IF EXISTS `type_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_tab` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主鍵',
  `type_name` varchar(20) DEFAULT NULL COMMENT '標籤名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_tab`
--

LOCK TABLES `type_tab` WRITE;
/*!40000 ALTER TABLE `type_tab` DISABLE KEYS */;
INSERT INTO `type_tab` VALUES (1,'体育'),(2,'娱乐'),(3,'八卦'),(4,'财经');
/*!40000 ALTER TABLE `type_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tab`
--

DROP TABLE IF EXISTS `user_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_tab` (
  `user_email` varchar(25) NOT NULL COMMENT '用户email',
  `user_password` varchar(50) NOT NULL COMMENT '用户密码',
  `user_name` varchar(10) NOT NULL COMMENT '用户名称',
  `gender` char(1) NOT NULL COMMENT '用户性别',
  `signature` varchar(30) NOT NULL COMMENT '用户签名',
  `user_role` tinyint NOT NULL COMMENT '1代表娱乐新闻爱好者  0代表财金爱好者',
  PRIMARY KEY (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tab`
--

LOCK TABLES `user_tab` WRITE;
/*!40000 ALTER TABLE `user_tab` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_tab` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-18 18:29:07
