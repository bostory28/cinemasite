package hkc.admin;

import java.util.ArrayList;
import java.util.List;

import hkc.vo.Movie;
import hkc.vo.Timetable;

import com.opensymphony.xwork2.ActionSupport;

public class AdminAction extends ActionSupport{
	Movie movie;
	String title;
	List<Movie> movieList;
	int movie_seq;//영화번호
	String screeningday;//상영일
	String starttime;//상영시간
	int theaterno;//상영관
	int timeno;
	List<Timetable>timetableList;
	public String adminSearchMovie() throws Exception{
		System.out.println("action");
		movieList = new ArrayList<Movie>();
		System.out.println(title);
		AdminDAO dao = new AdminDAO();
		movieList = dao.adminSearchMovie(title);
		System.out.println(movieList.get(0));
		return SUCCESS;
	}
	public String adminSelectOneMovie() throws Exception{
		System.out.println("영화 찾기 : " + movie_seq);
		movieList = new ArrayList<Movie>();
		AdminDAO dao = new AdminDAO();
		movieList = dao.adminSearchMovie(movie_seq);
		movie = movieList.get(0);
		System.out.println(movieList.get(0));
		return SUCCESS;
	}
	
	public String adminInsertTimes() throws Exception{
		Timetable timetable = new Timetable();
		timetable.setScreeningday(screeningday);
		timetable.setStarttime(starttime);
		timetable.setTheaterno(theaterno);
		timetable.setMovie_seq(movie_seq);
		timetable.setTimeno(timeno);
		System.out.println("입력"+timetable);
		AdminDAO dao = new AdminDAO();
		if (dao.adminSelectOneTimetable(timetable)==null) {
			dao.adminInsertTimes(timetable);
			System.out.println("저장"+timetable);
		}else{
			dao.adminUpdateTimes(timetable);
			System.out.println("업데이트"+timetable);
		}
		return SUCCESS;
	}
	//해당날짜의 영화시간 조회
	public String adminSelectTimetable() throws Exception {
		AdminDAO dao = new AdminDAO();
		timetableList = new ArrayList<Timetable>();
		timetableList = dao.adminSelectTimetable(screeningday);
		System.out.println(timetableList);
		return SUCCESS;
	}
	
	
	
	public List<Timetable> getTimetableList() {
		return timetableList;
	}
	public void setTimetableList(List<Timetable> timetableList) {
		this.timetableList = timetableList;
	}
	public int getTimeno() {
		return timeno;
	}
	public void setTimeno(int timeno) {
		this.timeno = timeno;
	}
	public String getScreeningday() {
		return screeningday;
	}
	public void setScreeningday(String screeningday) {
		this.screeningday = screeningday;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public int getTheaterno() {
		return theaterno;
	}
	public void setTheaterno(int theaterno) {
		this.theaterno = theaterno;
	}
	public int getMovie_seq() {
		return movie_seq;
	}
	public void setMovie_seq(int movie_seq) {
		this.movie_seq = movie_seq;
	}
	public Movie getMovie() {
		return movie;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public List<Movie> getMovieList() {
		return movieList;
	}
	public void setMovieList(List<Movie> movieList) {
		this.movieList = movieList;
	}
	
}
