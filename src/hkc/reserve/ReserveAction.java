package hkc.reserve;

import hkc.member.MemberVO;
import hkc.theater.TheaterVO;
import hkc.vo.CreditcardVO;
import hkc.vo.PhoneVO;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class ReserveAction extends ActionSupport implements SessionAware{
	private String seatnostr;						//좌석번호
	private String seattitle;						//좌석명
	
	private ReserveVO reservevo;
	private CreditcardVO creditcardvo;
	private PhoneVO phonevo;
	private TheaterVO theatervo;
	private ReserveDAO reservedao;
	private MemberVO membervo;
	
	private String couponSearch;
	
	private Map<String, Object> session;
	private String userid;
	
	private boolean isExist = false;				//유효한 카드번호인지 또는 핸드폰정보인지
	
	private String advanceno;						//사용한 쿠폰
	private int point;								//사용한 포인트
	private int timetable_seq;						//영화상영시간의 번호
	
	/*예약하기 위한 정보를 가져온다.*/
	public String reserveView() throws Exception {
		reservedao = new ReserveDAO();
		userid = (String)session.get("LoginId");
		membervo = reservedao.getPointOfMember(userid);
		seatnostr = seatnostr.replaceAll("\\p{Z}", "");
		return SUCCESS;
	}
	/*쿠폰의 유무를 확인한다.*/
	public String isCouponInfo() throws Exception {
		reservedao = new ReserveDAO();
		reservevo = reservedao.getCouponInfo(couponSearch);
		return SUCCESS;
	}
	/*카드정보가 존재하는지 확인*/
	public String correctCardInfo() throws Exception {
		reservedao = new ReserveDAO();
		creditcardvo = reservedao.isMemberOfCard(creditcardvo);
		if (creditcardvo != null) {
			isExist = true;
		}
		return SUCCESS;
	}
	/*핸드폰 정보가 맞는지 확인*/
	public String correctPhoneInfo() throws Exception {
		reservedao = new ReserveDAO();
		phonevo = reservedao.isMemberOfPhone(phonevo);
		if (phonevo != null) {
			isExist = true;
		}
		return SUCCESS;
	}
	/*예매완료*/
	public String reserveComplete() throws Exception {
		reservedao = new ReserveDAO();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		reservevo.setReservationno(theatervo.getPoster().substring(0, 3).toUpperCase() + new StringBuffer(sdf.format(date)).reverse().toString());

		//DB에 넣는다.
		reservedao.insertReserve(reservevo);													//예매한다.
		
		reservedao.insertSeat(reservevo, seatnostr);											//좌석을 예매한다.

		reservedao.updateCouponUsed(advanceno);													//사용한 쿠폰을 없앤다.
		reservedao.updatePointUsed(point, reservevo.getUserid(), reservevo.getPrice());			//사용한 포인트를 삭감한다.
		return SUCCESS;
	}
	/*예매결과를 가져온다.*/
	public String reserveResult() throws Exception {
		System.out.println("askdjfhaskldhfaklsdhf");
		reservedao = new ReserveDAO();
		List<ReserveVO> listseat = reservedao.getSeatReserved(reservevo);
		seatnostr = "";
		for (int i = 0; i < listseat.size(); i++) {
			if (i != listseat.size() - 1) {
				seatnostr += listseat.get(i).getSeatno()+",";
			} else {
				seatnostr += listseat.get(i).getSeatno();
			}
		}
		reservevo = reservedao.getReserveResult(reservevo);
		System.out.println(reservevo);
		return SUCCESS;
	}
	
	
	public String getSeatnostr() {
		return seatnostr;
	}
	public void setSeatnostr(String seatnostr) {
		this.seatnostr = seatnostr;
	}
	public ReserveVO getReservevo() {
		return reservevo;
	}
	public void setReservevo(ReserveVO reservevo) {
		this.reservevo = reservevo;
	}
	public String getCouponSearch() {
		return couponSearch;
	}
	public void setCouponSearch(String couponSearch) {
		this.couponSearch = couponSearch;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public MemberVO getMembervo() {
		return membervo;
	}
	public void setMembervo(MemberVO membervo) {
		this.membervo = membervo;
	}
	public TheaterVO getTheatervo() {
		return theatervo;
	}
	public void setTheatervo(TheaterVO theatervo) {
		this.theatervo = theatervo;
	}
	public String getSeattitle() {
		return seattitle;
	}
	public void setSeattitle(String seattitle) {
		this.seattitle = seattitle;
	}
	public CreditcardVO getCreditcardvo() {
		return creditcardvo;
	}
	public void setCreditcardvo(CreditcardVO creditcardvo) {
		this.creditcardvo = creditcardvo;
	}
	public boolean getIsExist() {
		return isExist;
	}
	public void setIsExist(boolean isExist) {
		this.isExist = isExist;
	}
	public PhoneVO getPhonevo() {
		return phonevo;
	}
	public void setPhonevo(PhoneVO phonevo) {
		this.phonevo = phonevo;
	}
	public String getAdvanceno() {
		return advanceno;
	}
	public void setAdvanceno(String advanceno) {
		this.advanceno = advanceno;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getTimetable_seq() {
		return timetable_seq;
	}
	public void setTimetable_seq(int timetable_seq) {
		this.timetable_seq = timetable_seq;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}
