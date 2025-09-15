--AjaxTest -> script.sql
--설문조사
DROP TABLE tblSurvey;

CREATE TABLE tblSurvey (
	seq number PRIMARY KEY,
	question varchar2(300) NOT NULL,
	item1 varchar2(100) NOT NULL,
	item2 varchar2(100) NOT NULL,
	item3 varchar2(100) NOT NULL,
	item4 varchar2(100) NOT NULL,
	cnt1 NUMBER DEFAULT 0 NOT NULL,
	cnt2 NUMBER DEFAULT 0 NOT NULL,
	cnt3 NUMBER DEFAULT 0 NOT NULL,
	cnt4 NUMBER DEFAULT 0 NOT NULL
);

INSERT INTO tblSurvey VALUES (1, '가장 자신있는 프로그래밍 언어는?', 
	'Java', 'Python', 'C#', 'Kotlin', DEFAULT, DEFAULT, DEFAULT, DEFAULT);

SELECT * FROM tblSurvey;

UPDATE TBLSURVEY SET 
	cnt1 = 13, 
	cnt2 = 5, 
	cnt3 = 10, 
	cnt4 = 2 
	WHERE seq = 1;

SELECT * FROM TBLINSA;

SELECT * FROM TBLUSER;

SELECT count(*) AS cnt FROM TBLUSER WHERE id=?;

SELECT * FROM ZIPCODE WHERE dong LIKE '%역삼%';

SELECT * FROM TBLADDRESS t ORDER BY seq ASC;

INSERT INTO TBLADDRESS (seq, name, age, gender, tel, address, regdate) 
	VALUES (seqAddress.nextVal, ?,?,?,?,?, DEFAULT);

DELETE FROM TBLADDRESS WHERE seq IN (122);

--ex10 고양이 좌표 관리하기
CREATE TABLE tblCat (
	catid varchar2(50) PRIMARY KEY,
	x NUMBER NOT NULL, --left
	y NUMBER NOT NULL  --top
);
INSERT INTO tblcat(catid, x, y) VALUES ('cat1', 0, 0);
SELECT * FROM tblcat;



COMMIT;