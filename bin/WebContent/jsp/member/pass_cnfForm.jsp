<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보확인</title>
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
	function equalPass() {
		var id = document.getElementById("userid");
		var password = document.getElementById("password");
		$.ajax({
			url : 'pass_cnf.action',
			type : 'post',
			dataType : 'json',
			data:$('#pass_cnfForm').serialize(),
            contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(data) {
				if (data.membervo == null) {
					alert('비밀번호가 틀렸습니다.');
					password.focus();
					password.select();
					return false;
				} else {
					window.location.href="member/goModifyForm.action";
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
<table align="center">
<tr>
<td>
	<div style="width: 400px;border: 2px #e6e6fa solid; margin-left: 5px; float: left;">
		<div align="center"
			style="font-size: 45px; font-weight: bold; font-family: 'Nanum Gothic'; color: crimson">회원정보확인</div><br><br>
		<s:form id="pass_cnfForm" method="post" theme="simple" onsubmit="return equalPass();">
			<table align="center" width="350" style="font-family: 'Nanum Gothic';">
			<tr>
								<td class="title"  style="font-weight: bold">아이디
								<td class="content"><s:textfield name="membervo.userid" id="userid"
										value="%{membervo.userid }" readonly="true" />
							</tr>
			<tr>
					<td class="title" align="left"  style="font-weight: bold">패스워드
					<td class="content"><s:password name="membervo.password" id="password"/>
				</tr>
			</table>
			<br>
			<br>
			<div align="center"><s:submit style="font-family: 'Nanum Gothic';" value="내 정보수정" /></div>
		</s:form>
		<br>
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
<jsp:include page="../include/footer.jsp"/>
</body>
</html>