CREATE TABLE user(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    user_id VARCHAR(40) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    tel VARCHAR(20) NOT NULL
);
CREATE TABLE buy(
	id INT AUTO_INCREMENT PRIMARY KEY,
    buy_date TIMESTAMP NOT NULL,
    user_id INT,
    bank VARCHAR(50) NOT NULL,
    bankNumber VARCHAR(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE clothes(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    price INT NOT NULL,
    color VARCHAR(20) NOT NULL,
    buy_id INT,
	FOREIGN KEY (buy_id) REFERENCES buy(id)
);

INSERT INTO 
user(name,user_id,password,email,address,tel)
VALUES
	('대영','jdy1787','1234','jdy@naver.com','부산','010-1111-1111');

DELETE FROM user;
DROP TABLE buy;

SELECT * FROM user
WHERE user_id = 'jdy1787' AND password = '1234';

SELECT * FROM user;

INSERT INTO
buy(buy_date,user_id,bank,bankNumber)
VALUES
	(now(),2,'국민','56565656');
    
SELECT * FROM buy
WHERE user_id = 2;

DELETE from user
WHERE id=4;
