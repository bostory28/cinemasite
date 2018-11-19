<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>timetable</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/commons.js"></script>
<style type="text/css">
#page{
	width:100%;
}
#content{
	width:1024px;
}
.space{
	height:50px;
}
#content{
	width:1024px;
}
#day{
	width:100px;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		//시간 검사
		$("#time1_1").keyup(function() {
			test("time1_", "runningtime1");
		});
		$("#time2_1").keyup(function() {
			test("time2_", "runningtime2");
		});
		$("#time3_1").keyup(function() {
			test("time3_", "runningtime3");
		});
		$("#time4_1").keyup(function() {
			test("time4_", "runningtime4");
		});
		$("#time5_1").keyup(function() {
			test("time5_", "runningtime5");
		});
	});
	//검색창 오픈
	function searchMovie(){
		window.open("adminSearchMovieForm.action","영화검색창","top=100,left=500,width=500,height=600,resizable=no");
	}

</script>
</head>
<body>
<!--***** 헤더 인클루딩 *****-->
<jsp:include page="../include/header.jsp"/>
<!--***** 헤더 인클루딩 *****-->

<div id="page" align="center">
	<div id="content">
		<table border="1" align="center">
			<tr>
				<td>
					<div><table id="day"></table></div>
				</td>
				<td style="width:824px;" align="center">
					<div>
						<table border="0" style="height:750px;">
							<tr>
								<td colspan="2">
									<div id="date"></div>
								</td>
							</tr>
							<tr>
								<td style="width:104px;">
									1관
								</td>
								<td style="width:100px;">
									<s:textfield name="title1" id="title1" readOnly="true"  theme="simple" value=""/>
								</td>
								<td>
									<s:textfield id="title1Seq" readOnly="true" size="4" theme="simple" value="영화번호"/>
									<s:textfield id="runningtime1" readOnly="true" size="1" theme="simple" value=""/>분
									<a href="#" onclick="return check(1)"> 저장</a>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<input type="text" size="10" value="1회차" readOnly="true">
									<input type="text" size="10" value="2회차" readOnly="true">
									<input type="text" size="10" value="3회차" readOnly="true">
									<input type="text" size="10" value="4회차" readOnly="true">
									<input type="text" size="10" value="5회차" readOnly="true">
									<input type="text" size="10" value="6회차" readOnly="true">
									<input type="text" size="10" value="7회차" readOnly="true">
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<s:textfield name="time1_1" id="time1_1" size="10"  theme="simple" />
									<s:textfield name="time1_2" id="time1_2" size="10"  theme="simple"/>
									<s:textfield name="time1_3" id="time1_3" size="10"  theme="simple"/>
									<s:textfield name="time1_4" id="time1_4" size="10"  theme="simple"/>
									<s:textfield name="time1_5" id="time1_5" size="10"  theme="simple"/>
									<s:textfield name="time1_6" id="time1_6" size="10"  theme="simple"/>
									<s:textfield name="time1_7" id="time1_7" size="10"  theme="simple"/>
								</td>
							</tr>
							<tr class="space"></tr>
							<tr>
								<td style="width:104px;">
									2관
								</td>
								<td style="width:170px;">
									<s:textfield name="title2" id="title2" size="20" readOnly="true"  theme="simple" value=""/>
								</td>
								<td align="left">
									<s:textfield id="title2Seq" readOnly="true" size="4" theme="simple" value="영화번호"/>
									<s:textfield id="runningtime2" readOnly="true" size="1" theme="simple" value=""/>분
									<a href="#" onclick="return check(2)"> 저장</a>
<!-- 									<a href="#" onclick="searchMovie()">영화검색</a> -->
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<input type="text" size="10" value="1회차" readOnly="true">
									<input type="text" size="10" value="2회차" readOnly="true">
									<input type="text" size="10" value="3회차" readOnly="true">
									<input type="text" size="10" value="4회차" readOnly="true">
									<input type="text" size="10" value="5회차" readOnly="true">
									<input type="text" size="10" value="6회차" readOnly="true">
									<input type="text" size="10" value="7회차" readOnly="true">
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<s:textfield name="time2_1" id="time2_1" size="10"  theme="simple"/>
									<s:textfield name="time2_2" id="time2_2" size="10"  theme="simple"/>
									<s:textfield name="time2_3" id="time2_3" size="10"  theme="simple"/>
									<s:textfield name="time2_4" id="time2_4" size="10"  theme="simple"/>
									<s:textfield name="time2_5" id="time2_5" size="10"  theme="simple"/>
									<s:textfield name="time2_6" id="time2_6" size="10"  theme="simple"/>
									<s:textfield name="time2_7" id="time2_7" size="10"  theme="simple"/>
								</td>
							</tr>
							<tr class="space"></tr>
							<tr>
								<td style="width:104px;">
									3관
								</td>
								<td style="width:170px;">
									<s:textfield name="title3" id="title3" size="20" readOnly="true"  theme="simple" value=""/>
								</td>
								<td align="left">
									<s:textfield id="title3Seq" readOnly="true" size="4" theme="simple" value="영화번호"/>
									<s:textfield id="runningtime3" readOnly="true" size="1" theme="simple" value=""/>분
									<a href="#" onclick="return check(3)"> 저장</a>
<!-- 									<a href="#" onclick="searchMovie()">영화검색</a> -->
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<input type="text" size="10" value="1회차" readOnly="true">
									<input type="text" size="10" value="2회차" readOnly="true">
									<input type="text" size="10" value="3회차" readOnly="true">
									<input type="text" size="10" value="4회차" readOnly="true">
									<input type="text" size="10" value="5회차" readOnly="true">
									<input type="text" size="10" value="6회차" readOnly="true">
									<input type="text" size="10" value="7회차" readOnly="true">
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<s:textfield name="time3_1" id="time3_1" size="10"  theme="simple"/>
									<s:textfield name="time3_2" id="time3_2" size="10"  theme="simple"/>
									<s:textfield name="time3_3" id="time3_3" size="10"  theme="simple"/>
									<s:textfield name="time3_4" id="time3_4" size="10"  theme="simple"/>
									<s:textfield name="time3_5" id="time3_5" size="10"  theme="simple"/>
									<s:textfield name="time3_6" id="time3_6" size="10"  theme="simple"/>
									<s:textfield name="time3_7" id="time3_7" size="10"  theme="simple"/>
								</td>
							</tr>
							<tr class="space"></tr>
							<tr>
								<td style="width:104px;">
									4관
								</td>
								<td style="width:170px;">
									<s:textfield name="title4" id="title4" size="20" readOnly="true"  theme="simple" value=""/>
								</td>
								<td align="left">
									<s:textfield id="title4Seq" readOnly="true" size="4" theme="simple" value="영화번호"/>
									<s:textfield id="runningtime4" readOnly="true" size="1" theme="simple" value=""/>분
									<a href="#" onclick="return check(4)"> 저장</a>
<!-- 									<a href="#" onclick="searchMovie()">영화검색</a> -->
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<input type="text" size="10" value="1회차" readOnly="true">
									<input type="text" size="10" value="2회차" readOnly="true">
									<input type="text" size="10" value="3회차" readOnly="true">
									<input type="text" size="10" value="4회차" readOnly="true">
									<input type="text" size="10" value="5회차" readOnly="true">
									<input type="text" size="10" value="6회차" readOnly="true">
									<input type="text" size="10" value="7회차" readOnly="true">
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<s:textfield name="time4_1" id="time4_1" size="10"  theme="simple"/>
									<s:textfield name="time4_2" id="time4_2" size="10"  theme="simple"/>
									<s:textfield name="time4_3" id="time4_3" size="10"  theme="simple"/>
									<s:textfield name="time4_4" id="time4_4" size="10"  theme="simple"/>
									<s:textfield name="time4_5" id="time4_5" size="10"  theme="simple"/>
									<s:textfield name="time4_6" id="time4_6" size="10"  theme="simple"/>
									<s:textfield name="time4_7" id="time4_7" size="10"  theme="simple"/>
								</td>
							</tr>
							<tr class="space"></tr>
							<tr>
								<td style="width:104px;">
									5관
								</td>
								<td style="width:170px;">
									<s:textfield name="title5" id="title5" size="20" readOnly="true"  theme="simple" value=""/>
								</td>
								<td align="left">
									<s:textfield id="title5Seq" readOnly="true" size="4" theme="simple" value="영화번호"/>
									<s:textfield id="runningtime5" readOnly="true" size="1" theme="simple" value=""/>분
									<a href="#" onclick="return check(5)"> 저장</a>
<!-- 									<a href="#" onclick="searchMovie()">영화검색</a> -->
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<input type="text" size="10" value="1회차" readOnly="true">
									<input type="text" size="10" value="2회차" readOnly="true">
									<input type="text" size="10" value="3회차" readOnly="true">
									<input type="text" size="10" value="4회차" readOnly="true">
									<input type="text" size="10" value="5회차" readOnly="true">
									<input type="text" size="10" value="6회차" readOnly="true">
									<input type="text" size="10" value="7회차" readOnly="true">
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<s:textfield name="time5_1"  id="time5_1" size="10"  theme="simple"/>
									<s:textfield name="time5_2"  id="time5_2" size="10"  theme="simple"/>
									<s:textfield name="time5_3"  id="time5_3" size="10"  theme="simple"/>
									<s:textfield name="time5_4"  id="time5_4" size="10"  theme="simple"/>
									<s:textfield name="time5_5"  id="time5_5" size="10"  theme="simple"/>
									<s:textfield name="time5_6"  id="time5_6" size="10"  theme="simple"/>
									<s:textfield name="time5_7"  id="time5_7" size="10"  theme="simple"/>
								</td>
							</tr>
						</table>
					</div>
				</td>
				<td style="width:100px;" align="center">
					<a href="#" onclick="searchMovie()" id="setting">영화설정</a><br><br>
				</td>
			</tr>
		</table>
	</div>
</div>
<jsp:include page="../include/footer.jsp"/>
<script type="text/javascript">
	var date = new Date(); //날짜 객체 생성
	var y = date.getFullYear(); // 현재 연도
	var m = date.getMonth(); // 현재 월
	var d = date.getDate(); // 현재 일
	var day = date.getDay(); //현재 요일
	$('#date').html(y+"년"+(m+1)+"월"+d+"일");
	var week = new Array('일', '월', '화', '수', '목', '금', '토');
	/* 현재 월의 마지막 일을 구합니다. */
    // 1월부터 12월까지의 마지막 일을 배열로 만듭니다.
	var last = [31,28,31,30,31,30,31,31,30,31,30,31];
    // 4년마다 있는 윤년을 계산합니다.(100년||400년 주기는 제외)
	if (y%4 && y%100!=0 || y%400===0) lastDate = last[1] = 29;
    // 현재 월의 마지막 일이 며칠인지 구합니다.
	var lastDate = last[m];
    var days = "<tr><td align='center'>"+y+"</td></tr>";
	days += "<tr><td></td></tr>";
    days += "<tr><td align='center'>"+(m+1)+"월</td></tr>";
    days += "<tr><td></td></tr>";
    var linkCount = d+10;
    var linkok = 1;
    var allCount = 0;
    for (var int = d; int < lastDate; int++) {
    	if(int<linkCount){
	    	days += "<tr><td align='center'><a href='#' onclick='selectTimetable("+y+","+(m+1)+","+int+")'>"+week[day]+ int+"</a></td></tr>";
	    	linkok++;
    	}else{
	    	days += "<tr><td align='center'>"+week[day]+ int+"</td></tr>";
    	}
	    day++;
	    if(day==7)day=0;
	    allCount++;
	}
    if (allCount<30) {
    	days += "<tr><td></td></tr>";
    	days += "<tr><td align='center'>"+(m+2)+"월</td></tr>";
    	days += "<tr><td></td></tr>";
    	var lastDate2 = last[m+1];
    	for (var int = 1; int < lastDate2; int++) {
        	if(8>linkok){
    	    	days += "<tr><td align='center'><a href='#' onclick='selectTimetable("+y+","+(m+2)+","+int+")'>"+week[day]+ int+"</a></td></tr>";
    	    	linkok++;
        	}else{
    	    	days += "<tr><td align='center'>"+week[day]+ int+"</td></tr>";
        	}
    	    day++;
    	    if(day==7)day=0;
    	    allCount++;
    	    if (allCount==30) {
				break;
			}
    	}
	}
    document.getElementById("day").innerHTML = days;
</script>

</body>
</html>