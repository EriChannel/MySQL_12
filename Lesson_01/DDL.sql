CREATE DATABASE library;

CREATE DATABASE blog;

use library;
DROP TABLE author;
CREATE TABLE author(
	id INT PRIMARY KEY,
    name VARCHAR(100),
    dob DATE,
    gender ENUM('Male', 'Female'),
    adrress TEXT
);

CREATE TABLE book(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title TEXT NOT NULL, 
    description TEXT, 
    author_id INT,
    release_year YEAR,
    FOREIGN KEY (author_id) REFERENCES author(id)
);

CREATE TABLE category(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE book_category(
	id_book INT,
    id_category INT,
    PRIMARY KEY(id_book, id_category),
    fOREIGN KEY (id_book) REFERENCES book(id),
    FOREIGN KEY (id_category) REFERENCES category(id)
);

-- Thêm cột page_number vào bảng book

ALTER TABLE book
ADD page_number INT;

-- Thêm email vào bảng author
ALTER TABLE author
ADD email VARCHAR(200);

-- Đổi kiểu dữ của cột email sang TEXT
ALTER TABLE author
MODIFY COLUMN email TEXT;

-- Xoá cột email trong bảng author
ALTER TABLE author
DROP COLUMN email;

ALTER TABLE author
CHANGE COLUMN name fullname VARCHAR(100) NOT NULL;

-- Bổ sung khoá phụ
ALTER TABLE book 
ADD CONSTRAINT FOREIGN KEY (<cột muốn đặt làm khoá phụ>) REFERENCES tên bảng(tên cột)