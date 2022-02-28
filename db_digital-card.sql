CREATE DATABASE  IF NOT EXISTS `db_digital-card` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_digital-card`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: db_digital-card
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `tb_checkin_acessa`
--

DROP TABLE IF EXISTS `tb_checkin_acessa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_checkin_acessa` (
  `id_pessoa` int NOT NULL,
  `id_contato` int NOT NULL,
  `id_pessoa_contato` int NOT NULL,
  `data_checkin_acessa` date NOT NULL,
  `horário_checkin_acessa` time NOT NULL,
  `localização_checkin_acessa` varchar(50) COLLATE utf8_bin NOT NULL,
  `dispositivo_checkin_acessa` varchar(30) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_pessoa`,`id_contato`,`id_pessoa_contato`),
  KEY `fk_tb_checkin_acessa_tb_contato1_idx` (`id_contato`,`id_pessoa_contato`),
  CONSTRAINT `fk_tb_checkin_acessa_tb_contato1` FOREIGN KEY (`id_contato`, `id_pessoa_contato`) REFERENCES `tb_contato` (`id_contato`, `id_pessoa_contato`),
  CONSTRAINT `fk_tb_checkin_acessa_tb_pessoa1` FOREIGN KEY (`id_pessoa`) REFERENCES `tb_pessoa` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_checkin_acessa`
--

LOCK TABLES `tb_checkin_acessa` WRITE;
/*!40000 ALTER TABLE `tb_checkin_acessa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_checkin_acessa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_contato`
--

DROP TABLE IF EXISTS `tb_contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_contato` (
  `id_contato` int NOT NULL AUTO_INCREMENT,
  `link_contato` varchar(50) COLLATE utf8_bin NOT NULL,
  `tipo_contato` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `id_pessoa_contato` int NOT NULL,
  PRIMARY KEY (`id_contato`,`id_pessoa_contato`),
  KEY `fk_tb_contato_tb_pessoa_idx` (`id_pessoa_contato`),
  CONSTRAINT `fk_tb_contato_tb_pessoa` FOREIGN KEY (`id_pessoa_contato`) REFERENCES `tb_pessoa` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_contato`
--

LOCK TABLES `tb_contato` WRITE;
/*!40000 ALTER TABLE `tb_contato` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_modelo`
--

DROP TABLE IF EXISTS `tb_modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_modelo` (
  `id_modelo` int NOT NULL AUTO_INCREMENT,
  `largura_modelo` decimal(10,0) DEFAULT NULL,
  `comprimento_modelo` decimal(10,0) DEFAULT NULL,
  `cor_background_modelo` char(25) COLLATE utf8_bin DEFAULT NULL,
  `fonte_modelo` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `tamanho_fonte_modelo` int DEFAULT NULL,
  `estilo_fonte_modelo` char(10) COLLATE utf8_bin DEFAULT NULL,
  `template_modelo` enum('standard, light, dark') COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_modelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_modelo`
--

LOCK TABLES `tb_modelo` WRITE;
/*!40000 ALTER TABLE `tb_modelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_modelo_pessoa`
--

DROP TABLE IF EXISTS `tb_modelo_pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_modelo_pessoa` (
  `tb_modelo_id_modelo` int NOT NULL,
  `tb_pessoa_id_pessoa` int NOT NULL,
  PRIMARY KEY (`tb_modelo_id_modelo`,`tb_pessoa_id_pessoa`),
  KEY `fk_tb_modelo_has_tb_pessoa_tb_pessoa1_idx` (`tb_pessoa_id_pessoa`),
  KEY `fk_tb_modelo_has_tb_pessoa_tb_modelo1_idx` (`tb_modelo_id_modelo`),
  CONSTRAINT `fk_tb_modelo_has_tb_pessoa_tb_modelo1` FOREIGN KEY (`tb_modelo_id_modelo`) REFERENCES `tb_modelo` (`id_modelo`),
  CONSTRAINT `fk_tb_modelo_has_tb_pessoa_tb_pessoa1` FOREIGN KEY (`tb_pessoa_id_pessoa`) REFERENCES `tb_pessoa` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_modelo_pessoa`
--

LOCK TABLES `tb_modelo_pessoa` WRITE;
/*!40000 ALTER TABLE `tb_modelo_pessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_modelo_pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pessoa`
--

DROP TABLE IF EXISTS `tb_pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pessoa` (
  `id_pessoa` int NOT NULL AUTO_INCREMENT,
  `email_pessoa` varchar(50) COLLATE utf8_bin NOT NULL,
  `senha_pessoa` varchar(30) COLLATE utf8_bin NOT NULL,
  `nome_pessoa` varchar(30) COLLATE utf8_bin NOT NULL,
  `sobrenome_pessoa` varchar(50) COLLATE utf8_bin NOT NULL,
  `sexo_pessoa` char(1) COLLATE utf8_bin DEFAULT NULL,
  `biografia_pessoa` longtext COLLATE utf8_bin,
  `profissão_pessoa` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `idade_pessoa` int DEFAULT NULL,
  `data_nascimento_pessoa` date DEFAULT NULL,
  `raça_pessoa` enum('branco','preto','pardo','amarelo','indígena') COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pessoa`
--

LOCK TABLES `tb_pessoa` WRITE;
/*!40000 ALTER TABLE `tb_pessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_recado_deixado`
--

DROP TABLE IF EXISTS `tb_recado_deixado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_recado_deixado` (
  `id_recado_deixado` int NOT NULL AUTO_INCREMENT,
  `id_pessoa_recado_deixado` int NOT NULL,
  `mensagem_recado_deixado` longtext COLLATE utf8_bin,
  PRIMARY KEY (`id_recado_deixado`,`id_pessoa_recado_deixado`),
  KEY `fk_tb_recado_deixado_tb_pessoa1_idx` (`id_pessoa_recado_deixado`),
  CONSTRAINT `fk_tb_recado_deixado_tb_pessoa1` FOREIGN KEY (`id_pessoa_recado_deixado`) REFERENCES `tb_pessoa` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_recado_deixado`
--

LOCK TABLES `tb_recado_deixado` WRITE;
/*!40000 ALTER TABLE `tb_recado_deixado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_recado_deixado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_recado_recebido`
--

DROP TABLE IF EXISTS `tb_recado_recebido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_recado_recebido` (
  `id_recado_recebido` int NOT NULL AUTO_INCREMENT,
  `mensagem_recado_recebido` longtext COLLATE utf8_bin,
  `id_pessoa_recado_recebido` int NOT NULL,
  PRIMARY KEY (`id_recado_recebido`,`id_pessoa_recado_recebido`),
  KEY `fk_tb_recado_tb_pessoa1_idx` (`id_pessoa_recado_recebido`),
  CONSTRAINT `fk_tb_recado_tb_pessoa1` FOREIGN KEY (`id_pessoa_recado_recebido`) REFERENCES `tb_pessoa` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_recado_recebido`
--

LOCK TABLES `tb_recado_recebido` WRITE;
/*!40000 ALTER TABLE `tb_recado_recebido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_recado_recebido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_digital-card'
--

--
-- Dumping routines for database 'db_digital-card'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-28 19:22:40
