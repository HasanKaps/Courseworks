#F28DM CW2



#username = hk42



#question 1

SELECT COUNT(sex) FROM imdb_actors WHERE sex ="F"; 


#question 2

SELECT year , title FROM imdb_movies ORDER BY year ASC LIMIT 1;


#question 3
 
SELECT COUNT(*) FROM(SELECT COUNT(*), movieid FROM imdb_movies2directors GROUP BY movieid HAVING count(*) > 5)a;

#question 4

SELECT imdb_movies.movieid , title, COUNT(*) AS TitleCount FROM imdb_movies2directors JOIN imdb_movies ON imdb_movies2directors.movieid = imdb_movies.movieid
GROUP BY movieid ORDER BY TitleCount DESC LIMIT 1;


#question 5

SELECT SUM(time1) FROM imdb_runningtimes,(SELECT movieid as id FROM imdb_movies2directors WHERE genre='Sci-Fi')a WHERE movieid = id;


#question 6

SELECT COUNT(*) FROM(SELECT movieid, name, COUNT(movieid) as MovieCount FROM imdb_movies2actors JOIN imdb_actors ON imdb_movies2actors.actorid = imdb_actors.actorid
WHERE name = 'McGregor, Ewan' OR name LIKE 'Carlyle, Robert (I)' GROUP BY movieid HAVING MovieCount > 1)A;



#question 7

SELECT COUNT(DISTINCT(act1)) AS ActorsCount FROM (SELECT act1, act2, Count(*) as count FROM (SELECT movie1, act1, movie2 ,act2 FROM (
SELECT actorid as act1, movieid as movie1 FROM (SELECT actorid as id,COUNT(*) as count FROM imdb_movies2actors GROUP BY actorid)A JOIN imdb_movies2actors 
ON id = actorid  WHERE count >= 10)B JOIN (SELECT actorid as act2, movieid as movie2 FROM(SELECT actorid as id,COUNT(*) as count FROM imdb_movies2actors 
GROUP BY actorid)c JOIN imdb_movies2actors ON id = actorid  WHERE count >= 10)D ON movie1 = movie2 AND act1 != act2)E GROUP BY act1, act2 HAVING count >= 10)F;


#question 8

SELECT '1960' AS Decade, COUNT(*) FROM imdb_movies WHERE year > 1959 AND year < 1970 UNION SELECT '1970' AS Decade, COUNT(*) FROM imdb_movies WHERE year > 1969 AND year < 1980
UNION SELECT '1980' AS Decade, COUNT(*) FROM imdb_movies WHERE year > 1979 AND year < 1990 UNION SELECT '1990' AS Decade, COUNT(*) FROM imdb_movies WHERE year > 1989 AND year < 2000
UNION SELECT '2000' AS Decade, COUNT(*) FROM imdb_movies WHERE year > 1999 AND year < 2011;


#question 9

SELECT COUNT(*) AS Difference FROM (SELECT movieid as id, COUNT(*) as FemalesCount FROM imdb_movies2actors JOIN imdb_actors ON imdb_movies2actors.actorid = imdb_actors.actorid 
WHERE sex = 'F' GROUP BY movieid)A JOIN (SELECT movieid as id2, COUNT(*) as MalesCount FROM imdb_movies2actors JOIN imdb_actors ON imdb_movies2actors.actorid = imdb_actors.actorid 
WHERE sex = 'M' GROUP BY movieid)B ON id = id2 WHERE FemalesCount > MalesCount;



#question 10

SELECT * FROM (SELECT genre, AVG(rank) as AvgRank FROM (SELECT imdb_ratings.movieid, rank, votes, genre FROM imdb_ratings JOIN imdb_movies2directors 
ON imdb_ratings.movieid = imdb_movies2directors.movieid WHERE votes >= 10000)A GROUP BY genre)B ORDER BY AvgRank DESC LIMIT 1;


#question 11

SELECT id, name, genres FROM(SELECT actorid as id, COUNT(DISTINCT(genre)) AS genres FROM imdb_movies2directors JOIN imdb_movies2actors 
ON imdb_movies2directors.movieid = imdb_movies2actors.movieid GROUP BY actorid)A JOIN imdb_actors ON id = actorid  WHERE genres > 9;


#question 12

SELECT COUNT(*) AS OverallCount FROM (SELECT id, ActorName, WritersName, DirectorNames FROM(SELECT id, imdb_directors.name AS DirectorNames, imdb_actors.name 
AS ActorName, imdb_writers.name AS WritersName FROM (SELECT directorid AS Did, actorid AS Aid, writerid AS Wid, imdb_movies2directors.movieid AS id 
FROM imdb_movies2directors JOIN imdb_movies2writers ON imdb_movies2directors.movieid = imdb_movies2writers.movieid JOIN imdb_movies2actors 
ON imdb_movies2directors.movieid = imdb_movies2actors.movieid)A JOIN imdb_directors ON directorid = Did JOIN imdb_actors ON actorid = Aid 
JOIN imdb_writers ON writerid = Wid)B WHERE DirectorNames = ActorName AND ActorName = WritersName GROUP BY id)C;


#question 13

SELECT AvgRank, Decade FROM (SELECT AVG(rank) as AvgRank , ((year DIV 10) * 10) as Decade FROM imdb_movies JOIN imdb_ratings 
ON imdb_movies.movieid = imdb_ratings.movieid GROUP BY year DIV 10)A ORDER BY AvgRank DESC LIMIT 1;


#question 14

SELECT COUNT(*) FROM imdb_movies2directors WHERE genre IS NULL;

#question 15

SELECT COUNT(*) AS DirCount FROM(SELECT id, ActorName, WritersName, DirectorNames FROM (SELECT id, imdb_directors.name as DirectorNames, imdb_actors.name 
as ActorName, imdb_writers.name as WritersName, lead FROM( SELECT directorid as Did, actorid as Aid, writerid as Wid, imdb_movies2directors.movieid as id, 
imdb_movies2actors.leading as lead FROM imdb_movies2directors JOIN imdb_movies2writers ON imdb_movies2directors.movieid = imdb_movies2writers.movieid 
JOIN imdb_movies2actors ON imdb_movies2directors.movieid = imdb_movies2actors.movieid)A JOIN imdb_directors ON directorid = Did 
JOIN imdb_actors ON actorid = Aid JOIN imdb_writers ON writerid = Wid)B WHERE DirectorNames = ActorName AND ActorName = WritersName AND lead > 1
GROUP BY id)C;

