-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: fiorista_maria
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
-- Table structure for table `carrello`
--

DROP TABLE IF EXISTS `carrello`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrello` (
  `id_utente` int NOT NULL,
  `id_prodotto` int NOT NULL,
  `quantita` int NOT NULL DEFAULT '1',
  `data_aggiunta` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_utente`,`id_prodotto`),
  KEY `fk_carrello_prodotto` (`id_prodotto`),
  CONSTRAINT `fk_carrello_prodotto` FOREIGN KEY (`id_prodotto`) REFERENCES `prodotto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_carrello_utente` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrello`
--

LOCK TABLES `carrello` WRITE;
/*!40000 ALTER TABLE `carrello` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrello` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Bouquet'),(2,'Rose'),(3,'Piante'),(4,'Laurea'),(5,'Anniversario');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordine`
--

DROP TABLE IF EXISTS `ordine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordine` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_utente` int NOT NULL,
  `data_ordine` date NOT NULL,
  `totale` decimal(10,2) DEFAULT NULL,
  `nome_destinatario` varchar(100) DEFAULT NULL,
  `indirizzo` varchar(150) DEFAULT NULL,
  `citta` varchar(50) DEFAULT NULL,
  `cap` varchar(10) DEFAULT NULL,
  `messaggio` text,
  `stato` varchar(30) DEFAULT NULL,
  `data` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_utente` (`id_utente`),
  CONSTRAINT `ordine_ibfk_1` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordine`
--

LOCK TABLES `ordine` WRITE;
/*!40000 ALTER TABLE `ordine` DISABLE KEYS */;
INSERT INTO `ordine` VALUES (10,2,'2026-06-19',119.70,'Francesca','Via dott. Matteo Petraroia n.20C','Pellezzano','84080','Auguri per il tuo compleanno','Consegnato','2026-06-19 08:39:48'),(11,2,'2026-06-19',39.90,'Francesca Falcone','Via dott. Matteo Petraroia n.20C','Pellezzano','84080','','Annullato','2026-06-19 08:54:23'),(12,6,'2026-06-23',119.70,'Ruocco Daniela Lucia','Via Buico, 11','Camerota','84040','','In Lavorazione','2026-06-23 13:30:02');
/*!40000 ALTER TABLE `ordine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodotto`
--

DROP TABLE IF EXISTS `prodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodotto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descrizione` text,
  `prezzo` decimal(10,2) NOT NULL,
  `immagine` varchar(255) DEFAULT NULL,
  `quantita` int NOT NULL,
  `id_categoria` int DEFAULT NULL,
  `attivo` tinyint(1) DEFAULT '1',
  `categoria` varchar(50) NOT NULL DEFAULT 'bouquet',
  PRIMARY KEY (`id`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `prodotto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
INSERT INTO `prodotto` VALUES (1,'Bouquet Sposa Elegance','Bouquet raffinato con rose bianche e gypsophila, ideale per matrimoni, cerimonie e momenti eleganti.',89.90,'bouquet/bouquet_sposa.jpeg',10,NULL,1,'Bouquet'),(2,'Bouquet Tulipani Bianchi','Composizione luminosa di tulipani bianchi freschi, elegante e delicata per un regalo raffinato.',39.90,'bouquet/bouquet_tulipani.jpeg',15,NULL,1,'Bouquet'),(3,'Bouquet Primavera','Bouquet vivace con girasoli, rose e verde decorativo, perfetto per compleanni e occasioni solari.',44.90,'bouquet/bouquet2.jpeg',20,NULL,1,'Bouquet'),(4,'Corona di Laurea Classica','Corona d’alloro fresca con rose rosse, pensata per celebrare la laurea con eleganza e tradizione.',29.90,'coronalaurea/corona_laurea_rose.jpeg',30,NULL,1,'Corone di Laurea'),(5,'Corona di Laurea Personalizzata','Corona d’alloro con dettagli floreali personalizzabili, ideale per rendere unico il giorno della laurea.',34.90,'coronalaurea/corona_laurea2.jpeg',25,NULL,1,'Corone di Laurea'),(6,'Allestimento Matrimonio','Decorazioni floreali coordinate per location, tavoli, cerimonia e momenti speciali del matrimonio.',250.00,'eventi/evento_matrimonio.jpeg',5,NULL,1,'Eventi e Cerimonie'),(7,'Allestimento Tavoli','Composizioni floreali eleganti per tavoli, ingressi e ambienti dedicati a ricevimenti e banchetti.',180.00,'eventi/evento_matrimonio2.jpeg',5,NULL,1,'Eventi e Cerimonie'),(8,'Centrotavola Floreale','Centrotavola floreale curato nei dettagli, ideale per ricevimenti, eventi privati e cerimonie.',45.00,'eventi/evento1.jpeg',12,NULL,1,'Eventi e Cerimonie'),(9,'Flower Cube Rosso','Rosa stabilizzata in elegante cubo trasparente, un regalo raffinato e duraturo.',49.90,'flowercube/flower_cube.jpeg',18,NULL,1,'Flower Cube'),(10,'Rosa Eterna in Campana','Rosa stabilizzata sotto campana di vetro, romantica e scenografica per un dono speciale.',59.90,'flowercube/flower_cube2.jpeg',14,NULL,1,'Flower Cube'),(11,'Cuore di Rose','Composizione romantica con rose stabilizzate.',69.90,'flowercube/flower_cube3.jpeg',8,NULL,1,'flowercube'),(12,'Orchidea Bianca','Orchidea bianca in vaso decorativo, elegante e luminosa per casa, ufficio o regalo.',34.90,'piante/orchidea_bianca.jpeg',22,NULL,1,'Piante e Orchidee'),(13,'Pianta Ornamentale','Pianta ornamentale fiorita, decorativa e colorata, perfetta per ambienti interni ed esterni.',24.90,'piante/piantagialla.jpeg',16,NULL,1,'Piante e Orchidee'),(14,'Pianta Verde Decorativa','Composizione di piante verdi e fiorite in cassetta decorativa, ideale per arredare con naturalezza.',27.90,'piante/piante2.jpeg',19,NULL,1,'Piante e Orchidee'),(15,'Profumatore Muha Blu','Profumatore Muhà con fiore decorativo blu e fragranza Brezza Marina, fresco ed elegante.',19.90,'profumatori/profumatore_muha_blu.jpeg',40,NULL,1,'Profumatori'),(16,'Profumatore Muha Giallo','Profumatore Muhà con fiore giallo e fragranza raffinata, ideale per ambienti accoglienti.',19.90,'profumatori/profumatore_muha_giallo.jpeg',35,NULL,1,'Profumatori'),(17,'Profumatore Floreale','Profumatore floreale decorativo, perfetto come idea regalo per casa e ambienti eleganti.',21.90,'profumatori/profumatori_muha1.jpeg',28,NULL,1,'Profumatori'),(18,'Terrarium Elegance','Terrarium in vetro con piante e muschio decorativo, elegante e facile da ambientare.',39.90,'terrarium/terrarium1.jpeg',11,NULL,1,'Terrarium'),(19,'Terrarium Natura','Piccolo ecosistema decorativo in contenitore di vetro, naturale e originale.',44.90,'terrarium/terrarium2.jpeg',9,NULL,1,'Terrarium'),(20,'Marimo in Vetro','Marimo in vaso di vetro con pietre naturali, una decorazione acquatica semplice e particolare.',24.90,'terrarium/terrarium3.jpeg',50,NULL,1,'Terrarium');
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riga_ordine`
--

DROP TABLE IF EXISTS `riga_ordine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riga_ordine` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_ordine` int NOT NULL,
  `id_prodotto` int DEFAULT NULL,
  `nome_prodotto` varchar(100) DEFAULT NULL,
  `prezzo_acquisto` decimal(10,2) DEFAULT NULL,
  `quantita` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_ordine` (`id_ordine`),
  CONSTRAINT `riga_ordine_ibfk_1` FOREIGN KEY (`id_ordine`) REFERENCES `ordine` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riga_ordine`
--

LOCK TABLES `riga_ordine` WRITE;
/*!40000 ALTER TABLE `riga_ordine` DISABLE KEYS */;
INSERT INTO `riga_ordine` VALUES (1,12,2,NULL,39.90,3);
/*!40000 ALTER TABLE `riga_ordine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `ruolo` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (1,'Admin','Fiorista','admin@gmail.com','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','ADMIN'),(2,'Francesca','Falcone','ffalcone@gmail.com','d3a60bef6f3596c6544485b973ccc6a33e6a5bc61bee22c0e4614f3c4d25d15e','USER'),(3,'Pietro','Falcone','pfalcone@gmail.com','4034fb002bd13841baa6539c02ccb7144601039ddc06cbdf2e46cb7474ae5853','USER'),(4,'Maria','La Loggia','admin@admin.com','admin','ADMIN'),(5,'Mario','Petrosino','mpetro@gmail.com','a2c43ca9db0b7f833cafd51825215c94ef6b875df58db00f5e4fa89fa5b78fe5','USER'),(6,'Daniela Lucia','Ruocco','danienzar@gmail.com','b133a0c0e9bee3be20163d2ad31d6248db292aa6dcb1ee087a2aa50e0fc75ae2','USER');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-23 16:30:40
