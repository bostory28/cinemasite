<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제</title>
<link rel="stylesheet" href="../css/reserve/reserveViewStyle.css">
<script type="text/javascript" src="../js/jquery-1.11.2.js"></script>
<script type="text/javascript" src="../js/theater/jquery-ui.min.js"></script>
<script type="text/javascript">
	//할인권
	var couponDiscount = 0;												//총 쿠폰할인금액  <----
	var advanceHtml = '';												//coupon에 들어가는 html
	var couponSearch = '';												//coupon에서 검색하는 일련번호
	var couponSearchArray = new Array();								//검색한 결과를 임시로 보관해서 성공한 것에 대해서 두번 적용 못하게하기 위해
	var couponInfo = ''													//쿠폰의 정보
	//포인트
	var pointUser = 0;													//개인의 포인트를 저장  
	var pointDiscount = 0;												//본인이 원하는 포인트량  <----
	var pointHtml = '';
	//가격
	var totalPrice = '<s:property value="reservevo.price"/>';
	var option = 'card';
	//좌석
	var seat = '<s:property value="seatnostr"/>';
	
	var isPhone = 'no';
	
	$(document).ready(function() {
		//좌석 정렬
		$('#seatno').html(function() {
			var seatArray = seat.split(',');
			var seatStr = '&nbsp; &nbsp;';
			for (var i = 1; i <= seatArray.length; i++) {
				if (i % 3 != 0) {
					if (i != seatArray.length) {
						seatStr += seatArray[i-1]+',';
					} else {
						seatStr += seatArray[i-1];
					}
				} else {
					if (i != seatArray.length) {
						seatStr += seatArray[i-1]+',<br>&nbsp; &nbsp;';
					} else {
						seatStr += seatArray[i-1];
					}
				}
			}
			return seatStr;
		});
		
		//결제 총 금액
		$('#totalPrice').html(commaNum(totalPrice) + '원');
		
		//실제 결제 금액
		$('#calForRealprice').html(commaNum(totalPrice) + '원');
		
		$('#realprice').html(commaNum(totalPrice) + '원');
		//클릭했을 때 경우
		$('#check-1').click(couponView());
		$('#check-2').click(pointView());
		
		//초기화
		$('#reset').click(function() {
			couponDiscount = 0;
			pointDiscount = 0;
			couponInfo = '';
			couponSearchArray = new Array();
			
			document.getElementById('pointWanted').value = '';
			document.getElementById('couponSearch').value = '';
			
			$('#couponInfo').html(couponInfo);
			$('#couponDiscount').html('할인금액 : <b style="color:#9B3D20;">'+ couponDiscount +'원</b>');
			$('#pointDiscount').html(couponDiscount +'원');
			
			showDetailDiscount();
			
		});
		
		//결제 수단 초기
		$('#payMethodContent').html(function() {
			creditCardContent();
		});
		//결제 수단 선택시
		$('.paymethod').change(function() {
			var paymethod = document.getElementsByName('paymethod');
			for (var i = 0; i < paymethod.length; i++) {
				if (paymethod[i].checked == true && paymethod[i].value == 'card') {
					option = 'card';
					creditCardContent();
					isPhone == 'no';
				} else if (paymethod[i].checked == true && paymethod[i].value == 'phone') {
					option = 'phone';
					phoneContent();
					isPhone = 'yes';
				}
			}
		});
		
		//신용카드 결제 내용
		function creditCardContent() {
			var contentPayment = '';
			contentPayment += '<table style="font-size: 15px;">';
			contentPayment += '<tr><td align="right" style="height: 35px; width: 100px;">카드종류<td>&nbsp; &nbsp;<select style="font-size: 15px; height: 30px;" id="cardname"><option value="우리카드">우리카드<option value="삼성카드">삼성카드<option value="현대카드">현대카드<option value="농협카드">농협카드<option>기업카드</select></tr>';
			contentPayment += '<tr><td align="right" style="height: 35px; width: 100px;">카드번호<td>&nbsp; &nbsp;<input type="text" style="width:60px; height: 25px;" id="firstcard">&nbsp;-&nbsp;<input type="text" style="width:60px; height: 25px;" id="secondcard">&nbsp;-&nbsp;<input type="text" style="width:60px; height: 25px;" id="thirdcard">&nbsp;-&nbsp;<input type="text" style="width:60px; height: 25px;" id="forthcard"></tr>';
			contentPayment += '<tr><td align="right" style="height: 35px; width: 100px;">비밀번호<td>&nbsp; &nbsp;<input type="password" style="width:40px; height: 25px;" id="password">&nbsp;<b>* *</b></tr>';
			contentPayment += '<tr><td align="right" style="height: 35px; width: 100px;">유효기간<td>&nbsp; &nbsp;<input type="text" style="width:40px; height: 25px;" id="month">&nbsp;<b>월</b>&nbsp;<input type="text" style="width:40px; height: 25px;" id="year">&nbsp;<b>년</b> &nbsp; &nbsp;<spen style="color: #7A7A7A;">예)<span style="font-size: 13px;">&nbsp; &nbsp;2015년 9월 -> 09월 15년</span></span></tr>';
			contentPayment += '<tr><td align="right" style="height: 35px; width: 100px;">법정생년월일<td>&nbsp; &nbsp;<input type="text" style="width:98px; height: 25px;" id="birthday">&nbsp;-&nbsp;<b>*&nbsp;*&nbsp;*&nbsp;*&nbsp;*&nbsp;*&nbsp;*</b></tr>';
			$('#payMethodContent').html(contentPayment);
			//자동넘기기
			$('#firstcard').keyup(function() {
				var firstcard = $('#firstcard').val();
				if (firstcard.length >= 4) {
					$('#firstcard').val(firstcard.substring(0, 4));
					$('#secondcard').focus();
					$('#secondcard').select();
				}
			});
			$('#secondcard').keyup(function() {
				var secondcard = $('#secondcard').val();
				if (secondcard.length >= 4) {
					$('#secondcard').val(secondcard.substring(0, 4));
					$('#thirdcard').focus();
					$('#thirdcard').select();
				}
			});
			$('#thirdcard').keyup(function() {
				var thirdcard = $('#thirdcard').val();
				if (thirdcard.length >= 4) {
					$('#thirdcard').val(thirdcard.substring(0, 4));
					$('#forthcard').focus();
					$('#forthcard').select();
				}
			});
			$('#forthcard').keyup(function() {
				var forthcard = $('#forthcard').val();
				if (forthcard.length >= 4) {
					$('#forthcard').val(forthcard.substring(0, 4));
					$('#password').focus();
					$('#password').select();
				}
			});
			$('#password').keyup(function() {
				var password = $('#password').val();
				if (password.length >= 2) {
					$('#password').val(password.substring(0, 2));
					$('#month').focus();
					$('#month').select();
				}
			});
			$('#month').keyup(function() {
				var month = $('#month').val();
				if (month.length >= 2) {
					$('#month').val(month.substring(0, 2));
					$('#year').focus();
					$('#year').select();
				}
			});
			$('#year').keyup(function() {
				var year = $('#year').val();
				if (year.length >= 2) {
					$('#year').val(year.substring(0, 2));
					$('#birthday').focus();
					$('#birthday').select();
				}
			});
			$('#birthday').keyup(function() {
				var birthday = $('#birthday').val();
				if (birthday.length > 6) {
					$('#birthday').val(birthday.substring(0, 6));
				}
			});
		}
		
		//핸드폰 결제 내용
		function phoneContent() {
			var contentPayment = '';
			contentPayment += '<table style="font-size: 15px;">';
			contentPayment += '<tr><td align="right" style="height: 35px; width: 100px;">결제금액<td><b style="font-size: 20px;">&nbsp; &nbsp;'+ commaNum(parseInt(totalPrice - pointDiscount - couponDiscount)) +'원</b></tr>';
			contentPayment += '<tr><td align="right" style="height: 35px; width: 100px;">상품명<td>&nbsp; &nbsp;영화티켓예매</tr>';
			contentPayment += '<tr><td align="right" style="height: 35px; width: 100px;">통신사 선택<td>&nbsp; &nbsp;<input type="radio" name="company" checked="checked" value="SKT">SKT&nbsp; &nbsp;<input type="radio" name="company" value="KT">KT&nbsp; &nbsp;<input type="radio" name="company" value="LGU+">LGU+&nbsp; &nbsp;</tr>';
			contentPayment += '<tr><td align="right" style="height: 35px; width: 100px;">휴대폰 번호<td>&nbsp; &nbsp;<select style="font-size: 15px; height: 30px;" id="firstphone"><option value="010">010<option value="011">011<option value="019">019</select>&nbsp;-&nbsp;<input type="text" style="width:60px; height: 25px;" id="secondphone">&nbsp;-&nbsp;<input type="text" style="width:60px; height: 25px;" id="thirdphone"></tr>';
			contentPayment += '<tr><td align="right" style="height: 35px; width: 100px;">주민등록번호<td>&nbsp; &nbsp;<input type="text" style="width:98px; height: 25px;" id="registration">&nbsp;-&nbsp;<b>*&nbsp;*&nbsp;*&nbsp;*&nbsp;*&nbsp;*&nbsp;*</b></tr>';
			$('#payMethodContent').html(contentPayment);
			
			//자동넘기기
			$('#secondphone').keyup(function() {
				var secondphone = $('#secondphone').val();
				if (secondphone.length >= 4) {
					$('#secondphone').val(secondphone.substring(0, 4));
					$('#thirdphone').focus();
					$('#thirdphone').select();
				}
			});
			$('#thirdphone').keyup(function() {
				var thirdphone = $('#thirdphone').val();
				if (thirdphone.length >= 4) {
					$('#thirdphone').val(thirdphone.substring(0, 4));
					$('#registration').focus();
					$('#registration').select();
				}
			});
			$('#registration').keyup(function() {
				var registration = $('#registration').val();
				if (registration.length > 6) {
					$('#registration').val(registration.substring(0, 6));
				}
			});
		}
		
		
		/* 포인트화면을 띄워준다. */
		function pointView() {
			pointUser = '<s:property value="membervo.point"/>';
			pointHtml += '<div style="text-align:left;">현재 내 포인트 : <b style="color:#9B3D20;">'+ pointUser +' point</b></div><br>';
			pointHtml += '<div style="height:50px; text-align:left; border-bottom: 1px dashed; black;"><input type="text" id="pointWanted" style="height: 23px; width: 100px;">&nbsp;&nbsp;<button id="pointButton">사용하기</button>&nbsp;<button id="notPointButton">사용하지않기</button></div>';
			pointHtml += '<div style="width="100%""><div style="text-align:right; font-size:13px; margin-top:20px;">할인금액 : <b style="color:#9B3D20; font-size:15px;" id="pointDiscount">'+ pointDiscount +'원</b></div>';
			$('#point').html(pointHtml);
			
			$('#pointButton').click(function() {
				var pointwanted = $('#pointWanted').val();
				if (pointwanted <= parseInt(pointUser) && pointwanted >= 1000 && pointwanted <= 2000) {
					pointDiscount = $('#pointWanted').val();
					$('#pointDiscount').text(commaNum(pointDiscount)+ '원');
				} else {
					document.getElementById('pointWanted').select();
					document.getElementById('pointWanted').focus();
					alert('1,000point이상 2000point이하 사용 가능합니다..\n또한 현재 내 포인트인' + commaNum(pointUser) + '을 넘을 수 없습니다.');
				}
				showDetailDiscount();							//할인내역을 출력한다.
				if (isPhone == 'yes') {
					phoneContent();
				}
			});
			
			$('#notPointButton').click(function() {
				pointDiscount = 0;
				$('#pointDiscount').text('0원');
				document.getElementById('pointWanted').value = '';
				showDetailDiscount();							//할인내역을 출력한다.
				if (isPhone == 'yes') {
					phoneContent();
				}
			});
		}
		
		/* 쿠폰검색 뷰 */
		function couponView() {
			advanceHtml += '<div style="text-align:left;">쿠폰조회</div><br>';
			advanceHtml += '<div style="height:50px; text-align:left; border-bottom: 1px dashed; black;"><input type="text" id="couponSearch" style="height: 23px; width: 250px;">&nbsp;&nbsp;<button id="couponButton">조회/적용</button></div>';
			advanceHtml += '<div style="text-align:right; margin-top:20px; font-size:13px;"><table id="couponInfo" style="border-collapse: collapse;"></table><div>';
			advanceHtml += '<div style="width="100%""><div style="text-align="right"" id="couponDiscount">할인금액 : <b style="color:#9B3D20; font-size:15px;">'+ couponDiscount +'원</b></div>';
			$('#advance').html(advanceHtml);
			//조회와 적용버튼 클릭 시
			$('#couponButton').click(function() {
				couponSearch = $('#couponSearch').val();
				for (var i = 0; i < couponSearchArray.length; i++) {
					if (couponSearchArray[i] == couponSearch) {
						alert('이미 적용된 쿠폰입니다.');
						return;
					}
				}
				couponSearchArray.push(couponSearch);		//검색내용을 배열에 저장한다.
				outputCouponList();							//배열에 저장된 내용을 리스트로 출력한다.
				setTimeout(showDetailDiscount ,500);
				if (isPhone == 'yes') {
					setTimeout(phoneContent ,500);
				}
			});
		}
		
		/* 할인내역을 보여준다. */
		function showDetailDiscount() {
			//할인내역과 실제 결제금액을 보여준다.
			if (couponDiscount == 0 && pointDiscount == 0) {
				$('#couponpoint').html('');
				$('#couponpoint').attr('style', '');
				$('#couponpointframe').attr('style', 'height: 35px; background-color:#F9F8F6; border-top: 2px solid black; font-weight:bold;');
				$('#totalsale').html(commaNum(parseInt(couponDiscount)+parseInt(pointDiscount)) + '원');
				
				$('#calForRealpriceFrame').attr('style', 'height: 35px; background-color:#F9F8F6; border-top: 2px solid black; font-weight:bold;');
				$('#calForRealprice').html(totalPrice + '원');
				$('#realprice').html(totalPrice + '원');
				return;
			}
			if (couponDiscount == 0) {
				$('#couponpoint').html(commaNum(pointDiscount)+'원(포인트)');
				$('#couponpoint').attr('style', 'font-size:20px; color:#9B3D20; margin-top:5px;');
				$('#couponpointframe').attr('style', 'height: 60px; background-color:#F9F8F6; border-top: 2px solid black; font-weight:bold;');
				
				$('#calForRealpriceFrame').attr('style', 'height: 60px; background-color:#F9F8F6; border-top: 2px solid black; font-weight:bold;');
				$('#calForRealprice').html(totalPrice + '원&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>-&nbsp;' + commaNum(pointDiscount) +'원(포인트)');
			}
			if (pointDiscount == 0) {
				$('#couponpoint').html(commaNum(couponDiscount)+'원(쿠폰)');
				$('#couponpoint').attr('style', 'font-size:20px; color:#9B3D20; margin-top:5px;');
				$('#couponpointframe').attr('style', 'height: 70px; background-color:#F9F8F6; border-top: 2px solid black; font-weight:bold;');
				
				$('#calForRealpriceFrame').attr('style', 'height: 60px; background-color:#F9F8F6; border-top: 2px solid black; font-weight:bold;');
				$('#calForRealprice').html(totalPrice + '원&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br>-&nbsp;' + commaNum(couponDiscount) +'원(쿠폰)');
			}
			if (pointDiscount != 0 && couponDiscount != 0) {
				$('#couponpoint').html(commaNum(couponDiscount) +'원(쿠폰)<br>+&nbsp;' + commaNum(pointDiscount) +'원(포인트)');
				$('#couponpoint').attr('style', 'font-size:20px; color:#9B3D20; margin-top:5px;');
				$('#couponpointframe').attr('style', 'height: 90px; background-color:#F9F8F6; border-top: 2px solid black; font-weight:bold;');
				
				$('#calForRealpriceFrame').attr('style', 'height: 70px; background-color:#F9F8F6; border-top: 2px solid black; font-weight:bold;');
				$('#calForRealprice').html(totalPrice + '원&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br>-&nbsp;' + commaNum(couponDiscount) +'원(쿠폰)&nbsp; &nbsp;&nbsp;<br>-&nbsp;'+ commaNum(pointDiscount) +'원(포인트)');
			}
			$('#totalsale').html(commaNum(parseInt(couponDiscount)+parseInt(pointDiscount)) + '원');
			$('#realprice').html(commaNum(parseInt(totalPrice)-parseInt(couponDiscount)-parseInt(pointDiscount)) + '원');
		}
		
		/* 쿠폰의 리스트를 출력한다. */
		function outputCouponList() {
			couponInfo = '<tr align="center" style="font-size:20px; height:40px;"><td style="border-bottom: 3px solid #bcbcbc; width: 120px;">상품권명<td style="border-bottom: 3px solid #bcbcbc; width: 150px;">일련번호<td style="border-bottom: 3px solid #bcbcbc; width: 200px;">유효기간<td style="border-bottom: 3px solid #bcbcbc; width: 120px;">할인금액<td style="border-bottom: 3px solid #bcbcbc; width: 120px;">할인취소</tr>';
			couponDiscount = 0;
			for (var i = 0; i < couponSearchArray.length; i++) {
				$.ajax({
					url:'isCouponInfo.action',
					type:'post',
					dataType:'json',
					data:{couponSearch:couponSearchArray[i]},
					success:function(data) {
						if (data.reservevo != null) {
							//쿠폰의 정보
							couponInfo += '<tr align="center"><td style="height:35px;">'+  data.reservevo.ticketname +'<td>'+ data.reservevo.advanceno +'<td>'+ data.reservevo.startdate.substring(0,10) +'~'+ data.reservevo.expirationdate.substring(0,10) +'<td>'+ data.reservevo.discount + '원<td><input type="button" value="취소하기" class="cancelCouponBtn" advanceno="'+ data.reservevo.advanceno +'"></tr>';
							$('#couponInfo').html(couponInfo);
							
							//모든 쿠폰의 값을 합친 할인가격
							couponDiscount += data.reservevo.discount;
							$('#couponDiscount').html('<br>할인금액 : <b style="color:#9B3D20; font-size:15px;">'+ commaNum(couponDiscount) +'원</b>');
							
							//취소하기 버튼을 클릭했을 경우
							$('.cancelCouponBtn').click(outputCancelCouponList);
						} else {
							couponSearchArray.pop();					//존재하지 않은 일련번호라면 배열에서 제거한다.
							alert('존재하는 쿠폰이 없습니다.');
						}
					}		
				});
			}
		}
		
		//취소버튼을 클릭했을 경우 배열 안에 있는 리스트를 출력한다.
		function outputCancelCouponList() {
			var cancelCouponNo = $(this).attr('advanceno');
			couponDiscount = 0;											//이전에 더해진 할인금액을 초기화시킨다.
			for (var i = 0; i < couponSearchArray.length; i++) {
				if (couponSearchArray[i] == cancelCouponNo) {
					couponSearchArray.splice(i, 1);
					couponInfo = '';
					for (var i = 0; i < couponSearchArray.length; i++) {
						couponInfo = '<tr align="center" style="font-size:20px; height:40px;"><td style="border-bottom: 3px solid #bcbcbc; width: 120px;">상품권명<td style="border-bottom: 3px solid #bcbcbc; width: 150px;">일련번호<td style="border-bottom: 3px solid #bcbcbc; width: 200px;">유효기간<td style="border-bottom: 3px solid #bcbcbc; width: 120px;">할인금액<td style="border-bottom: 3px solid #bcbcbc; width: 120px;">할인취소</tr>';
						$.ajax({
							url:'isCouponInfo.action',
							type:'post',
							dataType:'json',
							data:{couponSearch:couponSearchArray[i]},
							success:function(data) {
								couponInfo += '<tr align="center"><td style="height:35px;">'+  data.reservevo.ticketname +'<td>'+ data.reservevo.advanceno +'<td>'+ data.reservevo.startdate.substring(0, 10) +'~'+ data.reservevo.expirationdate.substring(0, 10) +'<td>'+ data.reservevo.discount + '원<td><input type="button" value="취소하기" class="cancelCouponBtn" advanceno="'+ data.reservevo.advanceno +'"></tr>';
								$('#couponInfo').html(couponInfo);
								couponDiscount += data.reservevo.discount;
								$('#couponDiscount').html('<br>할인금액 : <b style="color:#9B3D20; font-size:15px;">'+ commaNum(couponDiscount) +'원</b>');
								$('.cancelCouponBtn').click(outputCancelCouponList);
							}
						});
					}
					$('#couponInfo').html(couponInfo);
					$('#couponDiscount').html('할인금액 : <b style="color:#9B3D20;">'+ couponDiscount +'원</b>');
					setTimeout(showDetailDiscount ,500);
					if (isPhone == 'yes') {
						setTimeout(phoneContent ,500);
					}
					return;
				}
			}
		}
		
		//1000단위 컴마를 찍는다.
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
		
		//카드, 핸드폰 정보를 확인하고 맞으면 결제한다.
		$('#submit').click(function() {
			/* 카드로 결제 시 */
			if (option == 'card') {
				$('#cardsort').val($("#cardname option:selected").val());
				$('#cardnum').val($('#firstcard').val()+''+$('#secondcard').val()+''+$('#thirdcard').val()+''+$('#forthcard').val());
				$('#passwordconfirm').val($('#password').val());
				$('#expirationdate').val($('#month').val()+'/'+$('#year').val());
				$('#birthdayCard').val($('#birthday').val());
				$.ajax({
					url:'correctCardInfo.action',
					type:'post',
					dataType:'json',
					data:$('#cardForm').serialize(),
					contentType:'application/x-www-form-urlencoded; charset=UTF-8',	
					success:function(data) {
						if (data.isExist != true) {
							alert('카드정보가 잘못 되었습니다.');
							return;
						}
						$('#seatnostr').val(seat);
						$('#usedpoint').val(pointDiscount);
						$('#saleticket').val(couponDiscount);
						$('#price').val(parseInt(totalPrice-pointDiscount-couponDiscount));
						$('#optionpay').val(option);
						$('#advancenoforupdate').val(couponSearchArray);
						$('#pointforupdate').val(pointDiscount);
						reserveCompleteForm.action = '../reserve/reserveComplete.action';
						reserveCompleteForm.submit();
					}
				});
			/* 핸드폰으로 결제 시 */
			} else {
				$('#phonenum').val($("#firstphone option:selected").val() + $('#secondphone').val() + $('#thirdphone').val());
				$('#company').val($('input:radio[name="company"]:checked').val());
				$('#birthdayPhone').val($('#registration').val());
				$.ajax({
					url:'correctPhoneInfo.action',
					type:'post',
					dataType:'json',
					data:$('#phoneForm').serialize(),
					contentType:'application/x-www-form-urlencoded; charset=UTF-8',	
					success:function(data) {
						if (data.isExist != true) {
							alert('핸드폰정보가 잘못 되었습니다.');
							return;
						}
						$('#seatnostr').val(seat);
						$('#usedpoint').val(pointDiscount);
						$('#saleticket').val(couponDiscount);
						$('#price').val(parseInt(totalPrice-pointDiscount-couponDiscount));
						$('#optionpay').val(option);
						$('#advancenoforupdate').val(couponSearchArray);
						$('#pointforupdate').val(pointDiscount);
						reserveCompleteForm.action = '../reserve/reserveComplete.action';
						reserveCompleteForm.submit();
					}
				});
			}
		});
	});
	
	/* 영화좌석으로 되돌아가기 위해 */
	function theaterSubmit() {
		theaterForm.action = '../theater/theaterView.action';
		theaterForm.submit(); 
	}
</script>
</head>
<body>
<!--***** 헤더 인클루딩 *****-->
<jsp:include page="../include/header.jsp"/>
<!--***** 헤더 인클루딩기타포 *****-->
<br>

	<div style="width: 100%; text-align: center;">
		<!-- 결제수단과 할인혜택 -->
		<div style="margin: 0 auto; width: 1024px;">
			<div id="container" style="float: left; width: 740px; margin-right: 10px; border: 2px solid black; border-radius: 10px;">
				<!--  할인혜택 -->
				<div style="background-color: #333333; width: 740px; display: table-cell; vertical-align:middle; height: 30px; color: #ffffff; font-weight: bold; text-align: left;">
					<div style="text-align: center;">
						<div>
							<div style="text-align: left; font-size: 15px; float: left; width: 100px;">
								&nbsp; &nbsp; &nbsp;STEP1
							</div>
							할인수단 선택
							<div style="text-align: left; font-size: 15px; color: white; float: right;  width: 100px;">
								<a href="#" onclick="return false;" style="color: white; text-decoration: none;" id="reset">다시하기</a>
							</div>
						</div>
					</div>
				</div>
				<section id="accordion">
					<div>
						<input type="checkbox" id="check-1" />
						<label for="check-1" style="text-align: left; height: 30px; margin-top: 5px;">기타관람권/할인쿠폰</label>
						<article>
							<p id="advance"></p>
						</article>
					</div>
					<div>
						<input type="checkbox" id="check-2" />
						<label for="check-2" style="text-align: left; height: 30px;">포인트</label>
						<article>
							<p id="point"></p>
						</article>
					</div>
				</section>
				<span style="line-height:65%"><br></span>
				<!-- 결제수단과 -->
				<div style="background-color: #333333; width: 740px; display: table-cell; vertical-align:middle; height: 30px; color: #ffffff; font-weight: bold; text-align: left;">
					<div style="text-align: center;">
						<div>
							<div style="text-align: left; font-size: 15px; float: left; width: 100px;">
								&nbsp; &nbsp; &nbsp;STEP2
							</div>
							결제정보입력
							<div style="text-align: left; font-size: 15px; color: white; float: right;  width: 100px;">
								<a href="#" onclick="return false;" style="color: white; text-decoration: none;">다시하기</a>
							</div>
						</div>
					</div>
				</div>
				<div style="border: 3px solid #DFDED6;">
					<div style="background-color: #EEEEEE; height: 30px; text-align: left;">
						&nbsp; &nbsp;<input type="radio" name="paymethod" class="paymethod" value="card" checked="checked">신용카드결제
								     <input type="radio" name="paymethod" class="paymethod" value="phone">핸드폰결제
					</div>
					<div id="payMethodContent" style="text-align: left; background-color: #EEEEEE;"></div>
				</div>
			</div>
				
			
			<!-- 결제할 내역 -->
			<div style="width: 270px; float: left;">
				<div style="border: 3px solid black; border-radius: 10px; ">
					<div style="height: 35px; font-weight:bold;">
						<span style="line-height:40%"><br></span>결제하실 금액
					</div>
					<div style="background-color: #474747; width: 266px; height: 40px; font-size: 25px; color: #ffffff; display:table-cell; vertical-align: middle;">
						<b id="totalPrice"></b>
					</div>
				</div><br>
				<div style="border: 3px solid black; background-color:#D9E7EB; border-radius: 10px; ">
					<div style="height: 35px; font-weight:bold;">
						<span style="line-height:40%"><br></span>할인내역
					</div>
					<div id="couponpointframe" style="height: 35px; background-color:#F9F8F6; border-top: 2px solid black; font-weight:bold;">
						<span style="line-height:40%"><br></span>총할인금액
						<span style="line-height:40%"><br></span>
						<div id="couponpoint"></div>
					</div>
					<div style="background-color: #474747; width: 266px; height: 40px; font-size: 25px; color: #ffffff; display:table-cell; vertical-align: middle;">
						<b id="totalsale"></b>
					</div>
				</div><br>
				<div style="border: 3px solid black; border-radius: 10px;">
					<div style="height: 35px; background-color:#F0EBD2; font-weight:bold;">
						<span style="line-height:40%"><br></span>결제내역
					</div>
					<div style="height: 35px; background-color:#F9F8F6; border-top: 2px solid black; font-weight:bold;" id="calForRealpriceFrame">
						<span style="line-height:40%"><br></span>
						<div id="calForRealprice"></div>
					</div>
					<div style="height: 35px; background-color:#F9F8F6; border-top: 2px solid black; font-weight:bold;">
						<span style="line-height:40%"><br></span>남은 결제금액
					</div>
					<div style="background-color: #474747; width: 266px; height: 40px; font-size: 25px; color: #ffffff; display:table-cell; vertical-align: middle;">
						<b id="realprice">원</b>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<div style=" clear: left;"><span style="line-height:40%;"><br></span></div>
	<!-- 영화정보 -->
	<div style="width: 100%; background-color: #1D1D1C; color: #CCCCCC; letter-spacing: -1px; height: 130px; clear: left;">
		<div style="margin: 0 auto; width: 1020px; padding-top: 10px;">
			<div style="float: left; padding-right: 30px;"><a href="javascript:theaterSubmit()"><img src="../picture/reserve/seatselect.png"></a></div>
			<form name="theaterForm" method="post">
				<input type="hidden" name="timetable_seq" value="${reservevo.timetable_seq}">
			</form>
			<div style="float: left; padding-right: 20px;"><img width="80" src="../picture/poster/<s:property value="theatervo.poster"/>"></div>
			<div style="float: left; padding-right: 30px; width: 150px">
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
			<div style="float: left; padding-right: 30px; width: 150px">
				<div>극장&nbsp; &nbsp; <b>HKC</b></div>
				<div>일시&nbsp; &nbsp; <b><s:property value="theatervo.screeningday"/>&nbsp;<s:property value="theatervo.starttime"/></b></div>
				<div>장소&nbsp; &nbsp; <b>제<s:property value="theatervo.theaterno"/>&nbsp;상영관</b></div>
				<div>인원&nbsp; &nbsp; <b id="people"><s:property value="reservevo.peoplenum"/>명</b></div>
			</div>
			<div style="float: left; padding-right: 30px; width: 170px;">
				<div id="seatnametitle">좌석명 <b><s:property value="seattitle"/></b></div>
				<div id="seatnotitle" style="float: left;">좌석번호</div>
				<div id="parentseatno" style="float: left;">
					<div id="seatno" style="font-weight: bold;"></div>
				</div>
			</div>
			<!-- 신용카드결제 -->
			<form id="cardForm">
				<input type="hidden" id="cardsort" name="creditcardvo.cardsort" value="">
				<input type="hidden" id="cardnum" name="creditcardvo.cardnum" value="">
				<input type="hidden" id="passwordconfirm" name="creditcardvo.password" value="">
				<input type="hidden" id="expirationdate" name="creditcardvo.expirationdate" value="">
				<input type="hidden" id="birthdayCard" name="creditcardvo.birthday" value="">
			</form>
			<!-- 폰결제 -->
			<form id="phoneForm">
				<input type="hidden" id="phonenum" name="phonevo.phonenum" value="">
				<input type="hidden" id="company" name="phonevo.company" value="">
				<input type="hidden" id="birthdayPhone" name="phonevo.birthday" value="">
			</form>
			<!-- 결제 시 넘길 정보 -->
			<form name="reserveCompleteForm" method="post">
				<input type="hidden" id="seatnostr" name="seatnostr">
				<input type="hidden" id="timetable_seq" name="reservevo.timetable_seq" value="<s:property value="reservevo.timetable_seq"/>">
				<input type="hidden" id="userid" name="reservevo.userid" value="<s:property value="#session.LoginId"/>">
				<input type="hidden" id="usedpoint" name="reservevo.usedpoint" value="">
				<input type="hidden" id="saleticket" name="reservevo.saleticket" value="">
				<input type="hidden" id="price" name="reservevo.price" value="">
				<input type="hidden" id="optionpay" name="reservevo.optionpay" value="">
				<input type="hidden" id="title" name="reservevo.title" value="<s:property value="reservevo.title"/>">
				<input type="hidden" id="peoplenum" name="reservevo.peoplenum" value="<s:property value="reservevo.peoplenum"/>">
				<input type="hidden" id="theaterno" name="reservevo.theaterno" value="<s:property value="theatervo.theaterno"/>">
				<input type="hidden" id="poster" name="theatervo.poster" value="<s:property value="theatervo.poster"/>">
				
				<input type="hidden" id="advancenoforupdate" name="advanceno" value="">
				<input type="hidden" id="pointforupdate" name="point" value="">
			</form>
			<div><a href="#" onClick="return false;" id="submit"><img src="../picture/reserve/payment.png" ></a></div>
		</div>
	</div>
	
<br>
<!--***** 푸터 인클루딩 *****-->
<jsp:include page="../include/footer.jsp"/>
<!--***** 푸터 인클루딩 *****-->
</body>
</html>