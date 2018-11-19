package hkc.main;

public class PreviewVO {
	private int premovie_seq;
	private String youtubelink;
	private String preposter;
	private String pagelink;
	public int getPremovie_seq() {
		return premovie_seq;
	}
	public void setPremovie_seq(int premovie_seq) {
		this.premovie_seq = premovie_seq;
	}
	public String getYoutubelink() {
		return youtubelink;
	}
	public void setYoutubelink(String youtubelink) {
		this.youtubelink = youtubelink;
	}
	public String getPreposter() {
		return preposter;
	}
	public void setPreposter(String preposter) {
		this.preposter = preposter;
	}
	public String getPagelink() {
		return pagelink;
	}
	public void setPagelink(String pagelink) {
		this.pagelink = pagelink;
	}
	@Override
	public String toString() {
		return "PreviewVO [premovie_seq=" + premovie_seq + ", youtubelink="
				+ youtubelink + ", preposter=" + preposter + ", pagelink="
				+ pagelink + "]";
	}
	
	
}
