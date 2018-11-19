--빅히어로
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
	'천재 공학도 ‘테디’가 개발한 힐링로봇 ‘베이맥스’!
‘테디’의 동생이자 로봇 전문가인 ‘히로’는 도시가 파괴될 위기에 처하자 
‘베이맥스’를 슈퍼히어로로 업그레이드 하는데…
과연 이들은 도시의 위험을 막아낼 수 있을까?',
	to_date('140101','YY/MM/DD')
);

--킹스맨:시크릿 에이젠트
insert into movie(
	movie_seq,	
	title ,			-- 영화제목
	genre ,			-- 영화장르
	director ,		-- 영화감독
	actors,			-- 영화배우들
	nation ,		-- 영화제작나라
	runningtime ,	-- 상영시간
	rate,			-- 영화등급
	openingday ,	-- 영화개봉일
	closingday ,	-- 영화종영일
	poster ,		-- 영화포스터
	story ,			-- 영화줄거리
	madeday			-- 제작날짜
) values (
	SEQ_movie_movie_seq.nextval,
	'킹스맨:시크릿 에이젠트',
	'액션,스릴러',
	'매튜 본',
	'콜린 퍼스, 태런 애거튼, 사무엘L.잭슨, 마이클케인',
	'미국',
	128,
	19,
	to_date('150211','YY/MM/DD'),
	to_date('150411','YY/MM/DD'),
	'Kingsman The Secret Service_poster.jpg',
	'세상에서 가장 위험한 면접이 시작된다! 
	높은 IQ, 주니어 체조대회 2년 연속 우승! 
	그러나 학교 중퇴, 해병대 중도 하차. 
	동네 패싸움에 직장은 가져본 적도 없이 별볼일 없는 루저로 낙인 찍혔던 ‘그’가 ‘젠틀맨 스파이’로 전격 스카우트 됐다! 
	전설적 베테랑 요원 해리 하트(콜린 퍼스)는 경찰서에 구치된 에그시(태런 애거튼)를 구제한다. 
	탁월한 잠재력을 알아본 그는 에그시를 전설적 국제 비밀정보기구 ‘킹스맨’ 면접에 참여시킨다. 
	아버지 또한 ‘킹스맨’의 촉망 받는 요원이었으나 해리 하트를 살리기 위해 죽었다는 사실을 알게 된 에그시. 
	목숨을 앗아갈 만큼 위험천만한 훈련을 통과해야 하는 킹스맨 후보들. 
	최종 멤버 발탁을 눈 앞에 둔 에그시는 최고의 악당 발렌타인(사무엘 L. 잭슨)을 마주하게 되는데…',
	to_date('141201','YY/MM/DD')
);

--조선명탐정: 사라진 놉의 딸
insert into movie(
	movie_seq,	
	title ,			-- 영화제목
	genre ,			-- 영화장르
	director ,		-- 영화감독
	actors,			-- 영화배우들
	nation ,		-- 영화제작나라
	runningtime ,	-- 상영시간
	rate,			-- 영화등급
	openingday ,	-- 영화개봉일
	closingday ,	-- 영화종영일
	poster ,		-- 영화포스터
	story ,			-- 영화줄거리
	madeday			-- 제작날짜
) values (
	SEQ_movie_movie_seq.nextval,
	'조선명탐정: 사라진 놉의 딸',
	'어드벤터,코미디',
	'김석윤',
	'김명민, 오달수, 이연희',
	'한국',
	124,
	12,
	to_date('150211','YY/MM/DD'),
	to_date('150411','YY/MM/DD'),
	'Detective K_poster.jpg',
	'우리가 또 나설 차례인가! 
  정조 19년. 한때는 왕의 밀명을 받던 특사였으나
  무슨 이유인지 왕에게 미운 털이 박혀 외딴 섬에 유배되어 버린 조선 제일의 명탐정 김민.
  찾아오는 이라곤 지난 날 함께 했던 파트너 서필과
  매일 같이 동생을 찾아달라며 오는 어린 소녀뿐이다. 
  그러던 중 김민은 조선 전역에 불량은괴가 유통되고 있다는 소식을 접하게 되고,
  이로 인해 잠자고 있던 탐정 본능이 꿈틀거리기 시작한다.
  결국 유배지 이탈이라는 초강수를 두며
  불량은괴 유통사건과 행방불명 된 소녀의 동생을 찾기 위해 본격 수사에 착수하게 된다. 
  사상 최초로 동시에 두 사건 해결에 나선 조선 명탐정 김민과 서필!
  그러나 정체를 알 수 없는 미모의 여인 히사코로 인해 명콤비의 수사는 더욱 혼선을 빚는다...',
	to_date('150101','YY/MM/DD')
);

--이미테이션 게임
insert into movie(
	movie_seq,	
	title ,			-- 영화제목
	genre ,			-- 영화장르
	director ,		-- 영화감독
	actors,			-- 영화배우들
	nation ,		-- 영화제작나라
	runningtime ,	-- 상영시간
	rate,			-- 영화등급
	openingday ,	-- 영화개봉일
	closingday ,	-- 영화종영일
	poster ,		-- 영화포스터
	story ,			-- 영화줄거리
	madeday			-- 제작날짜
) values (
	SEQ_movie_movie_seq.nextval,
	'이미테이션 게임',
	'드라마, 스릴러',
	'모튼 틸덤',
	'베네딕트 컴버배치, 키이라 나이틀리, 매튜 구드',
	'미국,영국',
	114,
	15,
	to_date('150217','YY/MM/DD'),
	to_date('150417','YY/MM/DD'),
	'Imitation Game_poster.jpg',
	'24시간 마다 바뀌는 해독불가 암호 암호를 풀고 1,400 만 명의 목숨을 구한 천재 수학자 매 순간 3명이 죽는 사상 최악의 위기에 처한 제 2차 세계대전. 
절대 해독이 불가능한 암호 ‘에니그마’로 인해 연합군은 속수무책으로 당하게 된다.결국 각 분야의 수재들을 모아 기밀 프로젝트 암호 해독팀을 가동한다. 
천재 수학자 앨런 튜링(베네딕트 컴버배치)은 암호 해독을 위한 특별한 기계를 발명하지만 24시간 마다 바뀌는 완벽한 암호 체계 때문에 번번히 좌절하고 마는데... 
과연, 앨런 튜링과 암호 해독팀은 암호를 풀고 전쟁의 승리를 끌어낼 수 있을까…? ',
	to_date('150101','YY/MM/DD')
);

--국제시장
insert into movie(
	movie_seq,	
	title ,			-- 영화제목
	genre ,			-- 영화장르
	director ,		-- 영화감독
	actors,			-- 영화배우들
	nation ,		-- 영화제작나라
	runningtime ,	-- 상영시간
	rate,			-- 영화등급
	openingday ,	-- 영화개봉일
	closingday ,	-- 영화종영일
	poster ,		-- 영화포스터
	story ,			-- 영화줄거리
	madeday			-- 제작날짜
) values (
	SEQ_movie_movie_seq.nextval,
	'국제시장',
	'드라마',
	'윤제균',
	'황정민,김윤진,오달수,정진영,장영남,라미란,김슬기',
	'한국',
	126,
	12,
	to_date('141217','YY/MM/DD'),
	to_date('150301','YY/MM/DD'),
	'Ode to My Father_poster.jpg',
	'가족을 위해 굳세게 살아온 그때 그 시절, 가장 평범한 아버지의 가장 위대한 이야기가 시작된다! 
1950년 한국전쟁을 지나 부산으로 피란 온 ‘덕수’의 다섯 식구, 전쟁 통에 헤어진 아버지를 대신해야 했던 ‘덕수’는 고모가 운영하는 부산 국제시장의 수입 잡화점 ‘꽃분이네’서 일하며 가족의 생계를 꾸려 나간다. 모두가 어려웠던 그때 그 시절, 남동생의 대학교 입학 등록금을 벌기 위해 이역만리 독일에 광부로 떠난 ‘덕수’는 그곳에서 첫사랑이자 평생의 동반자 ‘영자’를 만난다. 그는 가족의 삶의 터전이 되어버린 ‘꽃분이네’ 가게를 지키기 위해 ‘선장’ 이 되고 싶었던 오랜 꿈을 접고 다시 한 번 전쟁이 한창이던 베트남으로 건너가 기술 근로자로 일하게 되는데… ',
	to_date('141031','YY/MM/DD')
);

--쎄시봉 
insert into movie(
	movie_seq,	
	title ,			-- 영화제목
	genre ,			-- 영화장르
	director ,		-- 영화감독
	actors,			-- 영화배우들
	nation ,		-- 영화제작나라
	runningtime ,	-- 상영시간
	rate,			-- 영화등급
	openingday ,	-- 영화개봉일
	closingday ,	-- 영화종영일
	poster ,		-- 영화포스터
	story ,			-- 영화줄거리
	madeday			-- 제작날짜
) values (
	SEQ_movie_movie_seq.nextval,
	'쎄시봉',
	'드라마',
	'김현석',
	'김윤석,정우,김희애,한효주,장현성,진구,강하늘,조복래,김인권',
	'한국',
	123,
	15,
	to_date('150205','YY/MM/DD'),
	to_date('150405','YY/MM/DD'),
	'very good_poster.jpg',
	'한국 음악계에 포크 열풍을 일으킨 조영남, 윤형주, 송창식, 이장희 등을 배출한 음악감상실 ‘쎄시봉’,
젊음의 거리 무교동 최고의 핫플레이스였던 그곳에서 ‘마성의 미성’ 윤형주와 ‘타고난 음악천재’ 송창식이
평생의 라이벌로 처음 만나게 된다. ‘쎄시봉’ 사장은 이들의 가수 데뷔를 위해 트리오 팀 구성을 제안하고,
자칭 ‘쎄시봉’의 전속 프로듀서 이장희는 우연히 오근태의 중저음 목소리를 듣고 그가 두 사람의 빈틈을 채워줄
‘숨은 원석’임을 직감한다. 기타 코드조차 제대로 잡지 못하는 통영 촌놈 오근태는 이장희의 꼬임에 얼떨결에
‘트리오 쎄시봉’의 멤버로 합류하게 되고 그 시절, 모든 남자들의 마음을 사로잡은 ‘쎄시봉’의 뮤즈 민자영에게
첫눈에 반해 그녀를 위해 노래를 부르기로 결심하는데....',
	to_date('141001','YY/MM/DD')
);

--명탐정 코난 : 코난 실종사건 - 사상 최악의 이틀
insert into movie(
	movie_seq,	
	title ,			-- 영화제목
	genre ,			-- 영화장르
	director ,		-- 영화감독
	actors,			-- 영화배우들
	nation ,		-- 영화제작나라
	runningtime ,	-- 상영시간
	rate,			-- 영화등급
	openingday ,	-- 영화개봉일
	closingday ,	-- 영화종영일
	poster ,		-- 영화포스터
	story ,			-- 영화줄거리
	madeday			-- 제작날짜
) values (
	SEQ_movie_movie_seq.nextval,
	'명탐정 코난 : 코난 실종사건 - 사상 최악의 이틀',
	'애니메이션',
	'야마모토 야스이치로',
	'김선혜,강수진,이현진,이정구,황원,우정신',
	'일본',
	91,
	12,
	to_date('150212','YY/MM/DD'),
	to_date('150412','YY/MM/DD'),
	'Detective Conan_poster.jpg',
	'사라진 기억! 치밀한 함정! 
사상 최악의 위기에 빠진 코난을 찾아라! 
목욕탕에 온 코난은 발이 미끄러져 그대로 기절해 버린다. 쓰러진 코난을 병원에 데려가려고 차에 실은 수상한 두 남자는 어둠의 세계에서 유명한 ‘애드립의 달인 정용해’와 ‘전설의 킬러 이건도’. 탈의실에서 자신들의 정체가 발각되었다고 생각한 나머지 납치한 것이다. 얼마 후 의식을 찾은 코난은 머리를 심하게 부딪힌 충격으로 기억을 잃어버린 채 의문의 거대한 폭탄테러 음모에 휘말리게 되는데… 
표적을 알 수 없는 의문의 폭탄테러! 
마지막까지 방심할 수 없는 사건의 결말은!?',
	to_date('140501','YY/MM/DD')
);

--도라에몽:스탠바이미
insert into movie(
	movie_seq,	
	title ,			-- 영화제목
	genre ,			-- 영화장르
	director ,		-- 영화감독
	actors,			-- 영화배우들
	nation ,		-- 영화제작나라
	runningtime ,	-- 상영시간
	rate,			-- 영화등급
	openingday ,	-- 영화개봉일
	closingday ,	-- 영화종영일
	poster ,		-- 영화포스터
	story ,			-- 영화줄거리
	madeday			-- 제작날짜
) values (
	SEQ_movie_movie_seq.nextval,
	'도라에몽:스탠바이미',
	'애니메이션',
	'야기 류이치',
	'미즈타 와사비,오오하라 메구미,카카즈 유미,키무라 스바루,세키 토모카즈',
	'일본',
	94,
	0,
	to_date('150212','YY/MM/DD'),
	to_date('150412','YY/MM/DD'),
	'Doraemon.jpg_poster',
	'5주 연속 일본 박스오피스 1위!
600만 관객 동원 흥행 신기록에 빛나는 도라에몽이 한국에 상륙했다!
공부도 꽝, 운동도 꽝, 무얼해도 덜렁대고 소심한 소년 진구.
그런 진구에게 행복한 꿈과 미래를 선물하는 임무를 받고 22세기에서 날아온 최고의 친구, 도라에몽!
대나무 헬리콥터, 어디로든 문, 투명망토, 암기빵, 그리고 타임머신까지! 
도라에몽은 온갖 미래의 비밀도구로 오직 진구만을 위한 노력에 나선다.
마지못해 임무를 부여 받고 미래에서 끌려온 도라에몽은
누구보다 착한 마음씨를 지닌 진구와 점차 특별한 우정을 나누게 되지만,
언제까지나 함께할 것 같던 두 단짝에게도 이별의 순간이 찾아오는데..
과연 도라에몽은 진구의 꿈과 행복을 이뤄줄 수 있을까?
우리가 몰랐던 도라에몽의 처음, 그리고 마지막 이야기가 펼쳐진다!',
	to_date('140324','YY/MM/DD')
);

--그레이의 50가지 그림자
insert into movie(
	movie_seq,	
	title ,			-- 영화제목
	genre ,			-- 영화장르
	director ,		-- 영화감독
	actors,			-- 영화배우들
	nation ,		-- 영화제작나라
	runningtime ,	-- 상영시간
	rate,			-- 영화등급
	openingday ,	-- 영화개봉일
	closingday ,	-- 영화종영일
	poster ,		-- 영화포스터
	story ,			-- 영화줄거리
	madeday			-- 제작날짜
) values (
	SEQ_movie_movie_seq.nextval,
	'그레이의 50가지 그림자',
	'드라마,로멘스',
	'샘 테일러 존슨',
	'제이미 도넌, 다코타 존슨',
	'미국',
	125,
	19,
	to_date('150226','YY/MM/DD'),
	to_date('150426','YY/MM/DD'),
	'Fifty Shades of Grey_poster.jpg',
	'“그레이씨가 이제 만나시겠답니다.” 
순수한 사회 초년생인 여대생 ‘아나스타샤’는 어느 날,
아픈 친구를 대신해 모든 것을 다 가진 매력적인 CEO ‘크리스찬 그레이’의 인터뷰를 맡게 된다.
단숨에 사람을 매료시키는 ‘크리스찬 그레이’의 마력에 ‘아나스타샤’는 순식간에 빠져들고,
그 역시 순수한 아나스타샤를 점점 더 알고 싶어지게 된다. 
내 취향은 아주 분명해. 
한편, 원하는 것을 모두 들어줄 만큼 완벽한 ‘그레이’의 숨겨진 비밀을
알게 된 ‘아나스타샤’는 거부할 수 없는 본능에 눈을 뜨게 되는데… ',
	to_date('140512','YY/MM/DD')
);

--사랑에 대한 모든 것
insert into movie(
	movie_seq,	
	title ,			-- 영화제목
	genre ,			-- 영화장르
	director ,		-- 영화감독
	actors,			-- 영화배우들
	nation ,		-- 영화제작나라
	runningtime ,	-- 상영시간
	rate,			-- 영화등급
	openingday ,	-- 영화개봉일
	closingday ,	-- 영화종영일
	poster ,		-- 영화포스터
	story ,			-- 영화줄거리
	madeday			-- 제작날짜
) values (
	SEQ_movie_movie_seq.nextval,
	'사랑에 대한 모든 것',
	'로맨스, 멜로, 드라마',
	'제임스 마쉬',
	'에디 레드메인, 펠리시티 존스',
	'미국',
	123,
	12,
	to_date('150213','YY/MM/DD'),
	to_date('150413','YY/MM/DD'),
	'Theory of Everything_poster.jpg',
	'“삶이 비록 힘들지라도, 살아있는 한 희망은 있습니다.” 
세상을 바꾼 남자, 그의 삶을 바꾼 기적 같은 사랑 
촉망받는 물리학도 스티븐 호킹(에디 레드메인)은 신년파티에서 매력적이고 당찬 여인 제인 와일드(펠리시티 존스)와 마주친다. 
이미 정해진 운명이었던 것처럼 두 사람은 첫 만남에 서로에게 빠져든다. 
물리학도와 인문학도, 천재적이지만 괴짜 같은 남자와 다정하지만 강인한 여자, 
두 사람은 완벽한 커플로 사랑을 키워나간다. 하지만 영원히 행복할 것 같았던 두 사람 앞에 모든 것을 바꿀 사건이 일어난다. 
시한부 인생, 2년. 스티븐은 점점 신발 끈을 묶는 게 어려워 지고, 발음은 흐릿해지고, 지팡이 없이는 걷는 것 조차 힘들어져 갔다. 
과학자로서의 미래와 영원할 것 같은 사랑, 모든 것이 불가능한 일이 되어 버렸다.',
	to_date('140728','YY/MM/DD')
);

--강남1970 
insert into movie(
	movie_seq,	
	title ,			-- 영화제목
	genre ,			-- 영화장르
	director ,		-- 영화감독
	actors,			-- 영화배우들
	nation ,		-- 영화제작나라
	runningtime ,	-- 상영시간
	rate,			-- 영화등급
	openingday ,	-- 영화개봉일
	closingday ,	-- 영화종영일
	poster ,		-- 영화포스터
	story ,			-- 영화줄거리
	madeday			-- 제작날짜
) values (
	SEQ_movie_movie_seq.nextval,
	'강남1970',
	'드라마',
	'유하',
	'이민호, 김래원, 정진영, 김지수',
	'한국',
	135,
	19,
	to_date('150121','YY/MM/DD'),
	to_date('150321','YY/MM/DD'),
	'gangnam1970_poster.jpg',
	'1970년, 강남땅을 향한 위험한 욕망이 춤추기 시작한다! 
호적도 제대로 없는 고아로 넝마주이 생활을 하며 친형제처럼 살던 종대(이민호)와 용기(김래원). 
유일한 안식처였던 무허가촌의 작은 판자집마저 빼앗기게 된 두 사람은 건달들이 개입된 전당대회 훼방 작전에 얽히게 되고 그곳에서 서로를 잃어버린다. 
“땅 종대, 돈 용기! 끝까지 한번 가 보자!” 
3년 후, 자신을 가족으로 받아 준 조직 두목 출신 길수(정진영)의 바람과 달리 잘 살고 싶다는 꿈 하나로 건달 생활을 하게 되는 종대. 
정보와 권력의 수뇌부에 닿아있는 복부인 민마담(김지수)과 함께 강남 개발의 이권다툼에 뛰어든 종대는 명동파의 중간보스가 된 용기와 재회하고, 
두 사람은 정치권까지 개입된 의리와 음모, 배신의 전쟁터 그 한 가운데에 놓이게 되는데…',
	to_date('140509','YY/MM/DD')
);

commit;
