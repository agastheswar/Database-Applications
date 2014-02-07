CREATE DATABASE  IF NOT EXISTS `moviesdb_server` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `moviesdb_server`;
-- MySQL dump 10.13  Distrib 5.6.11, for osx10.6 (i386)
--
-- Host: 127.0.0.1    Database: moviesdb_server
-- ------------------------------------------------------
-- Server version	5.5.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `role` varchar(20) DEFAULT NULL,
  `accesscontrols` varchar(50) DEFAULT NULL,
  `userid` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_mapping` (`userid`),
  CONSTRAINT `admin_mapping` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'movieadmin','change movie details',1),(2,'dbadmin','changes in database',3),(3,'useradmin','change users',2);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `award_movie_filmunit`
--

DROP TABLE IF EXISTS `award_movie_filmunit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `award_movie_filmunit` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `awardid` int(10) NOT NULL,
  `movieid` int(10) NOT NULL,
  `filmunitid` int(10) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `Year` year(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `award_mapping` (`awardid`),
  KEY `award_movie` (`movieid`),
  KEY `award_filmunit` (`filmunitid`),
  CONSTRAINT `award_filmunit` FOREIGN KEY (`filmunitid`) REFERENCES `filmunit` (`filmunitid`),
  CONSTRAINT `award_mapping` FOREIGN KEY (`awardid`) REFERENCES `awards` (`awardid`),
  CONSTRAINT `award_movie` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `award_movie_filmunit`
--

LOCK TABLES `award_movie_filmunit` WRITE;
/*!40000 ALTER TABLE `award_movie_filmunit` DISABLE KEYS */;
INSERT INTO `award_movie_filmunit` VALUES (1,1,7,16,'Best Motion Picture of the Year',2013),(3,1,8,36,'Best Motion Picture of the Year',2011),(4,2,8,33,'Best Performance by an Actor in a Leading Role',2011),(5,4,8,32,'Best Performance by an Actor in a Leading Role',2011),(6,11,8,33,'Best Performance by an Actor in a Leading Role',2011),(7,17,7,28,'Best Motion Picture - Drama',2013),(8,14,7,28,'Best Director - Motion Picture',2013);
/*!40000 ALTER TABLE `award_movie_filmunit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `awards` (
  `awardid` int(10) NOT NULL,
  `organization` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `year` year(4) DEFAULT NULL,
  `award_image_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`awardid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
INSERT INTO `awards` VALUES (1,'Oscar','Best Picture',2012,NULL),(2,'Oscar','Best Actor',2012,NULL),(3,'Oscar','Best Actress',2012,NULL),(4,'Oscar','Best Director',2012,NULL),(5,'Oscar','Best Animated Feature',2012,NULL),(6,'Oscar','Best Cinematography',2012,NULL),(7,'Cannes Film Festival','Best Actor',2012,NULL),(8,'Cannes Film Festival','Best Actress',2012,NULL),(9,'Cannes Film Festival','Grand Prize',2012,NULL),(10,'Cannes Film Festival','Golden Palm',2012,NULL),(11,'Golden Globe Awards','Best Actor',2012,NULL),(12,'Golden Globe Awards','Best Actress',2012,NULL),(13,'Golden Globe Awards','Best Animated Feature Film',2012,NULL),(14,'Golden Globe Awards','Best Director',2012,NULL),(15,'Golden Globe Awards','Best Screenplay',2012,NULL),(16,'Golden Globe Awards','Best Original Score',2012,NULL),(17,'Golden Globe Awards','Best Picture',2012,NULL);
/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cast`
--

DROP TABLE IF EXISTS `cast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cast` (
  `castid` int(10) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `filmunitid` int(10) NOT NULL,
  PRIMARY KEY (`castid`),
  KEY `filmunitid` (`filmunitid`),
  CONSTRAINT `filmunitid` FOREIGN KEY (`filmunitid`) REFERENCES `filmunit` (`filmunitid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cast`
--

LOCK TABLES `cast` WRITE;
/*!40000 ALTER TABLE `cast` DISABLE KEYS */;
INSERT INTO `cast` VALUES (1,'Katniss Everdeen','Lead Actress',3),(2,'Gale Hawthorne','Lead Actor',4),(3,'Marvel ','Lead Actor',5),(4,'Marvel ','Actress',6),(7,'Thor','Lead Actor',10),(8,'Jane Foster','Lead Actress',11),(9,'Odin','Actor',12),(10,'Malekith','Actor',13),(11,'Ryan Stone','Actress',15),(12,'Matt Kowalski ','Actor',16),(13,'Max','Actor',18),(14,'Delacourt','Actress',19),(15,'Tony Stark','Lead Actor',21),(16,'Pepper Potts','Lead Actress',22),(17,'Colonel James Rhodes','Actor',23),(18,'Maya','Actress',24),(19,'Gerry Lane','Lead Actor',26),(20,'Karin Lane','Lead Actress',27),(21,'Captain Speke','Actor',28),(22,'Tony Mendez','Lead Actor',29),(23,'Jack O Donnel','Actor',30),(24,'Lester Siegel','Actor',31),(25,'John Chambers','Actor',32),(26,'King George VI','Lead Actor',34),(27,'Queen Elizabeth','Lead Actress',35),(28,'Archbishop Cosmo ','Lead Actress',36);
/*!40000 ALTER TABLE `cast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crew`
--

DROP TABLE IF EXISTS `crew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crew` (
  `crewid` int(10) NOT NULL AUTO_INCREMENT,
  `jobtitle` varchar(20) DEFAULT NULL,
  `filmunitid` int(10) NOT NULL,
  PRIMARY KEY (`crewid`),
  KEY `unitid` (`filmunitid`),
  CONSTRAINT `unitid` FOREIGN KEY (`filmunitid`) REFERENCES `filmunit` (`filmunitid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crew`
--

LOCK TABLES `crew` WRITE;
/*!40000 ALTER TABLE `crew` DISABLE KEYS */;
INSERT INTO `crew` VALUES (1,'Director',1),(2,'Screenplay',2),(3,'Director',8),(4,'Director',9),(5,'Director',14),(6,'Director',17),(7,'Director',20),(8,'Director',25),(9,'Director',29),(10,'Director',33),(11,'Producer',37),(12,'Music',38),(13,'Producer',29),(14,'Producer',39),(15,'Music',40);
/*!40000 ALTER TABLE `crew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filmunit`
--

DROP TABLE IF EXISTS `filmunit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filmunit` (
  `filmunitid` int(10) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `social_networking_page` varchar(100) DEFAULT NULL,
  `Date_of_birth` date DEFAULT NULL,
  `name` int(10) NOT NULL,
  PRIMARY KEY (`filmunitid`),
  KEY `name` (`name`),
  CONSTRAINT `name` FOREIGN KEY (`name`) REFERENCES `names` (`nameid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filmunit`
--

LOCK TABLES `filmunit` WRITE;
/*!40000 ALTER TABLE `filmunit` DISABLE KEYS */;
INSERT INTO `filmunit` VALUES (1,'Male',NULL,NULL,'1971-03-26',1),(2,'Male',NULL,NULL,'1967-03-26',2),(3,'Female',NULL,NULL,'1990-08-15',3),(4,'Male',NULL,NULL,'1990-01-13',4),(5,'Male',NULL,NULL,'1992-04-24',5),(6,'Female',NULL,NULL,NULL,6),(8,'Male',NULL,NULL,'1965-01-20',7),(9,'Male',NULL,NULL,'1970-08-05',8),(10,'Male',NULL,NULL,'1983-08-11',9),(11,'Female',NULL,NULL,'1981-06-09',10),(12,'Male',NULL,NULL,'1937-12-31',11),(13,'Male',NULL,NULL,'1964-02-16',12),(14,'Male',NULL,NULL,'1961-11-28',13),(15,'Female',NULL,NULL,'1964-07-26',14),(16,'Male',NULL,NULL,'1961-05-06',15),(17,'Male',NULL,NULL,'1979-09-17',16),(18,'Male',NULL,NULL,'1970-10-08',17),(19,'Female',NULL,NULL,'1962-11-19',18),(20,'Male',NULL,NULL,'1961-12-16',19),(21,'Male',NULL,NULL,'1965-04-04',20),(22,'Female',NULL,NULL,'1972-09-27',21),(23,'Male',NULL,NULL,'1964-11-20',22),(24,'Female',NULL,NULL,'1982-05-19',23),(25,'Male',NULL,NULL,'1969-11-30',24),(26,'Male',NULL,NULL,'1963-12-18',25),(27,'Female',NULL,NULL,'1975-09-22',26),(28,'Male',NULL,NULL,'1987-05-01',27),(29,'Male',NULL,NULL,'1972-08-15',28),(30,'Male',NULL,NULL,'1956-03-07',29),(31,'Male',NULL,NULL,'1934-03-26',30),(32,'Male',NULL,NULL,'1950-06-20',31),(33,'Male',NULL,NULL,'1972-10-01',32),(34,'Male',NULL,NULL,'1950-09-10',33),(35,'Female',NULL,NULL,'1966-05-26',34),(36,'Male',NULL,NULL,'1938-10-22',35),(37,'Male',NULL,NULL,NULL,36),(38,'Male',NULL,NULL,NULL,37),(39,'Male',NULL,NULL,NULL,38),(40,'Male',NULL,NULL,'1966-10-07',39);
/*!40000 ALTER TABLE `filmunit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filmunit_movie`
--

DROP TABLE IF EXISTS `filmunit_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filmunit_movie` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `filmunitid` int(10) NOT NULL,
  `movieid` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `film_unit_mapping` (`filmunitid`),
  KEY `movie_filmunit` (`movieid`),
  CONSTRAINT `film_unit_mapping` FOREIGN KEY (`filmunitid`) REFERENCES `filmunit` (`filmunitid`),
  CONSTRAINT `movie_filmunit` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filmunit_movie`
--

LOCK TABLES `filmunit_movie` WRITE;
/*!40000 ALTER TABLE `filmunit_movie` DISABLE KEYS */;
INSERT INTO `filmunit_movie` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,9,2),(8,10,2),(9,11,2),(10,12,2),(11,13,3),(12,14,3),(13,15,3),(14,16,4),(15,17,4),(16,18,4),(17,19,5),(18,20,5),(19,21,5),(20,22,5),(21,23,5),(22,24,4),(23,25,6),(24,26,6),(25,27,6),(26,28,7),(27,29,7),(28,30,7),(29,31,7),(30,32,8),(31,33,8),(32,34,8),(33,35,8),(34,36,8),(35,37,8),(36,37,7),(37,38,6),(38,39,6);
/*!40000 ALTER TABLE `filmunit_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre` (
  `genreid` int(10) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`genreid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Action '),(2,'Adevnture'),(3,'Animation'),(4,'Biography'),(5,'Comedy'),(6,'Crime'),(7,'Documentary'),(8,'Drama'),(9,'Family'),(10,'Fantasy'),(11,'Film-noir'),(12,'History'),(13,'Horror'),(14,'Music'),(15,'Magic realism'),(16,'Mystery'),(17,'Paranoid'),(18,'Philosophical'),(19,'Political'),(20,'Romance'),(21,'Sci-Fi'),(22,'Sport'),(23,'Thriller'),(24,'War'),(25,'Western');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre_movie`
--

DROP TABLE IF EXISTS `genre_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre_movie` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `genreid` int(10) NOT NULL,
  `movieid` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `genre_mapping` (`genreid`),
  KEY `genre_movie` (`movieid`),
  CONSTRAINT `genre_mapping` FOREIGN KEY (`genreid`) REFERENCES `genre` (`genreid`),
  CONSTRAINT `genre_movie` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre_movie`
--

LOCK TABLES `genre_movie` WRITE;
/*!40000 ALTER TABLE `genre_movie` DISABLE KEYS */;
INSERT INTO `genre_movie` VALUES (1,1,1),(2,2,1),(3,21,1),(4,23,1),(5,1,2),(6,2,2),(7,10,2),(8,8,3),(9,21,3),(10,23,3),(11,1,4),(12,8,4),(14,23,4),(15,23,5),(16,21,5),(17,1,5),(18,8,5),(19,8,6),(20,1,6),(21,21,6),(22,23,6),(23,13,6),(24,4,7),(25,8,7),(26,12,7),(27,23,7),(28,4,8),(29,8,8),(30,12,8),(113,21,4);
/*!40000 ALTER TABLE `genre_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `movieid` int(10) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `imageurl` varchar(100) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`movieid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'The Hunger Games: Catching Fire','http://www.thehungergamesexplorer.com/us/epk/catching-fire/','146 min','English',8.2,'http://ia.media-imdb.com/images/M/MV5BMTAyMjQ3OTAxMzNeQTJeQWpwZ15BbWU4MDU0NzA1MzAx._V1_SX640_SY720_.','2013-11-13','THE HUNGER GAMES: CATCHING FIRE begins as Katniss Everdeen has returned home safe after winning the 74th Annual Hunger Games along with fellow tribute Peeta Mellark. Winning means that they must turn around and leave their family and close friends, embarking on a \"Victor\'s Tour\" of the districts. Along the way Katniss senses that a rebellion is simmering, but the Capitol is still very much in control as President Snow prepares the 75th Annual Hunger Games (The Quarter Quell) - a competition that could change Panem forever. '),(2,'Thor: The Dark World','http://marvel.com/thor#/home','112 min','English',7.6,'http://ia.media-imdb.com/images/M/MV5BMTQyNzAwOTUxOF5BMl5BanBnXkFtZTcwMTE0OTc5OQ@@._V1_SX640_SY720_.','2013-11-08','Marvel\'s \"Thor: The Dark World\" continues the big-screen adventures of Thor, the Mighty Avenger, as he battles to save Earth and all the Nine Realms from a shadowy enemy that predates the universe itself. In the aftermath of Marvel\'s \"Thor\" and \"Marvel\'s The Avengers,\" Thor fights to restore order across the cosmos...but an ancient race led by the vengeful Malekith returns to plunge the universe back into darkness. Faced with an enemy that even Odin and Asgard cannot withstand, Thor must embark on his most perilous and personal journey yet, one that will reunite him with Jane Foster and force him to sacrifice everything to save us all. '),(3,'Gravity','http://gravitymovie.warnerbros.com/','91 min','English',8.5,'http://ia.media-imdb.com/images/M/MV5BNjE5MzYwMzYxMF5BMl5BanBnXkFtZTcwOTk4MTk0OQ@@._V1_SX640_SY720_.','2013-08-31','A medical engineer and an astronaut work together to survive after an accident leaves them adrift in space.'),(4,'Elysium','http://www.itsbetterupthere.com/site/','109 min','English',6.8,'http://ia.media-imdb.com/images/M/MV5BNDc2NjU0MTcwNV5BMl5BanBnXkFtZTcwMjg4MDg2OQ@@._V1_SX640_SY720_.','2013-08-09','In the year 2154, the very wealthy live on a man-made space station while the rest of the population resides on a ruined Earth. A man takes on a mission that could bring equality to the polarized worlds.'),(5,'Iron Man 3','http://marvel.com/ironman3','130 min','English',7.4,'http://ia.media-imdb.com/images/M/MV5BMjIzMzAzMjQyM15BMl5BanBnXkFtZTcwNzM2NjcyOQ@@._V1_SX640_SY720_.','2013-05-03','When Tony Stark\'s world is torn apart by a formidable terrorist called the Mandarin, he starts an odyssey of rebuilding and retribution.'),(6,'World War Z','http://www.worldwarzmovie.com/','116 min','English',7.1,'http://ia.media-imdb.com/images/M/MV5BMTg0NTgxMjIxOF5BMl5BanBnXkFtZTcwMDM0MDY1OQ@@._V1_SX640_SY720_.','2013-06-21','United Nations employee Gerry Lane traverses the world in a race against time to stop the Zombie pandemic that is toppling armies and governments, and threatening to destroy humanity itself.'),(7,'Argo','http://argothemovie.warnerbros.com/','120 min','English',7.8,'http://ia.media-imdb.com/images/M/MV5BMTc3MjI0MjM0NF5BMl5BanBnXkFtZTcwMTYxMTQ1OA@@._V1_SX640_SY720_.','2012-10-12','Acting under the cover of a Hollywood producer scouting a location for a science fiction film, a CIA agent launches a dangerous operation to rescue six Americans in Tehran during the U.S. hostage crisis in Iran in 1980.'),(8,'The Kings Speech ','http://www.kingsspeech.com/','118 min','English',8.1,'http://ia.media-imdb.com/images/M/MV5BMzU5MjEwMTg2Nl5BMl5BanBnXkFtZTcwNzM3MTYxNA@@._V1_SX640_SY720_.','2010-12-24','The story of King George VI of the United Kingdom of Great Britain and Northern Ireland, his impromptu ascension to the throne and the speech therapist who helped the unsure monarch become worthy of it.'),(9,'The Wolf of Wall Street','http://www.rottentomatoes.com/m/the_wolf_of_wall_street_2013/','165 min','English',NULL,'http://content7.flixster.com/movie/11/17/49/11174981_det.jpg','2013-12-25','Martin Scorsese reteams with Leonardo DiCaprio on this adaptation of Jordan Belfort\'s memoir surrounding his indulgent ride as a crooked banker made headlines in the 1990\'s. Terrence Winter provides the screenplay. Jonah Hill and Oscar-winner Jean Dujardin co-star. ~ Jeremy Wheeler, Rovi'),(10,'Anchorman 2: The Legend Continues',NULL,'119 min','English',NULL,'http://content9.flixster.com/movie/11/17/43/11174343_det.jpg','2013-12-18','With the 70\'s behind him, San Diego\'s top rated newsman, Ron Burgundy (Will Ferrell), returns to the news desk in \"Anchorman 2: The Legend Continues.\" Also back for more are Ron\'s co-anchor and wife, Veronica Corningstone (Christina Applegate), weather man Brick Tamland (Steve Carell), man on the street Brian Fantana (Paul Rudd) and sports guy Champ Kind (David Koechner) - All of whom won\'t make it easy to stay classy...while taking the nation\'s first 24-hour news channel by storm. (c) Paramount');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `names`
--

DROP TABLE IF EXISTS `names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `names` (
  `nameid` int(10) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `middlename` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`nameid`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `names`
--

LOCK TABLES `names` WRITE;
/*!40000 ALTER TABLE `names` DISABLE KEYS */;
INSERT INTO `names` VALUES (1,'Francis','Lawrence',NULL),(2,'Simon','Beaufoy',NULL),(3,'Jennifer','Lawrence',NULL),(4,'Liam','Hemsworth',NULL),(5,'Jack','Quaid','Henry'),(6,'Taylor','St. Clair',NULL),(7,'Alan','Taylor',NULL),(8,'James','Gunn',NULL),(9,'Chris','Hemsworth',NULL),(10,'Natalie','Portman',NULL),(11,'Anthony','Hopkins',NULL),(12,'Christopher','Eccleston',NULL),(13,'Alfonso','Orozco','Cuarón'),(14,'Sandra','Bullock',NULL),(15,'George','Clooney','Timothy'),(16,'Neill','Blomkamp',NULL),(17,'Matthew','Damon','Paige'),(18,'Jodie','Foster','Christian'),(19,'Shane','Black',NULL),(20,'Robert','Downey Jr.',NULL),(21,'Gwyneth','Paltrow',NULL),(22,'Don','Cheadle',NULL),(23,'Rebecca','Hall','Maria'),(24,'Marc','Forster',NULL),(25,'Brad','Pitt',NULL),(26,'Mireille','Enos',NULL),(27,'James','Dale','Badge'),(28,'Benjamin','Affleck','Geza'),(29,'Bryan','Cranston','Lee'),(30,'Alan','Arkin',NULL),(31,'John','Goodman','Stephen'),(32,'Tom','Hooper',NULL),(33,'Colin','Firth',NULL),(34,'Helena','Carter','Bonham'),(35,'Derek','Jacobi',NULL),(36,'Iain','Canning',NULL),(37,'Alexandre','Desplat',NULL),(38,'Ian','Bryce',NULL),(39,'Marco','Beltrami',NULL),(40,'Shruthi','Sambasivan',NULL),(41,'Agastheswar','Suribatla',NULL),(42,'Paul','Soiya',NULL),(43,'Arthur ','Ribeiro',NULL),(44,'Neuenschwander9 ','Neuenschwander9 ',NULL),(45,' lbrosprod',' lbrosprod',NULL),(46,'stargatesam ','stargatesam ',NULL),(47,' icannothit',' icannothit',NULL),(48,' Tania ',' M',NULL),(49,' vikascoder',' vikascoder',NULL),(50,' lornloxor',' lornloxor',NULL),(51,'Efrain ','Sanchez',NULL),(52,' deflep318',' deflep318',NULL),(53,' BeatleFloydZeppelin',' BeatleFloydZeppelin',NULL),(54,'Tyferra','Tyferra',NULL),(55,' xanderfaulk','629-298488',NULL),(56,'Jonathan','Russell ',NULL),(57,'SampanMassacre','SampanMassacre',NULL),(58,' Colinrocks',' Colinrocks',NULL),(59,' John','desando',NULL),(70,'az','az',NULL),(131,'a','b',NULL),(132,'az','aerer',NULL),(133,'a','v',NULL);
/*!40000 ALTER TABLE `names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screens`
--

DROP TABLE IF EXISTS `screens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screens` (
  `screen_id` int(10) NOT NULL,
  `screen` varchar(20) DEFAULT NULL,
  `timings` time DEFAULT NULL,
  PRIMARY KEY (`screen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screens`
--

LOCK TABLES `screens` WRITE;
/*!40000 ALTER TABLE `screens` DISABLE KEYS */;
/*!40000 ALTER TABLE `screens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studio`
--

DROP TABLE IF EXISTS `studio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studio` (
  `studioid` int(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `year` year(4) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `studio_image_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`studioid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studio`
--

LOCK TABLES `studio` WRITE;
/*!40000 ALTER TABLE `studio` DISABLE KEYS */;
INSERT INTO `studio` VALUES (1,'Warner Bros.',NULL,'US',NULL),(2,'GK Films',NULL,'US',NULL),(3,'The Weinstein Company',NULL,'US',NULL),(4,'UK Film Council',NULL,'Great Britain',NULL),(5,'Color Force',NULL,'US',NULL),(6,'Lionsgate',NULL,'US',NULL),(7,'Marvel Studios',NULL,'US',NULL),(8,'Esperanto Filmoj',NULL,'US',NULL),(9,'Heyday Films',NULL,'Great Britain',NULL),(10,'TriStar Pictures ',NULL,'US',NULL),(11,'Sony Pictures Entertainment',NULL,'US',NULL),(12,'DMG Entertainment',NULL,'US',NULL),(13,'Paramount Pictures',NULL,'US',NULL),(14,'Skydance Productions',NULL,'US',NULL);
/*!40000 ALTER TABLE `studio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studio_movie`
--

DROP TABLE IF EXISTS `studio_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studio_movie` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `studioid` int(10) NOT NULL,
  `movieid` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `studio_mapping` (`studioid`),
  KEY `studio_movie` (`movieid`),
  CONSTRAINT `studio_mapping` FOREIGN KEY (`studioid`) REFERENCES `studio` (`studioid`),
  CONSTRAINT `studio_movie` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studio_movie`
--

LOCK TABLES `studio_movie` WRITE;
/*!40000 ALTER TABLE `studio_movie` DISABLE KEYS */;
INSERT INTO `studio_movie` VALUES (1,1,7),(2,2,7),(3,3,8),(4,4,8),(5,5,1),(6,6,1),(7,7,2),(8,8,3),(9,9,3),(10,10,4),(11,11,4),(12,7,5),(13,12,5),(14,13,5),(15,13,6),(16,14,6),(17,2,6);
/*!40000 ALTER TABLE `studio_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theater`
--

DROP TABLE IF EXISTS `theater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theater` (
  `theaterid` int(10) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`theaterid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater`
--

LOCK TABLES `theater` WRITE;
/*!40000 ALTER TABLE `theater` DISABLE KEYS */;
INSERT INTO `theater` VALUES (1,'Harkins Theatre','Chandler','Chandler Crossroads 12','http://www.harkinstheatres.com/'),(2,'Harkins Theatre','Chandler','Chandler Fashion Center 20','http://www.harkinstheatres.com/'),(3,'AMC','Ahwatukee','4915 East Ray Rd., Phoenix AZ 85044','https://www.amctheatres.com/'),(4,'Pollack Cinemas','Tempe ','1825 E Elliot Rd, Tempe, AZ 85284','http://www.pollacktempecinemas.com/'),(5,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `theater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theater_movie`
--

DROP TABLE IF EXISTS `theater_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theater_movie` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `theater_id` int(10) NOT NULL,
  `movie_id` int(10) NOT NULL,
  `timings` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `theater_mapping` (`theater_id`),
  KEY `movie_mappings` (`movie_id`),
  CONSTRAINT `movie_mappings` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movieid`),
  CONSTRAINT `theater_mapping` FOREIGN KEY (`theater_id`) REFERENCES `theater` (`theaterid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater_movie`
--

LOCK TABLES `theater_movie` WRITE;
/*!40000 ALTER TABLE `theater_movie` DISABLE KEYS */;
INSERT INTO `theater_movie` VALUES (1,2,1,'9:50 AM , 10:40 AM , 11:30 AM , 12:20 PM , 1:10 PM , 2:00 PM , 2:50 PM , 3:40 PM , '),(2,2,2,'1:05 PM , 3:55 PM , 6:45 PM , 9:40 PM'),(3,1,1,'9:30 AM , 10:30 AM , 11:30 AM , 12:50 PM , 1:50 PM , 4:10 PM , 5:10 PM , 6:10 PM '),(4,1,2,'11:00 AM , 1:30 PM , 4:20 PM , 7:20 PM , 10:10 PM');
/*!40000 ALTER TABLE `theater_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trailer`
--

DROP TABLE IF EXISTS `trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trailer` (
  `trailerid` int(10) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `website_url` varchar(100) DEFAULT NULL,
  `movieid` int(10) NOT NULL,
  `duration` varchar(10) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  PRIMARY KEY (`trailerid`),
  KEY `trailer_movie_id` (`movieid`),
  CONSTRAINT `trailer_movie_id` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trailer`
--

LOCK TABLES `trailer` WRITE;
/*!40000 ALTER TABLE `trailer` DISABLE KEYS */;
INSERT INTO `trailer` VALUES (1,'Watch Trailer','http://www.rottentomatoes.com/m/the_hunger_games_catching_fire/trailers/',1,'1:06','2013-11-22'),(2,'Watch Trailer','http://www.imdb.com/title/tt0800369/',2,'2:30','2011-05-06'),(3,'Watch Trailer','http://www.imdb.com/title/tt1454468/',3,'2:22','2013-08-31'),(4,'Watch Trailer','http://www.imdb.com/title/tt1535108/',4,'3:13',NULL),(5,'Watch Trailer','http://www.imdb.com/title/tt1300854/',5,'2:30',NULL),(6,'Watch Trailer','http://www.imdb.com/title/tt0816711/',6,'2:31',NULL),(7,'Watch Trailer','http://www.imdb.com/title/tt1024648/',7,'2:32',NULL),(8,'Watch Trailer','http://www.imdb.com/title/tt1504320/',8,'2:10',NULL),(9,'Watch Trailer','http://www.firstshowing.net/2013/must-watch-martin-scorseses-wolf-of-wall-street-second-full-trailer',9,NULL,NULL),(10,'Watch Trailer','http://www.youtube.com/watch?v=NzNUkWFDuKQ',10,NULL,NULL);
/*!40000 ALTER TABLE `trailer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_review_rating`
--

DROP TABLE IF EXISTS `user_review_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_review_rating` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `movieid` int(10) NOT NULL,
  `review` text,
  `rating` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`userid`),
  KEY `movie_rating` (`movieid`),
  CONSTRAINT `movie_rating` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  CONSTRAINT `user_id` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_review_rating`
--

LOCK TABLES `user_review_rating` WRITE;
/*!40000 ALTER TABLE `user_review_rating` DISABLE KEYS */;
INSERT INTO `user_review_rating` VALUES (1,4,1,'Let the flames begin... The Hunger Games: Catching Fire not only improves vastly upon it\'s predecessor: it\'s a great cinematic experience by itself, touching on important topics about the modern day society without losing it\'s thrilling core. It\'s not perfect, but what it does right it goes right into the bullseye. Don\'t let the hype or the teen fury on this fool you: it is entertainment at it\'s best.',9),(2,5,1,'The story is filled with emotional subtexts which move at breakneck speed throughout the length of the film, constantly switching gears between the palettes of emotions. The dialogs exude class and confidence holding grip of the story yet laced with the finesse that allows for emotional drama combined with spiritual uprising, casting a dark satire on the entire system and its treatment of identities. The script penned by Collins is one of par excellence, allowing the audience to blend into Katniss through her smiles and tears, laugh in her joy and cringe with every blow dealt to her. The screenplay drops hypocritical moral ambitions to make scathingly relevant comments on modern outlook of the world, making it rise several notches above anything attempted in modern-day Hollywood.',10),(3,6,1,'Visually Stunning. Beautifully Tragic. A Masterpiece. (A book fan review). Without a shadow of a doubt, this movie, Catching Fire, really does catch fire and immerses the audience in the Hunger Games. I was truly speechless after the film because it was just so beautiful and satisfying. You don\'t want to miss the best film of the year, and possibly the highest grossing film of all time!!!',10),(4,7,2,'Just Wonderful! Packed with action, heartfelt emotion, humor, drama and intensity. Needless to say, I thoroughly enjoyed this movie. Each frame is packed with action, heartfelt emotion, humor, drama or intensity. I was expecting to simply see crazy mythology with monsters destroying the landscape of the nine realms for two hours. Instead, I was shocked at the depth and complexity of this film. You definitely need your brain and your heart turned on for this one, unlike other CGI mishmashes. If you want a movie with just dumb action and no plot then stay away from this exceptional film. The performances are top tier and the visual effects may be the best I\'ve seen this year. I have to join the majority of people and even critics that are praising this film. It\'s a true joy and such a pleasant experience',9.2),(5,8,2,'Marvel has out done themselves again. Great Film! I knew they would nail the pathos but was pleasantly surprised by the creative fight sequences. They are phenomenal. Not overly long but when they rage, THEY RAGE. Also, Kurse can rival the Hulk in terms of scary power. He was better utilized than the Destroyer was in the first film. Loki is the scene stealer that was all hoped to see! Jane and Sif add more than eye candy but you would expect no less from Marvel. Hemsworth has cemented his legend as Thor with this effort. My only real disappointed is a minor one. They didn\'t really show the nine realms in any real detail. It seemed a cop out that hey\'re just open landscapes. Yet, maybe they didn\'t want to commit to anything for future movies.',8.5),(6,9,3,'Outstanding Sci-Fi Film Big science fiction films are all the rage this year (Oblivion, Elysium, Pacific Rim...) and Gravity is finally one worth watching. From the trailers I had no idea what to expect. George Clooney and Sandra Bullock floating around in space for two hours eventually became my best guess. I rushed the film at the Toronto International Film Festival and when someone said they were showing it in 3D, I was half tempted to leave the line. I hate 3D movies, they give me awful headaches and I don\'t see the point of them. As soon as Gravity started, I changed my mind.',9),(7,10,3,'On every other front,the movie falters badly. Once you get over the initial wonderment surrounding the beautiful visuals, the chinks start showing up. Overall the script is very weak. Apparently the Russians bomb their own satellite by mistake and the debris is flying around at bullet speed, smashing everything in its way. Now upon hearing an emergency evacuation request, Kowalski (who has been wasting his precious thrusters all this while, floating around, spouting inane dialogs) orders Ryan (Bullock) to disengage from whatever she is repairing. Apparently Ryan has six months of training (only) and fails to be responsive and then the trouble starts.',7),(8,11,4,'Elysium is visually gorgeous but its story and characters left me cold and disappointed. The action in this film is quite intense and it looks very impressive at times. The exoskeletons were fun and looked convincing. Then comes the shaky cam. Oh boy. It\'s really quite annoying and very often it\'s hard to see what\'s going on. They should\'ve really taken a page from the Bourne movies on how to shoot action scenes. Luckily the shaky cam isn\'t there all the time but the action could\'ve definitely been improved with a clearer shooting style.',6),(9,12,4,'It is flawed and by no means anywhere near on the same level as D9 but its solid entertainment and a smarter than average sci/fi film. Like District 9 it delivers on the the beautiful imagery. Using the very best Weta Workshop has to offer. From its big guns to the human-like robots, to the space station of Elysium. The action set pieces were just as exciting as its predecessor. The film really manages to capture all its budget on screen. My biggest issue comes from the excessive use of shaky cam. It was used when the characters were simply walking to the action sequences. I felt ninety percent of this film was shaky cam. Which got me a little dizzy since I ,unfortunately, got to sit in the very front of the theater. That might have something to do with it as well.',7),(10,13,5,'I do not understand how this script was OK\'d by Marvel. This was a Tony Stark story, not an Iron Man Story It appears that Tony must have got some shield training because now the rich guy that only knows how to blast people and tackle people acts more like a cross between Macguyver and Hawkeye then Iron Man.',4),(11,14,5,'Better than I expected, but worse than I\'d hoped.The first Iron Man movie changed the way comic book adaptions were made. It (for better or worse) began the \"Marvel Cinematic Universe\" that climaxed with The Avengers. This is the first marvel movie to be released after The Avengers, and in many ways it proves that the series is still going strong, however, it is far from perfect.',5),(12,15,6,'A zombie film that lacks bite. It seems unfair to criticise the film for not being like its source material given that it obviously didn\'t try to be but I\'m going to start by bringing that up anyway. The book had so many sequences that could have been turned into amazing set-pieces in a film and yet not one of them were used. The book also had some neat ideas about how a global outbreak and response play out. What might work? What would catastrophically fail? What would the cost be? Not one of these ideas were explored or even alluded to and there seems absolutely no reason why this was the case.',5),(13,16,6,'The Most Marketable Movie Ever Made...What this movie truly is, is a shamefully mediocre attempt to create a movie that appeals to the widest audience possible. Pee established fan base from the book? Check. Star power (this is Brad Pitt)? Check. Focuses on intensity rather than horror and gore to not alienate non zombie fans? Check. Safe, young PG 13 rating? Check. All the makings are here because this is what the big Hollywood studio wanted. Despite the fact this movie doesn\'t resemble the book at all, it appears that those attached to make this movie tried to make a decent movie such as the visually interesting director Marc Foster who wanted to make a movie with a message which would emulate the tone the book was going for.',4.5),(14,17,7,'Formulaic and historically inaccurate. A reasonably competent movies from a technical point of view, but in other respects very misleading.So, averagely enjoyable if it was fiction and a polished production from a acting and technical point of view, but a desperately inaccurate pastiche of what really happened - a great shame as the real story would have been just as good, if not better for being real.',3),(15,18,7,'The aspect about the fake film, that will provide a cover to save the hostages, is rushed, and although Alan Arkin has funny lines, there are very few obstacles for the characters to get that fake movie going... One step to another, all the characters seem to sleepwalk through each scene where people sit behind desks and talk to each other.',4),(16,19,8,'Superb drama of courage and humanity. I think I must have seen a different film from the previous two reviewers at Leeds on Friday. It is now two days ago and I am still feeling overwhelmed by what I saw. It is a very touching, and quite inspiring story about a man, psychologically scarred, and trapped in a situation from which he could have no escape and facing it with immense courage. It so happens that he was royal, and that was a large part of his problem- but the film isn\'t so much about royalty as a human story. The film conveyed very powerfully in the opening scene, the enormity of what was required of him. As the film develops, the complexities of the character are revealed. The acting is superb, especially from the three principals, and the development of the troubled and sparky relationship at the heart of the film is a joy to watch. The film is very funny and the characters have warmth and humanity. The film is well paced, and carries you along to the emotional climax, so that, even though I knew the story, it had me holding my breath. If you don\'t need lots of action or special effects in your film, and enjoy seeing top-notch actors at the very peak of their craft, this will be for you. You might also, as I did, gain a bit more insight into the human drama behind a significant, but relatively unexplored period of British history.',10),(17,20,8,'You heard it from me: Not even James Franco with his boffo performance in 127 Hours can beat Colin Firth for the Oscar in King\'s Speech, a docudrama about the Duke of York (Firth) becoming King George VI while overcoming a crushing stutter. Not only does the actor get pitch perfect the stutter, but he also invests a kindness, courage, and vulnerability in the character that work in harmony to create an unforgettable George in an exquisite period peace.',10),(19,71,1,'Good movie.',8);
/*!40000 ALTER TABLE `user_review_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` int(10) NOT NULL AUTO_INCREMENT,
  `user_names_id` int(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `emailid` varchar(50) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `user_name_id` (`user_names_id`),
  CONSTRAINT `user_name_id` FOREIGN KEY (`user_names_id`) REFERENCES `names` (`nameid`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,40,'movie admin','shruthi','ssambasi@asu.edu'),(2,41,'user admin','eswar','asuribha@asu.edu'),(3,42,'database admin','soiya','psoiya@asu.edu'),(4,43,'arthur','ribeiro','arthurjf1211@hotmail.com'),(5,44,'Neuenschwander9 ','abc','reach@moviedb.com'),(6,45,' lbrosprod',' lbrosprod','test0@moviedb.com'),(7,46,' stargatesam ',' stargatesam ','test1@moviedb.com'),(8,47,' icannothit',' icannothit','test2@moviedb.com'),(9,48,' Tania M',' Tania M','tancheck@moviedb.com'),(10,49,' vikascoder',' vikascoder','vikas@moviedb.com'),(11,50,' lornloxor',' lornloxor','lomloxor@moviedb.com'),(12,51,'Sanchez','Sanchez','sanchez@moviedb.com'),(13,52,'deflep318',' deflep318','reviewer@moviedb.com'),(14,53,' BeatleFloydZeppelin',' BeatleFloydZeppelin','zeppelin@moviedb.com'),(15,54,'Tyferra','Tyferra','tyferra@moviedb.com'),(16,55,' xanderfaulk','629-298488','checkfaulk@moviedb.com'),(17,56,' Russell ',' Russell ','woodiphora@gmail.com'),(18,57,'SampanMassacre','SampanMassacre','sampan@moviedb.com'),(19,58,' Colinrocks',' Colinrocks','colin@moviedb.com'),(20,59,'desando','desando','jdesando@columbus.rr.com'),(50,0,'az','az','az@az.com'),(71,132,'azer','aa','aa33@waoeuuwor.com'),(72,133,'aaaa','aaaa','aaaa@werwer.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-10 20:50:11
