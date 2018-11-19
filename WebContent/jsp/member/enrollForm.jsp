<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 자바스크립트 -->
<script type="text/javascript">

	/* 유효성검사 */
	function formCheck() {
		var userid = document.getElementById("userid");
		var password = document.getElementById("password");
		var password_cfm = document.getElementById("password_cfm");
		var name = document.getElementById("name");
		var birthday = document.getElementById("birthday")
		var birthday_first = document.getElementById("birthday_first");
		var birthday_second = document.getElementById("birthday_second");
		var birthday_third = document.getElementById("birthday_third");
		var sex = document.getElementById("sex");
		var phone = document.getElementById("phone");
		var phone_first = document.getElementById("phone_first");
		var phone_second = document.getElementById("phone_second");
		var phone_third = document.getElementById("phone_third");
		var email = document.getElementById("email");
		var email_first = document.getElementById("email_first");
		var email_second = document.getElementById("email_second");
		
		

		
		if (userid.value.length < 1) {
			alert('아이디를 입력하시오.');
			userid.focus();
			userid.select();
			return false;
		}
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
		
		if(birthday_first.value.length<1){
			alert('생년을 입력하시오.');
			birthday_first.focus();
			birthday_first.select();
			return false;
		}
		if (isNaN(phone_second.value)) {
			alert('연락처를 숫자로 입력하시오.');
			phone_second.focus();
			phone_second.select();
			return false;
		} 
		if (phone_second.value.length < 1) {
			alert('연락처를 입력하시오.');
			phone_second.focus();
			phone_second.select();
			return false;
		}
		if (isNaN(phone_third.value)) {
			alert('연락처를 숫자로 입력하시오.');
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
			alert('이메일을 입력해 주세요.');
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
		/* 생일을 하나로 합치는 기능 */
		birthday.value = birthday_first.value+"."+birthday_second.value+"."+birthday_third.value;
		birthday.setAttribute("name", "membervo.birthday")
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
	
	
	/* id중복을 체크한다. */
	function checkId() {
		var userid = document.getElementById("userid");
		var password = document.getElementById("password");
		$.ajax({
			url:'checkId.action',
			type:'post',
			dataType:'json',
			data:{userid:userid.value},
			success:function(data) {
				if (data.usableId == false) {
					alert('이미 가입된 아이디 입니다.');
					id.focus();
					id.select();
					return;
				}
				else {
					alert('사용할 수 있는 아이디 입니다.');
					password.focus();
				}
			}
		});
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
<style type="text/css">
.membertitle{
	padding-bottom: 20px;
}
.membercontent{
	padding-bottom: 20px;
	padding-left: 20px;
}
</style>
<jsp:include page="../include/header.jsp"/>
<div class="container marketing">
	<br>
	<table align="center" style="width: 1024px;">
		<tr>
			<td>
			<h3>회원정보수정</h3><br>
				<p style="vertical-align: sub; font-size: 14px ; font-family: 'Nanum Gothic'; color:#DC2727;">*정확하게 기재해 주세요</p> 
				<s:form	name="enrollform" action="enrollMember" method="post"	theme="simple" onsubmit="return formCheck();">
					<div style="background-color: #FFF; font-family: 'Nanum Gothic';" align="center">
						<span style="line-height: 1%;"><br></span>
						<table style="margin: 30px 20px 20px 20px;font-family: 'Nanum Gothic'">
							<tr>
							
								<td class="membertitle">아이디
								<td class="membercontent">
								<s:textfield name="membervo.userid" id="userid" placeholder="아이디" /> 
								<input type="button" id="checkId_btn" value="중복확인"style="font-size: 14px; font-weight: bold; font-family: 'Nanum Gothic'"
									onclick="javascript:checkId()">
							</tr>
							<tr>
								<td class="membertitle">비밀번호
								<td class="membercontent"><s:password name="membervo.password" id="password" />
							</tr>
							<tr>
								<td class="membertitle">비밀번호확인
								<td class="membercontent"><s:password id="password_cfm"
										onblur="return isSamePassword();" />
							</tr>
							<tr>
								<td class="membertitle">이름
								<td class="membercontent"><s:textfield name="membervo.name" id="name" placeholder="이름" />
							</tr>
							<tr>
								<td class="membertitle">생년월일
								<td class="membercontent"><input type="hidden" id="birthday">
									<s:textfield id="birthday_first" size="5px" placeholder="생년" />.
									<select id="birthday_second" style="font-size: 15px; font-family: 'Nanum Gothic'">
										<option value="1">1
										<option value="2">2
										<option value="3">3
										<option value="4">4
										<option value="5">5
										<option value="6">6
										<option value="7">7
										<option value="8">8
										<option value="9">9
										<option value="10">10
										<option value="11">11
										<option value="12">12
								</select>. <select id="birthday_third" style="font-size: 15px;">
										<option value="1">1
										<option value="2">2
										<option value="3">3
										<option value="4">4
										<option value="5">5
										<option value="6">6
										<option value="7">7
										<option value="8">8
										<option value="9">9
										<option value="10">10
										<option value="11">11
										<option value="12">12
										<option value="13">13
										<option value="14">14
										<option value="15">15
										<option value="16">16
										<option value="17">17
										<option value="18">18
										<option value="19">19
										<option value="20">20
										<option value="21">21
										<option value="22">22
										<option value="23">23
										<option value="24">24
										<option value="25">25
										<option value="26">26
										<option value="27">27
										<option value="28">28
										<option value="29">29
										<option value="30">30
										<option value="31">31
								</select>
							</tr>
							<tr>
								<td class="membertitle">성별
								<td class="membercontent"><input type="hidden" id="sex">
									<input type="radio" name="membervo.sex" value="남자" checked="checked">남자
									<input type="radio" name="membervo.sex" value="여자">여자
							</tr>
							<tr>
								<td class="membertitle">연락처
								<td class="membercontent"><input type="hidden" id="phone">
									<select id="phone_first" style="font-size: 15px;">
										<option>010
										<option>011
										<option>019
								</select>- <s:textfield id="phone_second" size="5px" />- <s:textfield
										id="phone_third" size="5px" /> <input type="button"
									id="checkPhone_btn" value="중복확인"
									style="font-size: 14px; font-weight: bold;font-family: 'Nanum Gothic'"
									onclick="javascript:checkPhone()">
							</tr>
							<tr>
								<td class="membertitle">이메일
								<td class="membercontent"><input type="hidden" id="email">
									<s:textfield id="email_first" size="8px" />@ <s:textfield
										id="email_second" size="8px" />
							</tr>
						</table>
						<span style="line-height: 1%;"><br></span>
					</div>
					<div align="right" style="margin-top: 20px;">
						<s:submit value="가입" style="font-family: 'Nanum Gothic'"/>
						<s:reset value="다시쓰기" style="font-family: 'Nanum Gothic'"/>
					</div>
				</s:form>
	</table>
	<br>
<br>
<br>
<br>
</div>
<div>
	<jsp:include page="../include/footer.jsp"/>
</div>