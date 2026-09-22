SELECT g.genre_name,SUM(m.box_office) AS ukupna_zarada
FROM movies m
JOIN movie_genres mg ON m.movie_id = mg.movie_id
JOIN genres g ON mg.genre_id = g.genre_id
GROUP BY g.genre_name
ORDER BY ukupna_zarada DESC
LIMIT 3;
SELECT AVG(budget) AS prosjecan_budzet,AVG(box_office) AS prosjecna_zarada
FROM movies;

SELECT c.country_name,AVG(m.box_office) AS prosjecna_zarada
FROM movies m
JOIN countries c ON m.country_id = c.country_id
GROUP BY c.country_name
ORDER BY prosjecna_zarada DESC
LIMIT 5;

SELECT title,box_office
FROM movies
ORDER BY box_office DESC
LIMIT 10;
