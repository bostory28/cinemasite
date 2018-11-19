<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/include/main.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/include/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/include/mainheader.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/main/jquery.bxslider.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/main/jquery-ui-1.10.4.custom.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/main/jquery.cookie.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath()%>/js/main/visual.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/main/symantic.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/main/swipe.js"></script>
<title>HKC - welcome page</title>
</head>
<body>
<!--***** 헤더 인클루딩 *****-->
<jsp:include page="../include/header.jsp"/>
<!--***** 헤더 인클루딩 *****-->
<div id="content_wrap">
		<div id="content">
			<div id="bxSilder">
				<div class="c_article1">
					<div id="visual">
						<div id="mySwipe" class="swipe">
							<ul class="touch_banner swipe-wrap">
								<!--탑 영화 스틸샷 모음 클릭하면 해당 페이지로 -->		
								<c:choose>
								<c:when test="${empty movieList}">
									영화등록 요망
								</c:when>
								<c:otherwise>
									<s:iterator value="movieList" status="stat" begin="0" end="0">
										<s:if test="movieList[#stat.index]">
											<li><a href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index].movie_seq"/>"><img src="<%=request.getContextPath()%>/picture/poster/<s:property value="movieList[#stat.index].stillshot"/>" width="1024" height="350"></a></li>
										</s:if>
										<s:if test="movieList[#stat.index+1]">
											<li><a href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index+1].movie_seq"/>"><img src="<%=request.getContextPath()%>/picture/poster/<s:property value="movieList[#stat.index+1].stillshot"/>" width="1024" height="350"></a></li>
										</s:if>
										<s:if test="movieList[#stat.index+2]">
											<li><a href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index+2].movie_seq"/>"><img src="<%=request.getContextPath()%>/picture/poster/<s:property value="movieList[#stat.index+2].stillshot"/>" width="1024" height="350"></a></li>
										</s:if>
									</s:iterator>	
								</c:otherwise>
								</c:choose>
								<!-- 탑 영화 스틸샷 모음 클릭하면 해당 페이지로 -->
							</ul>
						</div>
					
						<p class="touch_left_btn">
						<a href="#"><img src="<%=request.getContextPath()%>/picture/main/visual_btn_left.png"></a>
						</p>
						<p class="touch_right_btn">
							<a href="#"><img src="<%=request.getContextPath()%>/picture/main/visual_btn_right.png"></a>
						</p>
					</div>
				</div>
		</div>
		<ul id="c_section">
				<li id="section_title"><img src="<%=request.getContextPath()%>/picture/main/event_title1.png"></li>
				<li id="section_content">
					<ul id="detail_content">
						<!-- 선호 영화 3선 게재 -->
						<c:choose>
								<c:when test="${empty movieList}">
									영화등록 요망
								</c:when>
						<c:otherwise>
						<s:iterator value="movieList" status="stat" begin="0" end="0">
							<s:if test="movieList[#stat.index]">
								<li>
									<div id="detail_box"><img src="<%=request.getContextPath()%>/picture/main/star1.png" id="star" width="100px" height="100px">
									<a href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index].movie_seq"/>"><img src="<%=request.getContextPath()%>/picture/poster/<s:property value="movieList[#stat.index].poster"/>" width="185" height="260" ><br>
									<s:property value="movieList[#stat.index].title"/></a><br>
									<s:if test="reserveList[#stat.index]">
										예매율:<s:property value="reserveList[#stat.index].ratio"/>% 
									</s:if>
									<s:else>
										예매율:0.0% 
									</s:else>		
									별점:<s:property value="movieList[#stat.index].starratio"/><br>
									<s:if test="movieList[#stat.index].dday > 0">
										개봉예정:<s:date name="movieList[#stat.index].openingday" format="yyy-MM-dd"/>
										<a href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index].movie_seq"/>" id="dday">D-<s:property value="movieList[#stat.index].dday"/></a>
									</s:if>
									<s:else>
										개봉일:<s:date name="movieList[#stat.index].openingday" format="yyy-MM-dd"/>
									</s:else>
									</div>
								</li>
							</s:if>
							<s:if test="movieList[#stat.index+1]">
								<li>
									<div id="detail_box">
										<img src="<%=request.getContextPath()%>/picture/main/star2.png" id="star" width="100px" height="100px">
										<a href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index+1].movie_seq"/>"><img src="<%=request.getContextPath()%>/picture/poster/<s:property value="movieList[#stat.index+1].poster"/>" width="185" height="260" ><br>
										<s:property value="movieList[#stat.index+1].title"/></a><br> 
										<s:if test="reserveList[#stat.index+1]">
											예매율:<s:property value="reserveList[#stat.index+1].ratio"/>% 
										</s:if>
										<s:else>
											예매율:0.0% 
										</s:else>		
										별점:<s:property value="movieList[#stat.index+1].starratio"/><br>
										<s:if test="movieList[#stat.index+1].dday > 0">
											개봉예정:<s:date name="movieList[#stat.index+1].openingday" format="yyy-MM-dd"/>
											<a href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index+1].movie_seq"/>" id="dday">D-<s:property value="movieList[#stat.index+1].dday"/></a>
										</s:if>
										<s:else>
											개봉일:<s:date name="movieList[#stat.index+1].openingday" format="yyy-MM-dd"/>
										</s:else>
									</div>
								</li>
							</s:if>
							<s:if test="movieList[#stat.index+2]">
								<li>
									<div id="detail_box">
										<img src="<%=request.getContextPath()%>/picture/main/star3.png" id="star" width="100px" height="100px">
										<a href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index+2].movie_seq"/>"><img src="<%=request.getContextPath()%>/picture/poster/<s:property value="movieList[#stat.index+2].poster"/>" width="185" height="260" ><br>
										<s:property value="movieList[#stat.index+2].title"/></a><br> 
										<s:if test="reserveList[#stat.index+2]">
											예매율:<s:property value="reserveList[#stat.index+2].ratio"/>% 
										</s:if>
										<s:else>
											예매율:0.0% 
										</s:else>		
										별점:<s:property value="movieList[#stat.index+2].starratio"/><br>
										<s:if test="movieList[#stat.index+2].dday > 0">
											개봉예정:<s:date name="movieList[#stat.index+2].openingday" format="yyy-MM-dd"/>
											<a href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index+2].movie_seq"/>" id="dday">D-<s:property value="movieList[#stat.index+2].dday"/></a>
										</s:if>
										<s:else>
											개봉일:<s:date name="movieList[#stat.index+2].openingday" format="yyy-MM-dd"/>
										</s:else>
									</div>
								</li>
							</s:if>
						</s:iterator>
						</c:otherwise>
						</c:choose>
						<!-- 선호 영화 3선 게재 -->
					</ul>
				</li>
		</ul>
		<ul id="c_section">
				<li id="section_title"><img src="<%=request.getContextPath()%>/picture/main/event_title2.png"></li>
				<li id="section_content">
					<ul id="detail_content">
					<!-- 커밍순 영화 게재 -->
						<li><iframe width="700" height="458" src="https://www.youtube.com/embed/NSXx85xnw0o" frameborder="0" allowfullscreen></iframe></li>
						<li><a href="http://movie.naver.com/movie/bi/mi/basic.nhn?code=98438" target="_blank"><img src="<%=request.getContextPath()%>/picture/poster/avengers2015_preview.png" width="324" height="458"></a></li>
					<!-- 커밍순 영화 게재 -->
					</ul>
				</li>
		</ul>
		<ul id="c_section">
				<li id="section_title"><img src="<%=request.getContextPath()%>/picture/main/event_title3.png"></li>
				<li id="section_content">
					<ul id="detail_content">
					<!-- 뽀대용 의미없는 사진 -->
						<li><img src="<%=request.getContextPath()%>/picture/main/decoration.png"></li>
					<!-- 뽀대용 의미없는 사진 -->
					</ul>
				</li>
		</ul>
	</div>
</div>
<!--***** 푸터 인클루딩 *****-->
<jsp:include page="../include/footer.jsp"/>
<!--***** 푸터 인클루딩 *****-->
</body>
</html>