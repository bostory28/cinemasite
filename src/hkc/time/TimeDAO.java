package hkc.time;

import java.util.ArrayList;
import java.util.List;

import hkc.common.MybatisConfig;
import hkc.vo.Movie;
import hkc.vo.Reservenow;
import hkc.vo.Timetable;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class TimeDAO {
	SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	Reservenow reservenow;
	List<Timetable>timetableList;
	public List<Movie> selectOpeningMovie() {
		List<Movie> openingMovieList = null;
		SqlSession sqlsession = null;
		try {
				openingMovieList = new ArrayList<Movie>();
				sqlsession = factory.openSession();
				openingMovieList = sqlsession.selectList("time.selectOpeningMovie");
				sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return openingMovieList;
	}

	public void timeInsertUserMovieChoice(Reservenow rn) {
		SqlSession sqlsession = null;
		try {
				sqlsession = factory.openSession();
				sqlsession.insert("time.timeInsertUserMovieChoice", rn);
				sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
	}

	public Reservenow timeSelectUserMovieChoice(Reservenow rn) {
		SqlSession sqlsession = null;
		reservenow = null;
		try {
				sqlsession = factory.openSession();
				reservenow = sqlsession.selectOne("time.timeSelectUserMovieChoice", rn);
				sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return reservenow;
	}

	public void timeUpdateUserMovieChoice(Reservenow rn) {
		SqlSession sqlsession = null;
		try {
				sqlsession = factory.openSession();
				sqlsession.update("time.timeUpdateUserMovieChoice", rn);
				sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
	}

	public Reservenow timeSelectUserDayChoice(Reservenow rn) {
		SqlSession sqlsession = null;
		reservenow = null;
		try {
				sqlsession = factory.openSession();
				reservenow = sqlsession.selectOne("time.timeSelectUserDayChoice", rn);
				sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return reservenow;
	}

	public void timeInsertUserDayChoice(Reservenow rn) {
		SqlSession sqlsession = null;
		try {
				sqlsession = factory.openSession();
				sqlsession.insert("time.timeInsertUserDayChoice", rn);
				sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
	}

	public void timeUpdateUserDayChoice(Reservenow rn) {
		SqlSession sqlsession = null;
		try {
				sqlsession = factory.openSession();
				sqlsession.update("time.timeUpdateUserDayChoice", rn);
				sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
	}

	public List<Timetable> timeSelectMovieTime(Reservenow rn) {
		timetableList = new ArrayList<Timetable>();
		SqlSession sqlsession = null;
		try {
				sqlsession = factory.openSession();
				timetableList = sqlsession.selectList("time.timeSelectMovieTime", rn);
				sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return timetableList;
	}

	public void timeDeleteUserChoice(String userid) {
		SqlSession sqlsession = null;
		try {
				sqlsession = factory.openSession();
				sqlsession.delete("time.timeDeleteUserChoice", userid);
				sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
	}

	public List<Timetable> timeTodayMovieTime(Reservenow rs) {
		timetableList = new ArrayList<Timetable>();
		SqlSession sqlsession = null;
		try {
				sqlsession = factory.openSession();
				timetableList = sqlsession.selectList("time.timeTodayMovieTime", rs);
				sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return timetableList;
	}

}
