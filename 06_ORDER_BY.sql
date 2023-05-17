USE bitcamp06;

SELECT *
FROM user_tbl
ORDER BY user_height DESC;

# from user_tbl, user_height asc, user_weight desc
SELECT *
FROM user_tbl
ORDER BY user_height, user_weight DESC;

SELECT
	user_num, user_name AS un,
    user_birth_year, user_address
FROM user_tbl
ORDER BY un DESC;

SELECT *
FROM user_tbl
ORDER BY user_birth_year;

# 지역별 키 평균을 내림차순
SELECT
	user_address,
    COUNT(*),
    ROUND(AVG(user_height), 1)
FROM user_tbl
GROUP BY user_address
ORDER BY AVG(user_height) DESC;

# 경기 사람들만 체중 역순
SELECT *
FROM user_tbl
ORDER BY
	CASE user_address
		WHEN '서울' THEN user_weight
        ELSE NULL
	END DESC;
    
SELECT * FROM user_tbl
ORDER BY
	CASE user_birth_year
		WHEN 1997 THEN user_height
        WHEN 1998 THEN user_name
        ELSE NULL
	END;