SELECT * FROM user_tbl;
SELECT * FROM buy_tbl1;

# 수도권(서울, 경기)에 사는 사람들을 쿼리 하나로 조회
SELECT * FROM user_tbl WHERE user_address = '서울' OR user_address = '경기';

# IN 문법은 IN 다음에 오는 리스트 목록에 포함된 요소만 출력
SELECT * FROM user_tbl WHERE user_address IN ('서울', '경기');

# IN을 이용해 구매내역이 있는 유저만 출력
SELECT user_num FROM buy_tbl1;
SELECT * FROM user_tbl WHERE user_num IN (SELECT user_num FROM buy_tbl1);

# like 구문은 패턴 일치 여부를 통해서 조회
# %는 와일드 카드 문자로, 어떤 문자가 몇 글자가 와도 좋다는 의미
# _는 와일드 카드 문자로, _ 하나당 1글자씩 처리
SELECT * FROM user_tbl WHERE user_address like "_남";
SELECT * FROM user_tbl WHERE user_name like "%자바";

# BETWEEN A AND B, IS NULL
SELECT * FROM user_tbl WHERE user_height BETWEEN 170 AND 180;
SELECT * FROM user_tbl WHERE user_height >= 170 AND user_height <= 180 ORDER BY user_birth_year;

INSERT INTO user_tbl VALUES
	(NULL, '가나다', 1997, '인천', NULL, '2015-03-05');
    
SELECT *
FROM user_tbl
WHERE user_height IS NULL;

