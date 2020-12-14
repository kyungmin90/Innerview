<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String uID = (String)session.getAttribute("uID"); %>
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
	if($('#uID').val() == "null"){
		$('#uID').val(' ') 
	}
	 
})

</script>
<title>이너뷰</title>
</head>
<body>
	<!--jstl DB 접속-->
	<sql:setDataSource
		url="jdbc:mysql://localhost:3366/iv"
		driver="com.mysql.jdbc.Driver"
		user="root"
		password="1234"
		scope="application"
		var="db"
	/>
	
	<!-- 헤더연결 -->
	<jsp:include page="main/header.jsp"></jsp:include>
	
	<!-- 마이페이지 빈칸에 DB 데이터 입력-->
	<sql:query var="userDB" dataSource="${db}">
		select uID,uName,uTel,uEmail,uAddress,uInterest from user where uID = '<%=uID %>'
	</sql:query>
	
	<br><br><br>
	<div class="mypage_wrapper">
	<c:forEach var="data" items="${userDB.rows}" varStatus="status">
	
	<h4>아이디</h4>
	<input type="text" class = "form-control" style="text-align: center" type="text" name="uID" id="uID" value = <%=uID %>>
	<br>
	<h4>이름</h4>
	<input type="text" class = "form-control" style="text-align: center" type="text" name="uName" id="uName" value="${data.uName}">
	<br>
	<h4>전화번호</h4>
	<input type="text" class = "form-control" style="text-align: center" type="text" name="uTel" id="uTel" value="${data.uTel }" >
	<br>
	<h4>이메일</h4>
	<input type="text" class = "form-control" style="text-align: center" type="text" name="uEmail" id="uEmail" value="${data.uEmail }" >
	<br>
	<h4>주소</h4>	
	<input type="text" class = "form-control" style="text-align: center" type="text" name="uAddress" id="uAddress" value="${data.uAddress }">
	<br>
	<h4>관심분야</h4>
	<select class="btn btn-secondary dropdown-toggle" name = "uInterest" id="uInterest">
	<!--DB에 있는 값 가져와 Selected 해주기-->
		<option value = "비타민" <c:if test="${data.uInterest eq '비타민'}">selected</c:if>>비타민</option>
		<option value = "장건강" <c:if test="${data.uInterest eq '장건강'}">selected</c:if>>장건강</option>
		<option value = "눈건강" <c:if test="${data.uInterest eq '눈건강'}">selected</c:if>>눈건강</option>
		<option value = "간건강" <c:if test="${data.uInterest eq '간건강'}">selected</c:if>>간건강</option>
		<option value = "관절/뼈" <c:if test="${data.uInterest eq '관절/뼈'}">selected</c:if>>관절/뼈</option>
		<option value = "이너뷰티" <c:if test="${data.uInterest eq '이너뷰티'}">selected</c:if>>이너뷰티</option>
	</select><br>
	</c:forEach>
	
	<aside>
		<table border="1" style="width:200px;height:200px; background-color: rgb(11,162,160); position: absolute; left: 20%;top: 20%; text-align: center;" >
			<tr style="border-bottom-color: white;" >
				<td><a style="color: white;" href="checkpayment.jsp">결제내역확인</a></td>
				
			</tr>
			<tr>
				<td><a style="color: white;" href="updatePW.jsp">비밀번호수정</a></td>
		</table>
	</aside>
	</div>
	
	
	<br><br><br><br><br><br><br>
	<jsp:include page="main/footer.jsp"></jsp:include>
	<jsp:include page="main/floating.jsp"></jsp:include>

    <!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</body>
</html>