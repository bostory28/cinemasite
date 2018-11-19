package hkc.vo;

public class Review {
	
	//댓글 번호
	private int review_seq;
	// 영화seq
	private int movie_seq;
	// 댓글내용
	private String content;
	// 별의 개수
	private int star;
	// 로그인한 아이디
	private String userid;
	// 리플을 작성한 시간
	private String reviewdate;
	public Review(int review_seq, int movie_seq, String content, int star,
			String userid, String reviewdate) {
		super();
		this.review_seq = review_seq;
		this.movie_seq = movie_seq;
		this.content = content;
		this.star = star;
		this.userid = userid;
		this.reviewdate = reviewdate;
	}
	public Review() {
	}
	public int getReview_seq() {
		return review_seq;
	}
	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
	}
	public int getMovie_seq() {
		return movie_seq;
	}
	public void setMovie_seq(int movie_seq) {
		this.movie_seq = movie_seq;
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
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getReviewdate() {
		return reviewdate;
	}
	public void setReviewdate(String reviewdate) {
		this.reviewdate = reviewdate;
	}
	@Override
	public String toString() {
		return "Review [review_seq=" + review_seq + ", movie_seq=" + movie_seq
				+ ", content=" + content + ", star=" + star + ", userid="
				+ userid + ", reviewdate=" + reviewdate + "]";
	}
	
	
}
