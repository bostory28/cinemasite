package hkc.theater;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import hkc.common.MybatisConfig;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class TheaterDAO {
	SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	/*좌석을 가져온다.*/
	public List<TheaterVO> getTheaterSeat(int theaterno, int timetable_seq) throws SQLException {
		List<TheaterVO> theaterList = null;
		SqlSession sqlsession = null;
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("theaterno", theaterno);
		hashmap.put("timetable_seq", timetable_seq);
		try {
			sqlsession = factory.openSession();
			theaterList = sqlsession.selectList("theater.getTheaterSeat", hashmap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		
		return theaterList;
	}
	/*영화의 정보를 가져온다.*/
	public TheaterVO getMovieInfo(int timetable_seq) throws SQLException {
		TheaterVO theater = null;
		SqlSession sqlsession = null;
		try {
			sqlsession = factory.openSession();
			theater = sqlsession.selectOne("theater.getMovieInfo", timetable_seq);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return theater;
	}
	/*현재 예매한 좌석의 수를 가져온다.*/
	public int getCountReservedSeat(int timetable_seq) throws SQLException {
		SqlSession sqlsession = null;
		int count = 0;
		try {
			sqlsession = factory.openSession();
			count = sqlsession.selectOne("theater.getCountReservedSeat", timetable_seq);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return count;
	}
}
