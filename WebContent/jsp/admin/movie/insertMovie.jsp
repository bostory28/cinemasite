<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:include page="../../include/header.jsp"/>

<div class="container marketing">
<h3>영화등록</h3>
	<form action="insertMovie" method="post" enctype="multipart/form-data">
		<div style="width: 100%; text-align: center;">
			<div style="width: 1024px; text-align: center; margin: 0 auto; padding-top: 10px; padding-bottom: 10px;">
					<div align="center">
						<table>
							<tr>
								<td>제목
								<td><input type="text" size="88" name="movieVo.title" value="">
							</tr>
							<tr>
								<td>장르
								<td><input type="text" size="88" name="movieVo.genre" value="">
							</tr>
							<tr>
								<td>감독
								<td><input type="text" size="88" name="movieVo.director" value="">
							</tr>
							<tr>
								<td>배우
								<td><input type="text" size="88" name="movieVo.actors" value="">
							</tr>
							<tr>
								<td>국가
								<td><input type="text" size="88" name="movieVo.nation" value="">
							</tr>
							<tr>
								<td>런닝타임
								<td><input type="text" size="88" name="movieVo.runningtime" value="">
							</tr>
							<tr>
								<td>등급
								<td><input type="text" size="88" name="movieVo.rate" value="">
							</tr>
							<tr>
								<td>상영일
								<td><input type="text" size="88" name="movieVo.openingday" value="">
							</tr>
							<tr>
								<td>종영일
								<td><input type="text" size="88" name="movieVo.closingday" value="">
							</tr>
							<tr>
								<td>제작날짜
								<td><input type="text" size="88" name="movieVo.madeday" value="">
							</tr>
							<tr>
								<td>라이센스
								<td><input type="text" size="88" name="movieVo.license" value="">
							</tr>
						</table>
					</div>
				<div align="center">
					<table>
						<tr>
							<td>포스터
							<td>
								<img width="70" src="" id="poster_img">
								<input type="file" name="upload_poster" value="찾아보기" id="poster_btn" />
						</tr>
						<tr>
							<td>스틸샷
							<td>
								<img width="200" src="" id="stillshot_img">
								<input type="file" name="upload_stillshot" value="찾아보기" id="stillshot_btn" />
						</tr>
					</table>
				</div>
				<div align="center">
					<table>
						<tr>
							<td>스토리
							<td><textarea cols="90" rows="10" name="movieVo.story"></textarea> 
						</tr>
						<tr style="text-align: right;">
							<td colspan="2">
								<input type="submit" value="등록">
						</tr>
					</table>
				</div>
			</div>
		</div>
	</form>
</div>	
<jsp:include page="../../include/footer.jsp"/>

<script type="text/javascript">
	$(document).ready(function() {
		$('#poster_btn').change(function() {
			var input = document.getElementById("poster_btn");
			var fReader = new FileReader();
			fReader.readAsDataURL(input.files[0]);
			fReader.onloadend = function(event){
			var img = document.getElementById("poster_img");
	
			img.src = event.target.result;
			}
		});
		$('#stillshot_btn').change(function() {
			var input = document.getElementById("stillshot_btn");
			var fReader = new FileReader();
			fReader.readAsDataURL(input.files[0]);
			fReader.onloadend = function(event){
			var img = document.getElementById("stillshot_img");

			img.src = event.target.result;
			}
		});
	});
</script>