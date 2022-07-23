use blog;

SELECT title, full_name
FROM post p INNER JOIN user u 
ON p.id_user = u.id;

SELECT title, full_name
FROM post p LEFT JOIN user u
ON p.id_user = u.id;

SELECT title, full_name
FROM post p RIGHT JOIN user u
ON p.id_user = u.id;




SELECT title, full_name
FROM post p LEFT JOIN user u
ON p.id_user = u.id
UNION
SELECT title, full_name
FROM post p RIGHT JOIN user u
ON p.id_user = u.id;

-- Lấy ra id, title, content, comment (id_user, content, create_at) 
-- cuả bài post có id = 2

SELECT p.id, p.title, p.content, d.id_user, d.content as comment, d.create_at
FROM post p INNER JOIN discuss d
ON p.id_user = d.id_user
WHERE p.id = 2;