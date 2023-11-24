-- addrbok table 생성

CREATE TABLE addrbook(
    bnum        NUMBER PRIMARY KEY,
    username    VARCHAR2(20) NOT NULL, 
    tel         VARCHAR2(20),
    email       VARCHAR2(30) UNIQUE,
    gender      VARCHAR2(6),
    regdate     TIMESTAMP DEFAULT SYSTIMESTAMP
);

CREATE SEQUENCE seq_bnum NOCACHE; -- 자동순번

INSERT INTO addrbook(bnum,username,tel,email,gender)
VALUES (seq_bnum.NEXTVAL, '최은호', '010-8774-8432','foreunho@gamil.com','남');
-- 이메일 중복 체크
INSERT INTO addrbook(bnum,username,tel,email,gender)
VALUES (seq_bnum.NEXTVAL, '김희린', '010-0101-0119','hirit@gamil.com','여');

COMMIT;

SELECT * FROM addrbook;
-- khit@kg.kr 인 이메일 찾기
SELECT email 
FROM addrbook 
WHERE email = 'foreunho@gmail.com';

DELETE FROM addrbook WHERE bnum = 4;
commit;
rollback;
drop Table addrbook;
drop sequence seq_bnum;
