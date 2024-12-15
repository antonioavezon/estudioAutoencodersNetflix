-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: netflix
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Current Database: `netflix`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `netflix` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `netflix`;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Sci-Fi'),(2,'Romance'),(3,'Action'),(4,'Drama'),(5,'Animation'),(6,'Crime'),(7,'Comedy'),(8,'Biography'),(9,'Fantasy'),(10,'War');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peliculas`
--

DROP TABLE IF EXISTS `peliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peliculas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `genero` varchar(100) DEFAULT NULL,
  `duracion` int DEFAULT NULL,
  `calificacion_promedio` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peliculas`
--

LOCK TABLES `peliculas` WRITE;
/*!40000 ALTER TABLE `peliculas` DISABLE KEYS */;
INSERT INTO `peliculas` VALUES (1,'Inception','Sci-Fi',148,4.8),(2,'Titanic','Romance',195,4.7),(3,'The Matrix','Sci-Fi',136,4.9),(4,'Avengers: Endgame','Action',181,4.6),(5,'Interstellar','Sci-Fi',169,4.8),(6,'The Dark Knight','Action',152,4.9),(7,'Forrest Gump','Drama',142,4.8),(8,'The Lion King','Animation',89,4.7),(9,'Frozen','Animation',102,4.5),(10,'Parasite','Drama',132,4.9),(11,'The Shawshank Redemption','Drama',142,5),(12,'The Godfather','Crime',175,4.9),(13,'Pulp Fiction','Crime',154,4.8),(14,'Gladiator','Action',155,4.6),(15,'Coco','Animation',105,4.9),(16,'Up','Animation',96,4.8),(17,'The Grand Budapest Hotel','Comedy',99,4.7),(18,'The Wolf of Wall Street','Biography',180,4.5),(19,'La La Land','Romance',128,4.6),(20,'The Social Network','Biography',120,4.7),(21,'Toy Story','Animation',81,4.6),(22,'Finding Nemo','Animation',100,4.8),(23,'Inside Out','Animation',95,4.7),(24,'Soul','Animation',100,4.8),(25,'Black Panther','Action',134,4.6),(26,'Spider-Man: Into the Spider-Verse','Animation',117,4.9),(27,'Zootopia','Animation',108,4.7),(28,'Avengers: Infinity War','Action',149,4.7),(29,'Iron Man','Action',126,4.6),(30,'Doctor Strange','Action',115,4.6),(31,'Guardians of the Galaxy','Action',121,4.7),(32,'Captain Marvel','Action',123,4.5),(33,'Wonder Woman','Action',141,4.6),(34,'Shazam!','Action',132,4.5),(35,'Aquaman','Action',143,4.6),(36,'The Hobbit: An Unexpected Journey','Fantasy',169,4.6),(37,'The Lord of the Rings: The Fellowship of the Ring','Fantasy',178,4.9),(38,'Harry Potter and the Philosopher\'s Stone','Fantasy',152,4.8),(39,'Fantastic Beasts and Where to Find Them','Fantasy',133,4.6),(40,'Dune','Sci-Fi',155,4.8),(41,'Blade Runner 2049','Sci-Fi',164,4.7),(42,'Arrival','Sci-Fi',116,4.8),(43,'Gravity','Sci-Fi',91,4.7),(44,'The Martian','Sci-Fi',144,4.8),(45,'1917','War',119,4.7),(46,'Saving Private Ryan','War',169,4.9),(47,'Dunkirk','War',106,4.6),(48,'Braveheart','War',178,4.7),(49,'Schindler\'s List','Biography',195,4.9),(50,'A Beautiful Mind','Biography',135,4.8),(51,'The Pursuit of Happyness','Biography',117,4.8),(52,'Bohemian Rhapsody','Biography',134,4.7),(53,'Rocketman','Biography',121,4.6),(54,'Avatar','Sci-Fi',162,4.9),(55,'The Matrix Reloaded','Sci-Fi',138,4.7),(56,'Joker','Drama',122,4.5),(57,'Inglourious Basterds','War',153,4.4),(61,'Star Wars: A New Hope','Sci-Fi',121,4.8),(62,'Star Wars: The Empire Strikes Back','Sci-Fi',124,4.9),(63,'Star Wars: Return of the Jedi','Sci-Fi',131,4.7),(64,'The Terminator','Sci-Fi',107,4.6),(65,'Terminator 2: Judgment Day','Sci-Fi',137,4.8),(66,'E.T. the Extra-Terrestrial','Sci-Fi',115,4.7),(67,'Star Trek: The Motion Picture','Sci-Fi',132,4.5),(68,'Star Trek II: The Wrath of Khan','Sci-Fi',113,4.6),(69,'Star Trek Beyond','Sci-Fi',122,4.7),(70,'Edge of Tomorrow','Sci-Fi',113,4.8),(71,'RoboCop','Sci-Fi',102,4.6),(72,'Total Recall','Sci-Fi',113,4.7),(73,'Minority Report','Sci-Fi',145,4.7),(74,'War of the Worlds','Sci-Fi',116,4.5),(75,'I, Robot','Sci-Fi',115,4.6),(76,'Ex Machina','Sci-Fi',108,4.8),(77,'Her','Sci-Fi',126,4.7),(78,'A.I. Artificial Intelligence','Sci-Fi',146,4.6),(79,'The Day the Earth Stood Still','Sci-Fi',92,4.5),(80,'Contact','Sci-Fi',150,4.7),(81,'The Notebook','Romance',123,4.8),(82,'Pride and Prejudice','Romance',129,4.7),(83,'A Walk to Remember','Romance',101,4.6),(84,'Romeo + Juliet','Romance',120,4.5),(85,'Me Before You','Romance',110,4.6),(86,'La La Land','Romance',128,4.8),(87,'Notting Hill','Romance',124,4.7),(88,'Pretty Woman','Romance',119,4.6),(89,'The Fault in Our Stars','Romance',126,4.8),(90,'50 First Dates','Romance',99,4.6),(91,'10 Things I Hate About You','Romance',97,4.5),(92,'Love Actually','Romance',135,4.7),(93,'The Proposal','Romance',108,4.6),(94,'Crazy Rich Asians','Romance',121,4.7),(95,'Letters to Juliet','Romance',105,4.5),(96,'Sweet Home Alabama','Romance',108,4.6),(97,'The Vow','Romance',104,4.7),(98,'About Time','Romance',123,4.8),(99,'Dear John','Romance',107,4.5),(100,'Blue Valentine','Romance',112,4.6),(101,'Mad Max: Fury Road','Action',120,4.9),(102,'Die Hard','Action',132,4.8),(103,'John Wick','Action',101,4.7),(104,'John Wick: Chapter 2','Action',122,4.8),(105,'John Wick: Chapter 3 – Parabellum','Action',131,4.8),(106,'Gladiator','Action',155,4.9),(107,'The Bourne Identity','Action',119,4.6),(108,'The Bourne Supremacy','Action',108,4.7),(109,'The Bourne Ultimatum','Action',115,4.8),(110,'Casino Royale','Action',144,4.8),(111,'Skyfall','Action',143,4.8),(112,'No Time to Die','Action',163,4.7),(113,'Mission: Impossible','Action',110,4.6),(114,'Mission: Impossible 2','Action',123,4.5),(115,'Mission: Impossible – Fallout','Action',147,4.9),(116,'Fast Five','Action',130,4.6),(117,'Furious 7','Action',137,4.7),(118,'The Expendables','Action',103,4.5),(119,'The Equalizer','Action',132,4.6),(120,'The Raid: Redemption','Action',101,4.8),(121,'The Green Mile','Drama',189,4.9),(122,'Good Will Hunting','Drama',126,4.8),(123,'Dead Poets Society','Drama',128,4.7),(124,'A Star is Born','Drama',136,4.6),(125,'The Blind Side','Drama',129,4.7),(126,'12 Years a Slave','Drama',134,4.8),(127,'Moonlight','Drama',111,4.6),(128,'The Imitation Game','Drama',114,4.8),(129,'Room','Drama',118,4.7),(130,'The Help','Drama',146,4.7),(131,'Little Women','Drama',135,4.8),(132,'The Revenant','Drama',156,4.7),(133,'Lion','Drama',118,4.8),(134,'The Theory of Everything','Drama',123,4.8),(135,'Dallas Buyers Club','Drama',117,4.7),(136,'The King’s Speech','Drama',118,4.8),(137,'Boyhood','Drama',165,4.7),(138,'Her','Drama',126,4.6),(139,'Slumdog Millionaire','Drama',120,4.8),(140,'The Pianist','Drama',150,4.9),(141,'Ratatouille','Animation',111,4.8),(142,'Moana','Animation',107,4.7),(143,'The Incredibles','Animation',115,4.8),(144,'WALL-E','Animation',98,4.9),(145,'Big Hero 6','Animation',102,4.7),(146,'How to Train Your Dragon','Animation',98,4.8),(147,'Despicable Me','Animation',95,4.7),(148,'Shrek','Animation',90,4.8),(149,'Kung Fu Panda','Animation',92,4.7),(150,'Ice Age','Animation',81,4.6),(151,'Monsters, Inc.','Animation',92,4.8),(152,'The Lego Movie','Animation',100,4.7),(153,'Madagascar','Animation',86,4.6),(154,'The Secret Life of Pets','Animation',87,4.5),(155,'Sing','Animation',108,4.6),(156,'The Croods','Animation',98,4.5),(157,'Cloudy with a Chance of Meatballs','Animation',90,4.7),(158,'Zootopia','Animation',108,4.7),(159,'Tangled','Animation',100,4.8),(160,'The Little Mermaid','Animation',83,4.8),(161,'The Imitation Game','Biography',113,4.8),(162,'The Theory of Everything','Biography',123,4.7),(163,'Hidden Figures','Biography',127,4.8),(164,'Lincoln','Biography',150,4.6),(165,'12 Years a Slave','Biography',134,4.8),(166,'The Aviator','Biography',170,4.7),(167,'Erin Brockovich','Biography',131,4.6),(168,'Aviator','Biography',170,4.8),(169,'Gandhi','Biography',191,4.9),(170,'Catch Me If You Can','Biography',141,4.7),(171,'Goodfellas','Biography',146,4.9),(172,'Capote','Biography',114,4.6),(173,'Ray','Biography',152,4.7),(174,'The Social Network','Biography',120,4.8),(175,'Walk the Line','Biography',136,4.7),(176,'The Founder','Biography',115,4.6),(177,'The Big Short','Biography',130,4.7),(178,'Darkest Hour','Biography',125,4.6),(179,'Steve Jobs','Biography',122,4.5),(180,'Moneyball','Biography',133,4.7),(181,'The Hangover','Comedy',100,4.5),(182,'Superbad','Comedy',113,4.6),(183,'Step Brothers','Comedy',98,4.4),(184,'Bridesmaids','Comedy',125,4.6),(185,'Anchorman: The Legend of Ron Burgundy','Comedy',94,4.5),(186,'Tropic Thunder','Comedy',107,4.4),(187,'The Grand Budapest Hotel','Comedy',99,4.8),(188,'21 Jump Street','Comedy',109,4.5),(189,'Crazy, Stupid, Love.','Comedy',118,4.7),(190,'Ferris Bueller\'s Day Off','Comedy',103,4.8),(191,'Mean Girls','Comedy',97,4.6),(192,'Dumb and Dumber','Comedy',107,4.4),(193,'The Other Guys','Comedy',107,4.5),(194,'Zombieland','Comedy',88,4.6),(195,'Deadpool','Comedy',108,4.8),(196,'Shaun of the Dead','Comedy',99,4.7),(197,'Hot Fuzz','Comedy',121,4.7),(198,'The Nice Guys','Comedy',116,4.6),(199,'Knives Out','Comedy',130,4.8),(200,'Game Night','Comedy',100,4.5),(201,'Letters from Iwo Jima','War',141,4.8),(202,'Flags of Our Fathers','War',132,4.6),(203,'Hacksaw Ridge','War',139,4.9),(204,'The Thin Red Line','War',170,4.7),(205,'Patton','War',172,4.6),(206,'The Longest Day','War',178,4.8),(207,'Platoon','War',120,4.7),(208,'Apocalypse Now','War',153,4.9),(209,'Full Metal Jacket','War',116,4.8),(210,'Black Hawk Down','War',144,4.7),(211,'Fury','War',135,4.6),(212,'Enemy at the Gates','War',131,4.7),(213,'The Bridge on the River Kwai','War',161,4.8),(214,'Tora! Tora! Tora!','War',144,4.6),(215,'Midway','War',138,4.5),(216,'We Were Soldiers','War',138,4.6),(217,'The Hurt Locker','War',131,4.7),(218,'War Horse','War',146,4.6),(219,'1917','War',119,4.9),(220,'Gallipoli','War',110,4.5),(221,'Goodfellas','Crime',146,4.9),(222,'Casino','Crime',178,4.8),(223,'The Departed','Crime',151,4.9),(224,'American Gangster','Crime',157,4.7),(225,'The Untouchables','Crime',119,4.8),(226,'Heat','Crime',170,4.9),(227,'Reservoir Dogs','Crime',99,4.8),(228,'Scarface','Crime',170,4.7),(229,'City of God','Crime',130,4.9),(230,'The Usual Suspects','Crime',106,4.9),(231,'L.A. Confidential','Crime',138,4.8),(232,'Se7en','Crime',127,4.9),(233,'The Irishman','Crime',209,4.6),(234,'Mystic River','Crime',138,4.7),(235,'Training Day','Crime',122,4.6),(236,'The French Connection','Crime',104,4.8),(237,'Donnie Brasco','Crime',127,4.7),(238,'A Bronx Tale','Crime',121,4.6),(239,'Road to Perdition','Crime',117,4.8),(240,'Prisoners','Crime',153,4.7),(241,'The Chronicles of Narnia: The Lion, the Witch and the Wardrobe','Fantasy',143,4.7),(242,'Pan\'s Labyrinth','Fantasy',118,4.8),(243,'The Golden Compass','Fantasy',113,4.6),(244,'Stardust','Fantasy',127,4.7),(245,'Percy Jackson & the Olympians: The Lightning Thief','Fantasy',118,4.5),(246,'The Spiderwick Chronicles','Fantasy',107,4.6),(247,'Eragon','Fantasy',104,4.5),(248,'Ella Enchanted','Fantasy',96,4.6),(249,'The Princess Bride','Fantasy',98,4.9),(250,'Bridge to Terabithia','Fantasy',96,4.7),(251,'The Dark Crystal','Fantasy',93,4.8),(252,'Willow','Fantasy',126,4.6),(253,'The NeverEnding Story','Fantasy',102,4.9),(254,'Coraline','Fantasy',100,4.7),(255,'Mirror Mirror','Fantasy',106,4.5),(256,'Hansel & Gretel: Witch Hunters','Fantasy',88,4.6),(257,'The Sorcerer\'s Apprentice','Fantasy',109,4.6),(258,'Beowulf','Fantasy',115,4.5),(259,'Alice in Wonderland (2010)','Fantasy',108,4.7),(260,'Fantastic Beasts: The Crimes of Grindelwald','Fantasy',134,4.5);
/*!40000 ALTER TABLE `peliculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `edad` int DEFAULT NULL,
  `ubicacion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Juan Perez',25,'Santiago'),(2,'Maria Lopez',30,'Buenos Aires'),(3,'Pedro Gomez',35,'Lima'),(4,'Ana Martinez',40,'Ciudad de México'),(5,'Luis Hernandez',28,'Bogotá'),(6,'Carmen Sanchez',32,'Madrid'),(7,'Carlos Torres',29,'Lima'),(8,'Laura Ramirez',27,'Santiago'),(9,'Diego Fernandez',34,'Buenos Aires'),(10,'Fernanda Alvarez',31,'Ciudad de México'),(11,'Jorge Gutierrez',45,'Bogotá'),(12,'Silvia Ortiz',50,'Madrid'),(13,'Alejandro Vargas',22,'Santiago'),(14,'Patricia Gonzalez',26,'Buenos Aires'),(15,'Sofia Morales',33,'Ciudad de México'),(16,'Pablo Castillo',36,'Bogotá'),(17,'Andrea Mendoza',30,'Madrid'),(18,'Ricardo Espinoza',24,'Santiago'),(19,'Isabel Suarez',29,'Buenos Aires'),(20,'Hugo Blanco',38,'Ciudad de México'),(21,'Francisco Delgado',27,'Bogotá'),(22,'Diana Paredes',25,'Madrid'),(23,'Sergio Figueroa',28,'Santiago'),(24,'Monica Guzman',35,'Buenos Aires'),(25,'Rodrigo Castro',37,'Ciudad de México'),(26,'Elena Peña',32,'Bogotá'),(27,'Victor Contreras',31,'Madrid'),(28,'Gabriela Rios',34,'Santiago'),(29,'Julio Chavez',45,'Buenos Aires'),(30,'Natalia Vega',40,'Ciudad de México'),(31,'Manuel Pizarro',50,'Bogotá'),(32,'Claudia Lozano',22,'Madrid'),(33,'Adriana Ramos',26,'Santiago'),(34,'Felipe Navarro',33,'Buenos Aires'),(35,'Teresa Villalobos',36,'Ciudad de México'),(36,'Mario Reyes',24,'Bogotá'),(37,'Angela Lara',29,'Madrid'),(38,'Sebastian Flores',38,'Santiago'),(39,'Carolina Dominguez',27,'Buenos Aires'),(40,'Guillermo Soto',30,'Ciudad de México'),(41,'Lorena Salas',35,'Bogotá'),(42,'Miguel Valenzuela',28,'Madrid'),(43,'Daniela Campos',25,'Santiago'),(44,'Hector Luna',34,'Buenos Aires'),(45,'Rosa Gutierrez',31,'Ciudad de México'),(46,'Alberto Villanueva',33,'Bogotá'),(47,'Valeria Pacheco',26,'Madrid'),(48,'Enrique Rojas',28,'Santiago'),(49,'Mariana Ruiz',29,'Buenos Aires'),(50,'Marcelo Muñoz',37,'Ciudad de México'),(51,'Paola Salazar',32,'Bogotá'),(52,'Arturo Mejia',30,'Madrid'),(53,'Esteban Naranjo',24,'Santiago'),(54,'Carlos Rivera',28,'Bogotá'),(55,'Laura Martínez',35,'Ciudad de México'),(56,'Ana González',31,'Santiago'),(57,'Juan Ramírez',45,'Buenos Aires'),(58,'Sofía López',27,'Quito'),(59,'Isabel Torres',24,'Montevideo'),(60,'Andrés Pérez',33,'La Paz'),(61,'Gabriela Sánchez',29,'Caracas');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visualizaciones`
--

DROP TABLE IF EXISTS `visualizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visualizaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int DEFAULT NULL,
  `pelicula_id` int DEFAULT NULL,
  `calificacion` int DEFAULT NULL,
  `duracion_vista` int DEFAULT NULL,
  `fecha_visualizacion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `pelicula_id` (`pelicula_id`),
  CONSTRAINT `visualizaciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `visualizaciones_ibfk_2` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=374 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visualizaciones`
--

LOCK TABLES `visualizaciones` WRITE;
/*!40000 ALTER TABLE `visualizaciones` DISABLE KEYS */;
INSERT INTO `visualizaciones` VALUES (1,1,1,5,148,'2024-12-01'),(2,2,1,4,140,'2024-12-02'),(3,3,2,3,120,'2024-12-03'),(4,4,2,4,195,'2024-12-04'),(5,5,3,5,100,'2024-12-05'),(6,6,4,2,90,'2024-12-06'),(7,7,5,4,150,'2024-12-07'),(8,8,6,3,110,'2024-12-08'),(9,9,7,5,130,'2024-12-09'),(10,10,8,1,80,'2024-12-10'),(11,11,9,3,145,'2024-12-11'),(12,12,10,4,160,'2024-12-12'),(13,13,11,2,90,'2024-12-13'),(14,14,12,5,170,'2024-12-14'),(15,15,13,4,120,'2024-12-15'),(16,16,14,3,140,'2024-12-16'),(17,17,15,5,130,'2024-12-17'),(18,18,16,4,100,'2024-12-18'),(19,19,17,3,110,'2024-12-19'),(20,20,18,2,95,'2024-12-20'),(21,21,19,1,85,'2024-12-21'),(22,22,20,5,150,'2024-12-22'),(23,23,21,4,130,'2024-12-23'),(24,24,22,3,100,'2024-12-24'),(25,25,23,2,90,'2024-12-25'),(26,26,24,1,80,'2024-12-26'),(27,27,25,4,145,'2024-12-27'),(28,28,26,5,160,'2024-12-28'),(29,29,27,3,170,'2024-12-29'),(30,30,28,4,120,'2024-12-30'),(31,1,3,4,114,'2024-11-15'),(32,1,5,3,137,'2024-11-23'),(33,1,40,3,129,'2024-12-03'),(34,1,41,4,141,'2024-12-12'),(35,1,42,4,100,'2024-12-14'),(38,2,2,3,171,'2024-11-23'),(39,2,19,3,124,'2024-12-10'),(41,3,4,3,180,'2024-11-23'),(42,3,6,4,151,'2024-12-14'),(43,3,14,3,143,'2024-11-24'),(44,3,25,4,130,'2024-11-28'),(45,3,28,3,133,'2024-11-23'),(48,4,7,3,126,'2024-11-19'),(49,4,10,4,115,'2024-11-17'),(50,4,11,3,124,'2024-11-27'),(51,4,56,4,106,'2024-12-02'),(55,5,8,4,80,'2024-11-21'),(56,5,9,3,88,'2024-11-22'),(57,5,15,4,92,'2024-11-18'),(58,5,16,3,78,'2024-11-16'),(59,5,21,3,73,'2024-12-05'),(62,6,18,4,164,'2024-12-10'),(63,6,20,3,118,'2024-12-01'),(64,6,49,3,186,'2024-11-27'),(65,6,50,4,123,'2024-11-21'),(66,6,51,3,106,'2024-12-05'),(69,7,36,4,156,'2024-12-04'),(70,7,37,4,165,'2024-12-02'),(71,7,38,3,136,'2024-12-13'),(72,7,39,4,124,'2024-12-12'),(76,8,45,3,112,'2024-12-03'),(77,8,46,4,152,'2024-12-02'),(78,8,47,4,99,'2024-11-27'),(79,8,48,4,177,'2024-12-13'),(80,8,57,3,141,'2024-12-12'),(83,9,17,3,80,'2024-12-13'),(84,10,12,4,160,'2024-12-11'),(85,10,13,4,148,'2024-11-28'),(87,11,45,3,99,'2024-11-22'),(88,11,46,3,158,'2024-11-19'),(89,11,47,3,98,'2024-12-02'),(90,11,48,3,166,'2024-11-18'),(91,11,57,3,123,'2024-12-10'),(94,12,18,4,164,'2024-12-13'),(95,12,20,4,112,'2024-11-24'),(96,12,49,3,191,'2024-12-04'),(97,12,50,4,134,'2024-11-19'),(98,12,51,3,102,'2024-11-25'),(101,13,36,3,158,'2024-12-12'),(102,13,37,3,167,'2024-12-04'),(103,13,38,4,128,'2024-12-10'),(104,13,39,3,123,'2024-12-08'),(108,14,1,3,143,'2024-11-17'),(109,14,3,3,132,'2024-11-17'),(110,14,5,3,151,'2024-12-07'),(111,14,40,4,128,'2024-12-04'),(112,14,41,3,163,'2024-11-25'),(115,15,7,3,138,'2024-12-05'),(116,15,10,4,117,'2024-11-26'),(117,15,11,4,114,'2024-11-20'),(118,15,56,4,109,'2024-12-02'),(122,16,4,4,174,'2024-12-05'),(123,16,6,3,131,'2024-11-29'),(124,16,25,4,112,'2024-12-02'),(125,16,28,3,143,'2024-11-21'),(126,16,29,4,110,'2024-12-08'),(129,17,8,4,71,'2024-12-04'),(130,17,9,4,86,'2024-12-09'),(131,17,16,3,86,'2024-11-20'),(132,17,21,4,75,'2024-11-28'),(133,17,22,4,91,'2024-12-14'),(136,18,17,3,93,'2024-11-30'),(137,19,12,3,168,'2024-12-03'),(138,19,13,3,145,'2024-11-29'),(140,20,2,3,166,'2024-12-05'),(141,20,19,4,103,'2024-11-21'),(143,21,18,4,176,'2024-11-17'),(144,21,20,4,106,'2024-11-21'),(145,21,49,3,159,'2024-11-15'),(146,21,50,4,122,'2024-11-28'),(147,21,51,3,99,'2024-11-24'),(150,22,36,4,142,'2024-12-10'),(151,22,37,3,151,'2024-11-21'),(152,22,38,3,144,'2024-12-11'),(153,22,39,3,110,'2024-11-17'),(157,23,1,3,135,'2024-11-22'),(158,23,3,3,133,'2024-11-30'),(159,23,5,4,154,'2024-12-13'),(160,23,40,4,136,'2024-11-28'),(161,23,41,3,153,'2024-12-13'),(164,24,7,3,130,'2024-11-29'),(165,24,10,4,122,'2024-11-24'),(166,24,11,3,119,'2024-11-23'),(167,24,56,4,111,'2024-12-13'),(171,25,4,4,166,'2024-12-06'),(172,25,6,4,138,'2024-11-24'),(173,25,14,4,144,'2024-12-11'),(174,25,25,4,126,'2024-11-24'),(175,25,28,3,135,'2024-11-21'),(178,26,8,3,87,'2024-11-20'),(179,26,9,3,87,'2024-11-30'),(180,26,15,4,89,'2024-11-28'),(181,26,16,3,91,'2024-11-25'),(182,26,21,4,69,'2024-11-21'),(185,27,17,3,91,'2024-11-30'),(186,28,12,3,142,'2024-11-18'),(187,28,13,3,134,'2024-12-06'),(189,29,2,3,174,'2024-11-27'),(190,29,19,3,116,'2024-12-03'),(192,30,45,3,98,'2024-11-19'),(193,30,46,4,168,'2024-12-09'),(194,30,47,4,87,'2024-11-21'),(195,30,48,4,154,'2024-12-11'),(196,30,57,4,130,'2024-11-20'),(199,31,18,3,177,'2024-11-21'),(200,31,20,3,108,'2024-12-13'),(201,31,49,4,179,'2024-11-21'),(202,31,50,3,128,'2024-11-23'),(203,31,51,3,105,'2024-11-28'),(206,32,7,3,130,'2024-12-07'),(207,32,10,3,112,'2024-12-09'),(208,32,11,3,134,'2024-11-29'),(209,32,56,3,112,'2024-11-24'),(213,33,8,4,85,'2024-12-06'),(214,33,9,4,84,'2024-11-22'),(215,33,15,3,84,'2024-12-03'),(216,33,16,4,91,'2024-11-26'),(217,33,21,4,74,'2024-11-15'),(220,34,4,3,163,'2024-12-04'),(221,34,6,3,142,'2024-11-15'),(222,34,14,4,137,'2024-11-29'),(223,34,25,3,128,'2024-12-11'),(224,34,28,3,140,'2024-11-18'),(227,35,1,3,119,'2024-12-09'),(228,35,3,4,121,'2024-11-19'),(229,35,5,4,161,'2024-12-04'),(230,35,40,3,142,'2024-11-16'),(231,35,41,3,147,'2024-12-05'),(234,36,36,3,138,'2024-11-28'),(235,36,37,3,145,'2024-12-01'),(236,36,38,3,145,'2024-11-18'),(237,36,39,4,112,'2024-12-08'),(241,37,17,3,91,'2024-11-24'),(242,38,2,4,189,'2024-11-28'),(243,38,19,3,113,'2024-12-01'),(245,39,12,4,151,'2024-11-20'),(246,39,13,3,125,'2024-12-13'),(248,40,45,3,117,'2024-11-23'),(249,40,46,4,159,'2024-12-08'),(250,40,47,4,104,'2024-11-19'),(251,40,48,3,168,'2024-12-03'),(252,40,57,4,150,'2024-11-21'),(255,41,7,3,134,'2024-12-12'),(256,41,10,3,112,'2024-12-13'),(257,41,11,3,119,'2024-11-25'),(258,41,56,4,100,'2024-11-21'),(262,42,4,4,153,'2024-11-25'),(263,42,6,4,141,'2024-11-21'),(264,42,14,4,124,'2024-11-30'),(265,42,25,3,115,'2024-11-29'),(266,42,28,4,134,'2024-11-22'),(269,43,1,3,144,'2024-11-22'),(270,43,3,3,112,'2024-12-02'),(271,43,5,4,143,'2024-12-09'),(272,43,40,3,135,'2024-12-07'),(273,43,41,3,132,'2024-11-24'),(276,44,18,3,167,'2024-12-08'),(277,44,20,3,116,'2024-11-16'),(278,44,49,3,160,'2024-12-14'),(279,44,50,4,122,'2024-11-28'),(280,44,51,3,99,'2024-11-26'),(283,45,17,3,83,'2024-11-18'),(284,46,2,4,186,'2024-11-18'),(285,46,19,3,115,'2024-12-01'),(287,47,8,4,75,'2024-12-09'),(288,47,9,3,98,'2024-12-14'),(289,47,15,4,98,'2024-11-22'),(290,47,16,4,77,'2024-12-08'),(291,47,21,3,72,'2024-12-05'),(294,48,36,3,159,'2024-12-10'),(295,48,37,4,158,'2024-11-27'),(296,48,38,4,151,'2024-12-08'),(297,48,39,3,119,'2024-11-22'),(301,49,12,3,142,'2024-11-27'),(302,49,13,4,144,'2024-12-03'),(304,50,45,4,102,'2024-11-17'),(305,50,46,4,141,'2024-12-08'),(306,50,47,3,98,'2024-11-21'),(307,50,48,3,175,'2024-11-29'),(308,50,57,4,124,'2024-12-10'),(311,51,18,4,158,'2024-12-07'),(312,51,20,3,114,'2024-11-30'),(313,51,49,3,167,'2024-11-15'),(314,51,50,3,117,'2024-11-26'),(315,51,51,3,100,'2024-12-03'),(318,52,4,3,146,'2024-12-11'),(319,52,6,3,144,'2024-11-28'),(320,52,14,3,145,'2024-12-11'),(321,52,25,3,109,'2024-12-14'),(322,52,28,4,138,'2024-12-13'),(325,53,8,3,72,'2024-11-23'),(326,53,9,3,85,'2024-12-10'),(327,53,15,3,97,'2024-11-28'),(328,53,16,4,90,'2024-11-16'),(329,53,21,4,79,'2024-11-15'),(332,54,36,3,149,'2024-11-15'),(333,54,37,4,171,'2024-11-30'),(334,54,38,4,125,'2024-11-16'),(335,54,39,3,130,'2024-12-02'),(339,55,7,3,141,'2024-11-30'),(340,55,10,4,109,'2024-12-08'),(341,55,11,4,126,'2024-12-04'),(342,55,56,3,121,'2024-11-24'),(346,56,1,3,124,'2024-11-26'),(347,56,3,4,109,'2024-12-03'),(348,56,5,4,143,'2024-11-28'),(349,56,40,3,146,'2024-12-05'),(350,56,41,3,145,'2024-11-21'),(353,57,45,4,102,'2024-11-16'),(354,57,46,4,153,'2024-12-12'),(355,57,47,4,91,'2024-11-28'),(356,57,48,4,152,'2024-12-12'),(357,57,57,4,133,'2024-12-08'),(360,58,2,4,165,'2024-12-06'),(361,58,19,4,122,'2024-11-23'),(363,59,12,3,173,'2024-12-12'),(364,59,13,4,141,'2024-12-06'),(366,60,17,4,80,'2024-11-29'),(367,61,18,3,174,'2024-11-21'),(368,61,20,3,113,'2024-12-03'),(369,61,49,4,175,'2024-12-06'),(370,61,50,4,129,'2024-12-10'),(371,61,51,3,110,'2024-12-04');
/*!40000 ALTER TABLE `visualizaciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-14 18:24:44
