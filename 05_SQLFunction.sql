USE bitcamp06;

SELECT * FROM user_tbl;

INSERT INTO user_tbl VALUES
	(NULL, 'alex', 1986, 'NY', 173, '2020-11-01'),
    (NULL, 'Smith', 1992, 'Texas', 181, '2020-11-05'),
    (NULL, 'Emma', 1995, 'Tampa', 168, '2020-12-13'),
    (NULL, 'JANE', 1996, 'LA', 157, '2020-12-15');
    
SELECT
	user_name,
    UPPER(user_name) AS 대문자유저명,
    LOWER(user_name) AS 소문자유저명,
    LENGTH(user_name) AS 문자길이,
    SUBSTR(user_name, 1, 2) AS 첫번째두번째,
    CONCAT(user_name, ' 회원이 존재합니다.') AS 회원목록
FROM user_tbl;

# 이름이 4글자 이상인 유저만 출력
SELECT * FROM user_tbl
	WHERE LENGTH(user_name) >= 4;

SELECT * FROM user_tbl
	WHERE user_name like '____';

SELECT * FROM user_tbl
	WHERE user_name like '____%';
    
ALTER TABLE user_tbl ADD (user_weight DECIMAL(3, 2));
ALTER TABLE user_tbl MODIFY user_weight DECIMAL(5, 2);

SELECT * FROM user_tbl;

UPDATE user_tbl SET user_weight = 81.5 WHERE user_num=1;
UPDATE user_tbl SET user_weight = 88.88 WHERE user_num=2;
UPDATE user_tbl SET user_weight = 72.1 WHERE user_num=3;
UPDATE user_tbl SET user_weight = 63.8 WHERE user_num=4;
UPDATE user_tbl SET user_weight = 130 WHERE user_num=5;
UPDATE user_tbl SET user_weight = 57.8 WHERE user_num=6;
UPDATE user_tbl SET user_weight = 50.73 WHERE user_num=7;
UPDATE user_tbl SET user_weight = 70 WHERE user_num=8;
UPDATE user_tbl SET user_weight = 53.33 WHERE user_num=9;
UPDATE user_tbl SET user_weight = 99.9 WHERE user_num=10;

SELECT * FROM user_tbl;

SELECT
	user_name, user_weight,
    ROUND(user_weight, 0) AS 반올림,
    TRUNCATE(user_weight, 1) AS 키소수점아래_1자리절사,
    MOD(user_height, 150) AS 키_150으로나눈나머지,
    CEIL(user_weight) AS 키올림,
    FLOOR(user_weight) AS 키내림,
    SIGN(user_weight) AS 양수음수_0여부,
    SQRT(user_weight) AS 키_제곱근
FROM
	user_tbl;
    
SELECT
	user_name, entry_date,
    DATE_ADD(entry_date, INTERVAL 3 MONTH) AS _3개월후,
    LAST_DAY(entry_date) AS 해당월마지막날짜,
    TIMESTAMPDIFF(MONTH, entry_date, NOW()) AS 오늘과개월수차이,
    TRUNCATE(entry_date, 0) AS 날짜일시
FROM user_tbl;

SELECT
	user_num, user_name, entry_date,
    DATE_FORMAT(entry_date, '%Y년 %m월 %d일') AS 일자표현변경,
    CAST(user_num AS CHAR) AS 문자로바꾼회원번호
FROM
	user_tbl;
    
INSERT INTO user_tbl VALUES(NULL, '임쿼리', 1986, '제주', NULL, '2021-05-05', NULL);

SELECT * FROM user_tbl;

# NULL과 무슨 계산을 해도 NULL로 나옴
SELECT NULL + 10;

# IFNULL()을 이용해서 특정 컬럼이 NULL인 경우 대체값으로 표현
SELECT * FROM user_tbl;
SELECT
	user_name,
    IFNULL(user_height, 167) AS _NULL대체값넣은키,
    IFNULL(user_weight, 65) AS _NULL대체값넣은몸무게
FROM user_tbl;

# SQL에서 0으로 나누면
SELECT 10 / 0;

SELECT
	user_name, user_height,
    CASE
		WHEN user_height < 165 THEN '평균미만' 
        WHEN user_height = 165 THEN '평균'
        WHEN user_height > 165 THEN '평균이상'
	END AS 키분류,
    user_weight
FROM user_tbl;

# BMI(weight / height^2) on user_tbl의 결과를 18미만 저체중, ~24 정상체중, 25이상 고체중
SELECT
	user_name, user_height, user_weight,
    ROUND((user_weight)/(POWER(user_height*0.01, 2)), 2) AS BMI_RESULT,
    CASE
		WHEN (user_weight)/(POWER(user_height*0.01, 2)) < 18 THEN '저체중'
        WHEN (user_weight)/(POWER(user_height*0.01, 2)) BETWEEN 18 AND 25 THEN '정상체중'
        WHEN (user_weight)/(POWER(user_height*0.01, 2)) > 25 THEN '고체중'
        WHEN (user_weight IS NULL) OR (user_height IS NULL) THEN 'N/A'
	END AS BMI_CASE
FROM user_tbl;

SELECT
	user_address AS 지역,
	AVG(user_height) AS 평균키,
    AVG(user_weight) AS 평균몸무게,
    2024-AVG(user_birth_year) AS 평균연령
FROM user_tbl
GROUP BY user_address;

SELECT
    user_birth_year AS 생년,
    COUNT(user_birth_year) AS 인원수,
    ROUND(AVG(user_weight), 2) AS 평균몸무게
FROM user_tbl
GROUP BY user_birth_year
ORDER BY user_birth_year;

SELECT
	MAX(user_birth_year) AS 가장어린사람,
	MIN(user_birth_year) AS 가장늙은사람
FROM user_tbl;

SELECT
	user_address,
    AVG(user_birth_year) AS 생년평균,
    COUNT(*) AS 거주지수
FROM
	user_tbl
GROUP BY
	user_address
HAVING
	COUNT(*) >= 2;
    
SELECT
	user_birth_year AS 생년,
    AVG(user_height) AS 생년평균몸무게
FROM
	user_tbl
GROUP BY
	user_birth_year
HAVING AVG(user_height) >= 160
ORDER BY user_birth_year;