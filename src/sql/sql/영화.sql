--영화
insert 
  into movie 
values 
      (
      SEQ_movie_movie_seq.nextval, 
      '쎄시봉',
      '드라마', 
      '김현석', 
      '김윤석', 
      '대한민국', 
      123, 
      15, 
      sysdate, 
      sysdate, 
      '포스터',
      '스틸샷', 
      '웹어드레스', 
      '스토리', 
      sysdate); 
      
--시간
insert 
  into timetable
values 
      (
      SEQ_timetable_timetable_seq.nextval, 
      1,
      sysdate,
      '10:00',
      1
      ); 
      
      
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
	'bighero2015_poster.jpg',
	'치명적인 몸매! 꼭 안아주고 싶은 힐링로봇 ‘베이맥스’가장 사랑스러운 슈퍼히어로가 온다!천재 공학도 ‘테디’가 개발한 힐링로봇 ‘베이맥스’!  ‘테디’의 동생이자 로봇 전문가인 ‘히로’는 도시가 파괴될 위기에 처하자 ‘베이맥스’를 슈퍼히어로로 업그레이드 하는데… 과연 이들은 도시의 위험을 막아낼 수 있을까?',
	to_date('140101','YY/MM/DD')
);
      