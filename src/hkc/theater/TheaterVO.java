package hkc.theater;

import java.util.Date;

public class TheaterVO {
	private String userid;
	private int theaterno;
	private int timetable_seq;
	private int seatnum;
	private String seatno;
	private int rowseat;
	private int colseat;
	private String seattype;
	private int reserved;
	private String starttime;
	private int runningtime;
	private String title;
	private int rate;
	private Date screeningday;
	private int seatremained;
	private String poster;
	
	
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public int getSeatremained() {
		return seatremained;
	}
	public void setSeatremained(int seatremained) {
		this.seatremained = seatremained;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public Date getScreeningday() {
		return screeningday;
	}
	public void setScreeningday(Date screeningday) {
		this.screeningday = screeningday;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public int getRunningtime() {
		return runningtime;
	}
	public void setRunningtime(int runningtime) {
		this.runningtime = runningtime;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getTheaterno() {
		return theaterno;
	}
	public void setTheaterno(int theaterno) {
		this.theaterno = theaterno;
	}
	public int getTimetable_seq() {
		return timetable_seq;
	}
	public void setTimetable_seq(int timetable_seq) {
		this.timetable_seq = timetable_seq;
	}
	public int getSeatnum() {
		return seatnum;
	}
	public void setSeatnum(int seatnum) {
		this.seatnum = seatnum;
	}
	public String getSeatno() {
		return seatno;
	}
	public void setSeatno(String seatno) {
		this.seatno = seatno;
	}
	public int getRowseat() {
		return rowseat;
	}
	public void setRowseat(int rowseat) {
		this.rowseat = rowseat;
	}
	public int getColseat() {
		return colseat;
	}
	public void setColseat(int colseat) {
		this.colseat = colseat;
	}
	public String getSeattype() {
		return seattype;
	}
	public void setSeattype(String seattype) {
		this.seattype = seattype;
	}
	public int getReserved() {
		return reserved;
	}
	public void setReserved(int reserved) {
		this.reserved = reserved;
	}
	@Override
	public String toString() {
		return "TheaterVO [userid=" + userid + ", theaterno=" + theaterno
				+ ", timetable_seq=" + timetable_seq + ", seatnum=" + seatnum
				+ ", seatno=" + seatno + ", rowseat=" + rowseat + ", colseat="
				+ colseat + ", seattype=" + seattype + ", reserved=" + reserved
				+ ", starttime=" + starttime + ", runningtime=" + runningtime
				+ ", title=" + title + ", rate=" + rate + ", screeningday="
				+ screeningday + ", seatremained=" + seatremained + ", poster="
				+ poster + "]";
	}
	
	
}
