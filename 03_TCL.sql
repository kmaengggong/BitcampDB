CREATE TABLE bank_account(
	act_num INT(5) PRIMARY KEY AUTO_INCREMENT,
    act_owner TEXT NOT NULL,
    balance INT(10) NOT NULL
);

INSERT INTO bank_account VALUES
	(NULL, '나구매', 50000),
    (NULL, '가판매', 0);

SELECT * FROM bank_account;

# 트랜젝션 시작: DML? 전 저장
START TRANSACTION;

# 나구매 돈 -30000
UPDATE bank_account SET balance = (balance - 30000) WHERE act_owner = '나구매';

# 가판매 돈 +30000
UPDATE bank_account SET balance = (balance + 30000) WHERE act_owner = '가판매';

ROLLBACK;
TRUNCATE TABLE bank_account;

# COMMIT: 250000으로 다시 차감 및 증가하는코드, 커밋
START TRANSACTION;
UPDATE bank_account SET balance = (balance - 25000) WHERE act_owner = '나구매';
UPDATE bank_account SET balance = (balance + 25000) WHERE act_owner = '가판매';
# 커밋하면 트렌젝션 종료. 롤백해도 의미 없음.
COMMIT;
SELECT * FROM bank_account;

# SAVEPOINT: ROLLBACK 해당 지점 전까지는 반영, 해당 지점 이후는 반영 안함
START TRANSACTION;
UPDATE bank_account SET balance = (balance - 5000) WHERE act_owner = '나구매';
UPDATE bank_account SET balance = (balance + 5000) WHERE act_owner = '가판매';
SAVEPOINT first_tx;
ROLLBACK TO first_tx;
SELECT * FROM bank_account;
UPDATE bank_account SET balance = (balance - 5000) WHERE act_owner = '나구매';
UPDATE bank_account SET balance = (balance + 5000) WHERE act_owner = '가판매';
SAVEPOINT second_tx;
ROLLBACK;