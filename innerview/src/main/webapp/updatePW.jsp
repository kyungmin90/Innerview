<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<%
String uID = (String)session.getAttribute("uID");
%> <!--세션아이디받아오기  -->
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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>





<script type="text/javascript">
$(function() {
	if($('#uID').val() == "null")
	{
		$('#uID').val(' ')
	}
	$('#updatePWForm').click(function() {
		pwValue = $('#uPW').val()
		pwValueC = $('#uPWCheck').val()
		if(pwValue.length == 0 || pwValueC.length == 0){
			alert('빈칸을 확인하세요')
		}else{
			if(pwValue != pwValueC){
				alert("비밀번호가 일치하지 않습니다.")
			}else{
				$.ajax({
					url : 'updatePW2.do',
					data :{
						uID : $('#uID').val(),
						uPW : pwValue
					},
					success : function(result) {
						if(result == "1"){ //수정완료시
							alert("수정이 완료되었습니다.")
							
							location.href = "login.jsp"
						}else{
							alert("다시 시도해주세요")
						}
					}//success
				})//ajax
			}//else
		}
	})//click
})//function
</script>

</head>
<body>

	<!-- 헤더연결 -->
	<jsp:include page="main/header.jsp"></jsp:include>
	<br><br><br><br>
	
	
	
	<div style="width: 600px; margin: 0px auto;">
	<h4>아이디</h4>
	<input type="text" class = "form-control" style="text-align: center" type="text" name="uID" id="uID" value = <%=uID%>>
	<br>
	<h4>변경 할 비밀번호</h4>
	<input type="password" class = "form-control" style="text-align: center" type="text" name="uPW" id="uPW">
	<br>
	<h4>변경 할 비밀번호 확인</h4>
	<input type="password" class = "form-control" style="text-align: center" type="text" name="uPWCheck" id="uPWCheck">
	<br>
	<button class="btn btn-sm btn-primary" id = updatePWForm style="width: 100px;">수정</button>
	</div>
	
	
	
	<br><br><br><br><br><br><br>
	
	
	
<jsp:include page="main/footer.jsp"></jsp:include>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

</body>
</html>