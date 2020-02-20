-- INTRANET 부터 생성할것!!

CREATE TABLE MEMBER(
    MNO NUMBER PRIMARY KEY,           --회원번호
    USERID VARCHAR2(50) NOT NULL UNIQUE, --회원 아이디
    USERPWD VARCHAR2(300) NOT NULL, -- 비밀번호
    USERNAME VARCHAR2(10) NOT NULL, -- 회원이름
    GENDER CHAR(1) CHECK (GENDER IN('M','F')),  --성별
    EMAIL VARCHAR2(50) UNIQUE NOT NULL,     --이메일
    PHONE VARCHAR2(50) UNIQUE NOT NULL,     --전화번호
    ADDRESS VARCHAR2(300) NOT NULL,         --주소
    ENROLLDATE DATE DEFAULT SYSDATE NOT NULL,--등록일
    CNO NUMBER,                      --자녀 번호
    CNAME VARCHAR2(20),						-- 자녀 이름
    CBDATE DATE,                    -- 자녀 생일
    CGENDER CHAR(1) CHECK (CGENDER IN ('M','F')),                    -- 자녀 성별
    CCLASS NUMBER CHECK (CCLASS IN (1,2,3,4)),                          -- 자녀 반
    MSTATUS VARCHAR2(1) DEFAULT 'N' CHECK (MSTATUS IN('Y','N')), -- 회원상태 Y- 가입상태 N- 삭제상태
    JOB_CODE NUMBER                                             -- 아이디 정보 확인
);

INSERT INTO MEMBER VALUES(1,'admin','admin','관리자','M','admin@naver.com','010-1235-1568','주소',DEFAULT,1,'나자녀',SYSDATE,'M',1,'Y',1);
select * from member;

CREATE TABLE BOARDTYPE(
    BTYPE NUMBER PRIMARY KEY,
    BNAME VARCHAR2(20) NOT NULL UNIQUE
);


INSERT INTO BOARDTYPE VALUES(1,'공지사항');
INSERT INTO BOARDTYPE VALUES(2,'앨범');
INSERT INTO BOARDTYPE VALUES(3,'문의보내기');


CREATE TABLE BOARD(
    BNO NUMBER PRIMARY KEY,                     -- 게시판번호
    BTITLE VARCHAR2(300) NOT NULL,              -- 게시판제목
    BCONTENT VARCHAR2(3000) NOT NULL,           -- 게시판 내용
    BWRITER VARCHAR2(50),                       -- 게시판 작성자
    BCOUNT NUMBER,                              -- 조회수
    BDATE DATE DEFAULT SYSDATE,                 -- 작성날짜
    QDATE DATE,                                 -- 상담 날짜
    BTYPE NUMBER,                               -- 게시판 타입(공지사항, 앨범, QNA)
    BFILE VARCHAR2(300),                         -- 첨부파일 or 사진
    BSTATUS VARCHAR2(1) DEFAULT 'Y' CHECK (BSTATUS IN('Y','N')),-- 게시글 삭제 상태(Y-삭제안됨 N-삭제됨)
    QSTATUS VARCHAR2(1) DEFAULT 'N' CHECK (QSTATUS IN('Y','N')), -- 문의 확인 상태
    CONSTRAINT BO_WRITER FOREIGN KEY(BWRITER)REFERENCES MEMBER(USERID),
    CONSTRAINT BOARD_TYPE FOREIGN KEY(BTYPE) REFERENCES BOARDTYPE(BTYPE)
);

CREATE TABLE GBOARD( -- 사진게시판
    GNO NUMBER PRIMARY KEY,                                     --게시판번호
    GTITLE VARCHAR2(300) NOT NULL,                              --제목
    GCONTENT VARCHAR2(3000) NOT NULL,                           --내용
    GwRITER VARCHAR2(50),                                       --작성자
    GCOUNT NUMBER,                                              --조회수
    GDATE DATE DEFAULT SYSDATE,                                 --작성날짜
    GFILE VARCHAR2(300),                                        --첨부파일
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y','N'))    --게시글 삭제 상태
);

CREATE TABLE QNA(
    QNO NUMBER PRIMARY KEY,                                     --문의 번호
    QTITLE VARCHAR2(300) NOT NULL,                              --문의 제목
    QCONTENT VARCHAR2(3000) NOT NULL,                           --문의 내용
    QWRITER VARCHAR2(50),                                       --작성자
    QDATE DATE DEFAULT SYSDATE,                                 --문의작성날짜
    ASK_DATE DATE,                                              --문의 신청 날짜
    CHK_STATUS VARCHAR2(1) DEFAULT 'N' CHECK (CHK_STATUS IN('Y','N')) -- 문의 확인여부
);


CREATE TABLE ALIMCODE(
    ALIM_CODE NUMBER PRIMARY KEY,           -- 알림장 구별번호
    ALIM_NAME VARCHAR2(20)                  -- 알림장 이름
);

INSERT INTO ALIMCODE VALUES(1,'아이 알림장');
INSERT INTO ALIMCODE VALUES(2,'귀가 통지서');
INSERT INTO ALIMCODE VALUES(3,'투약 통지서');

CREATE TABLE ALIMNOTE(
    AL_NO NUMBER PRIMARY KEY,       -- 알림장번호
    AL_CODE NUMBER,       -- 알림장 구별번호
    CNO NUMBER,                  -- 자녀번호
    AL_CONTENT VARCHAR2(1000),      -- 알림장내용
    AL_FEEL VARCHAR2(20),           -- 기분
    AL_HEATH VARCHAR2(20),          -- 건강
    AL_TEMP VARCHAR2(20),           -- 체온
    AL_MEAL VARCHAR2(20),           -- 식사여부
    AL_SLEEP VARCHAR2(20),          -- 수면시간
    AL_POOP VARCHAR2(20),           -- 배변상태
    AL_WRITER VARCHAR2(50),         -- 작성자,
    AL_DATE DATE,
    CONSTRAINT AL_CNO FOREIGN KEY(CNO) REFERENCES CHILD(CHILD_CODE),
    CONSTRAINT AL_WRITER FOREIGN KEY(AL_WRITER) REFERENCES MEMBER(USERID),
    CONSTRAINT AL_CODE FOREIGN KEY(AL_CODE) REFERENCES ALIMCODE(ALIM_CODE)
);


CREATE TABLE ALIMHOME(              -- 귀가 통지서
    ALHM_NO NUMBER PRIMARY KEY,     -- 통지서 번호
    AL_CODE NUMBER DEFAULT 2,       -- 알림장 구별번호
    CNO NUMBER,                -- 자녀 번호
    ALHM_WAYHOME VARCHAR2(20),      -- 귀가방법
    ALHM_TIME VARCHAR2(20),         -- 귀가시간
    ALHM_STAUTS VARCHAR2(20),       -- 보호자 관계
    ALHM_PHONE VARCHAR2(20),        -- 보호자 전화번호
    ALHM_STATUS2 VARCHAR2(20),      -- 비상연락망 관계
    ALHM_PHONE2 VARCHAR2(20),       -- 비상연락망 전화번호
    ALHM_WRITER VARCHAR2(50),       -- 작성자
    ALHM_DATE DATE,
    CONSTRAINT ALHM_CNO FOREIGN KEY(CNO) REFERENCES CHILD(CHILD_CODE),
    CONSTRAINT ALHM_WRITER FOREIGN KEY(ALHM_WRITER) REFERENCES MEMBER(USERID),
    CONSTRAINT ALHM_CODE FOREIGN KEY(AL_CODE) REFERENCES ALIMCODE(ALIM_CODE)
);


CREATE TABLE ALIMMEDI(              -- 투약 통지서
    ALMD_NO NUMBER PRIMARY KEY,     -- 투약 통지서 번호
    AL_CODE NUMBER DEFAULT 3,       -- 알림장 구별번호
    CNO NUMBER,                -- 자녀 번호
    ALMD_CON VARCHAR2(30),          -- 증상
    ALMD_TYPE VARCHAR2(30),         -- 약의 종류
    ALMD_VOL VARCHAR2(30),          -- 투약 용량
    ALMD_NUM VARCHAR2(30),          -- 투약 횟수
    ALMD_TIME VARCHAR2(30),         -- 투약 시간
    ALMD_TEMP VARCHAR2(30),         -- 보관 방법
    ALMD_PS VARCHAR2(100),          -- 특이사항
    ALMD_WRITER VARCHAR2(50),       -- 작성자
    ALMD_DATE DATE,
    CONSTRAINT ALMD_CNO FOREIGN KEY(CNO) REFERENCES CHILD(CHILD_CODE),
    CONSTRAINT ALMD_WRITER FOREIGN KEY(ALMD_WRITER) REFERENCES MEMBER(USERID),
    CONSTRAINT ALMD_CODE FOREIGN KEY(AL_CODE) REFERENCES ALIMCODE(ALIM_CODE)
);


CREATE TABLE FCALENDAR(
    FCALMONTH VARCHAR2(40) PRIMARY KEY,
    FCALIMG VARCHAR2(50)
);


CREATE SEQUENCE SEQ_BNO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;
-- 게시판 번호 시퀀스

CREATE SEQUENCE SEQ_GNO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;
-- 사진 게시판 시퀀스

CREATE SEQUENCE SEQ_QNO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;
-- 문의 시퀀스
  
CREATE SEQUENCE SEQ_MEMNO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;
-- 회원번호 시퀀스
  
CREATE SEQUENCE SEQ_ALIM
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;
-- 알림장 시퀀스 1
  
CREATE SEQUENCE SEQ_ALHM
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;
-- 알림장 시퀀스 2
CREATE SEQUENCE SEQ_ALMD
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;
-- 알림장 시퀀스 3



