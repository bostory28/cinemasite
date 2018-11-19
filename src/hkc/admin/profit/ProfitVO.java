package hkc.admin.profit;

public class ProfitVO {
	private String title;
	private int teen;
	private int twenty;
	private int thirty;
	private int forty;
	private int fifty;
	private int sixty;
	private int man;
	private int woman;
	private int totalPeopleCntOfMovieSeen;
	private int totalSaleOfMovie;
	private int netProfit;
	private int totalSaleOfMonth;
	private String mon;
	private int countPeopleOfmonth;
	private int netPrifotOfMonth;
	
	public int getNetPrifotOfMonth() {
		return netPrifotOfMonth;
	}
	public void setNetPrifotOfMonth(int netPrifotOfMonth) {
		this.netPrifotOfMonth = netPrifotOfMonth;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getTeen() {
		return teen;
	}
	public void setTeen(int teen) {
		this.teen = teen;
	}
	public int getTwenty() {
		return twenty;
	}
	public void setTwenty(int twenty) {
		this.twenty = twenty;
	}
	public int getThirty() {
		return thirty;
	}
	public void setThirty(int thirty) {
		this.thirty = thirty;
	}
	public int getForty() {
		return forty;
	}
	public void setForty(int forty) {
		this.forty = forty;
	}
	public int getFifty() {
		return fifty;
	}
	public void setFifty(int fifty) {
		this.fifty = fifty;
	}
	public int getSixty() {
		return sixty;
	}
	public void setSixty(int sixty) {
		this.sixty = sixty;
	}
	public int getMan() {
		return man;
	}
	public void setMan(int man) {
		this.man = man;
	}
	public int getWoman() {
		return woman;
	}
	public void setWoman(int woman) {
		this.woman = woman;
	}
	public int getTotalPeopleCntOfMovieSeen() {
		return totalPeopleCntOfMovieSeen;
	}
	public void setTotalPeopleCntOfMovieSeen(int totalPeopleCntOfMovieSeen) {
		this.totalPeopleCntOfMovieSeen = totalPeopleCntOfMovieSeen;
	}
	public int getTotalSaleOfMovie() {
		return totalSaleOfMovie;
	}
	public void setTotalSaleOfMovie(int totalSaleOfMovie) {
		this.totalSaleOfMovie = totalSaleOfMovie;
	}
	public int getNetProfit() {
		return netProfit;
	}
	public void setNetProfit(int netProfit) {
		this.netProfit = netProfit;
	}
	public int getTotalSaleOfMonth() {
		return totalSaleOfMonth;
	}
	public void setTotalSaleOfMonth(int totalSaleOfMonth) {
		this.totalSaleOfMonth = totalSaleOfMonth;
	}
	public String getMon() {
		return mon;
	}
	public void setMon(String mon) {
		this.mon = mon;
	}
	public int getCountPeopleOfmonth() {
		return countPeopleOfmonth;
	}
	public void setCountPeopleOfmonth(int countPeopleOfmonth) {
		this.countPeopleOfmonth = countPeopleOfmonth;
	}
	@Override
	public String toString() {
		return "ProfitVO [title=" + title + ", teen=" + teen + ", twenty="
				+ twenty + ", thirty=" + thirty + ", forty=" + forty
				+ ", fifty=" + fifty + ", sixty=" + sixty + ", man=" + man
				+ ", woman=" + woman + ", totalPeopleCntOfMovieSeen="
				+ totalPeopleCntOfMovieSeen + ", totalSaleOfMovie="
				+ totalSaleOfMovie + ", netProfit=" + netProfit
				+ ", totalSaleOfMonth=" + totalSaleOfMonth + ", mon=" + mon
				+ ", countPeopleOfmonth=" + countPeopleOfmonth
				+ ", netPrifotOfMonth=" + netPrifotOfMonth + "]";
	}
}
