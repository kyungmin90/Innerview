<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 테그 라이브러리 생성, prefix(접두사)="고정이름" uri="주소형 아이디" -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">

 $(function() {
	//아이템 클릭시, 해당 상품 상세페이지로 이동
	$('.item').click(function() { 
		//아이템의 아이디, 비교를 위한 주성분을 전달.
		icode = $(this).attr('id')
		iingredient = $(this).attr('name')
		location.href = "/mvc00/item/itemDetail.do?iCode="+icode+"&iIngredient1="+iingredient;
		
	})
})
 
 </script>
</head>
<body>
<!-- 헤더연결 -->
<jsp:include page="../../../main/header.jsp"></jsp:include>

<br><br>

<div id="dd" style="width: 800px; margin: 0px auto; text-align: center;">
<h3>제품리스트</h3>
<!-- 반복문 해당 카테고리의 제품들 출력 -->
<c:forEach var="vo" items="${list}">
<c:set var="i" value="${i+1}"/>
<div class="item" id="${vo.iCode}" name="${vo.iIngredient1}">
<a href="#" style="color: black;" >
 <table>
 <tr>
 	<c:choose>
       <c:when test="${i eq '1'}">
     <td><img style="width: 70px; height: 70px; " src ="../resources/img/main/rank1.png"></td>
    </c:when>
  <c:when test="${i eq '2'}">
  <td><img style="width: 70px; height: 70px; " src ="../resources/img/main/rank2.png"></td>
  </c:when>	
  <c:when test="${i eq '3'}">
    <td><img style="width: 70px; height: 70px; " src ="../resources/img/main/rank3.png"></td>
   </c:when>
   <c:otherwise>
      <td style="width: 70px; text-align: center;"><h4 style="color: gray;">${i }</h4></td>
   </c:otherwise>
   </c:choose>
 	<td style="width: 300px; "><img style="width: 200px; height: 210px; " src="../resources/img/${vo.iImage}"> </td>
 	<td style="font-size: 20px; width: 300px; text-align: left;">
 	<p style="font-weight: bold;">${vo.iManufac}
 	<i class='fas fa-star' style="color:gold;"></i>${vo.iGrade}</p>
 	${vo.iTitle}<br>${vo.iPrice}원
 	</td>
 </tr>
 </table>
</a>
</div>
<br>
<hr>
</c:forEach>
</div>



<br><br>
 <!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
	<!-- footer/ 최근본 상품 연결 -->
	<jsp:include page="../../../main/footer.jsp"></jsp:include>
	<jsp:include page="../../../main/floating.jsp"></jsp:include>
</body>
</html>