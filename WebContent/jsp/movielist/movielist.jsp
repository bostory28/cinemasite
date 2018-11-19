<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="../include/header.jsp"/>
<!-- Three columns of text below the carousel -->
<div class="container marketing">
<h3>현재 상영 영화 / 상영 예정 영화</h3>
<br>
<div align="center" style="width:100%;padding-left: 50px;">
	<div class="row">
	<s:iterator value="movieList" status="stat" begin="0" end="0">
	<s:if test="movieList[#stat.index]">
	  <div class="col-lg-4">
	 	<a href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index].movie_seq"/>">
	    <img class="poster" src="<%=request.getContextPath()%>/picture/poster/<s:property value="movieList[#stat.index].poster"/>" data-src="holder.js/140x140" alt="140x140" style="width: 160px; height: 225px;">
	    </a>
	    <h3><s:property value="movieList[#stat.index].title"/></h3>
	    <p><s:if test="reserveList[#stat.index]">
	    		예매율 1위 : <s:property value="reserveList[#stat.index].ratio"/>% 
			</s:if>
			<s:else>
			예매율 : 0.0% 
			</s:else><br>
			별점 : <s:property value="movieList[#stat.index].starratio"/><br>
			<s:if test="movieList[#stat.index].dday > 0">
				개봉예정 : <s:date name="movieList[#stat.index].openingday" format="yyy-MM-dd"/>
				<a href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index].movie_seq"/>" id="dday">D-<s:property value="movieList[#stat.index].dday"/></a>
			</s:if>
			<s:else>
				개봉일 : <s:date name="movieList[#stat.index].openingday" format="yyy-MM-dd"/>
			</s:else>
		<br></p>
	    <p><a class="btn btn-default" href="<%=request.getContextPath()%>/time/goTimetable.action?movie_seq=<s:property value="movieList[#stat.index].movie_seq"/>">예매하기</a></p>
	  </div><!-- /.col-lg-4 -->
	</s:if>
	<s:if test="movieList[#stat.index+1]">
	  <div class="col-lg-4">
	    <a href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index+1].movie_seq"/>">
	    <img class="poster" src="<%=request.getContextPath()%>/picture/poster/<s:property value="movieList[#stat.index+1].poster"/>" data-src="holder.js/140x140" alt="140x140" style="width: 160px; height: 225px;">
	    </a>
	    <h3><s:property value="movieList[#stat.index+1].title"/></h3>
	    <p><s:if test="reserveList[#stat.index+1]">
	    		예매율 2위 : <s:property value="reserveList[#stat.index+1].ratio"/>% 
			</s:if>
			<s:else>
			예매율 : 0.0% 
			</s:else><br>
			별점 : <s:property value="movieList[#stat.index+1].starratio"/><br>
			<s:if test="movieList[#stat.index+1].dday > 0">
				개봉예정 : <s:date name="movieList[#stat.index+1].openingday" format="yyy-MM-dd"/>
				<a href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index+1].movie_seq"/>" id="dday">D-<s:property value="movieList[#stat.index+1].dday"/></a>
			</s:if>
			<s:else>
				개봉일 : <s:date name="movieList[#stat.index+1].openingday" format="yyy-MM-dd"/>
			</s:else>
		<br></p>
	    <p><a class="btn btn-default" href="<%=request.getContextPath()%>/time/goTimetable.action?movie_seq=<s:property value="movieList[#stat.index+1].movie_seq"/>">예매하기</a></p>
	  </div><!-- /.col-lg-4 -->
	</s:if>
	<s:if test="movieList[#stat.index+2]">
	  <div class="col-lg-4">
	    <a href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index+2].movie_seq"/>">
	    <img class="poster" src="<%=request.getContextPath()%>/picture/poster/<s:property value="movieList[#stat.index+2].poster"/>" data-src="holder.js/140x140" alt="140x140" style="width: 160px; height: 225px;">
	    </a>
	    <h3><s:property value="movieList[#stat.index+2].title"/></h3>
	    <p><s:if test="reserveList[#stat.index+2]">
	    		예매율 3위 : <s:property value="reserveList[#stat.index+2].ratio"/>% 
			</s:if>
			<s:else>
			예매율 : 0.0% 
			</s:else><br>
			별점 : <s:property value="movieList[#stat.index+2].starratio"/><br>
			<s:if test="movieList[#stat.index+2].dday > 0">
				개봉예정 : <s:date name="movieList[#stat.index+2].openingday" format="yyy-MM-dd"/>
				<a href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index+2].movie_seq"/>" id="dday">D-<s:property value="movieList[#stat.index+2].dday"/></a>
			</s:if>
			<s:else>
				개봉일 : <s:date name="movieList[#stat.index+2].openingday" format="yyy-MM-dd"/>
			</s:else>
		<br></p>
	    <p><a class="btn btn-default" href="<%=request.getContextPath()%>/time/goTimetable.action?movie_seq=<s:property value="movieList[#stat.index+2].movie_seq"/>">예매하기</a></p>
	  </div><!-- /.col-lg-4 -->
	</s:if>
	</s:iterator>
	</div><!-- /.row -->
	<div class="row">
		<s:iterator value="movieList" status="stat">
			<s:if test="movieList[#stat.index+3]">
				<div class="col-lg-4">
			 	<a href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index+3].movie_seq"/>">
			    <img class="poster" src="<%=request.getContextPath()%>/picture/poster/<s:property value="movieList[#stat.index+3].poster"/>" data-src="holder.js/140x140" alt="140x140" style="width: 160px; height: 225px;">
			    </a>
			    <h3><s:property value="movieList[#stat.index+3].title"/></h3>
			    <p><s:if test="reserveList[#stat.index+3]">
			    		예매율 : <s:property value="reserveList[#stat.index+3].ratio"/>% 
					</s:if>
					<s:else>
					예매율 : 0.0% 
					</s:else><br>
					별점 : <s:property value="movieList[#stat.index+3].starratio"/><br>
					<s:if test="movieList[#stat.index+3].dday > 0">
						개봉예정 : <s:date name="movieList[#stat.index+3].openingday" format="yyy-MM-dd"/>
						<a href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index+3].movie_seq"/>" id="dday">D-<s:property value="movieList[#stat.index+3].dday"/></a>
					</s:if>
					<s:else>
						개봉일 : <s:date name="movieList[#stat.index+3].openingday" format="yyy-MM-dd"/>
					</s:else>
				<br></p>
			    <p><a class="btn btn-default" href="<%=request.getContextPath()%>/time/goTimetable.action?movie_seq=<s:property value="movieList[#stat.index+3].movie_seq"/>">예매하기</a></p>
			  </div><!-- /.col-lg-4 -->
			</s:if>
		</s:iterator>
	</div>
	</div>
</div>
<jsp:include page="../include/footer.jsp"/>
