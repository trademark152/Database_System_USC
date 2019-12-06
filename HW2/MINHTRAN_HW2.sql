# create a new database for movie review application
DROP SCHEMA IF EXISTS movRevApp;
CREATE DATABASE IF NOT EXISTS movRevApp;
USE movRevapp;

CREATE TABLE IF NOT EXISTS actors (
    id       SMALLINT UNSIGNED UNIQUE NOT NULL, 
    name            VARCHAR(45) NOT NULL, 
    gender          CHAR(1)     NOT NULL CHECK(gender IN ("M", "F", "U", "B")), 
    date_of_birth   DATE        NOT NULL,
    PRIMARY KEY (id)
)   ENGINE=INNODB;

INSERT INTO actors
	(id, name, gender, date_of_birth)
VALUES
(1,	'PENELOPE GUINESS'   ,	'B',19530717),
(2,	'MARK CLARKSON'      ,	'M',19700628),
(3,	'ED CHASE'           ,  'U',19610722),
(4,	'JENNIFER DAVIS'     ,	'M',19480520),
(5,	'JOHNNY LOLLOBRIGIDA',	'U',19580124),
(6,	'BETTE NICHOLSON'    ,	'F',19310615),
(7,	'GRACE MOSTEL'       ,	'M',19940505),
(8,	'MATTHEW JOHANSSON'  ,	'B',19620722),
(9,	'JOE SWANK'          ,	'M',19830510),
(10,'CHRISTIAN GABLE'    ,	'B',19800811);


CREATE TABLE if not exists users (
    id            SMALLINT    UNSIGNED UNIQUE NOT NULL,
    name          VARCHAR(45) NOT NULL, 
    date_of_birth DATE        NOT NULL,
    PRIMARY KEY(id)
)   ENGINE=INNODB;

INSERT INTO USERS
	(id, name, date_of_birth)
VALUES
(1,	'JOHN DOE'        ,	19530218),
(2,	'PATRICIA JOHNSON',	19910819),
(3,	'LINDA WILLIAMS'  ,	19810616),
(4,	'BARBARA JONES'   ,	20170813),
(5,	'ELIZABETH BROWN' ,	19320513),
(6,	'JENNIFER DAVIS'  ,	20000416),
(7,	'MARIA MILLER'    ,	19700604),
(8,	'SUSAN WILSON'    ,	19420623),
(9,	'MARGARET MOORE'  ,	19870921),
(10,'DOROTHY TAYLOR'  ,	19921215);



CREATE TABLE IF NOT EXISTS movies (
    id   SMALLINT UNSIGNED UNIQUE NOT NULL, 
    name VARCHAR(45) NOT NULL, 
    genre VARCHAR(20) NOT NULL,
    release_date DATE NOT NULL,
    PRIMARY KEY (id)
)   ENGINE=INNODB;

INSERT INTO movies
	(id, name, genre, release_date)
VALUES
(1,	'ACADEMY DINOSAUR',	'Comedy'   ,19721211),
(2,	'ACE GOLDFINGER'  ,	'Thriller' ,19550709),
(3,	'ADAPTATION HOLES',	'Horror'   ,19971124),
(4,	'AFFAIR PREJUDICE',	'Adventure',19510620),
(5,	'AFRICAN EGG'     ,	'Thriller' ,20021209),
(6,	'AGENT TRUMAN'    ,	'Fantasy'  ,20050515),
(7,	'AIRPLANE SIERRA' ,	'Comedy'   ,20010729),
(8,	'AIRPORT POLLOCK' ,	'Scifi'	   ,19700729),
(9,	'NOTEBOOK'        ,	'Drama'	   ,20030713),
(10,'ALADDIN CALENDAR',	'Western'  ,19990224);


CREATE TABLE IF NOT EXISTS reviews (
    user_id  SMALLINT      UNSIGNED NOT NULL,
    movie_id SMALLINT      UNSIGNED NOT NULL,
	rating   SMALLINT      NOT NULL,
    comment  VARCHAR(5000) NOT NULL,
	PRIMARY KEY (user_id, movie_id),
    INDEX (user_id, movie_id),
	
    FOREIGN KEY (user_id)
      REFERENCES users(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

    FOREIGN KEY (movie_id)
      REFERENCES movies(id)
      ON UPDATE CASCADE ON DELETE RESTRICT
)   ENGINE=INNODB;

INSERT INTO reviews
	(user_id, movie_id, rating, comment)
VALUES
(1	,2,	9,	'A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies'),
(3	,3,	7,	'A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China'),
(10	,3,	0,	'A Astounding Reflection of a Lumberjack And a Car who must Sink a Lumberjack in A Baloon Factory'),
(4	,2,	8,	'A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank'),
(4	,4,	5,	'A Fast-Paced Documentary of a Pastry Chef And a Dentist who must Pursue a Forensic Psychologist in The Gulf of Mexico'),
(1	,9,	1,	'A Intrepid Panorama of a Robot And a Boy who must Escape a Sumo Wrestler in Ancient China'),
(8	,7,	9,	'A Touching Saga of a Hunter And a Butler who must Discover a Butler in A Jet Boat'),
(8	,9,	7,	'A Epic Tale of a Moose And a Girl who must Confront a Monkey in Ancient India'),
(5	,8,	6,	'A Thoughtful Panorama of a Database Administrator And a Mad Scientist who must Outgun a Mad Scientist in A Jet Boat'),
(3	,7,	6,	'A Action-Packed Tale of a Man And a Lumberjack who must Reach a Feminist in Ancient China'),
(5	,2,	1,	'A Boring Epistle of a Butler And a Cat who must Fight a Pastry Chef in A MySQL Convention'),
(1	,5,	1,	'A Fanciful Saga of a Hunter And a Pastry Chef who must Vanquish a Boy in Australia'),
(9	,7,	9,	'A Action-Packed Drama of a Dentist And a Crocodile who must Battle a Feminist in The Canadian Rockies'),
(6	,6,	6,	'A Emotional Drama of a A Shark And a Database Administrator who must Vanquish a Pioneer in Soviet Georgia'),
(5	,1,	10,	'A Brilliant Drama of a Cat And a Mad Scientist who must Battle a Feminist in A MySQL Convention'),
(6	,9,	6,	'A Fast-Paced Drama of a Robot And a Composer who must Battle a Astronaut in New Orleans'),
(4	,8,	1,	'A Fast-Paced Character Study of a Composer And a Dog who must Outgun a Boat in An Abandoned Fun House'),
(4	,1,	9,	'A Thoughtful Drama of a Composer And a Feminist who must Meet a Secret Agent in The Canadian Rockies'),
(8	,2,	1,	'A Emotional Display of a Pioneer And a Technical Writer who must Battle a Man in A Baloon');


CREATE TABLE IF NOT EXISTS leads (
    actor_id SMALLINT UNSIGNED NOT NULL,
    movie_id SMALLINT UNSIGNED NOT NULL,
	
	PRIMARY KEY (actor_id, movie_id),
    INDEX (actor_id, movie_id),

    FOREIGN KEY (actor_id)
      REFERENCES actors(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

    FOREIGN KEY (movie_id)
      REFERENCES movies(id)
      ON UPDATE CASCADE ON DELETE RESTRICT
)   ENGINE=INNODB;

INSERT INTO leads
	(actor_id, movie_id)
VALUES
(4 ,9),
(9 ,8),
(9 ,4),
(6 ,8),
(10,7),
(7 ,1),
(1 ,2),
(9 ,1),
(1 ,10),
(1 ,1),
(7 ,9),
(10,6),
(6,	7),
(3,	10),
(9,	5),
(9,	2),
(7,	7),
(1,	7),
(1,	8),
(6,	5),
(8,	6),
(2,	1),
(1,	3),
(5, 9),
(4, 1);
