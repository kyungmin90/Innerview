<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
String uID = (String)session.getAttribute("uID");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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



<title>장바구니</title>
</head>
<body>

	<!-- 헤더연결 -->
	<jsp:include page="/main/header.jsp"></jsp:include>
	<br><br><br><br><br><br><br><br>
	
	
	
	
	
	<!-- 페이지가 시작되자마자 db에 연결하여 원하는 정보 read -->
	<sql:setDataSource
		url="jdbc:mysql://localhost:3366/iv"
		driver="com.mysql.jdbc.Driver"
		user="root"
		password="1234"
		scope="application"
		var="db"/>

	<!-- 장바구니에 담긴 상품의 수량과 상품 이미지, 상품 이름, 상품 가격 read -->
	<!-- 세션의 uID를 통해 cart테이블의 iCode select -->
	<!-- select된 iCode를 통해 item테이블의 정보를 read -->
	<!-- cCount 조인 -->
	<sql:query var="list" dataSource="${db}">
		select cart.cCount, item.iImage, item.iTitle, item.iPrice
		from cart, item where cart.iCode = item.iCode and cart.iCode in (select iCode from cart where uID = '<%=uID %>');
	</sql:query>
	
	
	
	<!-- form으로 pay페이지로 넘김 -->
	<div style="width: 950px; margin: 0px auto;">
			<h2 style="width: 180px; margin: 0px auto;">장바구니</h2>
	<form action="pay.jsp">
		<!-- sql문을 통해 select된 정보를 출력 -->
		<c:forEach var="vo" items="${list.rows}">
			<div class="item" style="width: 450px;" id="${vo.iCode}">
			    <table style="width: 900px;">
				    <tr>
					    <td>
					    	<!-- 이미지 클릭시 해당 상세페이지로 이동 -->
					    	<img style="width:250px; height:260px;" src="resources/img/${vo.iImage}">
					    </td>
					    <td>
					    	<input style="width: 300px;" type="text" name="iTitle" value="${vo.iTitle}">
					    </td>
					    <td>
					     	<input style="width: 80px; text-align: center;" type="text" name="iPrice" value="${vo.iPrice}">원
					    </td>
					    <td>
					    	<input style="width: 50px; text-align: center;" type="number" name="cCount" value="${vo.cCount}">
					    </td> 
					    <td>
					    <button class="btn btn-primary">구매하기</button>
					    
					    </td>
				    </tr>
			    </table>
		    </div>
			<hr>	
		</c:forEach>
	</form>
	</div>
	
	
  	<br><br><br><br><br><br><br><br>
	<jsp:include page="/main/footer.jsp"></jsp:include>
	<jsp:include page="/main/floating.jsp"></jsp:include>
	
	<!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</body>
</html>