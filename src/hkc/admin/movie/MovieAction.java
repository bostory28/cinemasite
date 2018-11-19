package hkc.admin.movie;

import hkc.vo.Movie;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

public class MovieAction extends ActionSupport implements ServletRequestAware{
	List<Movie> list_movie;
	String year;
	String yearSelected;
	int movie_seq;
	Movie movieVo;
	
	File upload_stillshot;
	String upload_stillshotContentType;
	String upload_stillshotFileName;
	File upload_poster;
	String upload_posterContentType;
	String upload_posterFileName;
	
	File saveFile;
	//String UploadPosterPath = "C:/ProjectHome/workspace/HKC_Kissco_01/WebContent/picture/poster/";
	//String UploadStillshotPath = "C:/ProjectHome/workspace/HKC_Kissco_01/WebContent/picture/poster/";
	HttpServletRequest httpServletRequest;
	
	/*첫화면 올해의 년도기준으로 영화리스트를 출력*/
	public String movieAdminView() throws Exception {
		MovieDAO movieDao = new MovieDAO();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		year = sdf.format(date);
		list_movie = movieDao.getMovieList(year);
		return SUCCESS;
	}
	/*년도를 선택햇을 때 영화리스트를 변경함*/
	public String movieSelectedYear() throws Exception {
		MovieDAO movieDao = new MovieDAO();
		yearSelected = yearSelected.substring(0,  4);
		list_movie = movieDao.getMovieList(yearSelected);
		return SUCCESS;
	}
	/*영화를 선택햇을 때 영화의 정보를 가져온다.*/
	public String readOneOfMovie() throws Exception {
		MovieDAO movieDao = new MovieDAO();
		movieVo = movieDao.readOneOfMovie(movie_seq);
		return SUCCESS;
	}
	
	public String modifyMovie() throws Exception {
		String UploadPosterPath = httpServletRequest.getServletContext().getRealPath("/picture/poster/");
		String UploadStillshotPath = httpServletRequest.getServletContext().getRealPath("/picture/poster/");
		MovieDAO movieDao = new MovieDAO();
		if (upload_poster != null && upload_poster.exists()) {
			saveFile = new File(UploadPosterPath+"/"+upload_posterFileName);
			FileUtils.copyFile(upload_poster, saveFile);
			movieVo.setPoster(upload_posterFileName);
		}
		if (upload_stillshot != null && upload_stillshot.exists()) {
			saveFile = new File(UploadStillshotPath+"/"+upload_stillshotFileName);
			FileUtils.copyFile(upload_stillshot, saveFile);
			movieVo.setStillshot(upload_stillshotFileName);
		}
		System.out.println(movieVo);
		movieDao.modifyMovie(movieVo);
		
		movieAdminView();
		return SUCCESS;
	}
	/*영화를 삭제한다.*/
	public String deleteMovie() throws Exception {
		MovieDAO movieDao = new MovieDAO();
		movieDao.deleteMovie(movie_seq);
		
		movieAdminView();
		return SUCCESS;
	}
	/*영화를 등록한다.*/
	public String insertMovie() throws Exception {
		MovieDAO movieDao = new MovieDAO();
		String UploadPosterPath = httpServletRequest.getServletContext().getRealPath("/picture/poster/");
		String UploadStillshotPath = httpServletRequest.getServletContext().getRealPath("/picture/poster/");
		if (upload_poster != null && upload_poster.exists()) {
			saveFile = new File(UploadPosterPath+"/"+upload_posterFileName);
			FileUtils.copyFile(upload_poster, saveFile);
			movieVo.setPoster(upload_posterFileName);
		}
		if (upload_stillshot != null && upload_stillshot.exists()) {
			saveFile = new File(UploadStillshotPath+"/"+upload_stillshotFileName);
			FileUtils.copyFile(upload_stillshot, saveFile);
			movieVo.setStillshot(upload_stillshotFileName);
		}
		System.out.println(movieVo);
		movieDao.insertMovie(movieVo);
		
		movieAdminView();
		return SUCCESS;
	}
	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public List<Movie> getList_movie() {
		return list_movie;
	}

	public void setList_movie(List<Movie> list_movie) {
		this.list_movie = list_movie;
	}

	public String getYearSelected() {
		return yearSelected;
	}

	public void setYearSelected(String yearSelected) {
		this.yearSelected = yearSelected;
	}
	public int getMovie_seq() {
		return movie_seq;
	}
	public void setMovie_seq(int movie_seq) {
		this.movie_seq = movie_seq;
	}
	public Movie getMovieVo() {
		return movieVo;
	}
	public void setMovieVo(Movie movieVo) {
		this.movieVo = movieVo;
	}
	public File getUpload_stillshot() {
		return upload_stillshot;
	}
	public void setUpload_stillshot(File upload_stillshot) {
		this.upload_stillshot = upload_stillshot;
	}
	public String getUpload_stillshotContentType() {
		return upload_stillshotContentType;
	}
	public void setUpload_stillshotContentType(String upload_stillshotContentType) {
		this.upload_stillshotContentType = upload_stillshotContentType;
	}
	public String getUpload_stillshotFileName() {
		return upload_stillshotFileName;
	}
	public void setUpload_stillshotFileName(String upload_stillshotFileName) {
		this.upload_stillshotFileName = upload_stillshotFileName;
	}
	public File getUpload_poster() {
		return upload_poster;
	}
	public void setUpload_poster(File upload_poster) {
		this.upload_poster = upload_poster;
	}
	public String getUpload_posterContentType() {
		return upload_posterContentType;
	}
	public void setUpload_posterContentType(String upload_posterContentType) {
		this.upload_posterContentType = upload_posterContentType;
	}
	public String getUpload_posterFileName() {
		return upload_posterFileName;
	}
	public void setUpload_posterFileName(String upload_posterFileName) {
		this.upload_posterFileName = upload_posterFileName;
	}
	@Override
	public void setServletRequest(HttpServletRequest httpServletRequest) {
		this.httpServletRequest = httpServletRequest;
	}
	
}
