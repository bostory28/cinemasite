package hkc.vo;

public class PhoneVO {
	private int phone_seq;
	private String phonenum;
	private String company;
	private String birthday;
	public int getPhone_seq() {
		return phone_seq;
	}
	public void setPhone_seq(int phone_seq) {
		this.phone_seq = phone_seq;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	@Override
	public String toString() {
		return "PhoneVO [phone_seq=" + phone_seq + ", phonenum=" + phonenum
				+ ", company=" + company + ", birthday=" + birthday + "]";
	}
	
	
}
