--MarketTBL : 매장 정보를 저장한다.
create table storeTBL(
	code number(20) not null primary key,
	name varchar2(100) not null,
	address varchar2(200) not null
);

drop table storeTBL;

create table storeTBL_attach(
	uuid varchar2(100) not null,
	uploadPath varchar2(200) not null,
	fileName varchar2(100) not null,
	fileType char(1) not null,
	code number(10)
)

alter table storeTBL add (regDate Date default sysdate);
alter table storeTBL add (updateDate Date default sysdate);

alter table storeTBL drop column regDate; 
alter table storeTBL drop column updateDate; 

alter table storeTBL_attach add(updateDate Date default sysdate);

alter table storeTBL_attach drop column updateDate;

-- alter table spring_attach drop constraint pk_attach;
alter table storeTBL_attach add constraint pk_attach primary key(uuid);
alter table storeTBL_attach
add constraint fk_board_attach foreign key(code) references storeTBL(code);

--매장 관련 테이블 조회
select * from storeTBL;
select * from storeTBL_attach;

-- 시퀀스 : 매장 정보 입력 시 pk가 됨
CREATE SEQUENCE sq_store
START WITH 1 
INCREMENT BY 1
MINVALUE 1  
NOMAXVALUE
NOCYCLE;

---자식 레코드 안지우면 테이블 삭제 불가능
--파일 첨부 테이블 데이터 모두 삭제
delete from storeTBL_attach;
--매장 테이블 데이터 모두 삭제
delete from storeTBL;

select * from user_tables;
drop table marketTBL;
drop sequence sq_market;