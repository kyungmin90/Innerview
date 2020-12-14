<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
//user 로그인 세션
String uID = (String)session.getAttribute("uID");

//input 검색 값
String search = request.getParameter("searchInput");

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
    <link rel="shortcut icon" href="img/favicon.ico">
	<!-- JavaScript files-->
    <script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
    <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
    <script src="<c:url value="/resources/js/front.js"/>"></script>
    
    <script type="text/javascript">
 	$(function() {
 		
 		
	//상품 상세로 가기!
	$('.item').click(function() {
		
		icode = $(this).attr('id')
		iingredient = $(this).attr('name')
		
		//유저 아이디 세션으로 받아와서 값넘기고 detail.do 사용시 있는지 읽어오는 부분 컨트롤러에 추가할 것
		location.href = "/mvc00/item/itemDetail.do?iCode="+icode+"&iIngredient1="+iingredient;
		
			})//상품상세가기 end

 	})
 
 
 </script>
    
    
    
    
    
  </head>
  <body>
  <!-- jstl sql -->
    <sql:setDataSource
		url="jdbc:mysql://localhost:3366/iv"
		driver="com.mysql.jdbc.Driver"
		user="root"
		password="1234"
		scope="application"
		var="db"
						/>
		<!-- user 정보 불러오기 -->
		<sql:query var="userDB" dataSource="${db}">
			select * from user where uID = '<%=uID %>';
		</sql:query>
  
  <!-- 헤더연결 -->
 <jsp:include page="../../../main/header.jsp"></jsp:include>
  
  

    
    <!-- 메인 섹션 -->
    
   <div id="body content">
   <br><br>
   			<div id="dd" style="width: 800px; margin: 0px auto; text-align: center;">
   			
   			<!-- serch.do 의 결과가 없으면 -->
   			<c:choose>
   				<c:when test="${empty search}">
   				<br><br><br><br><br><br><br><br><br><br><br><br>
   				<h2>'<%=search %>'에 대한 검색결과가 없습니다.</h2>
   				<br><br><br><br><br><br><br><br><br><br><br><br>
   				</c:when>
   				<c:otherwise>
   			<!-- 결과값이 있을 경우 -->
   				<h4>'<%=search %>'에 대한 검색결과 입니다.</h4><br>
	 		<c:forEach var="search" items="${search}">
	 		<div class="item" id="${search.iCode }" name="${search.iIngredient1}">
              <a href="#" style="color: black;">
              <table>
              <tr>
              <td style="width: 300px; "><img style="width: 200px; height: 210px; " src="../resources/img/${search.iImage}"></td>
              <td style="font-size: 20px; width: 300px; text-align: left;">
              <p style="font-weight: bold;">${search.iManufac}
               <i class='fas fa-star' style="color:gold;"></i>${search.iGrade }</p>
              ${search.iTitle }<br>${search.iPrice }원
              </td>
              </tr>
              </table>
              </a>
              </div>
              <hr>
              </c:forEach>	
   				</c:otherwise>
   			</c:choose>
              </div>

   </div>

    <!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  
	<jsp:include page="../../../main/footer.jsp"></jsp:include>
	<jsp:include page="../../../main/floating.jsp"></jsp:include>
  
  
  </body>
</html>