package hkc.admin;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import hkc.common.MybatisConfig;
import hkc.vo.Movie;
import hkc.vo.Timetable;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class AdminDAO {
	SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	Timetable timetable;
	
	public List<Movie> adminSearchMovie(String title) throws SQLException {
		List<Movie> movieList = null;
		List<Timetable> timetableList = null;
		SqlSession sqlsession = null;
		try {
				movieList = new ArrayList<Movie>();
				sqlsession = factory.openSession();
				movieList = sqlsession.selectList("admin.adminSearchMovie", title);
				sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return movieList;
	}

	public List<Movie> adminSearchMovie(int movie_seq) {
		List<Movie> movieList = null;
		SqlSession sqlsession = null;
		try {
				movieList = new ArrayList<Movie>();
				sqlsession = factory.openSession();
				movieList = sqlsession.selectList("admin.adminSearchOneMovie", movie_seq);
				sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return movieList;
	}

	public void adminInsertTimes(Timetable timetable) {
		SqlSession sqlsession = null;
		try {
				sqlsession = factory.openSession();
				sqlsession.insert("admin.adminInsertTimes", timetable);
				sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
	}

	public List<Timetable> adminSelectTimetable(String screeningday) {
		List<Timetable> timetableList = new ArrayList<Timetable>();
		SqlSession sqlsession = null;
		try {
				sqlsession = factory.openSession();
				timetableList = sqlsession.selectList("admin.adminSelectTimetable", screeningday);
				sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return timetableList;
	}

	public Timetable adminSelectOneTimetable(Timetable t) {
		SqlSession sqlsession = null;
		timetable = null;
		try {
				sqlsession = factory.openSession();
				timetable = sqlsession.selectOne("admin.adminSelectOneTimetable", t);
				sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return timetable;
	}

	public void adminUpdateTimes(Timetable timetable) {
		SqlSession sqlsession = null;
		try {
				sqlsession = factory.openSession();
				sqlsession.update("admin.adminUpdateTimes", timetable);
				sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
	}
}
