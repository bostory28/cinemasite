<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정</title>
<!--  글꼴 설정 -->
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	* {
	font-family : 'Nanum Gothic';
	}
</style>
</style>
<!-- 자바스크립트 -->
<script type="text/javascript" src="../../js/jquery-1.11.2.js"></script>
<script type="text/javascript">

	/* 유효성검사 */
	function formCheck() {
		var userid = document.getElementById("userid");
		var password = document.getElementById("password");
		var password_cfm = document.getElementById("password_cfm");
		var name = document.getElementById("name");
		var sex = document.getElementById("sex");
		var phone = document.getElementById("phone");
		var phone_first = document.getElementById("phone_first");
		var phone_second = document.getElementById("phone_second");
		var phone_third = document.getElementById("phone_third");
		var email = document.getElementById("email");
		var email_first = document.getElementById("email_first");
		var email_second = document.getElementById("email_second");
		
		
		if (password.value.length < 3) {
			alert('비밀번호를 3자리 이상 입력하시오.');
			password.focus();
			password.select();
			return false;
		}
		if (name.value.length < 1) {
			alert('성명을 입력하시오.');
			name.focus();
			name.select();
			return false;
		}
		
		
		if (phone_second.value.length < 1) {
			alert('연락처를 입력하시오.');
			phone_second.focus();
			phone_second.select();
			return false;
		}
		if (phone_third.value.length < 1) {
			alert('연락처를 입력하시오.');
			phone_third.focus();
			phone_third.select();
			return false;
		}
		if (email_first.value.length < 1&&email.first.value.length>4) {
			alert('생년을 정확히 기재하여 주세요.');
			email_first.focus();
			email_first.select();
			return false;
		}
		if (email_second.value.length < 1) {
			alert('이메일을 입력하시오.');
			engine.focus();
			return false;
		}
		/* 폰을 객체화 위해 하나로 합치는 기능 */
		phone.value = phone_first.value + "-" + phone_second.value + "-" + phone_third.value;
		phone.setAttribute("name", "membervo.phone");
		/* email을 하나로 합치기 위해 */
		email.value = email_first.value + "@" + email_second.value;
		email.setAttribute("name", "membervo.email");
		
	
	if (!confirm('수정하시겠습니까?')) {
		return false;
	}
	return true;
	}
	/* 패스워드가 같은지 같지 않은지 찾는다. */
	function isSamePassword() {
		var password = document.getElementById("password");
		var password_cfm = document.getElementById("password_cfm");
		
		if (password.value != password_cfm.value) {
			alert('비밀번호가 같지 않습니다.');
			password_cfm.value = "";
			password.value = "";
			password.focus();
			password.select();
			return false;
		}
	}
	
	
	
		/* 전화번호를 중복을 체크한다. */
		function checkPhone() {
			var phone = document.getElementById("phone");
			var password = document.getElementById("password");
			$.ajax({
				url:'checkPhone.action',
				type:'post',
				dataType:'json',
				data:{phone:phone.value},
				success:function(data) {
					if (data.usablePhone == false) {
						alert('이미 가입된 번호 입니다.');
						id.focus();
						id.select();
						return;
					}
					else {
						alert('사용할 수 있는 번호 입니다.');
						password.focus();
					}
				}
			});
		}
		
</script>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
	<br>
	<table align="center">
		<tr>
			<td>

				<div
					style="font-size: 45px; font-weight: bold; font-family: 'Nanum Gothic'; color: crimson; float: left;">회원정보수정</div>
				<br>
				<p align="left" style="vertical-align: sub; font-size: 14px">정확하게
					기재해 주세요</p> <s:form name="modifyMemberform" action="modifyMember" method="post"
					theme="simple" onsubmit="return formCheck();">
					<div style="background-color: #f3dcb3; font-family: 'Nanum Gothic';">
						<span style="line-height: 1%;"><br></span>
						<table style="margin: 30px 20px 20px 20px;">
							<tr>
								<td class="title">아이디
								<td class="content"><s:textfield name="membervo.userid" id="id"
										value="%{membervo.userid }" readonly="true" />
							</tr>
							<tr>
								<td class="title">이름
								<td class="content"><s:textfield name="membervo.name" id="name" value="%{membervo.name }" />
							</tr>
							<tr>
								<td class="title">비밀번호
								<td class="content"><s:password name="membervo.password"
										id="password" />
							</tr>
							<tr>
								<td class="title">비밀번호확인
								<td class="content"><s:password id="password_cfm"
										onblur="return isSamePassword();" />
							</tr>
							<tr>
								<td class="title">생년월일
								<td class="content"><input type="hidden"
									id="%{membervo.birthday}"> <s:textfield
										id="birthday_first" size="5px" value="%{birthday_split[0] }"
										readonly="true" />. <s:textfield id="birthday_second"
										size="5px" value="%{birthday_split[1] }" readonly="true" />.
									<s:textfield id="birthday_third" size="5px"
										value="%{birthday_split[2] }" readonly="true" />
							</tr>
							<tr>
								<td class="title">성별
								<td class="content"><input type="hidden"  id="sex">
									<s:if test="%{membervo.sex == '남자'}">
										<input type="radio" name="membervo.sex" value="남자" checked="checked">남자
									<input type="radio" name="membervo.sex" value="여자">여자
										</s:if> <s:if test="%{membervo.sex == '여자'}">
										<input type="radio" name="sex" value="남자">남자
									<input type="radio" name="sex" value="여자" checked="checked">여자
										</s:if>
							</tr>
							<tr>
								<td class="title">연락처
								<td class="content"><input type="hidden" id="phone"
									value="%{membervo.phone }"> <select id="phone_first"
									style="font-size: 14px; font-family: 'Nanum Gothic';">
										<s:if test="%{phone_split[0] == '010'}">
											<option selected="selected">010
											<option>011
											<option>019
										</s:if>
										<s:if test="%{phone_split[0] == '011'}">
											<option>010
											<option selected="selected">011
											<option>019
										</s:if>
										<s:if test="%{phone_split[0] == '019'}">
											<option>010
											<option>011
											<option selected="selected">019
										</s:if>
								</select>- <s:textfield id="phone_second" size="5px"
										value="%{phone_split[1] }" />- <s:textfield id="phone_third"
										size="5px" value="%{phone_split[2] }" /> <input type="button"
									id="checkPhone_btn" value="중복확인"
									style="font-size: 14px; font-weight: bold;font-family: 'Nanum Gothic';"
									onclick="javascript:checkPhone()">
							</tr>
							<tr>
								<td class="title">이메일
								<td class="content"><input type="hidden" id="email"
									value="%{membervo.email }"> <s:textfield
										id="email_first" size="8px" value="%{email_split[0] }" />@ <s:textfield
										id="email_second" size="10px" value="%{email_split[1] }" />
							</tr>
						</table>
						<span style="line-height: 1%;"><br></span>
					</div>
					<div align="right" style="margin-top: 20px;">
						<s:submit style="font-family: 'Nanum Gothic';" value="수정" />
						<s:reset style="font-family: 'Nanum Gothic';"  value="다시쓰기" />
					</div>
				</s:form>
			</td>
		</tr>
	</table>
		<br>
	<br>
		<br>
	<br>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>