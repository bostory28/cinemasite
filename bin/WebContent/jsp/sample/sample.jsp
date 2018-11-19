<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>time</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/sample/default.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/time.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<!--***** 헤더 인클루딩 *****-->
<jsp:include page="../include/header.jsp"/>
<!--***** 헤더 인클루딩 *****-->


<br />
<div style="width:100%" align="center">
	<div style="width:1024px">
		<table border="0" cellspacing="0" width="1024px">
			<tr><td height="50" colspan="4" class="Page">빠른 예매</td> </tr>		
		</table>
		<hr width=1024 size="3" color="black">
		<table border="0" cellspacing="0" width="900">
		<tr>
			<td>
				<div class="ticket_table">
				<table width="1024px">
					<tr class="sreader_title">
						<td width="400px">
							<h3>영화</h3>
						</td>
						<td width="150px">
							<h3>날짜</h3>
						</td>
						<td width="474px">
							<h3>시간</h3>
						</td>
					</tr>
					<tr height="495px" class="sreader">
						<td class="background">
							<div class="time-option"></div>
							<div id="movieListDiv">
							
							</div>
						</td>
						<td width="150px" class="background">
						<div class="col-body">
						<div class="month-option"></div>
								<div class="date-list nano has-scrollbar has-scrollbar-y" id="date_list">
								<div class="nano content scroll-y">
									<table id="day"></table>
								</div>
								</div>
						</div>
						</td>
						<td class="background">
							<div id="timeListDiv" align="center">
								<p>영화, 극장, 날짜를 선택해주세요.</p>
							</div>
						</td>
					</tr>
				</table>
				</div>
			</td>
		</tr>
		</table>
	</div>
	<p class="info-noti">
            * 입장 지연에 따른 관람불편을 최소화하고자 영화는 약 10분 후에 시작됩니다. 관람 에티켓을 위한 사전 입장 부탁드립니다.
        </p>
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
    var days = "<tr><td align='center'  class='year'>"+y+"</td></tr>";
	days += "<tr><td></td></tr>";
    days += "<tr><td align='center' class='month'>"+(m+1)+"</td></tr>";
    days += "<tr><td></td></tr>";
    var linkCount = d+10;
    var linkok = 1;
    var allCount = 0;
    for (var int = d; int < lastDate; int++) {
    	if(int<linkCount){
	    	days += "<tr><td align='center' class='cal'><a href='#' class='cala' onclick='dayClick("+y+","+(m+1)+","+int+");' id='cal"+int+"'>"+week[day]+ int+"</a></td></tr>";
		    linkok++;
    	}else
	    	days += "<tr><td align='center' class='cal'>"+week[day]+ int+"</td></tr>";
	    day++;
	    if(day==7)day=0;
	    allCount++;
	}
    if (allCount<20) {
    	days += "<tr><td></td></tr>";
    	days += "<tr><td align='center' class='month'>"+(m+2)+"</td></tr>";
    	days += "<tr><td></td></tr>";
    	var lastDate2 = last[m+1];
    	for (var int = 1; int < lastDate2; int++) {
        	if(8>linkok){
    	    	days += "<tr><td align='center' class='cal'><a href='#' class='cala' onclick='dayClick("+y+","+(m+2)+","+int+");' id='cal"+int+">"+week[day]+ int+"</a></td></tr>";
    	    	 linkok++;
        	}else
    	    	days += "<tr><td align='center' class='cal'>"+week[day]+ int+"</td></tr>";
    	    day++;
    	    if(day==7)day=0;
    	    allCount++;
    	    if (allCount==30) {
				break;
			}
    	}
	}
    document.getElementById("day").innerHTML = days;
    $(document).ready(function(){
    	movieList.selectOpeningMovie();
    	movieList.selectTimeList();
        $('.cala').click(function(){
			$('.cala').css("color","#333");
	   		var id = $(this).attr("id");
			$('#'+id).attr("style","color:#DC2727;");
    	});
    });
</script>
</body>
</html>