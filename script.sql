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

COMMIT;