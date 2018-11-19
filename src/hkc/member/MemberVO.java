package hkc.member;


public class MemberVO {
	private String userid;
	private String password;
	private String name;
	private String birthday;
	private String sex;
	private String email;
	private String phone;
	private String point;

	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "MemberVO [userid=" + userid + ", password=" + password
				+ ", name=" + name + ", birthday=" + birthday + ", sex=" + sex
				+ ", email=" + email + ", phone=" + phone + ", point=" + point
				+ "]";
	}
	
	

}