CREATE DATABASE  IF NOT EXISTS `pantry` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pantry`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: pantry
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
-- Table structure for table `inventories`
--

DROP TABLE IF EXISTS `inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventories`
--

LOCK TABLES `inventories` WRITE;
/*!40000 ALTER TABLE `inventories` DISABLE KEYS */;
INSERT INTO `inventories` VALUES (1,'Sesame Street - Front Fridge',NULL,'12345 Sesame Street','2022-01-04 08:45:10','2022-01-04 08:45:10');
/*!40000 ALTER TABLE `inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_details`
--

DROP TABLE IF EXISTS `inventory_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_details` (
  `inventory_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_quantity` double NOT NULL DEFAULT '0',
  `shop_date` datetime NOT NULL,
  `condition` varchar(45) DEFAULT NULL,
  `last_condition_update_date` datetime DEFAULT NULL,
  `mfg_date` datetime DEFAULT NULL,
  `exp_date` datetime DEFAULT NULL,
  PRIMARY KEY (`inventory_id`),
  KEY `fk_product_id_idx` (`product_id`),
  CONSTRAINT `fk_inventory_id` FOREIGN KEY (`inventory_id`) REFERENCES `inventories` (`id`) ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_details`
--

LOCK TABLES `inventory_details` WRITE;
/*!40000 ALTER TABLE `inventory_details` DISABLE KEYS */;
INSERT INTO `inventory_details` VALUES (1,3,0,'2022-01-04 08:45:10','2','2022-02-08 07:50:31',NULL,'2022-02-08 07:50:31');
/*!40000 ALTER TABLE `inventory_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `type` varchar(45) NOT NULL,
  `uom_id` int NOT NULL,
  `price_per_unit` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_uom_id_idx` (`uom_id`),
  CONSTRAINT `fk_uom_id` FOREIGN KEY (`uom_id`) REFERENCES `uom` (`id`) ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Toothpase',NULL,'Colgate','General',1,4.99),(2,'Milk',NULL,'Lucerne ','Dairy',7,2.99),(3,'Eggs',NULL,'Generic','Grocery',9,3.99),(4,'Bread',NULL,'Boudin','Grocery',1,2.99),(5,'Cauliflower',NULL,'Store','Produce',3,0.005);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uom`
--

DROP TABLE IF EXISTS `uom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uom` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uom_name` varchar(45) NOT NULL,
  `uom_description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uom`
--

LOCK TABLES `uom` WRITE;
/*!40000 ALTER TABLE `uom` DISABLE KEYS */;
INSERT INTO `uom` VALUES (1,'Each',NULL),(2,'KG','Kilograms'),(3,'Grams','Grams'),(4,'LBS','Pounds'),(5,'Oz','Ouncez'),(6,'Fl Oz','Fluid Ouncez'),(7,'L','Litres'),(8,'ml','milli litres'),(9,'dozen','Dozen');
/*!40000 ALTER TABLE `uom` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-13 12:08:05
