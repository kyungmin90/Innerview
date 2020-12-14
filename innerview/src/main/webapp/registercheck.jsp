<%@page import="com.innerview.mvc00.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html>
<head>
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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?sfamily=Poppins:300,400&amp;display=swap">
    <!-- 테마 stylesheet-->
    <link rel="stylesheet" href="<c:url value="/resources/css/style.default.css"/>" id="theme-stylesheet">
    <!-- 커스텀 stylesheet - for your changes-->
    <link rel="stylesheet" href="<c:url value="/resources/css/main/main.css"/>">
    <!-- Favicon-->
    <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.ico"/>">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 소셜로그인 javascript-->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
   <a id="kakao-login-btn" style="position: absolute; left:50%; margin-top: 350px;"></a>
<a href="http://developers.kakao.com/login"></a>
<script type='text/javascript'>
   Kakao.init('8c232960af6d8962b6508e76ba4e9550'); 
   //카카오 로그인 버튼을 생성합니다.
   Kakao.Auth.createLoginButton({
      container : '#kakao-login-btn',
      success : function(authObj) {
         
         Kakao.API.request({
            url : '/v2/user/me',
            success : function(res) {
               //이름,성별,이메일 카카오로 가져오기
               data1 = res.properties['nickname']
               data2 = res.kakao_account.email
               data3 = res.kakao_account.gender
               console.log(data1)
               //ajax로 데이터 전달
               $.ajax({
                  url : "registerKakao2.do", 
                  data :{
                     uName : data1,
                     uEmail : data2,
                     uGender : data3
                  },
                  success : function() {
                     location.href="register.jsp"
                  }
               })
            }//success(res)
         })//request
      },//success(obj)
   });//kakao
</script>

</head>
<body>


<!-- 헤더연결 -->
	<jsp:include page="main/header.jsp"></jsp:include>



<button class="btn btn-lg btn-primary" type="button" id="loginForm" style="position: absolute; left:35%; margin-top: 200px;" onclick="location.href='register.jsp'">이너뷰로 회원가입</button>
<h2 style="position: absolute; left: 38%; top: 20%;">회원가입 방법을 선택해 주세요.</h2>


<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<!-- footer 연결 -->
	<jsp:include page="main/footer.jsp"></jsp:include>
	<!-- 최근본 상품 floating 연결 -->
	<jsp:include page="main/floating.jsp"></jsp:include>

    <!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">



</body>
</html>