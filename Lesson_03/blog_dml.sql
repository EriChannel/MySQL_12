SELECT *
FROM post;

SELECT title, content
FROM post;


SELECT id, title, description, thumbnail, create_at
FROM post;

-- Lấy ra các bài viết có trạng thái là public
SELECT *
FROM post
WHERE status = 'public';


SELECT * 
FROM post
WHERE title LIKE '%the%';

SELECT current_date();
SELECT NOW();

-- Lấy ra các bài viết được viết vào ngày hôm nay
SELECT *
FROM post
WHERE create_at = current_date()
AND status = 'public';

-- Lấy ra các bài viết có trạng thái là public hoặc hidden
SELECT *
FROM post
WHERE (status = 'public' OR status = 'hidden')
AND title LIKE '%the%';

--Lấy ra các bài viết có id_user là NULL
SELECT *
FROM post
WHERE id_user IS NULL;

SELECT *
FROM post
WHERE id_user IS NOT NULL;


UPDATE post
SET create_at = current_date() 
WHERE id_user = 6;


-- Lấy tất cả thông tin của user 
SELECT *
FROM user;
-- lấy ra email, password, full_name của user
SELECT email, password, full_name
FROM user;

-- Lấy toàn bộ user có trạng thái active
SELECT *
FROM user
WHERE status = 'active';

-- Lấy ra toàn bộ user có full_name có chữ A đứng đầu, 
-- và có trạng thái là active