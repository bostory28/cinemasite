<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<!--  글꼴 설정 -->
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	* {
	font-family : 'Nanum Gothic';
	}
</style>
</style>
<!-- 자바스크립트 -->
<script type="text/javascript" src="../js/jquery-1.11.2.js"></script>
<script type="text/javascript">
	function isMember() {
		var id = document.getElementById("userid");
		var password = document.getElementById("password");
		$.ajax({
			url : 'login.action',
			type : 'post',
			dataType : 'json',
			data:$('#loginform').serialize(),
            contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(data) {
				if (data.membervo == null) {
					alert('아이디 또는 비밀번호가 잘못 되었습니다.');
					id.focus();
					id.select();
					return false;
				} else {
					window.location.href="../index.action";
				}

			}
		});
	}
</script>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<br>
<br>
	<br>
	<br>
	<br>
<br>
<br>
<br>
<table align="center">
<tr>
<td>
	<div style="border: 2px #e6e6fa solid; margin-left: 5px; float: left;">
		<div align="center"
			style="font-size: 45px; font-weight: bold; font-family: 'Nanum Gothic'; color: crimson" >로그인</div>
		<s:form id="loginform" method="post" theme="simple" onsubmit="return isMember();">
			<table width="326">
				<tr>
					<td class="title" align="left" width="70" height="30" style="font-weight: bold">ID
					<td class="content"><s:textfield name="membervo.userid" id="userid"/>
					<td rowspan="2">		<s:submit style="font-family: 'Nanum Gothic';" value="로그인" />
				</tr>
				<tr>
					<td class="title" align="left"  style="font-weight: bold">패스워드
					<td class="content"><s:password name="membervo.password" id="password"/>
				</tr>
			</table>
		</s:form>
		<br>
		<div align="center" style="font-size: 12px;font-style: italic; font-family: 'Nanum Gothic';">아직도 회원이 아니세요? <a href="enrollForm.action">회원가입</a>
		<br>
		<br>
	</div>
	</div>
</td>
</tr>
</table>
<br>
<br>
<br>
<br>
	<br>
<br>
<br>
<br>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>