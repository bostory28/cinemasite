<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/movielist/movielist.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/include/reset.css">
<title>HKC - movie list</title>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<div id="content_wrap">
	<div id="content">
		<!-- 예매율 높은 영화 3선 게재 -->
		<ul id="c_section1">
				<li id="section_title"><img src="<%=request.getContextPath()%>/picture/main/event_title4.png"></li>
				<li id="section_content">
					<ul id="detail_content">
					<c:choose>
								<c:when test="${empty movieList}">
									영화등록 요망
								</c:when>
								<c:otherwise>
						<s:iterator value="movieList" status="stat" begin='0' end='0'>
							<s:if test="movieList[#stat.index]">
								<li>
									<div id="detail_box">
										<a href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index].movie_seq"/>">
										<img src="<%=request.getContextPath()%>/picture/poster/<s:property value="movieList[#stat.index].poster"/>" width="185" height="260" ><br>
										1위 - <s:property value="movieList[#stat.index].title"/></a><br>
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
									<a href="<%=request.getContextPath()%>/time/goTimetable.action?movie_seq=<s:property value="movieList[#stat.index].movie_seq"/>" class="Button">예매하기</a>
								</li>
							</s:if>
							<s:if test="movieList[#stat.index+1]">
								<li>
									<div id="detail_box">
										<a href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index+1].movie_seq"/>">
										<img src="<%=request.getContextPath()%>/picture/poster/<s:property value="movieList[#stat.index+1].poster"/>" width="185" height="260" ><br>
										2위 - <s:property value="movieList[#stat.index+1].title"/></a><br>
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
									<a href="<%=request.getContextPath()%>/time/goTimetable.action?movie_seq=<s:property value="movieList[#stat.index+1].movie_seq"/>" class="Button">예매하기</a>
								</li>
							</s:if>
							<s:if test="movieList[#stat.index+2]">
								<li>
									<div id="detail_box">
										<a href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index+2].movie_seq"/>">
										<img src="<%=request.getContextPath()%>/picture/poster/<s:property value="movieList[#stat.index+2].poster"/>" width="185" height="260" ><br>
										3위 - <s:property value="movieList[#stat.index+2].title"/></a><br>
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
									<a href="<%=request.getContextPath()%>/time/goTimetable.action?movie_seq=<s:property value="movieList[#stat.index+2].movie_seq"/>" class="Button">예매하기</a>
								</li>
							</s:if>
						</s:iterator>
						</c:otherwise>
						</c:choose>
					</ul>
				</li>
		</ul>
		<!-- 예매율 높은 영화 3선 게재 -->
		
		<!-- 나머지 영화 게재 -->
		<ul id="c_section2">
				<li id="section_content">
					<ul id="detail_content">
					<c:choose>
								<c:when test="${empty movieList}">
																	
								</c:when>
								<c:otherwise>
						<s:iterator value="movieList" status="stat">
							<s:if test="movieList[#stat.index+3]">
								<li>
									<div id="detail_box">
										<a href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index+3].movie_seq"/>"><img src="<%=request.getContextPath()%>/picture/poster/<s:property value="movieList[#stat.index+3].poster"/>" width="185" height="260" ><br>
										<s:property value="movieList[#stat.index+3].title"/></a><br>
										<s:if test="reserveList[#stat.index+3]">
											예매율:<s:property value="reserveList[#stat.index+3].ratio"/>%
										</s:if>
										<s:else>
											예매율:0.0%
										</s:else>										 
										별점:<s:property value="movieList[#stat.index+3].starratio"/><br>
										<s:if test="movieList[#stat.index+3].dday > 0">
											개봉예정:<s:date name="movieList[#stat.index+3].openingday" format="yyy-MM-dd"/>
											<a href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index+3].movie_seq"/>" id="dday">D-<s:property value="movieList[#stat.index+3].dday"/></a>
										</s:if>
										<s:else>
											개봉일:<s:date name="movieList[#stat.index+3].openingday" format="yyy-MM-dd"/>
										</s:else>
									</div>
									<a href="<%=request.getContextPath()%>/time/goTimetable.action?movie_seq=<s:property value="movieList[#stat.index+3].movie_seq"/>" class="Button">예매하기</a>
								</li>
							</s:if>
						</s:iterator>
						</c:otherwise>
						</c:choose>
					</ul>
				</li>
		</ul>
		<!-- 나머지 영화 게재 -->
		
	</div>
</div>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>