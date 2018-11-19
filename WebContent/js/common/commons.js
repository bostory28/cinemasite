	var date = {
			test : function(id, time) {
				if ($('#'+time).val()=="") {
					alert('영화를 설정해 주세요');
					$('#setting').focus();
				}
				var time = $('#'+id+"_1").val();
				if (time.length==4) {
					if (time>2359) {
						alert('잘 못 입력하셨습니다.');
						$('#'+id+"_1").forcus();
					}
					
					var date = new Date(); //날짜 객체 생성
					var y = date.getFullYear(); // 현재 연도
					var m = date.getMonth(); // 현재 월
					var d = date.getDate(); // 현재 일
					var day = date.getDay(); //현재 요일
					var runningTime = new Date(y,m,d,0,0);
					runningTime.setMinutes($('#'+time).val());
					var inputTime = new Date(y,m,d,time.substring(0,2),time.substring(2,5));
					alert(inputTime.toTimeString());
					alert(runningTime.toTimeString());
					var newTime = new Date(y,m,d,0,0);
					newTime.setHours(inputTime.getHours()+runningTime.getHours());
					newTime.setMinutes(inputTime.getMinutes()+runningTime.getMinutes());
					
					$('#'+id+"_2").val(newTime.toTimeString());
					var h = $('#'+id+"_1").val().substring(0,2);
					var m = $('#'+id+"_1").val().substring(2,4);
					$('#'+id+"_1").val().replace(h+m,h+":"+m);
				}
			}
	}
	function insertTimes(id){
		var theaterno = id;
		var movie_seq = $('#title'+id+'Seq').val();
		var date = new Date(); //날짜 객체 생성
		var y = date.getFullYear();
		var d1 = $('#date').val();
		var d2 = d1.replace("년","/");
		var d3 = d2.replace("월","/");
		var d4 = d3.replace("일","/");
		var to1 = d4.split("/");
		if(to1[1].length==1){
			to1[1] = "0"+to1[1];
		}
		if (to1[2].length==1) {
			to1[2] = "0"+to1[2];
		}
		var screeningday = to1[0]+to1[1]+to1[2];
		for (var int = 1; int < 8; int++) {
			if ($("#time"+id+"_"+int).val()!=null) {
				var starttime = $("#time"+id+"_"+int).val();
				var timeno = int;
				$.ajax({
					url:'adminInsertTimes.action',
					type:'POST',
					dataType:'json',
					data:{movie_seq:movie_seq,screeningday:screeningday,starttime:starttime,theaterno:theaterno,timeno:timeno},
					success: function(){
					}
				});
			}
		}
		alert('저장 되었습니다.');
	}
	
	function times(id){
		var movieTime = $("#time"+id+"_1").val()+","+$("#time"+id+"_2").val()+","+$("#time"+id+"_3").val()+","+$("#time"+id+"_4").val()+","+$("#time"+id+"_5").val()+","+$("#time"+id+"_6").val()+","+$("#time"+id+"_7").val();
		return movieTime;
	}
	function test(id, times) {
		if ($('#'+times).val()=="") {
			alert('영화를 설정해 주세요');
			$('#setting').focus();
		}
		var time = $('#'+id+"1").val();
		if (time.length==4) {
			if (time>2359||time.substring(2,4)>60) {
				alert('잘 못 입력하셨습니다.');
				$('#'+id+"1").focus();
				return;
			}
			
			var date = new Date(); //날짜 객체 생성
			var y = date.getFullYear(); // 현재 연도
			var m = date.getMonth(); // 현재 월
			var d = date.getDate(); // 현재 일
			var day = date.getDay(); //현재 요일
			var runningTime = new Date(y,m,d,0,0);
			runningTime.setMinutes($('#'+times).val());
			var inputTime = new Date(y,m,d,time.substring(0,2),time.substring(2,5));
			//alert(inputTime.toTimeString());
			//alert(runningTime.toTimeString());
			var newTime = new Date(y,m,d,0,0);
			newTime.setHours(inputTime.getHours()+runningTime.getHours(),inputTime.getMinutes()+runningTime.getMinutes()+30);
			var nextTime = newTime.toTimeString().split(":");
			$('#'+id+"2").val(nextTime[0]+":"+nextTime[1]);
			newTime.setHours(newTime.getHours()+runningTime.getHours(),newTime.getMinutes()+runningTime.getMinutes()+30);
			nextTime = newTime.toTimeString().split(":");
			$('#'+id+"3").val(nextTime[0]+":"+nextTime[1]);
			newTime.setHours(newTime.getHours()+runningTime.getHours(),newTime.getMinutes()+runningTime.getMinutes()+30);
			nextTime = newTime.toTimeString().split(":");
			$('#'+id+"4").val(nextTime[0]+":"+nextTime[1]);
			newTime.setHours(newTime.getHours()+runningTime.getHours(),newTime.getMinutes()+runningTime.getMinutes()+30);
			nextTime = newTime.toTimeString().split(":");
			$('#'+id+"5").val(nextTime[0]+":"+nextTime[1]);
			newTime.setHours(newTime.getHours()+runningTime.getHours(),newTime.getMinutes()+runningTime.getMinutes()+30);
			nextTime = newTime.toTimeString().split(":");
			$('#'+id+"6").val(nextTime[0]+":"+nextTime[1]);
			newTime.setHours(newTime.getHours()+runningTime.getHours(),newTime.getMinutes()+runningTime.getMinutes()+30);
			nextTime = newTime.toTimeString().split(":");
			$('#'+id+"7").val(nextTime[0]+":"+nextTime[1]);
			var h = $('#'+id+"1").val().substring(0,2);
			var m = $('#'+id+"1").val().substring(2,4);
			$('#'+id+"1").val("");
			$('#'+id+"1").val(h+":"+m);
		}
	}
	
	//저장버튼
	function check(val){
		switch(val){
			case 1:
				//alert(val);
				//ajax전송id,moivie_seq,starttime,theaterno
				insertTimes(val);
				break;
			case 2:
				insertTimes(val);
				break;
			case 3:
				insertTimes(val);
				break;
			case 4:
				insertTimes(val);
				break;
			case 5:		
				insertTimes(val);
				break;
		}
	}	
	
	//해당 날짜의 시간표 검사
	function selectTimetable(y,m,d){
		for (var int = 1; int < 6; int++) {
			$('#title'+int).val("");
			$('#runningtime'+int).val("");
			$('#title'+int+'Seq').val("영화번호");
			for (var int2 = 1; int2 < 8; int2++) {
				$('#time'+int+"_"+int2).val("");
			}
		}
		$('#date').val("");
		$('#date').val(y+"년"+m+"월"+d+"일");
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
		var screeningday = y+""+month+""+day;
		//var screeningday = y+""+m+""+day;
		//alert(screeningday);
		$.ajax({
			url:'adminSelectTimetable.action',
			type:'POST',
			dataType:'json',
			data:{screeningday:screeningday},
			success: function(json){
				$.each(json.timetableList,function(key,value){				
					switch(value.theaterno){
						case 1: 
							timeno(1,value);
							$('#title1').val(value.title);
							$('#title1Seq').val(value.movie_seq);
							$('#runningtime1').val(value.runningtime);
							break;
						case 2:
							timeno(2,value);
							$('#title2').val(value.title);
							$('#title2Seq').val(value.movie_seq);
							$('#runningtime2').val(value.runningtime);
							break;
						case 3:
							timeno(3,value);
							$('#title3').val(value.title);
							$('#title3Seq').val(value.movie_seq);
							$('#runningtime3').val(value.runningtime);
							break;
						case 4:
							timeno(4,value);
							$('#title4').val(value.title);
							$('#title4Seq').val(value.movie_seq);
							$('#runningtime4').val(value.runningtime);
							break;
						case 5:
							timeno(5,value);
							$('#title5').val(value.title);
							$('#title5Seq').val(value.movie_seq);
							$('#runningtime5').val(value.runningtime);
							break;
					}
				});
			}
		});
	}
	
	function timeno(no,value){
		switch(value.timeno){
			case	1: $('#time'+no+"_1").val(value.starttime);
				break;
			case	2: $('#time'+no+"_2").val(value.starttime);
				break;
			case	3: $('#time'+no+"_3").val(value.starttime);
				break;
			case	4: $('#time'+no+"_4").val(value.starttime);
				break;
			case	5: $('#time'+no+"_5").val(value.starttime);
				break;
			case	6: $('#time'+no+"_6").val(value.starttime);
				break;
			case	7: $('#time'+no+"_7").val(value.starttime);
				break;
		}
	}