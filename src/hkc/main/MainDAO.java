package hkc.main;

import hkc.common.MybatisConfig;
import hkc.movielist.ReserveVO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class MainDAO {
	SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	
	public List<MovieVO> getMovieList(){
		List<MovieVO> movieList=null;
		SqlSession sqlsession = null;
		try {
			sqlsession = factory.openSession();
			movieList=sqlsession.selectList("main.mainView");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}	
		return movieList;
	}
	
	public PreviewVO getPreMovie(){
		PreviewVO prevo=null;
		SqlSession sqlsession = null;
		try {
			sqlsession = factory.openSession();
			prevo=sqlsession.selectOne("main.preView");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}	
		return prevo;
	}
	
	public List<ReserveVO> getReserveList(){
		List<ReserveVO> reserveList=null;
		SqlSession sqlsession = null;
		try {
			sqlsession = factory.openSession();
			reserveList=sqlsession.selectList("main.reserveList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}	
		return reserveList;
	}
}

