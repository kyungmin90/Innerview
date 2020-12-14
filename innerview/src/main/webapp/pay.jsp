<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<% 
	String iTitle = request.getParameter("iTitle");
	String cCount = request.getParameter("cCount");
	String iPrice = request.getParameter("iPrice");
	
	int cCount1 = Integer.parseInt(cCount);
	int iPrice1 = Integer.parseInt(iPrice);
	
	int pTotalPrice = cCount1 * iPrice1;
	
	String uID = (String)session.getAttribute("uID");
	
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<title>결제 페이지</title>
<script type="text/javascript">
	$(function(){
		// 결제하기 클릭시 각 radio버튼에서 넘어온 value값을 비교하여 해당페이지로 이동
		// 다음 페이지(payAPI)로 보낼 정보들 : 해당 API로 가기위한 value값, 상품명, 총금액
		$('#payButton').click(function(){
			payVal = $("input[name='pay']:checked").val();
			location.href="select1.do?payVal="+payVal+"&iTitle=<%=iTitle%>"+"&pTotalPrice=<%=pTotalPrice%>";
		})
	})
</script>
</head>
<body>
	<!-- 헤더연결 -->
	<jsp:include page="/main/header.jsp"></jsp:include>
	<br><br><br><br><br>


	<!-- 페이지가 시작되자마자 db에 연결하여 원하는 정보 read -->
	<sql:setDataSource
		url="jdbc:mysql://localhost:3366/iv"
		driver="com.mysql.jdbc.Driver"
		user="root"
		password="1234"
		scope="application"
		var="db"/>
	
	<div style="width: 900px; margin: 0px auto;">
	<!-- 결제페이지에서 유저정보 중 이름, 전화번호, 주소 read -->
	<!-- 세션의 uID를 통해 user테이블의 uName, uTel, uAddress select -->
	<sql:query var="list" dataSource="${db}">
		select uName, uTel, uAddress from user where uID = '<%=uID %>';
	</sql:query>
	<h2 style="width: 250px; margin: 0px auto;">최종 결제 정보</h2>
	<br><br>
	<h3>받는 사람 정보</h3>
	<hr>
	<c:forEach var="vo" items="${list.rows}">
		<h6>이름 : ${vo.uName}</h6>
		<h6>연락처 : ${vo.uTel}</h6>
		<h6>배송주소 : ${vo.uAddress}</h6>
	</c:forEach>
	<br>
	<!-- form으로 받은 정보 출력 -->
	<h3>결제 정보</h3>
	<hr>
	<h6>상품명 : <%= iTitle %></h6>
	<h6>수량 : <%= cCount %></h6>
	<h6>결제금액 : <%= pTotalPrice %> 원</h6>
	<h6>결제수단</h6>
	<!-- 선택된 radio의 value 값에 따라 각 페이지로 이동됨 -->
	<label><input type="radio" name="pay" value="samsung">삼성페이</label>&emsp;
	<label><input type="radio" name="pay" value="trans">계좌이체</label>&emsp;
	<label><input type="radio" name="pay" value="card">신용/체크카드</label>&emsp;
	<label><input type="radio" name="pay" value="phone">휴대폰</label>&emsp;
	<label><input type="radio" name="pay" value="vbank">무통장입금</label>
	
	<br><br>
	<div style="width: 250px; margin: 0px auto;">
	<button id="payButton" class="btn btn-primary" style="margin: 0px auto; width: 200px;">결제하기</button>
	</div>
	</div>
	
	<br><br><br><br><br><br><br><br>
	<jsp:include page="/main/footer.jsp"></jsp:include>
	<jsp:include page="/main/floating.jsp"></jsp:include>
	
	<!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</body>
</html>