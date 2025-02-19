CREATE DATABASE  IF NOT EXISTS `aura_db` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `aura_db`;
-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: aura_db
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Benefit'),(3,'Mac'),(2,'Pixi');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaing`
--

DROP TABLE IF EXISTS `campaing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `influencer_id` int NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `image_hover_url` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `campaing_product_FK_idx` (`product_id`),
  KEY `campaing_influencer_FK_idx` (`influencer_id`),
  CONSTRAINT `campaing_influencer_FK` FOREIGN KEY (`influencer_id`) REFERENCES `influencer` (`id`),
  CONSTRAINT `campaing_product_FK` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaing`
--

LOCK TABLES `campaing` WRITE;
/*!40000 ALTER TABLE `campaing` DISABLE KEYS */;
INSERT INTO `campaing` VALUES (1,1,3,'https://res.cloudinary.com/dw57gwzru/image/upload/v1739149174/e4f4d0bf685c688fd72edd841f5c8edc_hwp4bv.jpg','https://res.cloudinary.com/dw57gwzru/image/upload/v1739149582/clamy-lipstick-4027732_1280_t7caw6.jpg','https://res.cloudinary.com/dw57gwzru/video/upload/v1739150995/pinterestdownloader.com-1739142392.931501_pdl7hy.mp4'),(2,3,2,'https://res.cloudinary.com/dw57gwzru/image/upload/v1739168553/cb1ba79b67e74f54d8a614a866b69ece_kyfphd.jpg','https://res.cloudinary.com/dw57gwzru/image/upload/v1739168554/987642f66892f5d6f890ac8837a2c8bd_h9ythe.jpg','https://res.cloudinary.com/dw57gwzru/video/upload/v1739167763/pinterestdownloader.com-1739167730.643485_nmsrvb.mp4'),(3,12,1,'https://res.cloudinary.com/dw57gwzru/image/upload/v1739169093/8ec234bf259bcfd8a5c8c757444add3b_mznl66.jpg','https://res.cloudinary.com/dw57gwzru/image/upload/v1739178145/1511cae531993f9fd8fa7906fdb1b237_fpjn7b.jpg','https://res.cloudinary.com/dw57gwzru/video/upload/v1739178023/pinterestdownloader.com-1739177996.644996_c4rhgs.mp4');
/*!40000 ALTER TABLE `campaing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `img_cover` varchar(255) DEFAULT NULL,
  `img_hover` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'FACE','Find the perfect touch for your face','https://res.cloudinary.com/dw57gwzru/image/upload/c_crop,w_800,h_1000/v1737691496/Face-12_rs3jlr.jpg','https://res.cloudinary.com/dw57gwzru/image/upload/v1737691496/Face-13_vx10me.png'),(2,'EYES','Discover the ideal sparkle for your eyes','https://res.cloudinary.com/dw57gwzru/image/upload/v1737694307/Face-14_kwwpqt.jpg','https://res.cloudinary.com/dw57gwzru/image/upload/v1737695124/Eyes-8_cly0qi.png'),(3,'NAILS','Add the perfect polish to your nails','https://res.cloudinary.com/dw57gwzru/image/upload/c_crop,w_500,h_800/v1737697632/Nails-1jpg_irv0n5.jpg','https://res.cloudinary.com/dw57gwzru/image/upload/c_crop,w_370,h_650/v1737749798/NAILS-5_a1jt2y.jpg'),(4,'HAIR','Bring out the best in your hair with our products','https://res.cloudinary.com/dw57gwzru/image/upload/v1737752218/Hair-6jpg_v2cj61.jpg','https://res.cloudinary.com/dw57gwzru/image/upload/v1737604618/oil-1_wxeys4.jpg'),(5,'LIPS','Bring out the ultimate shine for your lips','https://res.cloudinary.com/dw57gwzru/image/upload/v1737072957/nature_lips_fryryi.jpg','https://res.cloudinary.com/dw57gwzru/image/upload/v1737073206/nature_lips-1_ejy6ib.jpg'),(6,'FRAGANCES','Delight in the enchanting scents of our fragrances','https://res.cloudinary.com/dw57gwzru/image/upload/v1737754207/Framgance-4_nmiicb.jpg','https://res.cloudinary.com/dw57gwzru/image/upload/v1737754152/Framgance-2_o79dfp.jpg'),(7,'BEARD','Unleash the bold definition for your beard','https://res.cloudinary.com/dw57gwzru/image/upload/v1737695740/Face-15jpg_ufgybr.jpg','https://res.cloudinary.com/dw57gwzru/image/upload/v1737521290/Barb-2_k22ihd.png'),(8,'TOP-SELLING','Experience the magic of our top-seller','https://res.cloudinary.com/dw57gwzru/image/upload/v1737409754/eyes_-_1_woiguy.jpg','https://res.cloudinary.com/dw57gwzru/image/upload/v1737413081/face_xoemx7.jpg');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'usuario1@example.com','contraseña1','Juan','Pérez','2025-02-19 05:03:02','2025-02-19 05:03:02'),(2,'usuario2@example.com','contraseña2','María','Gómez','2025-02-19 05:03:02','2025-02-19 05:03:02'),(3,'usuario3@example.com','contraseña3','Carlos','López','2025-02-19 05:03:02','2025-02-19 05:03:02'),(4,'usuario4@example.com','contraseña4','Ana','Rodríguez','2025-02-19 05:03:02','2025-02-19 05:03:02'),(5,'usuario5@example.com','contraseña5','Sofía','Martínez','2025-02-19 05:03:02','2025-02-19 05:03:02'),(6,'usuario6@example.com','contraseña6','Pedro','Sánchez','2025-02-19 05:03:02','2025-02-19 05:03:02'),(7,'usuario7@example.com','contraseña7','Luisa','Fernández','2025-02-19 05:03:02','2025-02-19 05:03:02'),(8,'usuario8@example.com','contraseña8','Javier','Díaz','2025-02-19 05:03:02','2025-02-19 05:03:02'),(9,'usuario9@example.com','contraseña9','Elena','Morales','2025-02-19 05:03:02','2025-02-19 05:03:02'),(10,'usuario10@example.com','contraseña10','Miguel','Álvarez','2025-02-19 05:03:02','2025-02-19 05:03:02');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `country` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `zip_code` int DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `customer_address_customer_FK_idx` (`customer_id`),
  CONSTRAINT `customer_address_customer_FK` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address`
--

LOCK TABLES `customer_address` WRITE;
/*!40000 ALTER TABLE `customer_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_code`
--

DROP TABLE IF EXISTS `discount_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_code` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `limit_use` int DEFAULT NULL,
  `start_up_date` timestamp NULL DEFAULT NULL,
  `expiration_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_code`
--

LOCK TABLES `discount_code` WRITE;
/*!40000 ALTER TABLE `discount_code` DISABLE KEYS */;
INSERT INTO `discount_code` VALUES (1,'yuya',NULL,NULL,NULL),(2,'mane',NULL,NULL,NULL),(3,'rosymc',NULL,NULL,NULL);
/*!40000 ALTER TABLE `discount_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `influencer`
--

DROP TABLE IF EXISTS `influencer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `influencer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `discount_code_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `instagram` varchar(45) NOT NULL,
  `facebook` varchar(45) DEFAULT NULL,
  `tiktok` varchar(45) DEFAULT NULL,
  `youtube` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `influencer_discount_code_FK_idx` (`discount_code_id`),
  CONSTRAINT `influencer_discount_code_FK` FOREIGN KEY (`discount_code_id`) REFERENCES `discount_code` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `influencer`
--

LOCK TABLES `influencer` WRITE;
/*!40000 ALTER TABLE `influencer` DISABLE KEYS */;
INSERT INTO `influencer` VALUES (1,1,'Yuya','yuyita@gmail.com','@yuyacst','Yuya','@yuyita','UCJ0V8mY_jSVj9yI6u8g9W_g','2025-02-19 04:53:56','2025-02-19 04:53:56'),(2,2,'Mane Díaz','mane@hotmail.com','@ManeDiaz','Mane Díaz Beauty','@manedz','UCkYg99hW7j2_l79n5c9jHqg','2025-02-19 04:53:56','2025-02-19 04:53:56'),(3,3,'Rosy McMichael','rosy@mac.com','@RosyMcMichael','Rosy McMichael','@rosymcmichael','UC_c9x9p_I_495v689n97j8w','2025-02-19 04:53:56','2025-02-19 04:53:56');
/*!40000 ALTER TABLE `influencer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `discount_code_id` int DEFAULT NULL,
  `status_id` int NOT NULL,
  `total_price` float NOT NULL,
  `payment_method_id` int NOT NULL,
  `payment_date` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_discount_codeFK_idx` (`discount_code_id`),
  KEY `order_payment_FK_idx` (`payment_method_id`),
  KEY `order_status_FK_idx` (`status_id`),
  KEY `order_customer_FK_idx` (`customer_id`),
  CONSTRAINT `order_customer_FK` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `order_discount_code_FK` FOREIGN KEY (`discount_code_id`) REFERENCES `discount_code` (`id`),
  CONSTRAINT `order_payment_FK` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`),
  CONSTRAINT `order_status_FK` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,NULL,1,150,1,'2024-07-26 10:00:00','2025-02-19 05:14:39','2025-02-19 05:14:39'),(2,2,NULL,2,75.5,2,'2024-07-26 11:30:00','2025-02-19 05:14:39','2025-02-19 05:14:39'),(3,3,NULL,3,200.25,1,'2024-07-26 14:45:00','2025-02-19 05:14:39','2025-02-19 05:14:39'),(4,4,NULL,1,120,2,'2024-07-26 16:15:00','2025-02-19 05:14:39','2025-02-19 05:14:39'),(5,5,NULL,2,90.75,2,'2024-07-27 09:00:00','2025-02-19 05:14:39','2025-02-19 05:14:39'),(6,6,NULL,3,180.5,1,'2024-07-27 12:30:00','2025-02-19 05:14:39','2025-02-19 05:14:39'),(7,7,NULL,1,250,1,'2024-07-27 15:45:00','2025-02-19 05:14:39','2025-02-19 05:14:39'),(8,8,NULL,2,110.25,2,'2024-07-27 18:15:00','2025-02-19 05:14:39','2025-02-19 05:14:39'),(9,9,NULL,3,160.75,1,'2024-07-28 10:30:00','2025-02-19 05:14:39','2025-02-19 05:14:39'),(10,10,NULL,1,135.5,2,'2024-07-28 13:45:00','2025-02-19 05:14:39','2025-02-19 05:14:39');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `qty` int unsigned NOT NULL,
  `unity_price` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_detail_product_FK_idx` (`product_id`),
  KEY `order_detail_order_FK_idx` (`order_id`),
  CONSTRAINT `order_detail_order_FK` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `order_detail_product_FK` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (2,1,1,2,15000),(3,1,2,1,13000),(4,1,3,1,18000),(5,2,5,3,22000),(6,2,6,2,25000),(7,3,7,1,30000),(8,3,8,1,45000),(9,3,9,2,28000),(10,3,10,1,60000),(11,4,11,4,35000),(12,4,12,2,20000),(13,5,1,1,15000),(14,5,2,2,13000),(15,5,3,1,18000),(16,5,4,1,20000),(17,6,5,2,22000),(18,6,6,3,25000),(19,6,7,1,30000),(20,7,8,2,45000),(21,7,9,1,28000),(22,8,10,1,60000),(23,8,11,3,35000),(24,8,12,1,20000),(25,8,1,1,15000),(26,9,2,2,13000),(27,9,3,1,18000),(28,10,4,1,20000),(29,10,5,2,22000),(30,10,6,1,25000),(31,10,7,1,30000),(32,10,8,1,45000);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (4,'CANCELED'),(5,'COMPLETED'),(3,'DELIVERED'),(1,'PENDING FOR PAYMENT'),(2,'SHIPPED');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_method` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
INSERT INTO `payment_method` VALUES (1,'CASH'),(2,'CREDIT CARD');
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL,
  `brand_id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `stock` int NOT NULL,
  `price` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`name`),
  KEY `product_brand_FK_idx` (`brand_id`),
  CONSTRAINT `product_brand_FK` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'Intense Lipstick','This is the most intense lipstick',10,15000,'2025-02-19 04:39:25','2025-02-19 04:39:25'),(2,1,'Eye pencil','Defines eyes with smooth, precise lines',2,13000,'2025-02-19 04:39:25','2025-02-19 04:39:25'),(3,1,'Beard Oil Classic','A nourishing oil for a soft and shiny beard',60,18000,'2025-02-19 04:39:25','2025-02-19 04:39:25'),(4,1,'Beard Balm Deluxe','Style and moisturize your beard with ease',40,20000,'2025-02-19 04:39:25','2025-02-19 04:39:25'),(5,2,'Hair Wax Matte','Create a strong hold with a natural matte finish',70,22000,'2025-02-19 04:39:25','2025-02-19 04:39:25'),(6,2,'Volumizing Shampoo','Adds volume and shine to your hair',80,25000,'2025-02-19 04:39:25','2025-02-19 04:39:25'),(7,1,'Hydrating Face Cream','Keeps your skin soft and hydrated all day',90,30000,'2025-02-19 04:39:25','2025-02-19 04:39:25'),(8,2,'Anti-aging Serum','Reduces wrinkles and rejuvenates the skin',50,45000,'2025-02-19 04:39:25','2025-02-19 04:39:25'),(9,3,'Refreshing Eye Gel','Eliminates puffiness and dark circles',75,28000,'2025-02-19 04:39:25','2025-02-19 04:39:25'),(10,3,'Luxury Perfume','A long-lasting fragrance for special occasions',40,60000,'2025-02-19 04:39:25','2025-02-19 04:39:25'),(11,2,'Daily Sunscreen','Protects your skin from harmful UV rays',65,35000,'2025-02-19 04:39:25','2025-02-19 04:39:25'),(12,1,'Eyeshadow','Enhances eyelids with colorful, pigments',98,20000,'2025-02-19 04:39:25','2025-02-19 04:39:25');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_category_category_UK` (`product_id`,`category_id`),
  KEY `product_category_product_FK_idx` (`product_id`),
  KEY `product_category_category_FK_idx` (`category_id`),
  CONSTRAINT `product_category_category_FK` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `product_category_product_FK` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,1,5),(2,2,5),(3,3,7),(4,4,7),(5,5,4),(6,6,4),(7,7,1),(8,8,1),(9,9,2),(10,10,6),(11,11,1),(12,12,1);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_image_FK_idx` (`product_id`),
  CONSTRAINT `product_image_FK` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (1,1,'https://res.cloudinary.com/dw57gwzru/image/upload/v1737677093/download_zeflik.jpg'),(2,2,'https://res.cloudinary.com/dw57gwzru/image/upload/v1737608807/Eye-5_hn06eb.png'),(3,3,'https://res.cloudinary.com/dw57gwzru/image/upload/c_crop,w_400,h_500/v1737520275/Bearb_jz223v.jpg'),(4,4,'https://res.cloudinary.com/dw57gwzru/image/upload/c_crop,w_400,h_570/v1737555922/Barb-3_edfbyr.png'),(5,5,'https://res.cloudinary.com/dw57gwzru/image/upload/v1737521920/Hair-2_ot3bff.jpg'),(6,6,'https://res.cloudinary.com/dw57gwzru/image/upload/c_crop,w_1000,h_1000/v1737521402/hair_ch9u4y.png'),(7,7,'https://res.cloudinary.com/dw57gwzru/image/upload/c_crop,w_400,h_389/v1737413112/face_wltg2c.jpg'),(8,8,'https://res.cloudinary.com/dw57gwzru/image/upload/v1737556711/Face-6_wzthdm.png'),(9,9,'https://res.cloudinary.com/dw57gwzru/image/upload/c_crop,w_520,h_550/v1737606579/Face-10_u5rht5.png'),(10,10,'https://res.cloudinary.com/dw57gwzru/image/upload/v1737607466/Perf-3_bnzqah.jpg'),(11,11,'https://res.cloudinary.com/dw57gwzru/image/upload/c_crop,w_550,h_700/v1737607614/Face-11_irwgpd.png'),(12,12,'https://res.cloudinary.com/dw57gwzru/image/upload/v1737409765/eyes_-_2_hdlzpo.jpg');
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping`
--

DROP TABLE IF EXISTS `shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_address_id` int NOT NULL,
  `order_id` int NOT NULL,
  `shipping_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shipping_customer_order_UK` (`customer_address_id`,`order_id`),
  KEY `shipping_order_FK_idx` (`order_id`),
  CONSTRAINT `shipping_customer_address_FK` FOREIGN KEY (`customer_address_id`) REFERENCES `customer_address` (`id`),
  CONSTRAINT `shipping_order_FK` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping`
--

LOCK TABLES `shipping` WRITE;
/*!40000 ALTER TABLE `shipping` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-19  0:24:55
