-- 회원가입을 위한 UserTBL
CREATE TABLE UserTBL (
	userid		VARCHAR2(15), 
	password	VARCHAR2(20)	NOT NULL, 
	name		NVARCHAR2(10)	NOT NULL, 
	gender		VARCHAR2(2)		NOT NULL, 
	birth		DATE			NOT NULL, 
	addr		VARCHAR2(50)	NOT NULL, 
	email		VARCHAR2(50)	NOT NULL, 
	tel			VARCHAR2(20)	NOT NULL, 
    CONSTRAINT UserTBL_PK PRIMARY KEY (userid)
);


-- 1:1 게시판을 위한 BoarTBL
CREATE TABLE BoardTBL (
	bno			NUMBER(10, 0)	NOT NULL, 
	title		VARCHAR2(200)	NOT NULL, 
	content		VARCHAR2(2000)	NOT NULL, 
	writer		VARCHAR2(50)	NOT NULL, 
	regdate		DATE			NOT NULL, 
	updatedate	DATE			NOT NULL, 
	replyCnt	NUMBER, 
	CONSTRAINT BoardTBL_PK PRIMARY KEY (bno)
);

-- 1:1 게시판의 글번호를 위한 시퀸스
CREATE SEQUENCE seq_board START WITH 1 INCREMENT BY 1;

-- 1:1 게시판의 첨부파일을 위한 BoardTBL_Attach
CREATE TABLE BoardTBL_Attach (
	uuid		VARCHAR2(100)	NOT NULL, 
	uploadPath	VARCHAR2(200)	NOT NULL, 
	fileName	VARCHAR2(100)	NOT NULL, 
	fileType	CHAR(1), 
	bno			NUMBER(10)		NOT NULL, 
    CONSTRAINT BoardTBL_Attach_PK PRIMARY KEY (uuid)
);

-- BoarTBL의 bno와 BoardTBL_Attach의 bno 외래키 작업 
ALTER TABLE BoardTBL_Attach ADD CONSTRAINT FK_BoardTBL_Attach_bno_BoardTB FOREIGN KEY (bno) REFERENCES BoardTBL (bno);

-- 1:1 게시판의 댓글을 위한 BoardTBL_Reply
CREATE TABLE BoardTBL_Reply (
	rno			NUMBER(10, 0)	NOT NULL, 
    reply		VARCHAR2(1000)	NOT NULL, 
    replyDate	DATE			NOT NULL, 
    updateDate	DATE, 
    bno			NUMBER(10)		NOT NULL, 
    CONSTRAINT BoardTBL_Reply_PK PRIMARY KEY (rno)
);

-- 1:1 게시판 댓글의 글번호를 위한 시퀸스
CREATE SEQUENCE seq_reply START WITH 1 INCREMENT BY 1;

-- BoarTBL의 bno와 BoardTBL_Reply bno 외래키 작업 
ALTER TABLE BoardTBL_Reply ADD CONSTRAINT FK_BoardTBL_Reply_bno_BoardTBL FOREIGN KEY (bno) REFERENCES BoardTBL (bno);


-- ProductTBL 부터 반영 예정
CREATE TABLE ProductTBL
(
    CODE        NUMBER(20)        NOT NULL, 
    CATEGORY    VARCHAR2(20)      NOT NULL, 
    NAME        VARCHAR2(50)      NOT NULL, 
    CONTENT     VARCHAR2(3000)    NOT NULL, 
    PRICE       NUMBER(20)        NOT NULL, 
    AMOUNT      NUMBER(20)        NOT NULL, 
    CONSTRAINT ProductTBL_PK PRIMARY KEY (CODE)
);