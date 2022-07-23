use movie_website;

SELECT AVG(imdb)
FROM movie;

SELECT *
FROM movie 
WHERE imdb > (
	SELECT AVG(imdb)
	FROM movie
);

SELECT m.*
FROM movie m, (SELECT AVG(length) AS avg_length FROM movie) s
WHERE m.length > s.avg_length;

SELECT m.id, m.title, m.length, 
		(SELECT AVG(length) AS avg_length FROM movie) AS avg_length
FROM movie m;

SELECT m.*
FROM movie m INNER JOIN title_type t
ON m.id_title_type = t.id
WHERE t.name = 'Movie';

SELECT id
FROM title_type
WHERE name = 'Movie';

SELECT * 
FROM movie
WHERE id_title_type = (
	SELECT id
	FROM title_type
	WHERE name = 'Movie'
);

-- Lấy ra những bộ phim có điểm imdb cao nhất
SELECT *
FROM movie
WHERE imdb = (
	SELECT MAX(imdb)
	FROM movie
);

SELECT * 
FROM movie m
WHERE m.imdb = (
	SELECT imdb 
	FROM movie 
	ORDER BY imdb DESC
	LIMIT 1
);
-- Lấy ra những bộ phim có thời lượng dài nhất
SELECT *
FROM movie
WHERE length = (
	SELECT MAX(length)
	FROM movie
);
-- Lấy ra đạo diễn tham gia nhiều bộ phim nhất

SELECT COUNT(id) AS movie_number
FROM movie
GROUP BY id_director 
ORDER BY movie_number DESC;


SELECT MAX(movie_number)
FROM ( SELECT COUNT(id) AS movie_number
	FROM movie
	GROUP BY id_director ) AS sub_movie;
    
SELECT id_director
FROM (SELECT id_director, COUNT(id) AS movie_number
	FROM movie
	GROUP BY id_director ) AS sub_movie
WHERE movie_number = (
	SELECT MAX(movie_number)
	FROM ( SELECT COUNT(id) AS movie_number
	FROM movie
	GROUP BY id_director ) AS sub_movie);
    
    
SELECT *
FROM director
WHERE id IN ( SELECT id_director
				FROM (SELECT id_director, COUNT(id) AS movie_number
					FROM movie
					GROUP BY id_director ) AS sub_movie
				WHERE movie_number = (
					SELECT MAX(movie_number)
					FROM ( SELECT COUNT(id) AS movie_number
					FROM movie
					GROUP BY id_director ) AS sub_movie)
                    );
                    
                    
                    
use library;
SELECT id, datediff(current_date(), date)
FROM borrow
WHERE datediff(current_date(), date) > 7
AND id NOT IN (
	SELECT id_borrow 
	FROM return_book
);