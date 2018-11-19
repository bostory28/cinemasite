<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화검색</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/sample/timetable.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.2.js"></script>
<style type="text/css">
	#space{
		height:30px;
	}
	table{
		width:480px;
	}
	td .movieList{
		width:400px;
		border:0px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
			$('#choiceMoive').css("display","none");
			$('#btn').click(function(){
				$('#searchResult'	).html("");
			});
	});
	function movieSearch(){
		var title = document.getElementById("title").value;
		$.ajax({
			url:'adminSearchMovie.action',
			type:'POST',
			dataType:'json',
			data:{title:title},
			success: function(result){
				$.each(result.movieList,function(key,value){
					$('#searchResult').append('<tr><td><input type="radio" class="radio" name="radio" onclick="movieChoice('+value.movie_seq+');"></td><td class="movieList">'+value.title+'</td></tr>');				
				});
			}
		});
	}
	function movieChoice(seq){
		//alert(seq);
		$('#choiceMoive').css("display","block");
		$.ajax({
			url:'adminSelectOneMovie.action',
			type:'POST',
			dataType:'json',
			data:{movie_seq:seq},
			success: function(result){
				$.each(result.movieList,function(key,value){
					if (value!=null) {
						$('.movieRadio').click(function(){
							var screen = $(this).attr('value');
							switch(screen){
								case	"1":
									opener.document.getElementById("title1").value=value.title;
									opener.document.getElementById("title1Seq").value=value.movie_seq;
									opener.document.getElementById("runningtime1").value=value.runningtime;
									break;
								case	"2":
									opener.document.getElementById("title2").value=value.title;
									opener.document.getElementById("title2Seq").value=value.movie_seq;
									opener.document.getElementById("runningtime2").value=value.runningtime;
									break;
								case	"3":
									opener.document.getElementById("title3").value=value.title;
									opener.document.getElementById("title3Seq").value=value.movie_seq;
									opener.document.getElementById("runningtime3").value=value.runningtime;
									break;
								case	"4":
									opener.document.getElementById("title4").value=value.title;
									opener.document.getElementById("title4Seq").value=value.movie_seq;
									opener.document.getElementById("runningtime4").value=value.runningtime;
									break;
								case	"5":
									opener.document.getElementById("title5").value=value.title;
									opener.document.getElementById("title5Seq").value=value.movie_seq;
									opener.document.getElementById("runningtime5").value=value.runningtime;
									break;
							}
							window.close();
						});
					}
				});
			}
		});
	}
</script>
</head>
<body>
<div align="center">
	<div>
		<table border="0" align="center">
			<tr>
				<td style="height:50px;" align="center" colspan="2">
					<s:textfield name="movie.title"  id="title" size="50" theme="simple"/> 
					<input type="button" value="검색" id="btn" onclick="movieSearch();"/>
				</td>
			</tr>
			<tr style="height:150px;">
				<td>
					<div id="searchResult"></div>
				</td>
				<td style="width:100px;">
					<div id="choiceMoive">
						<input type="radio" value="1" class="movieRadio" name="movieRadio">1관
						<div class="space2"></div>
						<input type="radio" value="2" class="movieRadio" name="movieRadio">2관
						<div class="space2"></div>
						<input type="radio" value="3" class="movieRadio" name="movieRadio">3관
						<div class="space2"></div>
						<input type="radio" value="4" class="movieRadio" name="movieRadio">4관
						<div class="space2"></div>
						<input type="radio" value="5" class="movieRadio" name="movieRadio">5관
					</div>
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>