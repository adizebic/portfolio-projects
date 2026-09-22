CREATE DATABASE IF NOT EXISTS movies_db;
USE movies_db;
CREATE TABLE directors(
	director_id INT AUTO_INCREMENT PRIMARY KEY,
    director_name VARCHAR(255) NOT NULL
);
CREATE TABLE languages(
	language_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(255) NOT NULL
);
CREATE TABLE  genres(
	genre_id INT AUTO_INCREMENT PRIMARY KEY,
	genre_name VARCHAR(100) NOT NULL
);
CREATE TABLE countries(
	country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL
);
CREATE TABLE movies(
	movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT,
    duration INT,
    budget DECIMAL(15,2),
    box_office DECIMAL(15,2),
    
    director_id INT,
    language_id INT,
    country_id INT,
    
    FOREIGN KEY(director_id) REFERENCES directors(director_id),
    FOREIGN KEY(language_id) REFERENCES languages(language_id),
    FOREIGN KEY(country_id) REFERENCES countries(country_id)
);
CREATE TABLE movie_genres(
movie_id INT,
genre_id INT,
PRIMARY KEY(movie_id,genre_id),
FOREIGN KEY(movie_id)REFERENCES movies(movie_id),
FOREIGN KEY(genre_id)REFERENCES genres(genre_id)
);
