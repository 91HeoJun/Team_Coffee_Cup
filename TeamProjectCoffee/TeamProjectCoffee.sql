-- 회원가입을 위한 UserTBL
CREATE TABLE UserTBL (
	userid		VARCHAR2(15), 			--아이디
	password	VARCHAR2(20)	NOT NULL, --비밀번호
	name		NVARCHAR2(10)	NOT NULL, --이름
	postcode	VARCHAR2(50)	NOT NULL,--우편번호
	address		VARCHAR2(50)	NOT NULL,--주소
	detailAddress    VARCHAR2(50),		--상세주소
	email		VARCHAR2(50)	NOT NULL, --이메일
	tel			VARCHAR2(20)	NOT NULL, --전화번호
	CONSTRAINT UserTBL_PK PRIMARY KEY (userid) --외래키: 아이디
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
    pCode       NUMBER(20)        NOT NULL, 
    pCategory	VARCHAR2(20)      NOT NULL, 
    product		VARCHAR2(50)      NOT NULL, 
    pContent	VARCHAR2(3000)    NOT NULL, 
    price       VARCHAR2(20)      NOT NULL, 
    pAmount		VARCHAR2(20)      NOT NULL, 
    pDate		DATE,
    origin		VARCHAR2(20),
    
    CONSTRAINT ProductTBL_PK PRIMARY KEY (pCode)
);

drop table ProductTBL;

-- 상품 
insert into ProductTBL (00, "싱글오리진", "산타 테레사", "머스캣, 망고, 딸기잼, 크랜베리 주스", "45,000", "250g", sysdate, "코스타리카" );
insert into ProductTBL (01, "블렌드", "에픽 블렌드", "산뜻한 산미, 고소하고 달콤한 여운, 굿 밸런스", "18,000", "250g", 20210202, "온두라스, 에티오피아" );
insert into ProductTBL (02, "드립백", "실속세트", "선물상자 미포함. 드립백 실속 구성, 10개 또는 30개 선택", "15,000", "10개", 20210201, "선택가능" );

-- Product 더미생성 쿼리
insert into ProductTBL(pCode, pCategory, product, pContent, price, pAmount, pDate, origin)
   (select seq_product.nextval, pCode, pCategory, product, pContent, price, pAmount, pDate, origin 
   from ProductTBL);


-- Auth 추가 (id:admin pw:admin123!)
create table UserTBL_auth(
	userid varchar2(50) not null,
	auth varchar2(50) not null,
	constraint fk_user_auth foreign key(userid) references UserTBL(userid)
);

insert into UserTBL_auth values('admin', 'ROLE_ADMIN');

