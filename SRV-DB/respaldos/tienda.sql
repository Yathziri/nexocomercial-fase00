/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: tienda
-- ------------------------------------------------------
-- Server version	11.8.6-MariaDB-5ubuntu0.1 from Ubuntu

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `tipo` enum('entrada','salida') NOT NULL,
  `cantidad` int(11) NOT NULL CHECK (`cantidad` > 0),
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `producto_id` (`producto_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  CONSTRAINT `movimientos_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `movimientos` WRITE;
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
INSERT INTO `movimientos` VALUES
(1,1,3,'entrada',5,'2026-11-06 17:40:18'),
(2,1,2,'salida',1,'2026-11-06 17:40:18'),
(3,2,3,'entrada',3,'2026-11-06 17:40:18'),
(4,3,3,'entrada',20,'2026-11-06 17:40:18'),
(5,3,2,'salida',2,'2026-11-06 17:40:18'),
(6,4,3,'entrada',10,'2026-11-06 17:40:18'),
(7,5,3,'entrada',15,'2026-11-06 17:40:18'),
(8,6,2,'salida',3,'2026-11-06 17:40:18'),
(9,7,3,'entrada',5,'2026-11-06 17:40:18'),
(10,7,2,'salida',1,'2026-11-06 17:40:18'),
(11,8,3,'entrada',4,'2026-11-06 17:40:18'),
(12,9,2,'salida',2,'2026-11-06 17:40:18'),
(13,10,2,'salida',1,'2026-11-06 17:40:18'),
(14,11,3,'entrada',2,'2026-11-06 17:40:18'),
(15,12,3,'entrada',6,'2026-11-06 17:40:18'),
(16,13,2,'salida',1,'2026-11-06 17:40:18'),
(17,14,3,'entrada',10,'2026-11-06 17:40:18'),
(18,15,3,'entrada',8,'2026-11-06 17:40:18'),
(19,16,3,'entrada',12,'2026-11-06 17:40:18'),
(20,17,2,'salida',5,'2026-11-06 17:40:18'),
(21,18,2,'salida',4,'2026-11-06 17:40:18'),
(22,19,3,'entrada',6,'2026-11-06 17:40:18'),
(23,20,3,'entrada',10,'2026-11-06 17:40:18'),
(24,1,2,'salida',1,'2026-11-06 17:40:18'),
(25,3,2,'salida',1,'2026-11-06 17:40:18'),
(26,5,2,'salida',2,'2026-11-06 17:40:18'),
(27,9,2,'salida',1,'2026-11-06 17:40:18'),
(28,14,2,'salida',2,'2026-11-06 17:40:18'),
(29,16,2,'salida',1,'2026-11-06 17:40:18'),
(30,20,2,'salida',3,'2026-11-06 17:40:18');
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL CHECK (`precio` > 0),
  `stock` int(11) DEFAULT 0 CHECK (`stock` >= 0),
  PRIMARY KEY (`id`),
  UNIQUE KEY `sku` (`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES
(1,'LAP-001','Laptop HP 15',12500.00,10),
(2,'LAP-002','Laptop Lenovo IdeaPad 3',9800.00,8),
(3,'MOU-001','Mouse Logitech M185',350.00,50),
(4,'MOU-002','Mouse Inalambrico HP',420.00,40),
(5,'TEC-001','Teclado Mecanico RGB',850.00,30),
(6,'TEC-002','Teclado Logitech K120',280.00,45),
(7,'MON-001','Monitor 24 LG',3200.00,15),
(8,'MON-002','Monitor 27 Samsung',4500.00,10),
(9,'AUD-001','Audifonos Sony WH-CH520',1200.00,25),
(10,'AUD-002','Audifonos JBL Tune 510',950.00,20),
(11,'IMP-001','Impresora HP LaserJet',2800.00,7),
(12,'TAB-001','Tablet Samsung A8',4200.00,12),
(13,'CEL-001','Celular Xiaomi Redmi',3600.00,18),
(14,'DIS-001','Disco SSD 480GB',950.00,35),
(15,'DIS-002','Disco Duro 1TB',1100.00,28),
(16,'MEM-001','Memoria RAM 8GB',650.00,40),
(17,'CAB-001','Cable HDMI 2m',150.00,100),
(18,'CAB-002','Cable USB-C',180.00,80),
(19,'CAR-001','Cargador Laptop 65W',450.00,22),
(20,'SOP-001','Soporte Laptop',300.00,30);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `rol` enum('admin','ventas','almacen') NOT NULL,
  `activo` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES
(1,'ana.admin','Ana Lopez','admin',1),
(2,'juan.ventas','Juan Perez','ventas',1),
(3,'maria.almacen','Maria Garcia','almacen',1),
(4,'carlos.ventas','Carlos Ruiz','ventas',1),
(5,'laura.almacen','Laura Mendez','almacen',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-11-07  4:11:33
