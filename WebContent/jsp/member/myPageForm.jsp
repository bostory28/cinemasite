<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--  글꼴 설정 -->
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	* {
	font-family : 'Nanum Gothic';
	}
</style>

<script type="text/javascript">
	/*예매취소 확인*/
	function cancleReservation(no,price){
		if (!confirm('예매를 취소하시겠습니까?')) {
			return false;
		}
		var point = price/10;
		location.href="cancleReservation.action?reservationno="+no+"&point="+point;
	}
</script>
	<jsp:include page="../include/header.jsp" />
<div class="container marketing">
<h3>마이페이지</h3>
	<table align="center">
		<tr>
			<td>
				<s:form name="myPageform" action="goPass_cnfForm.action"
					method="post" theme="simple">
					<h3 style="font-family: 'Nanum Gothic';font-weight: bold">내 정보</h3>
					<div style="background-color: #FFF; width: 850px">
						<table 
							style="width: 750px; margin: 20px 20px 20px 20px; font-family: 'Nanum Gothic';">
							<tr>
								<td><div
										style="margin:10px 10px 10px 10px; font-family: 'Nanum Gothic'; font-size: 25px; font-weight: bold">
										<s:property value="membervo.name" />
										님
									</div>									
							</tr>
							<tr>
								<td  height="20" colspan="2"><s:property value="membervo.name" />님의 등급은
									일반회원입니다.									
									<hr></td>
							</tr>
							<tr >
								<td width="50%">아이디</td>
								<td width="50%"><s:property value="membervo.userid" /></td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td><s:property value="membervo.phone" /></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><s:property value="membervo.email" /></td>
							</tr>
							<tr>
								<td>가용포인트</td>
								<td><s:property value="membervo.point" /></td>
							</tr>
						</table>
						<span style="line-height: 1%;"><br></span>
					</div>
					<br>
					<div align="right">
						<s:submit style="font-family: 'Nanum Gothic';" value="내 정보 수정" />
					</div>
				</s:form>
			</td>
		</tr>
		<tr>
			<td>
			<h3 style="font-family: 'Nanum Gothic';font-weight: bold">나의 예매정보</h3>
				<div
					style="background-color: #FFF; width: 850px; font-family: 'Nanum Gothic';padding-top: 10px;padding-bottom: 10px;">
					
					<table 
						style="width: 750px; margin: 20px 20px 20px 20px; font-family: 'Nanum Gothic';">
						<tr>
							<th align="center" width="10%">영화</th>
							<th align="center" width="15%">예매번호</th>
							<th align="center" width="20%">영화제목</th>
							<th align="center" width="15%">일시</th>
							<th align="center" width="20%">상영관 정보</th>
							<th align="center" width="20%">매수(좌석)</th>
						</tr>
						<tr>
							<td colspan="6"><hr></td>
						</tr>
						<s:iterator value="reservelist" status="status1">
							<s:form name="myPageform" action="cancleReservation.action"
								method="get" theme="simple">
								<tr>
									<td align="center" style="margin: 5px 5px 5px 5px"><img src="<%=request.getContextPath()%>/picture/poster/<s:property value="reservelist[#status1.index].poster"/>" width="50" height="75" ></td>
									<td align="center"><s:property
											value="reservelist[#status1.index].reservationno" /></td>
									<td align="center"><s:property value="reservelist[#status1.index].title" /></td>
									<td align="center"><s:property
											value="reservelist[#status1.index].screeningday" />&nbsp;&nbsp;
											 <s:property
											value="reservelist[#status1.index].starttime" />
											 </td>
									<td align="center">제 <s:property
											value="reservelist[#status1.index].theaterno" /> 상영관</td>
									<td align="center"><s:property
											value="reservelist[#status1.index].price" /> 원</td>
									<td align="center"><s:property
											value="reservelist[#status1.index].peoplenum" /> 매 ( <s:property
											value="reservelist[#status1.index].seatno" />)</td>
									<td align="center">
										<input type="button" style="font-family: 'Nanum Gothic';" onClick="cancleReservation('<s:property
													value="reservelist[#status1.index].reservationno" />','<s:property
											value="reservelist[#status1.index].price" />');"
										value="예매취소" name="cancle"></td>
								</tr>
							</s:form>

						</s:iterator>
					</table>
				</div>
	</table>
	<br>
</div>

<div>
	<jsp:include page="../include/footer.jsp" />
</div>