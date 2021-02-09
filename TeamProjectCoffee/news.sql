-- NEWS 테이블
create table news_tbl(
newsno number(10),
newstitle varchar2(200) not null,
newscontent varchar2(2000) not null,
newsregdate date default sysdate,
newsviewcnt int,
CONSTRAINT pk_news_tbl PRIMARY KEY (newsno)
);