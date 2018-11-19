<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제완료</title>
<style type="text/css">
	@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	* {
		font-family : 'Nanum Gothic';
	}
</style>
<script type="text/javascript" src="../js/jquery-1.11.2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		window.onkeydown = function() {
			var kcode = event.keyCode;
			if(kcode == 8 || kcode == 116) {
				alert('페이지가 만료되었습니다.');
				document.location.href = '../index.action';
				return;
			}
		}
		
		$.ajax({
			url:'reserveResult.action',
			type:'post',
			dataType:'json',
			data:$('#reserveForm').serialize(),
			contentType:'application/x-www-form-urlencoded; charset=UTF-8',	
			success:outputTable
		});
		
		function outputTable(data) {
			var table = '<table style="font-size: 20px; border-collapse: collapse;">';
			table += '<tr style="font-weight:bold;"><td style="height: 50px;">예매번호<td>영화<td>시간<td>상영관<td>예매수(좌석)<td>결제방법<td>결제금액</tr>'
			table += '<tr><td style="height: 80px; border-top: 3px solid #bcbcbc;">'+ data.reservevo.reservationno +'<td style="width: 200px; border-top: 3px solid #bcbcbc;"">'+ data.reservevo.title +'<td style="width: 80px; border-top: 3px solid #bcbcbc;"">'+ data.reservevo.starttime +'<td style="width: 100px; border-top: 3px solid #bcbcbc;"">제'+ data.reservevo.theaterno +'상영관<td style="width: 250px; border-top: 3px solid #bcbcbc;"">'+ data.reservevo.peoplenum +'매<br><span style="font-size: 15px;">('+ data.seatnostr +')</span>';
			if (data.reservevo.optionpay == 'card') {
				table += '<td style="width: 100px; border-top: 3px solid #bcbcbc;">카드결제';
			} else if (data.reservevo.optionpay == 'phone') {
				table += '<td style="width: 100px; border-top: 3px solid #bcbcbc;">핸드폰결제';
			}
			table += '<td style="width: 100px; border-top: 3px solid #bcbcbc;">'+ commaNum(data.reservevo.price) +'원</tr>';
			table += '</table>';
			$('#table').html(table);
		}
		//1000단위 컴마를 찍는다.
		function commaNum(num) {  
		    var len, point, str;  
		
		    num = num + "";  
		    point = num.length % 3  
		    len = num.length;  
		
		    str = num.substring(0, point);  
		    while (point < len) {  
		        if (str != "") str += ",";  
		        str += num.substring(point, point + 3);  
		        point += 3;  
		    }  
		    return str;  
		}
	});
</script>
</head>
<body>
<!--***** 헤더 인클루딩 *****-->
<jsp:include page="../include/header.jsp"/>
<!--***** 헤더 인클루딩기타포 *****-->
<br>
	<div style="width: 100%; text-align: center;">
		<div style="width: 1024px; font-size: 30px; font-weight: bold; margin: 0 auto;">
			<div style="text-align: left;">예매완료</div>
			<div><br></div>
			<div style="border: 5px solid #A6A6A6; margin: 0 auto; border-radius:10px; width: 1024px; text-align: center; padding-top: 50px; padding-bottom: 50px;">
				<span style="font-size: 50px;"><b style="color: red;">결제</b>가 완료되었습니다.</span><br>
				<span style="font-size: 20px;">HKC를 이용해 주셔서 감사합니다. 아래 예매내역을 확인해 주세요.</span>
			</div>
		</div>
		<br><br>
		<div style="width: 1024px; margin: 0 auto;">
			<div style="text-align: left; font-size: 30px; font-weight: bold;">
				예매확인
			</div><div><br></div>
			<div id="table" style="border: 5px solid #A6A6A6; border-radius:10px; width: 1024px;"></div>
		</div>
	</div>
	
	<br><br>
	<form id="reserveForm">
		<input type="hidden" name="reservevo.timetable_seq" value="<s:property value="reservevo.timetable_seq"/>">
		<input type="hidden" name="reservevo.reservationno" value="<s:property value="reservevo.reservationno"/>">
	</form>
<!--***** 푸터 인클루딩 *****-->
<jsp:include page="../include/footer.jsp"/>
<!--***** 푸터 인클루딩 *****-->
</body>
</html>