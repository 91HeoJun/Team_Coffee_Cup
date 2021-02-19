-- 회원가입을 위한 UserTBL
CREATE TABLE UserTBL (
	userid		VARCHAR2(15),  --아이디
	password	VARCHAR2(20)	NOT NULL, --비밀번호 
	name		NVARCHAR2(10)	NOT NULL,  --이름
	postcode	VARCHAR2(50)	NOT NULL, --우편번호
	address		VARCHAR2(50)	NOT NULL, --주소
	detailAddress    VARCHAR2(50),        --상세주소
	email		VARCHAR2(50)	NOT NULL, --이메일
	tel			VARCHAR2(20)	NOT NULL, --전화번호
	point 		number(20) not null,      --포인트
	CONSTRAINT UserTBL_PK PRIMARY KEY (userid)
);

--UserTBL 컬럼 수정 : password varchar2(20->60)
alter table userTBL modify(password VARCHAR2(60));
--UserTBL 컬럼 수정 : password varchar2(50->100)
alter table userTBL modify(address VARCHAR2(100));

select * from USERTBL;
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
    price       NUMBER    		  NOT NULL, 
    pAmount		VARCHAR2(20)      NOT NULL, 
    pDate		DATE			  DEFAULT SYSDATE,
    origin		VARCHAR2(50),
    
    CONSTRAINT ProductTBL_PK PRIMARY KEY (pCode)
);

select * from ProductTBL; where pcode = 4;

drop table ProductTBL;

-- 상품 코드를 시퀸스화
CREATE SEQUENCE seq_product START WITH 1 INCREMENT BY 1;

drop SEQUENCE seq_product;

delete from ProductTBL;

-- 상품 
insert into ProductTBL (pCode, pCategory, product, pContent, price, pAmount, pDate, origin) values (seq_product.nextval, '라이트', '산타 테레사', '싱글 오리진 / 머스캣, 망고, 딸기잼, 크랜베리 주스', 45000, '250g', '2021-02-18', '코스타리카');
insert into ProductTBL (pCode, pCategory, product, pContent, price, pAmount, pDate, origin) values (seq_product.nextval, '라이트', '에픽 블렌드', '블렌드 / 산뜻한 산미, 고소하고 달콤한 여운, 굿 밸런스', 18000, '250g', '2021-02-19', '온두라스, 에티오피아' );
insert into ProductTBL (pCode, pCategory, product, pContent, price, pAmount, pDate, origin) values (seq_product.nextval, '미디엄', '실속세트', '드립백 실속 구성/10개 또는 30개 선택/선물포장 미포함 ', 15000, '10개', '2021-02-19', '베트남' );
insert into ProductTBL (pCode, pCategory, product, pContent, price, pAmount, pDate, origin) values (seq_product.nextval, '라이트', '호세 게이샤', '싱글 오리진 / 재스민, 살구, 오렌지, 복숭아, 허니듀 멜론', 38000, '250g', '2021-02-18', '파나마');
insert into ProductTBL (pCode, pCategory, product, pContent, price, pAmount, pDate, origin) values (seq_product.nextval, '미디엄', '강릉 블렌드', '블렌드 / 잘 익은 과일의 산미, 농축된 단맛, 부드러운 촉감, 깊은 여운', 22000, '250g', '2021-02-19', '르완다, 과테말라, 그 외' );
insert into ProductTBL (pCode, pCategory, product, pContent, price, pAmount, pDate, origin) values (seq_product.nextval, '미디엄', '프리미엄세트', '드립백 선물 구성 / 20개 또는 40개 선택 / 선물포장 포함 ', 28000, '10개', '2021-02-19', '에티오피아' );
insert into ProductTBL (pCode, pCategory, product, pContent, price, pAmount, pDate, origin) values (seq_product.nextval, '미디엄', '월마르', '싱글 오리진 / 라즈베리, 건자두, 밀크 초콜릿, 클린 피니시', 22000, '250g', '2021-02-18', '과테말라' );
insert into ProductTBL (pCode, pCategory, product, pContent, price, pAmount, pDate, origin) values (seq_product.nextval, '다크', '클래식 에스프레소 블렌드', '블렌드  / 진한 초콜릿, 묵직한 단맛, 은은한 산미, 부드러운 질감', 22000, '500g', '2021-02-18', '브라질, 에티오피아, 그 외' );
insert into ProductTBL (pCode, pCategory, product, pContent, price, pAmount, pDate, origin) values (seq_product.nextval, '라이트', '저스틴', '싱글 오리진 / 오렌지 마멀레이드, 살구, 꿀, 시트러스', 22000, '250g', '2021-02-17', '르완다' );
insert into ProductTBL (pCode, pCategory, product, pContent, price, pAmount, pDate, origin) values (seq_product.nextval, '다크', '칸디도', '싱글 오리진 / 호두, 토피, 바닐라, 오렌지톤 산미', 20000, '250g', '2021-02-17', '에티오피아' );

-- 상품 더미 생성 쿼리
insert into ProductTBL(pCode, pCategory, product, pContent, price, pAmount, pDate, origin)
   (select seq_product.nextval, pCategory, product, pContent, price, pAmount, pDate, origin 
   from ProductTBL);
--상품 이미지 첨부 테이블
CREATE TABLE ProductTBL_Attach (
	uuid		VARCHAR2(100)	NOT NULL, 
	uploadPath	VARCHAR2(200)	NOT NULL, 
	fileName	VARCHAR2(100)	NOT NULL,	
	pcode			NUMBER(10)		NOT NULL, 
    CONSTRAINT ProductTBL_Attach_PK PRIMARY KEY (uuid)
);

alter table ProductTBL_Attach drop column filetype;
select * from ProductTBL_Attach;
drop table ProductTBL_Attach;

-- productTBL의 pcode와 productTBL_Attach의 pcode 외래키 작업 
ALTER TABLE ProductTBL_Attach ADD CONSTRAINT FK_ProductTBL_Attach_pcode_ProductTBL FOREIGN KEY (pcode) REFERENCES ProductTBL (pcode);

   
-- Auth 추가 (id:admin pw:admin123!)
create table UserTBL_auth(
	userid varchar2(50) not null,
	auth varchar2(50) not null,
	constraint fk_user_auth foreign key(userid) references UserTBL(userid)
);

select * from UserTBL_auth;

insert into UserTBL_auth values('admin', 'ROLE_ADMIN');

--출석체크 tbl
DROP TABLE CALENDAR
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_CAL;

CREATE TABLE CALENDAR(
CAL_SEQ NUMBER(8) PRIMARY KEY,
userid VARCHAR2(50) NOT NULL,
RDATE VARCHAR2(30) NOT NULL
);

CREATE SEQUENCE SEQ_CAL
START WITH 1
INCREMENT BY 1;

--userid 탈퇴시 calendar userid도 같이 삭제됨
ALTER TABLE CALENDAR
ADD CONSTRAINT FK_CAL_userid FOREIGN KEY(userid)
REFERENCES usertbl(userid) on delete cascade;

select * from usertbl;
select * from CALENDAR;

--스프링에서 시큐리티에서 remember me 를 위해 기본적으로 구현하는 테이블 
create table persistent_logins(
   username varchar2(64) not null,
   series varchar2(64) primary key,
   token varchar2(64) not null,
   last_used timestamp not null
);



drop table persistent_logins;

select table_name from user_tables;
select * from usertbl_auth;
select * from persistent_logins;