--MarketTBL : 매장 정보를 저장한다.
create table storeTBL(
	code number(20) not null primary key,
	name varchar2(100) not null,
	address varchar2(200) not null,
	pic varchar2(200)
);


-- 시퀀스 : 매장 정보 입력 시 pk가 됨
CREATE SEQUENCE sq_store
START WITH 1 
INCREMENT BY 1
MINVALUE 1  
NOMAXVALUE
NOCYCLE;

select * from user_tables;
drop table marketTBL;
drop sequence sq_market;