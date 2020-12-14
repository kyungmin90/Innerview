<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String uID = (String) session.getAttribute("uID");
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





<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>








<!--DB연결-->
<sql:setDataSource url="jdbc:mysql://localhost:3366/iv"
	driver="com.mysql.jdbc.Driver" user="root" password="1234"
	scope="application" var="db" />
<!--iTitle-->
<sql:query var="data1" dataSource="${db }">
	select item.iTitle from item where item.iCode  = any (select pay.iCode from pay where uID = '<%=uID%>')
</sql:query>

<!--uName,uAddress-->
<sql:query var="data2" dataSource="${db }">
	select user.uName, user.uAddress from user where uID = '<%=uID%>'
</sql:query>

<!--pTotalPrice,pDateTime-->
<sql:query var="data3" dataSource="${db }">
	select pTotalPrice, pDateTime from pay where uID = '<%=uID%>'
</sql:query>

<script type="text/javascript">
	$(function() {
		$('#cancelFinish').click(function() {
			var result = confirm("결제취소하시겠습니까?")
			if(result == true){
			$.ajax({
				url : "delete2.do",
				data : {
					uID : '<%=uID%>'
				},
				success : function(result) {
					alert("결제가 정상적으로 취소되었습니다.")
					location.href = "myPage.jsp"
					
				}//success
				
			})//ajax
				
			}else{
				alert("다시 시도해주세요")
			}
			
		})//click
		
	})//function

</script>

<title>이너뷰</title>
</head>
<body>
<!-- 헤더연결 -->
	<jsp:include page="main/header.jsp"></jsp:include>
<br><br><br><br><br>



	<div class="cp_wrapper" >
	<table>
		<tr>
			<hr>
			<c:forEach var="pData2" items="${data2.rows }"   varStatus="status">
			이름 : ${pData2.uName }<br>
			주소 : ${pData2.uAddress }<br>
			<hr>
			</c:forEach>
		</tr>
			<tr id="tr1">
				<c:forEach var="pData"  items="${data1.rows }"  varStatus="status">
				아이템 이름 : ${pData.iTitle }<br>
				</c:forEach>
			</tr>
			
			<c:forEach var="pData3" items="${data3.rows }"  varStatus="status">
			결제금액 : ${pData3.pTotalPrice }<br>
			결제일시 : ${pData3.pDateTime }<br>
			<hr>
			</c:forEach>
	</table>
			<button type="button" class="btn btn-lg btn-primary" id = "cancelFinish" name = "cancelFinish" <c:if test="${empty data3.rows}">disabled="disabled" </c:if>>결제취소</button>
	<aside>
		<table border="1" style="width:150px;height:200px; background-color: rgb(11,162,160); position: absolute; left: 20%;top: 20%; text-align: center;" >
			<tr style="border-bottom-color: white;" >
				<td><a style="color: white;" href="myPage.jsp">마이페이지</a></td>
				
			</tr>
			<tr>
				<td><a style="color: white;" href="updatePW.jsp">비밀번호수정</a></td>
		</table>
	</aside>
	</div>
	
	
	
	<br><br><br><br><br><br><br><br>
	<!-- footer 연결 -->
	<jsp:include page="main/footer.jsp"></jsp:include>
	<!-- 최근본 상품 floating 연결 -->
	<jsp:include page="main/floating.jsp"></jsp:include>

    <!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
	
</body>
</html>