use movie_website;

SELECT COUNT(*)
FROM movie;

DELIMITER $$
CREATE PROCEDURE sp_count_movie()
BEGIN
	SELECT COUNT(*)
    FROM movie;
END $$



DELIMITER ;

CALL sp_count_movie;
DROP PROCEDURE IF EXISTS sp_count_movie_by_rating;
DELIMITER $$

CREATE PROCEDURE sp_count_movie_by_rating(
	IN rating_input TEXT,
    OUT result INT
)
BEGIN 
	SELECT COUNT(*) INTO result
    FROM movie
    WHERE rating = rating_input;
END $$
DELIMITER ;

CALL sp_count_movie_by_rating('PG-13', @result);
SELECT @result;


-- Tạo sp lấy thông tin phim theo thể loại (tham số : thể loại)
DELIMITER $$
CREATE PROCEDURE sp_movie_by_genres(
	IN genres_input TEXT
)
BEGIN
	SELECT m.*
    FROM movie m
    INNER JOIN movie_genres mg ON m.id = mg.id_movie
    INNER JOIN genres g ON mg.id_genres = g.id
    WHERE g.name = genres_input;
END $$
DELIMITER ;

CALL sp_movie_by_genres('Action');

-- Tạo sp đếm phim theo title_type (Tham số: title_type)

DELIMITER $$
CREATE PROCEDURE sp_count_movie_by_title_type (
	IN title_type_input TEXT
)
BEGIN
	SELECT tt.name AS title_type, COUNT(*) AS number_of_movie
    FROM movie m
    INNER JOIN title_type tt ON m.id_title_type = tt.id
    WHERE tt.name = title_type_input;
END $$
DELIMITER ;

CALL sp_count_movie_by_title_type ('Movie');

DROP PROCEDURE sp_found_movie;
DELIMITER $$
CREATE PROCEDURE sp_found_movie(
	IN title_input TEXT,
    OUT result TEXT 
)
BEGIN
	DECLARE count_movie INT; -- Khai báo biến count_movie
    SELECT COUNT(*) INTO count_movie
    FROM movie
    WHERE title LIKE title_input;
    
    IF count_movie = 0 THEN
		SET result = 'Không tìm thấy phim';
	ELSE 
		SET result = CONCAT('Tìm thấy ', count_movie);
	END IF;
END $$
DELIMITER ;
    
CALL sp_found_movie('Jet Pilot', @rs);
SELECT @rs;

-- Đếm phim theo quốc gia, nếu quốc gia đó không có phim nào thì thông báo không tìm thấy
-- nếu có thì liệt kê số lượng phim thuộc quốc gia đó