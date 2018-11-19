package hkc.vo;

import java.util.Date;

public class CreditcardVO {
	private int creditcard_seq;
	private String cardsort;
	private String cardnum;
	private int password;
	private String expirationdate;
	private String birthday;
	
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public int getCreditcard_seq() {
		return creditcard_seq;
	}
	public void setCreditcard_seq(int creditcard_seq) {
		this.creditcard_seq = creditcard_seq;
	}
	public String getCardsort() {
		return cardsort;
	}
	public void setCardsort(String cardsort) {
		this.cardsort = cardsort;
	}
	public String getCardnum() {
		return cardnum;
	}
	public void setCardnum(String cardnum) {
		this.cardnum = cardnum;
	}
	public int getPassword() {
		return password;
	}
	public void setPassword(int password) {
		this.password = password;
	}
	public String getExpirationdate() {
		return expirationdate;
	}
	public void setExpirationdate(String expirationdate) {
		this.expirationdate = expirationdate;
	}
	@Override
	public String toString() {
		return "CreditcardVO [creditcard_seq=" + creditcard_seq + ", cardsort="
				+ cardsort + ", cardnum=" + cardnum + ", password=" + password
				+ ", expirationdate=" + expirationdate + ", birthday="
				+ birthday + "]";
	}
	
	
	
}
