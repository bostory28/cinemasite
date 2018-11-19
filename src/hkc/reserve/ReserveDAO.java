package hkc.reserve;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import hkc.common.MybatisConfig;
import hkc.member.MemberVO;
import hkc.vo.CreditcardVO;
import hkc.vo.PhoneVO;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class ReserveDAO {
	SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	
	/*쿠폰이 존재하는지 검사*/
	public ReserveVO getCouponInfo(String couponSearch) throws SQLException {
		ReserveVO reservevo = null;
		SqlSession sqlsession = null;
		try {
			sqlsession = factory.openSession();
			reservevo = sqlsession.selectOne("reserve.getCouponInfo", couponSearch);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return reservevo;
	}
	/*맴버의 포인트를 가져온다.*/
	public MemberVO getPointOfMember(String userid) throws SQLException {
		MemberVO membervo = null;
		SqlSession sqlsession = null;
		try {
			sqlsession = factory.openSession();
			membervo = sqlsession.selectOne("reserve.getPointOfMember", userid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return membervo;
	}
	/*카드정보가 맞는지*/
	public CreditcardVO isMemberOfCard(CreditcardVO creditcardvo) throws SQLException {
		CreditcardVO vo = null;
		SqlSession sqlsession = null;
		try {
			sqlsession = factory.openSession();
			vo = sqlsession.selectOne("reserve.isMemberOfCard", creditcardvo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return vo;
	}
	/*핸드폰 정보가 맞는지*/
	public PhoneVO isMemberOfPhone(PhoneVO phonevo) throws SQLException {
		PhoneVO vo = null;
		SqlSession sqlsession = null;
		try {
			sqlsession = factory.openSession();
			vo = sqlsession.selectOne("reserve.isMemberOfPhone", phonevo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return vo;
	}
	/*예매한다.*/
	public void insertReserve(ReserveVO reservevo) throws SQLException {
		SqlSession sqlsession = null;
		try {
			sqlsession = factory.openSession();
			sqlsession.insert("reserve.insertReserve", reservevo);
			sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
	}
	/*좌석도 예매한다.*/
	public void insertSeat(ReserveVO reservevo, String seatnostr) throws SQLException {
		SqlSession sqlsession = null;
		HashMap<String, Object> hasmap = new HashMap<String, Object>();
		hasmap.put("timetable_seq", reservevo.getTimetable_seq());
		hasmap.put("theaterno", reservevo.getTheaterno());
		hasmap.put("userid", reservevo.getUserid());
		hasmap.put("reservationno", reservevo.getReservationno());
		String split[] = seatnostr.split(",");
		System.out.println(split.length);
		for (int i = 0; i < split.length; i++) {
			hasmap.put("seatnostr", split[i]);
			try {
				sqlsession = factory.openSession();
				sqlsession.insert("reserve.insertSeat", hasmap);
				sqlsession.commit();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (sqlsession != null) sqlsession.close(); 
			}
			hasmap.remove("seatnostr");
		}
	}
	/*사용한 포인트를 삭감한다.*/
	public void updatePointUsed(int point, String userid, int price) throws SQLException {
		SqlSession sqlsession = null;
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("point", point);
		hashmap.put("userid", userid);
		hashmap.put("price", price);
		try {
			sqlsession = factory.openSession();
			sqlsession.update("reserve.updatePointUsed", hashmap);
			sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
	}
	/*사용한 쿠폰을 없앤다*/
	public void updateCouponUsed(String advanceno) throws SQLException {
		SqlSession sqlsession = null;
		String advancenosplit[] = advanceno.split(",");
		for (int i = 0; i < advancenosplit.length; i++) {
			try {
				sqlsession = factory.openSession();
				sqlsession.delete("reserve.updateCouponUsed", advancenosplit[i]);
				sqlsession.commit();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (sqlsession != null) sqlsession.close(); 
			}
		}
	}
	/*예매결과를 가져온다.*/
	public ReserveVO getReserveResult(ReserveVO reservevo) throws SQLException {
		ReserveVO vo = null;
		SqlSession sqlsession = null;
		try {
			sqlsession = factory.openSession();
			vo = sqlsession.selectOne("reserve.getReserveResult", reservevo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		System.out.println(vo);
		return vo;
	}
	
	public List<ReserveVO> getSeatReserved(ReserveVO reservevo) throws SQLException {
		List<ReserveVO> list = null;
		SqlSession sqlsession = null;
		
		try {
			sqlsession = factory.openSession();
			list = sqlsession.selectList("reserve.getSeatReserved", reservevo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return list;
	}
}
