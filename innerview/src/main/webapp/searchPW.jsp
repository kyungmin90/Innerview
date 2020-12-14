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






<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function() {
	var authCode = null;
	$('#searchPWForm').click(function() {
		alert("이메일을 확인해주세요")
		uName = $('#uName').val()		
		uID = $('#uID').val()		
		uEmail = $('#uEmail').val()
		if(uName.length == 0 || uID.length == 0 || uEmail.length == 0){
			alert("빈칸을 확인하세요")
		}else{
			$.ajax({
				url :"mailSending.do",
				type : 'POST',
				data : {
					uID : uID,
					uEmail : uEmail
				},
				//완료 시 랜덤코드 리턴
				success : function(content) {
					authCode = content
				}//success
				
			})//ajax
		}//else
		
	})//click
	$('#finishForm').click(function() {
		RanCode = $('#RanCode').val()
		
		if(RanCode.length == 0){ // 코드 미 입력시
			alert("코드를 입력하세요")
		}else{
			if(RanCode != authCode){ //코드 불일치 시 
				alert("코드가 일치하지 않습니다.")
			}else{
				alert("확인되었습니다.")
				location.href = "updatePW.jsp"
			}
		}
	})
	
	
})//function



</script>

</head>
<body>
<!-- 헤더연결 -->
	<jsp:include page="main/header.jsp"></jsp:include>

<br><br>
<div class="searchID_wrapper">
	<h2>비밀번호찾기</h2>
	<hr>
	<h4>이름</h4>
	<input type="text" class = "form-control" style="text-align: center" type="text" name="uName" id="uName"><br>
	<h4>아이디</h4>
	<input type="text" class = "form-control" style="text-align: center" type="text" name="uID" id="uID">
	<br>
	<h4>이메일 주소</h4>
	<input type="text" class = "form-control" style="text-align: center" type="text" name="uEmail" id="uEmail"><br>
	<button class="btn btn-lg btn-primary" id = "searchPWForm">완료</button>
	<hr>
	<h4>인증 번호</h4>
	<input type="text" class = "form-control" style="text-align: center" type="text" name="RanCode" id="RanCode"><br>
	<button class="btn btn-lg btn-primary" id = "finishForm">완료</button>
</div>


<br><br><br><br><br><br><br>

<jsp:include page="main/footer.jsp"></jsp:include>
<!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</body>
</html>