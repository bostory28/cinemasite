package hkc.detail;
import java.util.List;



import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import hkc.vo.Movie;
import hkc.vo.Review;

import com.opensymphony.xwork2.ActionSupport;

public class DetailAction extends ActionSupport implements SessionAware  {
	Review review;			//Reveiw타입의 review변수 선언
	String content;			//String 타입의 content변수 선언(한줄평)
	Movie movie;
	int star;
	int movie_seq, review_seq;
	List<Review> reviewList;
	Map<String , Object> session;
	String userid;
	int mansReserve;
	int womansReserve;
	float moviePoint;
	int teensReserve;
	int twentiesReserve;
	int thirtiesReserve;
	int fortiesReserve;
	public String detailPage() throws Exception{
		return SUCCESS;		//Success 리턴!
		
	}
	public String comment() throws Exception{
		review = new Review();				//review 변수의 생성자
		review.setContent(content);			//댓글 내용요소
		review.setStar(star);					//별점요소
		userid = (String) session.get("LoginId");
		review.setUserid(userid);				//사용자 아이디
		review.setMovie_seq(movie_seq);				//영화 고유번호
		DetailDAO dao = new DetailDAO();	//DAO의 메서드를 사용하기 위한 dao객체 선언
		dao.commentDAO(review);				//dao객체의 commentDAO메서드 호출 ( 입력값 : review 객체)
		//System.out.println(star);
		reviewList = dao.getComment(review.getMovie_seq());
		return SUCCESS;							//SUCCESS 리턴!
	}
	
	public String getComment() throws Exception{
		DetailDAO dao = new DetailDAO();
		userid = (String) session.get("LoginId");
		reviewList = dao.getComment(movie_seq);
		System.out.println(reviewList);
		return SUCCESS;
	}

	public String showDetail() throws Exception{
		DetailDAO dao = new DetailDAO();
		userid = (String) session.get("LoginId");
		movie=dao.getMovie(movie_seq);
		movie.setOpeningday(movie.getOpeningday().substring(0, 10));
		reviewList = dao.getComment(movie_seq);
		mansReserve = dao.getMansReserveCount(movie_seq);
		womansReserve = dao.getWomansReserveCount(movie_seq);
		moviePoint = (float)dao.getMoviePointAvg(movie_seq);
		teensReserve = dao.getTeensReserveCount(movie_seq);
		twentiesReserve = dao.getTwentiesReserveCount(movie_seq);
		thirtiesReserve = dao.getThirtiesReserveCount(movie_seq);
		fortiesReserve = dao.getFortiesReserveCount(movie_seq);
		return SUCCESS;
	}
	
	public String deleteComment() throws Exception{
		DetailDAO dao = new DetailDAO();
		userid = (String) session.get("LoginId");
		dao.deleteComment(review_seq);
		reviewList = dao.getComment(movie_seq);
		return SUCCESS;
	}
	
	public String reComment() throws Exception{
		System.out.println("액션접속");		//함수 실행시 액션접속 메세지
		review = new Review();				//review 변수의 생성자
		review.setContent(content);			//댓글 내용요소
		review.setStar(star);
		review.setReview_seq(review_seq);//별점요소
		userid = (String) session.get("LoginId");
		review.setUserid(userid);				//사용자 아이디
		review.setMovie_seq(movie_seq);				//영화 고유번호
		DetailDAO dao = new DetailDAO();	//DAO의 메서드를 사용하기 위한 dao객체 선언
		dao.reCommentDAO(review);				//dao객체의 commentDAO메서드 호출 ( 입력값 : review 객체)
		//System.out.println(star);
		reviewList = dao.getComment(review.getMovie_seq());
		System.out.println("코멘트출력"+reviewList);
		return SUCCESS;
	}
	

	
	
	public int getTeensReserve() {
		return teensReserve;
	}
	public void setTeensReserve(int teensReserve) {
		this.teensReserve = teensReserve;
	}
	public int getTwentiesReserve() {
		return twentiesReserve;
	}
	public void setTwentiesReserve(int twentiesReserve) {
		this.twentiesReserve = twentiesReserve;
	}
	public int getThirtiesReserve() {
		return thirtiesReserve;
	}
	public void setThirtiesReserve(int thirtiesReserve) {
		this.thirtiesReserve = thirtiesReserve;
	}
	public int getFortiesReserve() {
		return fortiesReserve;
	}
	public void setFortiesReserve(int fortiesReserve) {
		this.fortiesReserve = fortiesReserve;
	}
	public float getMoviePoint() {
		return moviePoint;
	}
	public void setMoviePoint(float moviePoint) {
		this.moviePoint = moviePoint;
	}
	public int getMansReserve() {
		return mansReserve;
	}
	public void setMansReserve(int mansReserve) {
		this.mansReserve = mansReserve;
	}
	public int getWomansReserve() {
		return womansReserve;
	}
	public void setWomansReserve(int womansReserve) {
		this.womansReserve = womansReserve;
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
	public Review getReview() {
		return review;
	}

	public void setReview(Review review) {
		this.review = review;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public List<Review> getReviewList() {
		return reviewList;
	}

	public void setReviewList(List<Review> reviewList) {
		this.reviewList = reviewList;
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
	public int getReview_seq() {
		return review_seq;
	}
	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
		
	}
	
}
