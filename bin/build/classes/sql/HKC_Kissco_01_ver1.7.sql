
/* Drop Tables */

DROP TABLE advance CASCADE CONSTRAINTS;
DROP TABLE creditcard CASCADE CONSTRAINTS;
DROP TABLE members CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE reserve CASCADE CONSTRAINTS;
DROP TABLE seatreserved CASCADE CONSTRAINTS;
DROP TABLE timetable CASCADE CONSTRAINTS;
DROP TABLE movie CASCADE CONSTRAINTS;
DROP TABLE phone CASCADE CONSTRAINTS;
DROP TABLE previewmovie CASCADE CONSTRAINTS;
DROP TABLE seat CASCADE CONSTRAINTS;
DROP TABLE theater CASCADE CONSTRAINTS;
DROP TABLE reservenow;



/* Drop Sequences */

DROP SEQUENCE SEQ_creditcard_creditcard_seq;
DROP SEQUENCE SEQ_movie_movie_seq;
DROP SEQUENCE SEQ_phone_phone_seq;
DROP SEQUENCE SEQ_reserve_reserve_seq;
DROP SEQUENCE SEQ_review_review_seq;
DROP SEQUENCE SEQ_seat_seat_seq;
DROP SEQUENCE SEQ_timetable_timetable_seq;




/* Create Sequences */

CREATE SEQUENCE SEQ_creditcard_creditcard_seq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_movie_movie_seq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_phone_phone_seq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_reserve_reserve_seq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_review_review_seq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_seat_seat_seq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_timetable_timetable_seq INCREMENT BY 1 START WITH 1;



/* Create Tables */

create table reservenow
(
	reserveday varchar2(10) default 0,
	reservemovie_seq number default 0,
	userid varchar2(50)
);

CREATE TABLE advance
(
	-- 예매권의 일련번호
	advanceno varchar2(100) NOT NULL,
	-- 예매권이름
	ticketname varchar2(50) NOT NULL,
	-- 할인금액
	discount number NOT NULL,
	-- 예매권 사용가능 시작날짜
	startdate date NOT NULL,
	-- 예매권 사용 마지막 날짜
	expirationdate date NOT NULL,
	PRIMARY KEY (advanceno)
);


CREATE TABLE creditcard
(
	-- 신용카드 seq
	creditcard_seq number NOT NULL,
	-- 카드종류
	cardsort varchar2(50) NOT NULL,
	-- 카드번호
	cardnum varchar2(50) NOT NULL,
	-- 카드비밀번호
	password number NOT NULL,
	-- 유효날짜
	expirationdate varchar2(50) NOT NULL,
	-- 생년월일
	birthday varchar2(50) NOT NULL,
	PRIMARY KEY (creditcard_seq)
);


CREATE TABLE members
(
	-- 아이디
	userid varchar2(50) NOT NULL,
	-- 비밀번호
	password varchar2(50) NOT NULL,
	-- 이름
	name varchar2(50) NOT NULL,
	-- 생년월일
	birthday date NOT NULL,
	-- 성별
	sex varchar2(10) NOT NULL,
	-- 이메일
	email varchar2(100) NOT NULL,
	-- 전화번호
	phone varchar2(50) NOT NULL,
	-- 포인트
	point number DEFAULT 0,
	PRIMARY KEY (userid)
);


CREATE TABLE movie
(
	-- 영화seq
	movie_seq number NOT NULL,
	-- 영화제목
	title varchar2(100) NOT NULL,
	-- 영화장르
	genre varchar2(50) NOT NULL,
	-- 영화감독
	director varchar2(50) NOT NULL,
	-- 영화배우들
	actors varchar2(100) NOT NULL,
	-- 영화제작나라
	nation varchar2(50) NOT NULL,
	-- 상영시간
	runningtime number NOT NULL,
	-- 영화등급
	rate number NOT NULL,
	-- 영화개봉일
	openingday date NOT NULL,
	-- 영화종영일
	closingday date NOT NULL,
	-- 영화포스터
	poster varchar2(100) NOT NULL,
	-- 스틸샷
	stillshot varchar2(100),
	-- 동영상주소
	webaddress varchar2(100),
	-- 영화줄거리
	story varchar2(1000) NOT NULL,
	-- 제작날짜
	madeday date,
	PRIMARY KEY (movie_seq)
);


CREATE TABLE phone
(
	-- 핸드폰결제 seq
	phone_seq number NOT NULL,
	-- 핸드폰번호
	phonenum varchar2(50) NOT NULL,
	-- 통신사
	company varchar2(10) NOT NULL,
	-- 생년월일
	birthday varchar2(50) NOT NULL,
	PRIMARY KEY (phone_seq)
);


-- 메인페이지
-- 
-- coming soon 예고편에 관련된 db
-- 
-- 관리자를 완성 할 수 있다면 관리자가 관리하도록
CREATE TABLE previewmovie
(
	premovie_seq number NOT NULL,
	youtubelink varchar2(1000) NOT NULL,
	preposter varchar2(150) NOT NULL,
	pagelink varchar2(1000) NOT NULL,
	PRIMARY KEY (premovie_seq)
);


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


CREATE TABLE review
(
	-- 영화리뷰에 대한 seq
	review_seq number NOT NULL,
	-- 영화seq
	movie_seq number NOT NULL,
	-- 댓글내용
	content varchar2(1000) NOT NULL,
	-- 별의 개수
	star number NOT NULL,
	-- 로그인한 아이디
	userid varchar2(50) NOT NULL,
	-- 리플을 작성한 시간
	reviewdate date NOT NULL,
	PRIMARY KEY (review_seq)
);


CREATE TABLE seat
(
	-- 자리seq
	seat_seq number NOT NULL,
	-- 좌석명
	seatno varchar2(10) DEFAULT '',
	-- 좌석의 행
	rowseat number NOT NULL,
	-- 좌석의 열
	colseat number NOT NULL,
	-- 0:일반석
	-- 1:primezone
	-- 2:장애인석
	-- 3:sweetbox
	seattype number DEFAULT 0,
	-- 상영관이 몇 관인지
	theaterno number NOT NULL,
	PRIMARY KEY (seat_seq)
);


CREATE TABLE seatreserved
(
	-- 상영영화seq
	timetable_seq number NOT NULL,
	-- 상영관이 몇 관인지
	theaterno number NOT NULL,
	-- 예매좌석번호
	seatno varchar2(10),
	-- 예매한 아이디
	userid varchar2(50) NOT NULL,
	-- 예매번호
	reservationno varchar2(50) NOT NULL
);


CREATE TABLE theater
(
	-- 상영관이 몇 관인지
	theaterno number NOT NULL,
	-- 영화관의 자리수
	seatnum number NOT NULL,
	PRIMARY KEY (theaterno)
);


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
	-- 영화회차
	timeno number,
	PRIMARY KEY (timetable_seq)
);



/* Create Foreign Keys */

ALTER TABLE review
	ADD FOREIGN KEY (movie_seq)
	REFERENCES movie (movie_seq)
	on delete cascade
;


ALTER TABLE timetable
	ADD FOREIGN KEY (movie_seq)
	REFERENCES movie (movie_seq)
	on delete cascade
;


ALTER TABLE seat
	ADD FOREIGN KEY (theaterno)
	REFERENCES theater (theaterno)
	on delete cascade
;


ALTER TABLE seatreserved
	ADD FOREIGN KEY (theaterno)
	REFERENCES theater (theaterno)
	on delete cascade
;


ALTER TABLE reserve
	ADD FOREIGN KEY (timetable_seq)
	REFERENCES timetable (timetable_seq)
	on delete cascade
;


ALTER TABLE seatreserved
	ADD FOREIGN KEY (timetable_seq)
	REFERENCES timetable (timetable_seq)
	on delete cascade
;



