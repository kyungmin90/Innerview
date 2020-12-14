<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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



<script type="text/javascript">
	$(function() {
		$('#loginForm').click(function() {
			if ($('#uID').val().length == 0 || $('#uPW').val().length == 0) {
				alert("빈칸이 존재합니다.")
			} else {
				$.ajax({
					url : "login2.do",
					data : {
						uID : $('#uID').val(),
						uPW : $('#uPW').val()
					},//data
					success : function(uID) {
						if (uID == "null") {
							alert("로그인실패")
						} else {
							alert("로그인성공 아이디 : " + uID)
							location.href = "main_views/homeLogin.do"
							//"homeLogin.jsp"
						}

					}//success
				})//ajax

			}//else
		})//click
	})//function
</script>

<title>Insert title here</title>
</head>
<body>

<!-- 헤더연결 -->
	<jsp:include page="main/header.jsp"></jsp:include>

	<br><br><br><br><br><br>
	
	
	
	<div class="login_wrapper">
		<h4>아이디</h4>
		<input class="form-control" style="text-align: center" type="text"
			name="uID" id="uID"><br>
		<h4>비밀번호</h4>
		<input class="form-control" style="text-align: center" type="password"
			name="uPW" id="uPW"><br>
		<button class="btn btn-lg btn-primary" type="button" id="loginForm">로그인</button>
		<button class="btn btn-lg btn-primary" type="button" id="loginForm" onclick="location.href='registercheck.jsp'">회원가입</button>
		<a href="searchPW.jsp" style="font-size: 20px">비밀번호 찾기</a>

	</div>
	
	<br><br><br><br><br><br><br><br>
	<jsp:include page="main/footer.jsp"></jsp:include>


 <!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</body>
</html>