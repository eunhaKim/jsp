show tables;

/* 신고테이블(complaint) */
create table complaint(
	idx int not null auto_increment, /* 신고 테이블 고유번호 */
	part varchar(15) not null, /* 신고 분류(게시판:board, 자료실:pds, 방명록:guest) */
	partIdx int not null, /* 신고분류 항목글의 고유번호 */
	cpMid varchar(20) not null, /* 신고자 아이디 */
	cpContent text not null, /* 신고 사유 */
	cpDate datetime default now(), /* 신고한 날짜 */
	primary key(idx)
);

desc complaint;

insert into complaint value (default, 'board', 8 , 'admin', '성의없음', default);

select * from complaint;

select c.*, b.title, b.nickName, b.mid from complaint c, board b where c.partIdx = b.idx;

select c.*, b.title, b.nickName, b.mid from complaint c, board b where c.partIdx = b.idx;
select c.*, date_format(c.cpDate, '%Y-%m-%d %H:%i') as cpDate, b.title, b.nickName, b.mid from complaint c, board b where c.partIdx = b.idx;


update complaint set complaint = 'OK'