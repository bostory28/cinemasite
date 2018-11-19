<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jqueryui/bootstrap-theme.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jqueryui/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jqueryui/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jqueryui/bootstrap.min.css">
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/include/main.css"> --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/include/header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jqueryui/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jqueryui/jquery-ui.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jqueryui/jquery-ui.structure.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jqueryui/jquery-ui.structure.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jqueryui/jquery-ui.theme.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jqueryui/jquery-ui.theme.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jqueryui/carousel.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/movielist/movielist.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/sample/timetable.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/sample/default.css">
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
<script src="//code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/main/jquery.bxslider.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/main/jquery-ui-1.10.4.custom.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/main/jquery.cookie.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath()%>/js/main/visual.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/main/symantic.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/main/swipe.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/holder.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/showtimes.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/commons.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/time.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/highcharts.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/highcharts-3d.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/exporting.js"></script>
<title>HKC</title>
</head>
<body>
<div class="navbar-wrapper">
	<div class="container">
	    <div  id="h_inb" class="h_inb" align="right">		
			<!--***** 로그인 세션 처리하는 부분, EL에 객체와 프로퍼티 이름을 기재하면 됨 *****-->	
			<c:choose>
				<c:when test="${empty LoginId}">
					<span class="h_inb"><a href="<%=request.getContextPath()%>/member/loginForm.action">로그인</a></span>
					<span class="h_inb"><a href="<%=request.getContextPath()%>/member/enrollForm.action">회원가입</a></span>
				</c:when>
				<c:when test="${LoginId != 'admin'}">
					<span class="h_inb" style="color:#DC2727;">${LoginId }님 환영합니다. <a href="<%=request.getContextPath()%>/member/logout.action">로그아웃</a>	</span>
					<span class="h_inb"><a href="<%=request.getContextPath()%>/member/goMyPageForm.action">마이페이지</a></span>
				</c:when>
				<c:otherwise>
					<span class="h_inb" style="color:#DC2727;">	관리자 ${LoginId}님 환영합니다.	</span>
					<span class="h_inb"><a href="<%=request.getContextPath()%>/member/logout.action">로그아웃</a></span>
					<span class="h_inb"><a href="<%=request.getContextPath()%>/member/goMyPageForm.action">마이페이지</a></span>
				</c:otherwise>
			</c:choose>
			<!--***** 로그인 세션 처리하는 부분, EL에 객체와 프로퍼티 이름을 기재하면 됨 *****-->	
		</div>
	  <div class="navbar navbar-inverse navbar-static-top">
	    <div class="container">
	      <div class="navbar-header">
	        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
	          <span class="icon-bar"></span>
	          <span class="icon-bar"></span>
	          <span class="icon-bar"></span>
	        </button>
	        <a class="navbar-brand" href="<%=request.getContextPath()%>/index">Hankook Kissco Cinema</a>
	      </div>
	      <div class="navbar-collapse collapse">
	        <ul class="nav navbar-nav">
	          <li class="active"><a href="<%=request.getContextPath()%>/index">Home</a></li>
	          <li><a href="<%=request.getContextPath()%>/movielist/movielist.action">영화</a></li>
	          <li><a href="<%=request.getContextPath()%>/time/goTimetable.action">예매</a></li>
	          <li><a href="<%=request.getContextPath()%>/time/goTimetableList.action">시간표</a></li>
	          <c:choose>
				<c:when test="${LoginId == 'admin'}">
		          <li class="dropdown">
	                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">관리자페이지 <b class="caret"></b></a>
	                  <ul class="dropdown-menu">
	                    <li><a href="<%=request.getContextPath()%>/movieAdmin/movieAdminView.action">영화등록관리</a></li>
	                    <li><a href="<%=request.getContextPath()%>/adminTimetable.action">영화시간관리</a></li>
	                    <li><a href="<%=request.getContextPath()%>/profit/profitView.action">영화매출관리</a> </li>
	                  </ul>
	                </li>
	                </c:when>
	          </c:choose>
	          </ul>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
   <script type="text/javascript">
   		$(document).ready(function(){
   			$('.dropdown-toggle').dropdown();
   		});
   </script>
    
<!-- <div id="header_wrap"> -->
<!--  <div id="header"> -->
<!-- 	<div id="h_title" class="h_title"> -->
<!-- 		<div id="logodiv"> -->
<%-- 			<a href="<%=request.getContextPath()%>/index"><img src="<%=request.getContextPath()%>/picture/main/logo.png"></a> --%>
<!-- 		</div> -->
<!-- 		<div  id="h_inb" class="h_inb">		 -->
<!-- 			<!--***** 로그인 세션 처리하는 부분, EL에 객체와 프로퍼티 이름을 기재하면 됨 *****--
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${empty LoginId}"> --%>
<%-- 					<span><a href="<%=request.getContextPath()%>/member/loginForm.action">로그인</a></span> --%>
<%-- 					<span><a href="<%=request.getContextPath()%>/member/enrollForm.action">회원가입</a></span> --%>
<%-- 				</c:when> --%>
<%-- 				<c:when test="${LoginId != 'admin'}"> --%>
<%-- 					<span>${LoginId }님 환영합니다. <a href="<%=request.getContextPath()%>/member/logout.action">로그아웃</a>	</span> --%>
<%-- 					<span><a href="<%=request.getContextPath()%>/member/goMyPageForm.action">마이페이지</a></span> --%>
<%-- 				</c:when> --%>
<%-- 				<c:otherwise> --%>
<%-- 					<span>	관리자 ${LoginId}님 환영합니다.<a href="<%=request.getContextPath()%>/adminTimetable.action">영화시간관리</a> 	</span> --%>
<%-- 					<span><a href="<%=request.getContextPath()%>/member/logout.action">로그아웃</a></span> --%>
<%-- 					<span><a href="<%=request.getContextPath()%>/member/goMyPageForm.action">마이페이지</a></span> --%>
<%-- 				</c:otherwise> --%>
<%-- 			</c:choose> --%>
<!-- 			<!--***** 로그인 세션 처리하는 부분, EL에 객체와 프로퍼티 이름을 기재하면 됨 *****-->
<!-- 		</div> -->
<!-- 		<div id="h_gnb" class="h_gnb"> -->
<!-- 			<!--***** 주요 메뉴 *****-->
<%-- 			<span class="h_gnb"><a href="<%=request.getContextPath()%>/movielist/movielist.action">영화</a></span> --%>
<%-- 			<span class="h_gnb"><a href="<%=request.getContextPath()%>/time/goTimetable.action">예매</a></span> --%>
<%-- 			<span class="h_gnb"><a href="<%=request.getContextPath()%>/time/goTimetableList.action">시간표</a></span> --%>
<!-- 			<!--***** 주요 메뉴 *****-->
<!-- 		</div> -->
<!-- 	</div> -->
<!--  </div> -->
<!--  </div> -->
