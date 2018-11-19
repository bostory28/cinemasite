package hkc.admin.profit;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import hkc.common.MybatisConfig;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class ProfitDAO {
	SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	
	/*영화별 통계를 낸다.*/
	public List<ProfitVO> profitMovieView(String sortSelected, String yearSelected) throws SQLException {
		List<ProfitVO> list = null;
		SqlSession sqlsession = null;
		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("sortSelected", sortSelected);
		hashmap.put("yearSelected", yearSelected);
		try {
			sqlsession = factory.openSession();
			list = sqlsession.selectList("profit.profitMovieView", hashmap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return list;
	}
	
	/*월별 통계를 낸다.*/
	public List<ProfitVO> profitMonthView(String sortSelected, String yearSelected) throws SQLException {
		List<ProfitVO> list = null;
		SqlSession sqlsession = null;
		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("sortSelected", sortSelected);
		hashmap.put("yearSelected", yearSelected);
		try {
			sqlsession = factory.openSession();
			list = sqlsession.selectList("profit.profitMonthView", hashmap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlsession != null) sqlsession.close(); 
		}
		return list;
	}
}
