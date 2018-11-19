package hkc.time;

import hkc.theater.TheaterDAO;
import hkc.theater.TheaterVO;
import hkc.vo.Movie;
import hkc.vo.Reservenow;
import hkc.vo.Timetable;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class TimeAction extends ActionSupport implements SessionAware  {
	List<Movie>openingMovieList;
	Map<String , Object> session;
	int movie_seq;
	Reservenow reservenow;
	Reservenow userChoice;
	List<Reservenow> reservenowList;
	String userid;
	String reserveday;
	Timetable timetable;
	List<Timetable>timetableList;
	private TheaterVO theatervo;
	List<TheaterVO>theatervoList;
	public String goTimetable() throws Exception{
		userid = (String) session.get("LoginId");
		TimeDAO dao = new TimeDAO();
		if (userid!=null) {
			dao.timeDeleteUserChoice(userid);
			return SUCCESS;
		}
		return LOGIN;
	}
	public String selectOpeningMovie() throws Exception{
		TimeDAO dao = new TimeDAO();
		openingMovieList = dao.selectOpeningMovie();
		return SUCCESS;
	}
	public String timeUserMovieChoice() throws Exception{
		//System.out.println("action");
		TimeDAO dao = new TimeDAO();
		userid = (String) session.get("LoginId");
		//System.out.println(userid);
		reservenow = new Reservenow();
		reservenow.setReservemovie_seq(movie_seq);
		reservenow.setUserid(userid);
		reservenow.setReserveday(reserveday);
		System.out.println(reservenow);
		if (dao.timeSelectUserMovieChoice(reservenow)==null) {
			dao.timeInsertUserMovieChoice(reservenow);
		}else{
			dao.timeUpdateUserMovieChoice(reservenow);
		}
		Reservenow userChoice = dao.timeSelectUserMovieChoice(reservenow);
		System.out.println("now"+userChoice);
		reservenowList = new ArrayList<Reservenow>();
		reservenowList.add(userChoice);
		return SUCCESS;
	}
	
	public String timeUserDayChoice() throws Exception{
		//System.out.println("action");
		TimeDAO dao = new TimeDAO();
		userid = (String) session.get("LoginId");
		//System.out.println(userid);
		reservenow = new Reservenow();
		reservenow.setReservemovie_seq(movie_seq);
		reservenow.setUserid(userid);
		reservenow.setReserveday(reserveday);
		System.out.println(reservenow);
		if (dao.timeSelectUserDayChoice(reservenow)==null) {
			dao.timeInsertUserDayChoice(reservenow);
		}else{
			dao.timeUpdateUserDayChoice(reservenow);
		}
		Reservenow userChoice = dao.timeSelectUserDayChoice(reservenow);
		System.out.println("now"+userChoice);
		reservenowList = new ArrayList<Reservenow>();
		reservenowList.add(userChoice);
		return SUCCESS;
	}
	
	public String timeSelectMovieTime() throws Exception{
		System.out.println("action");
		timetableList = new ArrayList<Timetable>();
		reservenow = new Reservenow();
		reservenow.setReservemovie_seq(movie_seq);
		reservenow.setReserveday(reserveday);
		TimeDAO dao = new TimeDAO();
		System.out.println(reservenow);
		timetableList = dao.timeSelectMovieTime(reservenow);
		System.out.println(timetableList);
		return SUCCESS;
	}
	
	public String timeSelectAllMovieTime() throws Exception{
		TimeDAO dao = new TimeDAO();
		timetableList = new ArrayList<Timetable>();
		reservenow = new Reservenow();
		reservenow.setReserveday(reserveday);
		timetableList = dao.timeTodayMovieTime(reservenow);
		TheaterDAO theaterdao = new TheaterDAO();
		theatervoList = new ArrayList<TheaterVO>();
		for (int i = 0; i < timetableList.size(); i++) {
			//영화정보가져오기
			theatervo = theaterdao.getMovieInfo(timetableList.get(i).getTimetable_seq());
			//남은 좌석의 수를 가져오기 위해
			int seatreservedcount = theaterdao.getCountReservedSeat(timetableList.get(i).getTimetable_seq());
			timetableList.get(i).setSeatcount(theatervo.getSeatnum() - seatreservedcount);
		}
		System.out.println(timetableList);
		return SUCCESS;
	}
	
	public TheaterVO getTheatervo() {
		return theatervo;
	}
	public void setTheatervo(TheaterVO theatervo) {
		this.theatervo = theatervo;
	}
	public List<TheaterVO> getTheatervoList() {
		return theatervoList;
	}
	public void setTheatervoList(List<TheaterVO> theatervoList) {
		this.theatervoList = theatervoList;
	}
	public Timetable getTimetable() {
		return timetable;
	}

	public void setTimetable(Timetable timetable) {
		this.timetable = timetable;
	}

	public List<Timetable> getTimetableList() {
		return timetableList;
	}

	public void setTimetableList(List<Timetable> timetableList) {
		this.timetableList = timetableList;
	}

	public List<Reservenow> getReservenowList() {
		return reservenowList;
	}

	public void setReservenowList(List<Reservenow> reservenowList) {
		this.reservenowList = reservenowList;
	}

	public Reservenow getUserChoice() {
		return userChoice;
	}

	public void setUserChoice(Reservenow userChoice) {
		this.userChoice = userChoice;
	}

	public String getReserveday() {
		return reserveday;
	}

	public void setReserveday(String reserveday) {
		this.reserveday = reserveday;
	}

	public int getMovie_seq() {
		return movie_seq;
	}

	public void setMovie_seq(int movie_seq) {
		this.movie_seq = movie_seq;
	}

	public Reservenow getReservenow() {
		return reservenow;
	}

	public void setReservenow(Reservenow reservenow) {
		this.reservenow = reservenow;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public List<Movie> getOpeningMovieList() {
		return openingMovieList;
	}

	public void setOpeningMovieList(List<Movie> openingMovieList) {
		this.openingMovieList = openingMovieList;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}
