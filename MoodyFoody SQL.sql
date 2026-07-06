-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: food_delivery_db
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `MenuID` int NOT NULL AUTO_INCREMENT,
  `RestaurantID` int DEFAULT NULL,
  `ItemName` varchar(150) NOT NULL,
  `Description` text,
  `Price` decimal(10,2) DEFAULT NULL,
  `IsAvailable` tinyint(1) DEFAULT '1',
  `ImagePath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MenuID`),
  KEY `RestaurantID` (`RestaurantID`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,'Chicken Biryani','Signature Chicken Dum Biryani',299.00,1,'images/chickenbiryani.jpg'),(2,1,'Mutton Biryani','Authentic Mutton Biryani',349.00,1,'images/muttonbiryani.jpg'),(3,1,'Chicken Fry Piece Biryani','Andhra Style Fry Piece Biryani',329.00,1,'images/frypiecebiryani.jpg'),(4,1,'Guntur Chicken','Spicy Andhra Chicken',249.00,1,'images/gunturchicken.jpg'),(5,1,'Andhra Meals','Traditional Andhra Meals',199.00,1,'images/andhrameals.jpg'),(6,2,'Chicken Shawarma','Arabian Style Shawarma',179.00,1,'images/shawarma.jpg'),(7,2,'Chicken Biryani','Empire Special Biryani',269.00,1,'images/empirebiryani.jpg'),(8,2,'Butter Chicken','Creamy Butter Chicken',289.00,1,'images/butterchicken.jpg'),(9,2,'Chicken Kabab','Grilled Chicken Kabab',229.00,1,'images/kabab.jpg'),(10,2,'Rumali Roti','Soft Rumali Roti',39.00,1,'images/rumaliroti.jpg'),(11,3,'Benne Masala Dosa','Famous Butter Masala Dosa',120.00,1,'images/bennedosa.jpg'),(12,3,'Plain Dosa','Crispy Plain Dosa',80.00,1,'images/plaindosa.jpg'),(13,3,'Idli Vada','Idli with Vada',70.00,1,'images/idlivada.jpg'),(14,3,'Khara Bath','Traditional Khara Bath',90.00,1,'images/kharabath.jpg'),(15,3,'Filter Coffee','South Indian Filter Coffee',40.00,1,'images/filtercoffee.jpg'),(16,4,'Benne Masala Dosa','CTR Special Benne Dosa',130.00,1,'images/ctrdosa.jpg'),(17,4,'Vada','Crispy Vada',50.00,1,'images/vada.jpg'),(18,4,'Kesari Bath','Sweet Kesari Bath',80.00,1,'images/kesaribath.jpg'),(19,4,'Idli','Soft Idli',60.00,1,'images/idli.jpg'),(20,4,'Coffee','Fresh Filter Coffee',35.00,1,'images/coffee.jpg'),(21,5,'Fish Curry','Mangalorean Fish Curry',399.00,1,'images/fishcurry.jpg'),(22,5,'Prawn Ghee Roast','Coastal Special Prawns',449.00,1,'images/prawngheeroast.jpg'),(23,5,'Neer Dosa','Soft Neer Dosa',120.00,1,'images/neerdosa.jpg'),(24,5,'Chicken Sukka','Mangalore Chicken Sukka',349.00,1,'images/chickensukka.jpg'),(25,5,'Seafood Platter','Mixed Seafood Platter',699.00,1,'images/seafoodplatter.jpg'),(26,6,'Chicken Palav','Famous Gundu Palav',249.00,1,'images/chickenpalav.jpg'),(27,6,'Mutton Palav','Mutton Palav Special',299.00,1,'images/muttonpalav.jpg'),(28,6,'Chicken Fry','Spicy Chicken Fry',219.00,1,'images/chickenfry.jpg'),(29,6,'Kheema Balls','Traditional Kheema Balls',189.00,1,'images/kheemaballs.jpg'),(30,6,'Boiled Egg','Protein Rich Egg',20.00,1,'images/egg.jpg'),(31,7,'Andhra Meals','Unlimited Andhra Meals',249.00,1,'images/nagarjunameals.jpg'),(32,7,'Chicken Curry','Spicy Andhra Chicken Curry',289.00,1,'images/andhrachicken.jpg'),(33,7,'Mutton Curry','Traditional Andhra Mutton Curry',349.00,1,'images/andhramutton.jpg'),(34,7,'Fish Fry','Andhra Fish Fry',279.00,1,'images/fishfry.jpg'),(35,7,'Curd Rice','Fresh Curd Rice',99.00,1,'images/curdrice.jpg'),(36,8,'Chicken Biryani','Nandhana Special Biryani',299.00,1,'images/nandhanabiryani.jpg'),(37,8,'Mutton Biryani','Rich Mutton Biryani',349.00,1,'images/nandhanamutton.jpg'),(38,8,'Chicken 65','Crispy Chicken 65',219.00,1,'images/chicken65.jpg'),(39,8,'Apollo Fish','Andhra Apollo Fish',289.00,1,'images/apollofish.jpg'),(40,8,'Veg Meals','South Indian Meals',189.00,1,'images/vegmeals.jpg'),(41,9,'Ghee Podi Idli','Signature Ghee Podi Idli',120.00,1,'images/podiidli.jpg'),(42,9,'Masala Dosa','Classic Masala Dosa',110.00,1,'images/masaladosa.jpg'),(43,9,'Rava Idli','Soft Rava Idli',90.00,1,'images/ravaidli.jpg'),(44,9,'Bisibele Bath','Traditional Bisibele Bath',120.00,1,'images/bisibelebath.jpg'),(45,9,'Filter Coffee','Premium Filter Coffee',50.00,1,'images/filtercoffee.jpg'),(46,10,'Classic Burger','Chicken Burger',229.00,1,'images/burger.jpg'),(47,10,'Cheese Burger','Double Cheese Burger',259.00,1,'images/cheeseburger.jpg'),(48,10,'Peri Peri Fries','Spicy Fries',149.00,1,'images/fries.jpg'),(49,10,'White Sauce Pasta','Creamy Pasta',249.00,1,'images/pasta.jpg'),(50,10,'Chocolate Shake','Rich Chocolate Shake',179.00,1,'images/chocolateshake.jpg');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `OrderItemID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int DEFAULT NULL,
  `MenuID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `ItemTotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`OrderItemID`),
  KEY `OrderID` (`OrderID`),
  KEY `MenuID` (`MenuID`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `ordertable` (`OrderID`) ON DELETE CASCADE,
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`MenuID`) REFERENCES `menu` (`MenuID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (2,1,33,1,349.00),(12,2,45,1,50.00),(14,3,30,1,20.00),(15,4,16,1,130.00),(16,5,6,1,179.00),(17,6,38,1,219.00),(18,7,47,1,259.00),(19,8,7,1,269.00),(20,9,6,1,179.00),(21,10,29,1,189.00),(22,11,1,1,299.00);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordertable`
--

DROP TABLE IF EXISTS `ordertable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordertable` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `RestaurantID` int DEFAULT NULL,
  `OrderDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `TotalAmount` decimal(10,2) DEFAULT NULL,
  `Status` enum('PLACED','CONFIRMED','PREPARING','OUT_FOR_DELIVERY','DELIVERED','CANCELLED') DEFAULT NULL,
  `PaymentMethod` enum('COD','UPI','CARD') DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `UserID` (`UserID`),
  KEY `RestaurantID` (`RestaurantID`),
  CONSTRAINT `ordertable_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `ordertable_ibfk_2` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordertable`
--

LOCK TABLES `ordertable` WRITE;
/*!40000 ALTER TABLE `ordertable` DISABLE KEYS */;
INSERT INTO `ordertable` VALUES (1,2,7,'2026-07-01 14:16:20',349.00,'PLACED','UPI'),(2,3,9,'2026-07-01 18:40:50',50.00,'PLACED','UPI'),(3,3,6,'2026-07-01 18:56:17',20.00,'PLACED','COD'),(4,3,4,'2026-07-01 18:58:41',130.00,'PLACED','COD'),(5,3,2,'2026-07-01 18:59:20',179.00,'PLACED','CARD'),(6,2,8,'2026-07-01 23:11:19',219.00,'PLACED','CARD'),(7,4,10,'2026-07-02 00:27:36',259.00,'PLACED','COD'),(8,4,2,'2026-07-03 22:06:38',269.00,'PLACED','COD'),(9,4,2,'2026-07-04 02:00:03',179.00,'PLACED','COD'),(10,3,6,'2026-07-04 20:08:13',189.00,'PLACED','COD'),(11,2,1,'2026-07-04 23:55:55',299.00,'PLACED','COD');
/*!40000 ALTER TABLE `ordertable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `RestaurantID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(150) NOT NULL,
  `CuisineType` varchar(100) DEFAULT NULL,
  `DeliveryTime` int DEFAULT NULL,
  `Address` text,
  `Rating` decimal(2,1) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT '1',
  `ImagePath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RestaurantID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'Meghana Foods','Biryani',30,'Koramangala, Bangalore',4.5,1,'images/meghana.jpg'),(2,'Empire Restaurant','North Indian & Non Veg',25,'Jayanagar, Bangalore',4.3,1,'images/empire.jpg'),(3,'Vidyarthi Bhavan','South Indian',20,'Basavanagudi, Bangalore',4.7,1,'images/vidyarthibhavan.jpg'),(4,'CTR','South Indian',25,'Malleshwaram, Bangalore',4.6,1,'images/ctr.jpg'),(5,'Karavalli','Coastal',35,'Residency Road, Bangalore',4.8,1,'images/karavalli.jpg'),(6,'SGS Gundu Palav','Karnataka Non Veg',20,'Balepet, Bangalore',4.4,1,'images/sgs.jpg'),(7,'Nagarjuna','Andhra Cuisine',30,'Residency Road, Bangalore',4.5,1,'images/nagarjuna.jpg'),(8,'Nandhana Palace','Andhra Biryani',28,'Indiranagar, Bangalore',4.4,1,'images/nandhana.jpg'),(9,'The Rameshwaram Cafe','South Indian',22,'JP Nagar, Bangalore',4.8,1,'images/rameshwaram.jpg'),(10,'Truffles','Burgers & Cafe',25,'Koramangala, Bangalore',4.7,1,'images/truffles.jpg');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Address` text,
  `Role` enum('CUSTOMER','ADMIN') DEFAULT 'CUSTOMER',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `LastLoginDate` datetime DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Sam','12345','sam@gmail.com','Banglore','CUSTOMER','2026-06-18 14:49:02',NULL),(2,'Nanu','1111','nanu@gmail.com','Bangalore','CUSTOMER','2026-06-27 01:50:16',NULL),(3,'Sameena K','5555','sameena@gmail.com','BTM Layout, Bangalore','CUSTOMER','2026-06-27 02:01:22',NULL),(4,'Saba Mulla','1001','saba@gmail.com','KEB Colony, Hubli','CUSTOMER','2026-07-01 17:06:18',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-06 22:24:48
