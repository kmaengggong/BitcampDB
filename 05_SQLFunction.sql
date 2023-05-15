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