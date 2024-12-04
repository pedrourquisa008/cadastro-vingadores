CREATE DATABASE  IF NOT EXISTS `vingadores` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `vingadores`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: vingadores
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `chip_gps`
--

DROP TABLE IF EXISTS `chip_gps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chip_gps` (
  `idchip_GPS` int NOT NULL AUTO_INCREMENT,
  `idtornozeleira` int NOT NULL,
  `localizacao_atual` varchar(45) NOT NULL,
  `ultima_localizacao` varchar(45) NOT NULL,
  `chip_GPScol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idchip_GPS`),
  KEY `idtornozeleira_idx` (`idtornozeleira`),
  CONSTRAINT `idtornozeleira` FOREIGN KEY (`idtornozeleira`) REFERENCES `tornozeleria` (`idtornozeleria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chip_gps`
--

LOCK TABLES `chip_gps` WRITE;
/*!40000 ALTER TABLE `chip_gps` DISABLE KEYS */;
/*!40000 ALTER TABLE `chip_gps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `convocacao`
--

DROP TABLE IF EXISTS `convocacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `convocacao` (
  `idConvocação` int NOT NULL AUTO_INCREMENT,
  `nome_heroi` varchar(45) NOT NULL,
  `motivo` varchar(250) NOT NULL,
  `data_convocacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_comparecimento` date DEFAULT NULL,
  `status` enum('Pendente','Comparecido','Ausente') NOT NULL,
  PRIMARY KEY (`idConvocação`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convocacao`
--

LOCK TABLES `convocacao` WRITE;
/*!40000 ALTER TABLE `convocacao` DISABLE KEYS */;
INSERT INTO `convocacao` VALUES (1,'','Duende Verde','2024-11-29 13:29:35',NULL,'Pendente'),(2,'Homem Aranha','Brigou','2024-11-29 13:42:45',NULL,'Pendente');
/*!40000 ALTER TABLE `convocacao` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Convocacao_BEFORE_UPDATE` BEFORE UPDATE ON `convocacao` FOR EACH ROW BEGIN
 
	IF NEW.status = 'Pendente' AND OLD.status <> 'Pendente' and OLD.status <> 'Ausente' THEN

        SET New.data_comparecimento = CURRENT_TIMESTAMP;

	end if;

    end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `heroi`
--

DROP TABLE IF EXISTS `heroi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `heroi` (
  `idheroi` int NOT NULL AUTO_INCREMENT,
  `nome_heroi` varchar(45) DEFAULT NULL,
  `nome_real` varchar(45) DEFAULT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  `poderes` varchar(45) DEFAULT NULL,
  `poder_principal` varchar(45) DEFAULT NULL,
  `fraquezas` varchar(45) DEFAULT NULL,
  `nivel_forca` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idheroi`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heroi`
--

LOCK TABLES `heroi` WRITE;
/*!40000 ALTER TABLE `heroi` DISABLE KEYS */;
INSERT INTO `heroi` VALUES (1,'Homem de ferro','TonyStark','Humano','Raio, voar','Raio','Amor','100'),(2,'Homem Aranha','Peter Parker','Humano','teia, sentido aranha','teia','amor, duende verde','110'),(3,'Hulk','Bruce Benner','Meta-humano','Força, smash','Força','Inteligência','200');
/*!40000 ALTER TABLE `heroi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mandado_de_prisao`
--

DROP TABLE IF EXISTS `mandado_de_prisao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mandado_de_prisao` (
  `idmandado_de_prisao` int NOT NULL AUTO_INCREMENT,
  `nome_heroi` varchar(45) NOT NULL,
  `motivo` varchar(250) DEFAULT NULL,
  `data_emissao` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Ativo','Cumprido','Cancelado') DEFAULT NULL,
  PRIMARY KEY (`idmandado_de_prisao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mandado_de_prisao`
--

LOCK TABLES `mandado_de_prisao` WRITE;
/*!40000 ALTER TABLE `mandado_de_prisao` DISABLE KEYS */;
/*!40000 ALTER TABLE `mandado_de_prisao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tornozeleria`
--

DROP TABLE IF EXISTS `tornozeleria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tornozeleria` (
  `idtornozeleria` int NOT NULL AUTO_INCREMENT,
  `status` enum('Ativo','Inativo') NOT NULL,
  `data_ativação` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_desativação` date DEFAULT NULL,
  `idheroi` int NOT NULL,
  PRIMARY KEY (`idtornozeleria`),
  KEY `idheroi_idx` (`idheroi`),
  CONSTRAINT `idheroi` FOREIGN KEY (`idheroi`) REFERENCES `heroi` (`idheroi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tornozeleria`
--

LOCK TABLES `tornozeleria` WRITE;
/*!40000 ALTER TABLE `tornozeleria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tornozeleria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'vingadores'
--

--
-- Dumping routines for database 'vingadores'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-04 13:48:55
