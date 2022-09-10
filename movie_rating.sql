DROP TABLE IF EXISTS movie_rating;

CREATE TABLE movie_rating
(
  friend varchar(100) NOT NULL,
  pulp_fiction int NULL,
  marvel int NULL,
  good_will_hunting int NULL,
  dead_poet_society int NULL,
  the_conjuring int NULL,
  memory int NULL
);

SELECT * FROM movie_rating;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/movie_rating.csv' 
INTO TABLE movie_rating
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(friend, @pulp_fiction, @marvel, @good_will_hunting, @dead_poet_society, @the_conjuring, @memory)
SET
pulp_fiction = nullif(@pulp_fiction,0),
marvel = nullif(@marvel,0),
good_will_hunting = nullif(@good_will_hunting,0),
dead_poet_society = nullif(@dead_poet_society,0),
the_conjuring = nullif(@the_conjuring,0),
memory = nullif(@memory,0)
;

SELECT * FROM movie_rating.movie_rating;
SELECT COUNT(*) FROM movie_rating;