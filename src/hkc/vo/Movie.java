package hkc.vo;

public class Movie {
	//영화번호
	int movie_seq   ;
	// 영화제목
	String title ;
	// 영화장르
	String genre ;
	// 영화감독
	String director ;
	// 영화배우들
	String actors  ;
	// 영화제작나라
	String nation  ;
	// 상영시간
	int runningtime   ;
	// 영화등급
	int rate   ;
	// 영화개봉일
	String openingday   ;
	// 영화종영일
	String closingday   ;
	// 영화포스터
	String poster   ;
	// 스틸샷
	String stillshot;
	// 동영상주소
	String webaddress;
	// 영화줄거리
	String story  ;
	// 제작날짜
	String madeday;
	//라이센스
	int license;
	public Movie() {
	}
	public int getMovie_seq() {
		return movie_seq;
	}
	public void setMovie_seq(int movie_seq) {
		this.movie_seq = movie_seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActors() {
		return actors;
	}
	public void setActors(String actors) {
		this.actors = actors;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public int getRunningtime() {
		return runningtime;
	}
	public void setRunningtime(int runningtime) {
		this.runningtime = runningtime;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public String getOpeningday() {
		return openingday;
	}
	public void setOpeningday(String openingday) {
		this.openingday = openingday;
	}
	public String getClosingday() {
		return closingday;
	}
	public void setClosingday(String closingday) {
		this.closingday = closingday;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getStillshot() {
		return stillshot;
	}
	public void setStillshot(String stillshot) {
		this.stillshot = stillshot;
	}
	public String getWebaddress() {
		return webaddress;
	}
	public void setWebaddress(String webaddress) {
		this.webaddress = webaddress;
	}
	public String getStory() {
		return story;
	}
	public void setStory(String story) {
		this.story = story;
	}
	public String getMadeday() {
		return madeday;
	}
	public void setMadeday(String madeday) {
		this.madeday = madeday;
	}
	public int getLicense() {
		return license;
	}
	public void setLicense(int license) {
		this.license = license;
	}
	@Override
	public String toString() {
		return "Movie [movie_seq=" + movie_seq + ", title=" + title
				+ ", genre=" + genre + ", director=" + director + ", actors="
				+ actors + ", nation=" + nation + ", runningtime="
				+ runningtime + ", rate=" + rate + ", openingday=" + openingday
				+ ", closingday=" + closingday + ", poster=" + poster
				+ ", stillshot=" + stillshot + ", webaddress=" + webaddress
				+ ", story=" + story + ", madeday=" + madeday + ", license="
				+ license + "]";
	}
	
}
