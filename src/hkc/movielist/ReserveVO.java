package hkc.movielist;

import java.util.Date;

public class ReserveVO {

	private int timetable_seq;
	private String reservationno;
	private String title;
	private String poster;
	private String stillshot;
	private Date openingday;
	private int star;
	private int peoplenum;
	private double ratio=0.0;
	private double starratio;
	
	public int getTimetable_seq() {
		return timetable_seq;
	}
	public void setTimetable_seq(int timetable_seq) {
		this.timetable_seq = timetable_seq;
	}
	public String getReservationno() {
		return reservationno;
	}
	public void setReservationno(String reservationno) {
		this.reservationno = reservationno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPeoplenum() {
		return peoplenum;
	}
	public void setPeoplenum(int peoplenum) {
		this.peoplenum = peoplenum;
	}
	public double getRatio() {
		return ratio;
	}
	public void setRatio(double ratio) {
		this.ratio = ratio;
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
	
	public Date getOpeningday() {
		return openingday;
	}
	public void setOpeningday(Date openingday) {
		this.openingday = openingday;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public double getStarratio() {
		return starratio;
	}
	public void setStarratio(double starratio) {
		this.starratio = starratio;
	}
	@Override
	public String toString() {
		return "ReserveVO [timetable_seq=" + timetable_seq + ", reservationno="
				+ reservationno + ", title=" + title + ", peoplenum="
				+ peoplenum + ", ratio=" + ratio + "]";
	}

	
	
}
