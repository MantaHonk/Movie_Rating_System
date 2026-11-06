-- Run this after creating the assignment tables with the project's root init.sql.
-- Run the mysql client from the repository root so these relative paths resolve.
-- Empty optional CSV fields are converted to SQL NULL.

LOAD DATA LOCAL INFILE 'normalized_test_sample/Studio.csv'
INTO TABLE Studio
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(studio_id, studio_name, @studio_location)
SET studio_location = NULLIF(@studio_location, '');

LOAD DATA LOCAL INFILE 'normalized_test_sample/Movie.csv'
INTO TABLE Movie
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(movie_id, title, @budget, @revenue, @imdb_rating, @studio_id)
SET budget = NULLIF(@budget, ''),
    revenue = NULLIF(@revenue, ''),
    imdb_rating = NULLIF(@imdb_rating, ''),
    studio_id = NULLIF(@studio_id, '');

LOAD DATA LOCAL INFILE 'normalized_test_sample/Workers.csv'
INTO TABLE Workers
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(worker_id, worker_name);

LOAD DATA LOCAL INFILE 'normalized_test_sample/CastMember.csv'
INTO TABLE CastMember
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(worker_id);

LOAD DATA LOCAL INFILE 'normalized_test_sample/Role.csv'
INTO TABLE Role
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(character_played, cast_order, worker_id, movie_id);

LOAD DATA LOCAL INFILE 'normalized_test_sample/User.csv'
INTO TABLE `User`
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(profile_id, @profile_name, @profile_password)
SET profile_name = NULLIF(@profile_name, ''),
    profile_password = NULLIF(@profile_password, '');

LOAD DATA LOCAL INFILE 'normalized_test_sample/WorksOn.csv'
INTO TABLE WorksOn
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(worker_id, movie_id);

LOAD DATA LOCAL INFILE 'normalized_test_sample/Rates.csv'
INTO TABLE Rates
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(profile_id, movie_id, rating, rates_timestamp);

-- Quick row-count check after loading.
SELECT 'Studio' AS table_name, COUNT(*) AS row_count FROM Studio
UNION ALL SELECT 'Movie', COUNT(*) FROM Movie
UNION ALL SELECT 'Workers', COUNT(*) FROM Workers
UNION ALL SELECT 'CastMember', COUNT(*) FROM CastMember
UNION ALL SELECT 'Role', COUNT(*) FROM Role
UNION ALL SELECT 'User', COUNT(*) FROM `User`
UNION ALL SELECT 'WorksOn', COUNT(*) FROM WorksOn
UNION ALL SELECT 'Rates', COUNT(*) FROM Rates;
