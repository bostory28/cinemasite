package hkc.main;



import hkc.movielist.ReserveVO;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

public class MainAction extends ActionSupport {

	private MainDAO maindao;
	private MovieVO movievo;
	private List<MovieVO> movieList;
	private ReserveVO reservevo;
	private List<ReserveVO> reserveList;
	
	public String mainView() throws Exception{
		maindao=new MainDAO();
		movieList=maindao.getMovieList();
		reserveList=maindao.getReserveList();

		MovieVO temp=null;
		if(movieList!=null&&reserveList!=null){
			for(int i=0; i<reserveList.size(); i++){
				for(int j=0; j<movieList.size(); j++){
					if(movieList.get(j).getTitle().equals(reserveList.get(i).getTitle())){
						temp=movieList.get(i);
						movieList.set(i,movieList.get(j));
						movieList.remove(j);
						movieList.add(temp);
					}
				}
			}
		}
		return SUCCESS;
	}

	public MainDAO getMaindao() {
		return maindao;
	}

	public void setMaindao(MainDAO maindao) {
		this.maindao = maindao;
	}

	public MovieVO getMovievo() {
		return movievo;
	}

	public void setMovievo(MovieVO movievo) {
		this.movievo = movievo;
	}

	public List<MovieVO> getMovieList() {
		return movieList;
	}

	public void setMovieList(List<MovieVO> movieList) {
		this.movieList = movieList;
	}

	public ReserveVO getReservevo() {
		return reservevo;
	}

	public void setReservevo(ReserveVO reservevo) {
		this.reservevo = reservevo;
	}

	public List<ReserveVO> getReserveList() {
		return reserveList;
	}

	public void setReserveList(List<ReserveVO> reserveList) {
		this.reserveList = reserveList;
	}

	
}
