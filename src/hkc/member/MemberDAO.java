package hkc.member;

import hkc.common.MybatisConfig;
import hkc.reserve.ReserveVO;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class MemberDAO {
	private SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();

	/* 회원등록 */
	public void enrollMember(MemberVO membervo) throws SQLException {
		SqlSession ss = null;
		System.out.println(membervo);
		try {
			ss = factory.openSession();
			ss.insert("member.enrollMember", membervo);
			ss.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null)
				ss.close();
		}
	}

	/* 아이디 중복 확인 */
	public MemberVO checkId(String userid) throws SQLException {
		MemberVO membervo = null;
		SqlSession ss = null;
		try {
			ss = factory.openSession();
			membervo = ss.selectOne("member.checkId", userid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null)
				ss.close();
		}
		return membervo;
	}
	
	/* 전화번호 중복 확인 */
	public MemberVO checkPhone(String phone) throws SQLException {
		MemberVO membervo = null;
		SqlSession ss = null;
		try {
			ss = factory.openSession();
			membervo = ss.selectOne("member.checkPhone", phone);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null)
				ss.close();
		}
		return membervo;
	}
	/* 로그인 */
	public MemberVO login(String userid, String password) throws SQLException{
		MemberVO membervo = null;
		SqlSession ss = null; 
		HashMap<String,Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("password", password);
		System.out.println(userid + password);
		try {
			ss = factory.openSession();
			membervo = ss.selectOne("member.login", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) ss.close();
		}
		return membervo;
	}
	
	/* 마이페이지 */
	/* 내 정보 불러오기 */
	public MemberVO myPage(String userid) throws SQLException {
		MemberVO membervo = null;
		SqlSession ss = null;
		try {
			ss = factory.openSession();
			membervo = ss.selectOne("member.goMyPage", userid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null)
				ss.close();
		}
		return membervo;
	}
	/* 예매 내역 불러오기 */
	public List<ReserveVO> reservedInfo(MemberVO membervo) throws SQLException {
		List<ReserveVO> reservelist = null;
		SqlSession ss = null;
		try {
			ss = factory.openSession();
			/*System.out.println(membervo);*/
			reservelist = ss.selectList("member.reservedInfo", membervo);
			/*System.out.println(reservelist);*/
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null)
				ss.close();
		}
		return reservelist;
	}
	/* 좌석 정보 불러오기 */
	public List<ReserveVO> seatInfo(MemberVO membervo) throws SQLException {
		List<ReserveVO> seatlist = null;
		SqlSession ss = null;
		try {
			ss = factory.openSession();
			System.out.println(membervo);
			seatlist = ss.selectList("member.seatInfo", membervo);
			System.out.println(seatlist);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null)
				ss.close();
		}
		return seatlist;
	}
	
	
	/*예매 취소*/
	public void cancleReservation(String reservationno)  throws SQLException {
		SqlSession ss = null;
		try {
			ss = factory.openSession();
			ss.delete("member.cancleReservation", reservationno);
			System.out.println(reservationno);
			ss.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) ss.close();
		}
	}
	/*좌석 정보 삭제*/
	public void cancleSeatReservation(String reservationno)  throws SQLException {
		SqlSession ss = null;
		try {
			ss = factory.openSession();
			ss.delete("member.cancleSeatReservation", reservationno);
			System.out.println(reservationno);
			ss.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) ss.close();
		}
	}
	/* 비밀번호 확인 */
	public MemberVO  pass_cnf(String userid, String password) throws SQLException{
		MemberVO membervo = null;
		SqlSession ss = null; 
		HashMap<String,Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("password", password);
		
		try {
			ss = factory.openSession();
			membervo = ss.selectOne("member.login", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) ss.close();
		}
		return membervo;
	}
	
	/* 개인정보수정 */
	public void modifyMember(MemberVO membervo) throws SQLException {
		SqlSession ss = null;
		
		try {
			ss = factory.openSession();
			ss.update("member.modifyMember", membervo);
			ss.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) ss.close(); 
		}
	}

	public void canclePoint(MemberVO membervo) {
		SqlSession ss = null;
		try {
			ss = factory.openSession();
			ss.update("member.canclePoint", membervo);
			ss.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) ss.close(); 
		}
	}
}
