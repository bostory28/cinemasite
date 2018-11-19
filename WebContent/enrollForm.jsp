<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>
<!-- �ڹٽ�ũ��Ʈ -->
<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
<script type="text/javascript">

	/* ��ȿ���˻� */
	function formCheck() {
		var id = document.getElementById("id");
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
		
		if (id.value.length < 1) {
			alert('���̵� �Է��Ͻÿ�.');
			id.focus();
			id.select();
			return false;
		}
		if (password.value.length < 3) {
			alert('��й�ȣ�� 3�ڸ� �̻� �Է��Ͻÿ�.');
			password.focus();
			password.select();
			return false;
		}
		if (name.value.length < 1) {
			alert('������ �Է��Ͻÿ�.');
			name.focus();
			name.select();
			return false;
		}
		
		if(birthday_first.value.length<1){
			alert('������ �Է��Ͻÿ�.');
			birthday_first.focus();
			birthday_first.select();
			return false;
		}
		}
		if (phone_second.value.length < 1) {
			alert('����ó�� �Է��Ͻÿ�.');
			phone_second.focus();
			phone_second.select();
			return false;
		}
		if (phone_third.value.length < 1) {
			alert('����ó�� �Է��Ͻÿ�.');
			phone_third.focus();
			phone_third.select();
			return false;
		}
		if (email_first.value.length < 1&&email.first.value.length>4) {
			alert('������ ��Ȯ�� �����Ͽ� �ּ���.');
			email_first.focus();
			email_first.select();
			return false;
		}
		if (email_second.value.length < 1) {
			alert('�̸����� �Է��Ͻÿ�.');
			engine.focus();
			return false;
		}
		/* ���� ��üȭ ���� �ϳ��� ��ġ�� ��� */
		phone.value = phone_first.value + "-" + phone_second.value + "-" + phone_third.value;
		phone.setAttribute("name", "membervo.phone");
		/* email�� �ϳ��� ��ġ�� ���� */
		email.value = email_first.value + "@" + email_second.value;
		email.setAttribute("name", "membervo.email");
		/* ������ �ϳ��� ��ġ�� ��� */
		birthday.value = birthday_first.value+"."+birthday_second.value+"."+birthday_third.value;
		birthday.setAttribute("name", "membervo.birthday")
		
	/* �н����尡 ������ ���� ������ ã�´�. */
	function isSamePassword() {
		var password = document.getElementById("password");
		var password_cfm = document.getElementById("password_cfm");
		
		if (password.value != password_cfm.value) {
			alert('��й�ȣ�� ���� �ʽ��ϴ�.');
			password_cfm.value = "";
			password.value = "";
			password.focus();
			password.select();
			return false;
		}
	}
	
	
	/* id�ߺ��� üũ�Ѵ�. */
	function idCheck() {
		var id = document.getElementById("id");
		var password = document.getElementById("password");
		$.ajax({
			url:'idCheck.action',
			type:'post',
			dataType:'json',
			data:{id:id.value},
			success:function(data) {
				if (data.canUseId == false) {
					alert('�̹� ���Ե� ���̵� �Դϴ�.');
					id.focus();
					id.select();
					return;
				}
				else {
					alert('����� �� �ִ� ���̵� �Դϴ�.');
					password.focus();
				}
			}
		});
		
		/* ��ȭ��ȣ�� �ߺ��� üũ�Ѵ�. */
		function phoneCheck() {
			var phone = document.getElementById("phone");
			var password = document.getElementById("password");
			$.ajax({
				url:'phoneCheck.action',
				type:'post',
				dataType:'json',
				data:{phone:phone.value},
				success:function(data) {
					if (data.canUseId == false) {
						alert('�̹� ���Ե� ��ȣ �Դϴ�.');
						id.focus();
						id.select();
						return;
					}
					else {
						alert('����� �� �ִ� ��ȣ �Դϴ�.');
						password.focus();
					}
				}
			});
	}	
</script>
</head>
<body>
	<div
		style="font-size: 45px; font-weight: bold; font-family: fantasy; color: crimson">ȸ������</div>
	<p style="vertical-align: sub; font-size: 14px">��Ȯ�ϰ� ������ �ּ���</p>
	<s:form name="enrollform" action="enrollment" method="post"
		theme="simple" onsubmit="return formCheck();">
		<table style="margin: 20px 20px 20px 20px;">
			<tr>
				<td class="title">���̵�
				<td class="content"><s:textfield name="membervo.id" id="id" />
					<input type="button" id="idcheck_btn" value="�ߺ�Ȯ��"
					style="font-size: 16px; font-weight: bold;"
					onclick="javascript:idCheck()">
			</tr>
			<tr>
				<td class="title">��й�ȣ
				<td class="content"><s:password name="membervo.password"
						id="password" />
			</tr>
			<tr>
				<td class="title">��й�ȣȮ��
				<td class="content"><s:password id="password_cfm"
						onblur="return isSamePassword();" />
			</tr>
			<tr>
				<td class="title">�������
				<td class="content"><input type="hidden" id="email"> <s:textfield
						id="birthday_first" size="5px" />. <select id="birthday_second"
					style="font-size: 20px;">
						<option>1
						<option>2
						<option>3
						<option>4
						<option>5
						<option>6
						<option>7
						<option>8
						<option>9
						<option>10
						<option>11
						<option>12
				</select>. <select id="birthday_third" style="font-size: 20px;">
						<option>1
						<option>2
						<option>3
						<option>4
						<option>5
						<option>6
						<option>7
						<option>8
						<option>9
						<option>10
						<option>11
						<option>12
						<option>13
						<option>14
						<option>15
						<option>16
						<option>17
						<option>18
						<option>19
						<option>20
						<option>21
						<option>22
						<option>23
						<option>24
						<option>25
						<option>26
						<option>27
						<option>28
						<option>29
						<option>30
						<option>31
				</select>
			</tr>
			<tr>
				<td class="title">����
				<td class="content"><input type="hidden" id="sex"> <input
					type="radio" value="��" checked="checked"><input
					type="radio" value="��">
			</tr>
			<tr>
				<td class="title">����ó
				<td class="content"><input type="hidden" id="phone"> <select
					id="phone_first" style="font-size: 20px;">
						<option>010
						<option>011
						<option>019
				</select>- <s:textfield id="phone_second" size="5px" />- <s:textfield
						id="phone_third" size="5px" />
			</tr>
			<tr>
				<td class="title">�̸���
				<td class="content"><input type="hidden" id="email"> <s:textfield
						id="email_first" size="8px" />@ <s:textfield id="email_second"
						size="10px" readonly="true" />
			</tr>
		</table>
		<div align="right" style="margin-top: 20px;">
			<s:submit value="����" />
			<s:reset value="�ٽþ���" />
		</div>
	</s:form>
</body>
</html>