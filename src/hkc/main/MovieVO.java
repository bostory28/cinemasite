package hkc.main;

import java.util.Date;

public class MovieVO {
	private int movie_seq;
	private String title;
	private String genre;
	private String director;
	private String actors;
	private String nation;
	private int runningtime;;
	private int rate;
	private Date openingday;
	private Date closingday;
	private String poster;
	private String stillshot;
	private String webaddress;
	private String story;
	private Date madeday;
	private double starratio;
	private int dday;
	
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
	public Date getOpeningday() {
		return openingday;
	}
	public void setOpeningday(Date openingday) {
		this.openingday = openingday;
	}
	public Date getClosingday() {
		return closingday;
	}
	public void setClosingday(Date closingday) {
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
	public Date getMadeday() {
		return madeday;
	}
	public void setMadeday(Date madeday) {
		this.madeday = madeday;
	}
	public double getStarratio() {
		return starratio;
	}
	public void setStarratio(double starratio) {
		this.starratio = starratio;
	}
	
	public int getDday() {
		return dday;
	}
	public void setDday(int dday) {
		this.dday = dday;
	}
	
	@Override
	public String toString() {
		return "MovieVO [movie_seq=" + movie_seq + ", title=" + title
				+ ", genre=" + genre + ", director=" + director + ", actors="
				+ actors + ", nation=" + nation + ", runningtime="
				+ runningtime + ", rate=" + rate + ", openingday=" + openingday
				+ ", closingday=" + closingday + ", poster=" + poster
				+ ", stillshot=" + stillshot + ", webaddress=" + webaddress
				+ ", story=" + story + ", madeday=" + madeday + ", starratio="
				+ starratio + ", dday=" + dday + "]";
	}
	
	
}
