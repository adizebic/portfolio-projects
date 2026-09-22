SELECT *
FROM movies
WHERE budget >(SELECT AVG(budget) FROM movies);

SELECT c.country_name,COUNT(m.movie_id)
FROM movies m
JOIN countries c on m.country_id = c.country_id
GROUP BY c.country_name;

SELECT g.genre_name,COUNT(mg.movie_id) AS broj_filmova
FROM movie_genres mg
JOIN genres g ON mg.genre_id = g.genre_id
GROUP BY g.genre_name
HAVING COUNT(mg.movie_id) > 5;

SELECT title,box_office
FROM movies
ORDER BY box_office DESC
LIMIT 10;

SELECT title,duration
FROM movies
ORDER BY duration ASC
LIMIT 5;

SELECT SUM(box_office) AS ukupna_zarada
FROM movies;

SELECT AVG(duration) AS prosjecno_trajanje
FROM movies;

SELECT
	MAX(budget) AS najskuplji,
    MIN(budget) AS najjeftiniji
FROM movies;

SELECT UPPER(title) AS veliki_naslov
FROM movies
WHERE LENGTH(title) > 15;

SELECT title,SUBSTRING(title,1,5) AS prvih_5_karaktera
FROM movies;

								