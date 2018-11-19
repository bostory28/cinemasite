package hkc.movielist;

import hkc.main.MovieVO;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

public class MovieListAction extends ActionSupport{
	
	private MovieListDAO movielistdao=null;
	private MovieVO movievo=null;
	private List<MovieVO> movieList=null;
	private ReserveVO reservevo;
	private List<ReserveVO> reserveList;
	private String title=null;

	public String movielistView() throws Exception{
		movielistdao=new MovieListDAO();
		movieList=movielistdao.getMovieList();
		reserveList=movielistdao.getReserveList();
		MovieVO temp=null;
		if(reserveList!=null){
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
	
	public String movieDetailView() throws Exception{
		System.out.println(title);
		movielistdao=new MovieListDAO();
		movievo=movielistdao.getMovieDetail(title);
		return SUCCESS;
	}

	public MovieListDAO getMovielistdao() {
		return movielistdao;
	}

	public void setMovielistdao(MovieListDAO movielistdao) {
		this.movielistdao = movielistdao;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	

}
