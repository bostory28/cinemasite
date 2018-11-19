package hkc.admin.movie;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import hkc.admin.profit.ProfitVO;
import hkc.common.MybatisConfig;
import hkc.vo.Movie;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class MovieDAO {
	SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	/*영화의 리스트를 가져온다.*/
	public List<Movie> getMovieList(String year) throws SQLException {
		List<Movie> list = null;
		SqlSession sqlsession = null;
		try {
			sqlsession = factory.openSession();
			list = sqlsession.selectList("movieAdmin.getMovieList", year);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return list;
	}
	/*선택한 영화의 정보를 가져온다.*/
	public Movie readOneOfMovie(int movie_seq) throws SQLException {
		Movie vo = null;
		SqlSession sqlsession = null;
		try {
			sqlsession = factory.openSession();
			vo = sqlsession.selectOne("movieAdmin.readOneOfMovie", movie_seq);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return vo;
	}
	/*영화정보를 수정한다.*/
	public void modifyMovie(Movie movieVo) throws SQLException {
		SqlSession sqlsession = null;
		try {
			sqlsession = factory.openSession();
			sqlsession.update("movieAdmin.modifyMovie", movieVo);
			sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
	}
	/*영화를 삭제한다.*/
	public void deleteMovie(int movie_seq) throws SQLException {
		SqlSession sqlsession = null;
		try {
			sqlsession = factory.openSession();
			sqlsession.delete("movieAdmin.deleteMovie", movie_seq);
			sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
	}
	/*영화를 등록한다.*/
	public void insertMovie(Movie movieVo) throws SQLException {
		SqlSession sqlsession = null;
		try {
			sqlsession = factory.openSession();
			sqlsession.insert("movieAdmin.insertMovie", movieVo);
			sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
	}
}
