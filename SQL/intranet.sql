CREATE SEQUENCE SEQ_ALIM
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_DRAFT
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_DAILY
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_NOTICE
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_CHILD
START WITH 2020001
INCREMENT BY 1
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_CALEN
START WITH 11
INCREMENT BY 1
NOCYCLE
NOCACHE;

CREATE TABLE JOB(
    JOB_CODE NUMBER PRIMARY KEY,
    JOB_NAME VARCHAR2(20) NOT NULL
);

INSERT INTO JOB VALUES(1,'원장');
INSERT INTO JOB VALUES(2,'부원장');
INSERT INTO JOB VALUES(3,'교사');
INSERT INTO JOB VALUES(4,'영양사');
INSERT INTO JOB VALUES(5,'계약직');

CREATE TABLE CLASS(
    CLASS_CODE NUMBER PRIMARY KEY,
    CLASS_NAME VARCHAR2(20) NOT NULL,
    LIMIT_AGE NUMBER NOT NULL,
    MAX_ENTRANCE NUMBER NOT NULL
);

--INSERT INTO CLASS VALUES(1,'떡잎',2,20);
--INSERT INTO CLASS VALUES(2,'감잎',3,20);
--INSERT INTO CLASS VALUES(3,'귤잎',5,20);
--INSERT INTO CLASS VALUES(4,'밤잎',7,20);



CREATE TABLE EMPLOYEE(
    EMP_CODE NUMBER PRIMARY KEY,
    EMP_NAME VARCHAR2(20) NOT NULL,
    EMP_JOB  NUMBER,
    EMP_NO VARCHAR2(50) NOT NULL UNIQUE,
    EMP_PHONE VARCHAR2(50) NOT NULL,
    EMP_ADDR VARCHAR2(150) NOT NULL,
    HIRE_DATE DATE NOT NULL,
    ENT_DATE DATE,
    ENT_YN VARCHAR2(10) CHECK (ENT_YN IN('Y','N')),
    EMP_CLASS NUMBER,
    HOBONG NUMBER,
    CONSTRAINT FK_EMP_JOB FOREIGN KEY(EMP_JOB) REFERENCES JOB(JOB_CODE),
    CONSTRAINT FK_EMP_CLASS FOREIGN KEY(EMP_CLASS) REFERENCES CLASS(CLASS_CODE)
);    


CREATE TABLE DRAFT(
    DRAFT_NO NUMBER PRIMARY KEY,
    DRAFT_TYPE NUMBER NOT NULL,
    DRAFT_EMP NUMBER,
    DRAFT_DATE DATE NOT NULL,
    DRAFT_YN VARCHAR2(10) CHECK (DRAFT_YN IN('Y','N')),
    SIGN_EMP NUMBER,
    SIGN_YN VARCHAR2(10) CHECK (SIGN_YN IN('Y','N')),
    RETURN_REASON VARCHAR2(50),
    DRAFT_TITLE VARCHAR2(50) NOT NULL,
    DRAFT_CONTENT VARCHAR2(300) NOT NULL,
    DRAFT_FILE VARCHAR2(300),
    DRAFT_PROCESS VARCHAR2(20) CHECK (DRAFT_PROCESS IN('검토','완료','반려')),
    CONSTRAINT FK_DRAFT_EMP FOREIGN KEY(DRAFT_EMP) REFERENCES EMPLOYEE(EMP_CODE),
    CONSTRAINT FK_SIGN_EMP FOREIGN KEY(SIGN_EMP) REFERENCES EMPLOYEE(EMP_CODE)
); 

ALTER TABLE DRAFT DROP COLUMN DRAFT_YN;
ALTER TABLE DRAFT ADD (DRAFT_CHK  VARCHAR2(10));
ALTER TABLE DRAFT ADD (DRAFT_IS_DEL VARCHAR2(10));

CREATE TABLE DRAFT_PROCESS(
   PRO_NO NUMBER PRIMARY KEY,
   PRO_NAME VARCHAR2(20)
);

INSERT INTO DRAFT_PROCESS VALUES(1,'검토');
INSERT INTO DRAFT_PROCESS VALUES(2,'승인');
INSERT INTO DRAFT_PROCESS VALUES(3,'반려');


CREATE TABLE DAILY(
    DAILY_NO NUMBER,
    DAILY_CLASS NUMBER,
    DAILY_TITLE VARCHAR2(50) NOT NULL,
    DAILY_DATE DATE,
    DAILY_EMP_NAME VARCHAR2(20) NOT NULL,
    DAILY_PASS VARCHAR2(50),
    DAILY_FILE VARCHAR2(150),
    DAILY_EMP NUMBER,
    IS_DELETE VARCHAR2(10) CHECK(IS_DELETE IN ('Y','N')),
    CONSTRAINT FK_DAILY_EMP FOREIGN KEY(DAILY_EMP) REFERENCES EMPLOYEE(EMP_CODE),
    CONSTRAINT FK_DAILY_CLASS FOREIGN KEY(DAILY_CLASS) REFERENCES CLASS(CLASS_CODE)
);

ALTER TABLE DAILY RENAME COLUMN DAILY_PASS TO DAILY_CATEGORY;
ALTER TABLE DAILY MODIFY DAILY_CATEGORY NUMBER;
ALTER TABLE DAILY ADD CONSTRAINT CHK_CATEGORY CHECK(DAILY_CATEGORY IN (1,2)); 
ALTER TABLE DAILY DROP PRIMARY KEY;



CREATE TABLE DAILY_CATEGORY(
    CATEGORY_CODE NUMBER PRIMARY KEY,
    CATEGORY_NAME VARCHAR2(20)
);
INSERT INTO DAILY_CATEGORY VALUES(1,'공지사항');
INSERT INTO DAILY_CATEGORY VALUES(2,'교육일지');

CREATE TABLE CHILD(
    CHILD_CODE NUMBER PRIMARY KEY,
    CHILD_NAME VARCHAR2(20) NOT NULL,
    CHILD_GENDER VARCHAR2(10) CHECK (CHILD_GENDER IN('M','F')),
    CHILD_NO VARCHAR2(50) NOT NULL UNIQUE,
    CHILD_BIRTH DATE,
    CHILD_ENRANCE DATE,
    CHILD_GRADUATE DATE,
    CHILD_ADDR VARCHAR2(150) NOT NULL,
    CHILD_IMAGE VARCHAR2(200),
    CHILD_AGE NUMBER,
    CHILD_IS_IN VARCHAR2(20) CHECK (CHILD_IS_IN IN('재학','휴원','졸업')),
    CHILD_CLASS NUMBER,
    CONSTRAINT FK_CHILD_CLASS FOREIGN KEY(CHILD_CLASS) REFERENCES CLASS(CLASS_CODE)
);

ALTER TABLE CHILD DROP COLUMN CHILD_SUN_MOON;

CREATE TABLE FAMILY(
    CHILD_CODE NUMBER REFERENCES CHILD(CHILD_CODE),
    FAMILY_REL VARCHAR2(10) CHECK (FAMILY_REL IN('부','모','기타')),
    FAMILY_NAME VARCHAR2(20) NOT NULL,
    FAMILY_PHONE VARCHAR2(50),
    FAMILY_SUB VARCHAR2(50),
    FAMILY_EMAIL VARCHAR2(50),
    SIGN_YN VARCHAR2(10) CHECK (SIGN_YN IN ('Y','N')),
    FAMILY_MEMO VARCHAR2(50)
);

CREATE TABLE EVENT(
    E_CODE VARCHAR2(50),
	E_CONTENT CLOB NOT NULL
); 

INSERT INTO EVENT VALUES('급식남품업체 입찰','{"allDay":false,"backgroundColor":"#D25565","start":"2020-02-07 09:30","description":"동원식품, 한일식품, 롯데제과, 해테","end":"2020-02-07T15:00","_id":1,"title":"급식남품업체 입찰","type":"기타","textColor":"#ffffff","username":"영양사"}');
INSERT INTO EVENT VALUES('화재안전점검','{"allDay":false,"backgroundColor":"#9775fa","start":"2020-02-01 12:30","description":"2020년 정기 화재점검","end":"2020-02-01T15:30","_id":2,"title":"화재안전점검","type":"기타","textColor":"#ffffff","username":"임도훈"}');
INSERT INTO EVENT VALUES('2월 원생 생일 파티','{"allDay":true,"backgroundColor":"#ffa94d","start":"2020-02-03","description":"대상 : 임도훈,이서원,이승효","end":"2020-02-03","_id":3,"title":"2월 원생 생일 파티","type":"원내행사","textColor":"#ffffff","username":"교사"}');
INSERT INTO EVENT VALUES('적금 만기','{"allDay":true,"backgroundColor":"#74c0fc","start":"2020-02-06","description":"적금 갱신 요함","end":"2020-02-06","_id":4,"title":"적금 만기","type":"기타","textColor":"#ffffff","username":"원장"}');
INSERT INTO EVENT VALUES('원생 화스트페이스','{"allDay":true,"backgroundColor":"#63e6be","start":"2020-02-14","description":"비밀임","end":"2020-02-14","_id":6,"title":"원생 화스트페이스","type":"원내행사","textColor":"#ffffff","username":"원장"}');
INSERT INTO EVENT VALUES('피시방 체험학습','{"allDay":true,"backgroundColor":"#a9e34b","start":"2020-02-18","description":"프로게이머 양성을 위한 조기교육","end":"2020-02-18","_id":7,"title":"피시방 체험학습","type":"체험학습","textColor":"#ffffff","username":"교사"}');
INSERT INTO EVENT VALUES('2월 정기회의','{"allDay":false,"backgroundColor":"#4d638c","start":"2020-02-24 09:00","description":"졸면 사망","end":"2020-02-24T10:00","_id":8,"title":"2월 정기회의","type":"교사일정","textColor":"#ffffff","username":"교사"}');
INSERT INTO EVENT VALUES('출장','{"allDay":true,"backgroundColor":"#495057","start":"2020-02-28","description":"사실 놀러감","end":"2020-02-28","_id":9,"title":"출장","type":"교사일정","textColor":"#ffffff","username":"원장"}');
INSERT INTO EVENT VALUES('입학 원서접수','{"allDay":true,"backgroundColor":"#9775fa","start":"2020-02-19","description":"귀찮으니 하지마세요","end":"2020-02-21","_id":10,"title":"입학 원서접수","type":"원내행사","textColor":"#ffffff","username":"원장"}');
INSERT INTO EVENT VALUES('원생 배틀로얄','{"allDay":true,"backgroundColor":"#D25565","start":"2020-02-05","description":"강한자만이 살아남는다","end":"2020-02-06","_id":11,"title":"원생 배틀로얄","type":"원내행사","textColor":"#ffffff","username":"교사"}');
INSERT INTO EVENT VALUES('나나나','{"allDay":true,"backgroundColor":"#D25565","start":"2020-01-31","description":"","end":"2020-02-01","_id":12,"title":"나나나","type":"기타","textColor":"#ffffff","username":"교사"}');







