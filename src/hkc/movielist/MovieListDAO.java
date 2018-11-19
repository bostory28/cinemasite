package hkc.movielist;

import java.util.List;

import hkc.common.MybatisConfig;
import hkc.main.MovieVO;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class MovieListDAO {
	SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	
	public List<MovieVO> getMovieList(){
		List<MovieVO> movieList=null;
		SqlSession sqlsession = null;
		try {
			sqlsession = factory.openSession();
			movieList=sqlsession.selectList("movielist.movielistView");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}	
		return movieList;
	}
	
	public List<ReserveVO> getReserveList(){
		List<ReserveVO> reserveList=null;
		SqlSession sqlsession = null;
		try {
			sqlsession = factory.openSession();
			reserveList=sqlsession.selectList("movielist.getReserveList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}	
		return reserveList;
	}
	
	public MovieVO getMovieDetail(String title){
		MovieVO movievo=null;
		SqlSession sqlsession = null;
		try {
			sqlsession = factory.openSession();
			movievo=sqlsession.selectOne("movielist.getMovieDetail",title);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}	
		System.out.println(movievo);
		return movievo;
	}
	
}
