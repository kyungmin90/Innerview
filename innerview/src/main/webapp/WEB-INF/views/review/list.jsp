<!-- review : insert.do에 경로연결된페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!-- 세션연결 -->
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
	<link rel="stylesheet" href="<c:url value="/resources/css/main/reviewlist.css"/>">
<!-- review : css -->

</head>
<body>
<!-- 헤더연결 -->
	<jsp:include page="../../../main/header.jsp"></jsp:include>


	<!--jstl DB 접속-->
	<sql:setDataSource url="jdbc:mysql://localhost:3366/iv"
		driver="com.mysql.jdbc.Driver" user="root" password="1234"
		scope="application" var="db" />

	<!-- 리뷰top5박스  -->
	<div class="reviewContainer">
		<!-- <p class="reviewText">
		<h1>제품별 리뷰 TOP5</h1>
		[추천수기준list]
		</p> -->
	<div>
	
<!-- 리뷰갯수카운트 쿼리문  -->
<sql:query var="rvCount" dataSource="${db}">
SELECT COUNT(*) FROM review
</sql:query>




			<!-- 리뷰리스트박스  -->
			<div class="reviewContainer">
				<p class="reviewText">
			<!-- 리뷰리스트제목  -->
				<h1>제품별 리뷰 리스트</h1>
			<!-- 리뷰리스트갯수표시  -->
				<c:forEach var="data" items="${rvCount.rows}" varStatus="status">
					<c:set var="TextValue" value="${data }" />
					<h5 style="color:#0CB8B6;">현재 총 리뷰갯수[ ${fn:substring(TextValue,10,13)} ] 개 </h5> 
				</c:forEach>
			     
			     <!-- 리뷰리스트 jstl core -->
				<c:forEach var="vo" items="${list}">
			     <!-- 리뷰리스트박스 -->
					<div class="space">
					
						<div class="leftspace">
							<p class=""
								style="background-color: #0CB8B6; border-radius: 50px;">review
								number</p>
							<p>${vo.rNO}</p>
							<p class=""
								style="background-color: #0CB8B6; border-radius: 50px;">작성자
								ID</p>
							<p>${vo.uID}</p>

							<span> <span class="leftlist">리뷰작성일</span> 
							<span class="leftlistcenter">${vo.rDate}</span><br>
							 <span class="leftlist">LIKE</span>
							  <span class="leftlistcenter">
				  		     <button class="like2" id ="like">♥</button>
							 </span><br>
								<span class="leftlist">사용자추천점수</span>
								<span class="leftlistcenter"> ${vo.rScore}</span><br> <span
								class="leftlist">리뷰상품코드</span> <span class="leftlistcenter">
									${vo.iCode}</span><br>
							</span>
						</div>

						<div class="rightspace">
							<p class=""
								style="background-color: #E8EAE9; border-radius: 50px; line-height: 50px; text-align: center;">제목
								: ${vo.rTitle}</p>
							<br>
							<p> ${vo.rContent}</p>
							
							<br>
						</div>
						

					</div>
				</c:forEach>
			</div>



			<!-- 메인 섹션 -->

			
			
			 <!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  
	<jsp:include page="../../../main/footer.jsp"></jsp:include>
	<jsp:include page="../../../main/floating.jsp"></jsp:include>
</body>
</html>