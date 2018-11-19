package hkc.admin.profit;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

public class ProfitAction extends ActionSupport{
	private String sortSelected = "영화별";
	private String yearSelected = "2015";
	
	private List<ProfitVO> list_movie;
	private List<ProfitVO> list_month;
	
	/*영화별 통계를 낸다.*/
	public String profitMovieView() throws Exception {
		ProfitDAO profitDao = new ProfitDAO();
		yearSelected = yearSelected.substring(0,  4);
		list_movie = profitDao.profitMovieView(sortSelected, yearSelected.substring(0, 4));
		return SUCCESS;
	}
	
	/*월별 통계를 낸다.*/
	public String profitMonthView() throws Exception {
		ProfitDAO profitDao = new ProfitDAO();
		yearSelected = yearSelected.substring(0,  4);
		list_month = profitDao.profitMonthView(sortSelected, yearSelected);
		System.out.println(list_month);
		return SUCCESS;
	}

	
	
	public String getSortSelected() {
		return sortSelected;
	}

	public void setSortSelected(String sortSelected) {
		this.sortSelected = sortSelected;
	}

	public String getYearSelected() {
		return yearSelected;
	}

	public void setYearSelected(String yearSelected) {
		this.yearSelected = yearSelected;
	}

	public List<ProfitVO> getList_movie() {
		return list_movie;
	}

	public void setList_movie(List<ProfitVO> list_movie) {
		this.list_movie = list_movie;
	}

	public List<ProfitVO> getList_month() {
		return list_month;
	}

	public void setList_month(List<ProfitVO> list_month) {
		this.list_month = list_month;
	}
	
	
}
