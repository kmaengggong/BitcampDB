USE sys;
USE bitcamp06;

SHOW DATABASES;

DROP TABLE IF EXISTS user_tbl;
DROP TABLE IF EXISTS user_tbl2;
DROP TABLE IF EXISTS buy_tbl1;

CREATE TABLE user_tbl(
	user_num INT(5) PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(10) NOT NULL,
    user_birth_year INT NOT NULL,
    user_address CHAR(5) NOT NULL,
    user_height INT,
    entry_date DATE
);

INSERT user_tbl VALUES(NULL, '김자바', 1987, '서울', 180, '2020-05-03');
INSERT user_tbl VALUES(NULL, '시불불', 1997, '인천', 170, '2021-06-03');
INSERT user_tbl VALUES(NULL, '바이선', 2007, '부산', 160, '2022-07-03');
INSERT user_tbl(user_name, user_birth_year, user_address, user_height, entry_date) VALUES('어샘불', 1977, '경기', 190, '2009-08-03');
INSERT user_tbl VALUES(NULL, '고둘인', 1990, '철원', 175, '2023-05-12');

SELECT * FROM user_tbl;
SELECT * FROM user_tbl WHERE user_birth_year >= 1990;
SELECT * FROM user_tbl WHERE user_height >= 170;
SELECT * FROM user_tbl WHERE user_num > 2 OR user_height < 170;

UPDATE user_tbl SET user_address = '강원' WHERE user_num = 1;

DELETE FROM user_tbl WHERE user_name = '고둘인';
DELETE FROM user_tbl WHERE user_num > 3;

INSERT INTO user_tbl VALUES
	(null, '김개발', 1994, '경남', 178, '2020-08-02'),
    (null, '박코드', 1999, '전남', 180, '2022-06-06'),
    (null, '최디비', 2001, '서울', 165, '2015-03-05'),
    (NULL, '김자바', 1987, '서울', 180, '2020-05-03'),
    (NULL, '시불불', 1997, '인천', 170, '2021-06-03');
SELECT * FROM user_tbl;

CREATE TABLE user_tbl2 (
	user_num INT(5) PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(10) NOT NULL,
    user_birth_year INT NOT NULL,
    user_address CHAR(5) NOT NULL,
    user_height INT,
    entry_date DATE
);

INSERT INTO user_tbl2 	SELECT * FROM user_tbl WHERE user_birth_year > 1995;
SELECT * FROM user_tbl WHERE user_birth_year > 1995;
SELECT * FROM user_tbl2;

CREATE TABLE buy_tbl1 (
	buy_num INT AUTO_INCREMENT PRIMARY KEY,
    user_num INT(5) NOT NULL,
    prod_name VARCHAR(10) NOT NULL,
    prod_cate VARCHAR(10) NOT NULL,
    prod_price INT NOT NULL,
    prod_amount INT NOT NULL
);

INSERT buy_tbl1 VALUES(NULL, 4, '아이패드', '전자기기', 1000000, 1);
INSERT buy_tbl1 VALUES(NULL, 4, '애플펜슬', '전자기기', 150000, 1);
INSERT buy_tbl1 VALUES
    (NULL, 5, '안마의자', '의료기기', 4000000, 1),
    (NULL, 2, 'SQL책', '도서', 20000, 1);
INSERT buy_tbl1 VALUES (NULL, 999, '트레이닝복', '의류', 100000, 10000);
    
DELETE FROM buy_tbl1 WHERE user_num > 5;

ALTER TABLE buy_tbl1 ADD CONSTRAINT FK_buy_tbl_user_num FOREIGN KEY (user_num)
	REFERENCES user_tbl(user_num);

INSERT buy_tbl1 VALUES (NULL, 999, '트레이닝복', '의류', 100000, 10000);
    
SELECT * FROM buy_tbl1;

DELETE FROM user_tbl WHERE user_num = 2;

SELECT * FROM user_tbl2;
SELECT * FROM user_tbl;

DELETE FROM user_tbl2 WHERE entry_date > '2020-08-15';
DELETE FROM user_tbl2 WHERE entry_date = '2015-03-05';

INSERT user_tbl VALUES
	(NULL, '이자바', 1996, '서울', 178, '2020-09-01'),
    (NULL, '신다바', 1992, '경기', 164, '2020-09-01'),
    (NULL, '최다희', 1998, '경기', 158, '2020-09-01');
    
SELECT * FROM user_tbl;

SELECT DISTINCT user_birth_year FROM user_tbl;
SELECT DISTINCT user_address FROM user_tbl;

SELECT user_name AS '유저명' FROM user_tbl;
