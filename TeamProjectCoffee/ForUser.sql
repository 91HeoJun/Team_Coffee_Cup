
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
