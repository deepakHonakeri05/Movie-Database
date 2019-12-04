-- MySQL dump 10.13  Distrib 8.0.18, for osx10.13 (x86_64)
--
-- Host: localhost    Database: movieProject
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('aobsusn1pqqs8b47sznn2aaxotiggtso','MzZlZWIyZjhkMzcxZTkyMWRmNGExNWMyZjk3NmM0YmZjZDU4ZjI2Mjp7InVzZXJfaWQiOm51bGx9','2019-11-24 14:18:09.569749');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_actor`
--

DROP TABLE IF EXISTS `movie_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_actor` (
  `act_id` int(11) NOT NULL,
  `act_name` varchar(50) NOT NULL,
  `act_gender` varchar(1) NOT NULL,
  `act_bio` varchar(10000) NOT NULL,
  `act_picURL` varchar(500) NOT NULL,
  PRIMARY KEY (`act_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_actor`
--

LOCK TABLES `movie_actor` WRITE;
/*!40000 ALTER TABLE `movie_actor` DISABLE KEYS */;
INSERT INTO `movie_actor` VALUES 
(1,'Leonardo DiCaprio','m','Leonardo Wilhelm DiCaprio (/dɪˈkæprioʊ/, Italian: [diˈkaːprjo]; born November 11, 1974) is an American actor, film producer, and environmentalist. His accolades include an Academy Award and three Golden Globe Awards. Born in Los Angeles, DiCaprio began his career by appearing in television commercials in the late 1980s. In the early 1990s, he played recurring roles in various television series, such as the soap opera Parenthood. He had his first major film role in This Boy\'s Life, and received acclaim for the supporting role of a developmentally disabled boy in What\'s Eating Gilbert Grape (both 1993), which earned him an Academy Award nomination. He achieved international fame as a star in the epic romance Titanic (1997), which became the highest-grossing film to that point. After a brief setback, DiCaprio starred in two critically acclaimed films in 2002—the biographical crime drama Catch Me If You Can and the historical drama Gangs of New York, which marked his first of many collaborations with director Martin Scorsese. DiCaprio subsequently earned nominations for the Academy Award for Best Actor for the roles of Howard Hughes in The Aviator (2004) and a mercenary in the political thriller Blood Diamond (2006), and also received acclaim for his roles in the crime drama The Departed (2006) and the romantic drama Revolutionary Road (2008). In the 2010s, he starred in the science fiction thriller Inception (2010), the western Django Unchained (2012), the biopic The Wolf of Wall Street, the survival drama The Revenant—for which he earned an Academy Award and a BAFTA Award for Best Actor in a Leading Role—and the comedy-drama Once Upon a Time in Hollywood (2019). DiCaprio is the founder of the production company, Appian Way Productions, which has produced some of his own films, including The Aviator and The Wolf of Wall Street, and the television show, Greensburg (2008–2010).','https://www.onthisday.com/images/people/leonardo-dicaprio-medium.jpg'),
(2,'Ellen Page','f','Ellen Grace Philpotts-Page[1] (born February 21, 1987)[2][3] is a Canadian actress and producer. Her career began with roles in television shows such as Pit Pony, Trailer Park Boys and ReGenesis. She starred in the 2005 drama Hard Candy, for which she won the Austin Film Critics. Association\'s Award for Best Actress. Her breakthrough role was the title role in Jason Reitman\'s film Juno (2007), for which she received nominations for an Academy Award, a BAFTA, a Golden Globe and a Screen Actors Guild Award for Best Actress and won the Independent Spirit Award, an MTV Movie Award and a Teen Choice Award. Page played Kitty Pryde in the X-Men films (2006, 2014). She also appeared in An American Crime (2007), The Tracey Fragments (2007) – a role that won her the Vancouver Film Critics Award for Best Actress – Smart People (2008), Whip It (2009), Super (2010) and Inception (2010). She provided the voice, motion capture and likeness of Jodie Holmes in the video game Beyond: Two Souls (2013). In 2017, she was cast as Vanya Hargreeves in the Netflix series The Umbrella Academy.','https://media.wmagazine.com/photos/5a92cc10e9cff16a6c3be3e3/master/pass/ellen-page.jpeg'),
(3,'Joaquin Phoenix','m','Joaquin Rafael Phoenix (/hwɑːˈkiːn/; né Bottom; born October 28, 1974)[a][3] is an American actor, producer, and activist, who has received several accolades, including a Grammy Award, a Golden Globe Award and nominations for three Academy Awards. Phoenix started acting in television series with his brother River Phoenix and sister Summer Phoenix. His first major film role was in SpaceCamp (1986). During this period he was credited as Leaf Phoenix, his self-given name. He later went back to his birth name, Joaquin, and received positive reviews for his supporting work in several films, including To Die For (1995) and the period film Quills (2000). He received wider attention for his portrayal of Commodus in the 2000 historical epic film Gladiator, which earned him a nomination for the Academy Award for Best Supporting Actor. He has subsequently earned Best Actor nominations for portraying musician Johnny Cash in the biopic Walk the Line (2005) and for his role as a sex-obsessed alcoholic in the drama The Master (2012), which also won him the Volpi Cup for Best Actor. Phoenix\'s other films include the horror films Signs (2002) and The Village (2004), the historical drama Hotel Rwanda (2004), the romantic drama Her (2013), and the crime satire Inherent Vice (2014). He gained further acclaim for playing an assassin in You Were Never Really Here (2017), for which he won the Cannes Film Festival Award for Best Actor, and the titular character in Joker (2019). Phoenix has also ventured into directing music videos, as well as producing films and television shows. For recording the soundtrack to Walk the Line, he won the Grammy Award for Best Compilation Soundtrack for Visual Media. Phoenix is a social activist, lending his support to a number of charities and humanitarian organizations. He is on the board of directors for The Lunchbox Fund, a non-profit organization which provides daily meals to students of township schools in Soweto of South Africa. Phoenix is also known for his animal rights advocacy. He has been a vegan since the age of three and campaigns for PETA and In Defense of Animals.[4][5]','https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Joaquin_Phoenix_at_the_2018_Berlin_Film_Festival.jpg/440px-Joaquin_Phoenix_at_the_2018_Berlin_Film_Festival.jpg'),
(4,'Kate Winslet','f','Kate Elizabeth Winslet CBE (born 5 October 1975) is an English actress. She is particularly known for her work in period dramas and tragedies, and is often drawn to portraying troubled women. Winslet is the recipient of various accolades, including three British Academy Film Awards, and is among the few performers to have won Academy, Emmy, and Grammy Awards.\r\n\r\nBorn in Reading, Berkshire, Winslet studied drama at the Redroofs Theatre School. Her first screen appearance, at the age of 15, was in the British television series Dark Season (1991). She made her film debut playing a teenage murderess in Heavenly Creatures (1994), and received her first BAFTA Award for playing Marianne Dashwood in Sense and Sensibility (1995). Global stardom followed soon after with her leading role in the epic romance Titanic (1997). It was the highest-grossing film of all time to that point, after which she eschewed parts in blockbusters in favour of critically acclaimed period pieces, including Quills (2000) and Iris (2001), which were not widely seen.','https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Kate_Winslet_at_the_2017_Toronto_International_Film_Festival_%28cropped%29.jpg/440px-Kate_Winslet_at_the_2017_Toronto_International_Film_Festival_%28cropped%29.jpg'),
(5,'Robert Downey Jr','m','Robert John Downey Jr. (born April 4, 1965)[1] is an American actor, producer, and singer. His career has been characterized by critical and popular notoriety in his youth, followed by a period of substance abuse and legal troubles, before a resumption of critical repute and resurgence of commercial success in middle age. In 2008, Downey was named by Time magazine among the 100 most influential people in the world,[2][3] and from 2013 to 2015, he was listed by Forbes as Hollywood\'s highest-paid actor.[2][4] His films have grossed over $5.8 billion in North America and over $14.4 billion worldwide,[5] making him the second-highest-grossing box-office actor to date both domestically and worldwide.[6]\r\n\r\nAt the age of five, he made his acting debut in Robert Downey Sr.\'s film Pound in 1970. His subsequently worked with the Brat Pack in the teen films Weird Science (1985) and Less Than Zero (1987). In 1992, Downey portrayed the title character in the biopic Chaplin, for which he was nominated for the Academy Award for Best Actor and won a BAFTA Award. Following a stint at the Corcoran Substance Abuse Treatment Facility on drug charges, he joined the TV series Ally McBeal, for which he won a Golden Globe Award; however in the wake of two drug charges, one in late 2000 and one in early 2001, he was fired and his character terminated. He stayed in a court-ordered drug treatment program shortly after and has maintained his sobriety since 2003.','https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/robert-downey-jr-1553187348.jpg?crop=1.00xw:0.685xh;0,0.0523xh&resize=480:*'),
(6,'Aamir Khan','m','Mohammed Aamir Hussain Khan (pronounced [ˈaːmɪr ˈxaːn]; born 14 March 1965) is an Indian actor, director, filmmaker and television talk-show host. Through his career spanning over thirty years in Hindi films, Khan has established himself as one of the most popular and influential actors of Indian cinema.[2][3] He has a large global following, especially in Southern Asia and Greater China, and has been described by Newsweek as \"the biggest movie star\"[4][5] in the world.[6][7][8] Khan is the recipient of numerous awards, including nine Filmfare Awards, four National Film Awards, and an AACTA Award, as well as an Academy Award nomination. He was honoured by the Government of India with the Padma Shri in 2003 and the Padma Bhushan in 2010,[9] and received an honorary title from the Government of China in 2017.[10]\r\n\r\nKhan first appeared on screen as a child actor in his uncle Nasir Hussain\'s film Yaadon Ki Baaraat (1973). As an adult, his first feature film role was in the experimental film Holi (1984), and he began a full-time acting career with a leading role in the tragic romance Qayamat Se Qayamat Tak (1988). His performance in the film and in the thriller Raakh (1989) earned him a National Film Award in the Special Mention category. He established himself as a leading actor of Hindi cinema in the 1990s by appearing in a number of commercially successful films, including the romantic dramas Dil (1990) and Raja Hindustani (1996), for which he won his first Filmfare Award for Best Actor, and the thriller Sarfarosh (1999).[11][12] He also played against type in the acclaimed Canadian-Indian co-production 1947: Earth (1998).[13]','https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Aamir_Khan_From_The_NDTV_Greenathon_at_Yash_Raj_Studios_%2811%29.jpg/440px-Aamir_Khan_From_The_NDTV_Greenathon_at_Yash_Raj_Studios_%2811%29.jpg'),
(12,'Vijay','m','C. Joseph Vijay[2] (born 22 June 1974[1]) is an Indian film actor and playback singer who works in Tamil cinema. He is one of the highest paid actors in the industry,[3] and is referred to by fans and media as Thalapathy (commander).[4]\r\n\r\nAged ten, his first role was in the drama Vetri (1984); he continued to perform as a child artist in films until Ithu Engal Neethi (1988), directed by his father S. A. Chandrasekhar. He then featured as the lead in Naalaiya Theerpu (1992), again directed by his father. He received his breakthrough in the film Poove Unakkaga (1996), which was directed by Vikraman.[5][6] As of 2018, he has acted in 62 films as a lead actor and won numerous awards including three Tamil Nadu State Film Awards, one Cosmopolitan Award, one Indiatoday Award, one SIIMA Award, eight Vijay Awards, three Edison Awards, two Vikatan Awards and one National Award UK.[7]\r\n\r\nAs a playback singer, Vijay has sung over thirty songs in his films, starting with \"Bombay City\" (1994), also garnering European attention for his song \"Selfie Pulla\" in 2014.[8] He is also praised for his dance moves in his films.[9]','https://upload.wikimedia.org/wikipedia/commons/9/95/Vijay_at_Puli_Audio_Launch.jpg');
/*!40000 ALTER TABLE `movie_actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_director`
--

DROP TABLE IF EXISTS `movie_director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_director` (
  `dir_id` int(11) NOT NULL,
  `dir_name` varchar(50) NOT NULL,
  `dir_phone` int(11) NOT NULL,
  `dir_bio` varchar(500) NOT NULL,
  `dir_picURL` varchar(500) NOT NULL,
  PRIMARY KEY (`dir_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_director`
--

LOCK TABLES `movie_director` WRITE;
/*!40000 ALTER TABLE `movie_director` DISABLE KEYS */;
INSERT INTO `movie_director` VALUES 
(62,'Rajamouli',12345,'he did bahubali','http://www.forbesindia.com/media/images/2015/Dec/topimg_29083_ss_rajamouli.jpg'),
(66,'Bhavesh',123345,'Student at pes','http://icons.iconarchive.com/icons/dtafalonso/android-lollipop/512/Movie-Studio-icon.png'),
(68,'James',128394,'James Francis Cameron is a Canadian filmmaker and environmentalist, who is best known for making science fiction and epic films for the Hollywood mainstream. Cameron first gained recognition for directing The Terminator','https://cdn.britannica.com/84/160284-050-695B1DE3/James-Cameron-2012.jpg'),
(69,'Steven',1234223,'Steven Allan Spielberg (/ˈspiːlbɜːrɡ/; born December 18, 1946) is an American filmmaker.  considered the first summer blockbuster.[3] His subsequent releases focused typically on science fiction/adventure films such as Close Encounters of the Third Kind (1977), Raiders of the Lost Ark (1981), E.T. the Extra-Terrestrial (1982), and Jurassic Park (1993), which became archetypes of modern Hollywood escapist filmmaking.[4]','https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Steven_Spielberg_by_Gage_Skidmore.jpg/440px-Steven_Spielberg_by_Gage_Skidmore.jpg'),
(70,'Christopher',988787,'Christopher Edward Nolan, CBE is a British-American film director, screenwriter, and producer, who is known for making personal, distinctive films within the Hollywood mainstream. Having made his directorial debut with Following, Nolan gained considerable attention for his second feature Memento.','https://upload.wikimedia.org/wikipedia/commons/c/c4/Christopher_Nolan%2C_London%2C_2013_%28crop%29.jpg');
/*!40000 ALTER TABLE `movie_director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_movie_directedby`
--

DROP TABLE IF EXISTS `movie_movie_directedby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_movie_directedby` (
  `dir_id` int(11) NOT NULL,
  `mov_id` int(11) NOT NULL,
  PRIMARY KEY (`dir_id`,`mov_id`),
  KEY `mov_id` (`mov_id`),
  CONSTRAINT `movie_movie_directedby_ibfk_1` FOREIGN KEY (`dir_id`) REFERENCES `movie_director` (`dir_id`),
  CONSTRAINT `movie_movie_directedby_ibfk_2` FOREIGN KEY (`mov_id`) REFERENCES `movie_movies` (`mov_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_movie_directedby`
--

LOCK TABLES `movie_movie_directedby` WRITE;
/*!40000 ALTER TABLE `movie_movie_directedby` DISABLE KEYS */;
INSERT INTO `movie_movie_directedby` VALUES (62,101),(68,102),(62,103),(69,104),(70,104),(68,106),(70,107),(66,108),(66,109);
/*!40000 ALTER TABLE `movie_movie_directedby` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `less_2` AFTER INSERT ON `movie_movie_directedby` FOR EACH ROW BEGIN IF EXISTS((select mov_id, count(*) from movie_movie_directedby GROUP BY mov_id having count(mov_id) > 2)) THEN SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT='ACCES DENIED'; END IF; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `movie_movieactor_awards`
--

DROP TABLE IF EXISTS `movie_movieactor_awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_movieactor_awards` (
  `awards` varchar(50) NOT NULL,
  `act_id` int(11) NOT NULL,
  PRIMARY KEY (`awards`,`act_id`),
  KEY `act_id` (`act_id`),
  CONSTRAINT `movie_movieactor_awards_ibfk_1` FOREIGN KEY (`act_id`) REFERENCES `movie_actor` (`act_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_movieactor_awards`
--

LOCK TABLES `movie_movieactor_awards` WRITE;
/*!40000 ALTER TABLE `movie_movieactor_awards` DISABLE KEYS */;
INSERT INTO `movie_movieactor_awards` VALUES ('Best actor 2019',3),('Oscar award',3),('Soap opera',3),('Padmabhushan Award ',6),('lollipop award',12),('oscar',12),('Soap opera',12);
/*!40000 ALTER TABLE `movie_movieactor_awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_moviecast`
--

DROP TABLE IF EXISTS `movie_moviecast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_moviecast` (
  `role` varchar(30) DEFAULT NULL,
  `act_id` int(11) NOT NULL,
  `mov_id` int(11) NOT NULL,
  PRIMARY KEY (`act_id`,`mov_id`),
  KEY `mov_id` (`mov_id`),
  CONSTRAINT `movie_moviecast_ibfk_1` FOREIGN KEY (`act_id`) REFERENCES `movie_actor` (`act_id`),
  CONSTRAINT `movie_moviecast_ibfk_2` FOREIGN KEY (`mov_id`) REFERENCES `movie_movies` (`mov_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_moviecast`
--

LOCK TABLES `movie_moviecast` WRITE;
/*!40000 ALTER TABLE `movie_moviecast` DISABLE KEYS */;
INSERT INTO `movie_moviecast` VALUES ('Hero-lover',1,103),('Villan',1,108),('Girlfriend',2,108),('Queen',3,106),('Heronine',4,103),('Voice Actor',4,109),('Iron Man',5,101),('New - Iron Man',5,105),('Rancho - Lead',6,110),('Joker',12,106);
/*!40000 ALTER TABLE `movie_moviecast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_moviedirector_awards`
--

DROP TABLE IF EXISTS `movie_moviedirector_awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_moviedirector_awards` (
  `awards` varchar(50) NOT NULL,
  `dir_id` int(11) NOT NULL,
  PRIMARY KEY (`awards`,`dir_id`),
  KEY `dir_id` (`dir_id`),
  CONSTRAINT `movie_moviedirector_awards_ibfk_1` FOREIGN KEY (`dir_id`) REFERENCES `movie_director` (`dir_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_moviedirector_awards`
--

LOCK TABLES `movie_moviedirector_awards` WRITE;
/*!40000 ALTER TABLE `movie_moviedirector_awards` DISABLE KEYS */;
INSERT INTO `movie_moviedirector_awards` VALUES ('limca',62),('Soap opera',62),('Grammy award',68),('Soap Opera',68),('BAFTA Award',69),('Golden Globe Award',69),('Oscar',70);
/*!40000 ALTER TABLE `movie_moviedirector_awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_movies`
--

DROP TABLE IF EXISTS `movie_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_movies` (
  `mov_id` int(11) NOT NULL,
  `mov_title` varchar(50) NOT NULL,
  `mov_year` int(11) NOT NULL,
  `mov_lang` varchar(30) NOT NULL,
  `description` varchar(300) NOT NULL,
  `movie_picurl` varchar(100) NOT NULL,
  PRIMARY KEY (`mov_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_movies`
--

LOCK TABLES `movie_movies` WRITE;
/*!40000 ALTER TABLE `movie_movies` DISABLE KEYS */;
INSERT INTO `movie_movies` VALUES 
(101,'Avengers : End Game',2019,'English','After Thanos, an intergalactic warlord, disintegrates half of the universe, the Avengers must reunite and assemble again to reinvigorate their trounced allies and restore balance.','https://img01.mgo-images.com/image/thumbnail/v2/content/MMVAF76018A477C2826A4EC8747C40B7BE27.jpeg'),
(102,'The Dark Knight',2008,'English','With the help of allies Lt. Jim Gordon (Gary Oldman) and DA Harvey Dent (Aaron Eckhart), Batman (Christian Bale) has been able to keep a tight lid on crime in Gotham City. But when a vile young criminal calling himself the Joker (Heath Ledger) suddenly throws the town into chaos, the caped Crusader','https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg'),
(103,'Titanic',1997,'English','Seventeen-year-old Rose hails from an aristocratic family and is set to be married. When she boards the Titanic, she meets Jack Dawson, an artist, and falls in love with him.','http://cdn.shopify.com/s/files/1/1148/8924/products/MPW-115495-a_1024x1024.jpg?v=1556255572'),
(104,'Avatar',2009,'English','Jake, a paraplegic marine, replaces his brother on the Na\'vi inhabited Pandora for a corporate mission. He is accepted by the natives as one of their own but he must decide where his loyalties lie.','http://www.gstatic.com/tv/thumb/v22vodart/3542039/p3542039_v_v8_ac.jpg'),
(105,'The Avengers',2012,'English','When Thor\'s evil brother, Loki (Tom Hiddleston), gains access to the unlimited power of the energy cube called the Tesseract, Nick Fury (Samuel L. Jackson), director of S.H.I.E.L.D., initiates a superhero recruitment effort to defeat the unprecedented threat to Earth. Joining Fury\'s \"dream team\" are','http://www.movienewsletters.net/photos/130835R1.jpg'),
(106,'Joker',2019,'English','DescriptionForever alone in a crowd, failed comedian Arthur Fleck seeks connection as he walks the streets of Gotham City. Arthur wears two masks -- the one he paints for his day job as a clown, and the guise he projects in a futile attempt to feel like he\'s part of the world around him. Isolated, b','http://t0.gstatic.com/images?q=tbn:ANd9GcSJKLiEyyz1Q9RC8EBYl3ijr3nuGeyO2ETmwy6Kdq0AQtD0elWD'),
(107,'Star Wars: Episode IV - A New Hope',1977,'English','After Princess Leia, the leader of the Rebel Alliance, is held hostage by Darth Vader, Luke and Han Solo must free her and destroy the powerful weapon created by the Galactic Empire.','http://www.gstatic.com/tv/thumb/v22vodart/4407/p4407_v_v8_ah.jpg'),(108,'Inception',2010,'English','Cobb steals information from his targets by entering their dreams. He is wanted for his alleged role in his wife\'s murder and his only chance at redemption is to perform the impossible, an inception.','http://t2.gstatic.com/images?q=tbn:ANd9GcRo9vfJCM6dzPkZHIHBVCtlJnAnew9Ai26kEdrli0-tfmatmciD'),
(109,'The Lion King',1994,'English','DescriptionAs a cub, Simba is forced to leave the Pride Lands after his father Mufasa is murdered by his wicked uncle, Scar. Years later, he returns as a young lion to reclaim his throne.','http://t0.gstatic.com/images?q=tbn:ANd9GcSy2iMzH39dcj9KZeoulk18_LyeeoNIm5a26-2F80NY7rlVofiz'),
(110,'3 Idiots',2009,'Hindi','In college, Farhan and Raju form a great bond with Rancho due to his refreshing outlook. Years later, a bet gives them a chance to look for their long-lost friend whose existence seems rather elusive.','https://upload.wikimedia.org/wikipedia/en/thumb/d/df/3_idiots_poster.jpg/220px-3_idiots_poster.jpg'),(111,'Dilwale Dulhania Le Jayenge',1995,'Hindi','Raj and Simran meet during a trip across Europe and the two fall in love. However, when Raj learns that Simran is already promised to another, he follows her to India to win her and her father over.','https://upload.wikimedia.org/wikipedia/en/8/80/Dilwale_Dulhania_Le_Jayenge_poster.jpg');
/*!40000 ALTER TABLE `movie_movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_rating`
--

DROP TABLE IF EXISTS `movie_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_rating` (
  `stars` int(11) DEFAULT NULL,
  `reviews` varchar(100) DEFAULT NULL,
  `mov_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`mov_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `movie_rating_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `movie_userinfo` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `movie_rating_ibfk_2` FOREIGN KEY (`mov_id`) REFERENCES `movie_movies` (`mov_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_rating`
--

LOCK TABLES `movie_rating` WRITE;
/*!40000 ALTER TABLE `movie_rating` DISABLE KEYS */;
INSERT INTO `movie_rating` VALUES (9,' Nice movie',101,1001),(5,'nice !!! \r\n',102,1001),(1,'hola',103,1001),(9,'',103,1230),(10,'Lot\'s of entertainment and a famliy movie',105,1230),(1,'terrible movie',108,1001),(10,'really good',109,1001),(3,'bad mvie',109,1230),(10,' Amazing Movie must watch!!!!!!!',110,1001),(10,'amazing movie of the decade\r\n',111,1230);
/*!40000 ALTER TABLE `movie_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_userinfo`
--

DROP TABLE IF EXISTS `movie_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_userinfo` (
  `user_id` int(11) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_userinfo`
--

LOCK TABLES `movie_userinfo` WRITE;
/*!40000 ALTER TABLE `movie_userinfo` DISABLE KEYS */;
INSERT INTO `movie_userinfo` VALUES (1001,'qwerty123','xyz@gmail.com'),(1230,'qwerty123','xyz@gmail.com');
/*!40000 ALTER TABLE `movie_userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-10 19:52:57
