package hkc.detail;

import hkc.common.MybatisConfig;
import hkc.vo.Movie;
import hkc.vo.Review;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class DetailDAO {
	SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	List<Review> reviewList;
	Movie movie;
	int count;
	float point;
	public void commentDAO(Review review) {
		SqlSession sqlsession = null;		
		try {
				sqlsession = factory.openSession();
				sqlsession.insert("detail.registerComment", review);
				sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		
	}

	public List<Review> getComment(int movie_seq) {
		SqlSession sqlsession = null;		
		reviewList = new ArrayList<Review>();
		try {
				sqlsession = factory.openSession();
				reviewList = sqlsession.selectList("detail.getComment",movie_seq);
				sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return reviewList;
	}

	public Movie getMovie(int movie_seq) {
		SqlSession sqlsession = null;		
		movie=new Movie();
		
		try {
				sqlsession = factory.openSession();
				movie=sqlsession.selectOne("detail.getMovie",movie_seq);
				sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return movie;
	}
	
	public int deleteComment(int review_seq){
	     SqlSession sqlSession = null;
	     int result = 0;
	     
	      try {
	         sqlSession = factory.openSession();
	         result = sqlSession.delete("detail.deleteComment", review_seq);
	         sqlSession.commit();
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         if(sqlSession != null) sqlSession.close();
	      }
	      
	      return result;
	   }

	public void reCommentDAO(Review review) {
		SqlSession sqlsession = null;		
		try {
				sqlsession = factory.openSession();
				sqlsession.update("detail.updateComment", review);
				sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
	}

	public int getMansReserveCount(int movie_seq) {
		count = 0;
		SqlSession sqlsession = null;		
		try {
				sqlsession = factory.openSession();
				count = sqlsession.selectOne("detail.getMansReserveCount", movie_seq);
				sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return count;
	}
	
	public int getWomansReserveCount(int movie_seq) {
		count = 0;
		SqlSession sqlsession = null;		
		try {
			sqlsession = factory.openSession();
			count = sqlsession.selectOne("detail.getWomansReserveCount", movie_seq);
			sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return count;
	}

	public float getMoviePointAvg(int movie_seq) {
		point = 0;
		SqlSession sqlsession = null;		
		try {
			sqlsession = factory.openSession();
			point = sqlsession.selectOne("detail.getMoviePointAvg", movie_seq);
			System.out.println(point);
			sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return point;
	}

	public int getTeensReserveCount(int movie_seq) {
		count = 0;
		SqlSession sqlsession = null;		
		try {
			sqlsession = factory.openSession();
			count = sqlsession.selectOne("detail.getTeensReserveCount", movie_seq);
			sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return count;
	}

	public int getTwentiesReserveCount(int movie_seq) {
		count = 0;
		SqlSession sqlsession = null;		
		try {
			sqlsession = factory.openSession();
			count = sqlsession.selectOne("detail.getTwentiesReserveCount", movie_seq);
			sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return count;
	}

	public int getThirtiesReserveCount(int movie_seq) {
		count = 0;
		SqlSession sqlsession = null;		
		try {
			sqlsession = factory.openSession();
			count = sqlsession.selectOne("detail.getThirtiesReserveCount", movie_seq);
			sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return count;
	}

	public int getFortiesReserveCount(int movie_seq) {
		count = 0;
		SqlSession sqlsession = null;		
		try {
			sqlsession = factory.openSession();
			count = sqlsession.selectOne("detail.getFortiesReserveCount", movie_seq);
			sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return count;
	}
}

