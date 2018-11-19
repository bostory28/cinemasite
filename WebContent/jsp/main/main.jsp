<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--***** 헤더 인클루딩 *****-->
<jsp:include page="../include/header.jsp"/>
<!--***** 헤더 인클루딩 *****-->
<script type="text/javascript">
$(document).ready(function(){
	$(window).resize(function(){
		$('.carousel-inner').find('img').each(function(){
			 if($(this).width() > $(window).width()){
				 $(this).removeAttr("width").removeAttr("height").css("max-width","100%");
			 }
		});
	});
});
</script>
<style id="holderjs-style" type="text/css">.holderjs-fluid {font-size:16px;font-weight:bold;text-align:center;font-family:sans-serif;margin:0}</style>

<div id="myCarousel" class="carousel slide">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="item active">
      <img src="<%=request.getContextPath()%>/picture/poster/Kingsman2015_stillshot.jpg" data-src="holder.js/1024x500/auto/#777:#7a7a7a/text:Second slide" alt="Second slide" style="height: 500px;  display: block; ">
      <div class="container">
        <div class="carousel-caption">
          <h1>킹스맨:시크릿 에이전트</h1>
          <p>Kingsman: The Secret Service, 2015</p>
          <p><a class="btn btn-large btn-primary" href="time/goTimetableList.action">예매하기</a></p>
        </div>
      </div>
    </div>
    <div class="item">
      <img src="<%=request.getContextPath()%>/picture/poster/TheImitationGame2014_stillshot.jpg" data-src="holder.js/1024x500/auto/#777:#7a7a7a/text:Second slide" alt="Second slide" style="height: 500px;  display: block;">
      <div class="container">
        <div class="carousel-caption">
          <h1>이미테이션게임</h1>
          <p>The Imitation Game, 2014</p>
          <p><a class="btn btn-large btn-primary" href="time/goTimetableList.action">예매하기</a></p>
        </div>
      </div>
    </div>
    <div class="item">
      <img src="<%=request.getContextPath()%>/picture/poster/jo2014_stillshot.jpg" data-src="holder.js/1024x500/auto/#777:#7a7a7a/text:Third slide" alt="Third slide" style="height: 500px; display: block;">
      <div class="container">
        <div class="carousel-caption">
          <h1>조션명탐정:사라진 높의 딸</h1>
          <p></p>
          <p><a class="btn btn-large btn-primary" href="time/goTimetableList.action">예매하기</a></p>
        </div>
      </div>
    </div>
  </div>
  <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
</div>

<hr class="featurette-divider">    
    
<div class="container marketing">
<h3>인기 영화 top3</h3>
<!-- Three columns of text below the carousel -->
<div align="center" style="width:100%;padding-left: 50px;">
<div class="row">
<s:iterator value="movieList" status="stat" begin="0" end="0">
<s:if test="movieList[#stat.index]">
  <div class="col-lg-4">
    <img class="poster" src="<%=request.getContextPath()%>/picture/poster/<s:property value="movieList[#stat.index].poster"/>" data-src="holder.js/140x140" alt="140x140" style="width: 160px; height: 225px;">
    <h3><s:property value="movieList[#stat.index].title"/></h3>
    <p><s:if test="reserveList[#stat.index]">
    		예매율 : <s:property value="reserveList[#stat.index].ratio"/>% 
		</s:if>
		<s:else>
		예매율 : 0.0% 
		</s:else><br>
		별점 : <s:property value="movieList[#stat.index].starratio"/><br>
		<s:if test="movieList[#stat.index].dday > 0">
			개봉예정 : <s:date name="movieList[#stat.index].openingday" format="yyy-MM-dd"/>
			<a href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index].movie_seq"/>" id="dday">D-<s:property value="movieList[#stat.index].dday"/></a>
		</s:if>
		<s:else>
			개봉일 : <s:date name="movieList[#stat.index].openingday" format="yyy-MM-dd"/>
		</s:else>
	<br></p>
    <p><a class="btn btn-default" href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index].movie_seq"/>">영화 상세보기</a></p>
  </div><!-- /.col-lg-4 -->&nbsp;
</s:if>
<s:if test="movieList[#stat.index+1]">
  <div class="col-lg-4">
    <img class="poster" src="<%=request.getContextPath()%>/picture/poster/<s:property value="movieList[#stat.index+1].poster"/>" data-src="holder.js/140x140" alt="140x140" style="width: 160px; height: 225px;">
    <h3><s:property value="movieList[#stat.index+1].title"/></h3>
    <p><s:if test="reserveList[#stat.index+1]">
    		예매율 : <s:property value="reserveList[#stat.index+1].ratio"/>% 
		</s:if>
		<s:else>
		예매율 : 0.0% 
		</s:else><br>
		별점 : <s:property value="movieList[#stat.index+1].starratio"/><br>
		<s:if test="movieList[#stat.index+1].dday > 0">
			개봉예정 : <s:date name="movieList[#stat.index+1].openingday" format="yyy-MM-dd"/>
			<a href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index+1].movie_seq"/>" id="dday">D-<s:property value="movieList[#stat.index+1].dday"/></a>
		</s:if>
		<s:else>
			개봉일 : <s:date name="movieList[#stat.index+1].openingday" format="yyy-MM-dd"/>
		</s:else>
	<br></p>
    <p><a class="btn btn-default" href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index+1].movie_seq"/>">영화 상세보기</a></p>
  </div><!-- /.col-lg-4 -->&nbsp;
</s:if>
<s:if test="movieList[#stat.index+2]">
  <div class="col-lg-4">
    <img class="poster" src="<%=request.getContextPath()%>/picture/poster/<s:property value="movieList[#stat.index+2].poster"/>" data-src="holder.js/140x140" alt="140x140" style="width: 160px; height: 225px;">
    <h3><s:property value="movieList[#stat.index+2].title"/></h3>
    <p><s:if test="reserveList[#stat.index+2]">
    		예매율 : <s:property value="reserveList[#stat.index+2].ratio"/>% 
		</s:if>
		<s:else>
		예매율 : 0.0% 
		</s:else><br>
		별점 : <s:property value="movieList[#stat.index+2].starratio"/><br>
		<s:if test="movieList[#stat.index+2].dday > 0">
			개봉예정 : <s:date name="movieList[#stat.index+2].openingday" format="yyy-MM-dd"/>
			<a href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index+2].movie_seq"/>" id="dday">D-<s:property value="movieList[#stat.index+2].dday"/></a>
		</s:if>
		<s:else>
			개봉일 : <s:date name="movieList[#stat.index+2].openingday" format="yyy-MM-dd"/>
		</s:else>
	<br></p>
    <p><a class="btn btn-default" href="<%=request.getContextPath()%>/detailPage.action?movie_seq=<s:property value="movieList[#stat.index+2].movie_seq"/>">영화 상세보기</a></p>
  </div><!-- /.col-lg-4 -->
</s:if>
</s:iterator>
</div><!-- /.row -->
</div>

<!-- START THE FEATURETTES -->

<hr class="featurette-divider">

<h3>할리우드 영화 소식</h3>
<div align="center">
	<div class="row featurette">
	  <div class="col-md-7" style="background-color: white;height:500px;border-radius:10px;">
	    <h2 class="featurette-heading">어벤져스 : 에이지 오브 울트론<span class="text-muted"> 1차 예고편 확장판 공개</span></h2>
	    <br>
	    <p class="lead">해당 영상이나 소식이 공개될 때마다 온라인을 뜨겁게 달구고 있는 마블스튜디오의 ‘어벤져스: 에이지 오브 울트론’이 다시 한 번 화제를 모으고 있다. 
	
	‘어벤져스: 에이지 오브 울트론’이 지난 10월23일 공식 1차 예고편을 공개한 데 이어 1차 예고편 확장판을 3일 공개하며 2015년 4월 개봉을 확정 지었기 때문이다. 
	
	올해 봄, 할리우드 블록버스터 최초 국내에서 전격 촬영한 ‘어벤져스: 에이지 오브 울트론’이 이날 공개한 1차 공식 예고편의 확장판은 미국 ABC 방송에서 방영 중인 드라마 ‘에이전트 오브 쉴드’를 통해 처음으로 영상이 공개됐다. 당초 방송 전 공개하려고 했던 1차 예고편 영상이 온라인에 먼저 유출돼, 이번 방송에서는 특별히 확장판 예고편을 공개한 것. 
	
	특히 1차 예고편에 비해 스타크 타워에 모인 어벤져스 팀, 로키의 셉터를 조사하는 블랙 위도우의 모습 등 처음 보는 장면이 등장해 영화를 기다리는 관객들의 마음을 설레게 한다. 더욱 강력해진 악을 대변하는 울트론이 어벤져스 팀에게 전쟁을 선전포고 하는 장면은 전편 ‘어벤져스’와는 사뭇 다른 긴장감을 불러일으킨다. 또 예고편에 ‘2015년 4월’ 개봉 고지가 최초로 등장해 국내 관객들의 기대감은 일찍이 최고조에 이르고 있다. </p>
	  </div>
	  <div class="col-md-5">
	    <iframe width="500" height="500"  data-src="holder.js/500x500/auto" alt="500x500" src="https://www.youtube.com/embed/NSXx85xnw0o" frameborder="0" allowfullscreen></iframe>
	  </div>
	</div>
</div>
<hr class="featurette-divider">

<h3>기대 예정작</h3>
<div align="center">
	<div class="row featurette">
	  <div class="col-md-5">
	    <img class="featurette-image img-responsive" src="<%=request.getContextPath()%>/picture/poster/avengers2015_preview.png" data-src="holder.js/500x500/auto" alt="500x500">
	  </div>
	  <div class="col-md-7" style="background-color: white;border-radius:10px;">
	    <h2 class="featurette-heading">어벤져스<span class="text-muted"> 에이지 오브 울트론</span></h2>
	    <br>
	    <p class="lead">토니 스타크는 한때 가동하려다 중단된 휴면 상태의 평화 유지 프로그램을 작동 시키려 한다. 하지만 이 프로그램은 어긋나게 되고, 어벤져스는 지구의 운명이 걸린 거대한 시험대에 오르게 된다. 이 일로 극악 무도한 울트론이 등장해 자신을 복제해 위협을 가하자 이를 저지하기 위해 아이언맨, 캡틴 아메리카, 토르, 헐크, 블랙위도우, 호크아이 등으로 구성된 어벤져스와 새로 합류하게 되는 퀵 실버, 스칼렛 위치 남매와 불안한 동맹을 맺는다. 이들은 울트론의 음모를 막기위해 고군분투하며 범 지구적 모험을 하게된다.</p>
	  </div>
	</div>
</div>
<hr class="featurette-divider">

<h3>개봉 예정 영화</h3>
<div align="center">
	<div class="row featurette">
	  <div class="col-md-7" style="background-color: white;border-radius:10px;">
	    <h2 class="featurette-heading">007 <span class="text-muted">스펙터</span></h2>
	    <br>
	      <p class="lead">영화 역사상 최고의 프랜차이즈인 ‘007 시리즈’ 신작 ‘007 스펙터’는 제임스 본드(다니엘 크레이그)가 자신의 과거와 연관된 암호를 추적하던 중 최강의 조직 ‘스펙터’의 비밀을 알게 되면서 위험에 처하게 되고, 정부와 갈등하던 MI6 마저 와해될 위험에 처하는 시리즈 사상 최악의 위기를 담은 영화다. ‘007 스카이폴’ 이후 3년 만에 돌아오는 24번째 007 시리즈다. 
	이번에 공개된 특별 영상에서는 샘 멘데스 감독이 한층 더 성장한 제임스 본드와 과거 속 숨겨진 비밀, 그리고 그 과정에서 벌어지는 추격액션 등을 직접 소개한다. 특히 샘 멘데스 감독은 10억 달러 돌파로, 역대 시리즈 중 최고 흥행수익을 올렸던 ‘007 스카이폴’(2012)에 이어 다시 메가폰을 잡게 된 이유를 ‘탄탄한 스토리 때문’이라고 설명해 ‘007 스펙터’에 대한 기대를 한층 더 키우고 있다. </p>
	    </div>
	    <div class="col-md-5">
	      <img class="featurette-image img-responsive" style="float: right;" width="350px;" src="<%=request.getContextPath()%>/picture/poster/007spectre_poster.jpg" data-src="holder.js/500x500/auto" alt="500x500">
	    </div>
	  </div>
</div>
  <hr class="featurette-divider">
</div>



<!--***** 푸터 인클루딩 *****-->
<jsp:include page="../include/footer.jsp"/>
<!--***** 푸터 인클루딩 *****-->
