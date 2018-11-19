package hkc.vo;

public class Timetable {
	//시간표 번호
	private int timetable_seq ;
	// 영화seq
	private int movie_seq ;
	// 상영일
	private String screeningday ;
	// 영화가 시작하는 시간
	private String starttime ;
	// 영화관 몇관인지
	private int theaterno;
	//상영관
	private int timeno;
	
	private String title;
	
	private int runningtime;
	
	private int seatcount;
		// 영화등급
	private	int rate   ;
		// 영화개봉일
	private String openingday   ;
	
	public Timetable(int timetable_seq, int movie_seq, String screeningday,
			String starttime, int theaterno, int timeno, String title, int runningtime, int seatcount, int rate, String openingday) {
		super();
		this.timetable_seq = timetable_seq;
		this.movie_seq = movie_seq;
		this.screeningday = screeningday;
		this.starttime = starttime;
		this.theaterno = theaterno;
		this.timeno = timeno;
		this.title = title;
		this.runningtime = runningtime;
		this.seatcount = seatcount;
		this.rate = rate;
		this.openingday = openingday;
	}
	public Timetable() {
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
	public int getSeatcount() {
		return seatcount;
	}
	public void setSeatcount(int seatcount) {
		this.seatcount = seatcount;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getRunningtime() {
		return runningtime;
	}
	public void setRunningtime(int runningtime) {
		this.runningtime = runningtime;
	}
	public int getTimeno() {
		return timeno;
	}
	public void setTimeno(int timeno) {
		this.timeno = timeno;
	}
	public int getTimetable_seq() {
		return timetable_seq;
	}
	public void setTimetable_seq(int timetable_seq) {
		this.timetable_seq = timetable_seq;
	}
	public int getMovie_seq() {
		return movie_seq;
	}
	public void setMovie_seq(int movie_seq) {
		this.movie_seq = movie_seq;
	}
	public String getScreeningday() {
		return screeningday;
	}
	public void setScreeningday(String screeningday) {
		this.screeningday = screeningday;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public int getTheaterno() {
		return theaterno;
	}
	public void setTheaterno(int theaterno) {
		this.theaterno = theaterno;
	}
	@Override
	public String toString() {
		return "Timetable [timetable_seq=" + timetable_seq + ", movie_seq="
				+ movie_seq + ", screeningday=" + screeningday + ", starttime="
				+ starttime + ", theaterno=" + theaterno + ", timeno=" + timeno
				+ ", title=" + title + ", runningtime=" + runningtime
				+ ", seatcount=" + seatcount + ", rate=" + rate
				+ ", openingday=" + openingday + "]";
	}
}

