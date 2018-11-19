<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	* {
		font-family : 'Nanum Gothic';
	}
	#trtitle td {
	
		height: 50px; border-bottom: 5px solid #818181;
		border-top: 5px solid #818181; background-color: #D6D6D6;
		border-right: 3px solid #939393;
		border-left: 3px solid #939393;
	}
	#trtotal td {
		 height: 50px; border-bottom: 5px solid #818181;
		 border-top: 5px solid #818181; background-color: #D6D6D6;
		 border-right: 3px solid #939393;
		 border-left: 3px solid #939393;
	}
	#trcontent td {
		height: 30px;
		border-left: 3px solid #939393;
		border-right: 3px solid #939393; border-bottom: 3px solid #939393;
		background-color: #FFF;
	}
</style>


<jsp:include page="../../include/header.jsp"/>

<div class="container marketing">
<h3>영화수정</h3>
	<div style="width: 100%; text-align: center;">
		<div style="width: 1024px; text-align: center; margin: 0 auto;">
			<table style="width: 1024px;">
				<tr style="text-align: right;">
					<td colspan="9">
					<select id="yearSelect">
						<s:iterator begin="0" end="6" status="statu">
							<option class="year">
						</s:iterator>
					</select>
				</tr>
			</table>
			<table style="border-collapse: collapse; width: 1024px; text-align: center; margin: 0 auto;" id="table" >
			</table>
		</div>
	</div>
</div>
<jsp:include page="../../include/footer.jsp"/>
<script type="text/javascript">
	$(document).ready(function() {
		//선택한 년도와 종류
		var yearSelected = '';
		
		//10년의 날짜 출력
		var yearAll = $('.year');
		var year = new Date().getFullYear() - 5;
		for (var i = 0; i < yearAll.length; i++) {
			yearAll[i].innerHTML = year+'년';
			if (year == new Date().getFullYear()) {
				yearAll[i].setAttribute('selected', 'selected');
			}
			year++;
		}
		
		$('#table').html(function() {
			output();
		});
		
		$('#yearSelect').change(function() {
			output();
		});
		
		function output() {
			yearSelected =  $('#yearSelect').val();
			var str = '<tr id="trtitle"><td>영화포스터<td>영화제목<td>감독<td>런닝타임<td>등급<td>상영일<td>종영일<td>만든날짜<td>라이센스</tr>';
			$.ajax({
				url:'movieSelectedYear.action',
				type:'post',
				dataType:'json',
				data:{yearSelected:yearSelected},
				success:function(data) {
					$.each(data.list_movie, function(index, value) {
						str += '<tr id="trcontent"><td><img width="50" src="../picture/poster/'+ value.poster +'"/></img><td><a href="readOneOfMovie.action?movie_seq='+ value.movie_seq +'">'+ value.title +'</a><td>'+ value.director +'<td>'+ value.runningtime +'<td>'+ value.rate +'<td>'+ value.openingday.substring(0, 10) +'<td>'+ value.closingday.substring(0, 10) +'<td>'+ value.madeday.substring(0, 10) +'<td>'+ value.license + '</tr>';
					});
					str += '<tr><td colspan="9" align="right"><input type="button" value="등록" id="insert_btn"></tr>';
					$('#table').html(str);
					$('#insert_btn').click(function() {
						location.href = 'insertMovieView.action';
					});
				}
			});
		}
	});
</script>