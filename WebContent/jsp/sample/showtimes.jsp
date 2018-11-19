<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--***** 헤더 인클루딩 *****-->
<jsp:include page="../include/header.jsp"/>
<!--***** 헤더 인클루딩 *****-->
<div class="container marketing">
<h3>상영 시간표</h3>
<hr width=1024 size="3" color="black">
<div align="center">
<div align="center" style="background-color: white;border-radius: 10px;width: 1024px;">
	<div id="days">
	</div>
	<div class="sect-guide">
            <div class="descri-timezone">
                <p>
                    * 시간을 클릭하시면 빠른 예매를 하실 수 있습니다.</p>
            </div>
        </div>
    <div class="showtimes">
		<div id="showTimeDiv" align="center">
		</div>
	</div>
        <br>
	<p class="info-noti">
            * 입장 지연에 따른 관람불편을 최소화하고자 영화는 약 10분 후에 시작됩니다. 관람 에티켓을 위한 사전 입장 부탁드립니다.
        </p>
        <br>
</div>
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
    var days = "";
    days += "<tr><td></td></tr>";
    var linkCount = d+10;
    var linkok = 1;
    var allCount = 0;
    for (var int = d; int < lastDate; int++) {
    	if(int<linkCount){
	    	days += "<tr><td align='center'><a href='#' onclick='showTime("+y+","+(m+1)+","+int+");'>"+(m+1)+"월"+int+"일("+week[day]+")</a>&nbsp;</td></tr>";
		    linkok++;
    	}else
	    	days += "<tr><td align='center'>"+(m+1)+"월"+int+"일"+week[day]+"&nbsp;</td></tr>";
	    day++;
	    if(day==7)day=0;
	    allCount++;
	    if (allCount==9) {
			break;
		}
	}
    if (allCount<9) {
    	days += "<tr><td></td></tr>";
    	var lastDate2 = last[m+1];
    	for (var int = 1; int < lastDate2; int++) {
        	if(8>linkok){
    	    	days += "<tr><td align='center'><a href='#' onclick='showTime("+y+","+(m+2)+","+int+");'>"+(m+2)+"월"+int+"일("+week[day]+")</a>&nbsp;</td></tr>";
    	    	 linkok++;
        	}else
    	    	days += "<tr><td align='center'>"+(m+2)+"월"+int+"일"+week[day]+"&nbsp;</td></tr>";
    	    day++;
    	    if(day==7)day=0;
    	    allCount++;
    	    if (allCount==7) {
				break;
			}
    	}
	}
    document.getElementById("days").innerHTML = days;
</script>
<script type="text/javascript">
$(document).ready(function(){
	timeList.selectTime();
});
</script>