<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--***** 헤더 인클루딩 *****-->
<jsp:include page="../include/header.jsp"/>
<!--***** 헤더 인클루딩 *****-->

<div class="container marketing">
<h3>영화상세정보</h3>
<div align="center">
	<div>
			<hr width=1024 size="3" color="#FFF">
		<br>
		<table border="0" cellspacing="0" width="1024">
			<tr><td width="250" rowspan="8" align="center">
				<img width="200" src="<%=request.getContextPath()%>/picture/poster/<s:property value="movie.poster"/>" id="informPhoto">
			</td>
				   <td height="40" colspan="3" class="Title"><s:property value="movie.title"/></td></tr>
			<tr><td height="32" class="Inform">감독</td><td colspan="2" class="Text"><s:property value="movie.director"/></td></tr>
			<tr><td height="32" class="Inform">출연진</td><td colspan="2" class="Text"><s:property value="movie.actors"/></td></tr>
			<tr><td height="32" class="Inform">국가</td><td colspan="2" class="Text"><s:property value="movie.nation"/></td></tr>
			<tr><td height="32" class="Inform">장르</td><td colspan="2" class="Text"><s:property value="movie.genre"/></td></tr>
			<s:if test="movie.rate == 19">
				<tr><td height="32" class="Inform">등급</td><td colspan="2" class="Text">청소년 관람불가</td></tr>
			</s:if>
			<s:elseif test="movie.rate == 0">
				<tr><td height="32" class="Inform">등급</td><td colspan="2" class="Text">전체 관람가</td></tr>
			</s:elseif>
			<s:else>
				<tr><td height="32" class="Inform">등급</td><td colspan="2" class="Text"><s:property value="movie.rate"/>세 관람가</td></tr>
			</s:else>
			<tr><td height="32" class="Inform">러닝타임</td><td colspan="2" class="Text"><s:property value="movie.runningtime"/>분</td></tr>
			<tr><td height="32" class="Inform">개봉일</td><td colspan="2" class="Text"><s:property value="movie.openingday"/></td></tr>
			
			<tr align="left">
				<td width="280" height="60"></td>
				<td width="120"><a href="<%=request.getContextPath()%>/time/goTimetable.action?movie_seq=<s:property value="movie_seq"/>" class="Button">바로예매</a></td>
				<td width="120"><a href="javascript:down()" class="Button">평가하기</a></td>
				<td><a href="javascript:back()" class="Button">돌아가기</a></td></tr>
			<tr><td height="28" colspan="4" class="Inform">줄거리</td></tr>
			<tr><td height="100" colspan="4" class="Text"><s:property value="movie.story"/></td></tr>
		</table>
		<br><br><br><br>
		
		<table border="0" cellspacing="6">
			<tr align="center" bgcolor="black">
			<td width="300" height="30" class="Tab">집계 평점</td>
			<td width="300" class="Tab">성별 분포</td>
			<td width="300" class="Tab">연령별 분포</td></tr>
			<tr align="center">
				<td class="Grade"><s:property value="moviePoint"/></td><td><div id="container1" style="height: 200px"></div></td><td><div id="container2" style="height: 200px"></div></td></tr>	
		</table>
		
		<br><br>
		<table class="revie" width="800" style="background-color: white;">
			<tr height="30"><td align="right" class="Text" style="color:#DC2727;">*평점을 남겨주신 모든 분들께 50포인트를 증정합니다.</td></tr>
			<tr height="30" bgcolor="black" align="center" class="Tab"><td>감 상 평 남 기 기</td></tr>
			<tr>
			<td>			
				<table border="0" cellspacing="15" width="800">
					<tr height="45">
						<td class="Number" align="center">
<!-- 							<input type="radio" name="review.star" class="radioButton" value="1"/>1점&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 							<input type="radio" name="review.star" class="radioButton" value="2"/>2점&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 							<input type="radio" name="review.star" class="radioButton" value="3"/>3점&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 							<input type="radio" name="review.star" class="radioButton" value="4"/>4점&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 							<input type="radio" name="review.star" class="radioButton" value="5"/>5점&nbsp;&nbsp;&nbsp;&nbsp; -->
							  <label class="btn btn-danger">
							    <input type="radio" name="options" id="option1" class="radioButton" value="1"> 1점
							  </label>
							  <label class="btn btn-danger">
							    <input type="radio" name="options" id="option2" class="radioButton" value="2"> 2점
							  </label>
							  <label class="btn btn-danger">
							    <input type="radio" name="options" id="option4" class="radioButton" value="3"> 3점
							  </label>
							  <label class="btn btn-danger">
							    <input type="radio" name="options" id="option5" class="radioButton" value="4"> 4점
							  </label>
							  <label class="btn btn-danger">
							    <input type="radio" name="options" id="option6" class="radioButton" value="5"> 5점
							  </label>
						</td>
					</tr>
					<tr>
						<td align="center" width="100px">
							<s:textfield id="content" name="review.content" theme="simple"/>
						</td>
					</tr>
					<tr>
						<td class="Text" align="center" style="padding-bottom: 10px;">
						<br>
							<input type="button" class="Button2" onclick="comment()" value="등록">
						</td>
					</tr>
				</table>
		</table>
		<br>
		<div id="commentDiv" class="revie">
			<br><br>
			<table>
				<tr>
					<td class="Text"> 첫 번째 감상평을 남겨주세요 !</td>
				</tr>
			</table>
			<br><br><br><br>
		</div>
		<div>
				
<!-- /페이지 이동 부분 -->
		</div>	
	</div>
</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		var movie_seq = '<s:property value="movie.movie_seq"/>';
		var m = '<s:property value="mansReserve"/>';
		var w = '<s:property value="womansReserve"/>';
		var sum = m+w;
		var mp = (m/sum)*100;
		var wp = (w/sum)*100;
	    var r1 = '<s:property value="teensReserve"/>';
	    var r2 = '<s:property value="twentiesReserve"/>';
	    var r3 = '<s:property value="thirtiesReserve"/>';
	    var r4 = '<s:property value="fortiesReserve"/>';
	    var chartSum = parseInt(r1,10)+parseInt(r2,10)+parseInt(r3,10)+parseInt(r4,10);
	    var chart1 = (r1/chartSum)*100;
	    var chart2 = (r2/chartSum)*100;
	    var chart3 = (r3/chartSum)*100;
	    var chart4 = (r4/chartSum)*100;
		$.ajax({
			url: 'getComment.action',
			type: 'POST',
			data: {movie_seq:movie_seq},
			dataType: 'json',
			success: output
		});	
		    $('#container1').highcharts({
		        chart: {
		            type: 'pie',
		            options3d: {
		                enabled: true,
		                alpha: 45,
		                beta: 0
		            }
		        },
		        title: {
		            text: ' '
		        },
		        tooltip: {
		            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		        },
		        plotOptions: {
		            pie: {
		                allowPointSelect: true,
		                cursor: 'pointer',
		                depth: 35,
		                dataLabels: {
		                    enabled: true,
		                    format: '{point.name}'
		                }
		            }
		        },
		        series: [{
		            type: 'pie',
		            name: '성별 예매 분포',
		            data: [
		                ['남자',   mp],
		                ['여자',   wp]
		            ]
		        }]
		    });
		    

		    
		    $('#container2').highcharts({
		        chart: {
		            type: 'column'
		        },
		        title: {
		            text: ' '
		        },
		        subtitle: {
		            text: ' '
		        },
		        xAxis: {
		            categories: [
		                ' '
		            ]
		        },
		        yAxis: {
		            title: {
		                text: ' '
		            }
		        },
		        plotOptions: {
		            column: {
		                pointPadding: 0.1,
		                borderWidth: 0
		            }
		        },
		        series: [{
		            name: '10',
		            data: [chart1]

		        }, {
		            name: '20',
		            data: [chart2]

		        }, {
		            name: '30',
		            data: [chart3]

		        }, {
		            name: '40',
		            data: [chart4]

		        }]
		    });
		    
		  $('.highcharts-button').css('display','none');
		  
		  
	});

	function comment(){
		var movie_seq = '<s:property value="movie.movie_seq"/>';
		var content = document.getElementById("content").value;
		var star=$('.radioButton:checked').val();
		//alert(star+"점으로 남기시겠습니까?");
		if(content==""||content.length==0){
			alert('내용이 입력되지 않았습니다.');
			$('#content').focus();
			return;
		}
		$.ajax({
			url: 'comment.action',
			type: 'POST',
			data: {star:star,content:content,movie_seq:movie_seq},
			dataType: 'json',
			success: output
		});
		$('#content').val("");
	} 
	
	function output(json){
		var userid = '<s:property value="userid"/>';
		$('#commentDiv').html('');
		var str = '<table cellspacing="0" width="900" align="center">';
		$.each(json.reviewList,function(key,value){
			str += '<tr height="60">';
				str += '<td rowspan="2" width="180" align="center" class="Title"><span id="updateStar'+ value.review_seq +'"  style="display:none;"></span>';
				str += '<span id="star'+ value.review_seq +'">'+value.star+'점</span></td>';
				str += '<td width="560" class="Comment"><span id="update'+ value.review_seq +'"  style="display:none;"></span>';
				str += '<span id="'+ value.review_seq +'" data="'+value.content+'">'+value.content+'</span></td>';
				if (userid==value.userid) {
					str += '<td rowspan="2" align="center"><span id="re'+ value.review_seq +'"><input type="button" value="수정"  onclick="reComment('+ value.review_seq +')" class="Button2"></span>';
					str += '<span id="save'+ value.review_seq +'" style="display:none;"><input type="button" value="저장" onclick="saveComment('+ value.review_seq +')" class="Button2"></span></td>';
					str += '<td rowspan="2" align="center"><span id="del'+ value.review_seq +'"><input type="button" value="삭제" onclick="delComment('+ value.review_seq +')" class="Button2"></span>';
					str += '<span id="cen'+ value.review_seq +'" style="display:none;"><input type="button" value="취소" onclick="cenComment('+ value.review_seq +')" class="Button2"></span></td>';
				}
			str += '</tr>';
			str += '<tr height="30">';
				str += '<td class="Fade">'+value.userid+'님 | ' +value.reviewdate.substring(0,10);+'</td>';
			str += '</tr>';
		});
		str += '</table>';
		str += '<br><br>';
		$('#commentDiv').html(str);

	}
	
	//삭제 버튼들에 클릭이벤트 처리
	function delComment(seq){
		var movie_seq = '<s:property value="movie.movie_seq"/>';
		$.ajax({
			url: 'deleteComment.action',
			type: 'POST',
			data: {review_seq:seq,movie_seq:movie_seq},
			dataType: 'json',
			success:delOk
		});
	}
	
	function delOk(json){
		alert("삭제되었습니다.");
		output(json);
	}
	
	
	//수정 버튼들에 클릭이벤트 처리
	function reComment(seq){
		$('#star'+seq +'').css("display","none");
		$('#updateStar'+seq +'').css("display","inline");
		var star = "";
		star += '<td width="160" class="Number1">';
		star +='<input type="radio" name="review.star" class="radioButton1" value="1"/>1점';
		star +='<input type="radio" name="review.star" class="radioButton1" value="2"/>2점';
		star +='<input type="radio" name="review.star" class="radioButton1" value="3"/>3점';
		star +='<input type="radio" name="review.star" class="radioButton1" value="4"/>4점';
		star +='<input type="radio" name="review.star" class="radioButton1" value="5"/>5점</td>';
		$('#updateStar'+seq +'').html(star);
		var content = $('#'+seq +'').attr('data');
		$('#'+seq +'').css("display","none");
		$('#update'+seq +'').css("display","inline");
		$('#update'+seq +'').html('<s:textfield size="70" value="'+content+'" id="recontent'+seq+'" name="review.content" theme="simple"/>');
		var movie_seq = '<s:property value="movie.movie_seq"/>';		
		$('#re'+seq +'').css("display","none");
		$('#del'+seq +'').css("display","none");
		$('#save'+seq +'').css("display","inline");
		$('#cen'+seq +'').css("display","inline");
	}
	
	function cenComment(seq){
		$('#star'+seq +'').css("display","inline");
		$('#updateStar'+seq +'').css("display","none");
		$('#update'+seq +'').css("display","none");
		$('#'+seq +'').css("display","inline");
		$('#re'+seq +'').css("display","inline");
		$('#del'+seq +'').css("display","inline");
		$('#save'+seq +'').css("display","none");
		$('#cen'+seq +'').css("display","none");
	}
	
	function saveComment(seq){
		var movie_seq = '<s:property value="movie.movie_seq"/>';
		var content = $('#recontent'+seq +'').val();
		//alert('수정할 내용'+content);
		var star=$('.radioButton1:checked').val();
		//alert(star+"점으로 남기시겠습니까?");
		if(content==""||content.length==0){
			alert('내용이 입력되지 않았습니다.');
			$('#update'+seq +'').focus();
		}
		$.ajax({
			url: 'reComment.action',
			type: 'POST',
			data: {star:star,content:content,review_seq:seq,movie_seq:movie_seq},
			dataType: 'json',
			success: output
		});
	}
	
	function back() {
		history.go(-1)();
	}
	function down() {
		document.body.scrollTop = document.body.scrollHeight;
	}
</script>
<jsp:include page="../include/footer.jsp"/>
