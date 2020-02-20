#F28DM CW2



#username = hk42 | H00289018



#question 1

SELECT COUNT(sex) AS FemaleActors FROM imdb_actors WHERE sex ="F";


#question 2

SELECT year , title FROM imdb_movies ORDER BY year ASC LIMIT 1;


#question 3

SELECT COUNT(*) AS DirectorCount, movieid FROM imdb_movies2directors GROUP BY movieid HAVING count(*) > 5;


#question 4

SELECT imdb_movies.movieid , title, COUNT(*) AS TitleCount FROM imdb_movies2directors JOIN imdb_movies ON imdb_movies2directors.movieid = imdb_movies.movieid
GROUP BY movieid ORDER BY TitleCount DESC LIMIT 1;


#question 5

SELECT SUM(time1) AS TotalTime FROM imdb_runningtimes JOIN imdb_movies2directors on imdb_runningtimes.movieid = imdb_movies2directors.movieid WHERE genre='Sci-Fi';


#question 6

SELECT movieid, name, COUNT(movieid) AS MovieCount FROM imdb_movies2actors JOIN imdb_actors ON imdb_movies2actors.actorid = imdb_actors.actorid
WHERE name = 'McGregor, Ewan' OR name LIKE 'Carlyle, Robert (I)' GROUP BY movieid HAVING MovieCount > 1;


#question 7

SELECT DISTINCT(Actor1) AS ActorsCount FROM (SELECT Actor1, Actor2, Count(*) AS count FROM (SELECT Movie1, Actor1, Movie2 ,Actor2 FROM (
SELECT actorid AS Actor1, movieid AS Movie1 FROM (SELECT actorid AS id,COUNT(*) AS count FROM imdb_movies2actors GROUP BY actorid)A JOIN imdb_movies2actors
ON id = actorid  WHERE count >= 10)B JOIN (SELECT actorid AS Actor2, movieid AS Movie2 FROM(SELECT actorid AS id,COUNT(*) AS count FROM imdb_movies2actors
GROUP BY actorid)c JOIN imdb_movies2actors ON id = actorid  WHERE count >= 10)D ON Movie1 = Movie2 AND Actor1 != Actor2)E GROUP BY Actor1, Actor2 HAVING count >= 10)F;


#question 8

SELECT '1960' AS Decade, COUNT(*) FROM imdb_movies WHERE year > 1959 AND year < 1970 UNION SELECT '1970' AS Decade, COUNT(*) FROM imdb_movies WHERE year > 1969 AND year < 1980
UNION SELECT '1980' AS Decade, COUNT(*) FROM imdb_movies WHERE year > 1979 AND year < 1990 UNION SELECT '1990' AS Decade, COUNT(*) FROM imdb_movies WHERE year > 1989 AND year < 2000
UNION SELECT '2000' AS Decade, COUNT(*) FROM imdb_movies WHERE year > 1999 AND year < 2011;


#question 9

SELECT COUNT(*) AS Difference FROM (SELECT movieid AS id, COUNT(*) AS FemalesCount FROM imdb_movies2actors JOIN imdb_actors ON imdb_movies2actors.actorid = imdb_actors.actorid
WHERE sex = 'F' GROUP BY movieid)A JOIN (SELECT movieid AS id2, COUNT(*) AS MalesCount FROM imdb_movies2actors JOIN imdb_actors ON imdb_movies2actors.actorid = imdb_actors.actorid
WHERE sex = 'M' GROUP BY movieid)B ON id = id2 WHERE FemalesCount > MalesCount;



#question 10

SELECT * FROM (SELECT genre, AVG(rank) AS AvgRank FROM (SELECT imdb_ratings.movieid, rank, votes, genre FROM imdb_ratings JOIN imdb_movies2directors
ON imdb_ratings.movieid = imdb_movies2directors.movieid WHERE votes >= 10000)A GROUP BY genre)B ORDER BY AvgRank DESC LIMIT 1;


#question 11

SELECT id, name, genres FROM(SELECT actorid AS id, COUNT(DISTINCT(genre)) AS genres FROM imdb_movies2directors JOIN imdb_movies2actors
ON imdb_movies2directors.movieid = imdb_movies2actors.movieid GROUP BY actorid)A JOIN imdb_actors ON id = actorid  WHERE genres > 9;


#question 12

SELECT COUNT(*) AS OverallCount FROM (SELECT id, ActorName, WritersName, DirectorNames FROM(SELECT id, imdb_directors.name AS DirectorNames, imdb_actors.name
AS ActorName, imdb_writers.name AS WritersName FROM (SELECT directorid AS Did, actorid AS Aid, writerid AS Wid, imdb_movies2directors.movieid AS id
FROM imdb_movies2directors JOIN imdb_movies2writers ON imdb_movies2directors.movieid = imdb_movies2writers.movieid JOIN imdb_movies2actors
ON imdb_movies2directors.movieid = imdb_movies2actors.movieid)A JOIN imdb_directors ON directorid = Did JOIN imdb_actors ON actorid = Aid
JOIN imdb_writers ON writerid = Wid)B WHERE DirectorNames = ActorName AND ActorName = WritersName GROUP BY id)C;


#question 13

SELECT AvgRank, Decade FROM (SELECT AVG(rank) AS AvgRank , ((year DIV 10) * 10) AS Decade FROM imdb_movies JOIN imdb_ratings
ON imdb_movies.movieid = imdb_ratings.movieid GROUP BY year DIV 10)A ORDER BY AvgRank DESC LIMIT 1;


#question 14

SELECT COUNT(*) AS NullCount FROM imdb_movies2directors WHERE genre IS NULL;


#question 15

SELECT COUNT(*) AS DirCount FROM (SELECT id, DirectorNames as dirname FROM (SELECT id, imdb_directors.name AS DirectorNames, imdb_actors.name AS ActorName, imdb_writers.name AS WritersName, lead FROM
(SELECT directorid AS Did, actorid AS Aid, writerid AS Wid, imdb_movies2directors.movieid AS id,imdb_movies2actors.leading AS lead FROM imdb_movies2directors
JOIN imdb_movies2writers ON imdb_movies2directors.movieid = imdb_movies2writers.movieid JOIN imdb_movies2actors ON imdb_movies2directors.movieid = imdb_movies2actors.movieid)A
JOIN imdb_directors ON directorid = Did JOIN imdb_actors ON actorid = Aid JOIN imdb_writers ON writerid = Wid)B WHERE DirectorNames = WritersName AND ActorName != WritersName GROUP BY id)C
JOIN (SELECT DISTINCT(ActorName) as actname FROM (SELECT id, imdb_directors.name AS DirectorNames, imdb_actors.name AS ActorName, imdb_writers.name AS WritersName, lead FROM
(SELECT directorid AS Did, actorid AS Aid, writerid AS Wid, imdb_movies2directors.movieid AS id,imdb_movies2actors.leading AS lead FROM imdb_movies2directors
JOIN imdb_movies2writers ON imdb_movies2directors.movieid = imdb_movies2writers.movieid JOIN imdb_movies2actors ON imdb_movies2directors.movieid = imdb_movies2actors.movieid)A
JOIN imdb_directors ON directorid = Did JOIN imdb_actors ON actorid = Aid JOIN imdb_writers ON writerid = Wid)B WHERE DirectorNames = ActorName AND ActorName = WritersName)D ON actname = dirname;
