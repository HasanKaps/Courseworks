#F28DM CW2



#username = hk42



#question 1

SELECT COUNT(sex) FROM imdb_actors WHERE sex ="F"; 



#question 2

SELECT MIN(year), title FROM imdb_movies;



#question 3
 
SELECT COUNT(*) FROM(SELECT COUNT(*) FROM imdb_movies2directors GROUP BY movieid HAVING count(*) > 5)a;



#question 4

SELECT title FROM imdb_movies, (SELECT MAX(count),movieid as id FROM(SELECT COUNT(*) AS count, movieid FROM imdb_movies2directors GROUP BY movieid)a)b WHERE movieid = id;



#question 5

SELECT SUM(time1) FROM imdb_runningtimes,(SELECT movieid as id FROM imdb_movies2directors WHERE genre='Sci-Fi')a WHERE movieid = id;



#question 6

SELECT COUNT(*) FROM imdb_movies2actors WHERE actorid IN (SELECT actorid FROM imdb_actors WHERE name = 'McGregor, Ewan' OR name LIKE 'Carlyle, Robert (I)');



#question 7

SELECT COUNT(*) FROM
(
SELECT act1, act2, Count(*) as count
FROM
(
SELECT movie1, act1, movie2 ,act2 FROM 
(
SELECT actorid as act1, movieid as movie1 FROM(SELECT actorid as id,COUNT(*) as count FROM imdb_movies2actors GROUP BY actorid)a JOIN imdb_movies2actors ON id = actorid  WHERE count >= 10
)a
JOIN
(
SELECT actorid as act2, movieid as movie2 FROM(SELECT actorid as id,COUNT(*) as count FROM imdb_movies2actors GROUP BY actorid)a JOIN imdb_movies2actors ON id = actorid  WHERE count >= 10
)b
ON movie1 = movie2 AND act1 != act2 
)c GROUP BY act1, act2 HAVING count >= 10
)d;



#question 8

SELECT '1960' AS Decade, COUNT(*) FROM imdb_movies WHERE year > 1959 AND year < 1970
UNION
SELECT '1970' AS Decade, COUNT(*) FROM imdb_movies WHERE year > 1969 AND year < 1980
UNION
SELECT '1980' AS Decade, COUNT(*) FROM imdb_movies WHERE year > 1979 AND year < 1990
UNION
SELECT '1990' AS Decade, COUNT(*) FROM imdb_movies WHERE year > 1989 AND year < 2000
UNION
SELECT '2000' AS Decade, COUNT(*) FROM imdb_movies WHERE year > 1999 AND year < 2011;



#question 9

SELECT COUNT(*), movieid, FROM 
(SELECT movieid, sex FROM imdb_movies2actors JOIN imdb_actors ON imdb_movies2actors.actorid = imdb_actors.actorid WHERE sex = 'F')a
 GROUP BY movieID;



#question 10

SELECT * FROM 
(
SELECT genre, AVG(rank) as ranking FROM 
(
SELECT imdb_ratings.movieid, rank, votes, genre FROM imdb_ratings JOIN imdb_movies2directors ON imdb_ratings.movieid = imdb_movies2directors.movieid WHERE votes >= 10000
)a GROUP BY genre
)b ORDER BY ranking DESC LIMIT 1;



#question 11

SELECT id, name, genres FROM
(
SELECT actorid as id, COUNT(DISTINCT(genre)) AS genres FROM imdb_movies2directors JOIN imdb_movies2actors ON imdb_movies2directors.movieid = imdb_movies2actors.movieid GROUP BY actorid 
)a JOIN imdb_actors ON id = actorid  WHERE genres > 9;



#question 12

SELECT COUNT(*) FROM
(
SELECT id, imdb_directors.name as dirname, imdb_actors.name as actname, imdb_writers.name as wrtname FROM
(
SELECT directorid as dir, actorid as act, writerid as wrt, imdb_movies2directors.movieid as id FROM imdb_movies2directors JOIN imdb_movies2writers ON imdb_movies2directors.movieid = imdb_movies2writers.movieid JOIN imdb_movies2actors ON imdb_movies2directors.movieid = imdb_movies2actors.movieid 
)a 
JOIN imdb_directors ON directorid = dir 
JOIN imdb_actors ON actorid = act 
JOIN imdb_writers ON writerid = wrt
)b WHERE dirname = actname AND actname = wrtname;



#question 13
 
SELECT MAX(ranking), Decade FROM (
SELECT AVG(rank) AS ranking, '1900' as Decade, year FROM imdb_movies JOIN imdb_ratings ON imdb_movies.movieid = imdb_ratings.movieid WHERE year Between 1900 AND 1909
UNION
SELECT AVG(rank) AS ranking, '1910' as Decade, year FROM imdb_movies JOIN imdb_ratings ON imdb_movies.movieid = imdb_ratings.movieid WHERE year Between 1910 AND 1919
UNION
SELECT AVG(rank) AS ranking, '1920' as Decade, year FROM imdb_movies JOIN imdb_ratings ON imdb_movies.movieid = imdb_ratings.movieid WHERE year Between 1920 AND 1929
UNION
SELECT AVG(rank) AS ranking, '1930' as Decade, year FROM imdb_movies JOIN imdb_ratings ON imdb_movies.movieid = imdb_ratings.movieid WHERE year Between 1930 AND 1939
UNION
SELECT AVG(rank) AS ranking, '1940' as Decade, year FROM imdb_movies JOIN imdb_ratings ON imdb_movies.movieid = imdb_ratings.movieid WHERE year Between 1940 AND 1949
UNION
SELECT AVG(rank) AS ranking, '1950' as Decade, year FROM imdb_movies JOIN imdb_ratings ON imdb_movies.movieid = imdb_ratings.movieid WHERE year Between 1950 AND 1959
UNION
SELECT AVG(rank) AS ranking, '1960' as Decade, year FROM imdb_movies JOIN imdb_ratings ON imdb_movies.movieid = imdb_ratings.movieid WHERE year Between 1960 AND 1969
UNION
SELECT AVG(rank) AS ranking, '1970' as Decade, year FROM imdb_movies JOIN imdb_ratings ON imdb_movies.movieid = imdb_ratings.movieid WHERE year Between 1970 AND 1979
UNION
SELECT AVG(rank) AS ranking, '1980' as Decade, year FROM imdb_movies JOIN imdb_ratings ON imdb_movies.movieid = imdb_ratings.movieid WHERE year Between 1980 AND 1989
UNION
SELECT AVG(rank) AS ranking, '1990' as Decade, year FROM imdb_movies JOIN imdb_ratings ON imdb_movies.movieid = imdb_ratings.movieid WHERE year Between 1990 AND 1999
UNION
SELECT AVG(rank) AS ranking, '2000' as Decade, year FROM imdb_movies JOIN imdb_ratings ON imdb_movies.movieid = imdb_ratings.movieid WHERE year Between 2000 AND 2009)a;



#question 14

SELECT COUNT(*) FROM imdb_movies2directors WHERE genre IS NULL;



#question 15

SELECT COUNT(*) FROM
(
SELECT id, imdb_directors.name as dirname, imdb_actors.name as actname, imdb_writers.name as wrtname, lead FROM
(
SELECT directorid as dir, 
actorid as actor, 
writerid as writer, 
imdb_movies2directors.movieid as id, 
imdb_movies2actors.leading as lead  
FROM imdb_movies2directors 
JOIN imdb_movies2writers ON 
imdb_movies2directors.movieid = imdb_movies2writers.movieid 
JOIN imdb_movies2actors ON 
imdb_movies2directors.movieid = imdb_movies2actors.movieid 
)a 
JOIN imdb_directors ON directorid = dir 
JOIN imdb_actors ON actorid = actor 
JOIN imdb_writers ON writerid = writert
)b WHERE dirname = actname AND actname = wrtname AND lead > 1;




