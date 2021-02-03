
-- 1:1 게시판을 위한 BoardTBL
CREATE TABLE BoardTBL (
	bno			NUMBER(10, 0)	NOT NULL, 
	title		VARCHAR2(200)	NOT NULL, 
	content		VARCHAR2(2000)	NOT NULL, 
	writer		VARCHAR2(50)	NOT NULL, 
	regdate		DATE			DEFAULT SYSDATE, 
	updatedate	DATE			DEFAULT SYSDATE, 
	replyCnt	NUMBER, 
	CONSTRAINT BoardTBL_PK PRIMARY KEY (bno)
);

-- 1:1 게시판의 글번호를 위한 시퀸스
CREATE SEQUENCE seq_board START WITH 1 INCREMENT BY 1;

-- 게시글 더미 생성 쿼리
insert into BoardTBL(bno, title, content, writer)
	(select seq_board.nextval, title, content, writer from BoardTBL);

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
	rno			NUMBER(10, 0)	CONSTRAINT BoardTBL_Reply_PK PRIMARY KEY, 
    bno			NUMBER(10)		NOT NULL, 
	reply		VARCHAR2(1000)	NOT NULL,
    replyer		VARCHAR2(50)	NOT NULL,
    replyDate	DATE DEFAULT SYSDATE, 
    updateDate	DATE DEFAULT SYSDATE, 
    CONSTRAINT BoardTBL_Reply_FK FOREIGN KEY(bno) REFERENCES BoardTBL(bno)
);

-- 1:1 게시판 댓글의 글번호를 위한 시퀸스
CREATE SEQUENCE seq_reply START WITH 1 INCREMENT BY 1;

-- BoarTBL의 bno와 BoardTBL_Reply bno 외래키 작업 
ALTER TABLE BoardTBL_Reply ADD CONSTRAINT FK_BoardTBL_Reply_bno_BoardTBL FOREIGN KEY (bno) REFERENCES BoardTBL (bno);

-- index
CREATE INDEX idx_reply ON BoardTBL_Reply(bno desc, rno asc);
