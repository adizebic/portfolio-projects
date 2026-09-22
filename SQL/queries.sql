INSERT INTO directors (director_name) VALUES
('Steven Spielberg'),
('Christopher Nolan'),
('Quentin Tarantino'),
('Martin Scorsese'),
('James Cameron'),
('Ridley Scott'),
('Peter Jackson'),
('Tim Burton'),
('Guy Ritchie'),
('David Fincher');
INSERT INTO languages(country_name) VALUES
('English'),
('French'),
('Spanish'),
('German'),
('Italian'),
('Japanese'),
('Korean'),
('Chinese'),
('Hindi'),
('Russian');
INSERT INTO countries (country_name) VALUES
('USA'),
('UK'),
('France'),
('Germany'),
('Italy'),
('Japan'),
('South Korea'),
('China'),
('India'),
('Russia');
INSERT INTO genres (genre_name) VALUES
('Action'),
('Drama'),
('Comedy'),
('Thriller'),
('Horor'),
('Sci-Fi'),
('Romance'),
('Advanture'),
('Crime'),
('Fantasy');
INSERT INTO movies(title,release_year,duration,budget,box_office,director_id,language_id,country_id)VALUES
('Inception',2010,148,160000000,829000000,2,1,1),
('Titanic',1997,195,200000000,220000000,5,1,1),
('Pulp Fiction',1994,195,8000000,213000000,3,1,1),
('Gladiator',2000,155,103000000,460000000,6,1,2),
('The Dark Knight',2008,152,185000000,1005000000,2,1,1),
('Fight Club',1999,139,63000000,101000000,10,1,1),
('Avatar',2009,162,237000000,2920000000,5,1,1),
('The Matrix',1999,136,63000000,466000000,1,1,1),
('Se7en',1995,127,33000000,327000000,10,1,1),
('Interstellar',2014,169,165000000,677000000,2,1,1);
INSERT INTO movie_genres (movie_id,genre_id) VALUES
(1,6),(1,1),
(2,7),(2,4),
(3,9),(3,3),
(4,1),(4,8),
(5,1),(5,4),
(6,4),(6,9),
(7,6),(7,8),
(8,6),(8,1),
(9,4),(9,9),
(10,6),(10,8);

UPDATE countries
SET country_name = 'United States of America'
WHERE country_name = 'USA';

DELETE FROM movies
WHERE duration <70;

SELECT *
FROM movies
WHERE duration BETWEEN 120 AND 150
AND budget >200000;





