CREATE TABLE albums(
	userId INT NOT NULL,
    id INT NOT NULL,
    title TEXT NOT NULL
);

SELECT * FROM albums;

INSERT INTO albums(userId, id, title)
VALUES
	(1,1,"test");
    
DROP TABLE albums;

CREATE DATABASE placeholder;
use placeholder;