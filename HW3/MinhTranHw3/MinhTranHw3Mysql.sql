# create a new database for spatial data
DROP SCHEMA IF EXISTS uscSpatial;
CREATE DATABASE IF NOT EXISTS uscSpatial;
USE uscSpatial;

CREATE TABLE `usc` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  `name` VARCHAR( 60 ) NOT NULL ,
  `lat` FLOAT( 10, 6 ) NOT NULL ,
  `lng` FLOAT( 10, 6 ) NOT NULL
) ENGINE = MYISAM ;

# insert data
INSERT INTO `usc` (`name`, `lat`, `lng`) VALUES ('senatorHome','34.0293168','-118.28411');
INSERT INTO `usc` (`name`, `lat`, `lng`) VALUES ('oldApt','34.020872','-118.295325');
INSERT INTO `usc` (`name`, `lat`, `lng`) VALUES ('uspsOffice','34.023566','-118.292094');
INSERT INTO `usc` (`name`, `lat`, `lng`) VALUES ('dentalCenter','34.024168','-118.286634');
INSERT INTO `usc` (`name`, `lat`, `lng`) VALUES ('leaveyLibrary','34.021777','-118.282856');
INSERT INTO `usc` (`name`, `lat`, `lng`) VALUES ('regalTrojan','34.030199','-118.281721');
INSERT INTO `usc` (`name`, `lat`, `lng`) VALUES ('tennisCourt','34.023163','-118.290583');
INSERT INTO `usc` (`name`, `lat`, `lng`) VALUES ('uscVillage','34.026933','-118.285519');
INSERT INTO `usc` (`name`, `lat`, `lng`) VALUES ('viterbiCorner','34.020714','-118.289135');

# CONVEX HULL
# Create a set of 2D points
SET @uscConvex = 'MULTIPOINT(	-118.28411	34.0293168,
						-118.295325	34.020872,
						-118.292094	34.023566,
						-118.286634	34.024168,
						-118.282856	34.021777,
						-118.281721	34.030199,
						-118.290583	34.023163,
						-118.285519	34.026933,
						-118.289135	34.020714)';

# return the coordinate of convex hull's vertices
SELECT ST_AsText(ST_ConvexHull(ST_GeomFromText(@uscConvex)));

# THREE NEARES NEIGHBOR FROM YOUR HOME
SELECT 
name, lat,long
(
   3959 *
   acos(cos(radians((SELECT lat FROM usc WHERE name = 'senatorHome'))) * 
   cos(radians(lat)) * 
   cos(radians(lng) - 
   radians((SELECT lng FROM usc WHERE name = 'senatorHome'))) + 
   sin(radians((SELECT lat FROM usc WHERE name = 'senatorHome'))) * 
   sin(radians(lat)))
) AS distance 
FROM usc 
ORDER BY distance LIMIT 1,3;  #exclude senatorHomeitself