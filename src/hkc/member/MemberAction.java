package hkc.member;

import hkc.reserve.ReserveVO;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class MemberAction extends ActionSupport implements SessionAware {
	private MemberVO membervo;
	private MemberDAO memberdao;
	private ReserveVO reservevo;
	private int price;
	private String userid;
	private String userid_search;
	private String password;
	private String phone;
	private String birthday;
	private String seatno;
	private String reservationno;
	private int point;
	private boolean usableId = false; // 아이디의 사용가능 여부
	private boolean usablePhone = false; // 전화번호의 사용가능 여부

	private String email_split[] = null;
	private String phone_split[] = null;
	private String birthday_split[] = null;

	private Map<String, Object> session;
	private List<ReserveVO> reservelist;
	private List<ReserveVO> seatlist;

	/* 회원가입 */
	public String enrollMember() throws Exception {
		memberdao = new MemberDAO();
		memberdao.enrollMember(membervo);
		session.put("LoginId", membervo.getUserid());

		return SUCCESS;
	}

	/* 아이디 중복을 체크한다. */
	public String checkId() throws Exception {
		memberdao = new MemberDAO();
		System.out.println(userid);
		membervo = memberdao.checkId(userid);
		if (membervo == null) {
			usableId = true;
		}
		return SUCCESS;
	}

	/* 전화번호 중복을 체크한다. */
	public String checkPhone() throws Exception {
		memberdao = new MemberDAO();
		membervo = memberdao.checkPhone(phone);
		if (membervo == null) {
			usablePhone = true;
		}
		return SUCCESS;
	}

	/* 로그인 */
	public String login() throws Exception {
		memberdao = new MemberDAO();
		membervo = memberdao
				.login(membervo.getUserid(), membervo.getPassword());
		if (membervo != null) {
			session.put("LoginId", membervo.getUserid());
		}
		return SUCCESS;
	}

	/* 로그아웃 */
	public String logout() throws Exception {
		session.clear();
		return SUCCESS;
	}

	/* 비밀번호를 확인한다. */
	public String pass_cnf() throws Exception {
		memberdao = new MemberDAO();
		membervo = memberdao.pass_cnf(membervo.getUserid(),
				membervo.getPassword());
		if (membervo != null) {
			session.put("LoginId", membervo.getUserid());
		}
		return SUCCESS;
	}

	/* 마이페이지로 보내기 */
	public String goMyPageForm() throws Exception {
		memberdao = new MemberDAO();
		userid = (String) session.get("LoginId");
		membervo = memberdao.checkId(userid);
		reservelist = memberdao.reservedInfo(membervo);
		//System.out.println(reservelist);
		seatlist = memberdao.seatInfo(membervo);
		seatno = "";
		for (int i = 0; i < reservelist.size(); i++) {
			for (int j = 0; j < seatlist.size(); j++) {
				System.out.println(seatlist);
				if (reservelist.get(i).getReservationno()
						.equals(seatlist.get(j).getReservationno())) {
					if (reservelist.get(i).getSeatno() == null) {
						reservelist.get(i).setSeatno(
								seatlist.get(j).getSeatno());
					} else {
						reservelist.get(i).setSeatno(
								reservelist.get(i).getSeatno()
										+ seatlist.get(j).getSeatno());
					}
				}
			}
			//System.out.println(reservelist.get(i).getSeatno());
		}
		return SUCCESS;
	}

	/* 예매내역 취소 */
	public String cancleReservation() throws SQLException {
		System.out.println(reservationno);
		memberdao = new MemberDAO();
		memberdao.cancleReservation(reservationno);
		memberdao.cancleSeatReservation(reservationno);
		membervo = new MemberVO();
		membervo.setPoint(point+"");
		String id = (String) session.get("LoginId");
		membervo.setUserid(id);
		System.out.println(membervo);
		memberdao.canclePoint(membervo);
		
		return SUCCESS;
	}

	/* 비밀번호 확인으로 보내기 */
	public String goPass_cnfForm() throws Exception {
		memberdao = new MemberDAO();
		String id = (String) session.get("LoginId");
		membervo = memberdao.checkId(id);
		return SUCCESS;
	}

	/* 회원정보수정 폼으로 보내기 */
	public String goModifyForm() throws Exception {
		memberdao = new MemberDAO();
		String id = (String) session.get("LoginId");
		membervo = memberdao.checkId(id);
		//System.out.println(membervo);
		// email을 @으로 자른다.
		String email = membervo.getEmail();
		email_split = email.split("\\@");
		// phone을 -으로 자른다.
		String phone = membervo.getPhone();
		phone_split = phone.split("\\-");
		// birthday를 .으로 자른다.
		String birthday = membervo.getBirthday();
		birthday_split = birthday.split("\\-");
		birthday_split[2] = birthday_split[2].substring(0, 2);
		//System.out.println(birthday_split[2]);
		return SUCCESS;
	}

	/* 회원정보 수정 */
	public String modifyMember() throws Exception {
		memberdao = new MemberDAO();
		memberdao.modifyMember(membervo);
		//System.out.println("sdsdsd"+membervo);
		session.put("LoginId", membervo.getUserid());
		return SUCCESS;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public MemberVO getMembervo() {
		return membervo;
	}

	public void setMembervo(MemberVO membervo) {
		this.membervo = membervo;
	}

	public MemberDAO getMemberdao() {
		return memberdao;
	}

	public void setMemberdao(MemberDAO memberdao) {
		this.memberdao = memberdao;
	}

	public ReserveVO getReservevo() {
		return reservevo;
	}

	public void setReservevo(ReserveVO reservevo) {
		this.reservevo = reservevo;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserid_search() {
		return userid_search;
	}

	public void setUserid_search(String userid_search) {
		this.userid_search = userid_search;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isUsableId() {
		return usableId;
	}

	public void setUsableId(boolean usableId) {
		this.usableId = usableId;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public boolean isUsablePhone() {
		return usablePhone;
	}

	public void setUsablePhone(boolean usablePhone) {
		this.usablePhone = usablePhone;
	}

	public String[] getEmail_split() {
		return email_split;
	}

	public void setEmail_split(String[] email_split) {
		this.email_split = email_split;
	}

	public String[] getPhone_split() {
		return phone_split;
	}

	public void setPhone_split(String[] phone_split) {
		this.phone_split = phone_split;
	}

	public String[] getBirthday_split() {
		return birthday_split;
	}

	public void setBirthday_split(String[] birthday_split) {
		this.birthday_split = birthday_split;
	}

	public List<ReserveVO> getReservelist() {
		return reservelist;
	}

	public void setReservelist(List<ReserveVO> reservelist) {
		this.reservelist = reservelist;
	}

	public List<ReserveVO> getSeatlist() {
		return seatlist;
	}

	public void setSeatlist(List<ReserveVO> seatlist) {
		this.seatlist = seatlist;
	}

	public String getSeatno() {
		return seatno;
	}

	public void setSeatno(String seatno) {
		this.seatno = seatno;
	}

	
	
	public String getReservationno() {
		return reservationno;
	}

	public void setReservationno(String reservationno) {
		this.reservationno = reservationno;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;

	}

}
