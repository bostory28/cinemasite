insert into movie(
	movie_seq,	-- 영화제목
	title ,	-- 영화장르
	genre ,	-- 영화감독
	director ,	-- 영화배우들
	actors,	-- 영화제작나라
	nation ,	-- 상영시간
	runningtime ,	-- 영화등급
	rate,	-- 영화개봉일
	openingday ,	-- 영화종영일
	closingday ,	-- 영화포스터
	poster ,	-- 영화줄거리
	story ,	-- 제작날짜
	madeday
) values (
	SEQ_movie_movie_seq.nextval,
	'빅히어로',
	'애니메이션',
	'돈 홀',
	'다네엘 헤니, 리아언 포터, 스콧애짓',
	'미국',
	108,
	0,
	to_date('150121','YY/MM/DD'),
	to_date('150321','YY/MM/DD'),
	'bighero2015_poster.jpg',irector ,actors,	nation ,	runningtime ,	rate,	openingday ,	closingday ,	poster ,	story ,madeday) values (
	SEQ_movie_movie_seq.nextval,	'빅아이즈',	'드라마',	'팀 버튼',	'에이미 아담스, 크리스토프 왈츠',	'미국',	105,	12,to_date('150128','YY/MM/DD'),
	to_date('150328','YY/MM/DD'),	'bigeyes2015_poster.jpg',
	'“누가 진짜 이 그림을 
	'치명적인 몸매! 꼭 안아주고 싶은 힐링로봇 ‘베이맥스’가장 사랑스러운 슈퍼히어로가 온다!천재 공학도 ‘테디’가 개발한 힐링로봇 ‘베이맥스’!  ‘테디’의 동생이자 로봇 전문가인 ‘히로’는 도시가 파괴될 위기에 처하자 ‘베이맥스’를 슈퍼히어로로 업그레이드 하는데… 과연 이들은 도시의 위험을 막아낼 수 있을까?',
	to_date('140101','YY/MM/DD')
);
	
insert into movie(
	movie_seq,	title ,	genre ,d그렸는지 아무도 모르겠지”
딸과 생활하는 마가렛은 우연히 만난 월터 킨과 운명적인 사랑에 빠지게 된다. 
 마가렛이 그린 독특한 그림 ‘빅 아이즈’를 월터가 미술계에 팔기 시작하면서 
 ‘빅 아이즈’는 전 세계를 뒤흔드는 최고의 인기를 얻게 된다. 
 마가렛은 월터 덕분에 부와 명성을 얻게 되지만, 사람들 앞에서는 물론 딸 앞에서까지 
 ‘빅 아이즈’의 진짜 화가 행세를 하는 월터를 보며 충격에 빠진다. 
 결국 마가렛은 그림에 숨겨진 모든 진실을 밝히기로 결심하게 되는데…',to_date('140101','YY/MM/DD')
);

select * from movie where title like '%빅%';

--select * from review;


select * from review where movie_seq = 1;
update review set content = 'ffffffffffff', star = 1 , reviewdate = to_date(sysdate,'YY/MM/DD') where review_seq = 1;
select * from reserve;
select * from movie;
select * from movie where title like '%빅%' and  to_date(closingday,'YY/MM/DD') >= to_date('20150404','YY/MM/DD')  ;
insert into timetable values(SEQ_timetable_timetable_seq.nextval,1,sysdate,'10:00',1);
CREATE TABLE timetable
(
	-- 상영영화seq
	timetable_seq number NOT NULL,
	-- 영화seq
	movie_seq number NOT NULL,
	-- 상영일
	screeningday date NOT NULL,
	-- 영화가 시작하는 시간
	starttime varchar2(50) NOT NULL,
	-- 영화관 몇관인지
	theaterno number NOT NULL,
	PRIMARY KEY (timetable_seq)
);
select * from movie;
select * from timetable where screeningday = to_date('20150223','YY/MM/DD');
insert into reservenow(reservemovie_seq, userid) values (1,'aaa');
select * from reservenow where userid = 'aaa';
select * from reservenow;
update reservenow set reservemovie_seq = 2 where userid = 'aaa';
select * from reservenow where userid = 'aaa';
select * from movie where to_date(closingday,'YY/MM/DD') >= to_date(sysdate,'YY/MM/DD');
delete from reservenow;
 <= to_char()
delete from movie where movie_seq = 22;
select * from timetable;
delete from timetable;
select * from timetable where screeningday = to_date('20150223','YY/MM/DD')
insert into phone values(SEQ_PHONE_PHONE_SEQ.nextval, '01011111111', 'SKT', '111111');
insert into creditcard values(SEQ_CREDITCARD_CREDITCARD_SEQ.nextval, '우리카드', '1111111111111111', 11, '11/11', '111111');

select t.timetable_seq, t.movie_seq, t.screeningday, t.starttime, t.theaterno, t.timeno, m.title, m.runningtime 
from timetable t, movie m 
where t.movie_seq = m.movie_seq and t.screeningday = to_date('20150223','YY/MM/DD') 
order by t.theaterno , t.timeno;

select * from timetable where screeningday = to_date('20150223','YY/MM/DD') and timeno = 1 and theaterno = 1
select * from timetable where movie_seq = 1 and screeningday = to_date('20150223','YY/MM/DD')  order by theaterno , timeno;

		select t.timetable_seq, t.movie_seq, t.screeningday, t.starttime, t.theaterno, t.timeno, m.title, m.runningtime 
		from timetable t, movie m 
		where t.movie_seq = m.movie_seq and t.screeningday = to_date('20150223','YY/MM/DD') 
		order by t.theaterno , t.timeno

update timetable set starttime = '08:00' where screeningday = to_date('20150223','YY/MM/DD') and timeno = 1 and theaterno = 1
		
delete  from timetable;

insert into RESERVE(reserve_seq,timetable_seq,reservationno,userid,datepayed,price,optionpay,usedpoint,title) values(
SEQ_reserve_reserve_seq.nextval,2,'20150202','aaa',sysdate,900,'card',10,'빅아이즈');
insert into RESERVE(reserve_seq,timetable_seq,reservationno,userid,datepayed,price,optionpay,usedpoint,title) values(
SEQ_reserve_reserve_seq.nextval,2,'20150202','aaa',sysdate,900,'card',10,'빅아이즈');
insert into RESERVE(reserve_seq,timetable_seq,reservationno,userid,datepayed,price,optionpay,usedpoint,title) values(
SEQ_reserve_reserve_seq.nextval,2,'20150202','aaa',sysdate,900,'card',10,'빅아이즈');
insert into RESERVE(reserve_seq,timetable_seq,reservationno,userid,datepayed,price,optionpay,usedpoint,title) values(
SEQ_reserve_reserve_seq.nextval,2,'20150202','aaa',sysdate,900,'card',10,'빅아이즈');
insert into RESERVE(reserve_seq,timetable_seq,reservationno,userid,datepayed,price,optionpay,usedpoint,title) values(
SEQ_reserve_reserve_seq.nextval,2,'20150202','aaa',sysdate,900,'card',10,'빅아이즈');
insert into RESERVE(reserve_seq,timetable_seq,reservationno,userid,datepayed,price,optionpay,usedpoint,title) values(
SEQ_reserve_reserve_seq.nextval,2,'20150202','aaa',sysdate,900,'card',10,'빅아이즈');
insert into RESERVE(reserve_seq,timetable_seq,reservationno,userid,datepayed,price,optionpay,usedpoint,title) values(
SEQ_reserve_reserve_seq.nextval,2,'20150202','aaa',sysdate,900,'card',10,'빅아이즈');
insert into RESERVE(reserve_seq,timetable_seq,reservationno,userid,datepayed,price,optionpay,usedpoint,title) values(
SEQ_reserve_reserve_seq.nextval,2,'20150202','aaa',sysdate,900,'card',10,'빅아이즈');
insert into RESERVE(reserve_seq,timetable_seq,reservationno,userid,datepayed,price,optionpay,usedpoint,title) values(
SEQ_reserve_reserve_seq.nextval,2,'20150202','aaa',sysdate,900,'card',10,'빅아이즈');
insert into RESERVE(reserve_seq,timetable_seq,reservationno,userid,datepayed,price,optionpay,usedpoint,title) values(
SEQ_reserve_reserve_seq.nextval,2,'20150202','aaa',sysdate,900,'card',10,'빅아이즈');
insert into RESERVE(reserve_seq,timetable_seq,reservationno,userid,datepayed,price,optionpay,usedpoint,title) values(
SEQ_reserve_reserve_seq.nextval,2,'20150202','aaa',sysdate,900,'card',10,'빅아이즈');
insert into RESERVE(reserve_seq,timetable_seq,reservationno,userid,datepayed,price,optionpay,usedpoint,title) values(
SEQ_reserve_reserve_seq.nextval,2,'20150202','bbb',sysdate,900,'card',10,'빅아이즈');
insert into RESERVE(reserve_seq,timetable_seq,reservationno,userid,datepayed,price,optionpay,usedpoint,title) values(
SEQ_reserve_reserve_seq.nextval,2,'20150202','bbb',sysdate,900,'card',10,'빅아이즈');
insert into RESERVE(reserve_seq,timetable_seq,reservationno,userid,datepayed,price,optionpay,usedpoint,title) values(
SEQ_reserve_reserve_seq.nextval,2,'20150202','bbb',sysdate,900,'card',10,'빅아이즈');
insert into RESERVE(reserve_seq,timetable_seq,reservationno,userid,datepayed,price,optionpay,usedpoint,title) values(
SEQ_reserve_reserve_seq.nextval,2,'20150202','bbb',sysdate,900,'card',10,'빅아이즈');
insert into RESERVE(reserve_seq,timetable_seq,reservationno,userid,datepayed,price,optionpay,usedpoint,title) values(
SEQ_reserve_reserve_seq.nextval,2,'20150202','bbb',sysdate,900,'card',10,'빅아이즈');
insert into RESERVE(reserve_seq,timetable_seq,reservationno,userid,datepayed,price,optionpay,usedpoint,title) values(
SEQ_reserve_reserve_seq.nextval,2,'20150202','bbb',sysdate,900,'card',10,'빅아이즈');
select userid from reserve where title = '빅아이즈';

--20대
select *
from members 
where to_char(birthday,'YYYY') < to_char(sysdate,'YYYY') - 20 
and to_char(birthday,'YYYY') > to_char(sysdate,'YYYY') - 30;

select count(*)
from 
(select reserve.userid 
	from timetable, reserve 
	where timetable.timetable_seq = reserve.timetable_seq 
	and timetable.movie_seq = 1) a, 
(select * from members 
	where to_number(to_char(birthday,'YYYY')) < to_number(to_char(sysdate,'YYYY')) - 10 
	and to_number(to_char(birthday,'YYYY')) > to_number(to_char(sysdate,'YYYY')) - 20) members 
where a.userid = members.userid ;

		
select * from reserve;

select round(avg(star),1) from REVIEW where movie_seq = '1';


CREATE TABLE reserve
(
	-- 예매내역seq
	reserve_seq number NOT NULL,
	-- 상영영화seq
	timetable_seq number NOT NULL,
	-- 예매번호
	reservationno varchar2(50) NOT NULL,
	-- 유저 아이디
	userid varchar2(50) NOT NULL,
	-- 값을 지불한 날짜
	datepayed date NOT NULL,
	price number NOT NULL,
	-- 결제 방법
	optionpay varchar2(50) NOT NULL,
	-- 예매권 할인
	saleticket number DEFAULT 0,
	usedpoint number,
	-- 영화이름
	title varchar2(100) NOT NULL,
	-- 예매 인수
	peoplenum number NOT NULL,
	PRIMARY KEY (reserve_seq)
);
