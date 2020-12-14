<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- jstl -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 세션연결  -->
<%
String uID = (String)session.getAttribute("uID");
%>
<!DOCTYPE html>
<html>
  <head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>이너뷰</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
     <!-- JavaScript files-->
	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
    <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
    <script src="<c:url value="/resources/js/front.js"/>"></script>
    <!-- 부트스트랩 CSS-->
    <link rel="stylesheet" href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css"/>">
    <!-- 구글 fonts-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:700,800&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400&amp;display=swap">
    <!-- 테마 stylesheet-->
    <link rel="stylesheet" href="<c:url value="/resources/css/style.default.css"/>" id="theme-stylesheet">
    <!-- 커스텀 stylesheet - for your changes-->
    <link rel="stylesheet" href="<c:url value="/resources/css/main/main.css"/>">
    <!-- Favicon-->
    <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.ico"/>">



  </head>
  <body>
<!-- 헤더연결 -->
	<jsp:include page="main/header.jsp"></jsp:include>
	
	<div style="width: 800px; margin: 0px auto;">

<!-- 리뷰폼 타이틀 박스  -->
	<div class="reviewcontainer" style ="margin-top : 60px; margin-bottom:60px;">
		<h2 style="color:#0CB8B6; width: 330px; margin: 0px auto; ">이너뷰 리뷰 작성</h2>
	</div>
	
	
<!-- 리뷰작성폼 박스  -->
	<div class="space">
<!-- 리뷰작성폼  -->
	<form action ="review/insert.do" method = "post">
<!-- 로그인된 아이디  -->
	<p class="writeID" style="font-size:16px;color:#0CB8B6; text-align:left; font-weight: bold;">[ 작성자ID : <%=uID %> ]</p><br>
<!-- 로그인된 아이디 : db저장  -->
	<input type ="hidden" name = "uID" value="<%=uID %>">
<!-- 제목입력  -->
	<input type ="text" name = "rTitle" style = "width:525px; border:2px solid gray;" placeholder="제목을 입력하세요">
	
<!-- 점수입력  -->
	제품 평점 <select name="rScore">
		<option value="1">1점</option>
		<option value="2">2점</option>
	    <option value="3">3점</option>
	    <option value="4">4점</option>
	    <option value="5">5점</option>
	</select><br><br>
	
<!-- 제품선택  -->
	<div class="optBox">
	제품 선택</span> &nbsp;&nbsp;<select name="iCode" style="width:570px;">
	    <!--  <option value="항목선택">항목선택</option> -->
	     <optgroup label="항목1:비타민">
	        <option value="1">비타민C1000mg 120정</option>
	        <option value="2">네이처바이트 종합비타민 30정</option>
	        <option value="3">메가도스B 60정</option>
	        <option value="4">멀티비타민 포 우먼 50정</option>
	        <option value="5">멀티비타민 포 맨 50정</option>
	        <option value="6">멀티액션큐텐60</option>
	        <option value="7">액티브 데일리 멀티 포 올 180정</option>
	        <option value="8">슈퍼B 에너지 콤플렉스 180정</option>
	        <option value="9">여성용 멀티비타민미네랄 60정</option>
	        <option value="10">남성용 멀티비타민미네랄 60정</option>
	     </optgroup>
	     <optgroup label="항목2:장건강">
	        <option value="11">생유산균 골드 30포</option>
	        <option value="12">비비랩 프리바이오틱스5g 30포</option>
	        <option value="13">수퍼바이오틱스 60정</option>
	        <option value="14">비타민C 프로바이오틱스 60정</option>
	        <option value="15">프로바이오틱스 30포</option>
	        <option value="16">덴마크 유산균이야기 2박스</option>
	        <option value="17">프로바이오틱스 데일리 30포</option>
	        <option value="18">모유유래 장건강엔 더착한 유산균 30포</option>
	        <option value="19">바이탈리티 프로바이오틱스 30일분</option>
	        <option value="20">비타민하우스 프리바이오틱스 100포</option>
	     </optgroup>
	      <optgroup label="항목3:눈건강">
	        <option value="21">루테인 오메가3 60정</option>
	        <option value="22">눈건강엔 빌베리플러스 60정</option>
	        <option value="23">루테인&비타민 구미 60정</option>
	        <option value="24">루테인지아잔틴164 500mg 30정</option>
	        <option value="25">오늘부터+루테인&오메가 10정</option>
	        <option value="26">솔가 루테인 20mg 60정</option>
	        <option value="27">눈사랑 루테인 30캡슐</option>
	        <option value="28">알파프로젝트 눈건강 90캡슐</option>
	        <option value="29">루테인지아잔틴 오메가3 30정</option>
	        <option value="30">뉴오리진 식물성 오메가3 60정</option>
	     </optgroup>
	     <optgroup label="항목4:간건강">
	        <option value="31">밀크씨슬 60캡슐</option>
	        <option value="32">간건강:밀크씨슬 로사빈</option>
	        <option value="33">GNC 밀크씨슬 60캡슐</option>
	        <option value="34">오늘부터+밀크씨슬 10정</option>
	        <option value="35">헬씨칸 30캡슐</option>
	        <option value="36">알파프로젝트 간건강 180정</option>
	        <option value="37">밀크씨슬 60정</option>
	        <option value="38">치어플리 7포입</option>
	        <option value="39">건강한간 밀크씨슬 30정</option>
	        <option value="40">퓨어 밀크씨슬 60정</option>
	     </optgroup>
	     <optgroup label="항목5:관절/뼈">
	        <option value="41">세노비스 마그네슘</option>
	        <option value="42">세노비스 칼슘+비타민 60정</option>
	        <option value="43">칼슘 마그네슘 플러스 비타민D</option>
	        <option value="44">츄어블 칼슘 500mg 120정</option>
	        <option value="45">GNC 칼슘&마그네슘</option>
	        <option value="46">칼슘/마그네슘/아연/비타민D 180정</option>
	        <option value="47">꾸미베어스 칼슘비타민D 60 구미</option>
	        <option value="48">뼈건강엔 칼마디 츄어블 60정 (칼슘+마그네슘+비타민D)</option>
	        <option value="49">관절튼튼 MSM</option>
	        <option value="50">프리미엄 MSM</option>
	     </optgroup>
	     <optgroup label="항목6:이너뷰티">
	        <option value="41">프리미엄 콜라겐 5000mg</option>
	        <option value="42">이너뷰티 이너콜라겐 1개월분</option>
	        <option value="43">비비랩 저분자 콜라겐 30포</option>
	        <option value="44">비비랩 히알루론산 30캡슐</option>
	        <option value="45">비비랩 더 콜라겐 업 14포</option>
	        <option value="46">에버콜라겐 타임 7포</option>
	        <option value="47">맛있는 피쉬콜라겐 30포</option>
	        <option value="48">수분가득 콜라겐 젤리 14포</option>
	        <option value="49">석류콜라겐 젤리 30포</option>
	        <option value="50">에버콜라겐 인앤업 플러스 4주분</option>
	     </optgroup>
	</select>
	</div>
	
	<!-- 내용입력  -->
	<input type ="text" name = "rContent" style = "width:680px; height:300px; margin-top:10px; border:2px solid gray;" placeholder="내용을 입력하세요"><br>
	<!-- 좋아요수 : hidden -->
	<input type ="hidden" name = "rCount" value="1"><br>
	<!-- 폼입력버튼 -->
	<button type ="submit" style="margin-top:0px;padding:10px;margin-bottom:20px;" class="btn btn-primary">REVIEW SUCCESS</button>
	</form>
	<!-- 폼양식끝 -->
</div>

</div>
	<!-- 폼박스끝 -->
	<!-- footer 연결 -->
	<jsp:include page="main/footer.jsp"></jsp:include>
	<!-- 최근본 상품 floating 연결 -->
	<jsp:include page="main/floating.jsp"></jsp:include>

    <!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  </body>
</html>