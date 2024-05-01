show tables;

create table member(
	idx int not null auto_increment,
	mid varchar(20) not null,
	age int default 20,
	gender varchar(2) default '여자'	
);

desc hoewon;

insert into hoewon values (default,'홍길동',25,'남자','서울');

select * from hoewon order by idx desc;

