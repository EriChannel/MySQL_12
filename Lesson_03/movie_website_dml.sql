SELECT * FROM movie_website.movie;

use movie_website;
-- Lấy ra các bộ phim có độ dài trên 100, và có rating là PG

-- Lấy ra id, title, length, rating, imdb của các bộ phim 
-- có rating là PG hoặc G, và có điểm imdb trên 5

-- Lấy ra các phim có độ dài từ 50 đến 100
SELECT *
FROM movie 
WHERE length >= 50 
AND length <= 100;

SELECT *
FROM movie
WHERE length  BETWEEN 50 AND 100;

SELECT *
FROM movie
WHERE length NOT BETWEEN 50 AND 100;

-- Lấy ra các bộ phim có thể loại là PG hoặc G
SELECT *
FROM movie 
WHERE rating = 'PG' OR rating = 'G';

SELECT *
FROM movie 
WHERE rating IN ('PG', 'G');

SELECT *
FROM movie 
WHERE rating NOT IN ('PG', 'G');

-- Lấy ra các bộ phim có episode = current_episode và cps độ dài trên 150
SELECT * 
FROM movie
WHERE episode = current_episode
AND length >150;

-- Lấy ra các bộ phim có rating là PG-13 hoặc NC-17 và có điểm imdb > 5

SELECT * 
FROM movie
WHERE rating IN ('PG-13', 'NC-17')
AND imdb >5;

-- Lấy ra giới hạn 5 bộ phim
SELECT *
FROM movie
LIMIT 5;

-- Sắp xếp phim theo điểm imdb tăng dần
SELECT *
FROM movie
ORDER BY imdb ASC;

-- Sắp xếp phim theo điểm imdb giảm dần
SELECT *
FROM movie
ORDER BY imdb DESC;

-- Lấy ra 5 bộ phim có điểm cao nhất  
SELECT *
FROM movie
ORDER BY imdb DESC
LIMIT 5;

-- Lấy ra điểm imdb nhỏ nhất
SELECT MIN(imdb)
FROM movie;

-- Lấy ra điểm imdb lớn nhất
SELECT MAX(imdb)
FROM movie;

-- Tính trung bình cộng điểm imdb
SELECT AVG(imdb)
FROM movie;

-- Đếm số lượng bản ghi tron bảng movie
SELECT COUNT(id)
FROM movie;

-- Tính tổng điểm imdb
SELECT SUM(imdb)
FROM movie;

-- Tính trung bình cộng điểm imdb của các bộ phim có rating là PG
SELECT AVG(imdb)
FROM movie
WHERE rating = 'PG';

-- Tính trung bình cộng độ dài của phim có điểm imdb trên 5
SELECT AVG(length)
FROM movie
WHERE imdb > 5;

-- Lấy ra độ dài nhỏ nhất và lớn nhất của phim có rating là PG
SELECT MIN(length) AS min_length, MAX(length) AS max_length
FROM movie
WHERE rating = 'PG';

-- Tính tổng thời lượng của các phim có rating là NC-17
SELECT SUM(length)
FROM movie
WHERE rating = 'NC-17';

SELECT m.*
FROM movie m;

UPDATE movie
SET release_date = current_date()
WHERE id_title_type = 1 AND rating = 'G'

-- Lấy ra id, title, release_date, length, rating
-- của các bộ phim được xuất bản trong ngày hôm nay
-- và có độ dài trên 100, rating là PG hoặc G  
SELECT id, title, release_date, length, rating
FROM movie
WHERE release_date = CURRENT_DATE()
AND length >100
AND rating IN ('PG', 'G');

-- Lấy ra các bộ phim được xuất bản trong năm nay
SELECT * 
FROM movie
WHERE YEAR(release_date) = YEAR(CURDATE());

SELECT YEAR(current_date());

SELECT DISTINCT(rating)
FROM movie;

-- Mỗi loại rating có bao nhiêu bộ phim

SELECT DISTINCT(rating), COUNT(id)
FROM movie
GROUP BY rating;