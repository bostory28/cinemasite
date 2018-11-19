<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>좌석배정</title>
<link rel="stylesheet" href="../css/theater/theaterViewStyle.css">
<link rel="stylesheet" href="../css/theater/jquery-ui.min.css">
<script type="text/javascript" src="../js/jquery-1.11.2.js"></script>
<script type="text/javascript" src="../js/theater/jquery-ui.min.js"></script>
<script type="text/javascript">
	var teen_su = 0;										//청소년 관람수
	var adult_su = 0;										//어른 관람수
	var varible_total = 0;									//청소년 관람수 + 어른 관람수 좌석을 몇개 선택하느냐에 따라 값인데 변한다.
	var attached_su = 0;									//좌석붙임 수
	//좌석선택 hover에서
	var seat_colornum1 = new Array;							//좌석의 원래 색깔과 번호
	var seat_colornum2 = new Array;							//선택한 좌석을 저장하는 장소
	//관람수 또는 붙임좌석 선택시 
	var pinkArray = new Array;								//pink를 원래 색으로 되돌리기 위해 저장한다.
	var colorArray = new Array;								//pink이외의 색이 빨간색으로 바꾸었을 경우 원래 색으로 되돌리기 위해
	
	var isClick = false;									//클릭했는지 확인한다
	var isSecondTime = false;								//총 관람수가 4개이하 일 때 자리배정시 조건 
	
	var count = 0;											//좌석번호 보기 좋게 정렬하기 위해
	var seatnumForPay = 0;									//값을 지불하기 위해 좌석이 몇자리인지 확인 
	
	$(document).ready(function() {
		$('#reset').button().click(function() {
			var total_su = 0;
			var all_img = $('.seatattach_img');
			for (var i = 0; i < all_img.length; i++) {
				all_img[i].setAttribute('src', '../picture/theater/seatattachednot_'+ parseInt(i+1) +'.png');
			}
			var adult = $('.adult');
			adult[0].setAttribute('src', '../picture/theater/adult_0.png');
			for (var i = 1; i < adult.length; i++) {
				adult[i].setAttribute('src', '../picture/theater/adultnot_'+ i +'.png');
			}
			var teen = $('.teen');
			teen[0].setAttribute('src', '../picture/theater/teen_0.png');
			for (var i = 1; i < teen.length; i++) {
				teen[i].setAttribute('src', '../picture/theater/adultnot_'+ i +'.png');
			}
			attached_su = 0;
			teen_su = 0;
			adult_su = 0;	
			varible_total = 0;
			isFirst = 'yes';
			backInitialize();
			isSecondTime = false;
			//좌석초기화
			document.getElementById('people').innerHTML = teen_su + adult_su+'명';
			document.getElementById('seatname').innerHTML = '&nbsp; &nbsp; &nbsp; &nbsp;';
			document.getElementById('seatno').innerHTML = '&nbsp; &nbsp;';
			//인원초기화
			document.getElementById('people').innerHTML = '';
			count = 0;
			seatnumForPay = 0;
			//결제초기화
			document.getElementById('calculate').innerHTML = '';
			document.getElementById('calculatetotal').innerHTML = '';
			document.getElementById('reserveButton').setAttribute('src', '../picture/theater/paydisable.png');
			document.getElementById('reservehref').setAttribute('href', '#');
			document.getElementById('reservehref').setAttribute('onClick', 'return false;');
		});
		/* 일반 관람수 정하는 부분에서 버튼 클릭시 일반관람수를 정한다. */
		$('.adult').on('click', function() {
			//청소년이 몇명인지 알기 위해
			var teen_su_temp;
			var adult_su_temp;
			var all_teen = $('.teen');
			for (var i = 0; i < all_teen.length; i++) {
				if (all_teen[i].getAttribute('value') == "1") {
					var teen_selected = all_teen[i].getAttribute('src');
					teen_su_temp = parseInt(teen_selected.substring(teen_selected.length-5 , teen_selected.length-4));
					break;
				} 
			}
			//선택한 어른이 몇명인지 검사해서 8보다 크면 예매할 수 없게 한다.
			var adult = $(this).attr('src');
			adult_su_temp = parseInt(adult.substring(adult.length-5 , adult.length-4));
			if (teen_su_temp + adult_su_temp > 8) {
				alert('최대 예매가능 인원은 8명입니다.');
				return;
			} else {
				adult_su = adult_su_temp;
			}
			//8이하이기 때문에 어른의 예매개수를 활성화 시킨다.
			for (var i = adult.length; i > 0; i--) {
				var not = adult.substring(i - 3 , i);
				if (not == 'not') {
					var all = $('.adult');
					for (var j = 0; j < all.length; j++) {
						all[j].setAttribute('src', '../picture/theater/adultnot_'+ j +'.png');
						all[j].setAttribute('value', '0');
					}
					var su = adult.substring(adult.length-5 , adult.length-4);
					$(this).attr('src', '../picture/theater/adult_'+ su +'.png');
					$(this).attr('value', '1');
					break;
				}
			}
			//좌석붙임 자동 선택
			var total_su = teen_su + adult_su;
			var all_img = $('.seatattach_img');
			for (var i = 0; i < all_img.length; i++) {
				all_img[i].setAttribute('src', '../picture/theater/seatattachednot_'+ parseInt(i+1) +'.png');
			}
			if (total_su != 0) {
				if (total_su <= 4) {
					attached_su = total_su;
					all_img[total_su-1].setAttribute('src', '../picture/theater/seatattached_'+attached_su +'.png');
				} else if (total_su == 6 || total_su == 8 || total_su == 7) {
					attached_su = 4;
					all_img[3].setAttribute('src', '../picture/theater/seatattached_'+ attached_su +'.png');
				} else {
					attached_su = 3;
					all_img[2].setAttribute('src', '../picture/theater/seatattached_'+ attached_su +'.png');
				}
			}
			//좌석붙임을 1개로 선택했을 경우에 제한 사항이 발생한다.
			caseAttached();
			backInitialize();
			varible_total = teen_su + adult_su;
			isSecondTime = false;
			//좌석초기화
			document.getElementById('people').innerHTML = teen_su + adult_su+'명';
			document.getElementById('seatname').innerHTML = '&nbsp; &nbsp; &nbsp; &nbsp;';
			document.getElementById('seatno').innerHTML = '&nbsp; &nbsp;';
			count = 0;
			isFirst = 'yes';
			seatnumForPay = 0;
			//결제초기화
			document.getElementById('calculate').innerHTML = '';
			document.getElementById('calculatetotal').innerHTML = '';
			document.getElementById('reserveButton').setAttribute('src', '../picture/theater/paydisable.png');
			document.getElementById('reservehref').setAttribute('href', '#');
			document.getElementById('reservehref').setAttribute('onClick', 'return false;');
		});
		
		
		/* 청소년 관람수 정하는 부분에서 버튼 클릭시 청소년관람수를 정한다. */
		$('.teen').on('click', function() {
			//어른이 몇명인지 알기 위해
			var teen_su_temp;
			var adult_su_temp;
			var all_adult = $('.adult');
			for (var i = 0; i < all_adult.length; i++) {
				if (all_adult[i].getAttribute('value') == "1") {
					var adult_selected = all_adult[i].getAttribute('src');
					adult_su_temp = parseInt(adult_selected.substring(adult_selected.length-5 , adult_selected.length-4));
					break;
				} 
			}
			//선택한 어른이 몇명인지 검사해서 8보다 크면 예매할 수 없게 한다.
			var teen = $(this).attr('src');
			teen_su_temp = parseInt(teen.substring(teen.length-5 , teen.length-4));
			if (teen_su_temp + adult_su_temp > 8) {
				alert('최대 예매가능 인원은 8명입니다.');
				return;
			} else {
				teen_su = teen_su_temp;
			}
			//8이하이기 때문에 청소년의 예매개수를 활성화 시킨다.
			for (var i = teen.length; i > 0; i--) {
				var not = teen.substring(i - 3 , i);
				if (not == 'not') {
					var all = $('.teen');
					for (var j = 0; j < all.length; j++) {
						all[j].setAttribute('src', '../picture/theater/teennot_'+ j +'.png');
						all[j].setAttribute('value', '0');
					}
					var su = teen.substring(teen.length-5 , teen.length-4);
					$(this).attr('src', '../picture/theater/teen_'+ su +'.png');
					$(this).attr('value', '1');
					break;
				}
			}
			//좌석붙임 자동 선택
			var total_su = teen_su + adult_su;
			var all_img = $('.seatattach_img');
			for (var i = 0; i < all_img.length; i++) {
				all_img[i].setAttribute('src', '../picture/theater/seatattachednot_'+ parseInt(i+1) +'.png');
			}
			if (total_su != 0) {
				if (total_su <= 4) {
					attached_su = total_su;
					all_img[total_su-1].setAttribute('src', '../picture/theater/seatattached_'+attached_su +'.png');
				} else if (total_su == 6 || total_su == 8 || total_su == 7) {
					attached_su = 4;
					all_img[3].setAttribute('src', '../picture/theater/seatattached_'+attached_su +'.png');
				} else {
					attached_su = 3;
					all_img[2].setAttribute('src', '../picture/theater/seatattached_'+attached_su +'.png');
				}
			}
			//좌석붙임을 1개로 선택했을 경우에 제한 사항이 발생한다.
			caseAttached();
			backInitialize();
			varible_total = teen_su + adult_su;
			isSecondTime = false;
			//좌석초기화
			document.getElementById('people').innerHTML = teen_su + adult_su+'명';
			document.getElementById('seatname').innerHTML = '&nbsp; &nbsp; &nbsp; &nbsp;';
			document.getElementById('seatno').innerHTML = '&nbsp; &nbsp;';
			count = 0;
			seatnumForPay = 0;
			isFirst = 'yes';
			//결제초기화
			document.getElementById('calculate').innerHTML = '';
			document.getElementById('calculatetotal').innerHTML = '';
			document.getElementById('reserveButton').setAttribute('src', '../picture/theater/paydisable.png');
			document.getElementById('reservehref').setAttribute('href', '#');
			document.getElementById('reservehref').setAttribute('onClick', 'return false;');
		});
		
		//맨처음의 초기상태로 되돌린다.
		function backInitialize() {
			var seat_all = $('.seat');
			if (seat_colornum2 != '') {
				var len = seat_colornum2.length;
				for (var i = 0; i < len; i++) {
					var outside = seat_colornum2.pop();
					for (var j = 0; j < outside.length; j++) {
						var content = outside[j].split('/');
						seat_all[content[0]].setAttribute('src', '../picture/theater/'+ content[1] +'.png');
					}
				}
			}
		}
		
		
		/* 좌석붙임기능 */
		$('.seatattach_img').click(function() {
			total_su = teen_su + adult_su;
			var value = $(this).attr('value');
			//전체 관람수보다 선택한 좌석붙임의 수가 클경우 아무것도 선택하지 못한다.
			if (total_su < value) {
			//전체 관람수가 좌석붙임수보다 클경우
			} else {
				var seat_img = $(this);
				var all_img = $('.seatattach_img');
				if (seat_img.attr('src').substring(seat_img.attr('src').length - 9, seat_img.attr('src').length - 6) == 'not') {
					for (var i = 0; i < all_img.length; i++) {
						all_img[i].setAttribute('src', '../picture/theater/seatattachednot_'+ parseInt(i+1) +'.png');
					}
					attached_su = seat_img.attr('src').substring(seat_img.attr('src').length-5 , seat_img.attr('src').length-4);
					seat_img.attr('src', '../picture/theater/seatattached_'+ attached_su +'.png');
				} 
			}
			//좌석붙임을 1개로 선택했을 경우에 제한 사항이 발생한다.
			caseAttached();
		});
		
		//좌석붙임을 1개로 선택했을 경우에 제한 사항이 발생한다. 또한 3개 경우에는 sweetbox를 이용할 수 없다.
		function caseAttached() {
			//1일 경우 제한사항
			if (attached_su == 1) {
				if (teen_su + adult_su == 1) {
					backOriginalValue();
					var seat_all = $('.seat');
					var col = parseInt(seat_all[0].getAttribute('col'))+1;			//좌석의 컬럼
					var row = parseInt(seat_all[0].getAttribute('row'))+1;			//좌석의 행
					//pink이외의 좌석에 대해서 색깔과 배열번호를을 저장하고 x로 바꾼다.
					for (var i = 0; i < col; i++) {
						if (i % 2 != 0) {
							for (var j = 1; j <= row; j++) {
								if (seat_all[i+(col*j)-col].getAttribute('src').substring(seat_all[i+(col*j)-col].getAttribute('src').length-9, seat_all[i+(col*j)-col].getAttribute('src').length-4) != 'white' && !(seat_all[i+(col*j)-col].getAttribute('src').substring(seat_all[i+(col*j)-col].getAttribute('src').length - 11, seat_all[i+(col*j)-col].getAttribute('src').length - 7) == 'gray' || seat_all[i+(col*j)-col].getAttribute('src').substring(seat_all[i+(col*j)-col].getAttribute('src').length - 10, seat_all[i+(col*j)-col].getAttribute('src').length - 6) == 'gray')) {
									var temp = seat_all[i+(col*j)-col].getAttribute('src').split("/");
									colorArray.push(parseInt(i+(col*j)-col) + '/' +temp[3].split(".", 1));
									seat_all[i+(col*j)-col].setAttribute('src', '../picture/theater/x_' + parseInt(i+1) + '.png');
								}
							}
						}
					}
				}
				//pink에 대해서 pink값과 배열번호를 저장하고 x로 바꾼다.
				seat_all.each(function(index, value) {
					if ($(this).attr('src').substring($(this).attr('src').length - 11, $(this).attr('src').length - 7) == 'pink' || $(this).attr('src').substring($(this).attr('src').length - 10, $(this).attr('src').length - 6) == 'pink' && !($(this).attr('src').substring($(this).attr('src').length - 11, $(this).attr('src').length - 7) == 'gray' || $(this).attr('src').substring($(this).attr('src').length - 10, $(this).attr('src').length - 6) == 'gray')) {
						var temp = seat_all[index].getAttribute('src').split("/");
						pinkArray.push(index+ '/' + temp[3].split(".", 1));
						$(this).attr('src', '../picture/theater/x_' + parseInt(index-parseInt(index/col)*col+1) + '.png');
					}
				});
			//3일경우 제한 사항
			} else if (attached_su == 3){
				backOriginalValue();
				var seat_all = $('.seat');
				var col = parseInt(seat_all[0].getAttribute('col'))+1;			//좌석의 컬럼
				var row = parseInt(seat_all[0].getAttribute('row'))+1;			//좌석의 행
				seat_all.each(function(index, value) {
					if ($(this).attr('src').substring($(this).attr('src').length - 11, $(this).attr('src').length - 7) == 'pink' || $(this).attr('src').substring($(this).attr('src').length - 10, $(this).attr('src').length - 6) == 'pink' && !($(this).attr('src').substring($(this).attr('src').length - 11, $(this).attr('src').length - 7) == 'gray' || $(this).attr('src').substring($(this).attr('src').length - 10, $(this).attr('src').length - 6) == 'gray')) {
						//pink에 대해서 pink값과 배열번호를 저장하고 x로 바꾼다.
						var temp = seat_all[index].getAttribute('src').split("/");
						pinkArray.push(index+ '/' + temp[3].split(".", 1));
						$(this).attr('src', '../picture/theater/x_' + parseInt(index-parseInt(index/col)*col+1) + '.png');
					}
				});
			} else {
				backOriginalValue();
			}
			//관람객의 수가 0일경우에도 원래 화면으로 되돌린다.
			if (teen_su + adult_su == '0') {
				backOriginalValue();
				//좌석초기화
				document.getElementById('seatname').innerHTML = '&nbsp; &nbsp; &nbsp; &nbsp;';
				document.getElementById('seatno').innerHTML = '&nbsp; &nbsp;';
				count = 0;
				seatnumForPay = 0;
				isFirst = 'yes';
				//결제초기화
				document.getElementById('calculate').innerHTML = '';
				document.getElementById('calculatetotal').innerHTML = '';
				document.getElementById('reserveButton').setAttribute('src', '../picture/theater/paydisable.png');
				document.getElementById('reservehref').setAttribute('href', '#');
				document.getElementById('reservehref').setAttribute('onClick', 'return false;');
			}
		}
		//색깔과 index번호를 원래대로 돌린다.
		function backOriginalValue() {
			var pinknum = pinkArray.length;
			var colornum = colorArray.length;
			var seat_all = $('.seat');
			if (pinknum != 0) {
				for (var i = 0; i < pinknum; i++) {
					var originalvalue = pinkArray.pop().split('/');
					seat_all[parseInt(originalvalue[0])].setAttribute('src', '../picture/theater/'+ originalvalue[1] +'.png');
				}
			}
			if (colornum != 0) {
				for (var i = 0; i < colornum; i++) {
					var originalvalue = colorArray.pop().split('/');
					seat_all[parseInt(originalvalue[0])].setAttribute('src', '../picture/theater/'+ originalvalue[1] +'.png');
				}
			}
		}
		
		//hover시 빨간색으로 좌석을 바꾼다.
		$('.seat').hover(function(event) {
			if (seat_colornum1 != null) {
				seat_colornum1 = new Array;
			}
			//좌석의 수를 선택하지 않았을 때는 반응하지 않는다. 그리고 다시 관람수를 0으로 하면 attached_su을 0으로 맞추어야 한다.
			if(attached_su != 0 && teen_su + adult_su != 0) {
				var seat_selected = $(this);
				var seat_num = seat_selected.attr('src').substring(seat_selected.attr('src').length-6,seat_selected.attr('src').length-4);		//10이상의 숫자를 가져오기 위해
				if (isNaN(seat_num)) {
					seat_num = seat_selected.attr('src').substring(seat_selected.attr('src').length-5,seat_selected.attr('src').length-4);		//10미만의 숫자를 가져오기 위해
				}
				//흰색 또는 x좌석의 부분은 hover 시에도 건드리지 않는다.
				if (!isNaN(seat_num) && !(seat_selected.attr('src').substring(seat_selected.attr('src').length - 7, seat_selected.attr('src').length - 6) == 'x' || seat_selected.attr('src').substring(seat_selected.attr('src').length - 8, seat_selected.attr('src').length - 7) == 'x')) {
					//전체에서 hover한 객체를 찾기 위해
					var seat_all = $('.seat');
					var col = parseInt(seat_all[0].getAttribute('col'))+1;			//좌석의 컬럼
					seat_all.each(function(index, value) {
						if (seat_selected.is(value)) {
							//붙임좌석 수만큼 좌석을 선택가능해 진다.
							for (var i = 0; i < attached_su; i++) {
								//선택한 또는 붙임좌석에서 col수보다 크면 에러가 나므로 현재좌석까지만 빨간색으로 바꾸고 else에서 정지한다.
								if (seat_all[index + i].getAttribute('src').substring(seat_all[index + i].getAttribute('src').length-6,seat_all[index + i].getAttribute('src').length-4) != col) {
									//선택한 또는 붙임좌석에서 숫자가 나오면 빨간색으로 만들고 white가 나올 경우 또는 x좌석일 경우 else로 붙임좌석을 정지한다.
									if (!isNaN(seat_all[index + i].getAttribute('src').substring(seat_all[index + i].getAttribute('src').length-5,seat_all[index + i].getAttribute('src').length-4)) && !(seat_all[index + i].getAttribute('src').substring(seat_all[index + i].getAttribute('src').length - 7, seat_all[index + i].getAttribute('src').length - 6) == 'x' || seat_all[index + i].getAttribute('src').substring(seat_all[index + i].getAttribute('src').length - 8, seat_all[index + i].getAttribute('src').length - 7) == 'x') ) {
										seat_num = seat_all[index + i].getAttribute('src').substring(seat_all[index + i].getAttribute('src').length-6, seat_all[index + i].getAttribute('src').length-4)		//10이상의 숫자를 가져오기 위해
										//10보다 큰 수 중에서 gray를 찾아서 gray일 경우 break를 해서 멈춘다.
										if (!isNaN(seat_num)) {
											if (seat_all[index + i].getAttribute('src').substring(seat_all[index + i].getAttribute('src').length-11, seat_all[index + i].getAttribute('src').length-7) != 'gray') {
												//색깔과 번호가 무엇인지 구한다.
												var temp = seat_all[index + i].getAttribute('src').split("/");
												seat_colornum1[i] = parseInt(index + i) + '/' + temp[3].split(".", 1);
												seat_all[index + i].setAttribute('src', '../picture/theater/red_' + parseInt((index-(col*parseInt(index/col))) + i + 1) +'.png');
											} else {
												break;
											}
										//10보다 작은 수 중에서 gray를 찾아서 gray일 경우 break를 해서 멈춘다.
										} else {
											if (seat_all[index + i].getAttribute('src').substring(seat_all[index + i].getAttribute('src').length-10, seat_all[index + i].getAttribute('src').length-6) != 'gray') {
												//색깔과 번호가 무엇인지 구한다.
												var temp = seat_all[index + i].getAttribute('src').split("/");
												seat_colornum1[i] = parseInt(index + i) + '/' + temp[3].split(".", 1);
												seat_all[index + i].setAttribute('src', '../picture/theater/red_' + parseInt((index-(col*parseInt(index/col))) + i + 1) +'.png');
											} else {
												break;
											}
										}
									} else {
										break;
									}
								} else {
									//색깔과 번호가 무엇인지 구한다.
									var temp = seat_all[index + i].getAttribute('src').split("/");
									seat_colornum1[i] = parseInt(index + i) + '/' + temp[3].split(".", 1);
									seat_all[index + i].setAttribute('src', '../picture/theater/red_' + parseInt((index-(col*parseInt(index/col))) + i + 1) +'.png');
									break;
								}
							}
						}
					});
				}
			} else {
				attached_su = 0;
			}
		//hover가 아닐 시 좌석을 원래 좌석으로 바꾼다.
		}, function() {
			//좌석의 수를 선택하지 않았을 때는 반응하지 않는다.
			if(attached_su != 0) {
				var seat_all = $('.seat');					//전체좌석
				var seat_selected = $(this);				//선택한 좌석
				var seat_num = seat_selected.attr('src').substring(seat_selected.attr('src').length-6,seat_selected.attr('src').length-4);		//10이상의 숫자를 가져오기 위해
				if (isNaN(seat_num)) {
					seat_num = seat_selected.attr('src').substring(seat_selected.attr('src').length-5,seat_selected.attr('src').length-4);		//10미만의 숫자를 가져오기 위해
				}
				seat_all.each(function(index, value) {
					var col = parseInt(seat_all[index].getAttribute('col'))+1;			//좌석의 컬럼
					if (seat_selected.is(value)) {
						//hover를 안 할 때 white인 것에는 반응하지 않도록 
						if (!isNaN(seat_num)) {
							for (var i = 0; i < attached_su; i++) {
								//col개수보다 큰 것에 대해서 에러가 나지 않게 막는다.
								if (seat_all[index + i].getAttribute('src').substring(seat_all[index + i].getAttribute('src').length-6,seat_all[index + i].getAttribute('src').length-4) != col) {
									//숫자가 아닌 즉 white인 것에 대해서 피한다.
									if (!isNaN(seat_all[index + i].getAttribute('src').substring(seat_all[index + i].getAttribute('src').length-5,seat_all[index + i].getAttribute('src').length-4)) && !(seat_all[index + i].getAttribute('src').substring(seat_all[index + i].getAttribute('src').length - 7, seat_all[index + i].getAttribute('src').length - 6) == 'x' || seat_all[index + i].getAttribute('src').substring(seat_all[index + i].getAttribute('src').length - 8, seat_all[index + i].getAttribute('src').length - 7) == 'x') && !(seat_all[index + i].getAttribute('src').substring(seat_all[index + i].getAttribute('src').length - 10, seat_all[index + i].getAttribute('src').length - 6) == 'gray' || seat_all[index + i].getAttribute('src').substring(seat_all[index + i].getAttribute('src').length - 11, seat_all[index + i].getAttribute('src').length - 7) == 'gray') && !(isClick == true)) {
										seat_num = seat_all[index + i].getAttribute('src').substring(seat_all[index + i].getAttribute('src').length-6, seat_all[index + i].getAttribute('src').length-4)		//10이상의 숫자를 가져오기 위해
										//10보다 큰 수에 대해서 gray인지 확인하고 gray라면 원래대로 되돌리는 것을 그만둔다. 그리고break
										if (!isNaN(seat_num)) {
											var seat_color = seat_colornum1[i].split('/');		//좌석의 배열번호와 색깔이 담겨있다.
											if (seat_all[index + i].getAttribute('src').substring(seat_all[index + i].getAttribute('src').length-11, seat_all[index + i].getAttribute('src').length-7) != 'gray') {
												seat_all[index + i].setAttribute('src', '../picture/theater/' + seat_color[1] +'.png');
											} else {
												break;
											}
										//10보다 작은 수에 대해서 gray인지 확인하고 gray라면 원래대로 되돌리는 것을 그만둔다.
										} else {
											var seat_color = seat_colornum1[i].split('/');		//좌석의 배열번호와 색깔이 담겨있다.
											if (seat_all[index + i].getAttribute('src').substring(seat_all[index + i].getAttribute('src').length-10, seat_all[index + i].getAttribute('src').length-6) != 'gray') {
												seat_all[index + i].setAttribute('src', '../picture/theater/' + seat_color[1] +'.png');
											} else {
												break;
											}
										}
										//보통의 경우 빨간색으로 좌석이 변한 것을 원래대로 되돌린다.
										var seat_color = seat_colornum1[i].split('/');		//좌석의 배열번호와 색깔이 담겨있다.
										seat_all[index + i].setAttribute('src', '../picture/theater/' + seat_color[1] +'.png');
									} else {
										if (isClick == true) {
											isClick = false;
										}
										break;
									}
								} else {
									if (!(seat_all[index + i].getAttribute('src').substring(seat_all[index + i].getAttribute('src').length - 7, seat_all[index + i].getAttribute('src').length - 6) == 'x' || seat_all[index + i].getAttribute('src').substring(seat_all[index + i].getAttribute('src').length - 8, seat_all[index + i].getAttribute('src').length - 7) == 'x')) {
										var seat_color = seat_colornum1[i].split('/');		//좌석의 배열번호와 색깔이 담겨있다.
										seat_all[index + i].setAttribute('src', '../picture/theater/' + seat_color[1] +'.png');
									}
									break;
								}
							}
						}
					}
				});
			}
		});
		var isFirst = 'yes';
		//클릭을 하면 좌석이 선택된다.
		$('.seat').click(function() {
			if (teen_su + adult_su != 0) {
				isClick = true;
				//4이하의 자리붙임을 하기 위한 조건
				if (teen_su + adult_su == seat_colornum1.length && isSecondTime == true) {
					varible_total = 0;
				}
				//클릭했을 때 전체수에서 좌석붙임의 수를 연산해서 총좌석의 수와 같게 한다.
				if (varible_total != 0 && (!(varible_total <= 4 && varible_total > seat_colornum1.length) || isFirst == 'yes')) {
					if (varible_total > seat_colornum1.length) {
						seat_colornum2.push(seat_colornum1);
						varible_total = varible_total - seat_colornum1.length;
						attached_su = varible_total;
						if (varible_total > 4) {
							attached_su = 4;
						}
						//좌석붙임 자동이동
						var all_img = $('.seatattach_img');
						for (var i = 0; i < all_img.length; i++) {
							all_img[i].setAttribute('src', '../picture/theater/seatattachednot_'+ parseInt(i+1) +'.png');
						}
						all_img[attached_su - 1].setAttribute('src', '../picture/theater/seatattached_'+ attached_su +'.png');
					} else {
						seat_colornum2.push(seat_colornum1);
						varible_total = varible_total - seat_colornum1.length;
						isSecondTime = true;
						isFirst = 'no';
					}
					getSeatInfo();			//좌석정보가져오기
				} else {
					if (!confirm('좌석을 바꾸시겠습니까?')) {
						var seat_all = $('.seat');
						for(var i = 0; i < seat_colornum1.length; i++) {
							var seat_original = seat_colornum1[i].split('/');
							seat_all[seat_original[0]].setAttribute('src', '../picture/theater/'+ seat_original[1] +'.png');
						}
						
						return;
					}
					//자리를 바꾸면 결제못하게
					document.getElementById('reserveButton').setAttribute('src', '../picture/theater/paydisable.png');
					document.getElementById('reservehref').setAttribute('href', '#');
					document.getElementById('reservehref').setAttribute('onClick', 'return false;');
					
					backInitialize();
					seat_colornum2.push(seat_colornum1);
					varible_total = teen_su + adult_su;
					//4이상의 자리를 배정할 때
					if (varible_total != seat_colornum1.length) {
						varible_total = varible_total - seat_colornum1.length;
						attached_su = varible_total;
						if (varible_total > 4) {
							attached_su = 4;
						}
					//4이하의 자리를 배정할 때
					} else {
						attached_su = varible_total;
					}
					//좌석붙임 자동이동
					var all_img = $('.seatattach_img');
					for (var i = 0; i < all_img.length; i++) {
						all_img[i].setAttribute('src', '../picture/theater/seatattachednot_'+ parseInt(i+1) +'.png');
					}
					all_img[attached_su - 1].setAttribute('src', '../picture/theater/seatattached_'+ attached_su +'.png');
					document.getElementById('seatname').innerHTML = '&nbsp; &nbsp; &nbsp;&nbsp;';
					document.getElementById('seatno').innerHTML = '&nbsp; &nbsp;';
					count = 0;
					seatnumForPay = 0;
					
					getSeatInfo();			//좌석정보가져오기
				}
				//결제페이지로 넘기기 위해 결제 버튼을 활성화한다. 그리고 form에 필요한 값을 넣는다.
				if (seatnumForPay == teen_su + adult_su) {
					//결제버튼 활성화
					document.getElementById('reserveButton').setAttribute('src', '../picture/theater/payable.png');
					//필요한 값을 form에 넘김다.					
					document.getElementById('peoplenum').setAttribute('value', teen_su + adult_su);
					var seat_no = seat_colornum1[0].split('/');
					var aprice = 0;
					if (seat_no[1].substring(0, 4) == 'pink') {
						aprice = 15000;
					} else {
						aprice = 9000;
					}
					document.getElementById('price').setAttribute('value', (teen_su + adult_su) * aprice);
					document.getElementById('seatnostr').setAttribute('value', $('#seatno').text());
					document.getElementById('seattitle').setAttribute('value', $('#seatname').text());
					document.getElementById('reservehref').setAttribute('href', 'javascript:submit();');
					document.getElementById('reservehref').removeAttribute('onClick');
				}
			}
		});
		
		
		//좌석정보 가져오기
		function getSeatInfo() {
			var seat_all = $('.seat');
			var alpabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
			var col = parseInt(seat_all[0].getAttribute('col'))+1;			//좌석의 컬럼
			var row = parseInt(seat_all[0].getAttribute('row'))+1;			//좌석의 행
			//좌석정보를 가져오기
			if (document.getElementById('seatselect') != null) {
				document.getElementById('seatselect').remove();															//좌석선택 제거
				document.getElementById('seatnametitle').setAttribute('style', 'visibility: visible; float: left;');	//좌석이름 보이게
				document.getElementById('seatnotitle').setAttribute('style', 'visibility: visible;  float: left;');		//좌석번호명 보이게
				document.getElementById('parentseatno').setAttribute('style', 'float: left;');		//좌석번호명 보이게
			}
			//좌석번호
			for (var i = 0; i < seat_colornum1.length; i++) {
				var seat_no = seat_colornum1[i].split('/');															//좌석의 고유번호
				var seat_rowalpabet = alpabet.charAt(parseInt(seat_no[0] / col));									//좌석의 행 알파벳
				var seat_colnum = seat_no[0] - parseInt(seat_no[0] / col) * col + 1;								//좌석의 열 번호
				if (i != seat_colornum1.length - 1 || (varible_total != 0 && teen_su + adult_su >= 5) || (varible_total != 0 && !(varible_total == adult_su + teen_su))) {
					document.getElementById('seatno').innerHTML += seat_rowalpabet + seat_colnum + ', ';
					if (count == 2) {
						document.getElementById('seatno').innerHTML += '<br>&nbsp; &nbsp;';
						count = -1;
					}
					count++;
				} else {
					document.getElementById('seatno').innerHTML += seat_rowalpabet + seat_colnum;
				}
			}
			//좌석이름
			var seat_name = '';
			if (seat_no[1].substring(0, 4) == 'blac') {
				seat_name = '일반석';
			} else if (seat_no[1].substring(0, 4) == 'pink') {
				seat_name = 'SWEETBOX';
			} else if (seat_no[1].substring(0, 4) == 'gree') {
				seat_name = '장애인석';
			} else if (seat_no[1].substring(0, 4) == 'prim') {
				seat_name = 'Prime Zone';
			} 
			document.getElementById('seatname').innerHTML = '&nbsp; &nbsp; &nbsp;&nbsp;' + seat_name;
			
			//가격출력
			document.getElementById('calculate').setAttribute('style', 'visibility: visible; text-align: left;');
			document.getElementById('calculatetotal').setAttribute('style', 'visibility: visible; text-align: left;');
			seatnumForPay += seat_colornum1.length;
			if (seat_no[1].substring(0, 4) != 'pink') {
				var commanum = commaNum(9000 * seatnumForPay);
				document.getElementById('calculate').innerHTML = '일반&nbsp; &nbsp &nbsp; 9,000원 x ' + seatnumForPay;
				document.getElementById('calculatetotal').innerHTML = '총금액&nbsp; &nbsp;<b style="color: red;">' + commanum + '원</b>';
			} else {
				var commanum = commaNum(15000 * seatnumForPay);
				document.getElementById('calculate').innerHTML = '일반&nbsp; &nbsp; 15,000 x ' + seatnumForPay;
				document.getElementById('calculatetotal').innerHTML = '총금액&nbsp; &nbsp;<b style="color: red;">' + commanum + '원</b>';
			}
		} 
		
		//1000단위로 ,를 찍는 함수
		function commaNum(num) {  
		    var len, point, str;  
		
		    num = num + "";  
		    point = num.length % 3  
		    len = num.length;  
		
		    str = num.substring(0, point);  
		    while (point < len) {  
		        if (str != "") str += ",";  
		        str += num.substring(point, point + 3);  
		        point += 3;  
		    }  
		    return str;  
		}  
	});
	
	function submit() {
		theaterSubmit.submit(); 
	}
</script>
</head>
<body>
<!--***** 헤더 인클루딩 *****-->
<jsp:include page="../include/header.jsp"/>
<!--***** 헤더 인클루딩 *****-->
	<table align="center" style="background-color: #F2F0E5;">
		<tr>
			<td>
			<table>
				<tr>
					<td colspan="4" style="text-align: center; letter-spacing: -2px; width: 1024px; height: 30px; background-color: #333333; color: #C1C1C1; font-weight: bold;">
					인원 / 좌석
				</tr>
				<tr>
					<!-- 관람객 수 -->
					<td style="width: 216px; height: 70px; letter-spacing: -3px">
					<table>
						<tr>
							<td><span style="line-height:40%"><br></span>
							<table>
								<tr>
									<td>일반
									<td>
									<a href="#" onclick="return false;"><img class="adult" src="../picture/theater/adult_0.png" value="1" width="20" height="20"></a>
									<a href="#" onclick="return false;"><img class="adult" src="../picture/theater/adultnot_1.png" value="0" width="20" height="20"></a>
									<a href="#" onclick="return false;"><img class="adult" src="../picture/theater/adultnot_2.png" value="0" width="20" height="20"></a>
									<a href="#" onclick="return false;"><img class="adult" src="../picture/theater/adultnot_3.png" value="0" width="20" height="20"></a>
									<a href="#" onclick="return false;"><img class="adult" src="../picture/theater/adultnot_4.png" value="0" width="20" height="20"></a>
									<a href="#" onclick="return false;"><img class="adult" src="../picture/theater/adultnot_5.png" value="0" width="20" height="20"></a>
									<a href="#" onclick="return false;"><img class="adult" src="../picture/theater/adultnot_6.png" value="0" width="20" height="20"></a>
									<a href="#" onclick="return false;"><img class="adult" src="../picture/theater/adultnot_7.png" value="0" width="20" height="20"></a>
									<a href="#" onclick="return false;"><img class="adult" src="../picture/theater/adultnot_8.png" value="0" width="20" height="20"></a>
								</tr>
								<tr>
									<td>청소년
									<td>
									<a href="#" onclick="return false;"><img class="teen" src="../picture/theater/teen_0.png" value="1" width="20" height="20"></a>
									<a href="#" onclick="return false;"><img class="teen" src="../picture/theater/teennot_1.png" value="0" width="20" height="20"></a>
									<a href="#" onclick="return false;"><img class="teen" src="../picture/theater/teennot_2.png" value="0" width="20" height="20"></a>
									<a href="#" onclick="return false;"><img class="teen" src="../picture/theater/teennot_3.png" value="0" width="20" height="20"></a>
									<a href="#" onclick="return false;"><img class="teen" src="../picture/theater/teennot_4.png" value="0" width="20" height="20"></a>
									<a href="#" onclick="return false;"><img class="teen" src="../picture/theater/teennot_5.png" value="0" width="20" height="20"></a>
									<a href="#" onclick="return false;"><img class="teen" src="../picture/theater/teennot_6.png" value="0" width="20" height="20"></a>
									<a href="#" onclick="return false;"><img class="teen" src="../picture/theater/teennot_7.png" value="0" width="20" height="20"></a>
									<a href="#" onclick="return false;"><img class="teen" src="../picture/theater/teennot_8.png" value="0" width="20" height="20"></a>
								</tr>
							</table>
						</tr>
					</table>
					<!-- 좌석붙임 -->
					<td style="width: 266px; height: 70px; letter-spacing: -3px">
					<span style="line-height:40%"><br></span>
					좌석 붙임 설정
					<table>
						<tr>
							<td>
							<span style="line-height:30%"><br></span>
							<a href="#" onclick="return false;"><img src="../picture/theater/seatattachednot_1.png" class="seatattach_img" id="attached_1" value="1" height="20"></a>
							<a href="#" onclick="return false;"><img src="../picture/theater/seatattachednot_2.png" class="seatattach_img" id="attached_2" value="2" height="20"></a>
							<a href="#" onclick="return false;"><img src="../picture/theater/seatattachednot_3.png" class="seatattach_img" id="attached_3" value="3" height="20"></a>
							<a href="#" onclick="return false;"><img src="../picture/theater/seatattachednot_4.png" class="seatattach_img" id="attached_4" value="4" height="20"></a>
						</tr>
					</table>
					<!-- 선택한 영화관 -->
					<td style="width: 226px; height: 70px; letter-spacing: -3px">
						선택하신 상영관/시간<br><span style="line-height:30%"><br></span> 
						<b style="font-size: 17px">제&nbsp;<s:property value="theatervo.theaterno"/>&nbsp;상영관</b>
						<span style="font-size: 13px; letter-spacing: -1px;">(총&nbsp;<s:property value="theatervo.seatnum"/>석,&nbsp;잔여&nbsp;<s:property value="theatervo.seatremained"/>석)</span>
						&nbsp;&nbsp;
						<b style="letter-spacing: -1px; font-size: 17px;"><s:property value="theatervo.starttime"/></b>
						<span style="font-size: 13px; letter-spacing: -1px;">(<s:property value="theatervo.runningtime"/>분)</span>
					<!-- 다른 시간대 -->
					<td style="width: 100px; height: 70px; letter-spacing: -3px" align="right">
					<button id="reset">reset</button> 
				</tr>
				<tr>
					<td colspan="3">
						<!-- 영화관 좌석 -->
						<table align="center" style="margin-top: 20px" >
							<tr>
								<td style="height: 400px; vertical-align: top;">
									<img src="../picture/theater/screen.png"><br><br>
									<table align="center">
										<s:iterator status="status" begin="0" end="rows">
										<tr>
											<td class="row_title"><s:property value="row_alpabet[#status.index]"/>
											<s:iterator value="list_theater" status="stat" begin="0" end="cols">
												<s:if test="list_theater[(#status.index*colvalue)+(#stat.index)].seatno != null">
													<s:if test="list_theater[(#status.index*colvalue)+(#stat.index)].userid == null">
														<s:if test="list_theater[(#status.index*colvalue)+(#stat.index)].seattype == 1">
															<td><img class="seat" row="<s:property value="rows"/>" col="<s:property value="cols"/>" src="../picture/theater/prime_<s:property value="colseat+1"/>.png" width="20px">
														</s:if>
														<s:elseif test="list_theater[(#status.index*colvalue)+(#stat.index)].seattype == 2">
															<td><img class="seat" row="<s:property value="rows"/>" col="<s:property value="cols"/>" src="../picture/theater/green_<s:property value="colseat+1"/>.png" width="20px">
														</s:elseif>
														<s:elseif test="list_theater[(#status.index*colvalue)+(#stat.index)].seattype == 3">
															<td><img class="seat" row="<s:property value="rows"/>" col="<s:property value="cols"/>" src="../picture/theater/pink_<s:property value="colseat+1"/>.png" width="20px">
														</s:elseif>
														<s:else>
															<td><img class="seat" row="<s:property value="rows"/>" col="<s:property value="cols"/>" src="../picture/theater/black_<s:property value="colseat+1"/>.png" width="20px">
														</s:else>
													</s:if>
													<s:else>
														<td><img class="seat" row="<s:property value="rows"/>" col="<s:property value="cols"/>" src="../picture/theater/gray_<s:property value="colseat+1"/>.png" width="20px">
													</s:else>
												</s:if>
												<s:else>
													<td><img class="seat" row="<s:property value="rows"/>" col="<s:property value="cols"/>" src="../picture/theater/white.png" width="20px">
												</s:else>
											</s:iterator>
										</tr>
										</s:iterator>
									</table>
							</tr>
						</table>
					<td>
					<!-- 좌석배치 예제 -->
					<table>
						<tr>
							<td><img src="../picture/theater/red.png" width="20px">
							<td style="font-size: 17px; letter-spacing: -1px;">선택
						</tr>
						<tr>
							<td><img src="../picture/theater/gray.png" width="20px">
							<td style="font-size: 17px; letter-spacing: -1px;">예매완료
						</tr>
						<tr>
							<td><img src="../picture/theater/x.png" width="20px">
							<td style="font-size: 17px; letter-spacing: -1px;">선택불가
						</tr>
						<tr><td><br></tr>
						<tr>
							<td><img src="../picture/theater/prime.png" width="20px">
							<td style="font-size: 17px; letter-spacing: -1px;">Prime Zone
						</tr>
						<tr>
							<td><img src="../picture/theater/black.png" width="20px">
							<td style="font-size: 17px; letter-spacing: -1px;">일반석
						</tr>
						<tr>
							<td><img src="../picture/theater/green.png" width="20px">
							<td style="font-size: 17px; letter-spacing: -1px;">장애인석
						</tr>
						<tr>
							<td><img src="../picture/theater/pink.png" width="20px">
							<td style="font-size: 17px; letter-spacing: -1px;">SWEETBOX
						</tr>
					</table>
				</tr>
			</table>
		</tr>
	</table>

	<!-- 영화정보 -->
	<div style="width: 100%; text-align: right; background-color: #1D1D1C; color: #CCCCCC; letter-spacing: -1px; height: 130px; clear: none;">
		<div style="padding-top: 10px; margin: 0 auto; width: 1080px;">
			<div style="float: left; padding-right: 30px;"><a href="../time/goTimetable.action?timetable_seq=<s:property value="timetable_seq"/>"><img src="../picture/theater/moviechoice.png"></a></div>
			<div style="float: left; padding-right: 20px;"><img width="80" src="../picture/poster/<s:property value="theatervo.poster"/>"></div>
			<div style="float: left; padding-right: 30px; width: 150px; text-align: left;">
				<div><s:property value="theatervo.title"/></div>
				<s:if test="theatervo.rate == 19">
					<div>청소년 관람불가</div>
				</s:if>
				<s:elseif test="theatervo.rate == 0">
					<div>전체관람가</div>
				</s:elseif>
				<s:else>
					<div><s:property value="theatervo.rate"/>세 관람가</div>
				</s:else>
			</div>
			<div style="float: left; padding-right: 30px; width: 150px; text-align: left;">
				<div>극장&nbsp; &nbsp; <b>HKC</b></div>
				<div>일시&nbsp; &nbsp; <b><s:property value="theatervo.screeningday"/>&nbsp;<s:property value="theatervo.starttime"/></b></div>
				<div>장소&nbsp; &nbsp; <b>제<s:property value="theatervo.theaterno"/>&nbsp;상영관</b></div>
				<div>인원&nbsp; &nbsp; <b id="people"></b></div>
			</div>
			<div style="float: left; padding-right: 30px; width: 170px;">
				<div style="font-size: 25px; padding-top: 30px; color: #8D8D8D; width: 150px;" id="seatselect" > > 좌석선택</div>
				<div id="seatnametitle" style="visibility: hidden;">좌석명</div>
				<div id="seatname" style="font-weight: bold; text-align: left;">&nbsp; &nbsp; &nbsp;&nbsp;</div>
				<div id="seatnotitle" style="visibility: hidden;">좌석번호</div>
				<div id="parentseatno">
					<div id="seatno" style="font-weight: bold; text-align: left;">&nbsp; &nbsp;</div>
				</div>
			</div>
			<div style="float: left; padding-right: 30px; width: 150px">
				<div id="calculate" style="visibility: hidden;"></div>
				<div id="calculatetotal" style="visibility: hidden;"></div>
				<div>&nbsp;</div>
			</div>
			<form name="theaterSubmit" action="../reserve/reserveView.action" method="post">
				<input type="hidden" id="seatnostr" name="seatnostr">
				<input type="hidden" id="seattitle" name="seattitle">
				<input type="hidden" id="timetable_seq" name="reservevo.timetable_seq" value="${timetable_seq }">
				<input type="hidden" id="userid" name="reservevo.userid" value="#session.Loginid">
				<input type="hidden" id="price" name="reservevo.price" value="">
				<input type="hidden" id="title" name="reservevo.title" value="${theatervo.title }">
				<input type="hidden" id="peoplenum" name="reservevo.peoplenum" value="">
				
				<input type="hidden" id="titlemovie" name="theatervo.title" value="<s:property value="theatervo.title"/>">
				<input type="hidden" id="poster" name="theatervo.poster" value="<s:property value="theatervo.poster"/>">
				<input type="hidden" id="rate" name="theatervo.rate" value="<s:property value="theatervo.rate"/>">
				<input type="hidden" id="starttime" name="theatervo.starttime" value="<s:property value="theatervo.starttime"/>">
				<input type="hidden" id="screeningday" name="theatervo.screeningday" value="<s:property value="theatervo.screeningday"/>">
				<input type="hidden" id="theaterno" name="theatervo.theaterno" value="<s:property value="theatervo.theaterno"/>">
				<div style="text-align: left; float: left;"><a id="reservehref" href="#" onClick="return false;"><img id="reserveButton" src="../picture/theater/paydisable.png"></a></div>
			</form>
		</div>
	</div>
	
	
	<br>
<!--***** 푸터 인클루딩 *****-->
<jsp:include page="../include/footer.jsp"/>
<!--***** 푸터 인클루딩 *****-->
</body>
</html>