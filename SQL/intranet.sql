CREATE SEQUENCE SEQ_EMP
START WITH 1001
INCREMENT BY 1
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_ALIM
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_DRAFT
START WITH 20200000
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
INSERT INTO JOB VALUES(6,'학부모');

CREATE TABLE CLASS(
    CLASS_CODE NUMBER PRIMARY KEY,
    CLASS_NAME VARCHAR2(20) NOT NULL,
    LIMIT_AGE NUMBER NOT NULL,
    MAX_ENTRANCE NUMBER NOT NULL
);

INSERT INTO CLASS VALUES(1,'씨앗',3,20);
INSERT INTO CLASS VALUES(2,'새싹',4,20);
INSERT INTO CLASS VALUES(3,'나무',5,20);
INSERT INTO CLASS VALUES(4,'열매',7,20);
INSERT INTO CLASS VALUES(0,'원장',0,0);


  


CREATE TABLE DRAFT(
    DRAFT_NO NUMBER PRIMARY KEY,
    DRAFT_TYPE NUMBER NOT NULL,
    DRAFT_EMP NUMBER,
    DRAFT_DATE DATE NOT NULL,
    DRAFT_YN VARCHAR2(10) CHECK (DRAFT_YN IN('Y','N')),
    SIGN_EMP VARCHAR2(100),
    SIGN_YN VARCHAR2(100),
    RETURN_REASON VARCHAR2(300),
    DRAFT_TITLE VARCHAR2(50) NOT NULL,
    DRAFT_CONTENT VARCHAR2(300) NOT NULL,
    DRAFT_FILE VARCHAR2(300),
    DRAFT_PROCESS VARCHAR2(20) CHECK (DRAFT_PROCESS IN('검토','승인','반려')),
    CONSTRAINT FK_DRAFT_EMP FOREIGN KEY(DRAFT_EMP) REFERENCES EMPLOYEE(EMP_CODE)
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
ALTER TABLE DAILY ADD (DAILY_CONTENT VARCHAR2(500));
ALTER TABLE DAILY ADD (DAILY_COUNT NUMBER);


CREATE TABLE DAILY_CATEGORY(
    CATEGORY_CODE NUMBER PRIMARY KEY,
    CATEGORY_NAME VARCHAR2(20)
);
INSERT INTO DAILY_CATEGORY VALUES(1,'공지사항');
INSERT INTO DAILY_CATEGORY VALUES(2,'교육일지');

CREATE TABLE CHILD(
    CHILD_CODE NUMBER PRIMARY KEY,
    CHILD_NAME VARCHAR2(20) NOT NULL,
    CHILD_GENDER VARCHAR2(10),
    CHILD_NO VARCHAR2(50) NOT NULL UNIQUE,
    CHILD_BIRTH VARCHAR2(50),
    CHILD_ENTRANCE VARCHAR2(50),
    CHILD_GRADUATE VARCHAR2(50) DEFAULT '1900',
    CHILD_ADDR VARCHAR2(500) NOT NULL,
    CHILD_AGE NUMBER,
    CHILD_STATE VARCHAR2(20),
    CHILD_CLASS VARCHAR2(50),
    CHILD_IMAGE VARCHAR2(200),
    PARENT_CODE NUMBER DEFAULT 0
);
INSERT INTO CHILD VALUES(10000,'박테스트','중성','200202-1111111','2020-02-02','2019-03-02','1900','노숙',1,'재학','5','SIBAL',0);
INSERT INTO CHILD VALUES(SEQ_CHILD.NEXTVAL,'홍달이','남','170201-3129421','20170201','20190101',null,'경기도',3,'재학','2',null,null);
INSERT INTO CHILD VALUES(SEQ_CHILD.NEXTVAL,'서민정','여','160730-4028392','20160730','20180101',null,'서울',4,'재학','1',null,null);					      
INSERT INTO MEMBER VALUES(SEQ_MEMNO.NEXTVAL,'dalmom','gfv5KaYZb641ZNNEV7Dy90NFeG+fw6diA59X6NR/X4phLmGpbzPuFlQU3jbnqw0mFWZ6djauXVmLWvslzofAtA==','이경인','F','dalmom@naver.com','01093851749','06031, 서울 강남구 논현로 841 (신사동, 제이비 미소빌딩), 1903호','20200229','2020001','홍달이','20200202','M','	1','Y','6');
INSERT INTO MEMBER VALUES(SEQ_MEMNO.NEXTVAL,'minzzang','gfv5KaYZb641ZNNEV7Dy90NFeG+fw6diA59X6NR/X4phLmGpbzPuFlQU3jbnqw0mFWZ6djauXVmLWvslzofAtA==','서준수','M','minzzang@daum.net','01048275728','07289, 서울 영등포구 경인로 701 (문래동2가), 1층','20200229','2020002','서민정','20200202','F','2','Y','6');					      
INSERT INTO MEMBER VALUES(SEQ_MEMNO.NEXTVAL,'1001','gfv5KaYZb641ZNNEV7Dy90NFeG+fw6diA59X6NR/X4phLmGpbzPuFlQU3jbnqw0mFWZ6djauXVmLWvslzofAtA==','박막례','F','mrpark@gmail.com','01038591042','04055, 서울 마포구 와우산로27길 79 (서교동), 1','20200229','10000','박테스트','20200202','M','4','Y','1');
INSERT INTO MEMBER VALUES(SEQ_MEMNO.NEXTVAL,'1003','gfv5KaYZb641ZNNEV7Dy90NFeG+fw6diA59X6NR/X4phLmGpbzPuFlQU3jbnqw0mFWZ6djauXVmLWvslzofAtA==','김지혜','F','jgkim@daum.net','01047290531','03158, 서울 종로구 삼봉로 100 (공평동), 1층','20200229','10000','박테스트','20200202','M','4','Y','3');
INSERT INTO MEMBER VALUES(SEQ_MEMNO.NEXTVAL,'1006','gfv5KaYZb641ZNNEV7Dy90NFeG+fw6diA59X6NR/X4phLmGpbzPuFlQU3jbnqw0mFWZ6djauXVmLWvslzofAtA==','함원심','M','1sim@daum.net','01093859293','06031, 서울 강남구 논현로 841 (신사동, 제이비 미소빌딩), 1903호','20200229','10000','박테스트','20200202','M','4','Y','3');
				
					      
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


CREATE TABLE EMPLOYEE(
    EMP_CODE NUMBER PRIMARY KEY,
    EMP_NAME VARCHAR2(20) NOT NULL,
    EMP_JOB  VARCHAR2(20),
    EMP_NO VARCHAR2(50) NOT NULL UNIQUE,
    EMP_PHONE VARCHAR2(50) NOT NULL,
    EMP_EMAIL VARCHAR2(100) NOT NULL,
    EMP_ADDR VARCHAR2(450) NOT NULL,
    HIRE_DATE VARCHAR2(50) NOT NULL,
    ENT_DATE VARCHAR2(50),
    ENT_YN VARCHAR2(10),
    EMP_CLASS VARCHAR2(20),
    HOBONG NUMBER DEFAULT 1,
    EMP_IMG VARCHAR2(50)
);


INSERT INTO EMPLOYEE VALUES('1001','박막례','1','630123-2091841','01038591042','mrpark@gmail.com','서울 마포구 와우산로27길, 79','20101001',null,'Y',null,'23','1001.png');
INSERT INTO EMPLOYEE VALUES('1002','정재일','2','720912-1736284','01095820623','jeailjung@naver.com','서울 광진구 동일로22길, 111','20111001',null,'Y',null,'20','1002.png');
INSERT INTO EMPLOYEE VALUES('1003','김지혜','3','910430-2840185','01047290531','jgkim@daum.net','서울 종로구 삼봉로 100, 1층','20130201',null,'Y','1','7','1003.png');
INSERT INTO EMPLOYEE VALUES('1004','박승현','3','920627-1740180','01088369592','shpark@naver.com','서울 중구 다산로 265, 럭키프라자 1층','20130201','20140531','N','2','6','1004.png');
INSERT INTO EMPLOYEE VALUES('1005','김정희','3','840103-2829672','01096721846','junghee@gmail.com','서울 은평구 연서로 221, 3층','20130201','20150131','N','3','12','1005.png');
INSERT INTO EMPLOYEE VALUES('1006','함원심','3','930512-1058372','01093859293','1sim@daum.net','서울 강남구 논현로 841, 1903호','20140601',null,'Y','2','5','1006.png');
INSERT INTO EMPLOYEE VALUES('1007','박민영','3','900418-2059381','01052859325','minyoung@naver.com','서울 강동구 구천면로 429, 3층','20140210',null,'Y','3','8','1007.png');
INSERT INTO EMPLOYEE VALUES('1008','김남주','5','850718-2049184','01078942672','nammmjooo@gmail.com','서울 송파구 백제고분로7길, 28-5','20150201',null,'Y',null,'0','1008.png');
INSERT INTO EMPLOYEE VALUES('1009','이준영','3','880507-2058362','01028462819','young@gmail.com','서울 구로구 개봉로20길 54, 405호','20150201',null,'Y','4','10','1009.png');
INSERT INTO EMPLOYEE VALUES('1010','강지영','4','790828-2769265','01094625174','jeeyoungkang@naver.com','서울 구로구 도림천로 338, 309호','20150301',null,'Y',null,'15','1010.png');
INSERT INTO EMPLOYEE VALUES('1011','염준혁','5','640921-1095832','01095621739','jh@gmail.com','서울 서초구 강남대로61길 13, 1204호','20151001',null,'Y',null,'0','1011.png');
INSERT INTO EMPLOYEE VALUES('1012','박영순','5','641029-2078321','01035271957','yson@daum.net','서울 양천구 신월로 294, 1층','20161010',null,'Y',null,'0','1012.png');
INSERT INTO EMPLOYEE VALUES('1013','김아름','5','701207-2759105','01046251893','beautykim@gmail.com','서울 성동구 아차산로7길 8, 2층 205호','20161104',null,'Y',null,'0','1013.png');
INSERT INTO EMPLOYEE VALUES('1014','박다희','5','940207-2582714','01085728174','daaaheee@gmail.com','서울 마포구 독막로 153, 1층 3호','20190101',null,'Y',null,'0','1014.png');


-- 알림장
INSERT INTO ALIMHOME VALUES(SEQ_ALHM.NEXTVAL,'2','2020001','차량','오전','하원도우미','010947293533','할머니','01044839683','dalmom','20200229','N');
INSERT INTO ALIMHOME VALUES(SEQ_ALHM.NEXTVAL,'2','2020002','도보','오전','엄마','01035389853','아빠','01038892848','minzzang','20200229','N');
INSERT INTO ALIMMEDI VALUES(SEQ_ALMD.NEXTVAL,'3','2020001','감기','물약','한봉','2회','오전9시','on','약을 싫어해요','dalmom','20200229','N');
INSERT INTO ALIMMEDI VALUES(SEQ_ALMD.NEXTVAL,'3','2020002','몸살','물약','6ml','1회','오전9시','on','약을 싫어해요','minzzang','20200229','N');
INSERT INTO ALIMNOTE VALUES(SEQ_ALIM.NEXTVAL,'1','2020001','"달이가 오늘은 감기 기운이 있어서 컨디션이 안좋아요"','나쁨','나쁨','미열','약간','8시간','보통','dalmom','20200229','N');	

-- 공지사항 / 교육일지
INSERT INTO DAILY VALUES(SEQ_DAILY.NEXTVAL,'0','팡팡어린이집 공지사항입니다','20/02/29','박막례','1','1001','N','팡팡어린이집 공지사항입니다');
INSERT INTO DAILY VALUES(SEQ_DAILY.NEXTVAL,'2','3월 3일 단체 회식 있습니다.','	20/02/29','함원심','1','1006','N','"3월 3일 단체 회식 있습니다. 장소 : 또보겠지떡볶이 홍대점  시간 : 3월 3일 퇴근 후 불참자는 말씀해주세요"');
INSERT INTO DAILY VALUES(SEQ_DAILY.NEXTVAL,'1','씨앗반 2월 29일 교육일지입니다','20/02/29','김지혜','2','1003','N','씨앗반 교육일지 입니다');
INSERT INTO DAILY VALUES(SEQ_DAILY.NEXTVAL,'2','새싹반 2월 29일 교육일지입니다','20/02/29','박민영','2','1007','N','새싹반 교육일지 입니다');
INSERT INTO DAILY VALUES(SEQ_DAILY.NEXTVAL,'3','나무반 2월 29일 교육일지입니다','20/02/29','함원심','2','1006','N','나무반 교육일지 입니다');
INSERT INTO DAILY VALUES(SEQ_DAILY.NEXTVAL,'4','열매반 2월 29일 교육일지입니다','20/02/29','이준영','2','1009','N','열매반 교육일지 입니다');
				
-- 			
INSERT INTO DRAFT VALUES(SEQ_DRAFT.NEXTVAL,'1','1003','20/02/29','1009,1006,1001,',null,null,'지출결의서 작성','"지출결의서 내역 :    외 합계 금액 :    원 위 금액을 청구하오니 결재 바랍니다. ** 지출결의서 파일을 첨부해주세요 "',null,'검토','N','N');
INSERT INTO DRAFT VALUES(SEQ_DRAFT.NEXTVAL,'1','1003','20/02/29','1001,','N,','aaa,','지출결의서 작성','"지출결의서 내역 :    외  합계 금액 :    원 위 금액을 청구하오니 결재 바랍니다. ** 지출결의서 파일을 첨부해주세요 "',null,'반려','N','N');
INSERT INTO DRAFT VALUES(SEQ_DRAFT.NEXTVAL,'2','1006','20/02/29','1002,1001,','Y,Y,','조심히 다녀오세요,다녀오세요,','휴가 신청합니다','"휴가신청서  휴가 기간 :  2020 년 3 월 2 일  ~   2020년  3월 3 일  총 1 일  휴가 사유 :  개인적 사유   위와 같이 휴가를 신청하오니 결재 바랍니다.  ** 휴가신청서 파일을 첨부해주세요 "',null,'승인','N','N');
INSERT INTO DRAFT VALUES(SEQ_DRAFT.NEXTVAL,'1','1009','20/02/29','1001,',null,null,'2월 지출 결의서 입니다','지출결의서  내역 :    간식 외 합계 금액 :    30,000원 위 금액을 청구하오니 결재 바랍니다. ** 지출결의서 파일을 첨부해주세요 "',null,'검토','N','N');
INSERT INTO DRAFT VALUES(SEQ_DRAFT.NEXTVAL,'3','1007','20/02/29','1002,1001,',null,null,'3월분 교구 신청합니다.','교구신청서  품목 :   스케치북 외  10 개   금액 :    50,000원   위와 같이 교재 교구의 구입을 신청하오니 결재 바랍니다.  ** 교구신청서 파일을 첨부해주세요 "',null,'검토','N','N');				
