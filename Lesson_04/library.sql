use library;  

-- Lấy ra các quyển sách được xuất bản bởi 'Wyman LLC'
SELECT b.*
FROM book b
INNER JOIN publisher p ON b.id_publisher = p.id
WHERE name ='Wyman LLC';

-- Liệt kê tên các nhà xuất bản và số sách họ đã xuất bản
SELECT name, COUNT(id_publisher)
FROM publisher p
INNER JOIN book b ON p.id = b.id_publisher
GROUP BY name;

-- Liệt kê id, tiêu đề, năm xuất bản của các quyển sách 
-- thuộc thể loại action
SELECT b.id, b.title, b.year_of_publication
FROM book b
INNER JOIN book_category bc ON b.id = bc.id_book
INNER JOIN category c ON bc.id_book = c.id
WHERE c.name = 'action';

-- Đếm mỗi thể loại có bao nhiêu quyển sách  
SELECT name, COUNT(id_book)
FROM book b
INNER JOIN book_category bc ON b.id = bc.id_book
INNER JOIN category c ON bc.id_book = c.id
GROUP BY name;

-- Lấy ra tên sách, năm xuất bản, tên tác giả của những 
-- quyển sách được xuất bản sau năm 1900
SELECT title,year_of_publication,a.full_name as author_name
FROM book b
INNER JOIN book_author ba ON b.id = ba.id_book
INNER JOIN author a ON a.id = ba.id_author
WHERE year_of_publication >1900;