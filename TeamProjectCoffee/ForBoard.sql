
-- 1:1 �Խ����� ���� BoarTBL
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

-- 1:1 �Խ����� �۹�ȣ�� ���� ������
CREATE SEQUENCE seq_board START WITH 1 INCREMENT BY 1;

-- 1:1 �Խ����� ÷�������� ���� BoardTBL_Attach
CREATE TABLE BoardTBL_Attach (
	uuid		VARCHAR2(100)	NOT NULL, 
	uploadPath	VARCHAR2(200)	NOT NULL, 
	fileName	VARCHAR2(100)	NOT NULL, 
	fileType	CHAR(1), 
	bno			NUMBER(10)		NOT NULL, 
    CONSTRAINT BoardTBL_Attach_PK PRIMARY KEY (uuid)
);

-- BoarTBL�� bno�� BoardTBL_Attach�� bno �ܷ�Ű �۾� 
ALTER TABLE BoardTBL_Attach ADD CONSTRAINT FK_BoardTBL_Attach_bno_BoardTB FOREIGN KEY (bno) REFERENCES BoardTBL (bno);

-- 1:1 �Խ����� ����� ���� BoardTBL_Reply
CREATE TABLE BoardTBL_Reply (
	rno			NUMBER(10, 0)	NOT NULL, 
    reply		VARCHAR2(1000)	NOT NULL, 
    replyDate	DATE			NOT NULL, 
    updateDate	DATE, 
    bno			NUMBER(10)		NOT NULL, 
    CONSTRAINT BoardTBL_Reply_PK PRIMARY KEY (rno)
);

-- 1:1 �Խ��� ����� �۹�ȣ�� ���� ������
CREATE SEQUENCE seq_reply START WITH 1 INCREMENT BY 1;

-- BoarTBL�� bno�� BoardTBL_Reply bno �ܷ�Ű �۾� 
ALTER TABLE BoardTBL_Reply ADD CONSTRAINT FK_BoardTBL_Reply_bno_BoardTBL FOREIGN KEY (bno) REFERENCES BoardTBL (bno);
