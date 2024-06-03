show tables;

create table photoGallery (
  idx   int not null,									/* 고유번호(강제로 1씩 증가처리) */
  mid   varchar(20) not null,					/* 포토갤러리에 올린이 아이디 */
  part  varchar(10)  not null,				/* 분류(풍경/인물/학습/사물/기타) */		
  title varchar(100) not null,				/* 제목 */
  photoCount 	int not null,						/* 업로드 사진 수량 */
  hostIp			varchar(30)	not null,		/* 접속 IP */
  pDate				datetime not null default now(),	/* 올린 날짜 */
  goodCount  	int not null default 0, /* 좋아요수 */
  readNum			int not null default 0,	/* 조회수 */
  primary key(idx),
  foreign key(mid) references member(mid)
);

create table photoStorage (
  idx  int not null auto_increment,
  photoIdx int not null,						/* 포토갤러리 고유번호 */
  fSName	varchar(50) not null,			/* 포토갤러리에 올린 사진 이름 */
  primary key(idx),
  foreign key(photoIdx) references photoGallery(idx)
);

create table photoReply (
  idx  int not null auto_increment,
  mid   varchar(20) not null,				/* 포토갤러리에 댓글 올린이 아이디 */
  photoIdx int not null,						/* 포토갤러리 고유번호 */
  content  text not null,						/* 포토갤러리 댓글 내용 */
  primary key(idx),
  foreign key(photoIdx) references photoGallery(idx),
  foreign key(mid) references member(mid)
);