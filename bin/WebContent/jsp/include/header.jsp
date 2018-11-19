<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/include/header.css">
<!--  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/include/reset.css">-->

<div id="header_wrap">
 <header id="header">
	<div id="h_title" class="h_title">
		<a href="<%=request.getContextPath()%>/index"><img src="<%=request.getContextPath()%>/picture/main/mainlogo1.png"></a>
	</div>
	<nav>
		<ul  id="h_inb" class="h_inb">		
			<!--***** 로그인 세션 처리하는 부분, EL에 객체와 프로퍼티 이름을 기재하면 됨 *****-->	
			<c:choose>
				<c:when test="${empty LoginId}">
					<li><a href="<%=request.getContextPath()%>/member/loginForm.action">로그인</a></li>
					<li><a href="<%=request.getContextPath()%>/member/enrollForm.action">회원가입</a></li>
				</c:when>
				<c:when test="${LoginId != 'admin'}">
					<li>${LoginId }님 환영합니다. <a href="<%=request.getContextPath()%>/member/logout.action">로그아웃</a></li>	
					<li>	<a href="<%=request.getContextPath()%>/member/goMyPageForm.action">마이페이지</a></li>
				</c:when>
				<c:otherwise>
					<li>관리자 ${LoginId}님 환영합니다.<a href="<%=request.getContextPath()%>/adminTimetable.action">영화시간관리</a></li> 	
					<li>	<a href="<%=request.getContextPath()%>/member/logout.action">로그아웃</a></li>
					<li>	<a href="<%=request.getContextPath()%>/member/goMyPageForm.action">마이페이지</a></li>
				</c:otherwise>
			</c:choose>
			<!--***** 로그인 세션 처리하는 부분, EL에 객체와 프로퍼티 이름을 기재하면 됨 *****-->	
		</ul>
	</nav>
	<nav>
		<ul id="h_gnb" class="h_gnb">
			<!--***** 주요 메뉴 *****-->
			<li><a href="<%=request.getContextPath()%>/movielist/movielist.action">영화</a></li>
			<li><a href="<%=request.getContextPath()%>/time/goTimetable.action">예매</a></li>
			<li><a href="<%=request.getContextPath()%>/time/goTimetableList.action">시간표</a></li>
			<!--***** 주요 메뉴 *****-->
		</ul>
	</nav>
 </header>
 </div>
