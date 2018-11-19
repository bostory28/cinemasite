 var artHouseHtml="<option value=''>아트하우스</option>";
 var specialHtml="<option value=''>특별관</option>";
 var dropdownList = {
 		artHouse : function(id) {
 			artHouseHtml += "<option value='0'>전체</option>";
 			artHouseHtml += "<option value='1'>최신작</option>";
 			artHouseHtml += "<option value='2'>큐레이터</option>";
 			$("#"+id).html(artHouseHtml);
 		},
 		special : function(id) {
 			specialHtml += "<option value='0'>전체</option>";
 			specialHtml += "<option value='1'>4DX</option>";
 			specialHtml += "<option value='2'>IMAX</option>";
 			specialHtml += "<option value='3'>GOLD CLASS</option>";
 			$("#"+id).html(specialHtml);
 		}
 }
 
//		 <table>
//			<tr>
//				<td>
//				<a href="#" onclick="return false;">
//				<span class="icon">&nbsp;</span>
//				<span class="text">킹스맨-시크릿에이전트</span>
//				<span class="sreader"></span>
//				</a>
//				</td>
//			</tr>
//		</table>

 var str = "<table>";
 var movieList = {
		 selectOpeningMovie : function(){
			 $.ajax({
					url:'selectOpeningMovie.action',
					type:'POST',
					dataType:'json',
					success: function(json){
						$('#movieListDiv').html("");
						$.each(json.openingMovieList,function(key,value){
							str += "<tr>";
							switch (value.rate) {
							case 0:
								str += "<td><span class='movierate0'>&nbsp;전체&nbsp;</span></td>";
								break;
							case 12:
								str += "<td><span class='movierate12'>&nbsp;12&nbsp;</span></td>";
								break;
							case 15:
								str += "<td><span class='movierate15'>&nbsp;15&nbsp;</span></td>";
								break;
							case 19:
								str += "<td><span class='movierate19'>&nbsp;청불&nbsp;</span></td>";
								break;
							default:
								break;
							}
							str += "<td class='reservemovielist'>"
							str += "<a href='#' onclick='movieClick("+value.movie_seq+");'><span class='valuetitle' id='"+value.movie_seq+"'>"+value.title+"</span>";
							str += "</a>";
							str += "</td></tr>";
						});
						str +="</table>";
						$('#movieListDiv').html(str);
						$('.valuetitle').click(function(){
							$('.valuetitle').css("color","#333");
					   		var id = $(this).attr("id");
							$('#'+id).attr("style","color:#DC2727;");
						});
					}
			 });
		 },
 		selectTimeList : function(){
		
 		}
 }
 function reserveTime(val){
	 if (val.length==8) {
		 var reserveday = val;
	}else{
		var seq = val;
	}
	 alert('날짜'+reserveday+'seq'+seq);
 }
 
 function movieClick(seq){
	 //alert(seq);
	 //reserveTime(seq);
	 $.ajax({
			url:'timeUserMovieChoice.action',
			type:'POST',
			dataType:'json',
			data:{movie_seq:seq},
			success:function(json){
				//alert('영화번호 저장');
				searchTime(json);
			}
	 });
 }
 
 function dayClick(y,m,d){
	 var month = m;
	 var day = d;
	 //alert(month);
	 if (month<10) {
		 month = "0"+month;
		// alert(month);
		}
	 if (day<10) {
		 day = "0"+day;
		}
	var reserveday = y+""+month+""+day;
	 //alert(reserveday);
	 //reserveTime(reserveday);
	 $.ajax({
			url:'timeUserDayChoice.action',
			type:'POST',
			dataType:'json',
			data:{reserveday:reserveday},
			success:function(json){
				//alert('날짜 저장');
				searchTime(json);
			}
	 });
 }
 
 function searchTime(json){
	var date = new Date(); //날짜 객체 생성
	var y = date.getFullYear(); // 현재 연도
	var m = date.getMonth(); // 현재 월
	var d = date.getDate(); // 현재 일
	var day = date.getDay(); //현재 요일
	var hour = date.getHours();
	var min = date.getMinutes();
	var today = date.getDate();
	 if (today<10) {
		 today = "0"+today;
		}
	 $.each(json.reservenowList,function(key,value){
		 var reserveday = value.reserveday;
		 var movie_seq = value.reservemovie_seq
		 // alert("날짜"+reserveday);
		 //alert("번호"+movie_seq);
		 if (reserveday!=0&&movie_seq!=0) {
			
		 $.ajax({
				url:'timeSelectMovieTime.action',
				type:'POST',
				dataType:'json',
				data:{reserveday:reserveday,movie_seq:movie_seq},
				success:function(json){
					//var str = "<table>";
					$('#timeListDiv').html("");
					var div1 = "<tr><td><div id='theater1'>";
					var div2 = "<tr><td><div id='theater2'>";
					var div3 = "<tr><td><div id='theater3'>";
					var div4 = "<tr><td><div id='theater4'>";
					var div5 = "<tr><td><div id='theater5'>";
					var theater1 = "";
					var theater2 = "";
					var theater3 = "";
					var theater4 = "";
					var theater5 = "";
					$.each(json.timetableList,function(key,value){
						//오늘이면 조건검색
						if (value.screeningday.substring(8,10)==today) {
							if (value.theaterno=="1") {
								//지금시간보다 남아있으면
								if (value.starttime.substring(0,2)>hour) {
									theater1 = "<tr><td><div id='movie1' class='movietitle2'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 1관10층 | 총158석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
									div1 += "<a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='starttime' id='st"+value.movie_seq+"'>"+value.starttime+"</span></a>&nbsp&nbsp";
								//지금시간분보다 남아있으면
								}else if(value.starttime.substring(0,2)==hour&&value.starttime.substring(3,5)>min+10){
									theater1 = "<tr><td><div id='movie1' class='movietitle2'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 1관10층 | 총158석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
									div1 += "<a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='starttime' id='st"+value.movie_seq+"'>"+value.starttime+"</span></a>&nbsp&nbsp";
								}
							}
							if (value.theaterno=="2") {
								if (value.starttime.substring(0,2)>hour) {
									theater2 = "<tr><td><div id='movie1' class='movietitle2'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 2관10층 | 총124석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
									div2 += "<a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='starttime' id='st"+value.movie_seq+"'>"+value.starttime+"</span></a>&nbsp&nbsp";
								}else if(value.starttime.substring(0,2)==hour&&value.starttime.substring(3,5)>min+10){
									theater2 = "<tr><td><div id='movie1' class='movietitle2'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 2관10층 | 총124석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
									div2 += "<a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='starttime' id='st"+value.movie_seq+"'>"+value.starttime+"</span></a>&nbsp&nbsp";
								}
							}
							if (value.theaterno=="3") {
								if (value.starttime.substring(0,2)>hour) {
									theater3 = "<tr><td><div id='movie1' class='movietitle2'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 3관10층 | 총123석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
									div3 += "<a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='starttime' id='st"+value.movie_seq+"'>"+value.starttime+"</span></a>&nbsp&nbsp";
								}else if(value.starttime.substring(0,2)==hour&&value.starttime.substring(3,5)>min+10){
									theater3 = "<tr><td><div id='movie1' class='movietitle2'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 3관10층 | 총123석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
									div3 += "<a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='starttime' id='st"+value.movie_seq+"'>"+value.starttime+"</span></a>&nbsp&nbsp";
								}
							}
							if (value.theaterno=="4") {
								if (value.starttime.substring(0,2)>hour) {
									theater4 = "<tr><td><div id='movie1' class='movietitle2'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 4관11층 | 총151석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
									div4 += "<a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='starttime' id='st"+value.movie_seq+"'>"+value.starttime+"</span></a>&nbsp&nbsp";
								}else if(value.starttime.substring(0,2)==hour&&value.starttime.substring(3,5)>min+10){
									theater4 = "<tr><td><div id='movie1' class='movietitle2'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 4관11층 | 총151석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
									div4 += "<a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='starttime' id='st"+value.movie_seq+"'>"+value.starttime+"</span></a>&nbsp&nbsp";
								}
							}
							if (value.theaterno=="5") {
								if (value.starttime.substring(0,2)>hour) {
									theater5 = "<tr><td><div id='movie1' class='movietitle2'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 5관11층 | 총123석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
									div5 += "<a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='starttime' id='st"+value.movie_seq+"'>"+value.starttime+"</span></a>&nbsp&nbsp";
								}else if(value.starttime.substring(0,2)==hour&&value.starttime.substring(3,5)>min+10){
									theater5 = "<tr><td><div id='movie1' class='movietitle2'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 5관11층 | 총123석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
									div5 += "<a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='starttime' id='st"+value.movie_seq+"'>"+value.starttime+"</span></a>&nbsp&nbsp";
								}
							}
						}else{
							if (value.theaterno=="1") {
								theater1 = "<tr><td><div id='movie1' class='movietitle2'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 1관10층 | 총158석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
								div1 += "<a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='starttime' id='st"+value.movie_seq+"'>"+value.starttime+"</span></a>&nbsp&nbsp";
							}
							if (value.theaterno=="2") {
								theater2 = "<tr><td><div id='movie1' class='movietitle2'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 2관10층 | 총124석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
								div2 += "<a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='starttime' id='st"+value.movie_seq+"'>"+value.starttime+"</span></a>&nbsp&nbsp";
							}
							if (value.theaterno=="3") {
								theater3 = "<tr><td><div id='movie1' class='movietitle2'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 3관10층 | 총123석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
								div3 += "<a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='starttime' id='st"+value.movie_seq+"'>"+value.starttime+"</span></a>&nbsp&nbsp";
							}
							if (value.theaterno=="4") {
								theater4 = "<tr><td><div id='movie1' class='movietitle2'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 4관11층 | 총151석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
								div4 += "<a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='starttime' id='st"+value.movie_seq+"'>"+value.starttime+"</span></a>&nbsp&nbsp";
							}
							if (value.theaterno=="5") {
								theater5 = "<tr><td><div id='movie1' class='movietitle2'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 5관11층 | 총123석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
								div5 += "<a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='starttime' id='st"+value.movie_seq+"'>"+value.starttime+"</span></a>&nbsp&nbsp";
							}
						}
					});
					div1 += "</div></td></tr>";
					div2 += "</div></td></tr>";
					div3 += "</div></td></tr>";
					div4 += "</div></td></tr>";
					div5 += "</div></td></tr>";
					//str +="</table>";
					//alert('<table>'+div1+div2+div3+div4+div5+'</table>');
					$('#timeListDiv').html('<table>'+theater1+div1+theater2+div2+theater3+div3+theater4+div4+theater5+div5+'</table>');
					if (json.timetableList.length==0) {
						$('#timeListDiv').html('<div id="redate" align="center"><p>선택한 날짜에 원하시는 상영스케줄이 없습니다.</p></div>');
					}
				}
		 });
		 }
	 });
 }
 
 