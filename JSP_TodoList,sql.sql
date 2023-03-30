CREATE DATABASE todo;
use todo;
-- id, 제목, 내용, 우선순위, 완료여부, 생성일

-- DDL (Data Definition Language)
CREATE TABLE TodoList(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
	priority INT NOT NULL DEFAULT 0,
    completed TINYINT NOT NULL DEFAULT 0,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 카테고리 테이블
-- id, 이름
CREATE TABLE Category(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(225) NOT NULL
);

-- TodoList : 자식 테이블
ALTER TABLE TodoList
ADD COLUMN category_id INT, 
ADD CONSTRAINT fk_category FOREIGN KEY (category_id)
REFERENCES category(id) 
ON UPDATE CASCADE 
ON DELETE CASCADE
