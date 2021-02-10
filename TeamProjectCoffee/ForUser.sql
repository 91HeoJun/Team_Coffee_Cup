
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

--마이페이지, 출석체크 테스트용 (삭제예정)
insert into USERTBL 
values('hong123','hong123!!','홍길동','07085','서울시 종로구 관철동','중앙로156','test123@naver.com','010-1234-1234',1000);
insert into USERTBL 
values('hong1234','hong1234!!','홍길자','07085','서울시 종로구 관철동','중앙로156','test123@naver.com','010-1234-1234',1000);
