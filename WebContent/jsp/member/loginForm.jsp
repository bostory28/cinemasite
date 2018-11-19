<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 자바스크립트 -->
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
<jsp:include page="../include/header.jsp"/>
<br>
<br>
	<br>
	<br>
	<br>
	<br>
	<br>
<br>
<br>
<div class="container marketing">

<table align="center">
<tr>
<td>
	<div style="width: 400px; border-radius:10px; padding-top:10px; background-color:white; margin-left: 5px;"  align="center">
	<h3>로그인</h3><br>
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
		<div align="center" style="font-size: 12px; font-family: 'Nanum Gothic';">아직도 회원이 아니세요? <a href="enrollForm.action"> 회원가입</a>
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
	<br>
<br>
</div>
<div><jsp:include page="../include/footer.jsp"/>
</div>