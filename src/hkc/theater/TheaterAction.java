package hkc.theater;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class TheaterAction extends ActionSupport implements SessionAware{
	private TheaterVO theatervo;
	private TheaterDAO theaterdao;
	
	private int theaterno;
	private int timetable_seq = 89;
	private List<TheaterVO> list_theater;
	private int cols = 0;
	private int colvalue = 0;
	private int rows = 0;
	private String row_alpabet[] = new String[26];
	
	Map<String, Object> session = null;

	/*해당 영화관과 관련되 모든 정보를 가져온다.*/
	public String theaterView() throws Exception {
		String id = (String) session.get("LoginId");
		if (id == null) {
			return LOGIN;
		}
		theaterdao = new TheaterDAO();
		//영화정보가져오기
		theatervo = theaterdao.getMovieInfo(timetable_seq);
		//남은 좌석의 수를 가져오기 위해
		int seatreservedcount = theaterdao.getCountReservedSeat(timetable_seq);
		theatervo.setSeatremained(theatervo.getSeatnum() - seatreservedcount);
		//상영관번호
		theaterno = theatervo.getTheaterno();
		//상영관 정보가져오기
		list_theater = theaterdao.getTheaterSeat(theaterno, timetable_seq);
		System.out.println(list_theater);
		//행과 열이 몇개인지 가져오기 위해
		for (int i = 0; i < list_theater.size(); i++) {
			if (list_theater.get(i).getColseat() != i) {
				cols = i - 1;
				rows = list_theater.size() / cols - 1;
				break;
			}
		}
		colvalue = cols+1;
		//알파벳을 순서대로 넣기 위해
		String alpabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		for (int i = 0; i < cols; i++) {
			row_alpabet[i] = String.valueOf(alpabet.charAt(i));
		}
		return SUCCESS;
	}
	
	
	public int getTimetable_seq() {
		return timetable_seq;
	}

	public void setTimetable_seq(int timetable_seq) {
		this.timetable_seq = timetable_seq;
	}

	public List<TheaterVO> getList_theater() {
		return list_theater;
	}

	public void setList_theater(List<TheaterVO> list_theater) {
		this.list_theater = list_theater;
	}

	public int getTheaterno() {
		return theaterno;
	}

	public void setTheaterno(int theaterno) {
		this.theaterno = theaterno;
	}

	public TheaterVO getTheatervo() {
		return theatervo;
	}

	public void setTheatervo(TheaterVO theatervo) {
		this.theatervo = theatervo;
	}

	public int getCols() {
		return cols;
	}

	public void setCols(int cols) {
		this.cols = cols;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public String[] getRow_alpabet() {
		return row_alpabet;
	}

	public void setRow_alpabet(String[] row_alpabet) {
		this.row_alpabet = row_alpabet;
	}
	public int getColvalue() {
		return colvalue;
	}
	public void setColvalue(int colvalue) {
		this.colvalue = colvalue;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}
