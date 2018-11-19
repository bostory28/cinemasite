var timeList = {
		selectTime : function(){
			 	var date = new Date(); //날짜 객체 생성
				var y = date.getFullYear(); // 현재 연도
				var m = date.getMonth(); // 현재 월
				var d = date.getDate(); // 현재 일
				var day = date.getDay(); //현재 요일
				var hour = date.getHours();
				var min = date.getMinutes();
				//alert(hour);
				//alert(min);
				 var month = m+1;
				 var day = d;
				 //alert(month);
				 if (month<10) {
					 month = "0"+month;
					 //alert(month);
					}
				 if (day<10) {
					 day = "0"+day;
					}
				var reserveday = y+""+month+""+day;
				$.ajax({
					url:'timeSelectAllMovieTime.action',
					type:'POST',
					dataType:'json',
					data:{reserveday:reserveday},
					success: function(json){
								$('#showTimeDiv').html("");
								var div1 = "<tr><td colspan='2'><div id='theater11'><table><tr>";
								var div2 = "<tr><td colspan='2'><div id='theater22'><table><tr>";
								var div3 = "<tr><td colspan='2'><div id='theater33'><table><tr>";
								var div4 = "<tr><td colspan='2'><div id='theater44'><table><tr>";
								var div5 = "<tr><td colspan='2'><div id='theater55'><table><tr>";
								var movie1 = "";
								var movie2 = "";
								var movie3 = "";
								var movie4 = "";
								var movie5 = "";
								$.each(json.timetableList,function(key,value){
									switch (value.rate) {
									case 0:
										var str = "<td><span class='movieratet0'>&nbsp;전체&nbsp;</span></td>";
										break;
									case 12:
										var str = "<td><span class='movieratet12'>&nbsp;12&nbsp;</span></td>";
										break;
									case 15:
										var str = "<td><span class='movieratet15'>&nbsp;15&nbsp;</span></td>";
										break;
									case 19:
										var str = "<td><span class='movieratet19'>&nbsp;청불&nbsp;</span></td>";
										break;
									default:
										break;
									}
									if (value.theaterno=="1") {
										if (value.starttime.substring(0,2)>hour) {
											div1 += "<td class='movietimeTd'><a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='text' id='"+value.movie_seq+"'>"+value.starttime+"</span></a><br><span class='count'>"+value.seatcount+"석</span></td>&nbsp";
											movie1 = "<tr>"+str+"<td><div id='movie1' class='movietitle'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 1관10층 | 총158석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
										}else if(value.starttime.substring(0,2)==hour&&value.starttime.substring(3,5)>min+10){
											div1 += "<td class='movietimeTd'><a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='text' id='"+value.movie_seq+"'>"+value.starttime+"</span></a><br><span class='count'>"+value.seatcount+"석</span></td>&nbsp";
											movie1 = "<tr>"+str+"<td><div id='movie1' class='movietitle'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 1관10층 | 총158석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
										}
									}
									if (value.theaterno=="2") {
										if (value.starttime.substring(0,2)>hour) {
											div2 += "<td class='movietimeTd'><a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='text' id='"+value.movie_seq+"'>"+value.starttime+"</span></a><br><span class='count'>"+value.seatcount+"석</span></td>&nbsp";
											movie2 = "<tr>"+str+"<td><div id='movie2' class='movietitle'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 2관10층 | 총124석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
										}else if(value.starttime.substring(0,2)==hour&&value.starttime.substring(3,5)>min+10){
											div2 += "<td class='movietimeTd'><a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='text' id='"+value.movie_seq+"'>"+value.starttime+"</span></a><br><span class='count'>"+value.seatcount+"석</span></td>&nbsp";
											movie2 = "<tr>"+str+"<td><div id='movie2' class='movietitle'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 2관10층 | 총124석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
										}
									}
									if (value.theaterno=="3") {
										if (value.starttime.substring(0,2)>hour) {
											div3 += "<td class='movietimeTd'><a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='text' id='"+value.movie_seq+"'>"+value.starttime+"</span></a><br><span class='count'>"+value.seatcount+"석</span></td>&nbsp";
											movie3 = "<tr>"+str+"<td><div id='movie3' class='movietitle'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 3관10층 | 총123석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
										}else if(value.starttime.substring(0,2)==hour&&value.starttime.substring(3,5)>min+10){
											div3 += "<td class='movietimeTd'><a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='text' id='"+value.movie_seq+"'>"+value.starttime+"</span></a><br><span class='count'>"+value.seatcount+"석</span></td>&nbsp";
											movie3 = "<tr>"+str+"<td><div id='movie3' class='movietitle'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 3관10층 | 총123석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
										}
									}
									if (value.theaterno=="4") {
										if (value.starttime.substring(0,2)>hour) {
											div4 += "<td class='movietimeTd'><a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='text' id='"+value.movie_seq+"'>"+value.starttime+"</span></a><br><span class='count'>"+value.seatcount+"석</span></td>&nbsp";
											movie4 = "<tr>"+str+"<td><div id='movie4' class='movietitle'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 4관11층 | 총151석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
										}else if(value.starttime.substring(0,2)==hour&&value.starttime.substring(3,5)>min+10){
											div4 += "<td class='movietimeTd'><a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='text' id='"+value.movie_seq+"'>"+value.starttime+"</span></a><br><span class='count'>"+value.seatcount+"석</span></td>&nbsp";
											movie4 = "<tr>"+str+"<td><div id='movie4' class='movietitle'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 4관11층 | 총151석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
										}
									}
									if (value.theaterno=="5") {
										if (value.starttime.substring(0,2)>hour) {
											div5 += "<td class='movietimeTd'><a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='text' id='"+value.movie_seq+"'>"+value.starttime+"</span></a><br><span class='count'>"+value.seatcount+"석</span></td>&nbsp";
											movie5 = "<tr>"+str+"<td><div id='movie5' class='movietitle'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 5관11층 | 총123석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
										}else if(value.starttime.substring(0,2)==hour&&value.starttime.substring(3,5)>min+10){
											div5 += "<td class='movietimeTd'><a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='text' id='"+value.movie_seq+"'>"+value.starttime+"</span></a><br><span class='count'>"+value.seatcount+"석</span></td>&nbsp";
											movie5 = "<tr>"+str+"<td><div id='movie5' class='movietitle'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 5관11층 | 총123석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
										}
									}
								});
								div1 += "</tr></table></div></td></tr>";
								div2 += "</tr></table></div></td></tr>";
								div3 += "</tr></table></div></td></tr>";
								div4 += "</tr></table></div></td></tr>";
								div5 += "</tr></table></div></td></tr>";
								movie1 += "</div></td></tr>";
								movie2 += "</div></td></tr>";
								movie3 += "</div></td></tr>";
								movie4 += "</div></td></tr>";
								movie5 += "</div></td></tr>";
								//str +="</table>";
								//alert('<table>'+div1+div2+div3+div4+div5+'</table>');
								$('#showTimeDiv').html('<table>'+movie1+div1+movie2+div2+movie3+div3+movie4+div4+movie5+div5+'</table>');
							}
					 });
		 }
}

function showTime(y,m,d){
	var date = new Date(); //날짜 객체 생성
	var today = date.getDate();
	 if (today<10) {
		 today = "0"+today;
		}
	var hour = date.getHours();
	var min = date.getMinutes();
	//alert(hour);
	//alert(min);
	 var month = m;
	 var day = d;
	 //alert(month);
	 if (month<10) {
		 month = "0"+month;
		 //alert(month);
		}
	 if (day<10) {
		 day = "0"+day;
		}
	var reserveday = y+""+month+""+day;
	$.ajax({
		url:'timeSelectAllMovieTime.action',
		type:'POST',
		dataType:'json',
		data:{reserveday:reserveday},
		success: function(json){
					$('#showTimeDiv').html("");
					var div1 = "<tr><td colspan='2'><div id='theater11'><table><tr>";
					var div2 = "<tr><td colspan='2'><div id='theater22'><table><tr>";
					var div3 = "<tr><td colspan='2'><div id='theater33'><table><tr>";
					var div4 = "<tr><td colspan='2'><div id='theater44'><table><tr>";
					var div5 = "<tr><td colspan='2'><div id='theater55'><table><tr>";
					var movie1 = "";
					var movie2 = "";
					var movie3 = "";
					var movie4 = "";
					var movie5 = "";
					$.each(json.timetableList,function(key,value){
						switch (value.rate) {
						case 0:
							var str = "<td><span class='movieratet0'>&nbsp;전체&nbsp;</span></td>";
							break;
						case 12:
							var str = "<td><span class='movieratet12'>&nbsp;12&nbsp;</span></td>";
							break;
						case 15:
							var str = "<td><span class='movieratet15'>&nbsp;15&nbsp;</span></td>";
							break;
						case 19:
							var str = "<td><span class='movieratet19'>&nbsp;청불&nbsp;</span></td>";
							break;
						default:
							break;
						}
						if (value.screeningday.substring(8,10)==today) {
							if (value.theaterno=="1") {
								if (value.starttime.substring(0,2)>hour) {
									div1 += "<td class='movietimeTd'><a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='text' id='"+value.movie_seq+"'>"+value.starttime+"</span></a><br><span class='count'>"+value.seatcount+"석</span></td>&nbsp";
									movie1 = "<tr>"+str+"<td><div id='movie1' class='movietitle'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 1관10층 | 총158석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
								}else if(value.starttime.substring(0,2)==hour&&value.starttime.substring(3,5)>min+10){
									div1 += "<td class='movietimeTd'><a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='text' id='"+value.movie_seq+"'>"+value.starttime+"</span></a><br><span class='count'>"+value.seatcount+"석</span></td>&nbsp";
									movie1 = "<tr>"+str+"<td><div id='movie1' class='movietitle'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 1관10층 | 총158석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
								}
							}
							if (value.theaterno=="2") {
								if (value.starttime.substring(0,2)>hour) {
									div2 += "<td class='movietimeTd'><a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='text' id='"+value.movie_seq+"'>"+value.starttime+"</span></a><br><span class='count'>"+value.seatcount+"석</span></td>&nbsp";
									movie2 = "<tr>"+str+"<td><div id='movie2' class='movietitle'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 2관10층 | 총124석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
								}else if(value.starttime.substring(0,2)==hour&&value.starttime.substring(3,5)>min+10){
									div2 += "<td class='movietimeTd'><a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='text' id='"+value.movie_seq+"'>"+value.starttime+"</span></a><br><span class='count'>"+value.seatcount+"석</span></td>&nbsp";
									movie2 = "<tr>"+str+"<td><div id='movie2' class='movietitle'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 2관10층 | 총124석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
								}
							}
							if (value.theaterno=="3") {
								if (value.starttime.substring(0,2)>hour) {
									div3 += "<td class='movietimeTd'><a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='text' id='"+value.movie_seq+"'>"+value.starttime+"</span></a><br><span class='count'>"+value.seatcount+"석</span></td>&nbsp";
									movie3 = "<tr>"+str+"<td><div id='movie3' class='movietitle'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 3관10층 | 총123석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
								}else if(value.starttime.substring(0,2)==hour&&value.starttime.substring(3,5)>min+10){
									div3 += "<td class='movietimeTd'><a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='text' id='"+value.movie_seq+"'>"+value.starttime+"</span></a><br><span class='count'>"+value.seatcount+"석</span></td>&nbsp";
									movie3 = "<tr>"+str+"<td><div id='movie3' class='movietitle'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 3관10층 | 총123석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
								}
							}
							if (value.theaterno=="4") {
								if (value.starttime.substring(0,2)>hour) {
									div4 += "<td class='movietimeTd'><a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='text' id='"+value.movie_seq+"'>"+value.starttime+"</span></a><br><span class='count'>"+value.seatcount+"석</span></td>&nbsp";
									movie4 = "<tr>"+str+"<td><div id='movie4' class='movietitle'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 4관11층 | 총151석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
								}else if(value.starttime.substring(0,2)==hour&&value.starttime.substring(3,5)>min+10){
									div4 += "<td class='movietimeTd'><a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='text' id='"+value.movie_seq+"'>"+value.starttime+"</span></a><br><span class='count'>"+value.seatcount+"석</span></td>&nbsp";
									movie4 = "<tr>"+str+"<td><div id='movie4' class='movietitle'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 4관11층 | 총151석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
								}
							}
							if (value.theaterno=="5") {
								if (value.starttime.substring(0,2)>hour) {
									div5 += "<td class='movietimeTd'><a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='text' id='"+value.movie_seq+"'>"+value.starttime+"</span></a><br><span class='count'>"+value.seatcount+"석</span></td>&nbsp";
									movie5 = "<tr>"+str+"<td><div id='movie5' class='movietitle'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 5관11층 | 총123석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
								}else if(value.starttime.substring(0,2)==hour&&value.starttime.substring(3,5)>min+10){
									div5 += "<td class='movietimeTd'><a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='text' id='"+value.movie_seq+"'>"+value.starttime+"</span></a><br><span class='count'>"+value.seatcount+"석</span></td>&nbsp";
									movie5 = "<tr>"+str+"<td><div id='movie5' class='movietitle'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 5관11층 | 총123석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
								}
							}
						}else{
							if (value.theaterno=="1") {
									div1 += "<td class='movietimeTd'><a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='text' id='"+value.movie_seq+"'>"+value.starttime+"</span></a><br><span class='count'>"+value.seatcount+"석</span></td>&nbsp";
									movie1 = "<tr>"+str+"<td><div id='movie1' class='movietitle'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 1관10층 | 총158석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
							}
							if (value.theaterno=="2") {
									div2 += "<td class='movietimeTd'><a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='text' id='"+value.movie_seq+"'>"+value.starttime+"</span></a><br><span class='count'>"+value.seatcount+"석</span></td>&nbsp";
									movie2 = "<tr>"+str+"<td><div id='movie2' class='movietitle'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 2관10층 | 총124석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
							}
							if (value.theaterno=="3") {
									div3 += "<td class='movietimeTd'><a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='text' id='"+value.movie_seq+"'>"+value.starttime+"</span></a><br><span class='count'>"+value.seatcount+"석</span></td>&nbsp";
									movie3 = "<tr>"+str+"<td><div id='movie3' class='movietitle'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 3관10층 | 총123석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
							}
							if (value.theaterno=="4") {
									div4 += "<td class='movietimeTd'><a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='text' id='"+value.movie_seq+"'>"+value.starttime+"</span></a><br><span class='count'>"+value.seatcount+"석</span></td>&nbsp";
									movie4 = "<tr>"+str+"<td><div id='movie4' class='movietitle'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 4관11층 | 총151석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
							}
							if (value.theaterno=="5") {
									div5 += "<td class='movietimeTd'><a href='../theater/theaterView.action?timetable_seq="+value.timetable_seq+"'><span class='text' id='"+value.movie_seq+"'>"+value.starttime+"</span></a><br><span class='count'>"+value.seatcount+"석</span></td>&nbsp";
									movie5 = "<tr>"+str+"<td><div id='movie5' class='movietitle'><a href='../detailPage.action?movie_seq="+value.movie_seq+"'>"+value.title+"</a><br><span class='info'> + 2D | 5관11층 | 총123석 | "+value.openingday.substring(0,10)+" 개봉 | "+value.runningtime+" 분 | "+value.rate+"세 이상 관람가</span>";
							}
						}
					});
					div1 += "</tr></table></div></td></tr>";
					div2 += "</tr></table></div></td></tr>";
					div3 += "</tr></table></div></td></tr>";
					div4 += "</tr></table></div></td></tr>";
					div5 += "</tr></table></div></td></tr>";
					movie1 += "</div></td></tr>";
					movie2 += "</div></td></tr>";
					movie3 += "</div></td></tr>";
					movie4 += "</div></td></tr>";
					movie5 += "</div></td></tr>";
					//str +="</table>";
					//alert('<table>'+div1+div2+div3+div4+div5+'</table>');
					$('#showTimeDiv').html('<table>'+movie1+div1+movie2+div2+movie3+div3+movie4+div4+movie5+div5+'</table>');
					if (json.timetableList.length==0) {
						$('#showTimeDiv').html('<div id="redate" align="center"><p>선택한 날짜에 원하시는 상영스케줄이 없습니다.</p></div>');
					}
				}
		 });
}