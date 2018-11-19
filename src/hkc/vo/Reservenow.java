package hkc.vo;

public class Reservenow {
	String reserveday;
	int reservemovie_seq;
	String userid;
	public Reservenow(String reserveday, int reservemovie_seq, String userid) {
		super();
		this.reserveday = reserveday;
		this.reservemovie_seq = reservemovie_seq;
		this.userid = userid;
	}
	public Reservenow() {
	}
	public String getReserveday() {
		return reserveday;
	}
	public void setReserveday(String reserveday) {
		this.reserveday = reserveday;
	}
	public int getReservemovie_seq() {
		return reservemovie_seq;
	}
	public void setReservemovie_seq(int reservemovie_seq) {
		this.reservemovie_seq = reservemovie_seq;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "Reservenow [reserveday=" + reserveday + ", reservemovie_seq="
				+ reservemovie_seq + ", userid=" + userid + "]";
	}
}
