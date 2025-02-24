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
-- Dumping data for table `brand`
--

/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` (`id`, `name`) VALUES (1,'Benefit'),(3,'Mac'),(2,'Pixi');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;

--
-- Dumping data for table `campaing`
--

/*!40000 ALTER TABLE `campaing` DISABLE KEYS */;
INSERT INTO `campaing` (`id`, `product_id`, `influencer_id`, `image_url`, `image_hover_url`, `video_url`) VALUES
  (1,1,3,'https://res.cloudinary.com/dw57gwzru/image/upload/v1739149174/e4f4d0bf685c688fd72edd841f5c8edc_hwp4bv.jpg','https://res.cloudinary.com/dw57gwzru/image/upload/v1739149582/clamy-lipstick-4027732_1280_t7caw6.jpg','https://res.cloudinary.com/dw57gwzru/video/upload/v1739150995/pinterestdownloader.com-1739142392.931501_pdl7hy.mp4'),
  (2,3,2,'https://res.cloudinary.com/dw57gwzru/image/upload/v1739168553/cb1ba79b67e74f54d8a614a866b69ece_kyfphd.jpg','https://res.cloudinary.com/dw57gwzru/image/upload/v1739168554/987642f66892f5d6f890ac8837a2c8bd_h9ythe.jpg','https://res.cloudinary.com/dw57gwzru/video/upload/v1739167763/pinterestdownloader.com-1739167730.643485_nmsrvb.mp4'),
  (3,12,1,'https://res.cloudinary.com/dw57gwzru/image/upload/v1739169093/8ec234bf259bcfd8a5c8c757444add3b_mznl66.jpg','https://res.cloudinary.com/dw57gwzru/image/upload/v1739178145/1511cae531993f9fd8fa7906fdb1b237_fpjn7b.jpg','https://res.cloudinary.com/dw57gwzru/video/upload/v1739178023/pinterestdownloader.com-1739177996.644996_c4rhgs.mp4');
/*!40000 ALTER TABLE `campaing` ENABLE KEYS */;

--
-- Dumping data for table `category`
--

/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`, `name`, `description`, `img_cover`, `img_hover`) VALUES (1,'FACE','Find the perfect touch for your face','https://res.cloudinary.com/dw57gwzru/image/upload/c_crop,w_800,h_1000/v1737691496/Face-12_rs3jlr.jpg','https://res.cloudinary.com/dw57gwzru/image/upload/v1737691496/Face-13_vx10me.png'),(2,'EYES','Discover the ideal sparkle for your eyes','https://res.cloudinary.com/dw57gwzru/image/upload/v1737694307/Face-14_kwwpqt.jpg','https://res.cloudinary.com/dw57gwzru/image/upload/v1737695124/Eyes-8_cly0qi.png'),(3,'NAILS','Add the perfect polish to your nails','https://res.cloudinary.com/dw57gwzru/image/upload/c_crop,w_500,h_800/v1737697632/Nails-1jpg_irv0n5.jpg','https://res.cloudinary.com/dw57gwzru/image/upload/c_crop,w_370,h_650/v1737749798/NAILS-5_a1jt2y.jpg'),(4,'HAIR','Bring out the best in your hair with our products','https://res.cloudinary.com/dw57gwzru/image/upload/v1737752218/Hair-6jpg_v2cj61.jpg','https://res.cloudinary.com/dw57gwzru/image/upload/v1737604618/oil-1_wxeys4.jpg'),(5,'LIPS','Bring out the ultimate shine for your lips','https://res.cloudinary.com/dw57gwzru/image/upload/v1737072957/nature_lips_fryryi.jpg','https://res.cloudinary.com/dw57gwzru/image/upload/v1737073206/nature_lips-1_ejy6ib.jpg'),(6,'FRAGANCES','Delight in the enchanting scents of our fragrances','https://res.cloudinary.com/dw57gwzru/image/upload/v1737754207/Framgance-4_nmiicb.jpg','https://res.cloudinary.com/dw57gwzru/image/upload/v1737754152/Framgance-2_o79dfp.jpg'),(7,'BEARD','Unleash the bold definition for your beard','https://res.cloudinary.com/dw57gwzru/image/upload/v1737695740/Face-15jpg_ufgybr.jpg','https://res.cloudinary.com/dw57gwzru/image/upload/v1737521290/Barb-2_k22ihd.png'),(8,'TOP-SELLING','Experience the magic of our top-seller','https://res.cloudinary.com/dw57gwzru/image/upload/v1737409754/eyes_-_1_woiguy.jpg','https://res.cloudinary.com/dw57gwzru/image/upload/v1737413081/face_xoemx7.jpg');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

--
-- Dumping data for table `customer`
--

/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`id`, `email`, `password`, `first_name`, `last_name`, `created_at`, `updated_at`) VALUES
  (1,'juan@example.com','contraseña1','Juan','Pérez','2025-02-19 05:03:02','2025-02-19 05:03:02'),
  (2,'maria@example.com','contraseña2','María','Gómez','2025-02-19 05:03:02','2025-02-19 05:03:02'),
  (3,'carlos@example.com','contraseña3','Carlos','López','2025-02-19 05:03:02','2025-02-19 05:03:02'),
  (4,'ana@example.com','contraseña4','Ana','Rodríguez','2025-02-19 05:03:02','2025-02-19 05:03:02'),
  (5,'sofia@example.com','contraseña5','Sofía','Martínez','2025-02-19 05:03:02','2025-02-19 05:03:02'),
  (6,'pedro@example.com','contraseña6','Pedro','Sánchez','2025-02-19 05:03:02','2025-02-19 05:03:02'),
  (7,'luisa@example.com','contraseña7','Luisa','Fernández','2025-02-19 05:03:02','2025-02-19 05:03:02'),
  (8,'javier@example.com','contraseña8','Javier','Díaz','2025-02-19 05:03:02','2025-02-19 05:03:02'),
  (9,'elena@example.com','contraseña9','Elena','Morales','2025-02-19 05:03:02','2025-02-19 05:03:02');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

--
-- Dumping data for table `customer_address`
--

/*!40000 ALTER TABLE `customer_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address` ENABLE KEYS */;

--
-- Dumping data for table `discount_code`
--

/*!40000 ALTER TABLE `discount_code` DISABLE KEYS */;
INSERT INTO `discount_code` (`id`, `code`, `limit_use`, `start_up_date`, `expiration_date`) VALUES (1,'yuya',NULL,NULL,NULL),(2,'mane',NULL,NULL,NULL),(3,'rosymc',NULL,NULL,NULL);
/*!40000 ALTER TABLE `discount_code` ENABLE KEYS */;

--
-- Dumping data for table `influencer`
--

/*!40000 ALTER TABLE `influencer` DISABLE KEYS */;
INSERT INTO `influencer` (`id`, `discount_code_id`, `name`, `email`, `instagram`, `facebook`, `tiktok`, `youtube`, `created_at`, `updated_at`) VALUES (1,1,'Yuya','yuyita@gmail.com','@yuyacst','Yuya','@yuyita','UCJ0V8mY_jSVj9yI6u8g9W_g','2025-02-19 04:53:56','2025-02-19 04:53:56'),(2,2,'Mane Díaz','mane@hotmail.com','@ManeDiaz','Mane Díaz Beauty','@manedz','UCkYg99hW7j2_l79n5c9jHqg','2025-02-19 04:53:56','2025-02-19 04:53:56'),(3,3,'Rosy McMichael','rosy@mac.com','@RosyMcMichael','Rosy McMichael','@rosymcmichael','UC_c9x9p_I_495v689n97j8w','2025-02-19 04:53:56','2025-02-19 04:53:56');
/*!40000 ALTER TABLE `influencer` ENABLE KEYS */;

--
-- Dumping data for table `order`
--

/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` (`id`, `customer_id`, `discount_code_id`, `status_id`, `total_price`, `payment_method_id`, `payment_date`, `updated_at`, `created_at`) VALUES (1,1,NULL,1,150,1,'2024-07-26 10:00:00','2025-02-19 05:14:39','2025-02-19 05:14:39'),(2,2,NULL,2,75.5,2,'2024-07-26 11:30:00','2025-02-19 05:14:39','2025-02-19 05:14:39'),(3,3,NULL,3,200.25,1,'2024-07-26 14:45:00','2025-02-19 05:14:39','2025-02-19 05:14:39'),(4,4,NULL,1,120,2,'2024-07-26 16:15:00','2025-02-19 05:14:39','2025-02-19 05:14:39'),(5,5,NULL,2,90.75,2,'2024-07-27 09:00:00','2025-02-19 05:14:39','2025-02-19 05:14:39'),(6,6,NULL,3,180.5,1,'2024-07-27 12:30:00','2025-02-19 05:14:39','2025-02-19 05:14:39'),(7,7,NULL,1,250,1,'2024-07-27 15:45:00','2025-02-19 05:14:39','2025-02-19 05:14:39'),(8,8,NULL,2,110.25,2,'2024-07-27 18:15:00','2025-02-19 05:14:39','2025-02-19 05:14:39'),(9,9,NULL,3,160.75,1,'2024-07-28 10:30:00','2025-02-19 05:14:39','2025-02-19 05:14:39'),(10,10,NULL,1,135.5,2,'2024-07-28 13:45:00','2025-02-19 05:14:39','2025-02-19 05:14:39');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;

--
-- Dumping data for table `order_detail`
--

/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `qty`, `unity_price`) VALUES (2,1,1,2,15000),(3,1,2,1,13000),(4,1,3,1,18000),(5,2,5,3,22000),(6,2,6,2,25000),(7,3,7,1,30000),(8,3,8,1,45000),(9,3,9,2,28000),(10,3,10,1,60000),(11,4,11,4,35000),(12,4,12,2,20000),(13,5,1,1,15000),(14,5,2,2,13000),(15,5,3,1,18000),(16,5,4,1,20000),(17,6,5,2,22000),(18,6,6,3,25000),(19,6,7,1,30000),(20,7,8,2,45000),(21,7,9,1,28000),(22,8,10,1,60000),(23,8,11,3,35000),(24,8,12,1,20000),(25,8,1,1,15000),(26,9,2,2,13000),(27,9,3,1,18000),(28,10,4,1,20000),(29,10,5,2,22000),(30,10,6,1,25000),(31,10,7,1,30000),(32,10,8,1,45000);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;

--
-- Dumping data for table `order_status`
--

/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` (`id`, `description`) VALUES (4,'CANCELED'),(5,'COMPLETED'),(3,'DELIVERED'),(1,'PENDING FOR PAYMENT'),(2,'SHIPPED');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;

--
-- Dumping data for table `payment_method`
--

/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
INSERT INTO `payment_method` (`id`, `name`) VALUES (1,'CASH'),(2,'CREDIT CARD');
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id`, `brand_id`, `name`, `description`, `stock`, `price`, `created_at`, `updated_at`) VALUES
(1,1,'Intense Lipstick','This is the most intense lipstick',10,15000,'2025-02-19 04:39:25','2025-02-19 04:39:25'),
(2,1,'Eye pencil','Defines eyes with smooth, precise lines',2,13000,'2025-02-19 04:39:25','2025-02-19 04:39:25'),
(3,1,'Beard Oil Classic','A nourishing oil for a soft and shiny beard',60,18000,'2025-02-19 04:39:25','2025-02-19 04:39:25'),
(4,1,'Beard Balm Deluxe','Style and moisturize your beard with ease',40,20000,'2025-02-19 04:39:25','2025-02-19 04:39:25'),
(5,2,'Hair Wax Matte','Create a strong hold with a natural matte finish',70,22000,'2025-02-19 04:39:25','2025-02-19 04:39:25'),
(6,2,'Volumizing Shampoo','Adds volume and shine to your hair',80,25000,'2025-02-19 04:39:25','2025-02-19 04:39:25'),
(7,1,'Hydrating Face Cream','Keeps your skin soft and hydrated all day',90,30000,'2025-02-19 04:39:25','2025-02-19 04:39:25'),
(8,2,'Anti-aging Serum','Reduces wrinkles and rejuvenates the skin',50,45000,'2025-02-19 04:39:25','2025-02-19 04:39:25'),
(9,3,'Refreshing Eye Gel','Eliminates puffiness and dark circles',75,28000,'2025-02-19 04:39:25','2025-02-19 04:39:25'),
(10,3,'Luxury Perfume','A long-lasting fragrance for special occasions',40,60000,'2025-02-19 04:39:25','2025-02-19 04:39:25'),
(11,2,'Daily Sunscreen','Protects your skin from harmful UV rays',65,35000,'2025-02-19 04:39:25','2025-02-19 04:39:25'),
(12,1,'Eyeshadow','Enhances eyelids with colorful, pigments',98,20000,'2025-02-19 04:39:25','2025-02-19 04:39:25');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

--
-- Dumping data for table `product_category`
--

/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` (`product_id`, `category_id`) VALUES
  (1,5),
  (2,5),
  (3,7),
  (4,7),
  (5,4),
  (6,4),
  (7,1),
  (8,1),
  (9,2),
  (10,6),
  (11,1),
  (12,1);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;

--
-- Dumping data for table `product_image`
--

/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` (`id`, `product_id`, `url`) VALUES
  (1,1,'https://res.cloudinary.com/dw57gwzru/image/upload/v1737677093/download_zeflik.jpg'),
  (2,2,'https://res.cloudinary.com/dw57gwzru/image/upload/v1737608807/Eye-5_hn06eb.png'),
  (3,3,'https://res.cloudinary.com/dw57gwzru/image/upload/c_crop,w_400,h_500/v1737520275/Bearb_jz223v.jpg'),
  (4,4,'https://res.cloudinary.com/dw57gwzru/image/upload/c_crop,w_400,h_570/v1737555922/Barb-3_edfbyr.png'),
  (5,5,'https://res.cloudinary.com/dw57gwzru/image/upload/v1737521920/Hair-2_ot3bff.jpg'),
  (6,6,'https://res.cloudinary.com/dw57gwzru/image/upload/c_crop,w_1000,h_1000/v1737521402/hair_ch9u4y.png'),
  (7,7,'https://res.cloudinary.com/dw57gwzru/image/upload/c_crop,w_400,h_389/v1737413112/face_wltg2c.jpg'),
  (8,8,'https://res.cloudinary.com/dw57gwzru/image/upload/v1737556711/Face-6_wzthdm.png'),
  (9,9,'https://res.cloudinary.com/dw57gwzru/image/upload/c_crop,w_520,h_550/v1737606579/Face-10_u5rht5.png'),
  (10,10,'https://res.cloudinary.com/dw57gwzru/image/upload/v1737607466/Perf-3_bnzqah.jpg'),
  (11,11,'https://res.cloudinary.com/dw57gwzru/image/upload/c_crop,w_550,h_700/v1737607614/Face-11_irwgpd.png'),
  (12,12,'https://res.cloudinary.com/dw57gwzru/image/upload/v1737409765/eyes_-_2_hdlzpo.jpg');
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;

--
-- Dumping data for table `shipping`
--

/*!40000 ALTER TABLE `shipping` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-21 13:00:57
