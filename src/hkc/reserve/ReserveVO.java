package hkc.reserve;

import java.util.Date;

public class ReserveVO {
	private int reserve_seq;
	private int timetable_seq;
	private String reservationno;
	private String userid;
	private Date datepayed;
	private int price;
	private String optionpay;
	private int saleticket;
	private int usedpoint;
	private String title;
	private int peoplenum;
	private String advanceno;
	private String ticketname;
	private int discount;
	private Date startdate;
	private Date expirationdate;
	private int point;
	private int theaterno;
	private String seatno;
	private String starttime;
	private Date screeningday;
	private String poster;
	
	
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getSeatno() {
		return seatno;
	}
	public void setSeatno(String seatno) {
		this.seatno = seatno;
	}
	public int getTheaterno() {
		return theaterno;
	}
	public void setTheaterno(int theaterno) {
		this.theaterno = theaterno;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getReserve_seq() {
		return reserve_seq;
	}
	public void setReserve_seq(int reserve_seq) {
		this.reserve_seq = reserve_seq;
	}
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
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Date getDatepayed() {
		return datepayed;
	}
	public void setDatepayed(Date datepayed) {
		this.datepayed = datepayed;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getOptionpay() {
		return optionpay;
	}
	public void setOptionpay(String optionpay) {
		this.optionpay = optionpay;
	}
	public int getSaleticket() {
		return saleticket;
	}
	public void setSaleticket(int saleticket) {
		this.saleticket = saleticket;
	}
	public int getUsedpoint() {
		return usedpoint;
	}
	public void setUsedpoint(int usedpoint) {
		this.usedpoint = usedpoint;
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
	
	public String getAdvanceno() {
		return advanceno;
	}
	public void setAdvanceno(String advanceno) {
		this.advanceno = advanceno;
	}
	public String getTicketname() {
		return ticketname;
	}
	public void setTicketname(String ticketname) {
		this.ticketname = ticketname;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getExpirationdate() {
		return expirationdate;
	}
	public void setExpirationdate(Date expirationdate) {
		this.expirationdate = expirationdate;
	}
	
	
	public Date getScreeningday() {
		return screeningday;
	}
	public void setScreeningday(Date screeningday) {
		this.screeningday = screeningday;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	@Override
	public String toString() {
		return "ReserveVO [reserve_seq=" + reserve_seq + ", timetable_seq="
				+ timetable_seq + ", reservationno=" + reservationno
				+ ", userid=" + userid + ", datepayed=" + datepayed
				+ ", price=" + price + ", optionpay=" + optionpay
				+ ", saleticket=" + saleticket + ", usedpoint=" + usedpoint
				+ ", title=" + title + ", peoplenum=" + peoplenum
				+ ", advanceno=" + advanceno + ", ticketname=" + ticketname
				+ ", discount=" + discount + ", startdate=" + startdate
				+ ", expirationdate=" + expirationdate + ", point=" + point
				+ ", theaterno=" + theaterno + ", seatno=" + seatno
				+ ", starttime=" + starttime + "]";
	}
}
