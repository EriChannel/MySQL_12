use blog;

CREATE TABLE user(
	id INT PRIMARY KEY,
    email VARCHAR(200) NOT NULL,
    password TEXT NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    avatar TEXT,
    status ENUM('active', 'disable')
);

CREATE TABLE post(
	id INT PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    content TEXT NOT NULL,
    thumbnail TEXT,
    id_user INT,
    create_at DATE,
    status ENUM('public','hidden', 'draft'),
    FOREIGN KEY(id_user) REFERENCES user(id) ON DELETE RESTRICT
);

CREATE TABLE discuss(
	id INT PRIMARY KEY,
    id_post INT,
    id_user INT,
    content TEXT NOT NULL,
    create_at DATE,
    FOREIGN KEY (id_post) REFERENCES post(id) ON DELETE CASCADE,
    FOREIGN KEY (id_user) REFERENCES user(id) ON DELETE CASCADE
);