-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: estoque
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `movimentacoes`
--

DROP TABLE IF EXISTS `movimentacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimentacoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `produto_id` int NOT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `descricao` text,
  `data` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimentacoes`
--

LOCK TABLES `movimentacoes` WRITE;
/*!40000 ALTER TABLE `movimentacoes` DISABLE KEYS */;
INSERT INTO `movimentacoes` VALUES (1,1,'entrada',11,'Produto adicionado','2024-07-30 19:45:19'),(2,2,'entrada',11,'Produto adicionado','2024-07-30 19:45:23'),(3,3,'entrada',11,'Produto adicionado','2024-07-30 19:45:24'),(4,4,'entrada',11,'Produto adicionado','2024-07-30 19:45:25'),(5,5,'entrada',11,'Produto adicionado','2024-07-30 19:45:25'),(6,6,'entrada',11,'Produto adicionado','2024-07-30 19:45:25'),(7,7,'entrada',11,'Produto adicionado','2024-07-30 19:45:25'),(8,8,'entrada',11,'Produto adicionado','2024-07-30 19:45:26'),(9,9,'entrada',11,'Produto adicionado','2024-07-30 19:45:26'),(10,1,'saída',11,'Produto excluído','2024-07-30 19:45:33'),(11,10,'entrada',11,'Produto adicionado','2024-07-30 19:50:53'),(12,11,'entrada',11,'Produto adicionado','2024-07-30 19:50:54'),(13,12,'entrada',11,'Produto adicionado','2024-07-30 19:50:55'),(14,13,'entrada',11,'Produto adicionado','2024-07-30 19:50:55'),(15,2,'saída',11,'Produto excluído','2024-07-30 19:51:01'),(16,14,'entrada',11,'Produto adicionado','2024-08-01 03:47:41'),(17,15,'entrada',11,'Produto adicionado','2024-08-01 03:47:41'),(18,16,'entrada',11,'Produto adicionado','2024-08-01 03:47:42'),(19,17,'entrada',11,'Produto adicionado','2024-08-01 03:47:42'),(20,18,'entrada',11,'Produto adicionado','2024-08-01 03:47:43'),(21,19,'entrada',11,'Produto adicionado','2024-08-01 03:47:43'),(22,20,'entrada',11,'Produto adicionado','2024-08-01 03:47:49'),(23,20,'saída',11,'Produto excluído','2024-08-01 03:48:48'),(24,19,'atualizacao',50,'Produto atualizado de 50 para 50','2024-08-01 03:58:18'),(25,21,'entrada',11,'Produto adicionado','2024-08-01 04:16:16'),(26,15,'saída',11,'Produto excluído','2024-08-01 04:21:54'),(27,22,'entrada',11,'Produto adicionado','2024-08-01 04:22:04'),(28,22,'atualizacao',50,'Produto atualizado de 11 para 50','2024-08-01 04:22:39'),(29,23,'entrada',11,'Produto adicionado','2024-08-01 04:17:24'),(30,24,'entrada',11,'Produto adicionado','2024-08-01 04:17:25');
/*!40000 ALTER TABLE `movimentacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` text,
  `preco` decimal(10,2) DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (3,'slaaa','Computador gamer com processador Intel i9, 16GB RAM, e 1TB SSD.',4999.99,11),(4,'slaaa','Computador gamer com processador Intel i9, 16GB RAM, e 1TB SSD.',4999.99,11),(5,'slaaa','Computador gamer com processador Intel i9, 16GB RAM, e 1TB SSD.',4999.99,11),(6,'slaaa','Computador gamer com processador Intel i9, 16GB RAM, e 1TB SSD.',4999.99,11),(7,'slaaa','Computador gamer com processador Intel i9, 16GB RAM, e 1TB SSD.',4999.99,11),(8,'slaaa','Computador gamer com processador Intel i9, 16GB RAM, e 1TB SSD.',4999.99,11),(9,'slaaa','Computador gamer com processador Intel i9, 16GB RAM, e 1TB SSD.',4999.99,11),(10,'slaaa','Computador gamer com processador Intel i9, 16GB RAM, e 1TB SSD.',4999.99,11),(11,'slaaa','Computador gamer com processador Intel i9, 16GB RAM, e 1TB SSD.',4999.99,11),(12,'slaaa','Computador gamer com processador Intel i9, 16GB RAM, e 1TB SSD.',4999.99,11),(13,'slaaa','Computador gamer com processador Intel i9, 16GB RAM, e 1TB SSD.',4999.99,11),(14,'slaaa','Computador gamer com processador Intel i9, 16GB RAM, e 1TB SSD.',4999.99,11),(16,'slaaa','Computador gamer com processador Intel i9, 16GB RAM, e 1TB SSD.',4999.99,11),(17,'slaaa','Computador gamer com processador Intel i9, 16GB RAM, e 1TB SSD.',4999.99,11),(18,'slaaa','Computador gamer com processador Intel i9, 16GB RAM, e 1TB SSD.',4999.99,11),(19,'Produto Atualizado','Descrição atualizada do produto',199.99,50),(21,'slaaa3','Computador gamer com processador Intel i9, 16GB RAM, e 1TB SSD.',4999.99,11),(22,'Produto Atualizado','Descrição atualizada do produto',199.99,50),(23,'slaaa4','Computador gamer com processador Intel i9, 16GB RAM, e 1TB SSD.',4999.99,11),(24,'slaaa4','Computador gamer com processador Intel i9, 16GB RAM, e 1TB SSD.',4999.99,11);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-08  3:31:29
