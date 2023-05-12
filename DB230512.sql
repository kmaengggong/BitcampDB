# 데이터베이스 생성
CREATE DATABASE bitcamp06 DEFAULT CHARACTER SET UTF8;

# 사용자 계정 생성
CREATE USER 'adminid' IDENTIFIED BY '2023502';

# 사용자 계정에 권한 부여
GRANT ALL PRIVILEGES ON bitcamp06.* TO 'adminid';

# 테이블 생성 명령
CREATE TABLE users(
	u_number INT(3) PRIMARY KEY,
    u_id VARCHAR(20) UNIQUE NOT NULL,
    u_name VARCHAR(30) NOT NULL,
    u_email VARCHAR(30)
);

# 데이터 적재
INSERT INTO users(u_number, u_id, u_name, u_email) VALUES (1, 'abcd1234', '가나다', NULL);
INSERT INTO users VALUES (2, 'qwer5678', '라마바', 'qwer5678@qwer.com');

# 데이터 조회
SELECT * FROM users;
SELECT (u_number) FROM users;

INSERT INTO users VALUES(3, 'zxcv8901', '사아자', 'zxcv8901@zxcv.com');
SELECT u_email, u_number, u_id FROM users;

CREATE USER 'adminid2' IDENTIFIED BY '2023502';
GRANT SELECT ON bitcamp06.* TO 'adminid2';

SELECT * FROM users;

# 주소 컬럼 추가
ALTER TABLE users ADD (u_address VARCHAR(30));

# 이메일 컬럼 삭제
ALTER TABLE users DROP COLUMN u_email;

# 주소 컬럼에 제약조건 추가
ALTER TABLE users ADD CONSTRAINT u_address_unique UNIQUE (u_address);
INSERT INTO users VALUES(5, 'asdf', 'ㅁㄴㅇㄹ', '강남구');

# 주소 칼럼 제약조건 제거
ALTER TABLE users DROP CONSTRAINT u_address_unique;
INSERT INTO users VALUES(6, 'qwer', 'ㅂㅈㄷㄱ', '강남구');

# 테이블 이름 변경
RENAME TABLE users TO members;
SELECT * FROM members;

# 테이블 초기화
TRUNCATE TABLE members;

# 테이블 삭제
DROP TABLE members;
