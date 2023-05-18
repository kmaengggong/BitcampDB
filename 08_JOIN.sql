USE bitcamp06;

CREATE TABLE member_tbl (
	mem_num INT PRIMARY KEY AUTO_INCREMENT,
    mem_name VARCHAR(10) NOT NULL,
    mem_addr VARCHAR(10) NOT NULL
);

CREATE TABLE purchase_tbl (
	pur_num INT PRIMARY KEY AUTO_INCREMENT,
    mem_num INT,
    pur_date DATETIME DEFAULT NOW(),
    pur_price INT
);

INSERT INTO member_tbl
VALUES
	(NULL, '김회원', '서울'),
    (NULL, '이회원', '경기'),
    (NULL, '박회원', '인천'),
    (NULL, '최회원', '강원'),
    (NULL, '정회원', '충북'),
    (NULL, '강회원', '충남'),
    (NULL, '조회원', '부산'),
    (NULL, '윤회원', '광주'),
    (NULL, '임회원', '제주'),
    (NULL, '한회원', '경기'),
    (NULL, '오회원', '서울');
    
INSERT INTO purchase_tbl
VALUES
	(NULL, 1, '2023-05-12', 50000),
    (NULL, 3, '2023-05-12', 20000),
    (NULL, 4, '2023-05-12', 10000),
    (NULL, 1, '2023-05-13', 40000),
    (NULL, 1, '2023-05-14', 30000),
    (NULL, 3, '2023-05-14', 30000),
    (NULL, 5, '2023-05-14', 50000),
    (NULL, 5, '2023-05-15', 60000),
    (NULL, 6, '2023-05-15', 15000),
    (NULL, 7, '2023-05-16', 100000);

SELECT * FROM member_tbl;
SELECT * FROM purchase_tbl;

SELECT
	member_tbl.mem_num, member_tbl.mem_name, member_tbl.mem_addr,
    purchase_tbl.pur_date, purchase_tbl.pur_num, purchase_tbl.pur_price
FROM member_tbl
INNER JOIN purchase_tbl
ON member_tbl.mem_num = purchase_tbl.mem_num
ORDER BY member_tbl.mem_num, purchase_tbl.pur_num;


SELECT
	user_tbl.user_name, user_tbl.user_address, user_tbl.user_num,
    buy_tbl1.buy_num, buy_tbl1.prod_name, buy_tbl1.prod_cate, buy_tbl1.prod_price, buy_tbl1.prod_amount
FROM user_tbl
INNER JOIN buy_tbl1
ON user_tbl.user_num = buy_tbl1.user_num
ORDER BY user_tbl.user_num, buy_tbl1.buy_num;

SELECT
	ut.user_name, ut.user_address, ut.user_num,
    bt.buy_num, bt.prod_name, bt.prod_cate, bt.prod_price, bt.prod_amount
FROM user_tbl ut
INNER JOIN buy_tbl1 bt
ON ut.user_num = bt.user_num
ORDER BY ut.user_num, bt.buy_num;

SELECT
	m.mem_num, m.mem_name, m.mem_addr,
    p.pur_date, p.pur_num, p.pur_price
FROM member_tbl m
LEFT JOIN purchase_tbl p
ON m.mem_num = p.mem_num;
	
SELECT
	p.mem_num, m.mem_name, m.mem_addr,
    p.pur_date, p.pur_num, p.pur_price
FROM member_tbl m
RIGHT JOIN 	purchase_tbl p
USING (mem_num);

SELECT * FROM user_tbl, buy_tbl1;
SELECT COUNT(*) FROM user_tbl CROSS JOIN buy_tbl1;

CREATE TABLE phone_volume(
	volume VARCHAR(4),
    model_name VARCHAR(10)
);

CREATE TABLE phone_color(
	color VARCHAR(7)
);

INSERT INTO phone_volume
VALUES
	(128, 'Galaxy'),
    (256, 'Galaxy'),
    (512, 'Galaxy'),
    (1024, 'Galaxy'),
    (128, 'iPhone'),
    (256, 'iPhone'),
    (512, 'iPhone'),
    (1024, 'iPhone');
    
INSERT INTO phone_color
VALUES
	('Red'),
    ('Orange'),
    ('Yellow'),
    ('Green'),
    ('Blue'),
    ('Purple'),
    ('Brown'),
    ('White'),
    ('Black');
    
SELECT * FROM phone_volume, phone_color
ORDER BY model_name, color, volume;

SELECT COUNT(*) FROM phone_volume, phone_color;

CREATE TABLE staff (
	staff_id INT PRIMARY KEY AUTO_INCREMENT,
    staff_name VARCHAR(4),
    staff_role VARCHAR(4),
    staff_salary INT,
    staff_supervisor INT
);

INSERT INTO staff
VALUES
	(NULL, '설민경', '개발', 30000, NULL),
    (NULL, '윤동석', '총무', 25000, NULL),
    (NULL, '하영선', '인사', 10000, NULL),
    (NULL, '오진호', '개발', 5000, 1),
    (NULL, '류민지', '개발', 4500, 4),
    (NULL, '권기남', '총무', 4000, 2),
    (NULL, '조예지', '인사', 3200, 3),
    (NULL, '배성은', '개발', 3500, 5);

SELECT * FROM STAFF;

SELECT
	l.staff_name AS 상급자이름, r.staff_name AS 하급자이름
FROM
	staff l INNER JOIN staff r
ON
	l.staff_id = r.staff_supervisor;
    
CREATE TABLE cat_tbl(
    animal_name VARCHAR(20),
    animal_age INT,
    animal_owner VARCHAR(20),
    animal_type VARCHAR(20)
);

CREATE TABLE dog_tbl(
	animal_name VARCHAR(20),
    animal_age INT,
    animal_owner VARCHAR(20),
    animal_type VARCHAR(20)
);

INSERT INTO cat_tbl
VALUES
	('모린', 7, '나', '고양이'),
    ('만두', 5, '별', '고양이');
    
INSERT INTO dog_tbl
VALUES
	('소망', 16, '나', '강아지'),
    ('멍뭉', 3, '솔', '강아지');

SELECT * FROM cat_tbl
UNION
SELECT * FROM dog_tbl;