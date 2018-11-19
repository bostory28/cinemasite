<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화매출통계</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	* {
		font-family : 'Nanum Gothic';
	}
	#trtitle td {
	
		height: 50px; border-bottom: 5px solid #818181;
		border-top: 5px solid #818181; background-color: #D6D6D6;
		border-right: 3px solid #939393;
	}
	#trtotal td {
		 height: 50px; border-bottom: 5px solid #818181;
		 border-top: 5px solid #818181; background-color: #D6D6D6;
		 border-right: 3px solid #939393;
	}
	#trcontent td {
		height: 30px;
		border-right: 3px solid #939393; border-bottom: 3px solid #939393;
	}
</style>
<script type="text/javascript" src="../js/jquery-1.11.2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//선택한 년도와 종류
		var sortSelected = '';
		var yearSelected = '';
		
		//5년의 날짜 출력
		var yearAll = $('.year');
		var year = new Date().getFullYear() - 5;
		for (var i = 0; i < yearAll.length; i++) {
			yearAll[i].innerHTML = year+'년';
			if (year == new Date().getFullYear()) {
				yearAll[i].setAttribute('selected', 'selected');
			}
			year++;
		}
		
		//처음 실행 됐을 때 나오는 table
		$('#saleTable').html(function() {
			outputMoviePart();
		});
		
		//년도를 변경 시
		$('#yearSelect').change(function() {
			sortSelected = $('#sortSelect').val();
			yearSelected =  $('#yearSelect').val();
			if (sortSelected == '영화별') {
				outputMoviePart();
			} else if (sortSelected == '월별') {
				outputMonthPart();
			}
		});
		//종류변경 시
		$('#sortSelect').change(function() {
			sortSelected = $('#sortSelect').val();
			yearSelected =  $('#yearSelect').val();
			if (sortSelected == '영화별') {
				outputMoviePart();
			} else if (sortSelected == '월별') {
				outputMonthPart();
			}
		});
		
		/* 영화별 순이익 */
		function outputMoviePart() {
			sortSelected = $('#sortSelect').val();
			yearSelected =  $('#yearSelect').val();
			var str = '<tr id="trtitle"><td>영화제목<td>10대<br><small>(명)</small><td>20대<br><small>(명)</small><td>30대<br><small>(명)</small><td>40대<br><small>(명)</small><td>50대<br><small>(명)</small><td>60대<br><small>(명)</small><td>남<br><small>(명)</small><td>여<br><small>(명)</small><td>총관람수<br><small>(명)</small><td>총매출<br><small>(원)</small><td style="border-right: 0">순이익<br><small>(원)</small></tr>';
			var teen = 0;	var twenty = 0;		var thirty = 0;		var forty = 0;
			var fifty = 0;	var sixty = 0;		var man = 0;		var woman = 0;
			var totalPeopleCntOfMovieSeen = 0;	var totalSaleOfMovie = 0;
			var netProfit = 0;
			$.ajax({
				url:'profitMovieView.action',
				type:'post',
				dataType:'json',
				data:{sortSelected:sortSelected, yearSelected:yearSelected},
				success:function(data) {
					$.each(data.list_movie, function(index, value) {
						str += '<tr id="trcontent"><td>'+ value.title +'<td>'+ commaNum(value.teen) +'<td>'+ commaNum(value.twenty) +'<td>'+ commaNum(value.thirty) +'<td>'+ commaNum(value.forty) +'<td>'+ commaNum(value.fifty) +'<td>'+ commaNum(value.sixty) +'<td>'+ commaNum(value.man) +'<td>'+ commaNum(value.woman) +'<td>'+ commaNum(value.totalPeopleCntOfMovieSeen) +'<td>'+ commaNum(value.totalSaleOfMovie) +'<td style="border-right: 0">'+ commaNum(value.netProfit) +'</tr>';
						teen += value.teen;		twenty += value.twenty;		thirty += value.thirty;			forty += value.forty;		fifty += value.fifty;	
						sixty += value.sixty;	man += value.man;			woman += value.woman;			totalPeopleCntOfMovieSeen += value.totalPeopleCntOfMovieSeen;	
						totalSaleOfMovie += value.totalSaleOfMovie;			netProfit += value.netProfit;	
					});
					str += '<tr id="trtotal"><td>총계<td>'+ commaNum(teen) +'<td>'+ commaNum(twenty) +'<td>'+ commaNum(thirty) +'<td>'+ commaNum(forty) +'<td>'+ commaNum(fifty) +'<td>'+ commaNum(sixty) +'<td>'+ commaNum(man) +'<td>'+ commaNum(woman) +'<td>'+ commaNum(totalPeopleCntOfMovieSeen) +'<td>'+ commaNum(totalSaleOfMovie) +'<td style="border-right: 0">'+ commaNum(netProfit) +'</tr>';
					$('#saleTable').html(str);
				}
			});
		}
		/* 월별 순이익 */
		function outputMonthPart() {
			sortSelected = $('#sortSelect').val();
			yearSelected =  $('#yearSelect').val();
			var str = '<tr id="trtitle"><td>월<td>월관람수<br><small>(명)</small><td>월별총매출<br><small>(원)</small><td style="border-right: 0">월별순이익<br><small>(원)</small></tr>';
			var monPeopleNum = 0;	var saleOfMonth = 0;	var netProfitOfMonth = 0;
			$.ajax({
				url:'profitMonthView.action',
				type:'post',
				dataType:'json',
				data:{sortSelected:sortSelected, yearSelected:yearSelected},
				success:function(data) {
					$.each(data.list_month, function(index, value) {
						str += '<tr id="trcontent"><td>'+ value.mon +'<td>'+ commaNum(value.countPeopleOfmonth) +'<td>'+ commaNum(value.totalSaleOfMonth) +'<td style="border-right: 0">'+ commaNum(value.netPrifotOfMonth) +'</tr>';
						monPeopleNum += value.countPeopleOfmonth;		saleOfMonth += value.totalSaleOfMonth;	netProfitOfMonth += value.netPrifotOfMonth;	
					});
					str += '<tr id="trtotal"><td>총계<td>'+ commaNum(monPeopleNum) +'<td>'+ commaNum(saleOfMonth) +'<td style="border-right: 0">'+ commaNum(netProfitOfMonth) + '</tr>';
					$('#saleTable').html(str);
				}
			});
		}
	});
	
	//1000단위 컴마를 찍는다.
	function commaNum(num) {  
	    var len, point, str, isMinus;  
	
	    num = num + ""; 
	    if (num.substring(0, 1) == '-') {
	    	isMinus = true;
	    	num = num.substring(1, num.length);
	    }
	    point = num.length % 3  
	    len = num.length;  
	
	    str = num.substring(0, point);  
	    while (point < len) {  
	        if (str != "") str += ",";  
	        str += num.substring(point, point + 3);  
	        point += 3;  
	    }  
	    if (isMinus == true) {
	    	str = '-' + str;
	    }
	    return str;  
	}
</script>
</head>
<!--***** 헤더 인클루딩 *****-->
<jsp:include page="../../include/header.jsp"/>
<!--***** 헤더 인클루딩 *****-->
	<div style="width: 100%; text-align: center;">
		<div style="width: 1024px; text-align: center; margin: 0 auto;">
			<table style="width: 1024px; text-align: center; margin: 0 auto;">
				<tr>
					<td style="text-align: left; font-size: 30px; height: 50px;">
					영화매출통계
				</tr>
				<tr>
					<td style="text-align: right;">
					<select id="yearSelect">
						<s:iterator begin="0" end="6" status="statu">
							<option class="year">
						</s:iterator>
					</select>
					<select id="sortSelect">
						<option>영화별
						<option>월별
					</select>
				</tr>
			</table>
			
			<table id="saleTable" style="width: 1024px; text-align: center; margin: 0 auto; border-collapse: collapse;">
			</table>
			<br>
		</div>
	</div>
	
<!--***** 푸터 인클루딩 *****-->
<jsp:include page="../../include/footer.jsp"/>
<!--***** 푸터 인클루딩 *****-->
</body>
</html>