CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `actividad_asignada`
--

DROP TABLE IF EXISTS `actividad_asignada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividad_asignada` (
  `identificador` int NOT NULL,
  `descripcion` varchar(40) NOT NULL,
  PRIMARY KEY (`identificador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad_asignada`
--

LOCK TABLES `actividad_asignada` WRITE;
/*!40000 ALTER TABLE `actividad_asignada` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividad_asignada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_trabajo`
--

DROP TABLE IF EXISTS `base_trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_trabajo` (
  `nombre` varchar(25) NOT NULL,
  `zona` varchar(15) NOT NULL,
  `latitud` varchar(30) NOT NULL,
  `longitud` varchar(30) NOT NULL,
  `id` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_trabajo`
--

LOCK TABLES `base_trabajo` WRITE;
/*!40000 ALTER TABLE `base_trabajo` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_trabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brigadista`
--

DROP TABLE IF EXISTS `brigadista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brigadista` (
  `rut` varchar(12) NOT NULL,
  `nombres` varchar(27) NOT NULL,
  `apellido_paterno` varchar(20) NOT NULL,
  `apellido_materno` varchar(20) NOT NULL,
  `fono` varchar(12) NOT NULL,
  `empresa_codigo` varchar(25) NOT NULL,
  PRIMARY KEY (`rut`),
  KEY `fk_brigadista_empresa1_idx` (`empresa_codigo`),
  CONSTRAINT `fk_brigadista_empresa1` FOREIGN KEY (`empresa_codigo`) REFERENCES `empresa` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brigadista`
--

LOCK TABLES `brigadista` WRITE;
/*!40000 ALTER TABLE `brigadista` DISABLE KEYS */;
/*!40000 ALTER TABLE `brigadista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `codigo` varchar(15) NOT NULL,
  `nombre_empresa` varchar(30) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_brigada`
--

DROP TABLE IF EXISTS `tipo_brigada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_brigada` (
  `id` varchar(25) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `n_personas` tinyint unsigned NOT NULL,
  `capacidad_maxima` tinyint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_brigada`
--

LOCK TABLES `tipo_brigada` WRITE;
/*!40000 ALTER TABLE `tipo_brigada` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_brigada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad_brigada`
--

DROP TABLE IF EXISTS `unidad_brigada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidad_brigada` (
  `id_brigada` varchar(15) NOT NULL,
  `base_trabajo_id` varchar(5) NOT NULL,
  PRIMARY KEY (`id_brigada`),
  KEY `fk_unidad_brigada_base_trabajo1_idx` (`base_trabajo_id`),
  CONSTRAINT `fk_unidad_brigada_base_trabajo1` FOREIGN KEY (`base_trabajo_id`) REFERENCES `base_trabajo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_brigada`
--

LOCK TABLES `unidad_brigada` WRITE;
/*!40000 ALTER TABLE `unidad_brigada` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidad_brigada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad_operativa`
--

DROP TABLE IF EXISTS `unidad_operativa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidad_operativa` (
  `horario_inicio` time NOT NULL,
  `fecha` date NOT NULL,
  `tipo_brigada_id_tipobrigada` varchar(25) NOT NULL,
  `vehiculo_matricula` varchar(10) NOT NULL,
  `actividad_asignada_identificador` int NOT NULL,
  `unidad_brigada_id_brigada` varchar(15) NOT NULL,
  `stock_combustible` int NOT NULL,
  `stock_espuma` int NOT NULL,
  `observaciones` varchar(255) NOT NULL,
  `kit_meteorologico` varchar(2) NOT NULL,
  `motosierra` varchar(2) NOT NULL,
  `motobomba` varchar(2) NOT NULL,
  `id_unidad_operativa` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_unidad_operativa`),
  KEY `fk_unidad_operativa_tipo_brigada1_idx` (`tipo_brigada_id_tipobrigada`),
  KEY `fk_unidad_operativa_vehiculo1_idx` (`vehiculo_matricula`),
  KEY `fk_unidad_operativa_actividad_asignada1_idx` (`actividad_asignada_identificador`),
  KEY `fk_unidad_operativa_unidad_brigada1_idx` (`unidad_brigada_id_brigada`),
  CONSTRAINT `fk_unidad_operativa_actividad_asignada1` FOREIGN KEY (`actividad_asignada_identificador`) REFERENCES `actividad_asignada` (`identificador`),
  CONSTRAINT `fk_unidad_operativa_tipo_brigada1` FOREIGN KEY (`tipo_brigada_id_tipobrigada`) REFERENCES `tipo_brigada` (`id`),
  CONSTRAINT `fk_unidad_operativa_unidad_brigada1` FOREIGN KEY (`unidad_brigada_id_brigada`) REFERENCES `unidad_brigada` (`id_brigada`),
  CONSTRAINT `fk_unidad_operativa_vehiculo1` FOREIGN KEY (`vehiculo_matricula`) REFERENCES `vehiculo` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_operativa`
--

LOCK TABLES `unidad_operativa` WRITE;
/*!40000 ALTER TABLE `unidad_operativa` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidad_operativa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad_operativa_has_brigadista`
--

DROP TABLE IF EXISTS `unidad_operativa_has_brigadista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidad_operativa_has_brigadista` (
  `unidad_operativa_id_unidad_operativa` int NOT NULL,
  `brigadista_rut` varchar(12) NOT NULL,
  `rol` varchar(25) NOT NULL,
  `clave_registro` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`clave_registro`),
  KEY `fk_unidad_operativa_has_brigadista_brigadista1_idx` (`brigadista_rut`),
  KEY `fk_unidad_operativa_has_brigadista_unidad_operativa1_idx` (`unidad_operativa_id_unidad_operativa`),
  CONSTRAINT `fk_unidad_operativa_has_brigadista_brigadista1` FOREIGN KEY (`brigadista_rut`) REFERENCES `brigadista` (`rut`),
  CONSTRAINT `fk_unidad_operativa_has_brigadista_unidad_operativa1` FOREIGN KEY (`unidad_operativa_id_unidad_operativa`) REFERENCES `unidad_operativa` (`id_unidad_operativa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_operativa_has_brigadista`
--

LOCK TABLES `unidad_operativa_has_brigadista` WRITE;
/*!40000 ALTER TABLE `unidad_operativa_has_brigadista` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidad_operativa_has_brigadista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculo` (
  `matricula` varchar(10) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-29 19:06:40
